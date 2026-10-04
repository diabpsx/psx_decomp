/* EACPSXZ ASYNC.C (retail __FILE__ "cmn/async.c") -- PSX asynchronous file
 * loader: a pool of 180-byte request blocks queued by index and serviced by the
 * CD block-handle reader state machine (localasyncreader), which is re-entered
 * from the async I/O task (PSXiasyncreader) and from the block-read completion
 * callback.  Twin leads: NFS2 PC beta eaclib async.c (API names, abort texts)
 * and NFS2 PSX cand/eaclib/async (144-byte request name); queue, block pool and
 * reader states are reconstructed from the retail bodies.  Static function names
 * PSXiasyncreader / internalupdateasyncqueue come from the retail SYM name
 * records.  Field names marked [inferred] are roles read off the code.
 * Toolchain identity (measured): PsyQ 3.6 CC1PSX 2.7.2.SN.1 -O2 -G8 + ASPSX 2.5x
 * default options (divide guard kept). */
#define LIBTEXT __attribute__((section(".text.lib")))

typedef struct ASYNCBLOCK {
    unsigned char name[0x8F];           /* 0x00 file name                          */
    char chunk[5];                      /* 0x8F chunk id + terminator              */
    int offset;                         /* 0x94 file / chunk offset                */
    int type;                           /* 0x98 1 chunk 2 file 3 file-at 4 seg 5 read */
    int memclass;                       /* 0x9C -1 = released                      */
    int size;                           /* 0xA0                                    */
    char *dest;                         /* 0xA4                                    */
    void *block;                        /* 0xA8 result (memblock or dest)          */
    int next;                           /* 0xAC queue / free-list link             */
    void (*callback)(int handle);       /* 0xB0                                    */
} ASYNCBLOCK;

typedef struct ASYNC {
    int numblocks;                      /* 0x000 */
    ASYNCBLOCK *blocks;                 /* 0x004 */
    int queue;                          /* 0x008 oldest queued request [inferred]  */
    int current;                        /* 0x00C request being serviced [inferred] */
    int last;                           /* 0x010 newest queued request [inferred]  */
    int freehead;                       /* 0x014 */
    int freetail;                       /* 0x018 */
    char asyncfile[0x8F];               /* 0x01C setasyncfile name                 */
    char openfile[0x91];                /* 0x0AB name of the open block handle     */
    int handle;                         /* 0x13C */
    int memclass;                       /* 0x140 */
    int state;                          /* 0x144 reader state 1..10                */
    int busy;                           /* 0x148 */
    int memmask;                        /* 0x14C */
    int remaining;                      /* 0x150 */
    int fileoffset;                     /* 0x154 */
    int filesize;                       /* 0x158 */
    char **memblock;                    /* 0x15C */
    char *dest;                         /* 0x160 */
    int seekstatus;                     /* 0x164 [inferred] */
    int f168;                           /* 0x168 */
    int header[2];                      /* 0x16C chunk header read by state 5      */
    int f174[4];                        /* 0x174 */
    int bytespermsec;                   /* 0x184 [inferred] */
} ASYNC;

extern char *abortfile;
extern int abortline;
extern void abortmessage(char *fmt, ...);
extern void dumpasync(void);
extern char *strncpy(char *dst, const char *src, int n);
extern int strcmp(const char *a, const char *b);
extern int stricmp(const char *a, const char *b);
extern void blockclear(void *adr, int size);
extern void *reservememadr(char *name, int size, int memclass);
extern void purgememadr(void *adr);
extern char **reservememblock(char *name, int size, int memclass);
extern void purgememblock(char **block);
extern void setasynciofuncs(void (*reader)(void), int (*status)(void));
extern int asyncopenblockhandle(char *name, int *handle, int *offset, int *size, int *blocksize);
extern char *blockhandlefile(int h);
extern void closeblockhandle(int h);
extern void asyncreadblockcallback(void (*func)(void));
extern int asyncreadblockhandle(int h, char *buf, int len);
extern int asyncseekblockhandle(int h, int offset);
extern int handlesector(int h);
extern int returnseekmsecs(int from, int to);
extern void topupstream(int msecs);
extern void signalstreamtopup(int flag);
extern void reserveioforstream(void);
extern int streamtoppedup(void);
extern void psxcdromstopread(void);
extern int asyncsector;

#define ABORT(line, msg) { abortfile = "cmn/async.c"; abortline = (line); abortmessage(msg); }
#define CUR (async.blocks[async.current])

ASYNC async;
volatile int curcancel = 0;            /* shared with the CD-callback reader path */

int asyncreadmsecs(int bytes) LIBTEXT;
int asyncstructsize(int numblocks) LIBTEXT;
void initasyncstruct(ASYNCBLOCK *blocks, int numblocks, int memclass) LIBTEXT;
void initasyncstructsize(ASYNCBLOCK *blocks, int size, int memclass) LIBTEXT;
void initasync(int numblocks, int memclass, int allocclass) LIBTEXT;
void delasyncstruct(void) LIBTEXT;
void delasync(void) LIBTEXT;
int asyncloadfilecallback(char *name, int memclass, void (*callback)(int)) LIBTEXT;
int asyncloadfile(char *name, int memclass) LIBTEXT;
int asyncloadfileatcallback(char *name, char *dest, void (*callback)(int)) LIBTEXT;
int asyncloadfileat(char *name, char *dest) LIBTEXT;
void setasyncfile(char *name) LIBTEXT;
int asyncloadchunkcallback(char *chunk, int offset, int memclass, void (*callback)(int)) LIBTEXT;
int asyncloadchunk(char *chunk, int offset, int memclass) LIBTEXT;
int asyncloadsegmentcallback(int offset, char *dest, int size, void (*callback)(int)) LIBTEXT;
int asyncloadsegment(int offset, char *dest, int size) LIBTEXT;
int asyncreadcallback(char *dest, int size, void (*callback)(int)) LIBTEXT;
int asyncread(char *dest, int size) LIBTEXT;
int getasyncstatus(void) LIBTEXT;
void cancelasyncload(int handle) LIBTEXT;
int asyncidle(void) LIBTEXT;
void asyncreader(void) LIBTEXT;
void asynctopupoverride(int msecs) LIBTEXT;
void localasyncreader(void) LIBTEXT;
static void PSXiasyncreader(void) LIBTEXT;
void *getasyncreadblock(int handle) LIBTEXT;
int getasyncreadstatus(int handle) LIBTEXT;
void initasyncblocks(ASYNCBLOCK *blocks, int numblocks) LIBTEXT;
void putasyncblock(int handle) LIBTEXT;
int getasyncblock(void) LIBTEXT;
static void internalupdateasyncqueue(void) LIBTEXT;

int asyncreadmsecs(int bytes)
{
    return bytes / async.bytespermsec;
}

int asyncstructsize(int numblocks)
{
    return numblocks * sizeof(ASYNCBLOCK);
}

void initasyncstruct(ASYNCBLOCK *blocks, int numblocks, int memclass)
{
    if (async.blocks) {
        ABORT(489, "initasync - ALREADY INITIALIZED.\n");
        return;
    }
    async.blocks = blocks;
    blockclear(blocks, numblocks * sizeof(ASYNCBLOCK));
    async.numblocks = numblocks;
    initasyncblocks(async.blocks, numblocks);
    async.state = 1;
    async.memmask = memclass & 0xFFFF800;
    async.bytespermsec = 270;
    async.current = -1;
    async.last = -1;
    async.queue = -1;
    async.asyncfile[0] = 0;
    async.openfile[0] = 0;
    async.handle = -1;
    async.busy = 0;
    curcancel = 0;
    setasynciofuncs(PSXiasyncreader, getasyncstatus);
}

void initasyncstructsize(ASYNCBLOCK *blocks, int size, int memclass)
{
    initasyncstruct(blocks, size / sizeof(ASYNCBLOCK), memclass);
}

void initasync(int numblocks, int memclass, int allocclass)
{
    if (async.blocks) {
        ABORT(524, "initasync - ALREADY INITIALIZED.\n");
        return;
    }
    initasyncstruct((ASYNCBLOCK *)reservememadr("ASYNCIO", asyncstructsize(numblocks), allocclass), numblocks, memclass);
}

void delasyncstruct(void)
{
    if (async.blocks == 0) {
        ABORT(592, "delasync - must initasync first!");
        return;
    }
    if (async.handle >= 0)
        closeblockhandle(async.handle);
    async.asyncfile[0] = 0;
    async.openfile[0] = 0;
    async.handle = -1;
    async.blocks = 0;
    async.current = -1;
    async.freetail = -1;
    async.freehead = -1;
    async.last = -1;
    async.queue = -1;
    setasynciofuncs(0, 0);
}

void delasync(void)
{
    ASYNCBLOCK *blocks = async.blocks;
    if (blocks == 0) {
        ABORT(617, "delasync - must initasync first!");
        return;
    }
    delasyncstruct();
    purgememadr(blocks);
}

int asyncloadfilecallback(char *name, int memclass, void (*callback)(int))
{
    int b;
    ASYNCBLOCK *req;
    if (async.blocks == 0)
        return -1;
    b = getasyncblock();
    req = &async.blocks[b];
    strncpy(req->name, name, 0x8F);
    req->next = -1;
    req->memclass = memclass;
    req->offset = 0;
    req->block = 0;
    req->type = 2;
    req->callback = callback;
    if (async.last >= 0) {
        async.blocks[async.last].next = b;
        async.last = b;
        if (async.current < 0)
            async.current = b;
    } else {
        async.current = b;
        async.last = b;
        async.queue = b;
    }
    return b;
}

int asyncloadfile(char *name, int memclass)
{
    return asyncloadfilecallback(name, memclass, 0);
}

int asyncloadfileatcallback(char *name, char *dest, void (*callback)(int))
{
    int b;
    ASYNCBLOCK *req;
    if (async.blocks == 0)
        return -1;
    b = getasyncblock();
    req = &async.blocks[b];
    strncpy(req->name, name, 0x8F);
    req->next = -1;
    req->memclass = 0;
    req->dest = dest;
    req->offset = 0;
    req->block = 0;
    req->type = 3;
    req->callback = callback;
    if (async.last >= 0) {
        async.blocks[async.last].next = b;
        async.last = b;
        if (async.current < 0)
            async.current = b;
    } else {
        async.current = b;
        async.last = b;
        async.queue = b;
    }
    return b;
}

int asyncloadfileat(char *name, char *dest)
{
    return asyncloadfileatcallback(name, dest, 0);
}

void setasyncfile(char *name)
{
    if (async.blocks == 0) {
        ABORT(852, "setasyncfile - must initasync first!");
        return;
    }
    strncpy(async.asyncfile, name, 0x8F);
}

int asyncloadchunkcallback(char *chunk, int offset, int memclass, void (*callback)(int))
{
    int b;
    ASYNCBLOCK *req;
    if (async.blocks == 0)
        return -1;
    b = getasyncblock();
    req = &async.blocks[b];
    strncpy(req->chunk, chunk, 4);
    req->chunk[4] = 0;
    strncpy(req->name, async.asyncfile, 0x8F);
    req->type = 1;
    req->memclass = memclass;
    req->offset = offset;
    req->block = 0;
    req->next = -1;
    req->callback = callback;
    if (async.last >= 0) {
        async.blocks[async.last].next = b;
        async.last = b;
        if (async.current < 0)
            async.current = b;
    } else {
        async.current = b;
        async.last = b;
        async.queue = b;
    }
    return b;
}

int asyncloadchunk(char *chunk, int offset, int memclass)
{
    return asyncloadchunkcallback(chunk, offset, memclass, 0);
}

int asyncloadsegmentcallback(int offset, char *dest, int size, void (*callback)(int))
{
    int b;
    ASYNCBLOCK *req;
    if (async.blocks == 0)
        return -1;
    b = getasyncblock();
    req = &async.blocks[b];
    strncpy(req->name, async.asyncfile, 0x8F);
    req->type = 4;
    req->memclass = 0;
    req->dest = dest;
    req->offset = offset;
    req->size = size;
    req->block = 0;
    req->next = -1;
    req->callback = callback;
    if (async.last >= 0) {
        async.blocks[async.last].next = b;
        async.last = b;
        if (async.current < 0)
            async.current = b;
    } else {
        async.current = b;
        async.last = b;
        async.queue = b;
    }
    return b;
}

int asyncloadsegment(int offset, char *dest, int size)
{
    return asyncloadsegmentcallback(offset, dest, size, 0);
}

int asyncreadcallback(char *dest, int size, void (*callback)(int))
{
    int b;
    ASYNCBLOCK *req;
    if (async.blocks == 0)
        return -1;
    b = getasyncblock();
    req = &async.blocks[b];
    strncpy(req->name, async.asyncfile, 0x8F);
    req->type = 5;
    req->memclass = 0;
    req->dest = dest;
    req->size = size;
    req->block = 0;
    req->next = -1;
    req->callback = callback;
    if (async.last >= 0) {
        async.blocks[async.last].next = b;
        async.last = b;
        if (async.current < 0)
            async.current = b;
    } else {
        async.current = b;
        async.last = b;
        async.queue = b;
    }
    return b;
}

int asyncread(char *dest, int size)
{
    return asyncreadcallback(dest, size, 0);
}

int getasyncstatus(void)
{
    return async.busy;
}

void cancelasyncload(int handle)
{
    ASYNCBLOCK *b;
    if (handle >= 0 && handle < async.numblocks) {
        b = &async.blocks[handle];
        if (b->block) {
            if (b->type == 1 || b->type == 2)
                purgememblock((char **)b->block);
            putasyncblock(handle);
        } else if (async.current == handle) {
            curcancel = 1;
            if (async.busy == 1)
                psxcdromstopread();
        } else
            putasyncblock(handle);
    }
}

int asyncidle(void)
{
    if (async.blocks == 0 || async.queue == -1)
        return 1;
    return 0;
}

void asyncreader(void)
{
    ABORT(1337, "asyncreader - THIS FUNCTION NO LONGER VALID.  CALL SYSTEMTASK INSTEAD.\n");
}

static int topupoverride = 0;

void asynctopupoverride(int msecs)
{
    if (topupoverride < msecs)
        topupoverride = msecs;
}

void localasyncreader(void)
{
    int blocksize;
    int msecs;
    void (*callback)(int);

    if (async.busy != 1)
        internalupdateasyncqueue();
restart:
    for (;;) {
        switch (async.state) {
        case 1:
            if (async.current >= 0) {
                while (CUR.memclass == -1 || CUR.block != 0) {
                    if (async.current < 0)
                        goto restart;
                    async.current = CUR.next;
                }
                if (async.current < 0)
                    continue;
                if (stricmp(CUR.name, async.openfile) != 0) {
                    if (async.handle >= 0 && (CUR.name[0] == 0 || strcmp(CUR.name, blockhandlefile(async.handle)) != 0)) {
                        async.openfile[0] = 0;
                        closeblockhandle(async.handle);
                        async.handle = -1;
                    }
                    if (CUR.name[0] != 0 && async.handle < 0) {
                        asyncopenblockhandle(CUR.name, &async.handle, &async.fileoffset, &async.filesize, &blocksize);
                        strncpy(async.openfile, CUR.name, 0x8F);
                    }
                }
                if (async.handle < 0)
                    ABORT(1395, "asyncreader - NO FILE OPEN\n");
                if (CUR.type == 2) {
                    asyncseekblockhandle(async.handle, async.fileoffset);
                    async.seekstatus = 0;
                    async.memblock = reservememblock(CUR.name, async.filesize, CUR.memclass);
                    async.state = 3;
                    async.remaining = async.filesize;
                } else if (CUR.type == 1) {
                    async.seekstatus = asyncseekblockhandle(async.handle, CUR.offset + async.fileoffset);
                    async.memclass = CUR.memclass;
                    async.state = 2;
                } else if (CUR.type == 3) {
                    async.seekstatus = asyncseekblockhandle(async.handle, async.fileoffset);
                    async.dest = CUR.dest;
                    async.remaining = async.filesize;
                    async.state = 4;
                    async.memclass = CUR.memclass;
                } else if (CUR.type == 4) {
                    async.seekstatus = asyncseekblockhandle(async.handle, CUR.offset + async.fileoffset);
                    async.dest = CUR.dest;
                    async.memclass = CUR.memclass;
                    async.remaining = CUR.size;
                    async.state = 4;
                } else if (CUR.type == 5) {
                    async.dest = CUR.dest;
                    async.memclass = CUR.memclass;
                    async.remaining = CUR.size;
                    async.state = 4;
                }
                async.f168 = 0;
            }
            async.busy = 0;
            if (async.current < 0)
                return;
            break;
        case 2:
            if (curcancel) {
                async.handle = -1;
                curcancel = 0;
                putasyncblock(async.current);
                async.state = 1;
                break;
            }
            if (topupoverride) {
                msecs = asyncreadmsecs(topupoverride);
                topupoverride = 0;
            } else
                msecs = asyncreadmsecs(0x800);
            topupstream(msecs + returnseekmsecs(asyncsector, handlesector(async.handle)));
            async.state = 5;
        case 5:
            if (curcancel) {
                curcancel = 0;
                signalstreamtopup(1);
                reserveioforstream();
                async.handle = -1;
                putasyncblock(async.current);
                async.state = 1;
                break;
            }
            if (streamtoppedup()) {
                async.busy = 1;
                async.state = 8;
                asyncreadblockcallback(localasyncreader);
                asyncreadblockhandle(async.handle, (char *)async.header, 8);
            }
            return;
        case 8:
            if (curcancel) {
                curcancel = 0;
                async.handle = -1;
                putasyncblock(async.current);
                async.state = 1;
                reserveioforstream();
                if (async.busy == 1) {
                    async.busy = 0;
                    return;
                }
                break;
            }
            async.remaining = async.header[1] - 8;
            async.memblock = reservememblock(CUR.name, async.remaining, async.memclass);
            async.f168 = 0;
            async.state = 3;
        case 3:
            if (async.remaining > 0) {
                if (curcancel) {
                    curcancel = 0;
                    purgememblock(async.memblock);
                    putasyncblock(async.current);
                    async.state = 1;
                    reserveioforstream();
                    if (async.busy == 1) {
                        async.busy = 0;
                        return;
                    }
                    break;
                }
                if (topupoverride) {
                    msecs = asyncreadmsecs(topupoverride);
                    topupoverride = 0;
                } else
                    msecs = asyncreadmsecs(async.remaining);
                topupstream(msecs + returnseekmsecs(asyncsector, handlesector(async.handle)));
                async.state = 6;
            }
        case 6:
            if (async.remaining > 0) {
                if (curcancel) {
                    curcancel = 0;
                    purgememblock(async.memblock);
                    putasyncblock(async.current);
                    async.state = 1;
                    signalstreamtopup(1);
                    reserveioforstream();
                    if (async.busy == 1) {
                        async.busy = 0;
                        return;
                    }
                    break;
                }
                if (streamtoppedup()) {
                    async.busy = 1;
                    async.state = 9;
                    asyncreadblockcallback(localasyncreader);
                    asyncreadblockhandle(async.handle, *async.memblock, async.remaining);
                    return;
                }
                async.busy = 0;
                return;
            }
        case 9:
            callback = CUR.callback;
            if (curcancel) {
                curcancel = 0;
                purgememblock(async.memblock);
                putasyncblock(async.current);
                async.state = 1;
                reserveioforstream();
            } else {
                CUR.block = async.memblock;
                async.state = 1;
                reserveioforstream();
                if (callback) {
                    callback(async.current);
                    putasyncblock(async.current);
                }
            }
            async.busy = 0;
            return;
        case 4:
            if (async.remaining > 0) {
                if (curcancel) {
                    curcancel = 0;
                    putasyncblock(async.current);
                    async.state = 1;
                    reserveioforstream();
                    break;
                }
                async.busy = 0;
                if (topupoverride) {
                    msecs = asyncreadmsecs(topupoverride);
                    topupoverride = 0;
                } else
                    msecs = asyncreadmsecs(async.remaining);
                topupstream(msecs + returnseekmsecs(asyncsector, handlesector(async.handle)));
                async.state = 7;
            }
        case 7:
            if (async.remaining > 0) {
                if (curcancel) {
                    curcancel = 0;
                    putasyncblock(async.current);
                    async.state = 1;
                    signalstreamtopup(1);
                    reserveioforstream();
                    break;
                }
                if (streamtoppedup()) {
                    async.busy = 1;
                    async.state = 10;
                    asyncreadblockcallback(localasyncreader);
                    asyncreadblockhandle(async.handle, async.dest, async.remaining);
                }
                return;
            }
        case 10:
            callback = CUR.callback;
            if (curcancel) {
                curcancel = 0;
                putasyncblock(async.current);
                async.state = 1;
                reserveioforstream();
                async.busy = 0;
                return;
            }
            CUR.block = async.dest;
            async.state = 1;
            reserveioforstream();
            if (callback) {
                callback(async.current);
                putasyncblock(async.current);
            }
            async.busy = 0;
            return;
        }
    }
}

static void PSXiasyncreader(void)
{
    if (async.busy != 1 && async.blocks)
        localasyncreader();
}

void *getasyncreadblock(int handle)
{
    void *block = 0;
    if (handle < 0 || handle >= async.numblocks) {
        ABORT(2049, "getasyncreadblock - invalid handle");
        return 0;
    }
    if (async.blocks[handle].memclass != -1) {
        block = async.blocks[handle].block;
        if (block)
            putasyncblock(handle);
    }
    return block;
}

int getasyncreadstatus(int handle)
{
    if (handle < 0 || handle >= async.numblocks) {
        ABORT(2123, "getasyncreadstatus - invalid handle");
        return 0;
    }
    if (async.blocks[handle].memclass == -1)
        return 0;
    if (async.blocks[handle].block == 0)
        return 0;
    putasyncblock(handle);
    return 1;
}

void initasyncblocks(ASYNCBLOCK *blocks, int numblocks)
{
    int i;
    for (i = 0; i < numblocks - 1; i++)
        blocks[i].next = i + 1;
    async.freehead = 0;
    blocks[numblocks - 1].next = -1;
    async.freetail = numblocks - 1;
    async.current = -1;
    async.last = -1;
    async.queue = -1;
}

void putasyncblock(int handle)
{
    if (handle < 0 || handle >= async.numblocks) {
        ABORT(2155, "putasyncblock - invalid block number");
        return;
    }
    async.blocks[handle].memclass = -1;
}

int getasyncblock(void)
{
    int b = async.freehead;
    if (b < 0) {
        dumpasync();
        ABORT(2173, "getasyncblock - NO ASYNC BLOCKS LEFT\n");
        return -1;
    }
    async.freehead = async.blocks[async.freehead].next;
    if (async.freehead < 0) {
        dumpasync();
        ABORT(2183, "getasyncblock - LAST BLOCK USED\n");
    }
    blockclear(&async.blocks[b], sizeof(ASYNCBLOCK));
    return b;
}

static void internalupdateasyncqueue(void)
{
    int i = async.queue;
    int prev = -1;
    while (i >= 0) {
        if (async.blocks[i].memclass < 0) {
            if (i == async.queue) {
                async.queue = async.blocks[i].next;
                async.blocks[i].next = -1;
                async.blocks[async.freetail].next = i;
                async.freetail = i;
                if (async.queue < 0) {
                    async.current = -1;
                    async.last = -1;
                }
                if (async.current == i)
                    async.current = async.queue;
                i = async.queue;
            } else if (i == async.last) {
                async.blocks[prev].next = -1;
                async.last = prev;
                async.blocks[i].next = -1;
                async.blocks[async.freetail].next = i;
                async.freetail = i;
                i = -1;
            } else {
                async.blocks[prev].next = async.blocks[i].next;
                async.blocks[i].next = -1;
                async.blocks[async.freetail].next = i;
                async.freetail = i;
                i = async.blocks[prev].next;
            }
        } else {
            prev = i;
            i = async.blocks[i].next;
        }
    }
}
