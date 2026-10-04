/* EACLIB GETCYCLE -- fine cycle counter: PSX root counter 1 plus an IRQ5-driven overflow tick count.
 * No source twin; reconstructed from the retail object.  The counter/IRQ-status reads are MMIO
 * accessors; getcycle merges the low halfword of getcycleticks above the 16-bit count with lwl. */
#define LIBTEXT __attribute__((section(".text.lib")))

extern void savegp_ci(unsigned int *out);
extern void restoregp(unsigned int value);
extern void *InterruptCallback(int irq, void (*func)());
extern void addexit(void (*func)());
extern int EnterCriticalSection(void);
extern void ExitCriticalSection(void);
extern long SetRCnt(unsigned long spec, unsigned short target, long mode);
extern long StartRCnt(unsigned long spec);

volatile int getcycleticks;     /* advanced by getcycleint (IRQ5 callback) */

void getcycleint(void) LIBTEXT;
void restoregetcycle(void) LIBTEXT;
void initgetcycle(void) LIBTEXT;
int getcycle(void) LIBTEXT;
int shortgetcycle(void) LIBTEXT;

void getcycleint(void)
{
    unsigned int gpbuf[2];

    savegp_ci(gpbuf);
    ++getcycleticks;
    restoregp(gpbuf[0]);
}

void restoregetcycle(void)
{
    InterruptCallback(5, 0);
}

void initgetcycle(void)
{
    EnterCriticalSection();
    InterruptCallback(5, getcycleint);
    addexit(restoregetcycle);
    SetRCnt(0xF2000001, 0xFFFF, 0x1000);    /* RCntCNT1, target 0xFFFF, RCntMdINTR */
    *(int *)0x1F801114 = 0x258;             /* root counter 1 mode */
    StartRCnt(0xF2000001);
    ExitCriticalSection();
}

/* count = (getcycleticks << 16 | RCnt1 count) + 0x10000 if the counter-1 IRQ is still pending */
int getcycle(void)
{
    int count;
    int pending;

    __asm__ volatile ("lh %0,0x1f801110\n\t"
                      "lw %1,0x1f801070\n\t"
                      "lwl %0,getcycleticks+1\n\t"
                      "andi %1,%1,0x20\n\t"
                      "sll %1,%1,11\n\t"
                      "addu %0,%0,%1"
                      : "=r"(count), "=r"(pending));
    return count;
}

int shortgetcycle(void)
{
    int count;
    int pending;

    __asm__ volatile ("lh %0,0x1f801110" : "=r"(count));
    __asm__ volatile ("lw %0,0x1f801070" : "=r"(pending));
    return (short)count;
}
