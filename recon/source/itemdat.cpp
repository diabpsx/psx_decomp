/* ITEMDAT.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/ITEMDAT.CPP
 * (tables).  PSX adds AllItemsUseable, a per-item copy of the tables' usable flag that the game can
 * clear at run time. */
#include "diabpsx_types.h"

struct ItemDataStruct {   /* sizeof 32; only iUsable is read here */
    unsigned char pad0[0x1A];
    unsigned char iUsable;   /* +0x1A */
    unsigned char pad1[32 - 0x1B];
};

extern struct ItemDataStruct AllItemsList[157];
unsigned char AllItemsUseable[157] = { 0 };

void InitAllItemsUseable(void)
{
    for (int f = 0; f < 157; f++)
        AllItemsUseable[f] = AllItemsList[f].iUsable;
}
