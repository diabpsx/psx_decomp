/* PRESTORE.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/stores.cpp
 * (InitStores/SetupTownStores).  Layouts / prototypes / externs generated from DIABPSX.SYM
 * (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"

struct TextDat {
    BOOL OwnDat;
    int TexNum, LastFrame;
    BOOL DatLoaded;
    long hndDat;
    inline void DumpDatFile();
};
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}
class CPlayer : public TextDat {
public:
    static CPlayer *PActiveArray[2];
    static CPlayer *GetPlayer(int PNum)
    {
        if ((unsigned)PNum >= 2) DBG_Error(NULL, "psxsrc/cplayer.h", 65);
        return PActiveArray[PNum];
    }
};
#include "source/gen/structs_prestore.h"
#include "source/gen/externs_prestore.h"
#include "source/gen/protos_prestore.h"
#include "source/diablo.h"

#define SMITH_PREMIUM_ITEMS 6
#define NUMLEVELS            0x11
#define STORE_NONE            0
#define ITYPE_NONE           -1

/* PSX: the PC store globals became per-player arrays indexed by StorePlrNo */
#define numpremium   _numpremium[StorePlrNo]
#define premiumlevel _premiumlevel[StorePlrNo]
#define premiumitem  _premiumitem[StorePlrNo]
#define boyitem      _boyitem[StorePlrNo]
#define boylevel     _boylevel[StorePlrNo]

void InitStores(void)
{
    ClearSText(0, 0x18);
    stextflag = STORE_NONE;
    stextsize = 0;
    stextscrl = 0;
    for (int Loop = 0; Loop < gbMaxPlayers; Loop++) {
        StorePlrNo = Loop;
        numpremium = 0;
        premiumlevel = 1;
        for (int i = 0; i < SMITH_PREMIUM_ITEMS; i++) premiumitem[i]._itype = ITYPE_NONE;
        boyitem._itype = ITYPE_NONE;
        boylevel = 0;
    }
}

void SetupTownStores(void)
{
    int i, l;
    int OldMyPtr;
    int OldSeed;

    OldMyPtr = myplr;
    OldSeed = GetRndSeed();
    SetRndSeed(OldSeed);
    for (int Loop = 0; Loop < gbMaxPlayers; Loop++) {
        StorePlrNo = Loop;
        myplr = Loop;
        if (gbMaxPlayers == 1) {
            l = 0;
            for (i = 0; i < NUMLEVELS; i++)
                if (plr[myplr]._pLvlVisited[i]) l = i;
        } else {
            l = plr[myplr]._pLevel >> 1;
        }
        l += 2;
        if (l < 6) l = 6;
        if (l > 16) l = 16;
        SpawnStoreGold();
        SpawnSmith(l);
        SpawnWitch(l);
        SpawnHealer(l);
        SpawnBoy(plr[myplr]._pLevel);
        SpawnPremium(plr[myplr]._pLevel);
    }
    myplr = OldMyPtr;
    SetRndSeed(OldSeed);
}
