/* BIGLUMP.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/BIGLUMP.CPP).  No PC twin: the
 * LUMP.BIN / STREAMn.BIN file directory and the (async) EAC cd-file loader front end.
 * Sources: retail asm oracle (asm/nonmatchings/biglump) > SYM (scratch/tuinfo.py BIGLUMP.CPP)
 * > refs/skeleton drafts.  Retail assert strings/line literals kept verbatim. */
#include "diabpsx_types.h"
#include "psxsrc/biglump.h"

#define TRUE  1
#define FALSE 0
#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "psxsrc/BIGLUMP.CPP", line)

struct STREAM {   /* sizeof 20 */
    unsigned long Offset;   /* +0x0 */
    unsigned long Size;   /* +0x4 */
    unsigned char Name[12];   /* +0x8 */
};

struct STRHDR {   /* sizeof 20 */
    unsigned char Name[12];   /* +0x0 */
    unsigned long Offset;   /* +0xC */
    int Size;   /* +0x10 */
};

enum LANG_TYPE {
    LANG_NONE = 5,
    LANG_JAP = 4,
    LANG_SWEDISH = 3,
    LANG_GERMAN = 2,
    LANG_FRENCH = 1,
    LANG_ENGLISH = 0
};

/* ---- EA cd/file library (C) ---- */
extern "C" {
int fileexists(char *name);
unsigned long filesize(char *name);
void loadfileatadr(char *name, unsigned char *dest);
void FlushCache(void);
void initpsxcdrom(void);
int ResetCallback(void);
void inittimer(int hz);
void setdirectory(char *dir);
void blockclear(void *p, int size);
void setdirectorycache(void *cache, int n);
int cdromdirectoryentry(char *name, long *pos, long *size);
void initloadfilecallback(void);
void addsystemtask(void (*task)(int), int a, int b);
void ioreader(int);
void setasyncfile(char *name);
int asyncloadsegment(unsigned long pos, unsigned char *dest, int size);
int asyncloadsegmentcallback(unsigned long pos, unsigned char *dest, int size, void (*cb)(int));
int getasyncreadstatus(int ah);   /* int (EA lib): BL_AsyncReadFile keeps the raw status; BL_LoadFileAtAddr masks it */
void cancelasyncload(int ah);
void systemtask(int);
int asyncstructsize(int n);
void initasyncstruct(void *p, int n, int size);
unsigned long ReloadGP(void);
void SetGP(unsigned long gp);
void TSK_Sleep(int Frames);
long GAL_Alloc(unsigned long Size, unsigned long Type, char *Name);
void *GAL_Lock(long Handle);
unsigned char GAL_Unlock(long Handle);
unsigned char GAL_Free(long Handle);
void DBG_Error(char *Text, char *File, int Line);
int sprintf(char *buf, const char *fmt, ...);
int strcmp(const char *a, const char *b);
int strlen(const char *s);
extern int disablecd;
extern int timerhz;
}

void *Tmalloc(int Size);
void Tfree(void *p);
char *strupr(char *s);
LANG_TYPE LANG_GetLang(void);
extern unsigned char FeFlag;

/* ---- this TU's data (.data / .sdata / .sbss) ---- */
char STREAM_DIR[16];   /* @0x800B79A4 */
char STREAM_BIN[16];   /* @0x800B79B4 */
unsigned char EAC_DirectoryCache[400];   /* @0x800B79C4 */
unsigned long BL_NoLumpFiles;   /* @0x8011AB60 */
unsigned long BL_NoStreamFiles;   /* @0x8011AB64 */
STRHDR *LFileTab;   /* @0x8011AB68 */
STRHDR *SFileTab;   /* @0x8011AB6C */
volatile unsigned char FileLoaded = 1;   /* @0x8011AB70 */ /* callback-shared (AsyncLoadCallBack) */
unsigned char NoQuedAsyncs;   /* @0x8011AB71 */
unsigned char CurrAsync = 1;   /* @0x8011AB72 */

extern STRHDR *BL_MakeFilePosTab(unsigned char *BL_DirPtr, unsigned long NoStreamFiles);
extern STRHDR *BL_FindStreamFile(char *Name, char LumpID);
extern int BL_FileLength(char *Name, char LumpID);
extern BOOL BL_AsyncLoadDone(void);
extern void BL_WaitForAsyncFinish(void);
extern void BL_AsyncLoadCallBack(int ah);

void BL_InitEAC(void)
{
    long gunk1;
    long gunk2;
    void *ptr;

    NoQuedAsyncs = 0;
    CurrAsync = 1;
    disablecd = 0;
    FlushCache();
    ptr = EAC_DirectoryCache;
    if (!disablecd)
        initpsxcdrom();
    ResetCallback();
    inittimer(timerhz);
    if (!disablecd) {
        setdirectory("cdrom:");
        blockclear(ptr, 400);
        setdirectorycache(ptr, 20);
        cdromdirectoryentry("zzzzzz", &gunk1, &gunk2);
    } else {
        setdirectory("sim:");
    }
    initloadfilecallback();
    addsystemtask(ioreader, 0, 0);
}

long BL_ReadFile(char *Name, unsigned long RamId)
{
    int MemSize;
    char FileToLoad[50];
    long MyHnd;
    unsigned char *LoadAddr;

    if (!fileexists(Name))
        ASSERT(!"CANT FIND FILE", 0xA5);
    MemSize = filesize(Name);
    ASSERT(MemSize, 0xAA);
    MyHnd = GAL_Alloc(MemSize, RamId, NULL);
    ASSERT(MyHnd != -1, 0xAD);
    LoadAddr = (unsigned char *)GAL_Lock(MyHnd);
    ASSERT(MyHnd, 0xB0);
    loadfileatadr(Name, LoadAddr);
    ASSERT(GAL_Unlock(MyHnd), 0xB5);
    return MyHnd;
}

long BL_AsyncReadFile(char *Name, unsigned long RamId)
{
    int MemSize;
    char FileToLoad[50];
    long MyHnd;
    unsigned char *LoadAddr;
    int ah;

    if (!fileexists(Name))
        ASSERT(!"CANT FIND FILE", 0xCA);
    MemSize = filesize(Name);
    ASSERT(MemSize, 0xCF);
    MyHnd = GAL_Alloc(MemSize, RamId, NULL);
    ASSERT(MyHnd != -1, 0xD2);
    LoadAddr = (unsigned char *)GAL_Lock(MyHnd);
    ASSERT(MyHnd, 0xD5);
    setasyncfile(Name);
    ah = asyncloadsegment(0, LoadAddr, MemSize);
    do {
        systemtask(0);
        MemSize = getasyncreadstatus(ah);
        TSK_Sleep(1);
    } while (!(char)MemSize);
    cancelasyncload(ah);
    ASSERT(GAL_Unlock(MyHnd), 0xEB);
    return MyHnd;
}

void BL_LoadDirectory(void)
{
    long BL_DirMHandle;
    char *AsyncAddr;
    unsigned char *BL_DirPtr;
    unsigned long DirId = 0x5249444C;   /* 'LDIR' */
    unsigned long DirId2;

    BL_DirMHandle = BL_ReadFile("LUMP.DIR", 1);
    BL_DirPtr = (unsigned char *)GAL_Lock(BL_DirMHandle);
    ASSERT(BL_DirPtr, 0x106);
    DirId2 = ((unsigned long *)BL_DirPtr)[0];
    ASSERT(DirId2 == DirId, 0x109);
    BL_NoLumpFiles = ((unsigned long *)BL_DirPtr)[1];
    ASSERT(BL_NoLumpFiles, 0x10C);
    LFileTab = BL_MakeFilePosTab(BL_DirPtr + 8, BL_NoLumpFiles);
    ASSERT(GAL_Free(BL_DirMHandle), 0x113);
    AsyncAddr = (char *)Tmalloc(asyncstructsize(10));
    ASSERT(AsyncAddr, 0x118);
    initasyncstruct(AsyncAddr, 10, 0x3000);
}

void BL_LoadStreamDir(void)
{
    long BL_DirMHandle;
    unsigned char *BL_DirPtr;
    unsigned long DirId = 0x5249444C;   /* 'LDIR' */
    unsigned long DirId2;
    LANG_TYPE Lang;

    Lang = LANG_GetLang();
    switch (Lang) {
    case LANG_ENGLISH:
        sprintf(STREAM_DIR, "STREAM1.DIR");
        sprintf(STREAM_BIN, "STREAM1.BIN");
        break;
    case LANG_FRENCH:
        sprintf(STREAM_DIR, "STREAM2.DIR");
        sprintf(STREAM_BIN, "STREAM2.BIN");
        break;
    case LANG_GERMAN:
        sprintf(STREAM_DIR, "STREAM3.DIR");
        sprintf(STREAM_BIN, "STREAM3.BIN");
        break;
    case LANG_SWEDISH:
        sprintf(STREAM_DIR, "STREAM4.DIR");
        sprintf(STREAM_BIN, "STREAM4.BIN");
        break;
    case LANG_JAP:
        sprintf(STREAM_DIR, "STREAM5.DIR");
        sprintf(STREAM_BIN, "STREAM5.BIN");
        break;
    case LANG_NONE:
        ASSERT(!"NO LANGUAGE SELECTED ???", 0x152);
        break;
    }
    if (!FeFlag)
        BL_DirMHandle = BL_ReadFile(STREAM_DIR, 1);
    else
        BL_DirMHandle = BL_AsyncReadFile(STREAM_DIR, 1);
    BL_DirPtr = (unsigned char *)GAL_Lock(BL_DirMHandle);
    ASSERT(BL_DirPtr, 0x15F);
    DirId2 = ((unsigned long *)BL_DirPtr)[0];
    ASSERT(DirId2 == DirId, 0x162);
    BL_NoStreamFiles = ((unsigned long *)BL_DirPtr)[1];
    ASSERT(BL_NoStreamFiles, 0x165);
    BL_DirPtr += 8;
    if (SFileTab)
        Tfree(SFileTab);
    SFileTab = BL_MakeFilePosTab(BL_DirPtr, BL_NoStreamFiles);
    ASSERT(GAL_Free(BL_DirMHandle), 0x16E);
}

STRHDR *BL_MakeFilePosTab(unsigned char *BL_DirPtr, unsigned long NoStreamFiles)
{
    STREAM *DirPtr = (STREAM *)BL_DirPtr;

    if (!fileexists("LUMP.BIN"))
        ASSERT(!"CANT FIND BINARY LUMP", 0x180);
    STRHDR *TFileTab = (STRHDR *)Tmalloc((NoStreamFiles + 1) * sizeof(STRHDR));
    for (int i = 0; i < (int)NoStreamFiles; i++) {
        TFileTab[i + 1].Offset = DirPtr[i].Offset;
        TFileTab[i + 1].Size = DirPtr[i].Size;
        for (int j = 0; j < 12; j++)
            TFileTab[i + 1].Name[j] = DirPtr[i].Name[j];
    }
    return TFileTab;
}

STRHDR *BL_FindStreamFile(char *Name, char LumpID)
{
    STRHDR *ptr = NULL;
    unsigned long NoFiles = 0;
    int pos = 0;
    int c;
    char fname[14];
    int size = strlen(Name);

    if (LumpID != 0) {
        if (LumpID == 1) {
            ptr = LFileTab + 1;
            NoFiles = BL_NoLumpFiles;
        }
    } else {
        ptr = SFileTab + 1;
        NoFiles = BL_NoStreamFiles;
    }
    strupr(Name);
    for (int i = 0; i < size; i++) {
        if (Name[i] == '\\')
            pos = i + 1;
    }
    if (pos) {
        for (c = 0; c < size - pos; c++)
            Name[c] = Name[c + pos];
        Name[c] = 0;
    }
    for (int i = 13; i >= 0; i--)
        fname[i] = 0;
    for (int s = 0; s < (int)NoFiles; s++) {
        for (int i = 0; i < 12; i++)
            fname[i] = ptr->Name[i];
        if (!strcmp(Name, fname))
            return ptr;
        ptr++;
    }
    return NULL;
}

BOOL BL_FileExists(char *Name, char LumpID)
{
    if (LFileTab)
        return BL_FindStreamFile(Name, LumpID) != NULL;
    return fileexists(Name) != 0;
}

int BL_FileLength(char *Name, char LumpID)
{
    STRHDR *ptr;

    if (!LFileTab)
        return filesize(Name);
    ptr = BL_FindStreamFile(Name, LumpID);
    if (!ptr) {
        ptr = BL_FindStreamFile(Name, LumpID != 1);
        if (!ptr)
            return 0;
    }
    return ptr->Size;
}

BOOL BL_LoadFileAtAddr(char *Name, unsigned char *Dest, char LumpID)
{
    STRHDR *sh;
    int ah;

    if (!LFileTab) {
        if (fileexists(Name)) {
            loadfileatadr(Name, Dest);
            return TRUE;
        }
        return FALSE;
    }
    if (!BL_AsyncLoadDone())
        BL_WaitForAsyncFinish();
    sh = BL_FindStreamFile(Name, LumpID);
    if (!sh) {
        LumpID = LumpID != 1;
        sh = BL_FindStreamFile(Name, LumpID);
    }
    if (sh) {
        if (!Dest) {
            ASSERT(!"DEST POINTER NULL", 0x21A);
        } else {
            if (LumpID == 1)
                setasyncfile("LUMP.BIN");
            else
                setasyncfile(STREAM_BIN);
            ah = asyncloadsegment(sh->Offset + 4, Dest, sh->Size);
            do {
                systemtask(0);
            } while (!(unsigned char)getasyncreadstatus(ah));
            cancelasyncload(ah);
            return TRUE;
        }
    }
    return FALSE;
}

BOOL BL_AsyncLoadDone(void)
{
    return FileLoaded != 0;
}

void BL_WaitForAsyncFinish(void)
{
    while (!BL_AsyncLoadDone())
        TSK_Sleep(1);
    systemtask(0);
}

void BL_AsyncLoadCallBack(int ah)
{
    unsigned long OldGp = ReloadGP();
    FileLoaded++;
    CurrAsync++;
    cancelasyncload(ah);
    systemtask(0);
    SetGP(OldGp);
}

long BL_LoadFileAsync(char *Name, char LumpID)
{
    STRHDR *sh;
    int Size;
    long MyHnd;
    unsigned char *LoadAddr;

    Size = ++NoQuedAsyncs;
    while (CurrAsync != (unsigned char)Size)
        TSK_Sleep(1);
    if (!BL_AsyncLoadDone())
        BL_WaitForAsyncFinish();
    sh = BL_FindStreamFile(Name, LumpID);
    if (!sh)
        return -1;
    --FileLoaded;
    Size = BL_FileLength(Name, LumpID);
    ASSERT(Size, 0x2A4);
    MyHnd = GAL_Alloc(Size, 1, NULL);
    ASSERT(MyHnd != -1, 0x2A7);
    LoadAddr = (unsigned char *)GAL_Lock(MyHnd);
    ASSERT(MyHnd, 0x2AA);
    if (LumpID == 1)
        setasyncfile("LUMP.BIN");
    else
        setasyncfile(STREAM_BIN);
    asyncloadsegmentcallback(sh->Offset + 4, LoadAddr, sh->Size, BL_AsyncLoadCallBack);
    ASSERT(GAL_Unlock(MyHnd), 0x2B9);
    return MyHnd;
}

BOOL BL_AsyncLoadFileAtAddr(char *Name, unsigned char *Dest, char LumpID)
{
    STRHDR *sh;

    /* retail keeps the queue ticket in s0 -- the register sh takes next -- and the SYM lists no other local:
     * sh itself carries the ticket until it is reassigned (a separate int/uchar local adds a record) */
    sh = (STRHDR *)(int)++NoQuedAsyncs;
    while (CurrAsync != (unsigned char)(int)sh)
        TSK_Sleep(1);
    if (!BL_AsyncLoadDone())
        BL_WaitForAsyncFinish();
    sh = BL_FindStreamFile(Name, LumpID);
    if (!sh || !sh->Size)
        return FALSE;
    --FileLoaded;
    if (LumpID == 1)
        setasyncfile("LUMP.BIN");
    else
        setasyncfile(STREAM_BIN);
    asyncloadsegmentcallback(sh->Offset + 4, Dest, sh->Size, BL_AsyncLoadCallBack);
    return TRUE;
}

STRHDR *BL_OpenStreamFile(char *Name, char LumpID)
{
    STRHDR *sh = BL_FindStreamFile(Name, LumpID);
    if (!sh)
        return NULL;
    return sh;
}

BOOL BL_CloseStreamFile(STRHDR *StreamHDR)
{
    return StreamHDR != NULL;
}
