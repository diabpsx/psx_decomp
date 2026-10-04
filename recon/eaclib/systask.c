/* EACLIB SYSTASK.C (cmn/systask.c) -- 16-slot periodic system-task scheduler driven by libticks.
 * Source twin: NFS2 PC beta eaclib systask.c (PSX build: no thread check, no task-cycle profiling). */
#define LIBTEXT __attribute__((section(".text.lib")))

typedef int (*SYSTEM_TASK_CALLBACK)(int argument, int elapsed);

typedef struct SYSTEM_TASK_SUB {
    SYSTEM_TASK_CALLBACK callback;
    int period;
    int nexttick;
    int active;
} SYSTEM_TASK_SUB;

extern char *abortfile;
extern int abortline;
extern volatile int libticks;

extern void abortmessage(char *message, ...);
extern int gettick(void);

static int systemtasklock = 0;
static int lastsystemtasktick = 0;
static SYSTEM_TASK_SUB systemtasksubs[16];

void addsystemtask(SYSTEM_TASK_CALLBACK callback, int period, int delay) LIBTEXT;
void delsystemtask(SYSTEM_TASK_CALLBACK callback) LIBTEXT;
int systemtask(int argument) LIBTEXT;
int abortablewait(int delay) LIBTEXT;

void addsystemtask(SYSTEM_TASK_CALLBACK callback, int period, int delay)
{
    int pending;
    int freeindex;
    int index;

    freeindex = -1;
    pending = systemtasklock;
    systemtasklock = pending + 1;
    for (index = 0; index < 16; ++index) {
        if (systemtasksubs[index].callback == callback)
            freeindex = index;
        else if (systemtasksubs[index].callback == 0 && freeindex == -1) {
            if (pending != 0)
                --pending;
            else
                freeindex = index;
        }
    }
    if (freeindex != -1) {
        systemtasksubs[freeindex].callback = callback;
        systemtasksubs[freeindex].period = period;
        systemtasksubs[freeindex].nexttick = libticks + delay;
        systemtasksubs[freeindex].active = 0;
    } else {
        abortfile = "cmn/systask.c";
        abortline = 90;
        abortmessage("addsystemtask - LIST FULL\n");
    }
    --systemtasklock;
}

void delsystemtask(SYSTEM_TASK_CALLBACK callback)
{
    int index;

    for (index = 0; index < 16 && systemtasksubs[index].callback != callback; ++index)
        ;
    if (index < 16 && systemtasksubs[index].callback == callback)
        systemtasksubs[index].callback = 0;
}

int systemtask(int argument)
{
    unsigned int result;
    SYSTEM_TASK_CALLBACK callback;
    int index;

    result = 0;
    if (lastsystemtasktick != libticks) {
        lastsystemtasktick = libticks;
        for (index = 0; index < 16; ++index) {
            callback = systemtasksubs[index].callback;
            if (callback != 0 &&
                libticks >= systemtasksubs[index].nexttick &&
                systemtasksubs[index].active == 0) {
                systemtasksubs[index].active = 1;
                result |= callback(argument, libticks - systemtasksubs[index].nexttick);
                systemtasksubs[index].nexttick = libticks + systemtasksubs[index].period;
                systemtasksubs[index].active = 0;
            }
        }
    }
    return result;
}

int abortablewait(int delay)
{
    int deadline;
    int result;

    result = 0;
    deadline = gettick() + delay;
    while (gettick() < deadline && result == 0)
        result = systemtask(0);
    return result;
}
