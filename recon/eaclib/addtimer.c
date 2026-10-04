/* EACLIB ADDTIMER.C (cmn/addtimer.c) -- 8-slot per-tick timer callback list run by tmrint.
 * Twin: NFS4 EACPSXZ addtimer.c (Diablo's addtimer aborts when full; delalltimers/timercount added). */
#define LIBTEXT __attribute__((section(".text.lib")))

extern char *abortfile;
extern int abortline;
extern void abortmessage(char *message, ...);
extern void (*tmrsub[])(void);

void addtimer(void (*func)(void)) LIBTEXT;
void deltimer(void (*func)(void)) LIBTEXT;
void delalltimers(void) LIBTEXT;
int timercount(void) LIBTEXT;

void addtimer(void (*func)(void))
{
    int i;

    for (i = 0; i < 8; i++) {
        if (tmrsub[i] == 0) {
            tmrsub[i] = func;
            return;
        }
    }
    abortfile = "cmn/addtimer.c";
    abortline = 111;
    abortmessage("addtimer - LIST FULL\n");
}

void deltimer(void (*func)(void))
{
    int i;

    for (i = 0; i < 8; i++) {
        if (tmrsub[i] == func) {
            tmrsub[i] = 0;
            return;
        }
    }
}

void delalltimers(void)
{
    int i;

    for (i = 7; i >= 0; i--)
        tmrsub[i] = 0;
}

int timercount(void)
{
    int i;
    int count;

    count = 0;
    for (i = 0; i < 8; i++)
        if (tmrsub[i] != 0)
            count++;
    return count;
}
