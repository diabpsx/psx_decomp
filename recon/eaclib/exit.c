/* EACLIB EXIT.C -- at-exit callback registry (32 slots) and the EA exit routine.
 * Source twins: NFS4 EACPSXZ exit.c (addexit, same registry shape); NFS2 PC beta callers
 * (directx.c/keyfunc.c call eacexit, comm.c calls addexit).  The table is file-static
 * (no MAP name) zero-initialised .data at 0x800B6FC4. */
#define LIBTEXT __attribute__((section(".text.lib")))

extern int printf(const char *fmt, ...);
extern void exit(int status);

static void (*exitfuncs[32])(void) = { 0 };

void eacexit(void) LIBTEXT;
void addexit(void (*func)(void)) LIBTEXT;
void removeexit(void (*func)(void)) LIBTEXT;

void eacexit(void)
{
    int i;
    for (i = 31; i >= 0; i--) {
        if (exitfuncs[i] != 0)
            exitfuncs[i]();
        exitfuncs[i] = 0;
    }
    printf("%c", 0x1A);
    exit(0);
}

void addexit(void (*func)(void))
{
    int i;
    for (i = 0; i < 32; i++)
        if (exitfuncs[i] == func)
            return;
    for (i = 0; i < 32; i++)
        if (exitfuncs[i] == 0) {
            exitfuncs[i] = func;
            return;
        }
}

void removeexit(void (*func)(void))
{
    int i;
    for (i = 0; i < 32; i++)
        if (exitfuncs[i] == func) {
            exitfuncs[i] = 0;
            return;
        }
}
