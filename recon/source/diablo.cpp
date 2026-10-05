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

/* File-local functions: retail SYM gives these class STAT (static); no other TU calls them. */
static void start_game(unsigned int uMsg);   /* @0x80037FE4 DIABLO.CPP:312 */
static void free_game(void);   /* @0x800380D4 DIABLO.CPP:357 */
static void run_game_loop(unsigned int uMsg);   /* @0x8003840C DIABLO.CPP:532 */
static unsigned long GM_Game(unsigned long hWnd, unsigned int uMsg, long wParam, unsigned long lParam);   /* @0x8003889C DIABLO.CPP:2245 */
static void AllSolid(int x, int y);   /* @0x80038F94 DIABLO.CPP:2710 */
static void Lsaveplrpos(void);   /* @0x80039174 DIABLO.CPP:2755 */
static void Lrestoreplrpos(void);   /* @0x80039220 DIABLO.CPP:2776 */
static void game_logic(void);   /* @0x80039BC8 DIABLO.CPP:3175 */
static void timeout_cursor(unsigned char bTimeout);   /* @0x80039DB0 DIABLO.CPP:3278 */
static void game_loop(unsigned char bStartup);   /* @0x80039E58 DIABLO.CPP:3317 */
static void plr_encrypt(unsigned char bEncrypt);   /* @0x80039EC0 DIABLO.CPP:3516 */
#include "source/diablo.h"

#define MAX_PLRS 2

/* Original unused GMAN/CPLAYER header inlines retain their retail filename pool. */
struct TextDat {
    BOOL OwnDat;
    int TexNum;
    int LastFrame;
    BOOL DatLoaded;
    long hndDat;
    unsigned char rest[112 - 0x14];

    void DumpDatFile();
};

inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd))
            DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

class CPlayer;
extern CPlayer *_7CPlayer_PActiveArray[2];
class CPlayer : public TextDat {
public:
    unsigned char player_data[144 - 112];

    static CPlayer *GetPlayer(int PNum)
    {
        if (1 < (unsigned int)PNum)
            DBG_Error(NULL, "psxsrc/cplayer.h", 0x41);
        return _7CPlayer_PActiveArray[PNum];
    }
};

/* file statics (SYM class STAT, .bss @0x8012EAE8..) */
static int glEndSeed[17];
static int glMid1Seed[17];
static int glMid2Seed[17];
static int glMid3Seed[17];
static int CreateEnv[12];

void FreeGameMem(void)
{
    music_stop();
    FreeObjectGFX();
    FreeMonsterSnd();
    FreeTownerGFX();
}

static void start_game(unsigned int uMsg)
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
    }
    LoadedChar[1] = 0;
    LoadedChar[0] = 0;
    InitLevelCursor();
    D_8011B7A8 = 0;
    sgbMouseDown = 0;
}

static void free_game(void)
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
    gbSelectProvider = 1;
    InitGamePadVars();

    while (1) {
        unsigned char fExitProgram;
        unsigned int uMsg;

        fExitProgram = 0;
        if (!NetInit(bSinglePlayer, &fExitProgram)) {
            gbRunGameResult = !fExitProgram;
            break;
        }

        gbSelectProvider = 0;

        if (bNewGame && demo_pad_time) {
            currlevel = level_record;
            leveltype = gnLevelTypeTbl[(unsigned char)level_record];
            GRL_PostMessage(ghMainWnd, 0x4D, 0, 0);
            uMsg = 0;
        } else if (bNewGame || !gbValidSaveFile) {
            OVR_LoadPregame();
            uMsg = 0x4A;
            InitLevels();
            InitQuests();
            InitPortals();
            InitDungMsgs(myplr);
        } else {
            GRL_PostMessage(ghMainWnd, 0x4B, 0, 0);
            uMsg = 0;
        }

        if (FePlayerNo && !plr[1].plractive && plr[1]._pHitPoints) {
            myplr = 1;
            NetSendCmdLocParam1(1, 0x35, plr[myplr]._px, plr[myplr]._py, plr[0].plrlevel);
            plr[1].plractive = 1;
            myplr = 0;
        }

        SetAmbientLight();
        run_game_loop(uMsg);

        if (gbMaxPlayers == 1)
            break;
        if (!gbRunGameResult)
            break;
    }

    return gbRunGameResult;
}

static void run_game_loop(unsigned int uMsg)
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

unsigned char TryIconCurs(void)
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

static unsigned long GM_Game(unsigned long hWnd, unsigned int uMsg, long wParam, unsigned long lParam)
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
    if (!setjmp(CreateEnv)) {
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
    longjmp(CreateEnv, 1);
}

void ClearOutDungeonMap(void)
{
    BOOL istown = 0;
    unsigned short val = 0;

    if (!mydflags)
        DBG_Error(0, "source/DIABLO.cpp", 0xA25);

    switch (leveltype) {
    case 1: val = 0x16; break;
    case 2: val = 0xC; break;
    case 3: val = 8; break;
    case 4: val = 0x14; break;
    default: istown = 1; break;
    }

    for (int x = 0; x < 112; x++) {
        for (int y = 0; y < 112; y++) {
            dung_map[x][y].dBits = 0;
            dung_map[x][y].dObject = 0;
            dung_map[x][y].dItem = 0;
            dung_map[x][y].dMissile = 0;
            dung_map[x][y].dFlags = 0;
            dung_map[x][y].dTransVal = 0;
            dung_map[x][y].dMonster = 0;
        }
    }

    if (istown)
        return;

    for (int y = 0; y < 40; y++)
        for (int x = 0; x < 40; x++)
            mydflags[y * 40 + x] = 0;
    for (int y = 0; y < 40; y++)
        for (int x = 0; x < 40; x++)
            pdungeon[x][y] = 0;
    for (int y = 0; y < 48; y++)
        for (int x = 0; x < 48; x++)
            dungeon[x][y] = val;
}

void AddQuestItems(void)
{
    if (QuestStatus(Q_ROCK) && !quests[Q_ROCK].pad_for_laz)
        SpawnRock();
    if (QuestStatus(Q_ANVIL) && !quests[Q_ANVIL].pad_for_laz)
        SpawnQuestItem(IDI_ANVIL, 2 * setpc_x + 27, 2 * setpc_y + 27, 0, 1);
}

static void AllSolid(int x, int y)
{
    SetSOLID(x, y);
    SetMISSILE(x, y);
}

void FillCrapBits(void)
{
    struct QuestStruct *qs;

    switch (currlevel) {
    case 3:                                             /* Q_SKELKING */
        if (setlevel)
            break;
        if (!quests[12]._qactive)
            break;
        AllSolid(quests[12]._qtx - 1, quests[12]._qty);
        AllSolid(quests[12]._qtx - 1, quests[12]._qty - 2);
        break;
    case 15:
        qs = &quests[15];                              /* Q_BETRAYER */
        if (setlevel && qs->_qactive && setlvlnum == qs->_qslvl) {
            int x, y;

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
        break;
    }
}

static void Lsaveplrpos(void)
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

static void Lrestoreplrpos(void)
{
    PlacePlayer(1, plr[1]._pVar3, plr[1]._pVar4, 0);
    PlacePlayer(0, plr[1]._pVar5, plr[1]._pVar6, 0);
}

/* SYM OPEN (2026-09-27, second pass): fully re-derived from the raw oracle jal/branch trace
 * (scratch/tuinfo.py DIABLO.CPP LoadGameLevel__FUci, 637 lines) rather than devilution's shape --
 * several branches run OPPOSITE to the first draft's guess (see below).  Not yet verify_asm-gated
 * end-to-end (~640 oracle insns); next angle: gate the 3 arms (dungeon/town/setlevel) separately via
 * VA_CTX once a sub-range verify helper exists.  Confirmed structural facts this pass:
 *  - the earlier draft had a bogus DUPLICATE per-player InitPlayerGFX/InitPlayer loop mid-function;
 *    the oracle has only ONE such loop, at the very end (with AddVision/PlacePlayer too).
 *  - the "SIMPLE vs record-seeds" dungeon choice and the town/setlevel DeltaLoadLevel gate all share
 *    ONE condition, `!firstflag && (lvldir==4 || plr[myplr]._pLvlVisited[currlevel])`; when TRUE take
 *    the plain path (calls DeltaLoadLevel, no seed bookkeeping); when FALSE take the "fresh split-
 *    screen generation" path (records the 4 generation RNG seeds into glMid1/2/3Seed+glEndSeed,
 *    passes InitItems(1) not (0), and skips DeltaLoadLevel entirely) -- opposite of the first draft's
 *    "doubled calls" guess (there is no duplication; it is a real if/else). */
void LoadGameLevel(unsigned char firstflag, int lvldir)
{
    int i, j;

    AllocdPiece();
    mydflags = (unsigned char *)Tmalloc(0x640);
    if (setseed)
        glSeedTbl[currlevel] = setseed;
    music_stop();
    SetCursor(1);
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

    if (!leveltype)
        SetupTownStores();

    InitAutomap();
    InitLighting();
    InitVision();
    InitLevelMonsters();

    if (!setlevel) {
        unsigned char visited;

        CreateLevel(lvldir);
        FillSolidBlockTbls();
        SetRndSeed(glSeedTbl[currlevel]);

        if (leveltype) {
            GetLevelMTypes();
            SetRndSeed(glSeedTbl[currlevel]);
            InitThemes();
            LoadAllGFX();
        }

        if (lvldir == 3)
            GetReturnLvlPos();
        if (lvldir == 5) {
            GetPortalLvlPos();
            if (plr[0].plractive) {
                if (plr[1].plractive)
                    WorldToOffset(0, ViewX << 3, ViewY << 3);
            }
        }

        PlayDungMsgs();
        InitMultiView();

        visited = 0;
        for (i = 0; i <= FePlayerNo; i++) {
            if (plr[i].plractive)
                visited = visited || plr[i]._pLvlVisited[currlevel];
        }

        SetRndSeed(glSeedTbl[currlevel]);

        if (leveltype) {
            Lsaveplrpos();
            if (!firstflag && lvldir != 4 && plr[myplr]._pLvlVisited[currlevel] || !firstflag && lvldir == 4) {
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
            } else {
                HoldThemeRooms();
                glMid1Seed[currlevel] = GetRndSeed();
                ConvertdPiece();
                InitMonsters();
                glMid2Seed[currlevel] = GetRndSeed();
                InitObjects();
                InitItems(1);
                CreateThemeRooms();
                glMid3Seed[currlevel] = GetRndSeed();
                InitMissiles();
                InitDead();
                AddQuestItems();
                glEndSeed[currlevel] = GetRndSeed();
            }
            SavePreLighting();
            Lrestoreplrpos();
        } else {
            for (i = 0; i < 96; i++)
                for (j = 0; j < 96; j++)
                    dung_map[i][j].dFlags |= 3;
            InitTowners();
            InitItems(1);
            InitMissiles();
            InitBird();
            if (!firstflag && lvldir != 4 && plr[myplr]._pLvlVisited[currlevel] || !firstflag && lvldir == 4)
                DeltaLoadLevel();
        }
        ResyncQuests();
    } else {
        Lsaveplrpos();
        LoadSetMap();
        FillSolidBlockTbls();
        GetLevelMTypes();
        InitMonsters();
        InitItems(1);
        InitDead();
        if (lvldir == 4)
            DeltaLoadLevel();
        if (lvldir == 5)
            GetPortalLvlPos();
        Lrestoreplrpos();
        InitMultiView();
        if (!firstflag && lvldir != 4 && plr[myplr]._pSLvlVisited[setlvlnum])
            DeltaLoadLevel();
        else
            SavePreLighting();
        ResyncQuests();
        InitMissiles();
    }

    myplr = 0;
    if (leveltype)
        SetDungeonMicros();
    InitLightMax();
    if (firstflag)
        InitControlPan();
    last_type = visible_level;
    visible_level = leveltype;
    ConvertdPiece();
    BuildLevTrigs();
    Tfree(mydflags);
    mydflags = 0;
    FreedPiece();
    ClrDiabloMsg();
    FillCrapBits();

    for (i = 0; i <= FePlayerNo; i++) {
        plr[i].plrlevel = currlevel;
        InitPlayerGFX(i);
        if (lvldir != 4) {
            if (!LoadedChar[i])
                InitPlayer(i, firstflag);
            else
                PlacePlayer(i, ViewX, ViewY, 0);
        } else
            plr[i]._pvid = AddVision(plr[i]._px, plr[i]._py, 10, i);
    }

    ChangeLightXY(plr[0]._plid, plr[0]._px, plr[0]._py);
    ChangeLightOff(plr[0]._plid, (plr[0].WorldX & 0xF) - 8, (plr[0].WorldY & 0xF) - 8);
    if (FePlayerNo) {
        ChangeLightXY(plr[1]._plid, plr[1]._px, plr[1]._py);
        ChangeLightOff(plr[1]._plid, (plr[1].WorldX & 0xF) - 8, (plr[1].WorldY & 0xF) - 8);
    }

    if (leveltype) {
        ProcessLightList();
        ProcessVisionList();
    }
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

static void game_logic(void)
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

static void timeout_cursor(unsigned char bTimeout)
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

static void game_loop(unsigned char bStartup)
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

static void plr_encrypt(unsigned char bEncrypt)
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
