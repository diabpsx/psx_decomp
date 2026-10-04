/* EACLIB TIMER.C -- master tick services over the interrupt-maintained `ticks` (owned by the data member).
 * One object: NFS4's EACPSXZ timer.obj holds gettick/elapsedticks/resettick/timedwait in this order; Diablo's
 * revision interleaves tickcount, setticks, waitticks and testticks, and every one of tickval/tickset's users
 * reaches them gp-relative, which only the owning object does (retail .sdata 0x8011C5FC/0x8011C600).
 * Same gettick/resettick/timedwait bodies as the separately linked gettick.c, resettick.c and timedwait.c
 * members, which this one object would replace. */
#define LIBTEXT __attribute__((section(".text.lib")))

extern volatile int ticks;

int tickset = 0;
int tickval = 0;

int gettick(void) LIBTEXT;
int tickcount(int since) LIBTEXT;
int elapsedticks(void) LIBTEXT;
void resettick(void) LIBTEXT;
void setticks(int count) LIBTEXT;
void waitticks(void) LIBTEXT;
int testticks(void) LIBTEXT;
void timedwait(int count) LIBTEXT;

int gettick(void)
{
    return ticks;
}

int tickcount(int since)
{
    return gettick() - since;
}

int elapsedticks(void)
{
    int prev;
    int now;

    prev = tickval;
    now = gettick();
    tickval = now;
    return now - prev;
}

void resettick(void)
{
    int value;

    ticks = 0;
    value = ticks;
    tickval = value;
    tickset = value;
}

void setticks(int count)
{
    tickset = gettick() + count;
}

void waitticks(void)
{
    while (!testticks())
        ;
}

int testticks(void)
{
    return gettick() - tickset >= 0;
}

void timedwait(int count)
{
    int target = gettick() + count;
    while (gettick() - target < 0) {
    }
}
