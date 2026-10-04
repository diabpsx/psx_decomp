/* EACLIB COMPACT.C -- slide relocatable (0x10) / purgeable (8) blocks to close gaps in a memory class.
 * Source twin: NFS2 PC beta eaclib compact.c (win\obja\compact.obj).  compactupi/compactdowni are spelled
 * with labels in retail block order (also the matched NFS2 PSX candidates' form): the structured twin's
 * for/if-else-if layout emits a different block order.  The first parameter doubles as the scan cursor. */
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

extern EALIB_MEMCLASS *defaultmc;
extern int *_lv;
extern void blockmove(void *source, void *dest, int size);
extern int locksemaphore(int *semaphore);
extern void unlocksemaphore(int *semaphore);

void compactup(void) LIBTEXT;
int compactupi(EALIB_MEMBLOCK *movable, EALIB_MEMBLOCK *first) LIBTEXT;
void compactdown(void) LIBTEXT;
int compactdowni(EALIB_MEMBLOCK *movable, EALIB_MEMBLOCK *last) LIBTEXT;

void compactup(void)
{
    locksemaphore(_lv);
    compactupi(defaultmc->last, defaultmc->first);
    unlocksemaphore(_lv);
}

int compactupi(EALIB_MEMBLOCK *movable, EALIB_MEMBLOCK *first)
{
    EALIB_MEMBLOCK *block;
    char *destination;
    char *address;
    char *blockend;
    int gap;
    int compacted = 0;

    block = movable->prev;
    destination = (char *)movable->address;
    movable = block;

outer:
    gap = 0;
inner:
    blockend = (char *)block->address + block->blocksize;
    if (blockend < destination)
        goto shrink;
    if (block == first)
        goto after;
    destination = (char *)block->address;
    block = block->prev;
    goto inner;

shrink:
    gap = destination - blockend;
    destination = blockend;
    movable = block;

after:
    if (gap != 0)
        goto scan;
    return compacted;

advance:
    block = block->prev;
    goto outer;

relink:
    address = destination + gap - movable->blocksize;
    blockmove(movable->address, address, movable->blocksize);
    movable->address = address;
    movable->prev->next = movable->next;
    movable->next->prev = movable->prev;
    movable->next = block->next;
    movable->prev = block;
    block->next->prev = movable;
    block->next = movable;
    destination = (char *)movable->address;
    compacted = 1;
    goto outer;

slide:
    address = destination + gap - movable->blocksize;
    blockmove(movable->address, address, movable->blocksize);
    movable->address = address;
    destination = address;
    compacted = 1;
    goto outer;

scan:
    if (movable == first)
        return compacted;
    if ((movable->type & 0x18) != 0)
        goto pick;
    movable = movable->prev;
    goto scan;

pick:
    if ((char *)movable->address + movable->blocksize == destination)
        goto slide;
    if (gap >= movable->blocksize)
        goto relink;
    destination = (char *)block->address;
    if (block == first)
        return compacted;
    goto advance;
}

void compactdown(void)
{
    locksemaphore(_lv);
    compactdowni(defaultmc->first, defaultmc->last);
    unlocksemaphore(_lv);
}

int compactdowni(EALIB_MEMBLOCK *movable, EALIB_MEMBLOCK *last)
{
    EALIB_MEMBLOCK *block;
    char *destination;
    char *blockstart;
    int gap;
    int compacted = 0;

    destination = (char *)movable->address + movable->blocksize;
    block = movable->next;
    movable = block;

outer:
    gap = 0;
    for (;;) {
        blockstart = (char *)block->address;
        if (destination < blockstart)
            goto shrink;
        if (block == last)
            goto after;
        destination = blockstart + block->blocksize;
        block = block->next;
    }

shrink:
    gap = blockstart - destination;
    movable = block;

after:
    if (gap != 0)
        goto scan;
    return compacted;

advance:
    block = block->next;
    goto outer;

relink:
    blockmove(movable->address, destination, movable->blocksize);
    movable->address = destination;
    movable->prev->next = movable->next;
    movable->next->prev = movable->prev;
    movable->next = block;
    movable->prev = block->prev;
    block->prev->next = movable;
    block->prev = movable;
    compacted = 1;
    destination += movable->blocksize;
    goto outer;

slide:
    blockmove(block->address, destination, block->blocksize);
    compacted = 1;
    block->address = destination;
    destination += block->blocksize;
    goto outer;

scan:
    if (movable == last)
        return compacted;
    if ((movable->type & 0x18) != 0)
        goto pick;
    movable = movable->next;
    goto scan;

pick:
    if (movable == block)
        goto slide;
    if (gap >= movable->blocksize)
        goto relink;
    destination = (char *)block->address + block->blocksize;
    if (block == last)
        return compacted;
    goto advance;
}
