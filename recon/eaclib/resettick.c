/* EACPSXZ RESETTICK.C -- reset the master and sampled tick counters. */
#define LIBTEXT __attribute__((section(".text.lib")))
extern volatile int ticks;
int tickset = 0;
int tickval = 0;
void resettick(void) LIBTEXT;

void resettick(void)
{
    int value;
    ticks = 0;
    value = ticks;
    tickval = value;
    tickset = value;
}
