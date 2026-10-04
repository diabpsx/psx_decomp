/* EACPSXZ psx/cdrom.c -- CD-ROM sector access, async read engine and ISO-9660
 * directory lookup over PsyQ LIBCD.  Retail abort strings name "psx/cdrom.c";
 * no source twin exists for the PSX member (the NFS2 PC beta cdrom.c is the
 * Win32 variant).  Reconstructed from the retail oracle; names of globals and
 * file statics come from the retail SYM name records. */
#define LIBTEXT __attribute__((section(".text.lib")))

typedef struct {
    unsigned char minute;
    unsigned char second;
    unsigned char sector;
    unsigned char track;
} CdlLOC;

typedef struct {
    char name[12];
    int sector;
    int size;
} DIRCACHE;

#define btoi(b) ((b) / 16 * 10 + (b) % 16)
#define itob(i) ((i) / 10 * 16 + (i) % 10)

extern char *abortfile;
extern int abortline;
extern void abortmessage(char *fmt, ...);
extern int printf(const char *fmt, ...);
extern char *strncpy(char *, const char *, int);
extern int strncmp(const char *, const char *, int);
extern int strlen(const char *);
extern int toupper(int);
extern void initgp(void);
extern void savegp_ci(unsigned int *out);
extern void restoregp(unsigned int value);
extern void _96_remove(void);
extern int CdInit(void);
extern int CdSetDebug(int level);
extern int CdGetToc(CdlLOC *loc);
extern int CdSync(int mode, unsigned char *result);
extern int CdControl(unsigned char com, unsigned char *param, unsigned char *result);
extern int CdControlB(unsigned char com, unsigned char *param, unsigned char *result);
extern void *CdReadyCallback(void (*func)(int, unsigned char *));
extern int CdGetSector(void *madr, int size);
extern int CdDataSync(int mode);
extern void CdFlush(void);
extern int VSync(int mode);
extern int geti(unsigned char *p, int n);
extern int getcycle(void);
extern void addtimer(void (*func)(void));
extern void deltimer(void (*func)(void));
extern void *reservememadr(char *name, int size, int flags);
extern void blockclear(void *dst, int len);
extern void blockmove(void *src, void *dst, int len);
extern volatile int cdreaddone;
extern void *async_iotaskptr;
extern void *streamer_iotaskptr;

int cachefiles = 0;
int cdrominitflag = 0;
volatile int asynctimerflag = 0;
volatile int asynctimeout = 0;
volatile int cdreadybusy = 0;
volatile int cdtimeoutcount = 0;
volatile int cderrorcount = 0;
volatile int cdreentcount = 0;
volatile int cdsectorreseek = 0;
volatile int cdcallbacks = 0;
volatile int asyncreadreq = 0;
volatile int asyncpausereq = 0;
void (*direntrycallbackfunc)(void) = 0;
volatile int cdcallbacktime = 0;

char cdb[0x2000];
unsigned char cdrombuf[0x800];
char *cdrombufadr[4] = { cdb, cdb + 0x800, cdb + 0x1000, cdb + 0x1800 };
static int cdrombufsector[4];

volatile int datatracksector;
volatile int asyncsector;
int rootsector;
int rootlength;
volatile int currentsector;
volatile int asyncsectors;
char *asyncmemadr;
void (*asyncreadcallbackfunc)(int);
CdlLOC asyncloc;
DIRCACHE *cachefile;

static void (*oldasyncreadcallback)(int);
static int *pSector;
static int *pFileSize;
static int iSsector;
static int iSlength;
static char sName[13];

int timetosector(CdlLOC *loc) LIBTEXT;
void sectortotime(CdlLOC *loc, int sector) LIBTEXT;
int initpsxcdrom(void) LIBTEXT;
void closecdrom(void) LIBTEXT;
void psxcdromseek(int sector) LIBTEXT;
void readdonecallback(int status) LIBTEXT;
void psxcdromread(void *buf, int sectors) LIBTEXT;
void psxcdromasyncseek(int sector) LIBTEXT;
void setasyncreadcallback(void (*func)(int)) LIBTEXT;
void psxcdromasyncpause(void) LIBTEXT;
void asyncinitread(void) LIBTEXT;
void asynctimer(void) LIBTEXT;
void psxcdromstopread(void) LIBTEXT;
void Iasyncreadcallback(int intr, unsigned char *result) LIBTEXT;
void psxcdromasyncread(char *buf, int sectors) LIBTEXT;
unsigned char *parsedir(unsigned char *path, char *dir, int max) LIBTEXT;
char *basefilename(char *name) LIBTEXT;
void setdirectorycache(DIRCACHE *cache, int files) LIBTEXT;
void initdirectorycache(int files) LIBTEXT;
void cachedirectoryentry(char *name, int sector, int size) LIBTEXT;
int directoryentrycached(char *name, int *sector, int *size) LIBTEXT;
void cdromdirectoryentry(char *name, int *sector, int *size) LIBTEXT;
void setdirentrycallback(void (*func)(void)) LIBTEXT;
static void asyncdirentrycallback(int status) LIBTEXT;
void asyncdirentry(char *name, int *sector, int *size) LIBTEXT;

int timetosector(CdlLOC *loc)
{
    int sector;

    sector = btoi(loc->minute) * 60;
    sector += btoi(loc->second);
    sector *= 75;
    sector += btoi(loc->sector);
    return sector;
}

void sectortotime(CdlLOC *loc, int sector)
{
    loc->sector = sector % 75;
    loc->second = sector / 75 % 60;
    loc->track = 0;
    loc->minute = sector / 75 / 60;
    loc->sector = itob(loc->sector);
    loc->second = itob(loc->second);
    loc->minute = itob(loc->minute);
}

int initpsxcdrom(void)
{
    CdlLOC loc;
    unsigned char result[16];
    unsigned char mode[8];
    CdlLOC *toc;

    if (cdrominitflag == 0) {
        initgp();
        _96_remove();
        CdInit();
        CdSetDebug(0);
        toc = (CdlLOC *)cdrombuf;
        toc->second = 0xff;
        if (CdGetToc(toc) == 0)
            return 0;
        while (toc->second == 0xff)
            ;
        loc.minute = toc[1].minute;
        loc.second = toc[1].second;
        loc.sector = 0x16;
        loc.track = 0;
        datatracksector = timetosector(&toc[1]);
        asyncsector = timetosector(&loc);
        mode[0] = 0xa0;
        do {
            CdSync(0, 0);
            CdControlB(0x0e, mode, result);
        } while (result[0] & 1);
        VSync(3);
        psxcdromseek(asyncsector - datatracksector);
        psxcdromread(cdrombuf, 1);
        rootsector = geti(cdrombuf + 0x9e, 4);
        rootlength = geti(cdrombuf + 0xa6, 4);
        cdrominitflag = 1;
    }
    return 1;
}

void closecdrom(void)
{
    if (cdrominitflag)
        cdrominitflag = 0;
}

void psxcdromseek(int sector)
{
    psxcdromasyncseek(sector);
}

void readdonecallback(int status)
{
    cdreaddone = 1;
}

void psxcdromread(void *buf, int sectors)
{
    void (*oldcallback)(int) = asyncreadcallbackfunc;

    cdreaddone = 0;
    setasyncreadcallback(readdonecallback);
    psxcdromasyncread((char *)buf, sectors);
    while (cdreaddone == 0)
        ;
    setasyncreadcallback(oldcallback);
    if (asynctimerflag) {
        deltimer(asynctimer);
        asynctimerflag = 0;
    }
}

void psxcdromasyncseek(int sector)
{
    unsigned char result[16];
    unsigned char mode[8];
    void *old;

    if (asynctimerflag == 0) {
        asynctimerflag = 1;
        addtimer(asynctimer);
    }
    asyncpausereq = 0;
    old = CdReadyCallback(Iasyncreadcallback);
    asyncsectors = 0;
    asyncsector = sector + datatracksector;
    if (old != Iasyncreadcallback) {
        mode[0] = 0xa0;
        do {
            CdSync(0, 0);
            CdControlB(0x0e, mode, result);
        } while (result[0] & 1);
        asyncinitread();
        asyncreadreq = 1;
    }
}

void setasyncreadcallback(void (*func)(int))
{
    if (asyncreadcallbackfunc && asyncreadcallbackfunc != func && asyncsectors) {
        abortfile = "psx/cdrom.c";
        abortline = 604;
        abortmessage("setasyncreadcallback - ILLEGAL ATTEMPT TO SWITCH CDROM CALLBACK WHILE\nREAD IS IN PROCESS.  %d SECTORS REMAIN TO BE READ.\nATTEMPTED TO SWITCH FROM FUNCTION @ %lx TO FUNCTION @ %lx\n",
                     asyncsector, asyncreadcallbackfunc, func);
    }
    asyncreadcallbackfunc = func;
}

void psxcdromasyncpause(void)
{
    asyncpausereq = 1;
    if (asynctimerflag) {
        deltimer(asynctimer);
        asynctimerflag = 0;
    }
}

void asyncinitread(void)
{
    unsigned char result[8];

    asynctimeout = 800;
    asyncreadreq = 1;
    CdFlush();
    CdSync(0, 0);
    sectortotime(&asyncloc, asyncsector);
    CdControl(0x1b, (unsigned char *)&asyncloc, result);
    currentsector = asyncsector;
}

void asynctimer(void)
{
    unsigned char result[8];
    unsigned char mode[8];

    if (asynctimeout) {
        asynctimeout--;
        if (asynctimeout == 0) {
            cdtimeoutcount++;
            if (asyncreadreq == 0)
                cdcallbacks = 0;
            mode[0] = 0xa0;
            do {
                CdSync(0, 0);
                CdControlB(0x0e, mode, result);
            } while (result[0] & 1);
            asyncinitread();
        }
    }
}

void psxcdromstopread(void)
{
    asyncsectors = 0;
    asyncreadcallbackfunc(0);
}

void Iasyncreadcallback(int intr, unsigned char *result)
{
    unsigned long header[3];
    unsigned long tail[0x46];
    unsigned int savedgp;
    int i;

    savegp_ci(&savedgp);
    cdcallbacks++;
    if (asyncpausereq && asyncsectors == 0) {
        CdReadyCallback(0);
        restoregp(savedgp);
        return;
    }
    if (++cdreadybusy != 1) {
        if (intr == 1)
            cdreentcount++;
        asynctimeout = 400;
        restoregp(savedgp);
        return;
    }
    if (intr == 1) {
        if (asyncsectors) {
            cdcallbacktime = getcycle();
            CdGetSector(header, 3);
            CdGetSector(asyncmemadr, 0x200);
            CdGetSector(&header[3], 0x46);
            CdDataSync(0);
            cdcallbacktime = getcycle() - cdcallbacktime;
            if (cdcallbacktime < 0)
                cdcallbacktime += 0x10000;
            if (timetosector((CdlLOC *)header) == asyncsector) {
                asyncsectors--;
                asyncsector++;
                currentsector++;
                asyncmemadr += 0x800;
                if (asyncsectors <= 0)
                    asyncreadcallbackfunc(0);
                asynctimeout = 400;
                asyncreadreq = 0;
            } else {
                if (asyncreadreq == 0)
                    asyncinitread();
                else
                    asyncreadreq = 0;
                cdsectorreseek++;
            }
        } else {
            for (i = 0; i < 4; i++)
                if (cdrombufsector[i] == 0)
                    break;
            if (i < 4) {
                CdGetSector(header, 3);
                CdGetSector(cdrombufadr[i], 0x200);
                CdGetSector(&header[3], 0x46);
                CdDataSync(0);
                cdrombufsector[i] = timetosector((CdlLOC *)header);
                currentsector++;
            } else if (asyncreadreq == 0) {
                asynctimeout = 800;
                CdFlush();
                CdSync(0, 0);
                sectortotime(&asyncloc, currentsector);
                CdControl(0x1b, (unsigned char *)&asyncloc, (unsigned char *)header);
            } else
                asyncreadreq = 0;
            asynctimeout = 0;
        }
    } else if (intr == 5) {
        cderrorcount++;
        if (asyncreadreq == 0)
            asyncinitread();
        else
            asyncreadreq = 0;
    }
    CdReadyCallback(Iasyncreadcallback);
    cdreadybusy = 0;
    restoregp(savedgp);
}

void psxcdromasyncread(char *buf, int sectors)
{
    int i;

    if ((int)buf & 3) {
        abortfile = "psx/cdrom.c";
        abortline = 943;
        abortmessage("psxcdromasyncread - ASYNC SECTOR READS MUST BE ALIGNED\n");
    }
    if (asynctimerflag == 0) {
        asynctimerflag = 1;
        addtimer(asynctimer);
    }
    do {
        for (i = 0; i < 4; i++)
            if (cdrombufsector[i] == asyncsector)
                break;
        if (i == 4) {
            CdDataSync(0);
            for (i = 3; i >= 0; i--)
                cdrombufsector[i] = 0;
            goto notbuffered;
        }
        CdDataSync(0);
        blockmove(cdrombufadr[i], buf, 0x800);
        buf += 0x800;
        sectors--;
        cdrombufsector[i] = 0;
        asyncsector++;
    } while (sectors > 0);
    asyncmemadr = buf;
    asyncsectors = sectors;
    asyncreadcallbackfunc(0);
    return;
notbuffered:
    asyncmemadr = buf;
    asyncsectors = sectors;
    if (sectors)
        asynctimeout = 800;
}

unsigned char *parsedir(unsigned char *path, char *dir, int max)
{
    int n;
    unsigned char c;

    n = 0;
    while (*path && n < max) {
        c = *path++;
        if (c == ':')
            n = 0;
        else if (c == '/' || c == '\\') {
            if (n)
                break;
        } else
            dir[n++] = toupper(c);
    }
    dir[n] = 0;
    return path;
}

char *basefilename(char *name)
{
    unsigned char *base;
    unsigned char *p;

    base = (unsigned char *)name;
    p = (unsigned char *)name;
    while (*p) {
        if (*p == '\\' || *p == ':' || *p == '/')
            base = p + 1;
        *p = toupper(*p);
        p++;
    }
    return (char *)base;
}

void setdirectorycache(DIRCACHE *cache, int files)
{
    cachefiles = files;
    cachefile = cache;
}

void initdirectorycache(int files)
{
    if (cachefiles == 0) {
        cachefiles = files;
        cachefile = (DIRCACHE *)reservememadr("DIR CACHE", files * 20, 0x20);
    }
    blockclear(cachefile, files * 20);
}

void cachedirectoryentry(char *name, int sector, int size)
{
    char *base;
    int i;

    base = basefilename(name);
    for (i = 0; i < cachefiles; i++) {
        if (cachefile[i].sector == sector)
            return;
        if (cachefile[i].sector == 0)
            break;
    }
    if (i < cachefiles) {
        strncpy(cachefile[i].name, base, 12);
        cachefile[i].sector = sector;
        cachefile[i].size = size;
    }
}

int directoryentrycached(char *name, int *sector, int *size)
{
    char *base;
    int i;

    base = basefilename(name);
    for (i = 0; i < cachefiles; i++) {
        if (cachefile[i].sector == 0)
            return 0;
        if (strncmp(base, cachefile[i].name, 12) == 0) {
            *sector = cachefile[i].sector;
            *size = cachefile[i].size;
            return 1;
        }
    }
    return 0;
}

void cdromdirectoryentry(char *name, int *sector, int *size)
{
    unsigned char dirname[16];
    unsigned char entryname[16];
    int len;
    char *p;
    int cursector;
    int remaining;
    int found;
    int off;
    unsigned char *rec;
    int namelen;
    int i;
    unsigned char *buf;

    *sector = 0;
    *size = 0;
    p = name;
    cursector = rootsector;
    remaining = rootlength;
    buf = cdrombuf;
    if (directoryentrycached(p, sector, size))
        return;
    if (async_iotaskptr && streamer_iotaskptr)
        printf("\ncdromdirectoryentry - CACHE MISS ON %s\n                      WHEN STREAMER AND ASYNC RUNNING.\n                      DIRECTORY MUST BE CACHED IN ORDER\n                      TO LOAD FILES WHILE STREAMING\n", p);
    for (;;) {
        p = (char *)parsedir((unsigned char *)p, (char *)dirname, 12);
        if (dirname[0] == 0)
            break;
        len = strlen((char *)dirname);
        found = 0;
        do {
            psxcdromseek(cursector++);
            psxcdromread(cdrombuf, 1);
            for (off = 0; off < 0x800; off += rec[0]) {
                rec = buf + off;
                if (rec[0] == 0)
                    break;
                if ((rec[0xa] | rec[0xb] << 8 | rec[0xc] << 16 | rec[0xd] << 24) == 0)
                    break;
                if (rec[0x19] & 0x80)
                    break;
                namelen = rec[0x20];
                for (i = 0; i < namelen; i++)
                    if ((rec + i)[0x21] == ';')
                        namelen = i;
                for (i = 0; i < namelen; i++)
                    entryname[i] = toupper((rec + i)[0x21]);
                entryname[namelen] = 0;
                if (entryname[0] >= 2 && !(rec[0x19] & 2))
                    cachedirectoryentry((char *)entryname, geti(rec + 2, 4), geti(rec + 0xa, 4));
                if (namelen == len && strncmp((char *)entryname, (char *)dirname, namelen) == 0) {
                    cursector = geti(rec + 2, 4);
                    if (rec[0x19] & 2)
                        remaining = geti(rec + 0xa, 4);
                    found = 1;
                    break;
                }
            }
        } while (!found && (remaining -= 0x800) > 0);
        if (!found)
            return;
    }
    *size = geti(rec + 0xa, 4);
    *sector = cursector;
}

void setdirentrycallback(void (*func)(void))
{
    direntrycallbackfunc = func;
}

static void asyncdirentrycallback(int status)
{
    unsigned char *buf;
    unsigned char dirname[16];      /* unused; retail frame keeps its slot (entryname at sp+0x20) */
    unsigned char entryname[16];
    int found;
    int off;
    unsigned char *rec;
    int namelen;
    int i;

    buf = cdrombuf;
    found = 0;
    off = 0;
    while (off < 0x800 && !found) {
        rec = buf + off;
        if (rec[0] == 0)
            break;
        if ((rec[0xa] | rec[0xb] << 8 | rec[0xc] << 16 | rec[0xd] << 24) == 0)
            break;
        if (rec[0x19] & 0x80)
            break;
        namelen = rec[0x20];
        for (i = 0; i < namelen; i++)
            if ((rec + i)[0x21] == ';')
                namelen = i;
        for (i = 0; i < namelen; i++)
            entryname[i] = toupper((rec + i)[0x21]);
        entryname[namelen] = 0;
        if (entryname[0] >= 2 && !(rec[0x19] & 2) && strncmp((char *)entryname, sName, 13) == 0) {
            *pSector = geti(rec + 2, 4);
            *pFileSize = geti(rec + 0xa, 4);
            found = 1;
        }
        off += rec[0];
    }
    iSlength -= 0x800;
    if (found) {
        setasyncreadcallback(oldasyncreadcallback);
        if (direntrycallbackfunc)
            direntrycallbackfunc();
    } else if (iSlength > 0) {
        psxcdromasyncseek(iSsector++);
        psxcdromasyncread((char *)cdrombuf, 1);
    }
}

void asyncdirentry(char *name, int *sector, int *size)
{
    pSector = sector;
    pFileSize = size;
    strncpy(sName, name, 13);
    iSsector = rootsector;
    iSlength = rootlength;
    oldasyncreadcallback = asyncreadcallbackfunc;
    setasyncreadcallback(asyncdirentrycallback);
    psxcdromasyncseek(iSsector++);
    psxcdromasyncread((char *)cdrombuf, 1);
}
