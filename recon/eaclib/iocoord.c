/* EACLIB IOCOORD.C -- PSX CD I/O arbitration between the streamer and the async/loadfile readers.
 * Partial twin: NFS2 PC beta eaclib iocoord.c (topup functions); the rest from the retail object. */
#define LIBTEXT __attribute__((section(".text.lib")))

extern int timerhz;
extern int gettick(void);
extern int tickcount(int since);
extern int systemtask(int argument);
extern int streamidle(void);
extern int asyncidle(void);
extern void coordinatestream(void);
extern void print(char *format, ...);

int relinquishio = 0;
int streamhasioflag = 1;
int soundservice = 0;
int streamstarting = 0;
int streamtoppedupflag = 0;
void (*streamer_iotaskptr)(void) = 0;
int (*streamer_iotaskstatus)(void) = 0;
void (*streamer_setnotfull)(void) = 0;
void (*async_iotaskptr)(void) = 0;
int (*async_iotaskstatus)(void) = 0;
static int streamiodelay = 1;   /* retail-unnamed static: reader passes before the stream regains I/O */
int loadfilewaiting = 0;

int asynctick;
int elapsedasyncmsecs;
void (*streamtopupfunc)(int amount);
int requestedasyncmsecs;

void reserveioforasync(void) LIBTEXT;
void reserveioforstream(void) LIBTEXT;
int streamhasio(void) LIBTEXT;
int asynchasio(void) LIBTEXT;
void setstreamtopup(void (*func)(int amount)) LIBTEXT;
void topupstream(int amount) LIBTEXT;
void signalstreamtopup(int ok) LIBTEXT;
int streamtoppedup(void) LIBTEXT;
void loadfiletopup(int amount) LIBTEXT;
int ioidle(void) LIBTEXT;
int ioreader(void) LIBTEXT;
void setstreameriofuncs(void (*task)(void), int (*status)(void), void (*setnotfull)(void)) LIBTEXT;
void setasynciofuncs(void (*task)(void), int (*status)(void)) LIBTEXT;

void reserveioforasync(void)
{
    relinquishio = 1;
}

void reserveioforstream(void)
{
    if (streamhasioflag == 0)
        elapsedasyncmsecs = tickcount(asynctick) * 1000 / timerhz;
    if (streamstarting) {
        streamtoppedupflag = 0;
        streamstarting = 0;
    }
    relinquishio = 0;
    streamiodelay = 2;
}

int streamhasio(void)
{
    return streamhasioflag;
}

int asynchasio(void)
{
    return !streamhasioflag;
}

void setstreamtopup(void (*func)(int amount))
{
    if (func == 0)
        streamtoppedupflag = 1;
    streamtopupfunc = func;
}

void topupstream(int amount)
{
    if (streamtopupfunc) {
        requestedasyncmsecs = amount;
        if (streamer_setnotfull)
            streamer_setnotfull();
        streamtoppedupflag = 0;
        streamtopupfunc(amount);
    } else
        streamtoppedupflag = 1;
}

void signalstreamtopup(int ok)
{
    if (ok == 0)
        print("NOT ENOUGH BUFFER SPACE TO COMPLETE SEEK/LOAD\n");
    streamtoppedupflag = 1;
}

int streamtoppedup(void)
{
    if (!streamtoppedupflag)
        return 0;
    reserveioforasync();
    return !streamhasioflag;
}

void loadfiletopup(int amount)
{
    loadfilewaiting = 1;
    if (async_iotaskstatus) {
        while (async_iotaskstatus())
            systemtask(0);
        loadfilewaiting = 1;
    }
    relinquishio = 0;
    topupstream(amount);
    while (!streamtoppedup()) {
        loadfilewaiting = 1;
        systemtask(0);
    }
    while (loadfilewaiting)
        systemtask(0);
}

int ioidle(void)
{
    int idle;

    idle = 0;
    if (streamidle() && asyncidle())
        idle = !loadfilewaiting;
    return idle;
}

int ioreader(void)
{
    soundservice = 0;
    if (streamer_iotaskptr) {
        if (streamer_iotaskstatus() == 0) {
            if (relinquishio) {
                if (streamhasioflag) {
                    asynctick = gettick();
                    streamhasioflag = 0;
                }
            } else if (streamiodelay)
                streamiodelay--;
            else {
                streamhasioflag = 1;
                if (streamstarting) {
                    streamtoppedupflag = 0;
                    streamstarting = 0;
                }
            }
            if (streamhasioflag) {
                soundservice = 1;
                streamer_iotaskptr();
            }
        } else if (relinquishio)
            coordinatestream();
    } else if (relinquishio)
        streamhasioflag = 0;
    if (loadfilewaiting == 0) {
        if (async_iotaskptr)
            async_iotaskptr();
    } else
        loadfilewaiting = 0;
    return 0;
}

void setstreameriofuncs(void (*task)(void), int (*status)(void), void (*setnotfull)(void))
{
    if (task) {
        if (async_iotaskptr) {
            streamhasioflag = 0;
            if (async_iotaskstatus())
                relinquishio = 1;
            streamstarting = 1;
        } else {
            streamhasioflag = 1;
            relinquishio = 0;
            streamtoppedupflag = 0;
        }
    } else if (streamhasio()) {
        coordinatestream();
        while (streamer_iotaskstatus())
            ;
    }
    streamer_iotaskptr = task;
    streamer_iotaskstatus = status;
    streamer_setnotfull = setnotfull;
}

void setasynciofuncs(void (*task)(void), int (*status)(void))
{
    async_iotaskptr = task;
    async_iotaskstatus = status;
}
