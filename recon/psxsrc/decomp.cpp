/* DECOMP.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the list of texture
 * sets (TextDat) that want their compressed frames decompressed; DEC_DoDecompRequests services
 * every registered requestor once per call. */
#include "diabpsx_types.h"

#include "psxsrc/textdat_header.h"

extern "C" void DBG_Error(char *Text, char *File, int Line);
static int FindThisTd(TextDat *Td);
static int FindEmptyIndex(void);

static TextDat *DecRequestors[10];

/* @0x800B07A4 DECOMP.CPP:61 (linked into the startup segment) */
void DEC_Open(void) __attribute__((section(".STARTUP_text")));
void DEC_Open(void)
{
    for (int f = 0; f < 10; f++)
        DecRequestors[f] = 0;
}

/* @0x800A4384 DECOMP.CPP:71 */
void DEC_AddAsDecRequestor(TextDat *Td)
{
    int TdIndex;

    TdIndex = FindThisTd(Td);
    if (TdIndex == -1) {
        TdIndex = FindEmptyIndex();
        if (TdIndex == -1)
            DBG_Error(NULL, "psxsrc/DECOMP.CPP", 79);
        DecRequestors[TdIndex] = Td;
    }
}

/* @0x800A4400 DECOMP.CPP:90 */
void DEC_RemoveAsDecRequestor(TextDat *Td)
{
    int TdIndex;

    TdIndex = FindThisTd(Td);
    if (TdIndex == -1)
        DBG_Error(NULL, "psxsrc/DECOMP.CPP", 93);
    DecRequestors[TdIndex] = 0;
}

/* @0x800A4458 DECOMP.CPP:102 */
void DEC_DoDecompRequests(void)
{
    for (int f = 0; f < 10; f++) {
        if (DecRequestors[f])
            DecRequestors[f]->DoDecompRequests();
    }
}

/* @0x800A44B4 DECOMP.CPP:116 */
static int FindThisTd(TextDat *Td)
{
    for (int f = 0; f < 10; f++) {
        if (DecRequestors[f] == Td)
            return f;
    }
    return -1;
}

/* @0x800A44EC DECOMP.CPP:130 */
static int FindEmptyIndex(void)
{
    for (int f = 0; f < 10; f++) {
        if (!DecRequestors[f])
            return f;
    }
    return -1;
}
