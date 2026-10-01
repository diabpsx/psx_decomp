/* PRETRIGS.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/trigs.cpp
 * (the InitXTriggers() family only -- the rest of trigs.cpp/TRIGS.CPP is a separate TU).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "psxsrc/cplayer_header.h"
#include "source/gen/structs_pretrigs.h"
#include "source/gen/externs_pretrigs.h"
#include "source/gen/protos_pretrigs.h"
#include "source/diablo.h"

#define MAXDUNX 96
#define MAXDUNY 96

/* PSX-local WM_DIAB* message ids (retail values -- not the PC WM_USER-based devilution numbering). */
#define WM_DIABNEXTLVL  0x42
#define WM_DIABPREVLVL  0x43
#define WM_DIABRTNLVL   0x44
#define WM_DIABTOWNWARP 0x47
#define WM_DIABTWARPUP  0x48

#define Q_SCHAMB   14

void InitNoTriggers(void)
{
    numtrigs = 0;
    _trigflag[sel_data] = 0;
}

void InitTownTriggers(void)
{
    trigs[0]._tx = 25;
    trigs[0]._ty = 29;
    trigs[0]._tmsg = WM_DIABNEXTLVL;
    numtrigs = 1;

    if (gbMaxPlayers == 4) {
        for (int i = 0; i < 3; i++) {
            townwarps[i] = 1;
        }
        trigs[1]._tx = 49;
        trigs[1]._ty = 21;
        trigs[1]._tmsg = WM_DIABTOWNWARP;
        trigs[1]._tlvl = 5;
        numtrigs++;
        trigs[2]._tx = 17;
        trigs[2]._ty = 69;
        trigs[2]._tmsg = WM_DIABTOWNWARP;
        trigs[2]._tlvl = 9;
        numtrigs++;
        trigs[3]._tx = 41;
        trigs[3]._ty = 80;
        trigs[3]._tmsg = WM_DIABTOWNWARP;
        trigs[3]._tlvl = 13;
        numtrigs++;
    } else {
        for (int i = 0; i < 3; i++) {
            townwarps[i] = 0;
        }
        if (plr[myplr].pTownWarps & 1) {
            trigs[numtrigs]._tx = 49;
            trigs[numtrigs]._ty = 21;
            trigs[numtrigs]._tmsg = WM_DIABTOWNWARP;
            trigs[numtrigs]._tlvl = 5;
            numtrigs++;
            townwarps[0] = 1;
        }
        if (plr[myplr].pTownWarps & 2) {
            trigs[numtrigs]._tx = 17;
            trigs[numtrigs]._ty = 69;
            trigs[numtrigs]._tmsg = WM_DIABTOWNWARP;
            trigs[numtrigs]._tlvl = 9;
            numtrigs++;
            townwarps[1] = 1;
        }
        if (plr[myplr].pTownWarps & 4) {
            trigs[numtrigs]._tx = 41;
            trigs[numtrigs]._ty = 80;
            trigs[numtrigs]._tmsg = WM_DIABTOWNWARP;
            trigs[numtrigs]._tlvl = 13;
            numtrigs++;
            townwarps[2] = 1;
        }
    }
    _trigflag[sel_data] = 0;
}

void InitL1Triggers(void)
{
    int i, j;

    numtrigs = 0;
    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (GetDPiece(i, j) == 0x81) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABPREVLVL;
                numtrigs++;
            }
            if (GetDPiece(i, j) == 0x73) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABNEXTLVL;
                numtrigs++;
            }
        }
    }
    _trigflag[sel_data] = 0;
}

void InitL2Triggers(void)
{
    int i, j;

    numtrigs = 0;
    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (GetDPiece(i, j) == 0x10B && (i != quests[Q_SCHAMB]._qtx || j != quests[Q_SCHAMB]._qty)) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABPREVLVL;
                numtrigs++;
            }
            if (GetDPiece(i, j) == 0x22F) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABTWARPUP;
                trigs[numtrigs]._tlvl = 0;
                numtrigs++;
            }
            if (GetDPiece(i, j) == 0x10F) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABNEXTLVL;
                numtrigs++;
            }
        }
    }
    _trigflag[sel_data] = 0;
}

void InitL3Triggers(void)
{
    int i, j;

    numtrigs = 0;
    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (GetDPiece(i, j) == 0xAB) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABPREVLVL;
                numtrigs++;
            }
            if (GetDPiece(i, j) == 0xA8) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABNEXTLVL;
                numtrigs++;
            }
            if (GetDPiece(i, j) == 0x225) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABTWARPUP;
                numtrigs++;
            }
        }
    }
    _trigflag[sel_data] = 0;
}

void InitL4Triggers(void)
{
    int i, j;

    numtrigs = 0;
    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (GetDPiece(i, j) == 0x53) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABPREVLVL;
                numtrigs++;
            }
            if (GetDPiece(i, j) == 0x1A6) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABTWARPUP;
                trigs[numtrigs]._tlvl = 0;
                numtrigs++;
            }
            if (GetDPiece(i, j) == 0x78) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABNEXTLVL;
                numtrigs++;
            }
        }
    }

    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (GetDPiece(i, j) == 0x172 && quests[Q_BETRAYER]._qactive == QUEST_DONE) {
                trigs[numtrigs]._tx = i;
                trigs[numtrigs]._ty = j;
                trigs[numtrigs]._tmsg = WM_DIABNEXTLVL;
                numtrigs++;
            }
        }
    }
    _trigflag[sel_data] = 0;
}

void InitSKingTriggers(void)
{
    numtrigs = 1;
    trigs[0]._tx = 82;
    trigs[0]._ty = 42;
    trigs[0]._tmsg = WM_DIABRTNLVL;
    _trigflag[sel_data] = 0;
}

void InitSChambTriggers(void)
{
    numtrigs = 1;
    trigs[0]._tx = 70;
    trigs[0]._ty = 39;
    trigs[0]._tmsg = WM_DIABRTNLVL;
    _trigflag[sel_data] = 0;
}

void InitPWaterTriggers(void)
{
    numtrigs = 1;
    trigs[0]._tx = 30;
    trigs[0]._ty = 83;
    trigs[0]._tmsg = WM_DIABRTNLVL;
    _trigflag[sel_data] = 0;
}
