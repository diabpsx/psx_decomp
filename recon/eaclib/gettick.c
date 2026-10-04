/* EACPSXZ GETTICK.C -- read the interrupt-maintained master tick. */
#define LIBTEXT __attribute__((section(".text.lib")))
extern volatile int ticks;
int gettick(void) LIBTEXT;

int gettick(void)
{
    return ticks;
}
