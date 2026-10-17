#ifndef PSXSRC_CPLAYER_H
#define PSXSRC_CPLAYER_H
/* CPLAYER.H -- Climax PSX player-sprite object (C:\diabpsx\PSXSRC\CPLAYER.H): a TextDat per player plus its
 * scroll bookkeeping.  Layout from the retail SYM (sizeof 144); the in-class methods are the ones the retail
 * SYM attributes to CPLAYER.H lines 55-76, emitted out of line per calling TU (-fno-inline); GetPlayer's
 * DBG_Error carries this header's name and line 65 into every TU that parses it. */
#include "diabpsx_types.h"
#include "psxsrc/gman.h"
#include "glibdev/gdebug.h"

struct PlayerStruct;
class CBlocks;

enum PACTION {
    PL_NOACTION = 0, PL_WALK = 1, PL_STAND = 2, PL_ATTACK = 3, PL_HIT = 4, PL_BLOCK = 5,
    PL_DEATH = 6, PL_TWALK = 7, PL_TSTAND = 8, PL_LMAGIC = 9, PL_QMAGIC = 10, PL_FMAGIC = 11
};

class CPlayer : public TextDat {
public:
    long hndDatMem;             /* +0x70 */
    unsigned short NumOfPlayers;/* +0x74 */
    BOOL InTown;                /* +0x78 */
    unsigned short PlayerNum;   /* +0x7C */
    unsigned short Tpage;       /* +0x7E */
    int TexId;                  /* +0x80 */
    int LastScrX;               /* +0x84 */
    int LastScrY;               /* +0x88 */
    int LastOtPos;              /* +0x8C */
    static CPlayer *PActiveArray[2];   /* _7CPlayer.PActiveArray @0x8011AD50 (CPLAYER.CPP) */

    CPlayer(BOOL InTown, int Which, int PlayerNum);
    ~CPlayer();
#line 55
    int GetTexId() { return TexId; }                                       /* CPLAYER.H:55 */
#line 58
    int GetLastScrX() const { return LastScrX; }                           /* CPLAYER.H:58 */
#line 59
    int GetLastScrY() const { return LastScrY; }                           /* CPLAYER.H:59 */
#line 60
    int GetLastOtPos() const { return LastOtPos; }                         /* CPLAYER.H:60 */
#line 63
    static CPlayer *GetPlayer(int PNum)                                    /* CPLAYER.H:64 */
    {
        if ((unsigned)PNum >= 2) DBG_Error(NULL, "psxsrc/cplayer.h", 65);
        return PActiveArray[PNum];
    }
    void Load(int Id);
    void SetScrollTarget(PlayerStruct &Plr, CBlocks &Bg);
    void Print(PlayerStruct &Plr, CBlocks &Bg);
    int FindAction(PlayerStruct &Plr);
    PACTION FindActionEnum(PlayerStruct &Plr);
    void Init();
    void Dump();
    void LoadThis(int Id);
    void NonBlockingLoadNewGFX(int Id);
#line 75
    int GetDatMaxSize()                                                    /* CPLAYER.H:76 */
    {
        if (InTown)
            return 0x19E10;

        return NumOfPlayers == 0 ? 0x2C308 : 0x182B8;
    }
};

#endif
