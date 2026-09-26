/* DIABLO.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/DIABLO.CPP +
 * refs/devilution/Source/diablo.cpp (heavily PSX-specific: task-loop game_loop/run_game_loop instead of
 * the PC WndProc message pump, 2-player split-screen Lsaveplrpos/Lrestoreplrpos brackets in
 * LoadGameLevel, GSYS_SetStackAndJump-based CreateLevel with a private allocated stack).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_diablo.h"
#include "psxsrc/sysobj.h"
#include "psxsrc/fileio.h"
#include "psxsrc/sysinit.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"
#include "source/gen/externs_diablo.h"
#include "source/gen/protos_diablo.h"
#include "source/diablo.h"

#define MAX_PLRS 2

void FreeGameMem(void)
{
    music_stop();
    FreeObjectGFX();
    FreeMonsterSnd();
    FreeTownerGFX();
}

void start_game(unsigned int uMsg)
{
    gbDoEnding = 0;
    svgamode = 1;
    InitCursor();
    InitLightTable();
    music_stop();
    ShowProgress(uMsg);

    if (!DoLoadedGame) {
        if (!LoadedChar[0])
            SetQSpell(0, -1, 4);
        else {
            pad_func_Quick_Spell(0);
            pad_func_Quick_Spell(0);
        }

        if (!LoadedChar[1])
            SetQSpell(1, -1, 4);
        else {
            pad_func_Quick_Spell(1);
            pad_func_Quick_Spell(1);
        }

        LoadedChar[1] = 0;
        LoadedChar[0] = 0;
    }
    InitLevelCursor();
    D_8011B7A8 = 0;
    sgbMouseDown = 0;
}

void free_game(void)
{
    FreeControlPan();
    FreeInvGFX();
    FreeQuestText();
    FreeStoreMem();
    for (int i = 0; i < MAX_PLRS; i++)
        FreePlayerGFX(i);
    FreeItemGFX();
    FreeCursor();
    FreeLightTable();
    FreeGameMem();
}

void LittleStart(unsigned char bNewGame, unsigned char bSinglePlayer)
{
    unsigned char fExitProgram = 0;
    unsigned int uMsg;

    if (!NetInit(bSinglePlayer, &fExitProgram))
        gbRunGameResult = !fExitProgram;

    if (bNewGame || !gbValidSaveFile) {
        currlevel = 1;
        leveltype = 1;
        setlevel = 1;
        InitLevels();
        InitQuests();
        InitPortals();
        InitDungMsgs(myplr);
        uMsg = 0x4A;
    } else {
        uMsg = 0x4B;
    }
    start_game(uMsg);
}

unsigned char StartGame(unsigned char bNewGame, unsigned char bSinglePlayer)
{
    unsigned char fExitProgram;
    unsigned int uMsg;

    gbSelectProvider = 1;
    InitGamePadVars();

    do {
        fExitProgram = 0;
        if (!NetInit(bSinglePlayer, &fExitProgram)) {
            gbRunGameResult = !fExitProgram;
            break;
        }
        gbSelectProvider = 0;

        if (bNewGame && demo_pad_time) {
            currlevel = level_record;
            leveltype = gnLevelTypeTbl[(unsigned char)level_record];
            uMsg = 0;
            GRL_PostMessage(ghMainWnd, 0x4D, 0, 0);
        } else if (!bNewGame && gbValidSaveFile) {
            uMsg = 0;
            GRL_PostMessage(ghMainWnd, 0x4B, 0, 0);
        } else {
            OVR_LoadPregame();
            uMsg = 0x4A;
            InitLevels();
            InitQuests();
            InitPortals();
            InitDungMsgs(myplr);
        }

        if (FePlayerNo && !plr[1].plractive && plr[1]._pHitPoints) {
            NetSendCmdLocParam1(1, 0x35, plr[1]._px, plr[1]._py, plr[0].plrlevel);
            plr[1].plractive = 1;
            myplr = 0;
        }

        SetAmbientLight();
        run_game_loop(uMsg);
    } while (gbMaxPlayers != 1 && gbRunGameResult);

    return gbRunGameResult;
}

void run_game_loop(unsigned int uMsg)
{
    WNDPROC saveProc;
    struct MSG msg;   /* unused PC message-loop leftover; retail's SYM keeps the frame slot */

    (void)msg;
    start_game(uMsg);
    saveProc = GRL_SetWindowProc(GM_Game);
    gbRunGame = 1;
    gbProcessPlayers = 1;
    gbRunGameResult = 1;
    force_redraw = 0xFF;
    ClrDiabloMsg();
    force_redraw = 0xFF;
    gbGameLoopStartup = 1;
    plr_encrypt(1);

    if (!DoLoadedGame)
        ML_Init();
    DoLoadedGame = 0;
    DiabloDieFlag = 0;

    while (gbRunGame) {
        if (!plr[0].plractive)
            myplr = 1;
        plr_encrypt(0);
        game_loop(gbGameLoopStartup);
        gbGameLoopStartup = 0;
        plr_encrypt(1);
        TSK_Sleep(1);
    }

    plr_encrypt(0);
    SetCursor(0);
    force_redraw = 0xFF;
    GRL_SetWindowProc(saveProc);
    free_game();
    music_fade();
    if (PaletteFadeOut(8)) {
        while (GetFadeState())
            TSK_Sleep(1);
    }
    music_stop();
}

BOOL TryIconCurs(void)
{
    if (_pcurs[myplr] == 8) {                   /* CURSOR_RESURRECT */
        NetSendCmdParam1(1, 0x1A, _pcursplr[sel_data]);
        return 1;
    }
    if (_pcurs[myplr] == 0xA) {                 /* CURSOR_HEALOTHER */
        NetSendCmdParam1(1, 0x4D, _pcursplr[sel_data]);
        return 1;
    }
    if (_pcurs[myplr] == 7) {                   /* CURSOR_TELEKINESIS */
        DoTelekinesis();
        return 1;
    }
    if (_pcurs[myplr] == 2) {                   /* CURSOR_IDENTIFY */
        if (_pcursinvitem[sel_data] != -1)
            CheckIdentify(myplr, _pcursinvitem[sel_data]);
        NewCursor(1);
        return 1;
    }
    if (_pcurs[myplr] == 3) {                   /* CURSOR_REPAIR */
        if (_pcursinvitem[sel_data] != -1)
            DoRepair(myplr, _pcursinvitem[sel_data]);
        NewCursor(1);
        return 1;
    }
    if (_pcurs[myplr] == 4) {                   /* CURSOR_RECHARGE */
        if (_pcursinvitem[sel_data] != -1)
            DoRecharge(myplr, _pcursinvitem[sel_data]);
        NewCursor(1);
        return 1;
    }
    if (_pcurs[myplr] == 9) {                   /* CURSOR_TELEPORT / TARGET */
        if (_pcursplr[sel_data] != -1)
            NetSendCmdParam3(1, 0x19, _pcursplr[sel_data], plr[myplr]._pTSpell, GetSpellLevel(myplr, plr[myplr]._pTSpell));
        else
            NetSendCmdLocParam2(1, 0xF, cursmx, cursmy, plr[myplr]._pTSpell, GetSpellLevel(myplr, plr[myplr]._pTSpell));
        NewCursor(1);
        return 1;
    }
    if (_pcurs[myplr] == 5 && _pcursobj[sel_data] == -1) {   /* CURSOR_DISARM */
        NewCursor(1);
        return 1;
    }
    return 0;
}

unsigned long DisableInputWndProc(unsigned long hWnd, unsigned int uMsg, long wParam, unsigned long lParam)
{
    return 0;
}

unsigned long GM_Game(unsigned long hWnd, unsigned int uMsg, long wParam, unsigned long lParam)
{
    if (uMsg != 1) {
        if (uMsg == 0)
            return 0;
        if (uMsg >= 0x4A)
            return 0;
        if (uMsg < 0x42)
            return 0;

        sound_stop();
        music_stop();
        sgbMouseDown = 0;
        ShowProgress(uMsg);
        force_redraw = 0xFF;
        gbGameLoopStartup = 1;
        return 0;
    }
    if (wParam)
        return 0;
    gbRunGame = 0;
    gbRunGameResult = 0;
    return 0;
}

void LoadLvlGFX(void)
{
    char *LoadFile = 0;

    if (leveltype < 5) {
        switch (leveltype) {
        case 0: LoadFile = "Town.TIL"; break;
        case 1: LoadFile = "L1.TIL"; break;
        case 2: LoadFile = "L2.TIL"; break;
        case 3: LoadFile = "L3.TIL"; break;
        case 4: LoadFile = "L4.TIL"; break;
        }
    }
    if (!LoadFile)
        DBG_Error(0, "source/DIABLO.cpp", 0x98B);
    LoadMegaTiles(LoadFile);
}

void LoadMegaTiles(const char *LoadFile)
{
    FileIO *MyIo = SYSI_GetFs();

    if (MyIo->FileLen(LoadFile) >= 0xAB1)
        DBG_Error(0, "source/DIABLO.cpp", 0x99D);
    if (MyIo->ReadAtAddr(LoadFile, pMegaTiles, -1) == 0)
        DBG_Error(0, "source/DIABLO.cpp", 0x9A0);
}

void LoadAllGFX(void)
{
    InitObjectGFX();
}

void CreateLevel(int lvldir)
{
    long hnd;

    hnd = GAL_Alloc(0x14000, 1, "STACK");
    if (hnd == -1)
        DBG_Error(0, "source/DIABLO.cpp", 0x9CF);
    D_8011C7B4 = (unsigned char *)GAL_Lock(hnd);
    if (!D_8011C7B4)
        DBG_Error(0, "source/DIABLO.cpp", 0x9D2);
    D_8011C7B4 = D_8011C7B4 + 0x13FFC;
    if (!setjmp(D_8012EC28)) {
        D_8011C7B0 = lvldir;
        GSYS_SetStackAndJump(D_8011C7B4, LoCreateLevel, 0);
    }
    if (!GAL_Free(hnd))
        DBG_Error(0, "source/DIABLO.cpp", 0x9DD);
}

void LoCreateLevel(void *)
{
    int lvldir = D_8011C7B0;

    if (leveltype < 5) {
        switch (leveltype) {
        case 0:
            CreateTown(lvldir);
            InitTownTriggers();
            LoadRndLvlPal(0);
            break;
        case 1:
            CreateL5Dungeon(glSeedTbl[currlevel], lvldir);
            InitL1Triggers();
            Freeupstairs();
            LoadRndLvlPal(1);
            break;
        case 2:
            CreateL2Dungeon(glSeedTbl[currlevel], lvldir);
            InitL2Triggers();
            Freeupstairs();
            LoadRndLvlPal(2);
            break;
        case 3:
            CreateL3Dungeon(glSeedTbl[currlevel], lvldir);
            InitL3Triggers();
            Freeupstairs();
            LoadRndLvlPal(3);
            break;
        case 4:
            CreateL4Dungeon(glSeedTbl[currlevel], lvldir);
            InitL4Triggers();
            Freeupstairs();
            LoadRndLvlPal(4);
            break;
        }
    }
    longjmp(D_8012EC28, 1);
}

void ClearOutDungeonMap(void)
{
    BOOL istown = 0;
    unsigned short val = 0;
    int x, y;

    if (!mydflags)
        DBG_Error(0, "source/DIABLO.cpp", 0xA25);

    switch (leveltype) {
    case 1: val = 0x16; break;
    case 2: val = 0xC; break;
    case 3: val = 8; break;
    case 4: val = 0x14; break;
    default: istown = 1; break;
    }

    for (x = 0; x < 112; x++) {
        for (y = 0; y < 112; y++) {
            dung_map[x][y].dBits = 0;
            dung_map[x][y].dObject = 0;
            dung_map[x][y].dItem = 0;
            dung_map[x][y].dMissile = 0;
            dung_map[x][y].dFlags = 0;
            dung_map[x][y].dTransVal = 0;
            dung_map[x][y].dMonster = 0;
        }
    }

    if (!istown) {
        for (y = 0; y < 40; y++)
            for (x = 0; x < 40; x++)
                mydflags[y * 40 + x] = 0;
        for (y = 0; y < 40; y++)
            for (x = 0; x < 40; x++)
                pdungeon[y][x] = 0;
        for (y = 0; y < 48; y++)
            for (x = 0; x < 48; x++)
                dungeon[y][x] = val;
    }
}

void AddQuestItems(void)
{
    if (QuestStatus(Q_ROCK) && !quests[Q_ROCK].pad_for_laz)
        SpawnRock();
    if (QuestStatus(Q_ANVIL) && !quests[Q_ANVIL].pad_for_laz)
        SpawnQuestItem(IDI_ANVIL, 2 * setpc_x + 27, 2 * setpc_y + 27, 0, 1);
}

void AllSolid(int x, int y)
{
    SetSOLID(x, y);
    SetMISSILE(x, y);
}

void FillCrapBits(void)
{
    struct QuestStruct *qs;
    int x, y;

    switch (currlevel) {
    case 3:
        if (!setlevel) {                               /* Q_SKELKING */
            if (quests[12]._qactive) {
                AllSolid(quests[12]._qtx - 1, quests[12]._qty);
                AllSolid(quests[12]._qtx - 1, quests[12]._qty - 2);
            }
        }
        break;
    case 15:
        qs = &quests[15];                              /* Q_BETRAYER */
        if (setlevel) {
            if (qs->_qactive) {
                if (setlvlnum == qs->_qslvl) {
                    for (y = 18; y < 62; y++)
                        for (x = 56; x < 58; x++)
                            AllSolid(x, y);
                    for (y = 60; y < 62; y++)
                        for (x = 40; x < 46; x++)
                            AllSolid(x, y);
                    if (qs->_qvar1 < 4) {
                        AllSolid(0x20, 0x30);
                        AllSolid(0x21, 0x30);
                        AllSolid(0x20, 0x31);
                        AllSolid(0x21, 0x31);
                    }
                }
            }
        }
        break;
    }
}

void Lsaveplrpos(void)
{
    plr[1]._pVar1 = ViewX;
    plr[1]._pVar2 = ViewY;
    plr[1]._pVar3 = plr[1]._px;
    plr[1]._pVar4 = plr[1]._py;
    plr[1]._pVar5 = plr[0]._px;
    plr[1]._pVar6 = plr[0]._py;
    if (plr[1].plractive) {
        plr[1]._py = 0;
        plr[1]._px = 0;
    }
    if (plr[0].plractive) {
        plr[0]._py = 0;
        plr[0]._px = 0;
    }
}

void Lrestoreplrpos(void)
{
    PlacePlayer(1, plr[1]._pVar3, plr[1]._pVar4, 0);
    PlacePlayer(0, plr[1]._pVar5, plr[1]._pVar6, 0);
}

/* SYM OPEN (2026-09-27): huge PSX-only function (2-player split-screen dungeon load, own
 * GSYS_SetStackAndJump'd CreateLevel, doubled theme/monster/item init per view via the
 * Lsaveplrpos/Lrestoreplrpos brackets).  Call-sequence transcribed from the raw oracle jal trace
 * (AllocdPiece/Tmalloc, SND_LoadBank, MakeLightTable, LoadLvlGFX, ClearOutDungeonMap, InitInv/
 * InitItemGFX/InitQuestText, InitStores, InitAutomapOnce, SetupTownStores, InitAutomap, InitLighting/
 * InitVision, InitLevelMonsters, CreateLevel, FillSolidBlockTbls, GetLevelMTypes, InitThemes,
 * LoadAllGFX, GetReturnLvlPos/GetPortalLvlPos, WorldToOffset, PlayDungMsgs, InitMultiView,
 * Lsaveplrpos -> {HoldThemeRooms,InitMonsters,InitObjects,InitItems,CreateThemeRooms,InitMissiles,
 * InitDead,AddQuestItems} x2 (once per split-screen half) -> SavePreLighting, Lrestoreplrpos,
 * InitTowners/InitItems/InitMissiles/InitBird (town arm), DeltaLoadLevel, ResyncQuests, setlevel arm
 * (LoadSetMap + a second FillSolidBlockTbls/GetLevelMTypes/InitMonsters/InitItems/InitDead run),
 * SetDungeonMicros, InitLightMax, InitControlPan, ConvertdPiece, BuildLevTrigs, Tfree/FreedPiece,
 * ClrDiabloMsg, FillCrapBits, per-player InitPlayerGFX/InitPlayer/PlacePlayer/AddVision/
 * ChangeLightXY/ChangeLightOff, ProcessLightList/ProcessVisionList).  Structural draft below follows
 * that order and devilution's LoadGameLevel branch shape; NOT yet verify_asm-gated (~640 oracle
 * instructions) -- falsified nothing yet since no attempt has been gated; next angle: split into the
 * dungeon-arm vs setlevel-arm vs town-arm bodies and gate each independently with VA_CTX for the
 * exact statement order/branch polarity once split_asm can slice the middle of the function. */
void LoadGameLevel(unsigned char firstflag, int lvldir)
{
    int i;
    BOOL visited;

    if (setseed)
        glSeedTbl[currlevel] = setseed;

    AllocdPiece();
    Tmalloc(0x14000);
    music_stop();
    SetCursor(0);
    SetRndSeed(glSeedTbl[currlevel]);
    SND_LoadBank(currlevel);
    MakeLightTable();
    LoadLvlGFX();
    ClearOutDungeonMap();

    if (firstflag) {
        InitInv();
        InitItemGFX();
        InitQuestText();
        InitStores();
        InitAutomapOnce();
    }

    SetRndSeed(glSeedTbl[currlevel]);

    if (leveltype == 0)
        SetupTownStores();

    InitAutomap();

    if (leveltype != 0 && lvldir != 3)
        InitLighting();
    InitVision();

    InitLevelMonsters();

    if (!setlevel) {
        CreateLevel(lvldir);
        FillSolidBlockTbls();
        SetRndSeed(glSeedTbl[currlevel]);

        if (leveltype != 0) {
            GetLevelMTypes();
            InitThemes();
            LoadAllGFX();
        }

        if (lvldir == 2)
            GetReturnLvlPos();
        if (lvldir == 1)
            GetPortalLvlPos();

        WorldToOffset(myplr, plr[myplr]._px, plr[myplr]._py);

        for (i = 0; i < MAX_PLRS; i++) {
            if (plr[i].plractive && currlevel == plr[i].plrlevel) {
                InitPlayerGFX(i);
                if (lvldir != 4)
                    InitPlayer(i, firstflag);
            }
        }

        PlayDungMsgs();
        InitMultiView();

        if (leveltype != 0) {
            Lsaveplrpos();
            HoldThemeRooms();
            GetRndSeed();
            ConvertdPiece();
            InitMonsters();
            GetRndSeed();
            InitObjects();
            InitItems(0);
            CreateThemeRooms();
            GetRndSeed();
            InitMissiles();
            InitDead();
            AddQuestItems();
            GetRndSeed();
            DeltaLoadLevel();

            Lsaveplrpos();
            HoldThemeRooms();
            GetRndSeed();
            ConvertdPiece();
            InitMonsters();
            GetRndSeed();
            InitObjects();
            InitItems(0);
            CreateThemeRooms();
            GetRndSeed();
            InitMissiles();
            InitDead();
            AddQuestItems();
            GetRndSeed();

            SavePreLighting();
            Lrestoreplrpos();
        } else {
            InitTowners();
            InitItems(0);
            InitMissiles();
            InitBird();
            DeltaLoadLevel();
            ResyncQuests();
        }
    } else {
        Lsaveplrpos();
        LoadSetMap();
        FillSolidBlockTbls();
        GetLevelMTypes();
        InitMonsters();
        InitItems(0);
        InitDead();
        DeltaLoadLevel();

        if (lvldir == 1)
            GetPortalLvlPos();

        Lrestoreplrpos();
        InitMultiView();
        DeltaLoadLevel();
        SavePreLighting();
        ResyncQuests();
        InitMissiles();
    }

    SetDungeonMicros();
    InitLightMax();
    InitControlPan();
    ConvertdPiece();
    BuildLevTrigs();
    Tfree(0);
    FreedPiece();
    ClrDiabloMsg();
    FillCrapBits();

    visited = 0;
    for (i = 0; i < MAX_PLRS; i++) {
        if (plr[i].plractive && plr[i].plrlevel == currlevel) {
            InitPlayerGFX(i);
            InitPlayer(i, firstflag);
            PlacePlayer(i, plr[i]._px, plr[i]._py, 0);
            AddVision(plr[i]._px, plr[i]._py, plr[i]._pLightRad, i == myplr);
            ChangeLightXY(plr[i]._plid, plr[i]._px, plr[i]._py);
            ChangeLightOff(plr[i]._plid, 0, 0);
        }
    }

    ProcessLightList();
    ProcessVisionList();
    (void)visited;
}

void SetSpeed(enum GM_SPEEDS Speed)
{
    LastFrCount = -1;
    GameSpeed = Speed;
}

enum GM_SPEEDS GetSpeed(void)
{
    return GameSpeed;
}

void game_logic(void)
{
    int Frames, ThisTick, SinceLast;

    if (PauseMode)
        return;

    switch (GameSpeed) {
    case GM_SPEED_NORMAL:
        Frames = 3;
        break;
    case GM_SPEED_FAST:
        Frames = 2;
        break;
    default:
        DBG_Error(0, "source/DIABLO.cpp", 0xC7D);
        Frames = 1;
        break;
    }

    if (!D_8011B7A8)
        CheckCursMove();

    ThisTick = VID_GetTick();
    SinceLast = Frames;
    if (LastFrCount != -1)
        SinceLast = ThisTick - LastFrCount;
    if (SinceLast > 5)
        SinceLast = 5;
    if (SinceLast < Frames)
        return;

    if (demo_pad_time)
        PAD_Handler();
    if (gbProcessPlayers)
        ProcessPlayers();

    if (leveltype) {
        ProcessMonsters();
        ProcessObjects();
        ProcessMissiles();
        ProcessItems();
        ProcessLightList();
        ProcessVisionList();
    } else {
        ProcessTowners();
        ProcessItems();
        ProcessLightList();
        ProcessBird();
        ProcessMissiles();
    }
    sound_update();

    if (plr[0].plractive) {
        myplr = 0;
        CheckTriggers(0);
    }
    if (plr[1].plractive) {
        myplr = 1;
        CheckTriggers(1);
    }
    myplr = 0;
    CheckQuests();

    LastFrCount = ThisTick - (SinceLast - Frames);
    force_redraw |= 1;
}

void timeout_cursor(unsigned char bTimeout)
{
    if (bTimeout) {
        if (D_8011B7A8 || sgbMouseDown)
            return;
        D_8011B7A8 = _pcurs[myplr];
        ClearPanel();
        NewCursor(0xB);
        force_redraw = 0xFF;
    } else {
        if (!D_8011B7A8)
            return;
        SetCursor(D_8011B7A8);
        D_8011B7A8 = 0;
        ClearPanel();
        force_redraw = 0xFF;
    }
}

void game_loop(unsigned char bStartup)
{
    if (IsGameLoading()) {
        D_8011C7B8 = 0;
        return;
    }
    if (!D_8011C7B8) {
        D_8011C7B8 = 1;
        PA_SetPauseOk(1);
    }
    timeout_cursor(0);
    game_logic();
}

void alloc_plr(void)
{
}

void plr_encrypt(unsigned char bEncrypt)
{
}

void assert_fail(int nLineNo, const char *pszFile, const char *pszFail)
{
    DBG_Halt();
}

void assert_fail(int nLineNo, const char *pszFile)
{
    DBG_Halt();
}

extern "C" void app_fatal(char *pszFile, ...)
{
    DBG_Halt();
}

void DoMemCardFromFrontEnd(void)
{
    OVR_LoadMemcard();
    OVR_LoadFrontend();
}

void DoMemCardFromInGame(void)
{
    OVR_LoadMemcard();
    OVR_LoadGame();
}
