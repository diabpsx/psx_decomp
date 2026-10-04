/* EACLIB RESIZE.C (cmn/resize.c) -- grow/shrink a memory-manager block in place, by compaction, or by moving it.
 * Source twin: NFS2 PC beta eaclib resize.c (win\obja\resize.obj).  Diablo's member: abort lines 154/156/162/206/288,
 * the free-space computation (available before allocsize) and the recompute written at both compaction
 * sites (retail cross-jumps the two copies).  "RESIZE" is a -G8 small-data literal (retail .sdata 0x8011C4DC). */
#define LIBTEXT __attribute__((section(".text.lib")))

typedef char *MEMBLOCK;

typedef struct EALIB_MEMBLOCK {
    void *address;
    char name[12];
    int blocksize;
    int datasize;
    unsigned int type;
    unsigned int sequence;
    struct EALIB_MEMBLOCK *next;
    struct EALIB_MEMBLOCK *prev;
} EALIB_MEMBLOCK;

typedef struct EALIB_MEMCLASS {
    EALIB_MEMBLOCK *first;
    EALIB_MEMBLOCK *last;
    int alignmask;
    int sizemask;
    int reserved;
    int type;
} EALIB_MEMCLASS;

extern char *abortfile;
extern int abortline;
extern int *_lv;
extern int autocompact;
extern EALIB_MEMCLASS memclass[];
extern void (*membreak)(EALIB_MEMBLOCK *block);

extern void abortmessage(char *message, ...);
extern void addsentinel(EALIB_MEMBLOCK *block);
extern void blockmove(void *source, void *dest, int size);
extern int checksentinelz(EALIB_MEMBLOCK *block);
extern int compactdowni(EALIB_MEMBLOCK *first, EALIB_MEMBLOCK *last);
extern int compactupi(EALIB_MEMBLOCK *last, EALIB_MEMBLOCK *first);
extern MEMBLOCK *findmemblock(void *address);
extern int largestunused(void);
extern int locksemaphore(int *semaphore);
extern void putmemblock(EALIB_MEMBLOCK *block);
extern MEMBLOCK *reservememblockai(char *name, int size, unsigned int type, int abort);
extern void unlocksemaphore(int *semaphore);

int resizememadra(void *address, int size, int abort) LIBTEXT;
int resizememadr(void *address, int size) LIBTEXT;
int resizememadrz(void *address, int size) LIBTEXT;
int resizememblock(MEMBLOCK *block, int size) LIBTEXT;
int resizememblockz(MEMBLOCK *block, int size) LIBTEXT;
int resizememblocka(MEMBLOCK *blockhandle, int size, int abort) LIBTEXT;

int resizememadra(void *address, int size, int abort)
{
    return resizememblocka(findmemblock(address), size, abort);
}

int resizememadr(void *address, int size)
{
    return resizememblocka(findmemblock(address), size, 1);
}

int resizememadrz(void *address, int size)
{
    return resizememblocka(findmemblock(address), size, 0);
}

int resizememblock(MEMBLOCK *block, int size)
{
    return resizememblocka(block, size, 1);
}

int resizememblockz(MEMBLOCK *block, int size)
{
    return resizememblocka(block, size, 0);
}

int resizememblocka(MEMBLOCK *blockhandle, int size, int abort)
{
    EALIB_MEMBLOCK *block;
    EALIB_MEMCLASS *memoryclass;
    int available;
    int allocsize;
    EALIB_MEMBLOCK *newblock;
    unsigned int classnumber;
    int triedcompact;

    block = (EALIB_MEMBLOCK *)blockhandle;
    if (!blockhandle)
        abortmessage((abortfile = "cmn/resize.c", abortline = 154,
                      "resizememblock - NULL pointer\n"));
    if (block->type & 0x2000)
        membreak((EALIB_MEMBLOCK *)blockhandle);
    if (block->type & 0x8000)
        abortmessage((abortfile = "cmn/resize.c", abortline = 156,
                      "resizememblock - CAN NOT RESIZE SYSTEM BLOCKS\n"));
    if ((block->type & 0x4000) && !checksentinelz((EALIB_MEMBLOCK *)blockhandle))
        abortmessage((abortfile = "cmn/resize.c", abortline = 162,
                      "resizememblock - SENTINEL CORRUPTED.  BLOCK '%s' @ %lx, LENGTH %ld\n"),
                     block->name, block->address, block->datasize);

    classnumber = (block->type & 0x0f00) >> 8;
    memoryclass = &memclass[classnumber];
    locksemaphore(_lv);

    available = ((char *)block->next->address - (char *)block->address) & ~memoryclass->alignmask;
    allocsize = (size + memoryclass->type + memoryclass->alignmask) & ~memoryclass->alignmask;

    if (size < 0) {
        allocsize = size;
        if (size != -1) {
            unlocksemaphore(_lv);
            if (abort)
                abortmessage((abortfile = "cmn/resize.c", abortline = 206,
                              "resizemem - INVALID SIZE REQUESTED\nrequested: %d available: %d\n"),
                             allocsize, largestunused());
            return 0;
        }
    }

    triedcompact = 0;
    for (;;) {
        if (allocsize <= available && allocsize >= 0) {
            block->datasize = size;
            block->blocksize = allocsize;
            if (memoryclass->type)
                addsentinel(block);
            unlocksemaphore(_lv);
            return size;
        }
        if (autocompact && (block->next->type & 0x18) && !triedcompact) {
            if (compactupi(memoryclass->last, block)) {
                available = ((char *)block->next->address - (char *)block->address) & ~memoryclass->alignmask;
                continue;
            }
            triedcompact = 1;
            continue;
        }
        if (!autocompact || !(block->type & 0x10))
            break;
        if (compactdowni(memoryclass->first, block->next)) {
            available = ((char *)block->next->address - (char *)block->address) & ~memoryclass->alignmask;
            continue;
        }
        newblock = (EALIB_MEMBLOCK *)reservememblockai("RESIZE", size, classnumber, 0);
        if (newblock) {
            blockmove(block->address, newblock->address, block->datasize);
            block->prev->next = block->next;
            block->next->prev = block->prev;
            newblock->prev->next = block;
            newblock->next->prev = block;
            block->address = newblock->address;
            block->next = newblock->next;
            block->prev = newblock->prev;
            block->datasize = newblock->datasize;
            block->blocksize = newblock->blocksize;
            putmemblock(newblock);
            unlocksemaphore(_lv);
            return size;
        }
        break;
    }
    unlocksemaphore(_lv);
    if (size < 0)
        return available;
    if (!abort)
        return 0;
    abortmessage((abortfile = "cmn/resize.c", abortline = 288,
                  "resizememblock - NO ROOM TO RESIZE\nrequested: %d available: %d\n"),
                 allocsize, available);
    return 0;
}
