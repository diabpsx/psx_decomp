/* DPIECE.CPP -- Diablo PSX (Climax 1998) reconstruction: dPiece map + the packed dung_map[].dBits flags
 * (PSX-only accessors replacing the PC's dPiece[][] / nSolidTable lookups).
 * Bodies from the retail oracle (asm/nonmatchings/dpiece) + SYM (scratch/tuinfo.py DPIECE.CPP).
 * dBits: bit0 SOLID, bit1 MISSILE, bit2 BLOCK, bit3 TRAP, high nibble dDead. */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"
#include "glibdev/gdebug.h"
#include "source/gen/structs_dpiece.h"
#include "source/gen/externs_dpiece.h"
#include "source/gen/protos_dpiece.h"

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "source/DPIECE.cpp", line)   /* retail line literals */

short *dPiece;   /* @0x8011BE44, initialized small-data pointer owned here */

extern void SetSOLID(int x, int y);
extern void ClearSOLID(int x, int y);
extern void SetMISSILE(int x, int y);
extern void ClearMISSILE(int x, int y);
extern void SetBLOCK(int x, int y);
extern void ClearBLOCK(int x, int y);
extern void SetTRAP(int x, int y);
extern void ClearTRAP(int x, int y);
extern short GetDPiece(int x, int y);

/* @0x800827D8 DPIECE.CPP:82 */
static void DPIECE_ERROR(void)
{
}

/* @0x800827E0 DPIECE.CPP:98 */
void AllocdPiece(void)
{
    ASSERT(!dPiece, 99);
    dPiece = (short *)Tmalloc(112 * 112 * sizeof(short));
    for (int i = 0; i < 112 * 112; i++)
        dPiece[i] = 0;
}

/* @0x80082838 DPIECE.CPP:105 */
void FreedPiece(void)
{
    ASSERT(dPiece, 106);
    Tfree(dPiece);
    dPiece = NULL;
}

/* @0x8008287C DPIECE.CPP:113 */
void ConvertdPiece(void)
{
    ASSERT(dPiece, 114);
    for (int y = 0; y < 112; y++) {
        for (int x = 0; x < 112; x++) {
            short dp = GetDPiece(x, y);
            ASSERT((unsigned short)dp <= 2049, 122);
            dung_map[x][y].dBits &= 0xF0;
            if (nSolidTable[dp])
                SetSOLID(x, y);
            else
                ClearSOLID(x, y);
            if (nMissileTable[dp])
                SetMISSILE(x, y);
            else
                ClearMISSILE(x, y);
            if (nBlockTable[dp])
                SetBLOCK(x, y);
            else
                ClearBLOCK(x, y);
            if (nTrapTable[dp])
                SetTRAP(x, y);
            else
                ClearTRAP(x, y);
            if (!dp)
                SetSOLID(x, y);
        }
    }
}

/* @0x80082A44 DPIECE.CPP:151 */
short GetDPiece(int x, int y)
{
    if (!dPiece)
        DPIECE_ERROR();
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 153);
    return dPiece[y * 112 + x];
}

/* @0x80082ACC DPIECE.CPP:158 */
void SetDPiece(int x, int y, short v)
{
    if (!dPiece)
        DPIECE_ERROR();
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 160);
    dPiece[y * 112 + x] = v;
}

/* @0x80082B60 DPIECE.CPP:168 */
void SetdDead(int x, int y, unsigned char v)
{
    dung_map[x][y].dBits = (dung_map[x][y].dBits & 0x0F) | (v << 4);
}

/* @0x80082BA0 DPIECE.CPP:174 */
unsigned char GetdDead(int x, int y)
{
    return dung_map[x][y].dBits >> 4;
}

/* @0x80082BC8 DPIECE.CPP:182 */
void SetSOLID(int x, int y)
{
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 183);
    dung_map[x][y].dBits |= 1;
}

/* @0x80082C54 DPIECE.CPP:188 */
void ClearSOLID(int x, int y)
{
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 189);
    dung_map[x][y].dBits &= ~1;
}

/* @0x80082CE0 DPIECE.CPP:194 */
BOOL GetSOLID(int x, int y)
{
    if (x >= 112 || y >= 112)
        return 1;
    return dung_map[x][y].dBits & 1;
}

/* @0x80082D28 DPIECE.CPP:207 */
void SetMISSILE(int x, int y)
{
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 208);
    dung_map[x][y].dBits |= 2;
}

/* @0x80082DB4 DPIECE.CPP:213 */
void ClearMISSILE(int x, int y)
{
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 214);
    dung_map[x][y].dBits &= ~2;
}

/* @0x80082E40 DPIECE.CPP:219 */
BOOL GetMISSILE(int x, int y)
{
    if (dung_map[x][y].dBits & 2)
        return 1;
    return 0;
}

/* @0x80082E70 DPIECE.CPP:230 */
void SetBLOCK(int x, int y)
{
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 231);
    dung_map[x][y].dBits |= 4;
}

/* @0x80082EFC DPIECE.CPP:236 */
void ClearBLOCK(int x, int y)
{
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 237);
    dung_map[x][y].dBits &= ~4;
}

/* @0x80082F88 DPIECE.CPP:242 */
BOOL GetBLOCK(int x, int y)
{
    if (dung_map[x][y].dBits & 4)
        return 1;
    return 0;
}

/* @0x80082FB8 DPIECE.CPP:253 */
void SetTRAP(int x, int y)
{
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 254);
    dung_map[x][y].dBits |= 8;
}

/* @0x80083044 DPIECE.CPP:259 */
void ClearTRAP(int x, int y)
{
    ASSERT((unsigned)x <= 112 && (unsigned)y <= 112, 260);
    dung_map[x][y].dBits &= ~8;
}

/* @0x800830D0 DPIECE.CPP:265 */
BOOL GetTRAP(int x, int y)
{
    if (dung_map[x][y].dBits & 8)
        return 1;
    return 0;
}
