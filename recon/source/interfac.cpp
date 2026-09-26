/* SOURCE/INTERFAC.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/interfac.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX ShowProgress is heavily stripped vs the PC original: no cutscene/progress-bar system
 * (InitCutscene/DrawCutscene/IncProgress don't exist here), no gbMaxPlayers check (DeltaSaveLevel
 * is unconditional), and the WM_DIABLOADGAME path is dead (app_fatal "OLD uMSG WM_DIABLOADGAME").
 * It additionally re-broadcasts player-1's join location for local 2-player hot-seat (plr[1].plractive). */
#include "diabpsx_types.h"
#include "source/gen/structs_interfac.h"
#include "source/gen/externs_interfac.h"
#include "source/gen/protos_interfac.h"
#include "source/diablo.h"

/* interface_mode (devilution enum); the raw dispatch value is uMsg-0x42 (0x42='B'=WM_DIABNEXTLVL) */
#define WM_DIABNEXTLVL  0
#define WM_DIABPREVLVL  1
#define WM_DIABRTNLVL   2
#define WM_DIABSETLVL   3
#define WM_DIABWARPLVL  4
#define WM_DIABTOWNWARP 5
#define WM_DIABTWARPUP  6
#define WM_DIABRETOWN   7
#define WM_DIABNEWGAME  8
#define WM_DIABLOADGAME 9

/* lvl_entry (devilution gendung_defs.hpp) */
#define ENTRY_MAIN    0
#define ENTRY_PREV    1
#define ENTRY_SETLVL  2
#define ENTRY_RTNLVL  3
#define ENTRY_WARPLVL 5
#define ENTRY_TWARPDN 6
#define ENTRY_TWARPUP 7

/* _cmd_id (devilution msg.h) */
#define CMD_PLAYER_JOINLEVEL 0x35

void interface_msg_pump(void)
{
}

void ShowProgress(unsigned int uMsg)
{
    unsigned long (*saveProc)(unsigned long, unsigned int, long, unsigned long);

    OVR_LoadPregame();
    gbSomebodyWonGameKludge = 0;
    saveProc = GRL_SetWindowProc(DisableInputWndProc);
    interface_msg_pump();
    sound_init();

    if (uMsg != 0x4A)
        DeltaSaveLevel();

    switch (uMsg - 0x42) {
    case WM_DIABLOADGAME:
        app_fatal("OLD uMSG WM_DIABLOADGAME");
        break;
    case WM_DIABNEWGAME:
        FreeGameMem();
        LoadGameLevel(1, ENTRY_MAIN);
        break;
    case WM_DIABNEXTLVL:
        FreeGameMem();
        currlevel++;
        leveltype = gnLevelTypeTbl[currlevel];
        LoadGameLevel(0, ENTRY_MAIN);
        break;
    case WM_DIABPREVLVL:
        FreeGameMem();
        currlevel--;
        leveltype = gnLevelTypeTbl[currlevel];
        LoadGameLevel(0, ENTRY_PREV);
        break;
    case WM_DIABSETLVL:
        SetReturnLvlPos();
        setlevel = 1;
        leveltype = setlvltype;
        FreeGameMem();
        LoadGameLevel(0, ENTRY_SETLVL);
        break;
    case WM_DIABRTNLVL:
        setlevel = 0;
        FreeGameMem();
        GetReturnLvlPos();
        LoadGameLevel(0, ENTRY_RTNLVL);
        break;
    case WM_DIABWARPLVL:
        FreeGameMem();
        GetPortalLevel();
        LoadGameLevel(0, ENTRY_WARPLVL);
        break;
    case WM_DIABTOWNWARP:
        FreeGameMem();
        currlevel = plr[myplr].plrlevel;
        leveltype = gnLevelTypeTbl[currlevel];
        LoadGameLevel(0, ENTRY_TWARPDN);
        break;
    case WM_DIABTWARPUP:
        FreeGameMem();
        currlevel = plr[myplr].plrlevel;
        leveltype = gnLevelTypeTbl[currlevel];
        LoadGameLevel(0, ENTRY_TWARPUP);
        break;
    case WM_DIABRETOWN:
        FreeGameMem();
        currlevel = plr[myplr].plrlevel;
        leveltype = gnLevelTypeTbl[currlevel];
        LoadGameLevel(0, ENTRY_MAIN);
        break;
    }

    OVR_LoadGame();
    SyncPortals();
    GRL_SetWindowProc(saveProc);

    NetSendCmdLocParam1(1, CMD_PLAYER_JOINLEVEL, plr[myplr]._px, plr[myplr]._py, (unsigned short)plr[myplr].plrlevel);
    if (plr[1].plractive) {
        myplr = 1;
        NetSendCmdLocParam1(1, CMD_PLAYER_JOINLEVEL, plr[myplr]._px, plr[myplr]._py, (unsigned short)plr[myplr].plrlevel);
        myplr = 0;
    }

    ResetPal();
    gbSomebodyWonGameKludge = 0;
}
