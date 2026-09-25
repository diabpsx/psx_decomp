#include "common.h"

void DPIECE_ERROR__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/dpiece", AllocdPiece__Fv);

INCLUDE_ASM("asm/nonmatchings/dpiece", FreedPiece__Fv);

INCLUDE_ASM("asm/nonmatchings/dpiece", ConvertdPiece__Fv);

INCLUDE_ASM("asm/nonmatchings/dpiece", GetDPiece__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", SetDPiece__Fiis);

INCLUDE_ASM("asm/nonmatchings/dpiece", SetdDead__FiiUc);

INCLUDE_ASM("asm/nonmatchings/dpiece", GetdDead__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", SetSOLID__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", ClearSOLID__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", GetSOLID__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", SetMISSILE__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", ClearMISSILE__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", GetMISSILE__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", SetBLOCK__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", ClearBLOCK__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", GetBLOCK__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", SetTRAP__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", ClearTRAP__Fii);

INCLUDE_ASM("asm/nonmatchings/dpiece", GetTRAP__Fii);
