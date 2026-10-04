/* EACLIB LOCK.C -- memory-manager semaphore (PSX: a plain flag word, no OS mutex).
 * Source twins: NFS2 PC beta eaclib lock.c (names, static memmanlock); NFS2 PSX lock candidates. */
#define LIBTEXT __attribute__((section(".text.lib")))

static int memmanlock;

int *getlocksemaphore(void) LIBTEXT;
int locksemaphore(int *semaphore) LIBTEXT;
int locksemaphorereturn(int *semaphore) LIBTEXT;
void unlocksemaphore(int *semaphore) LIBTEXT;

int *getlocksemaphore(void)
{
    memmanlock = 0;
    return &memmanlock;
}

int locksemaphore(int *semaphore)
{
    *semaphore = 1;
    return 1;
}

int locksemaphorereturn(int *semaphore)
{
    if (*semaphore)
        return 0;
    *semaphore = 1;
    return 1;
}

void unlocksemaphore(int *semaphore)
{
    *semaphore = 0;
}
