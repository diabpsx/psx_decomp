/* EACPSXZ ABORTMSG.C -- PSX abort message (print, then eacexit).
 * Source twin: NFS2 PC beta eaclib abortmsg.c (abortmessage).  The PSX member
 * formats into a local buffer, lets an override string or an installed
 * callback take over, then prints the message plus FILE/CALLED FROM lines.
 * Toolchain identity (measured): -O2 -G8, li as addiu (ASPSX >= 2.50); PASS on
 * the PsyQ 4.0 and PsyQ 3.6 lanes.  Owns .sdata 8011C3B4..8011C3CF (override,
 * abortfile, abortline, callfile, callline, abortmessagecallback, "%s") and
 * .rdata 8010EB18..8010EB4B. */
typedef void *va_list;                          /* PsyQ STDARG.H */
#define __va_rounded_size(TYPE) (((sizeof (TYPE) + sizeof (int) - 1) / sizeof (int)) * sizeof (int))
#define va_start(AP, LASTARG) (AP = ((char *)&(LASTARG) + __va_rounded_size(LASTARG)))
#define va_end(AP) AP = (char *)0
#define LIBTEXT __attribute__((section(".text.lib")))

extern int debugprint;
extern int vsprintf(char *buf, const char *fmt, va_list args);
extern char *strcpy(char *dst, const char *src);
extern void print(const char *fmt, ...);
extern void eacexit(void);

char *override = 0;
char *abortfile = 0;
int abortline = 0;
char *callfile = 0;
int callline = 0;
int (*abortmessagecallback)(char *message) = 0;

void abortmessage(char *fmt, ...) LIBTEXT;
void abortoverride(char *message) LIBTEXT;

void abortmessage(char *fmt, ...)
{
    char message[256];
    va_list args;

    va_start(args, fmt);
    vsprintf(message, fmt, args);
    va_end(args);
    if (override)
        strcpy(message, override);
    if (debugprint == 1)
        debugprint = 2;
    if (abortmessagecallback == 0 || abortmessagecallback(message)) {
        print("%s", message);
        if (abortfile)
            print("FILE %s LINE %d\n", abortfile, abortline);
        if (callfile)
            print("CALLED FROM FILE %s LINE %d\n", callfile, callline);
        eacexit();
    }
}

void abortoverride(char *message)
{
    override = message;
}
