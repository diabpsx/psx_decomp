/* DATIO.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/DATIO.CPP).  No PC twin: the DDX (dev-kit
 * data link) FileIO back end.  Class declarations follow recon/psxsrc/cdio.cpp. */
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

class DatIO : public FileIO {   /* sizeof 20 */
public:
    DatIO(unsigned long OurMemId);
    virtual ~DatIO();
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
void DDXinit(void);
int DDXopen(char *name, int mode);
int DDXcreate(char *name, int mode);
int DDXlseek(int fd, int offset, int mode);
int DDXread(int fd, unsigned char *buff, int len);
int DDXwrite(int fd, unsigned char *buff, int len);
int DDXclose(int fd);
}

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "psxsrc/DATIO.CPP", line)   /* retail line literals */

/* @0x80086744 DATIO.CPP:65 */
DatIO::DatIO(unsigned long OurMemId) : FileIO(OurMemId)
{
    DDXinit();
}

/* @0x80086780 DATIO.CPP:78 */
DatIO::~DatIO()
{
}

/* @0x800867D8 DATIO.CPP:88 */
BOOL DatIO::FileExists(const char *Name)
{
    int FileHnd = DDXopen((char *)Name, 0);
    if (FileHnd == -1)
        return 0;
    DDXclose(FileHnd);
    return 1;
}

/* @0x80086818 DATIO.CPP:109 */
BOOL DatIO::LoReadFileAtAddr(const char *Name, unsigned char *Dest, int Len)
{
    int FileHnd = DDXopen((char *)Name, 0);
    ASSERT(FileHnd != -1, 0x71);
    ASSERT(DDXread(FileHnd, Dest, Len) != -1, 0x74);
    ASSERT(DDXclose(FileHnd) != -1, 0x77);
    return 1;
}

/* @0x800868D8 DATIO.CPP:128 */
int DatIO::GetFileLength(const char *Name)
{
    int FileHnd;
    int Len;

    FileHnd = DDXopen((char *)Name, 0);
    ASSERT(FileHnd != -1, 0x86);
    Len = DDXlseek(FileHnd, 0, 2);
    ASSERT(Len != -1, 0x89);
    ASSERT(DDXclose(FileHnd) != -1, 0x8C);
    return Len;
}

/* @0x8008698C DATIO.CPP:146 */
BOOL DatIO::LoSave(const char *Name, unsigned char *Addr, int Len)
{
    int FileHnd;

    FileHnd = DDXcreate((char *)Name, 0);
    ASSERT(FileHnd != -1, 0x97);
    DDXwrite(FileHnd, Addr, Len);
    ASSERT(DDXclose(FileHnd) != -1, 0x9C);
    return 1;
}

/* @0x80086A34 DATIO.CPP:173 */
BOOL DatIO::LoStreamFile(const char *Name, int Slice, BOOL (*Func)(unsigned char *, int, int, BOOL), int Offset, int Size)
{
    int FileHnd;
    long hnd;
    unsigned char *Dest;
    int OrigSize;

    ASSERT(Size > 0, 0xB6);
    ASSERT(Slice > 0, 0xB7);
    FileHnd = DDXopen((char *)Name, 0);
    ASSERT(FileHnd != -1, 0xBA);
    hnd = GAL_Alloc(Slice, 1, "SLICERAM");
    ASSERT(hnd != -1, 0xBD);
    Dest = (unsigned char *)GAL_Lock(hnd);
    ASSERT(Dest, 0xC0);
    OrigSize = Size;
    ASSERT(DDXlseek(FileHnd, Offset, 0) != -1, 0xC5);
    while (Size) {
        int SizeToRead = Size;
        if (Slice < Size)
            SizeToRead = Slice;
        ASSERT(DDXread(FileHnd, Dest, SizeToRead) != -1, 0xCF);
        Func(Dest, OrigSize - Size, SizeToRead, Size == 0);
        Size -= SizeToRead;
    }
    ASSERT(DDXclose(FileHnd) != -1, 0xD7);
    ASSERT(GAL_Free(hnd), 0xDA);
    return 1;
}
