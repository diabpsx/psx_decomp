/* PREMISS.CPP — Diablo PSX (Climax 1998) reconstruction (PREGAME overlay).  Twin: refs/devilution/Source/missiles.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: this build has no Hellfire-only members (no chain[]/numchains reset, no wReflections,
 * no AutoMapShowItems) — the fn is exactly retail Diablo's non-Hellfire InitMissiles body. The tile
 * flag InitMissiles clears in the closing 96x96 scan is bit 0x40 in THIS build (devilution's PC
 * `enums.h` numbers it BFLAG_LIT=0x40/BFLAG_MISSILE=0x01 — a different bit assignment; the oracle's
 * `andi $a1,-0x41` proves the PSX build clears bit 0x40 here, so the local #define below follows the
 * oracle's VALUE, kept under the devilution FUNCTION name). */
#include "diabpsx_types.h"
#include "source/gen/structs_premiss.h"
#include "source/gen/externs_premiss.h"
#include "source/gen/protos_premiss.h"
#include "source/diablo.h"

#define MAXMISSILES 125
#define MAXDUNX 96
#define MAXDUNY 96

#define MIS_INFRA 0x27

/* @0x80161FDC PSX delta: this build's flag-numbering has the tile flag InitMissiles clears here at
 * bit 0x40 (devilution/PC numbers this bit BFLAG_LIT and puts BFLAG_MISSILE at 0x01 instead). */
#define BFLAG_MISSILE 0x40

void InitMissiles(void)
{
    int i, j, mx;

    plr[myplr]._pSpellFlags &= ~0x1;
    if (plr[myplr]._pInfraFlag == 1) {
        for (i = 0; i < nummissiles; i++) {
            mx = missileactive[i];
            if (missile[mx]._mitype == MIS_INFRA) {
                j = missile[mx]._misource;
                if (j == myplr)
                    CalcPlrItemVals(j, 1);
            }
        }
    }
    nummissiles = 0;
    for (i = 0; i < MAXMISSILES; i++) {
        missileavail[i] = i;
        missileactive[i] = 0;
    }
    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            dung_map[i][j].dFlags &= ~BFLAG_MISSILE;
        }
    }
}
