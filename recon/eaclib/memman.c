/* EACLIB MEMMAN.C (cmn/memman.c) -- EA Canada memory manager: classes, block list, reserve/purge/find.
 * Source twin: NFS2 PC beta eaclib memman.c (win\obja\memman.obj); the PSX member is a later revision:
 * abort line numbers, the `a`/`i` wrapper chain, findmemblocka/findcontainingmemblocka, the
 * cache/sentinel/highwater hooks and a 0x28-byte block record (no callfile/callline).
 * Abort calls use EA's comma form (abortfile/abortline set inside the first argument), which is what
 * puts a nested call argument (largestunusedinclassi) ahead of the two stores. */
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
extern int sendtoprintmem;
extern void abortmessage(char *message, ...);
extern void print(char *format, ...);
extern int sprintf(char *buffer, const char *format, ...);
extern char *strncpy(char *dest, const char *src, int n);
extern int strncmp(const char *s1, const char *s2, int n);
extern char *filename(char *name);
extern void blockclear(void *address, int size);
extern int *getlocksemaphore(void);
extern int locksemaphore(int *semaphore);
extern void unlocksemaphore(int *semaphore);
extern int nullfunction();
extern int checksentinelz(EALIB_MEMBLOCK *block);
extern void addsentinel(EALIB_MEMBLOCK *block);
extern int compactupi(EALIB_MEMBLOCK *last, EALIB_MEMBLOCK *first);
extern int compactdowni(EALIB_MEMBLOCK *first, EALIB_MEMBLOCK *last);
extern int cacheonei(unsigned int type);

void initmemmanadr(int nummemblocks, void *address, int size) LIBTEXT;
EALIB_MEMCLASS *creatememclass(char *name, int type, void *lowaddress, void *highaddress,
                               int alignment, int sizemultiple, int reserved, int classtype) LIBTEXT;
void libmembreak(EALIB_MEMBLOCK *block) LIBTEXT;
MEMBLOCK *reservememblock(char *name, int size, unsigned int type) LIBTEXT;
MEMBLOCK *reservememblockz(char *name, int size, unsigned int type) LIBTEXT;
void *reservememadr(char *name, int size, unsigned int type) LIBTEXT;
void *reservememadrz(char *name, int size, unsigned int type) LIBTEXT;
void *reservememadra(char *name, int size, unsigned int type, int abort) LIBTEXT;
MEMBLOCK *reservememblocka(char *name, int size, unsigned int type, int abort) LIBTEXT;
MEMBLOCK *reservememblockai(char *name, int size, unsigned int type, int abort) LIBTEXT;
MEMBLOCK *findmemblocka(void *address, int abort) LIBTEXT;
MEMBLOCK *findmemblock(void *address) LIBTEXT;
void purgememadr(void *address) LIBTEXT;
void purgememblock(MEMBLOCK *block) LIBTEXT;
void purgememblocki(MEMBLOCK *blockhandle) LIBTEXT;
void purgememaboveadr(void *address) LIBTEXT;
void purgememaboveblock(MEMBLOCK *blockhandle) LIBTEXT;
int purgeone(unsigned int type) LIBTEXT;
int purgeonei(unsigned int type) LIBTEXT;
MEMBLOCK *findnamedmemblockinclass(char *name, unsigned int type) LIBTEXT;
MEMBLOCK *findnamedmemblock(char *name) LIBTEXT;
int updatehighwater(void) LIBTEXT;
int largestunused(void) LIBTEXT;
int largestunusedinclass(unsigned int type) LIBTEXT;
int largestunusedinclassi(unsigned int type) LIBTEXT;
int lockedmem(void) LIBTEXT;
int relocateablemem(void) LIBTEXT;
int purgeablemem(void) LIBTEXT;
int availablemem(void) LIBTEXT;
int largestreserveableinclass(unsigned int type) LIBTEXT;
void initmemblocks(EALIB_MEMBLOCK *address, int count) LIBTEXT;
void putmemblock(EALIB_MEMBLOCK *block) LIBTEXT;
EALIB_MEMBLOCK *getmemblock(void) LIBTEXT;
int memsizeadr(void *address) LIBTEXT;
unsigned char *getblockadr(MEMBLOCK *block) LIBTEXT;
unsigned char *getblockoffset(MEMBLOCK *block) LIBTEXT;
int getblocklen(MEMBLOCK *block) LIBTEXT;
char *getblockname(MEMBLOCK *block) LIBTEXT;
unsigned int getblocktype(MEMBLOCK *block) LIBTEXT;
void lockmemblock(MEMBLOCK *blockhandle) LIBTEXT;
void unlockmemblock(MEMBLOCK *blockhandle) LIBTEXT;
void breakmemadr(void *address, int offset) LIBTEXT;
void breakmemblock(MEMBLOCK *block, int offset) LIBTEXT;
void breakmemblocki(MEMBLOCK *blockhandle, int offset) LIBTEXT;
MEMBLOCK *findcontainingmemblocka(void *address, int abort) LIBTEXT;
MEMBLOCK *findcontainingmemblock(void *address) LIBTEXT;
MEMBLOCK *findcontainingmemblockz(void *address) LIBTEXT;

/* initialized small data, retail .sdata 0x8011C4A0..0x8011C4CF */
EALIB_MEMCLASS memclass[16];
EALIB_MEMCLASS *defaultmc = memclass;
short codeseg = 0;
short dataseg = 0;
char *highmemadr = 0;
char *lowmemadr = 0;
unsigned long dossize = 0;
unsigned int sequence = 0;
int autocompact = 1;
int highwateractive = 1;
void (*membreak)(EALIB_MEMBLOCK *block) = libmembreak;
void (*reservememcallback)(int op, char *name, int size, unsigned int type) =
    (void (*)(int, char *, int, unsigned int))nullfunction;
void (*purgememcallback)(int op, EALIB_MEMBLOCK *block) = (void (*)(int, EALIB_MEMBLOCK *))nullfunction;
void (*findmemcallback)(int op, void *address) = (void (*)(int, void *))nullfunction;
/* small commons, retail .sbss */
EALIB_MEMBLOCK *emptyblock;
int *_lv;
int highwater;

void initmemmanadr(int nummemblocks, void *address, int size)
{
    int memblocksize;

    _lv = getlocksemaphore();
    locksemaphore(_lv);
    lowmemadr = (char *)address;
    blockclear(memclass, sizeof(memclass));
    memblocksize = nummemblocks * sizeof(EALIB_MEMBLOCK);
    if (size < memblocksize)
        abortmessage((abortfile = "cmn/memman.c", abortline = 120,
                      "initmemmanadr - INSUFFICIENT MEMORY TO INITIALIZE MEMORY MANAGER\n"));
    initmemblocks((EALIB_MEMBLOCK *)lowmemadr, nummemblocks);
    highmemadr = (char *)address + size;
    creatememclass("MB_RAM", 0, lowmemadr + memblocksize, highmemadr, 8, 0x20, 0, 4);
    highwater = highmemadr - lowmemadr;
    unlocksemaphore(_lv);
    print("initmemmanadr lowmemadr %x, highmemadr %x, memlength %d, memblocks %d, memmanblksize %d\n",
          lowmemadr, highmemadr, size, nummemblocks, memblocksize);
}

EALIB_MEMCLASS *creatememclass(char *name, int type, void *lowaddress, void *highaddress,
                               int alignment, int sizemultiple, int reserved, int classtype)
{
    EALIB_MEMCLASS *theclass;
    EALIB_MEMBLOCK *block;

    if (findmemblocka(lowaddress, 0))
        abortmessage((abortfile = "cmn/memman.c", abortline = 201,
                      "creatememclass - MUST NOT CREATE MEMORY CLASS AT START OF EAC MEMMAN BLOCK, SHOULD OFFSET INTO BLOCK.\n"));
    theclass = &memclass[(type & 0xf00) >> 8];
    theclass->alignmask = alignment - 1;
    theclass->sizemask = sizemultiple - 1;
    theclass->reserved = reserved;
    if (classtype)
        theclass->type = 4;
    else
        theclass->type = 0;

    block = getmemblock();
    sprintf(block->name, "LOW %-8s", name);
    block->address = lowaddress;
    block->datasize = 0;
    block->blocksize = 0;
    block->prev = 0;
    block->type = type | 0x8000;
    theclass->first = block;

    block = getmemblock();
    sprintf(block->name, "HIGH %-7s", name);
    block->address = highaddress;
    block->datasize = 0;
    block->blocksize = 0;
    block->next = 0;
    block->type = type | 0x8020;
    theclass->last = block;
    theclass->first->next = block;
    block->prev = theclass->first;
    return theclass;
}

void libmembreak(EALIB_MEMBLOCK *block)
{
    membreak = (void (*)(EALIB_MEMBLOCK *))nullfunction;
    abortmessage((abortfile = "cmn/memman.c", abortline = 241,
                  "membreak - MEMORY BLOCK BREAK POINT.\nBLOCK '%s' @ %lx, LENGTH %ld\n"),
                 block->name, block->address, block->datasize);
}

MEMBLOCK *reservememblock(char *name, int size, unsigned int type)
{
    return reservememblocka(name, size, type, 1);
}

MEMBLOCK *reservememblockz(char *name, int size, unsigned int type)
{
    return reservememblocka(name, size, type, 0);
}

void *reservememadr(char *name, int size, unsigned int type)
{
    MEMBLOCK *block;

    block = reservememblocka(name, size, type, 1);
    if (!block)
        return 0;
    return *block;
}

void *reservememadrz(char *name, int size, unsigned int type)
{
    MEMBLOCK *block;

    block = reservememblocka(name, size, type, 0);
    if (!block)
        return 0;
    return *block;
}

void *reservememadra(char *name, int size, unsigned int type, int abort)
{
    MEMBLOCK *block;

    block = reservememblocka(name, size, type, abort);
    if (!block)
        return 0;
    return *block;
}

MEMBLOCK *reservememblocka(char *name, int size, unsigned int type, int abort)
{
    MEMBLOCK *block;

    if (_lv)
        locksemaphore(_lv);
    block = reservememblockai(name, size, type, abort);
    if (_lv)
        unlocksemaphore(_lv);
    return block;
}

MEMBLOCK *reservememblockai(char *name, int size, unsigned int type, int abort)
{
    EALIB_MEMCLASS *memoryclass;
    EALIB_MEMBLOCK *firstblock;
    EALIB_MEMBLOCK *block;
    EALIB_MEMBLOCK *newblock;
    char *address;
    int allocsize;
    int unused;

    if (!lowmemadr) {
        if (abort)
            abortmessage((abortfile = "cmn/memman.c", abortline = 391,
                          "reservemem - MEMORY MANAGER NOT INITIALIZED\nrequested: %d\n"), size);
        return 0;
    }
    if (size <= 0) {
        if (abort)
            abortmessage((abortfile = "cmn/memman.c", abortline = 399,
                          "reservemem - INVALID SIZE REQUESTED\nrequested '%s': %d\navailable: %d. type %04lx MB_LOW\n"),
                         name, size, largestunusedinclassi(type), type);
        return 0;
    }
    if (!name)
        name = "";
    /* EA built EACLIB with PsyQ's default unsigned plain char (retail lbu); the lane passes -fsigned-char */
    if (!*(unsigned char *)name) {
        if (abort)
            abortmessage((abortfile = "cmn/memman.c", abortline = 408,
                          "reservemem - NAME NOT SPECIFIED.\nrequested: %d\n"), size);
        return 0;
    }
    reservememcallback(0, name, size, type);
    memoryclass = &memclass[(int)(type & 0xf00) >> 8];
    name = filename(name);
    if (type & 0x40)
        allocsize = (size + memoryclass->type + memoryclass->sizemask) & ~memoryclass->sizemask;
    else
        allocsize = (size + memoryclass->type + memoryclass->alignmask) & ~memoryclass->alignmask;

    firstblock = memoryclass->first;
    if (!firstblock)
        goto failed;
    if ((firstblock->type & 0xfffff0ff) != 0x8000) {
        if (!abort)
            return 0;
        reservememcallback(4, name, size, type);
        abortmessage((abortfile = "cmn/memman.c", abortline = 434,
                      "reservemem - MEMORY MANAGER BLOCKS CORRUPTED\nrequested: %d. type %x. should be %x\n"),
                     size, firstblock->type & 0xfffff0ff, 0x8000);
        return 0;
    }

    if (!(type & 0x20)) {
        if (autocompact && !(type & 0x10))
            compactupi(memoryclass->last, firstblock);
        for (;;) {
            block = memoryclass->first->next;
            address = (char *)memoryclass->first->address;
            if (type & 0x40)
                address = (char *)(((unsigned int)address + memoryclass->sizemask) & ~memoryclass->sizemask);
            for (;;) {
                unused = 0;
                for (;;) {
                    if (address < (char *)block->address) {
                        unused = (char *)block->address - address;
                        break;
                    }
                    address = (char *)block->address + block->blocksize;
                    if (type & 0x40)
                        address = (char *)(((unsigned int)address + memoryclass->sizemask) & ~memoryclass->sizemask);
                    if (block == memoryclass->last)
                        break;
                    block = block->next;
                }
                if (allocsize <= unused) {
                    newblock = getmemblock();
                    newblock->type = type;
                    newblock->datasize = size;
                    newblock->blocksize = allocsize;
                    newblock->sequence = sequence++;
                    strncpy(newblock->name, name, 12);
                    newblock->address = address;
                    newblock->prev = block->prev;
                    newblock->next = block;
                    block->prev->next = newblock;
                    block->prev = newblock;
                    if (memoryclass->type)
                        addsentinel(newblock);
                    if (autocompact)
                        updatehighwater();
                    return (MEMBLOCK *)newblock;
                }
                if (block == memoryclass->last)
                    break;
                address = (char *)block->address + block->blocksize;
                if (type & 0x40)
                    address = (char *)(((unsigned int)address + memoryclass->sizemask) & ~memoryclass->sizemask);
                block = block->next;
            }
            if (!cacheonei(type))
                break;
            compactupi(memoryclass->last, memoryclass->first);
        }
        if (!abort)
            return 0;
        reservememcallback(1, name, size, type);
        sendtoprintmem++;
        abortmessage((abortfile = "cmn/memman.c", abortline = 563,
                      "reservemem - OUT OF MEMORY\nrequested '%s': %d\navailable: %d. type %04lx MB_LOW\n"),
                     name, size, largestunusedinclassi(type), type);
    } else {
        if (autocompact && !(type & 0x10))
            compactdowni(firstblock, memoryclass->last);
        for (;;) {
            block = memoryclass->last->prev;
            address = (char *)memoryclass->last->address;
            if (type & 0x40)
                address = (char *)((unsigned int)address & ~memoryclass->sizemask);
            for (;;) {
                unused = 0;
                for (;;) {
                    char *blockend = (char *)block->address + block->blocksize;
                    if (type & 0x40)
                        blockend = (char *)(((unsigned int)blockend + memoryclass->sizemask) & ~memoryclass->sizemask);
                    if (blockend < address) {
                        unused = address - blockend;
                        break;
                    }
                    address = (char *)block->address;
                    if (type & 0x40)
                        address = (char *)((unsigned int)address & ~memoryclass->sizemask);
                    if (block == memoryclass->first)
                        break;
                    block = block->prev;
                }
                if (allocsize <= unused) {
                    newblock = getmemblock();
                    newblock->type = type;
                    newblock->datasize = size;
                    newblock->blocksize = allocsize;
                    newblock->sequence = sequence++;
                    strncpy(newblock->name, name, 12);
                    newblock->address = address - allocsize;
                    newblock->prev = block;
                    newblock->next = block->next;
                    block->next->prev = newblock;
                    block->next = newblock;
                    if (memoryclass->type)
                        addsentinel(newblock);
                    if (autocompact)
                        updatehighwater();
                    return (MEMBLOCK *)newblock;
                }
                if (block == memoryclass->first)
                    break;
                address = (char *)block->address;
                if (type & 0x40)
                    address = (char *)((unsigned int)address & ~memoryclass->sizemask);
                block = block->prev;
            }
            if (!cacheonei(type))
                break;
            compactdowni(memoryclass->first, memoryclass->last);
        }
        if (!abort)
            return 0;
        reservememcallback(1, name, size, type);
        sendtoprintmem++;
        abortmessage((abortfile = "cmn/memman.c", abortline = 649,
                      "reservemem - OUT OF MEMORY\nrequested '%s': %d available: %d. type %04lx MB_HIGH\n"),
                     name, size, largestunusedinclassi(type), type);
    }
failed:
    if (abort) {
        reservememcallback(2, name, size, type);
        abortmessage((abortfile = "cmn/memman.c", abortline = 659,
                      "reservemem - INVALID TYPE FLAGS (%04x)\nrequested '%s': %d available: %d. type %04lx MB_HIGH\n"),
                     type, name, size, largestunusedinclassi(type), type);
    }
    return 0;
}

MEMBLOCK *findmemblocka(void *address, int abort)
{
    EALIB_MEMBLOCK *block;
    EALIB_MEMBLOCK *lastblock;
    int classnumber;

    if (address) {
        findmemcallback(1, address);
        classnumber = 0;
        do {
            if (memclass[classnumber].last) {
                block = memclass[classnumber].first;
                lastblock = memclass[classnumber].last;
                do {
                    block = block->next;
                } while (block->address != address && block != lastblock);
                if (!(block->type & 0x8000))
                    return (MEMBLOCK *)block;
            }
            classnumber++;
        } while (classnumber < 16);
        findmemcallback(1, address);
        if (abort)
            abortmessage((abortfile = "cmn/memman.c", abortline = 747,
                          "findmemblock - BLOCK NOT FOUND (%p)\n"), address);
    }
    return 0;
}

MEMBLOCK *findmemblock(void *address)
{
    return findmemblocka(address, 1);
}

void purgememadr(void *address)
{
    purgememblock(findmemblock(address));
}

void purgememblock(MEMBLOCK *block)
{
    locksemaphore(_lv);
    purgememblocki(block);
    unlocksemaphore(_lv);
}

void purgememblocki(MEMBLOCK *blockhandle)
{
    EALIB_MEMBLOCK *block;

    block = (EALIB_MEMBLOCK *)blockhandle;
    if (block) {
        purgememcallback(0, block);
        if (block->type & 0x2000)
            membreak(block);
        if (block->type & 0x8000)
            abortmessage((abortfile = "cmn/memman.c", abortline = 831,
                          "purgememblock - CAN NOT PURGE SYSTEM BLOCKS\n"));
        if (!block->address)
            abortmessage((abortfile = "cmn/memman.c", abortline = 832,
                          "purgememblock - MEM BLOCK POINTS TO NULL MEMORY ADDRESS\n"));
        if ((block->type & 0x4000) && !checksentinelz(block))
            abortmessage((abortfile = "cmn/memman.c", abortline = 838,
                          "purgememblock - SENTINEL CORRUPTED.  BLOCK '%s' @ %lx, LENGTH %ld\n"),
                         block->name, block->address, block->datasize);
        block->prev->next = block->next;
        block->next->prev = block->prev;
        block->address = 0;
        putmemblock(block);
    }
}

void purgememaboveadr(void *address)
{
    purgememaboveblock(findmemblock(address));
}

void purgememaboveblock(MEMBLOCK *blockhandle)
{
    EALIB_MEMBLOCK *block;

    locksemaphore(_lv);
    block = ((EALIB_MEMBLOCK *)blockhandle)->next;
    while (!(block->type & 0x20)) {
        block = block->next;
        purgememblocki((MEMBLOCK *)block->prev);
    }
    unlocksemaphore(_lv);
}

int purgeone(unsigned int type)
{
    int purged;

    locksemaphore(_lv);
    purged = purgeonei(type);
    unlocksemaphore(_lv);
    return purged;
}

int purgeonei(unsigned int type)
{
    EALIB_MEMCLASS *memoryclass;
    EALIB_MEMBLOCK *block;
    EALIB_MEMBLOCK *purgeblock;
    unsigned int purgepriority;
    unsigned int purgeage;

    memoryclass = &memclass[(int)(type & 0xf00) >> 8];
    block = memoryclass->first->next;
    purgeblock = 0;
    purgepriority = type & 7;
    purgeage = 0;
    while (block != memoryclass->last) {
        if ((block->type & 8) &&
            ((block->type & 7) > purgepriority ||
             ((block->type & 7) == purgepriority && sequence - block->sequence >= purgeage))) {
            purgeblock = block;
            purgeage = sequence - block->sequence;
            purgepriority = block->type & 7;
        }
        block = block->next;
    }
    if (purgeblock) {
        purgememblocki((MEMBLOCK *)purgeblock);
        return 1;
    }
    return 0;
}

MEMBLOCK *findnamedmemblockinclass(char *name, unsigned int type)
{
    EALIB_MEMCLASS *memoryclass;
    EALIB_MEMBLOCK *block;
    char *blockname;

    memoryclass = &memclass[(int)(type & 0xf00) >> 8];
    blockname = filename(name);
    block = memoryclass->first;
    if (block != memoryclass->last) {
        do {
            if (!strncmp(blockname, block->name, 12))
                return (MEMBLOCK *)block;
            block = block->next;
        } while (block != memoryclass->last);
    }
    return 0;
}

MEMBLOCK *findnamedmemblock(char *name)
{
    return findnamedmemblockinclass(name, 0);
}

int updatehighwater(void)
{
    int unused;

    if (!highwateractive)
        return 0;
    unused = largestunusedinclassi(0);
    if (unused < highwater)
        highwater = unused;
    return highwater;
}

int largestunused(void)
{
    return largestunusedinclass(0);
}

int largestunusedinclass(unsigned int type)
{
    int unused;

    locksemaphore(_lv);
    unused = largestunusedinclassi(type);
    unlocksemaphore(_lv);
    return unused;
}

int largestunusedinclassi(unsigned int type)
{
    EALIB_MEMCLASS *memoryclass;
    EALIB_MEMBLOCK *previousblock;
    EALIB_MEMBLOCK *block;
    EALIB_MEMBLOCK *endblock;
    int unused;
    int largest;

    memoryclass = &memclass[(int)(type & 0xf00) >> 8];
    if (autocompact)
        compactupi(memoryclass->last, memoryclass->first);
    previousblock = memoryclass->first;
    largest = 0;
    block = previousblock->next;
    endblock = memoryclass->last->next;
    do {
        unused = (char *)block->address - (char *)previousblock->address - previousblock->blocksize - memoryclass->type;
        if (unused > largest)
            largest = unused;
        previousblock = block;
        block = block->next;
    } while (block != endblock);
    return largest;
}

int lockedmem(void)
{
    EALIB_MEMBLOCK *block;
    int size;

    if (defaultmc == &memclass[3])
        return 0;
    block = defaultmc->first;
    size = 0;
    while (block) {
        if (!(block->type & 0x18))
            size += block->blocksize;
        block = block->next;
    }
    return size;
}

int relocateablemem(void)
{
    EALIB_MEMBLOCK *block;
    int size;

    if (defaultmc == &memclass[3])
        return 0;
    block = defaultmc->first;
    size = 0;
    while (block) {
        if (block->type & 0x10)
            size += block->blocksize;
        block = block->next;
    }
    return size;
}

int purgeablemem(void)
{
    EALIB_MEMBLOCK *block;
    int size;

    if (defaultmc == &memclass[3])
        return 0;
    block = defaultmc->first;
    size = 0;
    while (block) {
        if (block->type & 8)
            size += block->blocksize;
        block = block->next;
    }
    return size;
}

int availablemem(void)
{
    EALIB_MEMBLOCK *block;
    EALIB_MEMBLOCK *nextblock;
    int size;

    block = defaultmc->first;
    size = 0;
    nextblock = block->next;
    while (block != defaultmc->last) {
        size += (char *)nextblock->address - ((char *)block->address + block->blocksize);
        block = nextblock;
        nextblock = nextblock->next;
    }
    return size;
}

int largestreserveableinclass(unsigned int type)
{
    EALIB_MEMCLASS *memoryclass;
    EALIB_MEMBLOCK *previousblock;
    EALIB_MEMBLOCK *block;
    int reserveable;
    int largest;

    memoryclass = &memclass[(int)(type & 0xf00) >> 8];
    largest = 0;
    previousblock = memoryclass->first;
    reserveable = 0;
    block = previousblock->next;
    while (previousblock != memoryclass->last) {
        reserveable += (char *)block->address - ((char *)previousblock->address + previousblock->blocksize);
        if (block->type & 8) {
            reserveable += block->blocksize;
        } else {
            if (reserveable > largest)
                largest = reserveable;
            reserveable = 0;
        }
        previousblock = block;
        block = block->next;
    }
    return largest;
}

void initmemblocks(EALIB_MEMBLOCK *address, int count)
{
    int i;

    if (count < 10 || count > 1000000)
        abortmessage((abortfile = "cmn/memman.c", abortline = 1421,
                      "initmemblocks - INVALID NUMBER OF BLOCKS %d\n"), count);
    emptyblock = address;
    for (i = 0; i < count - 1; i++) {
        address->next = address + 1;
        address++;
    }
    address->next = 0;
}

void putmemblock(EALIB_MEMBLOCK *block)
{
    block->next = emptyblock;
    emptyblock = block;
}

EALIB_MEMBLOCK *getmemblock(void)
{
    EALIB_MEMBLOCK *block;

    if (!emptyblock)
        abortmessage((abortfile = "cmn/memman.c", abortline = 1450,
                      "getmemblock - NO MEMORY BLOCKS LEFT\n"));
    block = emptyblock;
    emptyblock = emptyblock->next;
    return block;
}

int memsizeadr(void *address)
{
    return ((EALIB_MEMBLOCK *)findmemblock(address))->datasize;
}

unsigned char *getblockadr(MEMBLOCK *block)
{
    return (unsigned char *)((EALIB_MEMBLOCK *)block)->address;
}

unsigned char *getblockoffset(MEMBLOCK *block)
{
    return (unsigned char *)((EALIB_MEMBLOCK *)block)->address;
}

int getblocklen(MEMBLOCK *block)
{
    return ((EALIB_MEMBLOCK *)block)->datasize;
}

char *getblockname(MEMBLOCK *block)
{
    return ((EALIB_MEMBLOCK *)block)->name;
}

unsigned int getblocktype(MEMBLOCK *block)
{
    return ((EALIB_MEMBLOCK *)block)->type;
}

void lockmemblock(MEMBLOCK *blockhandle)
{
    locksemaphore(_lv);
    ((EALIB_MEMBLOCK *)blockhandle)->type &= ~0x10;
    unlocksemaphore(_lv);
}

void unlockmemblock(MEMBLOCK *blockhandle)
{
    locksemaphore(_lv);
    ((EALIB_MEMBLOCK *)blockhandle)->type |= 0x10;
    unlocksemaphore(_lv);
}

void breakmemadr(void *address, int offset)
{
    breakmemblock(findmemblock(address), offset);
}

void breakmemblock(MEMBLOCK *block, int offset)
{
    locksemaphore(_lv);
    breakmemblocki(block, offset);
    unlocksemaphore(_lv);
}

void breakmemblocki(MEMBLOCK *blockhandle, int offset)
{
    EALIB_MEMBLOCK *block;

    block = (EALIB_MEMBLOCK *)blockhandle;
    if (!blockhandle)
        abortmessage((abortfile = "cmn/memman.c", abortline = 1658,
                      "breakmemblock - NULL pointer\n"));
    if (block->type & 0x2000)
        membreak((EALIB_MEMBLOCK *)blockhandle);
    if (block->type & 0x8000)
        abortmessage((abortfile = "cmn/memman.c", abortline = 1660,
                      "breakmemblock - CAN NOT BREAK SYSTEM BLOCKS\n"));
    if ((block->type & 0x4000) && !checksentinelz((EALIB_MEMBLOCK *)blockhandle))
        abortmessage((abortfile = "cmn/memman.c", abortline = 1666,
                      "breakmemblock - SENTINEL CORRUPTED.  BLOCK '%s' @ %lx, LENGTH %ld\n"),
                     block->name, block->address, block->datasize);
    block->type &= ~0x2000;
    if (offset)
        block->type |= 0x2000;
}

MEMBLOCK *findcontainingmemblocka(void *address, int abort)
{
    EALIB_MEMBLOCK *block;
    EALIB_MEMBLOCK *lastblock;
    int classnumber;

    for (classnumber = 0; classnumber < 16; classnumber++) {
        if (memclass[classnumber].last) {
            lastblock = memclass[classnumber].last;
            block = memclass[classnumber].first;
            do {
                block = block->next;
            } while (((char *)address < (char *)block->address ||
                      (char *)address >= (char *)block->address + block->datasize) &&
                     block != lastblock);
            if (!(block->type & 0x8000))
                return (MEMBLOCK *)block;
        }
    }
    if (abort)
        abortmessage((abortfile = "cmn/memman.c", abortline = 1758,
                      "findcontainingmemblock - BLOCK NOT FOUND (%p)\n"), address);
    return 0;
}

MEMBLOCK *findcontainingmemblock(void *address)
{
    return findcontainingmemblocka(address, 1);
}

MEMBLOCK *findcontainingmemblockz(void *address)
{
    return findcontainingmemblocka(address, 0);
}
