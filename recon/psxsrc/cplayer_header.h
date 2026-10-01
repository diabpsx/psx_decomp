#ifndef CPLAYER_HEADER_H
#define CPLAYER_HEADER_H
#include "psxsrc/textdat_header.h"
/* Retail CPLAYER.H layout and GetPlayer inline, lines 64-67. */
class CPlayer : public TextDat {
public:
    long hndDatMem;
    unsigned short NumOfPlayers;
    BOOL InTown;
    unsigned short PlayerNum, Tpage;
    int TexId, LastScrX, LastScrY, LastOtPos;
    static CPlayer *PActiveArray[2];
    static CPlayer *GetPlayer(int PNum)
    {
        if ((unsigned)PNum >= 2) DBG_Error(NULL, "psxsrc/cplayer.h", 65);
        return PActiveArray[PNum];
    }
};
#endif
