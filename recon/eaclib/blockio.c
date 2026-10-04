/* EACPSXZ psx/blockio.c -- block-handle I/O over CD-ROM sectors and host files.
 * No source twin for the PSX member (the NFS2 PC beta blockio.c is the Win32
 * variant); reconstructed from the retail oracle.  Retail abort strings name
 * "psx/blockio.c".  Field names of the handle record are inferred. */
#define LIBTEXT __attribute__((section(".text.lib")))

typedef struct {
    char name[12];      /* +00 basename (strncpy 12) */
    int type;           /* +0C 0 free, 1 cdrom, 2 host file, 3 async cdrom */
    int handle;         /* +10 host file handle */
    int lastsector;     /* +14 */
    int start;          /* +18 */
    int pos;            /* +1C byte position */
    int sector;         /* +20 first sector */
    int reserved;       /* +24 */
} BLOCKHANDLE;

extern char *abortfile;
extern int abortline;
extern void abortmessage(char *fmt, ...);
extern char *strcat(char *, const char *);
extern int strncmp(const char *, const char *, int);
extern char *strncpy(char *, const char *, int);
extern void getdirectory(char *dir);
extern void cdromdirectoryentry(char *name, int *sector, int *size);
extern int openhandlea(char *name, int *handle, int *offset, int *size, int abort);
extern void libclosehandle(int handle);
extern int readhandle(int handle, void *buf, int len);
extern int seekhandle(int handle, int offset);
extern void psxcdromseek(int sector);
extern int psxcdromread(void *buf, int sectors);
extern void psxcdromasyncseek(int sector);
extern int psxcdromasyncread(void *buf, int sectors);
extern void setasyncreadcallback(void (*func)(int));
extern void blockmove(void *src, void *dst, int len);

volatile BLOCKHANDLE libblockhandle[32] = {{{0}}};
int cdblocksize = 2048;
volatile int asyncblockstatus = 0;
int mb_blockio = 48;

int blockiosector;
char blockiobuffer[2048];
volatile int asyncblockhandle;
volatile int asyncblockoffset;
volatile int asyncstartbytes;
volatile int asyncblockbytes;
volatile int asyncendbytes;
volatile int asyncblockmove;
volatile char *asyncblockmemadr;
void (*asyncblockcallbackfunc)(void);

int handlesector(int h) LIBTEXT;
int openblockhandlea(char *name, int *handle, int *offset, int *size, int *blocksize, int abort) LIBTEXT;
int openblockhandle(char *name, int *handle, int *offset, int *size, int *blocksize) LIBTEXT;
int openblockhandlez(char *name, int *handle, int *offset, int *size, int *blocksize) LIBTEXT;
int asyncopenblockhandlea(char *name, int *handle, int *offset, int *size, int *blocksize, int abort) LIBTEXT;
int asyncopenblockhandlebysector(char *name, int sector, int size, int *handle, int *blocksize) LIBTEXT;
int asyncopenblockhandle(char *name, int *handle, int *offset, int *size, int *blocksize) LIBTEXT;
int asyncopenblockhandlez(char *name, int *handle, int *offset, int *size, int *blocksize) LIBTEXT;
char *blockhandlefile(int h) LIBTEXT;
void closeblockhandle(int h) LIBTEXT;
int readblockhandle(int h, char *buf, int len) LIBTEXT;
void asyncreadblockcallback(void (*func)(void)) LIBTEXT;
void blockreadcallback(int status) LIBTEXT;
int asyncreadblockhandle(int h, char *buf, int len) LIBTEXT;
int seekblockhandlea(int h, int offset, int abort) LIBTEXT;
int seekblockhandle(int h, int offset) LIBTEXT;
int seekblockhandlez(int h, int offset) LIBTEXT;
int asyncseekblockhandlea(int h, int offset, int abort) LIBTEXT;
int asyncseekblockhandle(int h, int offset) LIBTEXT;
int asyncseekblockhandlez(int h, int offset) LIBTEXT;

int handlesector(int h)
{
    return libblockhandle[h].sector;
}

int openblockhandlea(char *name, int *handle, int *offset, int *size, int *blocksize, int abort)
{
    int i;
    unsigned char *s;
    unsigned char *p;
    unsigned char filename[256];

    *handle = 0;
    *offset = 0;
    *size = 0;
    for (i = 1; i < 32; i++)
        if (libblockhandle[i].type == 0)
            break;
    if (i == 32) {
        if (abort) {
            abortfile = "psx/blockio.c";
            abortline = 224;
            abortmessage("openblockhandle - %s NO HANDLES LEFT\n", name);
        }
        return 0;
    }
    getdirectory((char *)filename);
    strcat((char *)filename, name);
    if (strncmp((char *)filename, "cdrom:", 6) == 0) {
        cdromdirectoryentry((char *)filename + 6, (int *)&libblockhandle[i].sector, size);
        if (*size == 0) {
            if (abort) {
                abortfile = "psx/blockio.c";
                abortline = 236;
                abortmessage("openblockhandle - %s FILE NOT FOUND\n", filename);
            }
            return 0;
        }
        libblockhandle[i].start = 0;
        libblockhandle[i].pos = -1;
        libblockhandle[i].type = 1;
        *blocksize = 2048;
        s = filename;
        p = filename;
        while (*p++)
            if (*p == '/' || *p == ':')
                s = p + 1;
        strncpy((char *)libblockhandle[i].name, (char *)s, 12);
        seekblockhandlea(i, libblockhandle[i].start, abort);
    } else {
        openhandlea(name, (int *)&libblockhandle[i].handle, offset, size, abort);
        libblockhandle[i].start = *offset;
        libblockhandle[i].type = 2;
        *blocksize = 1;
    }
    *handle = i;
    return (int)size;
}

int openblockhandle(char *name, int *handle, int *offset, int *size, int *blocksize)
{
    return openblockhandlea(name, handle, offset, size, blocksize, 1);
}

int openblockhandlez(char *name, int *handle, int *offset, int *size, int *blocksize)
{
    return openblockhandlea(name, handle, offset, size, blocksize, 0);
}

static int asyncactivehandle = -1;

int asyncopenblockhandlea(char *name, int *handle, int *offset, int *size, int *blocksize, int abort)
{
    int i;
    unsigned char *s;
    unsigned char *p;
    unsigned char filename[256];

    *handle = 0;
    *offset = 0;
    *size = 0;
    for (i = 1; i < 32; i++)
        if (libblockhandle[i].type == 0)
            break;
    if (i == 32) {
        if (abort) {
            abortfile = "psx/blockio.c";
            abortline = 356;
            abortmessage("asyncopenblockhandle - %s NO HANDLES LEFT\n", name);
        }
        return 0;
    }
    getdirectory((char *)filename);
    strcat((char *)filename, name);
    if (strncmp((char *)filename, "cdrom:", 6) == 0) {
        cdromdirectoryentry((char *)filename + 6, (int *)&libblockhandle[i].sector, size);
        if (*size == 0) {
            if (abort) {
                abortfile = "psx/blockio.c";
                abortline = 368;
                abortmessage("asyncopenblockhandle - %s FILE NOT FOUND\n", filename);
            }
            return 0;
        }
        libblockhandle[i].start = 0;
        libblockhandle[i].pos = 0;
        libblockhandle[i].lastsector = -1;
        libblockhandle[i].type = 3;
        *blocksize = 2048;
        s = filename;
        p = filename;
        while (*p++)
            if (*p == '/' || *p == ':')
                s = p + 1;
        strncpy((char *)libblockhandle[i].name, (char *)s, 12);
        asyncseekblockhandlea(i, libblockhandle[i].start, abort);
    } else {
        openhandlea(name, (int *)&libblockhandle[i].handle, offset, size, abort);
        libblockhandle[i].start = *offset;
        libblockhandle[i].type = 2;
        *blocksize = 1;
    }
    *handle = i;
    return *size;
}

int asyncopenblockhandlebysector(char *name, int sector, int size, int *handle, int *blocksize)
{
    int i;
    unsigned char *s;
    unsigned char *p;

    *handle = 0;
    for (i = 1; i < 32; i++)
        if (libblockhandle[i].type == 0)
            break;
    if (i == 32)
        return 0;
    libblockhandle[i].sector = sector;
    libblockhandle[i].start = 0;
    libblockhandle[i].pos = 0;
    libblockhandle[i].lastsector = -1;
    libblockhandle[i].type = 3;
    *blocksize = 2048;
    s = (unsigned char *)name;
    p = (unsigned char *)name;
    while (*p++)
        if (*p == '/' || *p == ':')
            s = p + 1;
    strncpy((char *)libblockhandle[i].name, (char *)s, 12);
    asyncseekblockhandlea(i, libblockhandle[i].start, 0);
    *handle = i;
    return size;
}

int asyncopenblockhandle(char *name, int *handle, int *offset, int *size, int *blocksize)
{
    return asyncopenblockhandlea(name, handle, offset, size, blocksize, 1);
}

int asyncopenblockhandlez(char *name, int *handle, int *offset, int *size, int *blocksize)
{
    return asyncopenblockhandlea(name, handle, offset, size, blocksize, 0);
}

char *blockhandlefile(int h)
{
    return (char *)libblockhandle[h].name;
}

void closeblockhandle(int h)
{
    if (libblockhandle[h].type == 2)
        libclosehandle(libblockhandle[h].handle);
    else if (asyncactivehandle == h)
        while (asyncblockstatus == 1)
            ;
    libblockhandle[h].type = 0;
}

int readblockhandle(int h, char *buf, int len)
{
    int left;
    int off;
    int sector;
    int n;
    int nsec;
    char *aligned;

    left = len;
    if (libblockhandle[h].type == 2)
        return readhandle(libblockhandle[h].handle, buf, len);
    off = libblockhandle[h].pos & 0x7ff;
    sector = libblockhandle[h].sector + (libblockhandle[h].pos >> 11);
    if (off) {
        n = 2048 - off;
        if (len < n)
            n = len;
        if (blockiosector != sector) {
            psxcdromseek(sector);
            psxcdromread(blockiobuffer, 1);
            blockiosector = sector;
        }
        blockmove(blockiobuffer + off, buf, n);
        libblockhandle[h].pos += n;
        buf += n;
        left = len - n;
    }
    n = left >> 11;
    psxcdromseek(libblockhandle[h].sector + (libblockhandle[h].pos >> 11));
    if (n) {
        if ((int)buf & 3) {
            nsec = n - 1;
            if (nsec) {
                aligned = (char *)(((int)buf + 3) & ~3);
                psxcdromread(aligned, nsec);
                blockmove(aligned, buf, nsec << 11);
            }
            sector = libblockhandle[h].sector + nsec + (libblockhandle[h].pos >> 11);
            psxcdromseek(sector);
            psxcdromread(blockiobuffer, 1);
            blockiosector = sector;
            blockmove(blockiobuffer, buf + (nsec << 11), 2048);
        } else
            psxcdromread(buf, n);
        n <<= 11;
        left -= n;
        buf += n;
        libblockhandle[h].pos += n;
    }
    if (left) {
        sector = libblockhandle[h].sector + (libblockhandle[h].pos >> 11);
        psxcdromseek(sector);
        psxcdromread(blockiobuffer, 1);
        blockiosector = sector;
        blockmove(blockiobuffer, buf, left);
        libblockhandle[h].pos += left;
    }
    return len;
}

void asyncreadblockcallback(void (*func)(void))
{
    if (asyncblockcallbackfunc && asyncblockcallbackfunc != func && asyncblockstatus == 1) {
        abortfile = "psx/blockio.c";
        abortline = 660;
        abortmessage("asyncreadblockcallback - ILLEGAL ATTEMPT TO SWITCH BLOCKIO CALLBACK WHILE\nREAD IS IN PROCESS.\nATTEMPTED TO SWITCH FROM FUNCTION @ %lx TO FUNCTION @ %lx\n", asyncblockcallbackfunc, func);
    }
    asyncblockcallbackfunc = func;
}

void blockreadcallback(int status)
{
    int sector;
    int nsec;
    volatile char *dst;

    if (asyncblockoffset) {
        blockiosector = libblockhandle[asyncblockhandle].sector + (libblockhandle[asyncblockhandle].pos >> 11);
        blockmove(blockiobuffer + asyncblockoffset, (char *)asyncblockmemadr, asyncstartbytes);
        asyncblockmemadr += asyncstartbytes;
        libblockhandle[asyncblockhandle].pos += asyncstartbytes;
        asyncstartbytes = 0;
        asyncblockoffset = 0;
    }
    if (asyncblockbytes) {
        sector = libblockhandle[asyncblockhandle].sector + (libblockhandle[asyncblockhandle].pos >> 11);
        nsec = asyncblockbytes >> 11;
        dst = asyncblockmemadr;
        asyncblockmemadr += asyncblockbytes;
        libblockhandle[asyncblockhandle].pos += asyncblockbytes;
        asyncblockbytes = 0;
        psxcdromasyncseek(sector);
        psxcdromasyncread((char *)dst, nsec);
    } else if (asyncendbytes) {
        asyncblockmove = asyncendbytes;
        asyncendbytes = 0;
        psxcdromasyncseek(libblockhandle[asyncblockhandle].sector + (libblockhandle[asyncblockhandle].pos >> 11));
        psxcdromasyncread(blockiobuffer, 1);
    } else {
        if (asyncblockmove) {
            blockiosector = libblockhandle[asyncblockhandle].sector + (libblockhandle[asyncblockhandle].pos >> 11);
            libblockhandle[asyncblockhandle].lastsector = libblockhandle[asyncblockhandle].pos >> 11;
            libblockhandle[asyncblockhandle].pos += asyncblockmove;
            blockmove(blockiobuffer, (char *)asyncblockmemadr, asyncblockmove);
        }
        asyncblockstatus = 0;
        asyncactivehandle = -1;
        if (asyncblockcallbackfunc)
            asyncblockcallbackfunc();
    }
}

int asyncreadblockhandle(int h, char *buf, int len)
{
    int sector;

    if (asyncblockstatus == 1) {
        abortfile = "psx/blockio.c";
        abortline = 721;
        abortmessage("asyncreadblockhandle - CONCURRENT ASYNC BLOCK IO NOT ALLOWED\nFILE %-12s CONFLICTED WITH ASYNC BLOCK IO OF %-12s\n",
                     libblockhandle[h].name, libblockhandle[asyncblockhandle].name);
        return 0;
    }
    if (libblockhandle[h].type == 2) {
        readhandle(libblockhandle[h].handle, buf, len);
        if (asyncblockcallbackfunc)
            asyncblockcallbackfunc();
    } else {
        asyncblockoffset = libblockhandle[h].pos & 0x7ff;
        sector = libblockhandle[h].sector + (libblockhandle[h].pos >> 11);
        if (asyncblockoffset) {
            asyncstartbytes = 2048 - asyncblockoffset;
            if (len < asyncstartbytes)
                asyncstartbytes = len;
            if (sector == blockiosector) {
                blockmove(blockiobuffer + asyncblockoffset, buf, asyncstartbytes);
                buf += asyncstartbytes;
                len -= asyncstartbytes;
                libblockhandle[h].pos += asyncstartbytes;
                if (len <= 0) {
                    if (asyncblockcallbackfunc)
                        asyncblockcallbackfunc();
                    return;
                }
                asyncblockoffset = 0;
                asyncstartbytes = 0;
            }
        } else
            asyncstartbytes = 0;
        len -= asyncstartbytes;
        asyncblockhandle = h;
        asyncblockbytes = len & ~0x7ff;
        asyncblockmemadr = buf;
        asyncactivehandle = h;
        len -= asyncblockbytes;
        asyncendbytes = len;
        asyncblockstatus = 1;
        asyncblockmove = 0;
        setasyncreadcallback(blockreadcallback);
        if (asyncblockoffset) {
            psxcdromasyncseek(sector);
            psxcdromasyncread(blockiobuffer, 1);
        } else
            blockreadcallback(0);
    }
    return 1;
}

int seekblockhandlea(int h, int offset, int abort)
{
    if (libblockhandle[h].type == 2) {
        seekhandle(libblockhandle[h].handle, offset);
        return 0;
    }
    libblockhandle[h].pos = libblockhandle[h].start + offset;
    blockiosector = -1;
    return libblockhandle[h].pos & 0x7ff;
}

int seekblockhandle(int h, int offset)
{
    return seekblockhandlea(h, offset, 1);
}

int seekblockhandlez(int h, int offset)
{
    return seekblockhandlea(h, offset, 0);
}

int asyncseekblockhandlea(int h, int offset, int abort)
{
    if (libblockhandle[h].type == 2) {
        seekhandle(libblockhandle[h].handle, offset);
        return 0;
    }
    libblockhandle[h].pos = libblockhandle[h].start + offset;
    blockiosector = -1;
    return libblockhandle[h].pos & 0x7ff;
}

int asyncseekblockhandle(int h, int offset)
{
    return asyncseekblockhandlea(h, offset, 1);
}

int asyncseekblockhandlez(int h, int offset)
{
    return asyncseekblockhandlea(h, offset, 0);
}
