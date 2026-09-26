/* DEAD.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/dead.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: DeadStruct only carries {_deadtype, _deadFrame, _deadtrans} (no sprite-pointer
 * _deadData[]/_deadWidth/_deadWidth2 — those live in a separate PSX asset table indexed by
 * _deadtype); the two hardcoded blood-spurt/stonecurse entries never assign _deadtype (left at
 * its BSS-zero value, a genuine retail quirk, not an omission here); AddDead's `ddir` parameter
 * is dropped entirely (never read) — only dv reaches SetdDead, masked to 5 bits. */
#include "diabpsx_types.h"
#include "source/gen/structs_dead.h"
#include "source/gen/externs_dead.h"
#include "source/gen/protos_dead.h"
#include "source/diablo.h"

#define MAXMONSTERS 190
#define MA_DEATH 4

/* TU-owned small globals (methodology 3.12#6): tentative defs -> gp-relative, matching the oracle's
 * %gp_rel(spurtndx)/%gp_rel(stonendx) stores (both are 4-byte ints defined in this TU, like devilution). */
int spurtndx;
int stonendx;

void InitDead(void)
{
    int nd, i, mi;
    int mtypes[MAXMONSTERS];

    for (i = 0; i < MAXMONSTERS; i++)
        mtypes[i] = 0;

    nd = 0;

    for (i = 0; i < nummtypes; i++) {
        if (mtypes[Monsters[i].mtype] == 0) {
            dead[nd]._deadtype = i;
            dead[nd]._deadFrame = Monsters[i].Anims[MA_DEATH].Frames;
            dead[nd]._deadtrans = 0;
            Monsters[i].mdeadval = nd + 1;
            mtypes[Monsters[i].mtype] = nd + 1;
            nd++;
        }
    }

    dead[nd]._deadFrame = 8;
    dead[nd]._deadtrans = 0;
    spurtndx = nd + 1;
    nd++;

    dead[nd]._deadFrame = 12;
    dead[nd]._deadtrans = 0;
    stonendx = nd + 1;
    nd++;

    for (i = 0; i < nummonsters; i++) {
        mi = monstactive[i];
        if (monster[mi]._uniqtype != 0) {
            dead[nd]._deadFrame = monster[mi].MType->Anims[MA_DEATH].Frames;
            dead[nd]._deadtrans = monster[mi]._uniqtype + 4;
            monster[mi]._udeadval = nd + 1;
            nd++;
        }
    }
}

void AddDead(int dx, int dy, char dv, int ddir)
{
    SetdDead(dx, dy, dv & 0x1F);
}
