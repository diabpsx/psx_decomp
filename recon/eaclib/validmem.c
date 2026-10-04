/* EACLIB VALIDMEM.C (cmn/validmem.c) -- 'BEND' sentinel word after a block's data (type flag 0x4000).
 * Source twin: NFS2 PC beta eaclib validmem.c (win\obja\validmem.obj); the PSX member writes and reads the
 * sentinel through putm/getm (TEXTCRNT/GETM) and keeps abort line 164. */
#define LIBTEXT __attribute__((section(".text.lib")))

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
extern EALIB_MEMCLASS memclass[];

extern void abortmessage(char *message, ...);
extern void blockmove(void *source, void *dest, int size);
extern void putm(void *address, unsigned int value, int bytes);
extern unsigned int getm(void *address, int bytes);
extern int locksemaphore(int *semaphore);
extern void unlocksemaphore(int *semaphore);

void addsentinel(EALIB_MEMBLOCK *block) LIBTEXT;
int checksentinelz(EALIB_MEMBLOCK *block) LIBTEXT;
int validatemema(int abort) LIBTEXT;
int validatemem(void) LIBTEXT;
int validatememz(void) LIBTEXT;

void addsentinel(EALIB_MEMBLOCK *block)
{
    locksemaphore(_lv);
    block->type |= 0x4000;
    putm((char *)block->address + block->datasize, 0x42454e44, 4);
    unlocksemaphore(_lv);
}

int checksentinelz(EALIB_MEMBLOCK *block)
{
    int valid;

    valid = 1;
    locksemaphore(_lv);
    if (block->type & 0x4000)
        valid = getm((char *)block->address + block->datasize, 4) == 0x42454e44;
    unlocksemaphore(_lv);
    return valid;
}

int validatemema(int abort)
{
    int valid;
    EALIB_MEMBLOCK *block;
    EALIB_MEMBLOCK *last;
    int index;
    char sentinel[5];

    valid = 1;
    block = 0;
    locksemaphore(_lv);
    for (index = 0; index < 16 && valid; index++) {
        if (memclass[index].last) {
            block = memclass[index].first;
            last = memclass[index].last;
            do {
                block = block->next;
                valid = checksentinelz(block);
            } while (valid && block != last);
        }
    }
    if (!valid && abort) {
        sentinel[4] = 0;
        blockmove((char *)block->address + block->datasize, sentinel, 4);
        abortmessage((abortfile = "cmn/validmem.c", abortline = 164,
                      "validatemem - SENTINEL CORRUPTED.  BLOCK '%s' ADR 0x%lx, LENGTH %ld\nSentinel ADR 0x%lx, VALUE '%4.4s'\n"),
                     block->name, block->address, block->datasize,
                     (char *)block->address + block->datasize, sentinel);
    }
    unlocksemaphore(_lv);
    return valid;
}

int validatemem(void)
{
    return validatemema(1);
}

int validatememz(void)
{
    return validatemema(0);
}
