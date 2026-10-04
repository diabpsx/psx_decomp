/* EACLIB CACHE.C (cmn/cache.c) -- purgeable-block cache layered on the memory manager.
 * Source twin: NFS2 PC beta eaclib cache.c (win\obja\cache.obj): same functions, same abort lines 90/92/98.
 * Diablo's checkcacheblock finds the default-class block through findnamedpurgeableblock() and
 * walks the reserved-class chain with a class pointer; cacheonei keeps the twin's copy of the
 * LAST scanned block's name (retail behaviour). */
#define LIBTEXT __attribute__((section(".text.lib")))

typedef char *MEMBLOCK;

typedef struct EALIB_MEMBLOCK {
    void *address;                      /* 0x00 */
    char name[12];                      /* 0x04 */
    int blocksize;                      /* 0x10 */
    int datasize;                       /* 0x14 */
    unsigned int type;                  /* 0x18 */
    unsigned int sequence;              /* 0x1C */
    struct EALIB_MEMBLOCK *next;        /* 0x20 */
    struct EALIB_MEMBLOCK *prev;        /* 0x24 */
} EALIB_MEMBLOCK;

typedef struct EALIB_MEMCLASS {
    EALIB_MEMBLOCK *first;              /* 0x00 */
    EALIB_MEMBLOCK *last;               /* 0x04 */
    int alignmask;                      /* 0x08 */
    int sizemask;                       /* 0x0C */
    int reserved;                       /* 0x10 */
    int type;                           /* 0x14 */
} EALIB_MEMCLASS;

extern char *abortfile;
extern int abortline;
extern EALIB_MEMCLASS memclass[];
extern EALIB_MEMCLASS *defaultmc;
extern int *_lv;
extern unsigned int sequence;
extern void (*membreak)(EALIB_MEMBLOCK *block);

extern void abortmessage(char *message, ...);
extern int locksemaphore(int *semaphore);
extern void unlocksemaphore(int *semaphore);
extern int checksentinelz(EALIB_MEMBLOCK *block);
extern MEMBLOCK *findmemblock(void *address);
extern MEMBLOCK *reservememblockai(char *name, int size, unsigned int type, int abort);
extern void purgememblock(MEMBLOCK *block);
extern void purgememblocki(MEMBLOCK *block);
extern int purgeonei(unsigned int type);
extern void blockmove(void *source, void *dest, int size);
extern char *filename(char *name);
extern int strncmp(const char *s1, const char *s2, int n);

void cachememadr(void *address) LIBTEXT;
void cachememblock(MEMBLOCK *block) LIBTEXT;
void prioritycachememadr(void *address, int priority) LIBTEXT;
MEMBLOCK *prioritycachememblock(MEMBLOCK *blockhandle, int priority) LIBTEXT;
MEMBLOCK *findnamedpurgeableblockinclass(char *name, unsigned int type) LIBTEXT;
MEMBLOCK *findnamedpurgeableblock(char *name) LIBTEXT;
int cacheone(unsigned int type) LIBTEXT;
int cacheonei(unsigned int type) LIBTEXT;
void *checkcacheadr(char *name) LIBTEXT;
MEMBLOCK *checkcacheblock(char *name) LIBTEXT;
void *checkcacheinclassadr(char *name, unsigned int type) LIBTEXT;
MEMBLOCK *checkcacheinclassblock(char *name, unsigned int type) LIBTEXT;

void cachememadr(void *address)
{
    prioritycachememblock(findmemblock(address), 1);
}

void cachememblock(MEMBLOCK *block)
{
    prioritycachememblock(block, 1);
}

void prioritycachememadr(void *address, int priority)
{
    prioritycachememblock(findmemblock(address), priority);
}

MEMBLOCK *prioritycachememblock(MEMBLOCK *blockhandle, int priority)
{
    EALIB_MEMBLOCK *block;

    block = (EALIB_MEMBLOCK *)blockhandle;
    if (!blockhandle)
        abortmessage((abortfile = "cmn/cache.c", abortline = 90,
                      "cachememblock - NULL pointer\n"));
    if (((EALIB_MEMBLOCK *)blockhandle)->type & 0x2000)
        membreak((EALIB_MEMBLOCK *)blockhandle);
    if (((EALIB_MEMBLOCK *)blockhandle)->type & 0x8000)
        abortmessage((abortfile = "cmn/cache.c", abortline = 92,
                      "cachememblock - CAN NOT CACHE SYSTEM BLOCKS\n"));
    if ((((EALIB_MEMBLOCK *)blockhandle)->type & 0x4000) && !checksentinelz((EALIB_MEMBLOCK *)blockhandle))
        abortmessage((abortfile = "cmn/cache.c", abortline = 98,
                      "cachememblock - SENTINEL CORRUPTED.  BLOCK '%s' @ %lx, LENGTH %ld\n"),
                     ((EALIB_MEMBLOCK *)blockhandle)->name, ((EALIB_MEMBLOCK *)blockhandle)->address,
                     ((EALIB_MEMBLOCK *)blockhandle)->datasize);
    locksemaphore(_lv);
    block->type = (block->type & ~7) | 8 | priority;
    unlocksemaphore(_lv);
    return blockhandle;
}

MEMBLOCK *findnamedpurgeableblockinclass(char *name, unsigned int type)
{
    EALIB_MEMCLASS *memoryclass;
    EALIB_MEMBLOCK *block;
    char *blockname;

    memoryclass = &memclass[(int)(type & 0xf00) >> 8];
    blockname = filename(name);
    block = memoryclass->first;
    while (block != memoryclass->last) {
        if (!strncmp(blockname, block->name, 12) && (block->type & 8))
            return (MEMBLOCK *)block;
        block = block->next;
    }
    return 0;
}

MEMBLOCK *findnamedpurgeableblock(char *name)
{
    return findnamedpurgeableblockinclass(name, 0);
}

int cacheone(unsigned int type)
{
    int result;

    locksemaphore(_lv);
    result = cacheonei(type);
    unlocksemaphore(_lv);
    return result;
}

int cacheonei(unsigned int type)
{
    EALIB_MEMCLASS *memclassptr;
    EALIB_MEMBLOCK *block;
    EALIB_MEMBLOCK *cacheblock;
    MEMBLOCK *newblock;
    unsigned int priority;
    unsigned int age;
    char name[13];
    int index;

    memclassptr = &memclass[(int)(type & 0xf00) >> 8];
    if (!memclassptr->reserved)
        return purgeonei(type);
    cacheblock = 0;
    priority = type & 7;
    age = 0;
    block = memclassptr->first->next;
    do {
        if (block->type & 8) {
            if ((block->type & 7) > priority ||
                ((block->type & 7) == priority && sequence - block->sequence >= age)) {
                cacheblock = block;
                priority = block->type;
                age = sequence - block->sequence;
                priority &= 7;
            }
        }
        block = block->next;
    } while (block != memclassptr->last);

    if (cacheblock) {
        for (index = 0; index < 12; index++)
            name[index] = block->name[index];
        name[12] = 0;
        do {
            newblock = reservememblockai(name, cacheblock->datasize, block->type | 8, 0);
            if (newblock)
                break;
        } while (cacheonei(priority));
        if (newblock) {
            blockmove(cacheblock->address, *newblock, cacheblock->datasize);
            purgememblocki((MEMBLOCK *)cacheblock);
            return 1;
        }
    }
    return 0;
}

void *checkcacheadr(char *name)
{
    MEMBLOCK *block;

    block = checkcacheblock(name);
    if (block)
        return *block;
    return 0;
}

MEMBLOCK *checkcacheblock(char *name)
{
    MEMBLOCK *newblock;
    MEMBLOCK *blockhandle;
    unsigned int type;
    EALIB_MEMCLASS *memoryclass;

    blockhandle = findnamedpurgeableblock(name);
    if (blockhandle) {
        ((EALIB_MEMBLOCK *)blockhandle)->type &= ~8;
        if (((EALIB_MEMBLOCK *)blockhandle)->type & 0x10)
            return blockhandle;
        newblock = reservememblockai(name, ((EALIB_MEMBLOCK *)blockhandle)->datasize,
                                     ((EALIB_MEMBLOCK *)blockhandle)->type, 0);
        if (!newblock)
            return blockhandle;
        blockmove(*blockhandle, *newblock, ((EALIB_MEMBLOCK *)blockhandle)->datasize);
        purgememblock(blockhandle);
        return newblock;
    } else {
        type = defaultmc->reserved;
        do {
            blockhandle = findnamedpurgeableblockinclass(name, type);
            if (blockhandle) {
                ((EALIB_MEMBLOCK *)blockhandle)->type &= ~8;
                newblock = reservememblockai(name, ((EALIB_MEMBLOCK *)blockhandle)->datasize,
                                             ((EALIB_MEMBLOCK *)blockhandle)->type, 0);
                blockmove(*blockhandle, *newblock, ((EALIB_MEMBLOCK *)blockhandle)->datasize);
                return newblock;
            }
            memoryclass = &memclass[(int)(type & 0xf00) >> 8];
            type = memoryclass->reserved;
        } while (type);
    }
    return blockhandle;
}

void *checkcacheinclassadr(char *name, unsigned int type)
{
    MEMBLOCK *block;

    block = checkcacheinclassblock(name, type);
    if (block)
        return *block;
    return 0;
}

MEMBLOCK *checkcacheinclassblock(char *name, unsigned int type)
{
    MEMBLOCK *newblock;
    MEMBLOCK *blockhandle;
    unsigned int reserved;

    blockhandle = findnamedpurgeableblockinclass(name, type);
    if (blockhandle) {
        ((EALIB_MEMBLOCK *)blockhandle)->type &= ~8;
        if (((EALIB_MEMBLOCK *)blockhandle)->type & 0x10)
            return blockhandle;
        newblock = reservememblockai(name, ((EALIB_MEMBLOCK *)blockhandle)->datasize,
                                     ((EALIB_MEMBLOCK *)blockhandle)->type, 0);
        if (!newblock)
            return blockhandle;
        blockmove(*blockhandle, *newblock, ((EALIB_MEMBLOCK *)blockhandle)->datasize);
        purgememblock(blockhandle);
        return newblock;
    }
    reserved = memclass[(int)(type & 0xf00) >> 8].reserved;
    if (reserved) {
        blockhandle = findnamedpurgeableblockinclass(name, reserved);
        if (blockhandle) {
            ((EALIB_MEMBLOCK *)blockhandle)->type &= ~8;
            newblock = reservememblockai(name, ((EALIB_MEMBLOCK *)blockhandle)->datasize,
                                         ((EALIB_MEMBLOCK *)blockhandle)->type, 0);
            blockmove(*blockhandle, *newblock, ((EALIB_MEMBLOCK *)blockhandle)->datasize);
            return newblock;
        }
    }
    return 0;
}
