/* This TU's own 130 SOURCE/PLAYER.CPP functions (symhdr.py proto). */
void AddPlrExperience(PlayerStruct *ptrplr, int lvl, long exp);   /* @0x8006067C PLAYER.CPP:917 */
void AddPlrExperience(int pnum, int lvl, long exp);   /* @0x80066EBC PLAYER.CPP:4690 */
void AddPlrMonstExper(int lvl, long exp, char pmask);   /* @0x800608A0 PLAYER.CPP:987 */
void BreakObject(PlayerStruct *ptrplr, int val);   /* @0x8006684C PLAYER.CPP:4662 */
void CalcPlrInv(PlayerStruct *ptrplr, unsigned char bl);   /* @0x80066880 PLAYER.CPP:4663 */
int CalcStatDiff(PlayerStruct *ptrplr);   /* @0x80060498 PLAYER.CPP:858 */
int CalcStatDiff(int pnum);   /* @0x80066BB8 PLAYER.CPP:4680 */
int CalculateGold(PlayerStruct *ptrplr);   /* @0x800669A4 PLAYER.CPP:4669 */
void CheckNewPath(PlayerStruct *ptrplr);   /* @0x800646A8 PLAYER.CPP:3448 */
void CheckNewPath(int pnum);   /* @0x8006708C PLAYER.CPP:4698 */
void CheckPlrDead(int pnum);   /* @0x80062198 PLAYER.CPP:2355 */
void CheckPlrSpell(void);   /* @0x80065654 PLAYER.CPP:4144 */
void CheckStats(int p);   /* @0x80065BCC PLAYER.CPP:4370 */
unsigned char ChkPlrOffsets(int wx1, int wy1, int wx2, int wy2);   /* @0x80062568 PLAYER.CPP:2542 */
void ClearPlrPVars(PlayerStruct *ptrplr);   /* @0x8005FE38 PLAYER.CPP:586 */
void ClrPlrPath(PlayerStruct *ptrplr);   /* @0x8006544C PLAYER.CPP:4041 */
void ClrPlrPath(int pnum);   /* @0x80067254 PLAYER.CPP:4704 */
void CreatePlayer(PlayerStruct *ptrplr, char c);   /* @0x80060090 PLAYER.CPP:732 */
void CreatePlayer(int pnum, char c);   /* @0x80066C50 PLAYER.CPP:4682 */
void CreatePlrItems(PlayerStruct *ptrplr);   /* @0x80066778 PLAYER.CPP:4658 */
void DropHalfPlayersGold(PlayerStruct *ptrplr);   /* @0x80061B44 PLAYER.CPP:2213 */
void FreePlayerGFX(PlayerStruct *ptrplr);   /* @0x8005FE14 PLAYER.CPP:540 */
void FreePlayerGFX(int pnum);   /* @0x800670D8 PLAYER.CPP:4699 */
void GetGoldSeed(PlayerStruct *ptrplr, ItemStruct *h);   /* @0x80067384 PLAYER.CPP:4715 */
int GetSpellLevel(PlayerStruct *ptrplr, int val);   /* @0x80066818 PLAYER.CPP:4661 */
void HealStart(PlayerStruct *ptrplr);   /* @0x80066954 PLAYER.CPP:4667 */
void HealotherStart(PlayerStruct *ptrplr);   /* @0x8006697C PLAYER.CPP:4668 */
void InitDungMsgs(PlayerStruct *ptrplr);   /* @0x80066440 PLAYER.CPP:4578 */
void InitDungMsgs(int pnum);   /* @0x80067124 PLAYER.CPP:4700 */
void InitLevelChange(PlayerStruct *ptrplr);   /* @0x800620E8 PLAYER.CPP:2325 */
void InitMultiView(void);   /* @0x80060C44 PLAYER.CPP:1200 */
void InitPlayerGFX(PlayerStruct *ptrplr);   /* @0x8005FDF4 PLAYER.CPP:424 */
void InitPlayerGFX(int pnum);   /* @0x80067170 PLAYER.CPP:4701 */
void InitPlayer(PlayerStruct *ptrplr, unsigned char FirstTime);   /* @0x80060924 PLAYER.CPP:1003 */
void InitPlayer(int pnum, unsigned char FirstTime);   /* @0x80066FF0 PLAYER.CPP:4695 */
unsigned char IsDplayer(int x, int y);   /* @0x8005FD10 PLAYER.CPP:262 */
void M_StartHit(int m, PlayerStruct *ptrplr, int dam);   /* @0x800669CC PLAYER.CPP:4670 */
void M_StartKill(int m, PlayerStruct *ptrplr);   /* @0x800668E8 PLAYER.CPP:4665 */
void MakePlrPath(PlayerStruct *ptrplr, int xx, int yy, unsigned char endspace);   /* @0x8006564C PLAYER.CPP:4086 */
void MakePlrPath(int pnum, int xx, int yy, unsigned char endspace);   /* @0x80066D3C PLAYER.CPP:4685 */
void ModifyPlrDex(int p, int l);   /* @0x80065FA8 PLAYER.CPP:4462 */
void ModifyPlrMag(int p, int l);   /* @0x80065EBC PLAYER.CPP:4437 */
void ModifyPlrStr(int p, int l);   /* @0x80065DA0 PLAYER.CPP:4417 */
void ModifyPlrVit(int p, int l);   /* @0x8006608C PLAYER.CPP:4480 */
void NewPlrAnim(PlayerStruct *ptrplr, int Peq, int numFrames, int Delay);   /* @0x8005FE1C PLAYER.CPP:566 */
void NewPlrAnim(int pnum, int Peq, int numFrames, int Delay);   /* @0x80066E70 PLAYER.CPP:4689 */
void NextPlrLevel(PlayerStruct *ptrplr);   /* @0x80060500 PLAYER.CPP:870 */
void OperateObject(PlayerStruct *ptrplr, int oi, unsigned char bl);   /* @0x80066AC0 PLAYER.CPP:4675 */
void PM_ChangeLightOff(PlayerStruct *ptrplr);   /* @0x80060F00 PLAYER.CPP:1533 */
void PM_ChangeLightOff(int pnum);   /* @0x80067040 PLAYER.CPP:4697 */
void PM_ChangeOffset(PlayerStruct *ptrplr);   /* @0x80060F38 PLAYER.CPP:1603 */
int PM_DoAttack(PlayerStruct *ptrplr);   /* @0x80063470 PLAYER.CPP:2958 */
int PM_DoBlock(PlayerStruct *ptrplr);   /* @0x800639D8 PLAYER.CPP:3133 */
int PM_DoDeath(PlayerStruct *ptrplr);   /* @0x800644B8 PLAYER.CPP:3380 */
int PM_DoGotHit(PlayerStruct *ptrplr);   /* @0x80064428 PLAYER.CPP:3356 */
int PM_DoNewLvl(PlayerStruct *ptrplr);   /* @0x800646A0 PLAYER.CPP:3440 */
int PM_DoRangeAttack(PlayerStruct *ptrplr);   /* @0x80063804 PLAYER.CPP:3040 */
int PM_DoSpell(PlayerStruct *ptrplr);   /* @0x80063F54 PLAYER.CPP:3258 */
int PM_DoStand(PlayerStruct *ptrplr);   /* @0x80062560 PLAYER.CPP:2513 */
int PM_DoWalk(PlayerStruct *ptrplr);   /* @0x80062618 PLAYER.CPP:2566 */
void PhaseEnd(PlayerStruct *ptrplr);   /* @0x80066A98 PLAYER.CPP:4674 */
void PhaseStart(PlayerStruct *ptrplr);   /* @0x80066A3C PLAYER.CPP:4672 */
void PlayDungMsgs(void);   /* @0x80066448 PLAYER.CPP:4588 */
void PlrClrTrans(int x, int y);   /* @0x80060C6C PLAYER.CPP:1402 */
unsigned char PlrDeathModeOK(int p);   /* @0x80064B68 PLAYER.CPP:3773 */
void PlrDoTrans(int x, int y);   /* @0x80060CE4 PLAYER.CPP:1418 */
unsigned char PlrHitMonst(PlayerStruct *ptrplr, int m);   /* @0x800629EC PLAYER.CPP:2746 */
unsigned char PlrHitObj(PlayerStruct *ptrplr, int mx, int my);   /* @0x800633F0 PLAYER.CPP:2943 */
unsigned char PlrHitPlr(PlayerStruct *ptrplr, char p);   /* @0x80063048 PLAYER.CPP:2870 */
unsigned char PosOkPlayer(PlayerStruct *ptrplr, int px, int py);   /* @0x80065474 PLAYER.CPP:4052 */
unsigned char PosOkPlayer(int pnum, int x, int y);   /* @0x80066B6C PLAYER.CPP:4679 */
void ProcessPlayers(void);   /* @0x80065168 PLAYER.CPP:3903 */
void RemoveInvItem(PlayerStruct *ptrplr, int i);   /* @0x80066A64 PLAYER.CPP:4673 */
void RemovePlrFromMap(PlayerStruct *ptrplr);   /* @0x800612F4 PLAYER.CPP:1882 */
void RemovePlrMissiles(PlayerStruct *ptrplr);   /* @0x80061DD0 PLAYER.CPP:2294 */
void RemoveSpdBarItem(PlayerStruct *ptrplr, int val);   /* @0x800668B4 PLAYER.CPP:4664 */
void RespawnDeadItem(ItemStruct *itm, int x, int y);   /* @0x80061448 PLAYER.CPP:1953 */
void RestartTownLvl(PlayerStruct *ptrplr);   /* @0x800623A0 PLAYER.CPP:2442 */
void RestartTownLvl(int pnum);   /* @0x800672EC PLAYER.CPP:4706 */
void SetGoldCurs(PlayerStruct *ptrplr, int i);   /* @0x80066920 PLAYER.CPP:4666 */
void SetPlayerHitPoints(PlayerStruct *ptrplr, int newhp);   /* @0x80066168 PLAYER.CPP:4502 */
void SetPlayerHitPoints(int pnum, int val);   /* @0x80066CF0 PLAYER.CPP:4684 */
void SetPlayerOld(PlayerStruct *ptrplr);   /* @0x80060DFC PLAYER.CPP:1441 */
void SetPlayerOld(int pnum);   /* @0x80067338 PLAYER.CPP:4707 */
void SetPlrAnims(PlayerStruct *ptrplr);   /* @0x8005FE54 PLAYER.CPP:604 */
void SetPlrAnims(int pnum);   /* @0x80067208 PLAYER.CPP:4703 */
void SetPlrDex(int p, int v);   /* @0x800662F8 PLAYER.CPP:4546 */
void SetPlrMag(int p, int v);   /* @0x80066288 PLAYER.CPP:4530 */
void SetPlrStr(int p, int v);   /* @0x800661AC PLAYER.CPP:4514 */
void SetPlrVit(int p, int v);   /* @0x800663D4 PLAYER.CPP:4562 */
void SetSpdbarGoldCurs(PlayerStruct *ptrplr, int i);   /* @0x800667E4 PLAYER.CPP:4660 */
void ShieldDur(PlayerStruct *ptrplr);   /* @0x80063904 PLAYER.CPP:3102 */
unsigned char SolidLoc(int x, int y);   /* @0x80060C4C PLAYER.CPP:1339 */
void StartAttack(PlayerStruct *ptrplr, int d);   /* @0x80060F64 PLAYER.CPP:1722 */
void StartNewLvl(PlayerStruct *ptrplr, int fom, int lvl);   /* @0x800621EC PLAYER.CPP:2368 */
void StartNewLvl(int pnum, int fom, int lvl);   /* @0x80066C04 PLAYER.CPP:4681 */
void StartPlayerDropItems(PlayerStruct *ptrplr, int EarFlag);   /* @0x800617AC PLAYER.CPP:2032 */
void StartPlayerKill(PlayerStruct *ptrplr, int earflag);   /* @0x80061948 PLAYER.CPP:2086 */
void StartPlrBlock(PlayerStruct *ptrplr, int dir);   /* @0x800610A8 PLAYER.CPP:1786 */
void StartPlrBlock(int pnum, int dir);   /* @0x80066F08 PLAYER.CPP:4691 */
void StartPlrHit(PlayerStruct *ptrplr, int dam, unsigned char forcehit);   /* @0x800612FC PLAYER.CPP:1908 */
void StartPlrHit(int pnum, int dam, unsigned char forcehit);   /* @0x80066F54 PLAYER.CPP:4692 */
void StartPlrKill(PlayerStruct *ptrplr, int earflag);   /* @0x80061C54 PLAYER.CPP:2254 */
void StartPlrKill(int pnum, int val);   /* @0x80066E24 PLAYER.CPP:4688 */
void StartSpell(PlayerStruct *ptrplr, int d, int cx, int cy);   /* @0x80061140 PLAYER.CPP:1807 */
void StartSpell(int pnum, int d, int cx, int cy);   /* @0x80066FA4 PLAYER.CPP:4693 */
void StartStand(PlayerStruct *ptrplr, int dir);   /* @0x80060E10 PLAYER.CPP:1480 */
void StartStand(int pnum, int dir);   /* @0x80066CA4 PLAYER.CPP:4683 */
void StartWalkStand(PlayerStruct *ptrplr);   /* @0x80060E9C PLAYER.CPP:1506 */
void StartWarpLvl(PlayerStruct *ptrplr, int pidx);   /* @0x80062448 PLAYER.CPP:2474 */
void StartWarpLvl(int pnum, int pidx);   /* @0x80066D8C PLAYER.CPP:4686 */
void SyncInitPlrPos(PlayerStruct *ptrplr);   /* @0x80065AB4 PLAYER.CPP:4320 */
void SyncInitPlrPos(int pnum);   /* @0x800671BC PLAYER.CPP:4702 */
void SyncInitPlr(PlayerStruct *ptrplr);   /* @0x80065B9C PLAYER.CPP:4348 */
void SyncInitPlr(int pnum);   /* @0x800672A0 PLAYER.CPP:4705 */
void SyncPlrKill(PlayerStruct *ptrplr, int earflag);   /* @0x80061DB0 PLAYER.CPP:2286 */
void SyncPlrKill(int pnum, int earflag);   /* @0x80066DD8 PLAYER.CPP:4687 */
void TalkToTowner(PlayerStruct *ptrplr, int val);   /* @0x80066B38 PLAYER.CPP:4677 */
void TeleStart(PlayerStruct *ptrplr);   /* @0x80066A14 PLAYER.CPP:4671 */
void TryDisarm(PlayerStruct *ptrplr, int oi);   /* @0x80066B04 PLAYER.CPP:4676 */
void TryDropPlayerItems(PlayerStruct *ptrplr);   /* @0x8006180C PLAYER.CPP:2038 */
void ValidatePlayer(void);   /* @0x80064BD0 PLAYER.CPP:3788 */
unsigned char WeaponDur(PlayerStruct *ptrplr, int durrnd);   /* @0x80062828 PLAYER.CPP:2690 */
void WorldToOffset(PlayerStruct *ptrplr, int x, int y);   /* @0x800667A0 PLAYER.CPP:4659 */
void do_spell_anim(int aframe, int spell, int clss, PlayerStruct *ptrplr);   /* @0x80063A74 PLAYER.CPP:3149 */
BOOL ismyplr(PlayerStruct *ptrplr);   /* @0x8005FD9C PLAYER.CPP:282 */
int plrind(PlayerStruct *ptrplr);   /* @0x8005FDE0 PLAYER.CPP:287 */

/* Externs: functions defined in other (not-yet-built or already-built) TUs that PLAYER.CPP calls. */
extern "C" void DBG_Error(char *Text, char *File, int Line);
void AddDead(int dx, int dy, char dv, int ddir);   /* @0x80037F8C DEAD.CPP:99 */
int AddLight(int x, int y, int r);   /* @0x8004D2E8 LIGHTING.CPP:1184 */
int AddMissile(int sx, int sy, int v1, int v2, int midir, int mitype, char micaster, int id, int v3, int spllvl);   /* @0x80142A04 MISSILES.CPP:3451 */
int AddVision(int x, int y, int r, unsigned char mine);   /* @0x8004D5A8 LIGHTING.CPP:1436 */
void ApocaStart(int plr);   /* @0x800A0680 DAVEL.CPP:798 */
void BreakObject(int pnum, int oi);   /* @0x8005EB40 OBJECTS.CPP:4056 */
void CalcPlrInv(int p, unsigned char Loadgfx);   /* @0x8003FB18 ITEMS.CPP:1114 */
long CalculateGold(int pnum);   /* @0x80160B64 INV.CPP:3690 */
unsigned char CanTalkToMonst(int m);   /* @0x8015694C MONSTER.CPP:5519 */
void CastSpell(int id, int spl, int sx, int sy, int dx, int dy, int caster, int spllvl);   /* @0x80077538 SPELLS.CPP:203 */
void ChangeLightColour(int i, int c);   /* @0x8004D40C LIGHTING.CPP:1299 */
void ChangeLightOff(int i, int x, int y);   /* @0x8004D3B8 LIGHTING.CPP:1265 */
void ChangeLightXY(int i, int x, int y);   /* @0x8004D384 LIGHTING.CPP:1234 */
void ChangeVisionXY(int id, int x, int y);   /* @0x8004D6D0 LIGHTING.CPP:1493 */
unsigned char CheckMonsterHit(int m, unsigned char &ret);   /* @0x8015698C MONSTER.CPP:5531 */
unsigned char CheckSpell(int id, int sn, char st, unsigned char manaonly);   /* @0x80077498 SPELLS.CPP:170 */
void ClearMissileSpot(int mi);   /* @0x8014AAC0 MISSILES.CPP:5885 */
void ClrCursor(int num);   /* @0x80077F90 GAMEPAD.CPP:113 */
void CreatePlrItems(int p);   /* @0x8003FEAC ITEMS.CPP:1225 */
void DeleteMissile(int mi, int i);   /* @0x8013A8E8 MISSILES.CPP:622 */
void DeleteMonsterList(void);   /* @0x801548C0 MONSTER.CPP:4269 */
void DoUnVision(int nXPos, int nYPos, int nRadius, int num);   /* @0x8004CD38 LIGHTING.CPP:892 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
int FindGetItem(int idx, unsigned short ci, int iseed);   /* @0x8008271C COREINV.CPP:52 */
BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag);   /* @0x8009BBA0 GLUE.CPP:392 */
void GM_FinishedUsing(TextDat *Fin);   /* @0x80093D80 GMAN.CPP:1349 */
TextDat * GM_UseTexData(int Id);   /* @0x80093C10 GMAN.CPP:1312 */
unsigned char GRL_PostMessage(unsigned long hWnd, unsigned int Msg, long wParam, unsigned long lParam);   /* @0x8007B254 GWIN.CPP:133 */
extern "C" unsigned long GTIMSYS_GetTimer(void);   /* @0x80020EF0 GTIMSYS.C:52 */
int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
void GetGoldSeed(int pnum, ItemStruct *h);   /* @0x8003FD0C ITEMS.CPP:1178 */
BOOL GetSOLID(int x, int y);   /* @0x80082CE0 DPIECE.CPP:194 */
int GetSpellLevel(int id, int sn);   /* @0x8013A43C MISSILES.CPP:498 */
SpellTarget * GetSpellTarget(int pnum);   /* @0x800AFE90 SPLTARGT.CPP:441 */
void HealStart(int plr);   /* @0x800A02E0 DAVEL.CPP:726 */
void HealotherStart(int plr);   /* @0x800A0314 DAVEL.CPP:732 */
void InitGamePadVars(void);   /* @0x8007AE80 GAMEPAD.CPP:2021 */
BOOL IsGameLoading(void);   /* @0x800A4648 LOADING.CPP:212 */
unsigned char ItemSpaceOk(int i, int j);   /* @0x8004040C ITEMS.CPP:1358 */
void LANG_ReloadMainTXT(void);   /* @0x8007B5A4 LANG.CPP:204 */
void M_GetKnockback(int i, int d);   /* @0x8014B0BC MONSTER.CPP:615 */
void M_StartHit(int i, int pnum, int dam);   /* @0x8014B2D8 MONSTER.CPP:682 */
void M_StartKill(int i, int pnum);   /* @0x8014C3D8 MONSTER.CPP:1069 */
void NetSendCmdDamage(unsigned char bHiPri, unsigned char bPlr, unsigned long dwDam);   /* @0x8004FEF8 MSG.CPP:1296 */
void NetSendCmdDelItem(unsigned char bHiPri, unsigned char bLoc);   /* @0x8004FD98 MSG.CPP:1212 */
void NetSendCmdGItem(unsigned char bHiPri, unsigned char bCmd, unsigned char mast, unsigned char pnum, unsigned char ii);   /* @0x8004F93C MSG.CPP:1011 */
void NetSendCmdLocParam2(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1, unsigned short wParam2);   /* @0x8004F7AC MSG.CPP:931 */
void NetSendCmdLocParam3(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1, unsigned short wParam2, unsigned short wParam3);   /* @0x8004F7EC MSG.CPP:947 */
void NetSendCmdPItem(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y);   /* @0x8004FBD8 MSG.CPP:1138 */
void NetSendCmdParam1(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1);   /* @0x8004F834 MSG.CPP:964 */
void NetSendCmdParam3(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1, unsigned short wParam2, unsigned short wParam3);   /* @0x8004F890 MSG.CPP:986 */
void NewCursor(int i);   /* @0x80037804 CURSOR.CPP:179 */
void OperateObject(int pnum, int i, unsigned char TeleFlag);   /* @0x8005DA30 OBJECTS.CPP:3670 */
BOOL PA_SetPauseOk(BOOL NewPause);   /* @0x80088BF4 PAUSE.CPP:573 */
void PhaseEnd(int plr);   /* @0x800A046C DAVEL.CPP:762 */
void PhaseStart(int plr);   /* @0x800A0438 DAVEL.CPP:755 */
void PlacePlayer(int pnum, int x, int y, unsigned char do_current);   /* @0x800A4080 PADFUNCS.CPP:1492 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
void PlaySfxLoc(int psfx, int x, int y);   /* @0x8003D784 EFFECTS.CPP:535 */
void PostGamePad(int val, int var1, int var2, int var3);   /* @0x8007AD4C GAMEPAD.CPP:1952 */
void RemoveInvItem(int pnum, int iv);   /* @0x8015D6FC INV.CPP:2399 */
void RemoveSpdBarItem(int pnum, int iv);   /* @0x8015D9AC INV.CPP:2430 */
void RespawnItem(int i, unsigned char FlipFlag);   /* @0x80045600 ITEMS.CPP:3088 */
BOOL SelectorActive(void);   /* @0x800A336C PADFUNCS.CPP:1146 */
void SetCurrentPortal(int p);   /* @0x800813E4 PORTAL.CPP:306 */
void SetGoldCurs(int pnum, int i);   /* @0x80070648 STORES.CPP:2439 */
void SetPlrHandGoldCurs(ItemStruct *h);   /* @0x8003FE7C ITEMS.CPP:1214 */
void SetPlrHandItem(ItemStruct *h, int idata);   /* @0x8003FBC8 ITEMS.CPP:1130 */
void SetRndSeed(long s);   /* @0x8003DACC ENGINE.CPP:94 */
void SetSpdbarGoldCurs(int pnum, int i);   /* @0x800706C8 STORES.CPP:2458 */
void SyncGetItem(int x, int y, int idx, unsigned short ci, int iseed);   /* @0x8015EEB8 INV.CPP:2842 */
extern "C" void TSK_Kill(TASK *T);   /* @0x80020548 TASKER.C:350 */
extern "C" void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
void TalkToTowner(int p, int t);   /* @0x8003B998 TOWNERS.CPP:673 */
void TalktoMonster(int i);   /* @0x801565DC MONSTER.CPP:5445 */
void TeleStart(int plr);   /* @0x800A034C DAVEL.CPP:739 */
void TryDisarm(int pnum, int i);   /* @0x8005A258 OBJECTS.CPP:2595 */
unsigned char UseScroll(void);   /* @0x8015FFE0 INV.CPP:3409 */
unsigned char UseStaff(void);   /* @0x801602AC INV.CPP:3453 */
void WorldToOffset(int pnum, int WorldX, int WorldY);   /* @0x80078440 GAMEPAD.CPP:268 */
void light_fix(int i);   /* @0x8004D3B0 LIGHTING.CPP:1249 */
void stream_stop(void);   /* @0x8003CF5C EFFECTS.CPP:107 */
