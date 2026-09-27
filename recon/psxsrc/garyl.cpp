/* GARYL.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: a programmer's debug
 * file.  Spanker dumps the used-memory blocks of GAL heap 1 (MemCb halts on each block, leaving
 * its address in LastAddr); GaryLiddon is empty (its body is compiled out). */
#include "diabpsx_types.h"

extern "C" {
void DBG_Halt(void);
unsigned long GAL_GetUsedMem(unsigned long MemType);
unsigned long GAL_GetFreeMem(unsigned long MemType);
unsigned long GAL_LargestFreeBlock(unsigned long MemType);
void GAL_SortUsedRegionsByAddress(unsigned long MemType);
void GAL_IterateUsedMem(unsigned long MemType, void (*Func)(long hnd, void *Addr, unsigned long Size, const char *Name, int Users, int TimeStamp));
}

unsigned long LastAddr;

/* @0x800845BC GARYL.CPP:111 */
void MemCb(long hnd, void *Addr, unsigned long Size, const char *Name, int Users, int TimeStamp)
{
    LastAddr = (unsigned long)Addr;
    DBG_Halt();
}

/* @0x800845E0 GARYL.CPP:131 */
void Spanker(void)
{
    GAL_GetUsedMem(1);
    GAL_GetFreeMem(1);
    LastAddr = 0;
    GAL_LargestFreeBlock(1);
    GAL_SortUsedRegionsByAddress(1);
    GAL_IterateUsedMem(1, MemCb);
    DBG_Halt();
}

/* @0x80084634 GARYL.CPP:330 */
void GaryLiddon(void)
{
}
