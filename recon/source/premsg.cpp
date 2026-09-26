/* PREMSG.CPP — Diablo PSX (Climax 1998) reconstruction (pregame overlay, premsg segment).
 * Twin: refs/diablo-hellfire/src/MSG.CPP (DefragItems/removellist/DeltaLoadLevel live inline in the PC's
 * MSG.CPP multiplayer-delta code; PSX splits them into their own overlay TU). Reconstructed from the
 * retail asm oracle + skel/SOURCE/PREMSG.CPP (Ghidra/IDA draft). */
#include "diabpsx_types.h"
#include "source/gen/structs_premsg.h"
#include "source/gen/externs_premsg.h"
#include "source/gen/protos_premsg.h"
#include "source/diablo.h"

void DefragItems(unsigned char *ilist, int num)
{
    int p;
    unsigned char *end;

    p = 0;
    end = ilist + num;
    if (num > 0) {
        do {
            if (*ilist != 0xFF) {
                itemactive[p] = *ilist;
                p++;
            }
            ilist++;
        } while ((int)ilist < (int)end);
    }
}

void removellist(unsigned char *ilist, unsigned char val)
{
    unsigned char *end;

    end = ilist + 0x7F;
    do {
        if (*ilist == val)
            *ilist = 0xFF;
        ilist++;
    } while ((int)ilist < (int)end);
}
