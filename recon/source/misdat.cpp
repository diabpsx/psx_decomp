/* MISDAT.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/MISDAT.CPP.
 * The two empty handlers of the missile tables: nullmissile (add function) and FuncNULL (the PSX
 * per-missile draw hook). */
#include "diabpsx_types.h"

struct MissileStruct {   /* sizeof 76; layout in the MISSILES TU */
    unsigned char data[76];
};

/* @0x8004EA8C MISDAT.CPP:33 */
void nullmissile(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
}

/* @0x8004EA94 MISDAT.CPP:812 */
void FuncNULL(struct MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
}
