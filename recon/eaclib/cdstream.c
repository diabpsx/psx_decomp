/* EACLIB CDSTREAM.C -- PSX CD streaming layer (retail __FILE__ "cmn/cdstream.c").
 * Source twin: NFS2 PC beta win\obja\cdstream.obj (same member list and order, Watcom
 * decompile in nfs2-clean/pc-beta/pc-split/cdstream.obj); CDSTREAM field names from the
 * NFS2 PC Watcom debug type.  The PSX member differs from the PC one: no reader thread or
 * critical sections, a 0xA0-byte stream header, get/release byte counters at +0x90/+0x94,
 * a streamfull flag at +0x8C and a 0x9C-byte request block.  The stream header is shared
 * with the CD-callback reader (PSXistreamreader -> localstreamreader), so every access goes
 * through a volatile view; the retail code re-reads each field after every store
 * (chained assignments, repeated tests) -- see the oracle reloads.
 * Toolchain identity (measured): every member passes on the PsyQ 3.6 DOS CC1PSX 2.7.2.SN.1
 * lane (-O2 -G8 -fsigned-char, ASPSX 2.56 behaviour); the PsyQ 4.0 CC1PSX misses only on
 * sched1 load-latency placement, the gcc 2.6.3/ASPSX 2.34 lane on small-li encoding.
 * Source-shape receipts in localstreamreader: the space tests are written call-first
 * (the oracle reloads cdms after each call); chunk-header stores go through CHUNKHDR so
 * they cannot alias the cdms/cdrs scalars (no reloads); the "issue a read" blocks are
 * while loops that always return (their LOOP_END note keeps cse from carrying cdms into
 * the following header test, as retail reloads it); the not-found/wait-directory exits
 * are inline returns that loop.c moves to the end of the function, as in retail. */
#define LIBTEXT __attribute__((section(".text.lib")))

typedef struct streamblockstruct {
    char name[0x8F];                    /* +0x00 */
    int offset;                         /* +0x90 */
    int command;                        /* +0x94 */
    struct streamblockstruct *next;     /* +0x98 */
} STREAMBLOCK;

typedef struct chunkhdrstruct {
    int type;
    int size;
} CHUNKHDR;

typedef struct crcchunkhdrstruct {     /* chunk header of a CRC-carrying stream [INFERRED name] */
    int type;
    int size;
    int crc;
} CRCCHUNKHDR;

typedef volatile struct cdstreamstruct {
    long id;                            /* +0x00 */
    char *start;                        /* +0x04 */
    char *end;                          /* +0x08 */
    char *write;                        /* +0x0C */
    char *header;                       /* +0x10 */
    char *get;                          /* +0x14 */
    char *release;                      /* +0x18 */
    int handle;                         /* +0x1C */
    int state;                          /* +0x20 */
    int control;                        /* +0x24 */
    int status;                         /* +0x28 */
    int abort;                          /* +0x2C */
    int datahascrc;                     /* +0x30 */
    int crcerrors;                      /* +0x34 */
    int crcretries;                     /* +0x38 */
    int buffersize;                     /* +0x3C */
    int blocksize;                      /* +0x40 */
    int readsize;                       /* +0x44 */
    int chunksize;                      /* +0x48 */
    int relocationsize;                 /* +0x4C */
    long fileoffset;                    /* +0x50 */
    int fileend;                        /* +0x54 */
    long filesize;                      /* +0x58 */
    int dataoffset;                     /* +0x5C */
    int seekposition;                   /* +0x60 */
    int seekoffset;                     /* +0x64 */
    int idtype;                         /* +0x68 */
    int idmask;                         /* +0x6C */
    struct cdstreamstruct *nextstream;  /* +0x70 */
    STREAMBLOCK *emptyblock;            /* +0x74 */
    STREAMBLOCK *head;                  /* +0x78 */
    STREAMBLOCK *tail;                  /* +0x7C */
    STREAMBLOCK *block;                 /* +0x80 */
    int x84;                            /* +0x84 (PSX-only, role unknown) */
    int x88;                            /* +0x88 (PSX-only, role unknown) */
    int streamfull;                     /* +0x8C */
    int getstatus;                      /* +0x90 bytes returned by streamgetstatus */
    int releasestatus;                  /* +0x94 bytes returned by streamreleasestatus */
    int x98;                            /* +0x98 */
    int x9c;                            /* +0x9C */
} CDSTREAM;

/* EA abort convention: the call's function designator is a comma expression that records
 * __FILE__/__LINE__ (literal line numbers from the retail object).  The CRC-failure site in
 * localstreamreader proves the two stores are evaluated after the call's arguments. */
#define ABORTAT(line) (abortfile = "cmn/cdstream.c", abortline = (line), abortmessage)
#define BLOCKTABLESIZE ((maxstreamblocks * sizeof(STREAMBLOCK) + 15) & 0xfff0)

extern char *abortfile;
extern int abortline;
extern void abortmessage(char *fmt, ...);
extern int gettick(void);
extern void psxcdromstopread(void);
extern void setstreameriofuncs(void (*reader)(void), int (*status)(void), void (*setnotfull)(void));
extern void *reservememadra(char *name, int size, int flags, int abort);
extern void *reservememadr(char *name, int size, int flags);
extern void purgememadr(void *adr);
extern void blockclear(void *adr, int size);
extern char *strncpy(char *dst, const char *src, int n);
extern char *strchr(const char *str, int ch);
extern int strncmp(const char *a, const char *b, int n);
extern void closeblockhandle(int handle);
extern void getdirectory(char *buffer);
extern int asyncopenblockhandle(char *name, volatile int *handle, volatile long *offset, volatile long *size, int *info);
extern int directoryentrycached(char *name, int *sector, int *length);
extern int asyncopenblockhandlebysector(char *name, int sector, int length, volatile int *handle, int *info);
extern int asyncseekblockhandle(int handle, int offset);
extern void asyncreadblockcallback(void (*func)(void));
extern int asyncreadblockhandle(int handle, void *adr, int length);
extern void setdirentrycallback(void (*func)(void));
extern void asyncdirentry(char *name, int *sector, int *length);
extern void blockmove(void *src, void *dst, int length);
extern unsigned int getm(void *src, int bytes);
extern unsigned int crc16(void *adr, int length);
extern void print(char *fmt, ...);

int maxstreamblocks = 8;
int cdspeed = 218;
int seekticks = 300;
int streamtime = 0;
int streambytes = 0;
CDSTREAM *cdms = 0;
CDSTREAM *cdrs = 0;

void setstreamqueuesize(int blocks) LIBTEXT;
CDSTREAM *initstreamstructa(CDSTREAM *s, int size, int blocksize, int abort) LIBTEXT;
CDSTREAM *initstreamstructz(CDSTREAM *s, int size, int blocksize) LIBTEXT;
CDSTREAM *initstreamstruct(CDSTREAM *s, int size, int blocksize) LIBTEXT;
CDSTREAM *initstreama(int size, int blocksize, int flags, int abort) LIBTEXT;
CDSTREAM *initstreamz(int size, int blocksize, int flags) LIBTEXT;
CDSTREAM *initstream(int size, int blocksize, int flags) LIBTEXT;
int setstreamspeed(char *name, char *speed) LIBTEXT;
void defaultstreamspeed(void) LIBTEXT;
void delstreamstruct(CDSTREAM *s) LIBTEXT;
void delstream(CDSTREAM *s) LIBTEXT;
int streamcommanda(CDSTREAM *s, char *name, int command, int offset, int wake, int abort) LIBTEXT;
int purgestreamcommanda(CDSTREAM *s, char *name, int command, int offset, int abort) LIBTEXT;
int startstream(CDSTREAM *s, char *name) LIBTEXT;
int startstreamz(CDSTREAM *s, char *name) LIBTEXT;
int queuestartstream(CDSTREAM *s, char *name) LIBTEXT;
int queuestartstreamz(CDSTREAM *s, char *name) LIBTEXT;
int purgestartstream(CDSTREAM *s, char *name) LIBTEXT;
int purgestartstreamz(CDSTREAM *s, char *name) LIBTEXT;
int startstreamidle(CDSTREAM *s, char *name) LIBTEXT;
int startstreamidlez(CDSTREAM *s, char *name) LIBTEXT;
int queuestartstreamidle(CDSTREAM *s, char *name) LIBTEXT;
int queuestartstreamidlez(CDSTREAM *s, char *name) LIBTEXT;
int purgestartstreamidle(CDSTREAM *s, char *name) LIBTEXT;
int purgestartstreamidlez(CDSTREAM *s, char *name) LIBTEXT;
int seekstream(CDSTREAM *s, int offset) LIBTEXT;
int seekstreamz(CDSTREAM *s, int offset) LIBTEXT;
int queueseekstream(CDSTREAM *s, int offset) LIBTEXT;
int queueseekstreamz(CDSTREAM *s, int offset) LIBTEXT;
int purgeseekstream(CDSTREAM *s, int offset) LIBTEXT;
int purgeseekstreamz(CDSTREAM *s, int offset) LIBTEXT;
int purgestreamqueue(CDSTREAM *s) LIBTEXT;
CDSTREAM *secondarystreamstruct(CDSTREAM *s, int idtype, int idmask, int size) LIBTEXT;
CDSTREAM *secondarystream(int idtype, int idmask, int size, int flags) LIBTEXT;
void resetstreamstatus(void) LIBTEXT;
int getstreamstatus(void) LIBTEXT;
void PSXistreamreader(void) LIBTEXT;
void streamreader(void) LIBTEXT;
void coordinatestream(void) LIBTEXT;
void localstreamreader(void) LIBTEXT;
void releasechunks(CDSTREAM *s) LIBTEXT;
int streamspace(CDSTREAM *s) LIBTEXT;
int streamendspace(CDSTREAM *s) LIBTEXT;
int streamstartspace(CDSTREAM *s) LIBTEXT;
CHUNKHDR *getstreamchunk(CDSTREAM *s) LIBTEXT;
void releasestreamchunk(CDSTREAM *s, CHUNKHDR *chunk) LIBTEXT;
int streamgetstatus(CDSTREAM *s) LIBTEXT;
int streamreleasestatus(CDSTREAM *s) LIBTEXT;
int streamidle(void) LIBTEXT;
void streamsetnotfull(void) LIBTEXT;
int streamfull(CDSTREAM *s) LIBTEXT;
int isendofstream(CDSTREAM *s, CHUNKHDR *chunk) LIBTEXT;
void setstreamcrc(void) LIBTEXT;
void clearstreamcrc(void) LIBTEXT;
void initstreamblocks(STREAMBLOCK *block, int count) LIBTEXT;
void putstreamblock(STREAMBLOCK *block) LIBTEXT;
int checkstreamblocksfree(int count) LIBTEXT;
int streamblocksfree(void) LIBTEXT;
STREAMBLOCK *getstreamblocka(int abort) LIBTEXT;

void setstreamqueuesize(int blocks)
{
    if (blocks < 1) {
        ABORTAT(183)("setstreamblocks - ILLEGAL NUMBER OF BLOCKS SET (%d)\n", blocks);
    }
    maxstreamblocks = blocks;
}

CDSTREAM *initstreamstructa(CDSTREAM *s, int size, int blocksize, int abort)
{
    if (cdms != 0 && abort != 0) {
        ABORTAT(258)("initstream - STREAM HAS NOT BEEN DEINITIALIZED (delstream)\n");
    }
    cdms = cdrs = s;
    initstreamblocks((STREAMBLOCK *)(s + 1), maxstreamblocks);
    s->buffersize = size - sizeof(CDSTREAM) - BLOCKTABLESIZE;
    s->start = (char *)s + sizeof(CDSTREAM) + BLOCKTABLESIZE;
    s->end = (char *)s + size;
    s->abort = abort;
    s->header = s->write = s->get = s->release = s->start;
    s->status = 0;
    s->blocksize = blocksize;
    s->handle = 0;
    s->nextstream = 0;
    s->tail = s->head = 0;
    s->state = 7;
    s->control = 0;
    s->crcerrors = s->crcretries = 0;
    s->getstatus = s->releasestatus = 0;
    s->x84 = 0;
    s->datahascrc = 0;
    seekticks = 0;
    cdspeed = 0;
    setstreameriofuncs(PSXistreamreader, getstreamstatus, streamsetnotfull);
    return s;
}

CDSTREAM *initstreamstructz(CDSTREAM *s, int size, int blocksize)
{
    return initstreamstructa(s, size, blocksize, 0);
}

CDSTREAM *initstreamstruct(CDSTREAM *s, int size, int blocksize)
{
    return initstreamstructa(s, size, blocksize, 1);
}

CDSTREAM *initstreama(int size, int blocksize, int flags, int abort)
{
    CDSTREAM *s;
    s = (CDSTREAM *)reservememadra("CDSTREAM", size + sizeof(CDSTREAM) + BLOCKTABLESIZE, flags, abort);
    blockclear((void *)s, size + sizeof(CDSTREAM) + BLOCKTABLESIZE);
    return initstreamstructa(s, size + sizeof(CDSTREAM) + BLOCKTABLESIZE, blocksize, abort);
}

CDSTREAM *initstreamz(int size, int blocksize, int flags)
{
    return initstreama(size, blocksize, flags, 0);
}

CDSTREAM *initstream(int size, int blocksize, int flags)
{
    return initstreama(size, blocksize, flags, 1);
}

int setstreamspeed(char *name, char *speed)
{
    return 0;
}

void defaultstreamspeed(void)
{
    cdspeed = 218;
    seekticks = 300;
}

void delstreamstruct(CDSTREAM *s)
{
    int timeout;
    if (cdms == 0) {
        ABORTAT(605)("delstreamstruct - STREAM HAS NOT BEEN INITIALIZED (initstream)\n");
    }
    if (s == cdms) {
        s->control = 8;
        if (s->status == 1)
            psxcdromstopread();
        timeout = gettick() + 100;
        while (s->status == 1) {
            if (timeout < gettick()) {
                ABORTAT(619)("delstreamstruct - TIMEOUT ON WAIT FOR STREAM ACCESS TO COMPLETE\n");
            }
        }
        PSXistreamreader();
        setstreameriofuncs(0, 0, 0);
        cdms = 0;
    }
}

void delstream(CDSTREAM *s)
{
    CDSTREAM *p;
    if (cdms == 0) {
        ABORTAT(694)("delstream - STREAM HAS NOT BEEN INITIALIZED (initstream)\n");
    }
    if (s == cdms) {
        delstreamstruct(s);
        p = s;
        do {
            p = p->nextstream;
            purgememadr((void *)s);
            s = p;
        } while (s != 0);
    } else {
        p = cdms;
        while (p->nextstream != 0) {
            if (p->nextstream == s)
                break;
            p = p->nextstream;
        }
        if (p->nextstream != s) {
            ABORTAT(723)("delstream - STREAM NOT FOUND\n");
        }
        p->nextstream = s->nextstream;
        purgememadr((void *)s);
    }
    cdrs = 0;
    cdms = 0;
}

int streamcommanda(CDSTREAM *s, char *name, int command, int offset, int wake, int abort)
{
    STREAMBLOCK *block;
    if (cdms == 0) {
        if (abort != 0) {
            ABORTAT(802)("startstream - STREAM HAS NOT BEEN INITIALIZED (initstream)\n");
        }
        return 0;
    }
    block = getstreamblocka(abort);
    if (block == 0)
        return 0;
    strncpy(block->name, name, 0x8F);
    block->name[0x8E] = 0;
    block->command = command;
    block->offset = offset;
    if (s->tail != 0) {
        s->tail->next = block;
        s->tail = block;
    } else {
        s->head = s->tail = block;
    }
    if (wake != 0 && s->control == 0)
        s->control = 15;
    return 1;
}

int purgestreamcommanda(CDSTREAM *s, char *name, int command, int offset, int abort)
{
    STREAMBLOCK *block;
    if (cdms == 0) {
        if (abort != 0) {
            ABORTAT(840)("purgestartstream - STREAM HAS NOT BEEN INITIALIZED (initstream)\n");
        }
        return 0;
    }
    while (s->head != 0) {
        block = s->head;
        s->head = block->next;
        putstreamblock(block);
    }
    block = getstreamblocka(abort);
    strncpy(block->name, name, 0x8F);
    block->name[0x8E] = 0;
    block->command = command;
    block->offset = offset;
    s->head = s->tail = block;
    if (s->handle != 0 && s->control == 0)
        s->control = 15;
    return 1;
}

int startstream(CDSTREAM *s, char *name)
{
    return purgestreamcommanda(s, name, 1, 0, 1);
}

int startstreamz(CDSTREAM *s, char *name)
{
    return purgestreamcommanda(s, name, 1, 0, 0);
}

int queuestartstream(CDSTREAM *s, char *name)
{
    return streamcommanda(s, name, 17, 0, 0, 1);
}

int queuestartstreamz(CDSTREAM *s, char *name)
{
    return streamcommanda(s, name, 17, 0, 0, 0);
}

int purgestartstream(CDSTREAM *s, char *name)
{
    return purgestreamcommanda(s, name, 13, 0, 1);
}

int purgestartstreamz(CDSTREAM *s, char *name)
{
    return purgestreamcommanda(s, name, 13, 0, 0);
}

int startstreamidle(CDSTREAM *s, char *name)
{
    return purgestreamcommanda(s, name, 18, 0, 1);
}

int startstreamidlez(CDSTREAM *s, char *name)
{
    return purgestreamcommanda(s, name, 18, 0, 0);
}

int queuestartstreamidle(CDSTREAM *s, char *name)
{
    return streamcommanda(s, name, 19, 0, 0, 1);
}

int queuestartstreamidlez(CDSTREAM *s, char *name)
{
    return streamcommanda(s, name, 19, 0, 0, 0);
}

int purgestartstreamidle(CDSTREAM *s, char *name)
{
    return purgestreamcommanda(s, name, 20, 0, 1);
}

int purgestartstreamidlez(CDSTREAM *s, char *name)
{
    return purgestreamcommanda(s, name, 20, 0, 0);
}

int seekstream(CDSTREAM *s, int offset)
{
    return streamcommanda(s, "", 2, offset, 1, 1);
}

int seekstreamz(CDSTREAM *s, int offset)
{
    return streamcommanda(s, "", 2, offset, 1, 0);
}

int queueseekstream(CDSTREAM *s, int offset)
{
    return streamcommanda(s, "", 16, offset, 0, 1);
}

int queueseekstreamz(CDSTREAM *s, int offset)
{
    return streamcommanda(s, "", 16, offset, 0, 0);
}

int purgeseekstream(CDSTREAM *s, int offset)
{
    return purgestreamcommanda(s, "", 11, offset, 1);
}

int purgeseekstreamz(CDSTREAM *s, int offset)
{
    return purgestreamcommanda(s, "", 11, offset, 0);
}

int purgestreamqueue(CDSTREAM *s)
{
    int count = 0;
    STREAMBLOCK *block;
    while (s->head != 0) {
        block = s->head;
        s->head = block->next;
        putstreamblock(block);
        count++;
    }
    s->tail = s->head;
    return count;
}

CDSTREAM *secondarystreamstruct(CDSTREAM *s, int idtype, int idmask, int size)
{
    CDSTREAM *p;
    s->buffersize = size - sizeof(CDSTREAM);
    s->start = (char *)s + sizeof(CDSTREAM);
    s->end = (char *)s + size;
    s->header = s->write = s->get = s->release = s->start;
    s->getstatus = s->releasestatus = 0;
    s->status = 0;
    s->blocksize = 0;
    s->dataoffset = 0;
    s->fileend = 1;
    s->idmask = idmask;
    s->idtype = idtype;
    p = cdms;
    while (p->nextstream != 0)
        p = p->nextstream;
    p->nextstream = s;
    s->nextstream = 0;
    return s;
}

CDSTREAM *secondarystream(int idtype, int idmask, int size, int flags)
{
    CDSTREAM *s;
    int total = size + sizeof(CDSTREAM);
    s = (CDSTREAM *)reservememadr("SECCDSTREAM", total, flags);
    blockclear((void *)s, total);
    return secondarystreamstruct(s, idtype, idmask, total);
}

void resetstreamstatus(void)
{
    if (cdms != 0)
        cdms->status = 0;
}

int getstreamstatus(void)
{
    return cdms ? cdms->status : 0;
}

void PSXistreamreader(void)
{
    if (cdms == 0) {
        ABORTAT(1807)("PSXistreamreader - STREAM HAS NOT BEEN INITIALIZED (initstream)\n");
    }
    if (cdms->status != 1)
        localstreamreader();
}

void streamreader(void)
{
    ABORTAT(1817)("streamreader - SHOULD NO LONGER BE CALLED.\n");
    PSXistreamreader();
}

void coordinatestream(void)
{
    if (cdms != 0 && cdms->status == 1)
        cdms->control = 21;
}

static int streamsector = 0;            /* 0x8011C504: start sector from the directory cache */
static int readretries = 0;             /* 0x8011C508: consecutive reader re-entries while busy */
static int fileopened = 0;              /* 0x8011C50C: file opened through asyncopenblockhandle */
int pout = 1;                           /* 0x8011C510 (retail MAP name, unused here) */
static int filelength;                  /* 0x8011CA0C: host-file flag, then the file length */
static int savedstate;                  /* 0x8011CA10: state to resume after the sector open */

void localstreamreader(void)
{
    char directory[256];
    int handleinfo[2];
    int quit = 0;
    char *readadr;
    int readlen;
    unsigned int chunkid;

    if (cdms == 0)
        return;
    if (fileopened != 0 && cdms->status == 1)
        readretries++;
    else
        readretries = 0;
    for (;;) {
        if (cdms->control == 8)
            cdms->state = 8;
        else if (cdms->control == 15)
            cdms->state = 7;
        else if (cdms->control == 21)
            quit = 1;
        cdms->control = 0;
        if (quit != 0)
            goto done;
        switch (cdms->state) {
        case 7:
            if (cdms->status == 1)
                goto done;
            releasechunks(cdms);
            if (cdms->head != 0) {
                STREAMBLOCK *block;
                block = cdms->head;
                cdms->head = cdms->head->next;
                cdms->block = block;
                if (cdms->head == 0)
                    cdms->tail = 0;
                cdms->state = block->command;
                cdms->seekposition = cdms->fileoffset + block->offset;
                putstreamblock(block);
                break;
            }
            return;
        case 8:
            if (cdms->status == 1)
                goto done;
            if (cdms->handle != 0)
                closeblockhandle(cdms->handle);
            cdms->handle = 0;
            cdms->state = 7;
            return;
        case 1:
        case 17:
        case 18:
        case 19:
            if (cdms->handle != 0)
                closeblockhandle(cdms->handle);
            fileopened = 0;
            filelength = 1;
            if ((strchr(cdms->block->name, ':') == 0 && strchr(cdms->block->name, '\\') == 0)
                || strncmp(cdms->block->name, "cdrom:", 6) == 0) {
                filelength = 0;
                if (strncmp(cdms->block->name, "cdrom:", 6) != 0) {
                    getdirectory(directory);
                    if (strncmp(directory, "cdrom:", 6) != 0)
                        filelength = 1;
                }
            }
            if (filelength != 0) {
                if (asyncopenblockhandle(cdms->block->name, &cdms->handle, &cdms->fileoffset,
                                         &cdms->filesize, handleinfo) == 0) {
                    print("STREAMER: [%s] FILE NOT FOUND!!!\n", cdms->block->name);
                    cdms->handle = 0;
                    cdms->state = 7;
                    return;
                }
                fileopened = 1;
                filelength = cdms->filesize;
            } else {
                savedstate = cdms->state;
                cdms->state = 22;
                if (directoryentrycached(cdms->block->name, &streamsector, &filelength) == 0) {
                    cdms->status = 1;
                    setdirentrycallback(localstreamreader);
                    asyncdirentry(cdms->block->name, &streamsector, &filelength);
                    return;
                }
            }
        case 22:
            if (cdms->state == 22) {
                if (streamsector == 0) {
                    ABORTAT(1969)("[%s] file not found", cdms->block->name);
                }
                asyncopenblockhandlebysector(cdms->block->name, streamsector, filelength,
                                             &cdms->handle, handleinfo);
                cdms->state = savedstate;
                cdms->status = 0;
            }
            cdms->fileend = cdms->filesize = filelength;
            cdms->seekposition = 0;
            cdms->fileoffset = 0;
            if (cdms->state == 1 || cdms->state == 18) {
                cdms->header = cdms->get;
                cdms->getstatus = 0;
            }
            cdms->write = cdms->header;
            if (cdms->state == 19 || cdms->state == 18)
                cdms->state = 7;
            else
                cdms->state = 16;
            streamsetnotfull();
            break;
        case 13:
        case 20:
            if (cdms->handle != 0)
                closeblockhandle(cdms->handle);
            fileopened = 0;
            filelength = 1;
            if ((strchr(cdms->block->name, ':') == 0 && strchr(cdms->block->name, '\\') == 0)
                || strncmp(cdms->block->name, "cdrom:", 6) == 0) {
                filelength = 0;
                if (strncmp(cdms->block->name, "cdrom:", 6) != 0) {
                    getdirectory(directory);
                    if (strncmp(directory, "cdrom:", 6) != 0)
                        filelength = 1;
                }
            }
            if (filelength != 0) {
                if (asyncopenblockhandle(cdms->block->name, &cdms->handle, &cdms->fileoffset,
                                         &cdms->filesize, handleinfo) == 0) {
                    print("STREAMER: [%s] FILE NOT FOUND!!!\n", cdms->block->name);
                    cdms->handle = 0;
                    cdms->state = 7;
                    return;
                }
                fileopened = 1;
                filelength = cdms->filesize;
            } else {
                savedstate = cdms->state;
                cdms->state = 23;
                if (directoryentrycached(cdms->block->name, &streamsector, &filelength) == 0) {
                    cdms->status = 1;
                    setdirentrycallback(localstreamreader);
                    asyncdirentry(cdms->block->name, &streamsector, &filelength);
                    return;
                }
            }
        case 23:
            if (cdms->state == 23) {
                asyncopenblockhandlebysector(cdms->block->name, streamsector, filelength,
                                             &cdms->handle, handleinfo);
                if (streamsector == 0) {
                    ABORTAT(2058)("[%s] file not found", cdms->block->name);
                }
                cdms->status = 0;
                cdms->state = savedstate;
            }
            cdms->fileend = cdms->filesize = filelength;
            cdms->seekposition = 0;
            cdms->fileoffset = 0;
            streamsetnotfull();
        case 11:
            cdrs = cdms;
            do {
                cdrs->header = cdrs->write = cdrs->get = cdrs->release = cdrs->start;
                cdrs->getstatus = cdrs->releasestatus = 0;
            } while ((cdrs = cdrs->nextstream) != 0);
            if (cdms->state == 20) {
                cdms->state = 7;
                break;
            }
            cdms->state = 2;
        case 2:
            cdms->header = cdms->get;
            cdms->getstatus = 0;
        case 16:
            cdms->write = cdms->header;
            if (streamendspace(cdms) <= cdms->blocksize) {
                if (streamendspace(cdms) != streamspace(cdms))
                    goto full;
                if (streamstartspace(cdms) <= cdms->blocksize)
                    goto full;
                ((CHUNKHDR *)cdms->header)->type = -1;
                cdms->header = cdms->start;
                cdms->write = cdms->header;
            }
            if (streamspace(cdms) <= cdms->blocksize)
                goto full;
            cdms->state = 3;
            cdms->write = cdms->header;
            cdms->dataoffset = cdms->seekposition;
            cdms->seekoffset = asyncseekblockhandle(cdms->handle, cdms->dataoffset);
            cdms->relocationsize = 0;
        case 3:
            if (readretries >= 3) {
                readretries = 0;
                goto done;
            }
            while (cdms->relocationsize < sizeof(CHUNKHDR)) {
                if (streamendspace(cdms) <= cdms->blocksize) {
                    if (cdms->status == 1)
                        goto done;
                    if (streamendspace(cdms) != streamspace(cdms))
                        goto full;
                    if (streamstartspace(cdms) <= cdms->relocationsize)
                        goto full;
                    blockmove(cdms->header, cdms->start, cdms->relocationsize);
                    ((CHUNKHDR *)cdms->header)->type = -1;
                    cdms->header = cdms->start;
                    cdms->write = cdms->header;
                    cdms->write += cdms->relocationsize;
                }
                if (streamspace(cdms) <= cdms->blocksize) {
                    if (cdms->status == 1)
                        goto done;
                    goto full;
                }
                cdms->status = 1;
                readlen = cdms->blocksize - cdms->seekoffset;
                readadr = cdms->write;
                cdms->seekoffset = 0;
                cdms->write += readlen;
                cdms->dataoffset += readlen;
                cdms->relocationsize += readlen;
                asyncreadblockcallback(localstreamreader);
                asyncreadblockhandle(cdms->handle, readadr, readlen);
                return;
            }
            if (getm(cdms->header, 4) == 0x5343456C && cdms->head != 0) {
                cdms->state = 7;
                break;
            }
            cdms->chunksize = ((CHUNKHDR *)cdms->header)->size;
            cdms->readsize = cdms->chunksize - cdms->relocationsize;
            cdrs = cdms;
            for (;;) {
                if ((cdrs = cdrs->nextstream) == 0) {
                    cdrs = cdms;
                    goto checkchunk;
                }
                chunkid = getm(cdms->header, 4);
                if (cdrs->idtype == (chunkid & cdrs->idmask))
                    break;
            }
        checkchunk:
            if (cdms->chunksize < 8 || cdrs->buffersize / 2 < cdms->chunksize) {
                if (cdms->datahascrc != 0)
                    cdms->chunksize = 8;
                else if (cdms->abort != 0) {
                    ABORTAT(2186)("localstreamreader - ILLEGAL CHUNK SIZE at %x. ID '%-4.4s' SIZE %d BUFFERSIZE %d\n",
                                 cdms->header, cdms->header, cdms->chunksize, cdrs->buffersize);
                } else {
                    cdrs = cdms;
                    do {
                        ((CHUNKHDR *)cdrs->header)->type = cdrs->idtype;
                        ((CHUNKHDR *)cdrs->header)->size = 8;
                        cdrs->header += 8;
                        cdrs->write = cdrs->header;
                    } while ((cdrs = cdrs->nextstream) != 0);
                    cdms->state = 7;
                    cdms->status = 0;
                    return;
                }
            }
        case 4:
            if (cdrs != cdms) {
                cdms->state = 4;
                if (cdms->status == 1)
                    goto done;
                if (streamendspace(cdrs) <= cdms->chunksize + cdms->blocksize + sizeof(CHUNKHDR)) {
                    if (streamendspace(cdrs) != streamspace(cdrs))
                        goto full;
                    if (streamstartspace(cdrs) <= cdms->relocationsize)
                        goto full;
                    ((CHUNKHDR *)cdrs->header)->type = -1;
                    cdrs->header = cdrs->start;
                    cdrs->write = cdrs->header;
                }
                if (streamspace(cdrs) <= cdms->blocksize + sizeof(CHUNKHDR))
                    goto full;
                if (cdms->readsize >= 0) {
                    blockmove(cdms->header, cdrs->header, cdms->relocationsize);
                    cdrs->write = cdrs->header + cdms->relocationsize;
                    cdms->write = cdms->header;
                    cdms->relocationsize = 0;
                } else {
                    blockmove(cdms->header, cdrs->header, cdms->chunksize);
                    cdrs->write = cdrs->header + cdms->chunksize;
                    cdms->relocationsize = -cdms->readsize;
                    blockmove(cdms->header + cdms->chunksize, cdms->header, cdms->relocationsize);
                    cdms->write -= cdms->chunksize;
                }
            }
        case 5:
            if (cdms->readsize > 0
                && streamendspace(cdrs) <= cdms->readsize + cdms->blocksize + sizeof(CHUNKHDR)) {
                cdms->state = 5;
                if (cdms->status == 1)
                    goto done;
                if (streamendspace(cdrs) != streamspace(cdrs))
                    goto full;
                if (streamstartspace(cdrs) <= cdms->relocationsize)
                    goto full;
                blockmove(cdrs->header, cdrs->start, cdms->relocationsize);
                ((CHUNKHDR *)cdrs->header)->type = -1;
                cdrs->write = cdrs->start + cdms->relocationsize;
                cdrs->header = cdrs->start;
            }
        case 6:
            cdms->state = 6;
            if (readretries >= 3) {
                readretries = 0;
                goto done;
            }
            while (cdms->readsize > 0) {
                if (streamspace(cdrs) <= cdms->blocksize) {
                    if (cdms->status == 1)
                        goto done;
                    goto full;
                }
                cdms->status = 1;
                readlen = cdms->blocksize - cdms->seekoffset;
                readadr = cdrs->write;
                cdms->seekoffset = 0;
                cdms->dataoffset += readlen;
                cdrs->write += readlen;
                cdms->readsize -= readlen;
                asyncreadblockcallback(localstreamreader);
                asyncreadblockhandle(cdms->handle, readadr, readlen);
                return;
            }
            if (getm(cdms->header, 4) == 0x5343456C) {
                cdrs->header += cdms->chunksize;
                cdrs->getstatus += cdms->chunksize - 8;
                cdms->state = 7;
                break;
            }
            if (cdms->datahascrc != 0) {
                int crc;
                crc = ((CRCCHUNKHDR *)cdrs->header)->crc;
                ((CRCCHUNKHDR *)cdrs->header)->crc = 0;
                if (crc != crc16(cdrs->header, cdms->chunksize)) {
                    ++cdms->crcerrors;
                    ++cdms->crcretries;
                    if (cdms->crcretries >= 11) {
                        ABORTAT(2306)("stream reader - CRC FAILED. ID '%-4.4s' SIZE %d FILECRC=%x CALCCRC=%x\n",
                                     cdms->header, cdms->chunksize, crc, crc16(cdrs->header, cdms->chunksize));
                    }
                    cdms->seekposition = cdms->dataoffset - (cdrs->write - cdrs->header);
                    cdms->state = 16;
                    if (cdms->status == 1)
                        goto done;
                    break;
                }
                cdms->crcretries = 0;
            }
            cdrs->header += cdms->chunksize;
            cdrs->getstatus += cdms->chunksize - 8;
            cdms->state = 10;
        case 10:
            if (cdrs != cdms) {
                cdms->state = 10;
                if (cdms->relocationsize == 0) {
                    if (cdms->status == 1)
                        goto done;
                    if (streamendspace(cdms) <= cdrs->write - cdrs->header) {
                        if (streamendspace(cdms) != streamspace(cdms))
                            goto full;
                        if (streamstartspace(cdms) <= cdrs->write - cdrs->header)
                            goto full;
                        ((CHUNKHDR *)cdms->header)->type = -1;
                        cdms->header = cdms->start;
                        cdms->write = cdms->header;
                    }
                    if (streamspace(cdms) <= cdrs->write - cdrs->header)
                        goto full;
                    cdms->relocationsize = cdrs->write - cdrs->header;
                    blockmove(cdrs->header, cdms->header, cdms->relocationsize);
                    cdrs->write = cdrs->header;
                    cdms->write = cdms->header + cdms->relocationsize;
                }
            } else
                cdrs->relocationsize = cdrs->write - cdrs->header;
        case 9:
            if (cdms->dataoffset - cdms->relocationsize >= cdms->fileend) {
                if (cdms->head == 0) {
                    cdms->state = 9;
                    cdrs = cdms;
                    do {
                        if (streamspace(cdrs) + cdrs->relocationsize <= sizeof(CHUNKHDR))
                            goto done;
                    } while ((cdrs = cdrs->nextstream) != 0);
                    cdrs = cdms;
                    do {
                        ((CHUNKHDR *)cdrs->header)->type = -3;
                        ((CHUNKHDR *)cdrs->header)->size = 8;
                        cdrs->header += 8;
                        cdrs->write = cdrs->header;
                    } while ((cdrs = cdrs->nextstream) != 0);
                }
                cdms->state = 7;
            } else
                cdms->state = 3;
            break;
        }
    }
done:
    cdms->status = 0;
    return;
full:
    if (cdms != 0)
        cdms->streamfull = 1;
    if (cdrs != 0)
        cdrs->streamfull = 1;
}

void releasechunks(CDSTREAM *s)
{
    while (s->release != s->get) {
        if (s->release == s->header)
            break;
        if (*(int *)s->release == -2) {
            s->releasestatus += 8 - ((int *)s->release)[1];
            s->release = s->release + ((int *)s->release)[1];
        } else if (*(int *)s->release == -1) {
            if (s->release == s->get)
                s->get = s->start;
            s->release = s->start;
        } else
            break;
    }
}

int streamspace(CDSTREAM *s)
{
    releasechunks(s);
    if (s->release < s->write)
        return s->end - s->write;
    if (s->release == s->write && s->release == s->get)
        return s->end - s->write;
    return s->release - s->write;
}

int streamendspace(CDSTREAM *s)
{
    releasechunks(s);
    return s->end - s->write;
}

int streamstartspace(CDSTREAM *s)
{
    releasechunks(s);
    if (s->release <= s->write)
        return s->release - s->start;
    return 0;
}

CHUNKHDR *getstreamchunk(CDSTREAM *s)
{
    int size;
    CHUNKHDR *chunk;
    if (s == 0) {
        ABORTAT(2952)("getstreamchunk - STREAM POINTER IS NULL.\n");
        return 0;
    }
    if (s->head != 0) {
        switch (s->head->command) {
        case 11:
        case 13:
        case 20:
        case 23:
            return 0;
        }
    }
    if (s->state == 2 || s->state == 1)
        return 0;
    if (s->state == 14)
        return (CHUNKHDR *)-2;
    if (s->header == s->get)
        return 0;
    if (*(int *)s->get == -1) {
        s->get = s->start;
        if (s->header == s->get)
            return 0;
    }
    size = ((CHUNKHDR *)s->get)->size;
    if (s->header < s->get) {
        if (s->end - s->get < size)
            return 0;
    } else if (s->header - s->get < size)
        return 0;
    chunk = (CHUNKHDR *)s->get;
    s->getstatus += 8 - size;
    s->releasestatus += size - 8;
    s->get = s->get + size;
    if (chunk->type == -3) {
        if (s->release == (char *)chunk)
            s->release = s->get;
        else
            chunk->type = -2;
        chunk = (CHUNKHDR *)-1;
    }
    return chunk;
}

void releasestreamchunk(CDSTREAM *s, CHUNKHDR *chunk)
{
    chunk->type = -2;
}

int streamgetstatus(CDSTREAM *s)
{
    if (s != 0)
        return s->getstatus;
    return 0;
}

int streamreleasestatus(CDSTREAM *s)
{
    if (s != 0)
        return s->releasestatus;
    return 0;
}

int streamidle(void)
{
    if (cdms == 0 || (cdms->state == 7 && cdms->head == 0))
        return 1;
    return 0;
}

void streamsetnotfull(void)
{
    CDSTREAM *s;
    for (s = cdms; s != 0; s = s->nextstream)
        s->streamfull = 0;
}

int streamfull(CDSTREAM *s)
{
    return s->streamfull;
}

int isendofstream(CDSTREAM *s, CHUNKHDR *chunk)
{
    int end = 0;
    if (chunk == (CHUNKHDR *)-1)
        end = 1;
    else if (chunk == 0 && streamidle() && streamgetstatus(s) == 0)
        end = 1;
    return end;
}

void setstreamcrc(void)
{
    if (cdms != 0)
        cdms->datahascrc = 1;
}

void clearstreamcrc(void)
{
    if (cdms != 0)
        cdms->datahascrc = 0;
}

void initstreamblocks(STREAMBLOCK *block, int count)
{
    int i;
    if (cdms != 0) {
        cdms->emptyblock = block;
        for (i = 0; i < count - 1; i++) {
            block->next = block + 1;
            block = block + 1;
        }
        block->next = 0;
    }
}

void putstreamblock(STREAMBLOCK *block)
{
    if (cdms != 0) {
        block->next = cdms->emptyblock;
        cdms->emptyblock = block;
    }
}

int checkstreamblocksfree(int count)
{
    STREAMBLOCK *block;
    if (cdms == 0)
        return 0;
    block = cdms->emptyblock;
    while (count != 0) {
        if (block == 0)
            break;
        count--;
        block = block->next;
    }
    return count == 0;
}

int streamblocksfree(void)
{
    int count = 0;
    STREAMBLOCK *block;
    if (cdms != 0)
        for (block = cdms->emptyblock; block != 0; block = block->next)
            count++;
    return count;
}

STREAMBLOCK *getstreamblocka(int abort)
{
    STREAMBLOCK *block;
    if (cdms == 0)
        return 0;
    if (cdms->emptyblock == 0) {
        if (abort == 0)
            return 0;
        ABORTAT(3411)("getstreamblock - NO STREAM BLOCKS LEFT\n");
    }
    block = cdms->emptyblock;
    cdms->emptyblock = cdms->emptyblock->next;
    block->next = 0;
    return block;
}
