/* EACLIB INITTMR.C (psx/inittmr.c) -- root counter 2 tick interrupt: libticks/ticks/biosticks + tmrsub.
 * Twin: NFS4 EACPSXZ inittmr.c (Diablo: InterruptCallback(6) instead of an RCnt event, BIOS tick divider,
 * timer-stack hooks, frequency assert). */
#define LIBTEXT __attribute__((section(".text.lib")))

extern char *abortfile;
extern int abortline;
extern void abortmessage(char *message, ...);
extern void print(char *format, ...);
extern void savegp_ci(unsigned int *out);
extern void restoregp(unsigned int value);
extern void *InterruptCallback(int irq, void (*func)());
extern void addexit(void (*func)());
extern int EnterCriticalSection(void);
extern void ExitCriticalSection(void);
extern long SetRCnt(unsigned long spec, unsigned short target, long mode);
extern long StartRCnt(unsigned long spec);
extern void resettick(void);

extern volatile int ticks;
extern volatile int libticks;
extern volatile int finebios;
extern volatile int biosticks;
extern int timerhz;
extern int timerperiod;
extern void (*tmrsub[])(void);

int timerflag = 0;
volatile int reentryflag;
void (*settimerstack)(void);
void (*restoretimerstack)(void);

void inittimer(int hz) LIBTEXT;
void restoretimer(void) LIBTEXT;
void tmrint(void) LIBTEXT;

void inittimer(int hz)
{
    int i;
    int period;

    if (hz < 1 || hz > 10000) {
        abortfile = "psx/inittmr.c";
        abortline = 71;
        abortmessage("inittimer - BAD TIMER FREQUENCY SPECIFIED %d\n", hz);
    }
    EnterCriticalSection();
    if (timerflag == 0) {
        finebios = 0;
        for (i = 7; i >= 0; i--)
            tmrsub[i] = 0;
        InterruptCallback(6, tmrint);
        timerflag = 1;
        addexit(restoretimer);
        print("Inittimer(%d)\n", hz);
    }
    period = 0x409980 / hz;
    timerperiod = period;
    timerhz = 0x409980 / period;
    reentryflag = 0;
    SetRCnt(0xF2000002, period, 0x1000);
    StartRCnt(0xF2000002);
    ExitCriticalSection();
    resettick();
}

void restoretimer(void)
{
    InterruptCallback(6, 0);
}

void tmrint(void)
{
    unsigned int gpbuf[2];
    int i;

    savegp_ci(gpbuf);
    ++finebios;
    if (finebios >= 19) {
        finebios = 0;
        ++biosticks;
    }
    ++ticks;
    ++libticks;
    if (reentryflag == 0) {
        reentryflag = 1;
        if (settimerstack)
            settimerstack();
        for (i = 0; i < 8; i++)
            if (tmrsub[i])
                tmrsub[i]();
        if (restoretimerstack)
            restoretimerstack();
        reentryflag = 0;
    }
    restoregp(gpbuf[0]);
}
