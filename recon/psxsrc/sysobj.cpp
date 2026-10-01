/* SYSOBJ.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: SysObj, the base of
 * the heap-owned system objects.  operator new(Amount, RamID) allocates and locks a GAL block and
 * parks its handle in the static NewHnd; the constructor then adopts it into MemHnd.  The plain
 * operator new must never be used. */
#include "diabpsx_types.h"

extern "C" {
long GAL_Alloc(unsigned long Size, unsigned long Type, char *Name);
void *GAL_Lock(long Handle);
unsigned char GAL_Free(long Handle);
void DBG_Error(char *Text, char *File, int Line);
}

class SysObj {   /* sizeof 4 */
public:
    long MemHnd;
    static long NewHnd;

    SysObj();
    void *operator new(int Amount);
    void *operator new(int Amount, unsigned long RamID);
    void operator delete(void *ptr);
};

long SysObj::NewHnd = -1;

/* @0x80086618 SYSOBJ.CPP */
SysObj::SysObj()
{
    MemHnd = NewHnd;
    NewHnd = -1;
}

/* @0x80086630 SYSOBJ.CPP */
void *SysObj::operator new(int Amount)
{
    DBG_Error(NULL, "psxsrc/SYSOBJ.CPP", 78);
    return 0;
}

/* @0x8008665C SYSOBJ.CPP */
void *SysObj::operator new(int Amount, unsigned long RamID)
{
    long hnd;
    void *RetAddr;

    hnd = GAL_Alloc(Amount, RamID, NULL);
    if (hnd == -1)
        DBG_Error(NULL, "psxsrc/SYSOBJ.CPP", 94);
    RetAddr = GAL_Lock(hnd);
    if (!RetAddr)
        DBG_Error(NULL, "psxsrc/SYSOBJ.CPP", 97);
    NewHnd = hnd;
    return RetAddr;
}

/* @0x800866D8 SYSOBJ.CPP */
void SysObj::operator delete(void *ptr)
{
    SysObj *This = (SysObj *)ptr;

    if (This->MemHnd == -1)
        DBG_Error(NULL, "psxsrc/SYSOBJ.CPP", 116);
    if (!GAL_Free(This->MemHnd))
        DBG_Error(NULL, "psxsrc/SYSOBJ.CPP", 119);
}
