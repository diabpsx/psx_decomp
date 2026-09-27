/* PCIO.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/PCIO.CPP).  No PC twin: the PC-link
 * (PCfs) FileIO back end used by development builds.  Class declarations follow recon/psxsrc/cdio.cpp. */
#include "diabpsx_types.h"

class SysObj {   /* sizeof 4 */
public:
    long MemHnd;
    void operator delete(void *ptr);   /* @0x800866D8 SYSOBJ.CPP */
};

class FileIO : public SysObj {   /* sizeof 20 (vptr at +0x10) */
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

class PCIO : public FileIO {   /* sizeof 20 */
public:
    PCIO(unsigned long OurMemId);
    virtual ~PCIO();
    virtual BOOL FileExists(const char *Name);
    virtual BOOL LoReadFileAtAddr(const char *Name, unsigned char *Dest, int Len);
    virtual int GetFileLength(const char *Name);
    virtual BOOL LoSave(const char *Name, unsigned char *Addr, int Len);
    virtual BOOL LoStreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size);
};

extern "C" {
void DBG_Error(char *Text, char *File, int Line);
long GAL_Alloc(unsigned long Size, unsigned long Type, char *Name);
void *GAL_Lock(long Handle);
unsigned char GAL_Free(long Handle);
int PCinit(void);
int PCopen(char *name, int flags, int perms);
int PCcreat(char *name, int perms);
int PClseek(int fd, int offset, int mode);
int PCread(int fd, char *buff, int len);
int PCwrite(int fd, char *buff, int len);
int PCclose(int fd);
}

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "psxsrc/PCIO.CPP", line)   /* retail line literals */

/* @0x800860B4 PCIO.CPP:62 */
PCIO::PCIO(unsigned long OurMemId) : FileIO(OurMemId)
{
    if (PCinit())
        ASSERT("Can't init PC FS", 0x41);
}

/* @0x8008611C PCIO.CPP:75 */
PCIO::~PCIO()
{
}

/* @0x80086174 PCIO.CPP:85 */
BOOL PCIO::FileExists(const char *Name)
{
    int FileHnd = PCopen((char *)Name, 0, 0);
    if (FileHnd == -1)
        return 0;
    PCclose(FileHnd);
    return 1;
}

/* @0x800861B8 PCIO.CPP:106 */
BOOL PCIO::LoReadFileAtAddr(const char *Name, unsigned char *Dest, int Len)
{
    int FileHnd = PCopen((char *)Name, 0, 0);
    ASSERT(FileHnd != -1, 0x6E);
    ASSERT(PCread(FileHnd, (char *)Dest, Len) != -1, 0x71);
    ASSERT(PCclose(FileHnd) != -1, 0x74);
    return 1;
}

/* @0x8008627C PCIO.CPP:125 */
int PCIO::GetFileLength(const char *Name)
{
    int FileHnd;
    int Len;

    FileHnd = PCopen((char *)Name, 0, 0);
    ASSERT(FileHnd != -1, 0x83);
    Len = PClseek(FileHnd, 0, 2);
    ASSERT(Len != -1, 0x86);
    ASSERT(PCclose(FileHnd) != -1, 0x89);
    return Len;
}

/* @0x80086334 PCIO.CPP:143 */
BOOL PCIO::LoSave(const char *Name, unsigned char *Addr, int Len)
{
    int FileHnd;

    FileHnd = PCopen((char *)Name, 1, 0);
    if (FileHnd == -1) {
        FileHnd = PCcreat((char *)Name, 0);
        ASSERT(FileHnd != -1, 0x98);
    }
    PCwrite(FileHnd, (char *)Addr, Len);
    ASSERT(PCclose(FileHnd) != -1, 0x9E);
    return 1;
}

/* @0x80086408 PCIO.CPP:169 */
BOOL PCIO::LoStreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size)
{
    int FileHnd;
    long hnd;
    unsigned char *Dest;
    int OrigSize;

    ASSERT(Size > 0, 0xB2);
    ASSERT(Slice > 0, 0xB3);
    FileHnd = PCopen((char *)Name, 0, 0);
    ASSERT(FileHnd != -1, 0xB6);
    hnd = GAL_Alloc(Slice, 1, "SLICERAM");
    ASSERT(hnd != -1, 0xB9);
    Dest = (unsigned char *)GAL_Lock(hnd);
    ASSERT(Dest, 0xBC);
    OrigSize = Size;
    ASSERT(PClseek(FileHnd, Offset, 0) != -1, 0xC1);
    while (Size) {
        int SizeToRead = Size;
        if (Slice < Size)
            SizeToRead = Slice;
        ASSERT(PCread(FileHnd, (char *)Dest, SizeToRead) != -1, 0xCB);
        Func(Dest, OrigSize - Size, SizeToRead, Size == 0);
        Size -= SizeToRead;
    }
    ASSERT(PCclose(FileHnd) != -1, 0xD1);
    ASSERT(GAL_Free(hnd), 0xD4);
    return 1;
}
