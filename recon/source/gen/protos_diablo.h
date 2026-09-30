typedef unsigned long (*WNDPROC)(unsigned long hWnd, unsigned int uMsg, long wParam, unsigned long lParam);

/* PsyQ setjmp.h (psyq400/PSX/INCLUDE/SETJMP.H): jmp_buf = int[12]. */
typedef int jmp_buf[12];
extern "C" int setjmp(jmp_buf);
extern "C" void longjmp(jmp_buf, int);

void FreeGameMem(void);   /* @0x80037FAC DIABLO.CPP:292 */
void start_game(unsigned int uMsg);   /* @0x80037FE4 DIABLO.CPP:312 */
void free_game(void);   /* @0x800380D4 DIABLO.CPP:357 */
void LittleStart(unsigned char bNewGame, unsigned char bSinglePlayer);   /* @0x80038148 DIABLO.CPP:390 */
unsigned char StartGame(unsigned char bNewGame, unsigned char bSinglePlayer);   /* @0x8003820C DIABLO.CPP:433 */
void run_game_loop(unsigned int uMsg);   /* @0x8003840C DIABLO.CPP:532 */
BOOL TryIconCurs(void);   /* @0x80038574 DIABLO.CPP:1087 */
unsigned long DisableInputWndProc(unsigned long hWnd, unsigned int uMsg, long wParam, unsigned long lParam);   /* @0x80038894 DIABLO.CPP:2191 */
unsigned long GM_Game(unsigned long hWnd, unsigned int uMsg, long wParam, unsigned long lParam);   /* @0x8003889C DIABLO.CPP:2245 */
void LoadLvlGFX(void);   /* @0x80038930 DIABLO.CPP:2413 */
void LoadMegaTiles(const char *LoadFile);   /* @0x800389E8 DIABLO.CPP:2452 */
void LoadAllGFX(void);   /* @0x80038A78 DIABLO.CPP:2472 */
void CreateLevel(int lvldir);   /* @0x80038A98 DIABLO.CPP:2505 */
void LoCreateLevel(void *Param);   /* @0x80038B90 DIABLO.CPP:2534 -- SYM mangling LoCreateLevel__FPv needs a void* param even though the body ignores it (re-derives lvldir from D_8011C7B0) */
void ClearOutDungeonMap(void);   /* @0x80038CF4 DIABLO.CPP:2592 */
void AddQuestItems(void);   /* @0x80038EF4 DIABLO.CPP:2690 */
void AllSolid(int x, int y);   /* @0x80038F94 DIABLO.CPP:2710 */
void FreeInvGFX(void);   /* @0x80157274 INV.CPP:443 */
void FillCrapBits(void);   /* @0x80038FD4 DIABLO.CPP:2716 */
void Lsaveplrpos(void);   /* @0x80039174 DIABLO.CPP:2755 */
void Lrestoreplrpos(void);   /* @0x80039220 DIABLO.CPP:2776 */
void LoadGameLevel(unsigned char firstflag, int lvldir);   /* @0x80039270 DIABLO.CPP:2785 */
void SetSpeed(enum GM_SPEEDS Speed);   /* @0x80039BA8 DIABLO.CPP:3163 */
enum GM_SPEEDS GetSpeed(void);   /* @0x80039BBC DIABLO.CPP:3169 */
void game_logic(void);   /* @0x80039BC8 DIABLO.CPP:3175 */
void timeout_cursor(unsigned char bTimeout);   /* @0x80039DB0 DIABLO.CPP:3278 */
void game_loop(unsigned char bStartup);   /* @0x80039E58 DIABLO.CPP:3317 */
void alloc_plr(void);   /* @0x80039EB8 DIABLO.CPP:3448 */
void plr_encrypt(unsigned char bEncrypt);   /* @0x80039EC0 DIABLO.CPP:3516 */
void assert_fail(int nLineNo, const char *pszFile, const char *pszFail);   /* @0x80039EC8 DIABLO.CPP:3581 */
void assert_fail(int nLineNo, const char *pszFile);   /* @0x80039EE8 DIABLO.CPP:3588 */
extern "C" void app_fatal(char *pszFile, ...);   /* @0x80039F08 DIABLO.CPP:3593 (C linkage: no mangled suffix in the SYM) */
void DoMemCardFromFrontEnd(void);   /* @0x80039F38 DIABLO.CPP:3853 */
void DoMemCardFromInGame(void);   /* @0x80039F60 DIABLO.CPP:3863 */

/* -- external prototypes -- */
int AddVision(int x, int y, int r, unsigned char mine);   /* @0x8004D5A8 LIGHTING.CPP:1436 */
void AllocdPiece(void);   /* @0x800827E0 DPIECE.CPP:98 */
void BuildLevTrigs(void);   /* @0x800754E8 TRIGS.CPP:258 */
void ChangeLightOff(int i, int x, int y);   /* @0x8004D3B8 LIGHTING.CPP:1265 */
void ChangeLightXY(int i, int x, int y);   /* @0x8004D384 LIGHTING.CPP:1234 */
void CheckCursMove(void);   /* @0x80037D80 CURSOR.CPP:284 */
void CheckIdentify(int pnum, int cii);   /* @0x80045D20 ITEMS.CPP:3310 */
void CheckQuests(void);   /* @0x800674F4 QUESTS.CPP:185 */
void CheckTriggers(int pnum);   /* @0x80076AC8 TRIGS.CPP:895 */
extern "C" void DBG_Halt(void);   /* @0x80020E64 GDEBUG.C:88 */
void ClearPanel(void);   /* @0x80031F20 CONTROL.CPP:1291 */
void ClrDiabloMsg(void);   /* @0x8003DCD8 ERROR.CPP:173 */
void ConvertdPiece(void);   /* @0x8008287C DPIECE.CPP:113 */
void CreateTown(int entry);   /* @0x80074D48 TOWN.CPP:453 */
void DoRecharge(int pnum, int cii);   /* @0x80046038 ITEMS.CPP:3391 */
void DoRepair(int pnum, int cii);   /* @0x80045F0C ITEMS.CPP:3356 */
void FreeControlPan(void);   /* @0x80032948 CONTROL.CPP:1856 */
void FreeCursor(void);   /* @0x8003773C CURSOR.CPP:137 */
void FreeItemGFX(void);   /* @0x80045B70 ITEMS.CPP:3255 */
void FreeLightTable(void);   /* @0x8004D268 LIGHTING.CPP:1051 */
void FreeMonsterSnd(void);   /* @0x8003D1D4 EFFECTS.CPP:286 */
void FreeObjectGFX(void);   /* @0x80053740 OBJECTS.CPP:481 */
void FreePlayerGFX(int pnum);   /* @0x800670D8 PLAYER.CPP:4699 */
void FreeQuestText(void);   /* @0x8004D95C MINITEXT.CPP:112 */
void FreeStoreMem(void);   /* @0x800695A4 STORES.CPP:170 */
void FreeTownerGFX(void);   /* @0x8003B064 TOWNERS.CPP:373 */
void FreedPiece(void);   /* @0x80082838 DPIECE.CPP:105 */
void Freeupstairs(void);   /* @0x80076390 TRIGS.CPP:699 */
unsigned char GRL_PostMessage(unsigned long hWnd, unsigned int Msg, long wParam, unsigned long lParam);   /* @0x8007B254 GWIN.CPP:133 */
WNDPROC GRL_SetWindowProc(WNDPROC NewProc);   /* @0x8007B21C GWIN.CPP:106 */
extern "C" void GSYS_SetStackAndJump(void *Stack, void (*Func)(void *), void *Param);   /* @0x8002117C GSYS.C:89 */
BOOL GetFadeState(void);   /* @0x8007EEAC PALETTE.CPP:179 */
void GetPortalLvlPos(void);   /* @0x80081554 PORTAL.CPP:346 */
void GetReturnLvlPos(void);   /* @0x800682DC QUESTS.CPP:491 */
long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP:102 */
void InitBird(void);   /* @0x800AC764 BIRD.CPP:637 */
void InitControlPan(void);   /* @0x80031F70 CONTROL.CPP:1433 */
void InitCursor(void);   /* @0x80037734 CURSOR.CPP:126 */
void InitDead(void);   /* @0x80037D88 DEAD.CPP:40 */
void InitDungMsgs(int pnum);   /* @0x80067124 PLAYER.CPP:4700 */
void InitGamePadVars(void);   /* @0x8007AE80 GAMEPAD.CPP:2021 */
void InitItemGFX(void);   /* @0x8003E24C ITEMS.CPP:556 */
void InitItems(BOOL re_init);   /* @0x8003E4F8 ITEMS.CPP:641 */
void InitLevelCursor(void);   /* @0x80037824 CURSOR.CPP:186 */
void InitLightMax(void);   /* @0x8004D280 LIGHTING.CPP:1156 */
void InitLightTable(void);   /* @0x8004D270 LIGHTING.CPP:1058 */
void InitLighting(void);   /* @0x8004D2A4 LIGHTING.CPP:1166 */
void InitMultiView(void);   /* @0x80060C44 PLAYER.CPP:1200 */
void InitObjectGFX(void);   /* @0x80053524 OBJECTS.CPP:435 */
void InitPlayerGFX(int pnum);   /* @0x80067170 PLAYER.CPP:4701 */
void InitPlayer(int pnum, unsigned char FirstTime);   /* @0x80066FF0 PLAYER.CPP:4695 */
void InitQuestText(void);   /* @0x8004D964 MINITEXT.CPP:119 */
void InitTowners(void);   /* @0x8003AFD8 TOWNERS.CPP:354 */
void InitVision(void);   /* @0x8004D554 LIGHTING.CPP:1422 */
BOOL IsGameLoading(void);   /* @0x800A4648 LOADING.CPP:212 */
void LoadRndLvlPal(int l);   /* @0x8007EE6C PALETTE.CPP:105 */
void ML_Init(void);   /* @0x8007D5F8 MLIST.CPP:71 */
void MakeLightTable(void);   /* @0x8004D278 LIGHTING.CPP:1064 */
unsigned char NetInit(unsigned char bSinglePlayer, unsigned char *pfExitProgram);   /* @0x80052DF0 MULTI.CPP:708 */
void NetSendCmdLocParam1(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1);   /* @0x8004F774 MSG.CPP:916 */
void NetSendCmdLocParam2(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1, unsigned short wParam2);   /* @0x8004F7AC MSG.CPP:931 */
void NetSendCmdParam1(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1);   /* @0x8004F834 MSG.CPP:964 */
void NetSendCmdParam3(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1, unsigned short wParam2, unsigned short wParam3);   /* @0x8004F890 MSG.CPP:986 */
void NewCursor(int i);   /* @0x80037804 CURSOR.CPP:179 */
void OVR_LoadFrontend(void);   /* @0x8009544C OVERLAY.CPP:137 */
void OVR_LoadGame(void);   /* @0x80095474 OVERLAY.CPP:146 */
void OVR_LoadMemcard(void);   /* @0x800954C4 OVERLAY.CPP:164 */
void OVR_LoadPregame(void);   /* @0x80095424 OVERLAY.CPP:129 */
void PAD_Handler(void);   /* @0x800895F8 PADS.CPP:176 */
BOOL PA_SetPauseOk(BOOL NewPause);   /* @0x80088BF4 PAUSE.CPP:573 */
BOOL PaletteFadeOut(int fr);   /* @0x8007F2F8 PALETTE.CPP:403 */
void PlacePlayer(int pnum, int x, int y, unsigned char do_current);   /* @0x800A4080 PADFUNCS.CPP:1492 */
void PlayDungMsgs(void);   /* @0x80066448 PLAYER.CPP:4588 */
void ProcessBird(void);   /* @0x800AC838 BIRD.CPP:668 */
void ProcessItems(void);   /* @0x800458CC ITEMS.CPP:3173 */
void ProcessLightList(void);   /* @0x8004D434 LIGHTING.CPP:1316 */
void ProcessObjects(void);   /* @0x800554DC OBJECTS.CPP:1186 */
void ProcessPlayers(void);   /* @0x80065168 PLAYER.CPP:3903 */
void ProcessTowners(void);   /* @0x8003B518 TOWNERS.CPP:536 */
void ProcessVisionList(void);   /* @0x8004D754 LIGHTING.CPP:1539 */
unsigned char QuestStatus(int i);   /* @0x80067B70 QUESTS.CPP:305 */
void ResyncQuests(void);   /* @0x80068330 QUESTS.CPP:536 */
void SND_LoadBank(int lvlnum);   /* @0x8009A4B8 SNDBANK.CPP:296 */
void SavePreLighting(void);   /* @0x8004D54C LIGHTING.CPP:1390 */
void SetAmbientLight(void);   /* @0x8009B3FC TONY.CPP:130 */
void SetCursor(int i);   /* @0x800377A0 CURSOR.CPP:165 */
void SetMISSILE(int x, int y);   /* @0x80082D28 DPIECE.CPP:207 */
void SetQSpell(int pnum, int Spell, int type);   /* @0x800A09DC PADFUNCS.CPP:88 */
void SetRndSeed(long s);   /* @0x8003DACC ENGINE.CPP:94 */
void SetSOLID(int x, int y);   /* @0x80082BC8 DPIECE.CPP:182 */
void ShowProgress(unsigned int uMsg);   /* @0x8003DE40 INTERFAC.CPP:336 */
void SpawnQuestItem(int itemid, int x, int y, int randarea, int selflag);   /* @0x80045208 ITEMS.CPP:3000 */
void SpawnRock(void);   /* @0x80045454 ITEMS.CPP:3055 */
extern "C" void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
void Tfree(void *Addr);   /* @0x8008839C TMALLOC.CPP:119 */
void *Tmalloc(int MemSize);   /* @0x800882A8 TMALLOC.CPP:78 */
unsigned long VID_GetTick(void);   /* @0x800840F8 VID.CPP:264 */
void WorldToOffset(int pnum, int WorldX, int WorldY);   /* @0x80078440 GAMEPAD.CPP:268 */
void music_fade(void);   /* @0x80077E90 SOUND.CPP:245 */
void music_stop(void);   /* @0x80077E50 SOUND.CPP:227 */
void pad_func_Quick_Spell(int pnum);   /* @0x800A2618 PADFUNCS.CPP:833 */
void sound_stop(void);   /* @0x8003D830 EFFECTS.CPP:554 */
void sound_update(void);   /* @0x8003D8C8 EFFECTS.CPP:576 */
int GetSpellLevel(int id, int sn);   /* @0x8013A43C MISSILES.CPP:498 */
void ProcessMissiles(void);   /* @0x8014A694 MISSILES.CPP:5780 */
void LoadSetMap(void);   /* @0x801556A8 SETMAPS.CPP:198 */
void InitObjects(void);   /* @0x801595D4 PREOBJ.CPP:1625 */
void FillSolidBlockTbls(void);   /* @0x80159EDC GENDUNG.CPP:162 */
void SetDungeonMicros(void);   /* @0x8015A068 GENDUNG.CPP:222 */
void InitLevels(void);   /* @0x8015BBC8 GENDUNG.CPP:704 */
void InitThemes(void);   /* @0x8015C980 THEMES.CPP:433 */
void HoldThemeRooms(void);   /* @0x8015CCCC THEMES.CPP:504 */
void CreateThemeRooms(void);   /* @0x8015E598 THEMES.CPP:1019 */
void InitPortals(void);   /* @0x8015E77C PREPORT.CPP:74 */
void InitQuests(void);   /* @0x8015E7DC PREQUEST.CPP:108 */
void InitInv(void);   /* @0x8015F470 PREINV.CPP:103 */
void InitAutomap(void);   /* @0x8015F4C4 PREAUTO.CPP:140 */
void InitAutomapOnce(void);   /* @0x8015F6BC PREAUTO.CPP:219 */
void InitLevelMonsters(void);   /* @0x8015FC80 PREMON.CPP:380 */
void GetLevelMTypes(void);   /* @0x8015FD04 PREMON.CPP:402 */
void DoTelekinesis(void);   /* @0x80160A34 INV.CPP:3671 */
void InitMonsters(void);   /* @0x80160ED4 PREMON.CPP:885 */
void InitMissiles(void);   /* @0x80161FDC PREMISS.CPP:97 */
void InitStores(void);   /* @0x80162CDC PRESTORE.CPP:114 */
void SetupTownStores(void);   /* @0x80162DD0 PRESTORE.CPP:139 */
void DeltaLoadLevel(void);   /* @0x80163054 PREMSG.CPP:115 */
void ProcessMonsters(void);   /* @0x801549E4 MONSTER.CPP:4300 */
void CreateL5Dungeon(unsigned int rseed, int entry);   /* @0x80140E64 DRLG_L1.CPP:2176 */
void CreateL2Dungeon(unsigned int rseed, int entry);   /* @0x8014854C DRLG_L2.CPP:3238 */
void CreateL3Dungeon(unsigned int rseed, int entry);   /* @0x8014D450 DRLG_L3.CPP:2153 */
void CreateL4Dungeon(unsigned int rseed, int entry);   /* @0x801551F8 DRLG_L4.CPP:1801 */
void InitTownTriggers(void);   /* @0x801621D0 PRETRIGS.CPP:95 */
void InitL1Triggers(void);   /* @0x80162530 PRETRIGS.CPP:161 */
void InitL2Triggers(void);   /* @0x8016265C PRETRIGS.CPP:190 */
void InitL3Triggers(void);   /* @0x80162824 PRETRIGS.CPP:229 */
void InitL4Triggers(void);   /* @0x801629B0 PRETRIGS.CPP:265 */
