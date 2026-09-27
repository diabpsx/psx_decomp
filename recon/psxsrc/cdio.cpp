/* CDIO.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the CD-ROM FileIO
 * back end.  Plain loads go through the BL_ block loader (async when CDWAIT allows it); streamed
 * files are read in 32K slices into the stream buffer and handed to a callback; saves go to the
 * PC link (PCopen/PCwrite). */
#include "diabpsx_types.h"

struct CdlLOC {   /* sizeof 4 */
    unsigned char minute, second, sector, track;
};

struct CdlFILE {   /* sizeof 24 */
    struct CdlLOC pos;
    unsigned long size;
    char name[16];
};

struct STRHDR {   /* sizeof 20 */
    unsigned char Name[12];
    unsigned long Offset;
    int Size;
};

struct SFXHDR {   /* sizeof 132; only mem is read here */
    unsigned char pad0[0x68];
    unsigned char *mem;
    unsigned char pad1[132 - 0x6C];
};

class SysObj {   /* sizeof 4 */
public:
    long MemHnd;
    void operator delete(void *ptr);
};

class FileIO : public SysObj {   /* sizeof 20 */
public:
    unsigned long MemId;
    long hndPath;
    char *SearchPath;

    FileIO(unsigned long OurMemId);
    virtual ~FileIO();
    virtual BOOL FileExists(const char *Name) = 0;
    virtual BOOL LoReadFileAtAddr(const char *Name, unsigned char *Dest, int Len) = 0;
    virtual int GetFileLength(const char *Name) = 0;
    virtual BOOL LoSave(const char *Name, unsigned char *Addr, int Len) = 0;
    virtual BOOL LoStreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size) = 0;
};

class CdIO : public FileIO {   /* sizeof 20 */
public:
    CdIO(unsigned long OurMemId);
    virtual ~CdIO();
    virtual BOOL FileExists(const char *Name);
    virtual BOOL LoReadFileAtAddr(const char *Name, unsigned char *Dest, int Len);
    virtual int GetFileLength(const char *Name);
    virtual BOOL LoSave(const char *Name, unsigned char *Addr, int Len);
    virtual BOOL LoStreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size);
    BOOL LoAsyncStreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size);
};

extern "C" {
void DBG_Error(char *Text, char *File, int Line);
int CdInit(void);
int CdSetDebug(int level);
struct CdlFILE *CdSearchFile(struct CdlFILE *fp, char *name);
int PCopen(char *name, int flags, int perms);
int PCcreat(char *name, int perms);
int PCwrite(int fd, char *buff, int len);
int PCclose(int fd);
int sprintf(char *dst, const char *fmt, ...);
void setasyncfile(char *name);
int asyncloadsegment(unsigned long pos, unsigned char *dest, int size);
unsigned char getasyncreadstatus(int ah);
void cancelasyncload(int ah);
void systemtask(int);
void TSK_Sleep(int Frames);
void *GAL_Lock(long Hnd);
unsigned char GAL_Free(long Hnd);
}
BOOL IsGameLoading(void);
BOOL BL_FileExists(char *Name, char LumpFile);
int BL_FileLength(char *Name, char LumpFile);
BOOL BL_LoadFileAtAddr(char *Name, unsigned char *Dest, char LumpFile);
BOOL BL_AsyncLoadFileAtAddr(char *Name, unsigned char *Dest, char LumpFile);
void BL_WaitForAsyncFinish(void);
BOOL BL_AsyncLoadDone(void);
long BL_LoadFileAsync(char *Name, char LumpFile);
struct STRHDR *BL_OpenStreamFile(char *Name, char LumpFile);
void BL_CloseStreamFile(struct STRHDR *StreamHND);
void UPDATEPROGRESS(int inc);

extern int CDWAIT;
extern struct SFXHDR SFXTab[2];
extern char STREAM_BIN[16];

/* @0x80086C40 CDIO.CPP:123 */
CdIO::CdIO(unsigned long OurMemId) : FileIO(OurMemId)
{
    CdInit();
    CdSetDebug(0);
}

/* @0x80086C84 CDIO.CPP:136 */
CdIO::~CdIO()
{
}

/* @0x80086CDC CDIO.CPP:146 */
BOOL CdIO::FileExists(const char *Name)
{
    return BL_FileExists((char *)Name, 1);
}

/* @0x80086D00 CDIO.CPP:168 */
BOOL CdIO::LoReadFileAtAddr(const char *Name, unsigned char *Dest, int Len)
{
    if (CDWAIT && !IsGameLoading() && BL_FileExists((char *)Name, 0)) {
        if (BL_AsyncLoadFileAtAddr((char *)Name, Dest, 0)) {
            BL_WaitForAsyncFinish();
            return 1;
        }
        return 0;
    }
    return BL_LoadFileAtAddr((char *)Name, Dest, 1);
}

/* @0x80086D9C CDIO.CPP:209 */
int CdIO::GetFileLength(const char *Name)
{
    return BL_FileLength((char *)Name, 1);
}

/* @0x80086DC0 CDIO.CPP:226 */
BOOL CdIO::LoSave(const char *Name, unsigned char *Addr, int Len)
{
    int FileHnd;

    FileHnd = PCopen((char *)Name, 1, 0);
    if (FileHnd == -1) {
        FileHnd = PCcreat((char *)Name, 0);
        if (FileHnd == -1)
            DBG_Error(0, "psxsrc/CDIO.CPP", 235);
    }
    PCwrite(FileHnd, (char *)Addr, Len);
    if (PCclose(FileHnd) == -1)
        DBG_Error(0, "psxsrc/CDIO.CPP", 241);
    return 1;
}

/* @0x80086E94 CDIO.CPP:268 */
BOOL CD_GetCdlFILE(const char *Name, struct CdlFILE *RetFile)
{
    char SearchBuffer[256];

    sprintf(SearchBuffer, "\%s;1", Name);
    while (!CdSearchFile(RetFile, SearchBuffer))
        ;
    return 1;
}

/* @0x80086EE4 CDIO.CPP:292 */
BOOL CdIO::LoStreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size)
{
    unsigned char *Dest;
    int OrigSize;
    unsigned long Pos;
    struct STRHDR *sh;
    int ah;
    unsigned char Count;
    int Lumpfile;

    Count = 0;
    if (Size <= 0)
        DBG_Error(0, "psxsrc/CDIO.CPP", 302);
    if (Slice <= 0)
        DBG_Error(0, "psxsrc/CDIO.CPP", 303);
    Lumpfile = 1;
    if (CDWAIT)
        Lumpfile = IsGameLoading() == 1;
    if (BL_FileExists((char *)Name, Lumpfile) == 0)
        DBG_Error(0, "psxsrc/CDIO.CPP", 316);
    Slice = 0x8000;
    sh = BL_OpenStreamFile((char *)Name, Lumpfile);
    if (!sh)
        DBG_Error(0, "psxsrc/CDIO.CPP", 322);
    OrigSize = Size;
    Pos = sh->Offset + Offset;
    Pos += 4;
    Dest = SFXTab[1].mem;
    while (Size > 0) {
        int SizeToRead;
        unsigned char *ptr;

        ptr = Dest;
        SizeToRead = Size;
        if (Size > Slice)
            SizeToRead = Slice;
        if (Lumpfile == 1)
            setasyncfile("LUMP.BIN");
        else
            setasyncfile(STREAM_BIN);
        ah = asyncloadsegment(Pos, ptr, SizeToRead);
        do
            systemtask(0);
        while (!getasyncreadstatus(ah));
        cancelasyncload(ah);
        Func(ptr, OrigSize - Size, SizeToRead, Size == 0);
        Size -= SizeToRead;
        Pos += SizeToRead;
        if (Size > 0) {
            if (!(Count & 3) && IsGameLoading())
                UPDATEPROGRESS(4);
            else
                TSK_Sleep(1);
            Count++;
        }
    }
    BL_CloseStreamFile(sh);
    return 1;
}

/* @0x8008710C CDIO.CPP:382 */
BOOL CdIO::LoAsyncStreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size)
{
    long hndText;
    unsigned char *Dest;
    int OrigSize;

    if (!BL_AsyncLoadDone())
        BL_WaitForAsyncFinish();
    if (BL_FileExists((char *)Name, 0) == 0)
        DBG_Error(0, "psxsrc/CDIO.CPP", 393);
    hndText = BL_LoadFileAsync((char *)Name, 0);
    if (hndText == -1)
        DBG_Error(0, "psxsrc/CDIO.CPP", 397);
    OrigSize = Size;
    BL_WaitForAsyncFinish();
    Dest = (unsigned char *)GAL_Lock(hndText);
    while (Size > 0) {
        int SizeToRead;

        SizeToRead = Size;
        if (Size > Slice)
            SizeToRead = Slice;
        Func(Dest, OrigSize - Size, SizeToRead, Size == 0);
        Size -= SizeToRead;
        Dest += SizeToRead;
        if (Size > 0)
            TSK_Sleep(1);
    }
    if (!GAL_Free(hndText))
        DBG_Error(0, "psxsrc/CDIO.CPP", 420);
    return 1;
}
