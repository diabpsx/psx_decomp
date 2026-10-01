/* TMALLOC.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the game's small
 * locked-allocation layer over GAL (60 slots of handle + locked address), and strupr. */
#include "diabpsx_types.h"

struct MEMSTRUCT {   /* sizeof 8 */
    long Handle;
    void *MemPtr;
};

extern "C" {
long GAL_Alloc(unsigned long Size, unsigned long Type, char *Name);
void *GAL_Lock(long Handle);
unsigned char GAL_Free(long Handle);
void DBG_Error(char *Text, char *File, int Line);
extern char _ctype_[];
}

#define ASSERT(e) if (!(e)) DBG_Error(NULL, "psxsrc/TMALLOC.CPP", __LINE__)
/* PsyQ 4.0 ctype.h */
#define isalpha(c) ((_ctype_ + 1)[(unsigned char)(c)] & 3)
#define _toupper(c) ((unsigned char)(c) - 'a' + 'A')

struct MEMSTRUCT MemBlock[60] = {{0}};
int NoTAllocs;

/* @0x800882A8 TMALLOC.CPP:78 */
void *Tmalloc(int MemSize)
{
    long MyHnd;
    void *Addr;
    int i;

    MyHnd = GAL_Alloc(MemSize, 0x8001, "TMALL");
    if (MyHnd == -1)
        DBG_Error(NULL, "psxsrc/TMALLOC.CPP", 92);
    Addr = GAL_Lock(MyHnd);
    if (!MyHnd)
        DBG_Error(NULL, "psxsrc/TMALLOC.CPP", 96);
    for (i = 0; i < 60; i++) {
        if (!MemBlock[i].MemPtr) {
            MemBlock[i].MemPtr = Addr;
            MemBlock[i].Handle = MyHnd;
            NoTAllocs++;
            return Addr;
        }
    }
    if (!!"OUT OF TMALLOC SLOTS")
        DBG_Error(NULL, "psxsrc/TMALLOC.CPP", 108);
    return 0;
}

/* @0x8008839C TMALLOC.CPP */
void Tfree(void *Addr)
{
    int i;

    if (Addr) {
        for (i = 0; i < 60; i++) {
            if (Addr == MemBlock[i].MemPtr) {
                if (!GAL_Free(MemBlock[i].Handle))
                    DBG_Error(NULL, "psxsrc/TMALLOC.CPP", 133);
                MemBlock[i].MemPtr = 0;
                NoTAllocs--;
            }
        }
    }
}

/* @0x8008844C TMALLOC.CPP */
void InitTmalloc(void)
{
    int i;

    NoTAllocs = 0;
    for (i = 0; i < 60; i++)
        MemBlock[i].MemPtr = 0;
}

/* @0x80088474 TMALLOC.CPP */
void strupr(char *Buffa)
{
    char *TempBuf;
    char TempChar;

    TempBuf = Buffa;
    while ((TempChar = *TempBuf) != 0) {
        if (isalpha(TempChar) && TempChar >= 'a' && TempChar <= 'z')
            *TempBuf = _toupper(TempChar);
        TempBuf++;
    }
}
