/* FILEIO.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/FILEIO.CPP).  No PC twin: the abstract
 * file-system object.  FileIO resolves a name (optionally through a ';'-separated search path held in a
 * GAL block) into FileToLoad and forwards to the back end's pure virtuals (CdIO / PCIO / DatIO).
 * Class declarations follow recon/psxsrc/cdio.cpp; vtable = ~FileIO + FileExists, LoReadFileAtAddr,
 * GetFileLength, LoSave, LoStreamFile. */
#include "diabpsx_types.h"

class SysObj {   /* sizeof 4 */
public:
    long MemHnd;
    SysObj();                          /* @0x80086618 SYSOBJ.CPP */
    void operator delete(void *ptr);   /* @0x800866D8 SYSOBJ.CPP */
};

class FileIO : public SysObj {   /* sizeof 20 */
public:
    unsigned long MemId;   /* +0x4 */
    long hndPath;          /* +0x8 */
    char *SearchPath;      /* +0xC ; vptr at +0x10 */

    static char FileToLoad[50];

    FileIO(unsigned long OurMemId);
    virtual ~FileIO();
    virtual BOOL FileExists(const char *Name) = 0;
    virtual BOOL LoReadFileAtAddr(const char *Name, unsigned char *Dest, int Len) = 0;
    virtual int GetFileLength(const char *Name) = 0;
    virtual BOOL LoSave(const char *Name, unsigned char *Addr, int Len) = 0;
    virtual BOOL LoStreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size) = 0;

    long Read(const char *Name, unsigned long RamId);
    int FileLen(const char *Name);
    void FileNotFound(const char *Name);
    BOOL StreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size);
    BOOL ReadAtAddr(const char *Name, unsigned char *Dest, int Len);
    void DumpOldPath();
    void SetSearchPath(const char *Path);
    BOOL FindFile(const char *Name, char *Buffa);
    char *CopyPathItem(char *Dst, const char *Src);
    void LockSearchPath();
    void UnlockSearchPath();
    BOOL SearchPathExists();
    BOOL Save(const char *Name, unsigned char *Addr, int Len);
};

extern "C" {
void DBG_Error(char *Text, char *File, int Line);
void DBG_Halt(void);
long GAL_Alloc(unsigned long Size, unsigned long Type, char *Name);
void *GAL_Lock(long Handle);
unsigned char GAL_Unlock(long Handle);
unsigned char GAL_Free(long Handle);
unsigned long strlen(const char *s);
char *strcpy(char *dst, const char *src);
char *strcat(char *dst, const char *src);
void *memcpy(void *dst, const void *src, unsigned long n);
}
void strupr(char *Str);

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "psxsrc/FILEIO.CPP", line)   /* retail line literals */

char FileIO::FileToLoad[50];   /* @0x800B7970 (SYM EXT _6FileIO.FileToLoad) */

/* @0x8008587C FILEIO.CPP:61 */
FileIO::FileIO(unsigned long OurMemId)
{
    hndPath = -1;
    MemId = OurMemId;
}

/* @0x800858CC FILEIO.CPP:70 */
FileIO::~FileIO()
{
    DumpOldPath();
}

/* @0x80085920 FILEIO.CPP:79 */
long FileIO::Read(const char *Name, unsigned long RamId)
{
    int MemSize;
    long MyHnd;
    unsigned char *LoadAddr;

    if (!FindFile(Name, FileToLoad))
        FileNotFound(Name);
    MemSize = GetFileLength(FileToLoad);
    ASSERT(MemSize, 0x59);
    MyHnd = GAL_Alloc(MemSize, RamId, (char *)Name);
    ASSERT(MyHnd != -1, 0x5C);
    LoadAddr = (unsigned char *)GAL_Lock(MyHnd);
    ASSERT(MyHnd, 0x5F);
    LoReadFileAtAddr(FileToLoad, LoadAddr, GetFileLength(FileToLoad));
    ASSERT(GAL_Unlock(MyHnd), 0x64);
    return MyHnd;
}

/* @0x80085A90 FILEIO.CPP:112 */
int FileIO::FileLen(const char *Name)
{
    if (!FindFile(Name, FileToLoad))
        return -1;
    return GetFileLength(FileToLoad);
}

/* @0x80085AF4 FILEIO.CPP:129 */
void FileIO::FileNotFound(const char *Name)
{
    DBG_Halt();
}

/* @0x80085B14 FILEIO.CPP:138 */
BOOL FileIO::StreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size)
{
    if (FindFile(Name, FileToLoad) == 0)
        DBG_Error(NULL, "psxsrc/FILEIO.CPP", 0x91);
    if (Size == -1)
        Size = GetFileLength(FileToLoad);
    return LoStreamFile(FileToLoad, Slice, Func, Offset, Size);
}

/* @0x80085BF4 FILEIO.CPP:157 */
BOOL FileIO::ReadAtAddr(const char *Name, unsigned char *Dest, int Len)
{
    if (FindFile(Name, FileToLoad) == 0)
        DBG_Error(NULL, "psxsrc/FILEIO.CPP", 0xA4);
    if (Len == -1)
        Len = GetFileLength(FileToLoad);
    LoReadFileAtAddr(FileToLoad, Dest, Len);
    return 1;
}

/* @0x80085CB8 FILEIO.CPP:180 */
void FileIO::DumpOldPath()
{
    if (hndPath != -1) {
        unsigned char Freed = GAL_Free(hndPath);
        ASSERT(Freed, 0xB8);
        hndPath = -1;
    }
}

/* @0x80085D1C FILEIO.CPP:193 */
void FileIO::SetSearchPath(const char *Path)
{
    DumpOldPath();
    hndPath = GAL_Alloc(strlen(Path) + 1, MemId, NULL);
    ASSERT(hndPath != -1, 0xC6);
    SearchPath = (char *)GAL_Lock(hndPath);
    ASSERT(hndPath, 0xC9);
    strcpy(SearchPath, Path);
    strupr(SearchPath);
    ASSERT(GAL_Unlock(hndPath), 0xCF);
}

/* @0x80085DF8 FILEIO.CPP:215 */
BOOL FileIO::FindFile(const char *Name, char *Buffa)
{
    strcpy(Buffa, Name);
    strupr(Buffa);
    if (FileExists(Buffa)) {
        return 1;
    } else {
        BOOL Success = 0;
        if (SearchPathExists()) {
            LockSearchPath();
            char *Path = SearchPath;
            do {
                Path = CopyPathItem(Buffa, Path);
                if (!Path)
                    break;
                strcat(Buffa, "\\");
                strcat(Buffa, Name);
                if (FileExists(Buffa))
                    Success = 1;
            } while (!Success);
            UnlockSearchPath();
        }
        return Success;
    }
}

/* @0x80085F0C FILEIO.CPP:254 */
char *FileIO::CopyPathItem(char *Dst, const char *Src)
{
    const char *Ptr = Src;
    int Len;

    while (*Ptr && *Ptr != ';')
        Ptr++;
    Len = Ptr - Src;
    if (Len) {
        memcpy(Dst, Src, Len);
        Dst[Len] = 0;
        if (*Ptr)
            return (char *)Ptr + 1;
        return (char *)Ptr;
    }
    return NULL;
}

/* @0x80085FB4 FILEIO.CPP:282 */
void FileIO::LockSearchPath()
{
    if (SearchPathExists()) {
        SearchPath = (char *)GAL_Lock(hndPath);
        ASSERT(SearchPath, 0x11E);
    }
}

/* @0x8008600C FILEIO.CPP:295 */
void FileIO::UnlockSearchPath()
{
    if (SearchPathExists()) {
        unsigned char Unlocked = GAL_Unlock(hndPath);
        ASSERT(Unlocked, 0x12B);
    }
}

/* @0x80086064 FILEIO.CPP:308 */
BOOL FileIO::SearchPathExists()
{
    return hndPath != -1;
}

/* @0x80086078 FILEIO.CPP:317 */
BOOL FileIO::Save(const char *Name, unsigned char *Addr, int Len)
{
    return LoSave(Name, Addr, Len);
}
