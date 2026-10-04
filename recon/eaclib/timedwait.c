/* EACPSXZ TIMEDWAIT.C -- Diablo's polling-only timed wait member. */
#define LIBTEXT __attribute__((section(".text.lib")))
extern int gettick(void);
void timedwait(int ticks) LIBTEXT;

void timedwait(int ticks)
{
    int target = gettick() + ticks;
    while (gettick() - target < 0) {
    }
}
