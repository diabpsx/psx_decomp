struct POLY_FT4;

void ActivateTrapLine(int ttype, int tid);   /* @0x80054B5C OBJECTS.CPP:1020 */
void AddLamp(int x, int y, int r);   /* @0x8005F984 OBJECTS.CPP:4478 */
void AddObject(int ot, int ox, int oy);   /* @0x80053AF8 OBJECTS.CPP:588 */
void BreakBarrel(int pnum, int i, int dam, unsigned char forcebreak, unsigned char sendmsg);   /* @0x8005E5E8 OBJECTS.CPP:3982 */
void BreakCrux(int pnum, int i);   /* @0x8005E3B4 OBJECTS.CPP:3945 */
void BreakObject(int pnum, int oi);   /* @0x8005EB40 OBJECTS.CPP:4056 */
void DRLG_MRectTrans(int x1, int y1, int x2, int y2);   /* @0x800578DC OBJECTS.CPP:1896 */
void DeleteObject(int oi, int i);   /* @0x8005374C OBJECTS.CPP:489 */
void DoorSet(int oi, int dx, int dy);   /* @0x800559BC OBJECTS.CPP:1431 */
void DrawExpl(int sx, int sy, int f, int ot, int scale, char rtint, char gtint, char btint);   /* @0x80054638 OBJECTS.CPP:892 */
void DrawObjExpl(struct ObjectStruct *obj, int ScrX, int ScrY, int ot);   /* @0x80054930 OBJECTS.CPP:961 */
int FindValidShrine(int i);   /* @0x8005CE34 OBJECTS.CPP:3377 */
void FreeObjectGFX(void);   /* @0x80053740 OBJECTS.CPP:481 */
void GetObjectStr(int i);   /* @0x8005F4C8 OBJECTS.CPP:4324 */
void InitObjectGFX(void);   /* @0x80053524 OBJECTS.CPP:435 */
int ItemMiscIdIdx(int imiscid);   /* @0x8005A408 OBJECTS.CPP:2627 */
void LoadMapObjs(unsigned char *pMap, int startx, int starty);   /* @0x80059C0C OBJECTS.CPP:2451 */
void MonstCheckDoors(int m);   /* @0x8005704C OBJECTS.CPP:1783 */
void ObjChangeMapResync(int x1, int y1, int x2, int y2);   /* @0x80057978 OBJECTS.CPP:1914 */
void ObjChangeMap(int x1, int y1, int x2, int y2);   /* @0x80057724 OBJECTS.CPP:1871 */
void ObjL1Special(int x1, int y1, int x2, int y2);   /* @0x800559AC OBJECTS.CPP:1366 */
void ObjL2Special(int x1, int y1, int x2, int y2);   /* @0x800559B4 OBJECTS.CPP:1396 */
void ObjSetMicro(int dx, int dy, int pn);   /* @0x80055754 OBJECTS.CPP:1280 */
void ObjSetMini(int x, int y, int v);   /* @0x800558C4 OBJECTS.CPP:1320 */
void Obj_BCrossDamage(int i);   /* @0x80055294 OBJECTS.CPP:1148 */
void Obj_Circle(int i);   /* @0x80054290 OBJECTS.CPP:798 */
void Obj_Door(int i);   /* @0x800549A0 OBJECTS.CPP:978 */
void Obj_FlameTrap(int i);   /* @0x80054C6C OBJECTS.CPP:1038 */
void Obj_Light(int i, int lr);   /* @0x80054070 OBJECTS.CPP:755 */
void Obj_Sarc(int i);   /* @0x80054B10 OBJECTS.CPP:1011 */
void Obj_StopAnim(int i);   /* @0x800545D4 OBJECTS.CPP:856 */
void Obj_Trap(int i);   /* @0x80054F50 OBJECTS.CPP:1088 */
void OperateArmorStand(int pnum, int i, unsigned char sendmsg);   /* @0x8005CCC8 OBJECTS.CPP:3330 */
void OperateBookCase(int pnum, int i, unsigned char sendmsg);   /* @0x8005C9C8 OBJECTS.CPP:3268 */
void OperateBookLever(int pnum, int i);   /* @0x800584FC OBJECTS.CPP:2067 */
void OperateBook(int pnum, int i);   /* @0x80057E30 OBJECTS.CPP:1983 */
void OperateCauldron(int pnum, int i, int sType);   /* @0x8005CFC8 OBJECTS.CPP:3426 */
void OperateChest(int pnum, int i, unsigned char sendmsg);   /* @0x80058BD0 OBJECTS.CPP:2188 */
void OperateDecap(int pnum, int i, unsigned char sendmsg);   /* @0x8005CBE0 OBJECTS.CPP:3309 */
unsigned char OperateFountains(int pnum, int i);   /* @0x8005D06C OBJECTS.CPP:3447 */
void OperateGoatShrine(int pnum, int i, int sType);   /* @0x8005CF20 OBJECTS.CPP:3406 */
void OperateInnSignChest(int pnum, int i);   /* @0x800591A4 OBJECTS.CPP:2293 */
void OperateL1Door(int pnum, int i, unsigned char sendflag);   /* @0x80057AF0 OBJECTS.CPP:1938 */
void OperateL1LDoor(int pnum, int oi, unsigned char sendflag);   /* @0x80056024 OBJECTS.CPP:1528 */
void OperateL1RDoor(int pnum, int oi, unsigned char sendflag);   /* @0x80055CC4 OBJECTS.CPP:1473 */
void OperateL2Door(int pnum, int i, unsigned char sendflag);   /* @0x80059954 OBJECTS.CPP:2424 */
void OperateL2LDoor(int pnum, int oi, unsigned char sendflag);   /* @0x80056728 OBJECTS.CPP:1630 */
void OperateL2RDoor(int pnum, int oi, unsigned char sendflag);   /* @0x800563BC OBJECTS.CPP:1583 */
void OperateL3Door(int pnum, int i, unsigned char sendflag);   /* @0x80059AB0 OBJECTS.CPP:2438 */
void OperateL3LDoor(int pnum, int oi, unsigned char sendflag);   /* @0x80056D70 OBJECTS.CPP:1720 */
void OperateL3RDoor(int pnum, int oi, unsigned char sendflag);   /* @0x80056A94 OBJECTS.CPP:1677 */
void OperateLazStand(int pnum, int i);   /* @0x8005D8AC OBJECTS.CPP:3632 */
void OperateLever(int pnum, int i);   /* @0x80057C4C OBJECTS.CPP:1952 */
void OperateMushPatch(int pnum, int i);   /* @0x80058F90 OBJECTS.CPP:2241 */
void OperateObject(int pnum, int i, unsigned char TeleFlag);   /* @0x8005DA30 OBJECTS.CPP:3670 */
void OperatePedistal(int pnum, int i);   /* @0x80059D14 OBJECTS.CPP:2493 */
void OperateSChambBk(int pnum, int i);   /* @0x80058994 OBJECTS.CPP:2149 */
void OperateSarc(int pnum, int i, unsigned char sendmsg);   /* @0x8005979C OBJECTS.CPP:2395 */
void OperateShrine(int pnum, int i, int sType);   /* @0x8005A478 OBJECTS.CPP:2637 */
void OperateSkelBook(int pnum, int i, unsigned char sendmsg);   /* @0x8005C850 OBJECTS.CPP:3244 */
void OperateSlainHero(int pnum, int i, unsigned char sendmsg);   /* @0x8005937C OBJECTS.CPP:2332 */
void OperateStoryBook(int pnum, int i);   /* @0x8005D7B8 OBJECTS.CPP:3609 */
void OperateTrapLvr(int i);   /* @0x800595CC OBJECTS.CPP:2364 */
void OperateWeaponRack(int pnum, int i, unsigned char sendmsg);   /* @0x8005D610 OBJECTS.CPP:3553 */
void PostAddArmorStand(int i);   /* @0x800532B4 OBJECTS.CPP:310 */
void PostAddL1Door(int i, int x, int y, int ot);   /* @0x80053080 OBJECTS.CPP:264 */
void PostAddL1Objs(int x1, int y1, int x2, int y2);   /* @0x80057520 OBJECTS.CPP:1833 */
void PostAddL2Door(int i, int x, int y, int ot);   /* @0x80053168 OBJECTS.CPP:285 */
void PostAddL2Objs(int x1, int y1, int x2, int y2);   /* @0x80057628 OBJECTS.CPP:1853 */
void PostAddObjLight(int i, int r);   /* @0x8005333C OBJECTS.CPP:359 */
void PostAddObject(int ot, int ox, int oy);   /* @0x80053C08 OBJECTS.CPP:636 */
void PostAddWeaponRack(int i);   /* @0x80053400 OBJECTS.CPP:382 */
void PostObjObjAddSwitch(int ot, int ox, int oy, int oi);   /* @0x80053488 OBJECTS.CPP:401 */
void ProcessObjects(void);   /* @0x800554DC OBJECTS.CPP:1186 */
void RedoPlayerVision(void);   /* @0x80055C20 OBJECTS.CPP:1459 */
void RestoreObjectLight(void);   /* @0x8005F9C4 OBJECTS.CPP:4484 */
void SetBookMsg(int i, int msg);   /* @0x80053AD0 OBJECTS.CPP:562 */
void SetObjMapRange(int i, int x1, int y1, int x2, int y2, int v);   /* @0x80053A70 OBJECTS.CPP:549 */
void SetupObject(int i, int x, int y, int ot);   /* @0x800537F0 OBJECTS.CPP:508 */
void SyncBreakObj(int pnum, int oi);   /* @0x8005ECA4 OBJECTS.CPP:4085 */
void SyncCrux(int i);   /* @0x8005EE38 OBJECTS.CPP:4134 */
void SyncL1Doors(int i);   /* @0x8005ED20 OBJECTS.CPP:4104 */
void SyncL2Doors(int i);   /* @0x8005F0F4 OBJECTS.CPP:4214 */
void SyncL3Doors(int i);   /* @0x8005F25C OBJECTS.CPP:4246 */
void SyncLever(int i);   /* @0x8005EF70 OBJECTS.CPP:4157 */
void SyncObjectAnim(int o);   /* @0x8005F388 OBJECTS.CPP:4277 */
void SyncOpL1Door(int pnum, int cmd, int i);   /* @0x8005DE68 OBJECTS.CPP:3797 */
void SyncOpL2Door(int pnum, int cmd, int i);   /* @0x8005DF7C OBJECTS.CPP:3813 */
void SyncOpL3Door(int pnum, int cmd, int i);   /* @0x8005E090 OBJECTS.CPP:3829 */
void SyncOpObject(int pnum, int cmd, int i);   /* @0x8005E1A4 OBJECTS.CPP:3845 */
void SyncPedistal(int i);   /* @0x8005F0EC OBJECTS.CPP:4190 */
void SyncQSTLever(int i);   /* @0x8005EFF4 OBJECTS.CPP:4169 */
void TryDisarm(int pnum, int i);   /* @0x8005A258 OBJECTS.CPP:2595 */

/* external helpers (defined/owned in other TUs), exact signatures from their oracle FCN records */
int AddLight(int x, int y, int r);
int AddMissile(int sx, int sy, int v1, int v2, int midir, int mitype, char micaster, int id, int v3, int spllvl);   /* @0x80142A04 MISSILES.CPP:3451 */
void MonsterTrapHit(int m, int mind, int maxd, int a4, int mtype, int a6);   /* @0x8013B04C */
void PlayerMHit(int pnum, int mnum, int mindam, int maxdam, int dist, int mtype, int a7, int a8);   /* @0x8013BB90 */
void AddUnLight(int i);
struct CBlocks * BL_GetCurrentBlocks(void);
void CalcPlrInv(int p, unsigned char Loadgfx);
void ChangeBlock(int x, int y, int bl);
void ChangeLightRadius(int i, int r);
void ChangeVisionXY(int id, int x, int y);
void CheckStats(int p);
void ClearBLOCK(int x, int y);
void ClearMISSILE(int x, int y);
void ClearSOLID(int x, int y);
void ClearTRAP(int x, int y);
void ClrPlrPath(int pnum);
void ConvertdPiece(void);
void CreateItem(int uid, int x, int y);
void CreateMagicArmor(int x, int y, int imisc, int icurs, unsigned char sendmsg, unsigned char delta);
void CreateMagicWeapon(int x, int y, int imisc, int icurs, unsigned char sendmsg, unsigned char delta);
void CreateRndItem(int x, int y, unsigned char onlygood, unsigned char sendmsg, unsigned char delta);
void CreateRndUseful(int pnum, int x, int y, unsigned char sendmsg);
void CreateSpellBook(int x, int y, int ispell, unsigned char sendmsg, unsigned char delta);
void CreateTypeItem(int x, int y, unsigned char onlygood, int itype, int imisc, unsigned char sendmsg, unsigned char delta);
void DBG_Error(char *Text, char *File, int Line);
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross, BOOL iso, unsigned char SinStep);
long ENG_random(long v);
void FillCrapBits(void);
int FindBlock(int x, int y);
void GM_FinishedUsing(struct TextDat *Fin);
struct TextDat * GM_UseTexData(int Id);
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);
int GetDirection(int x1, int y1, int x2, int y2);
void GetPlrHandSeed(struct ItemStruct *h);
long GetRndSeed(void);
BOOL GetSOLID(int x, int y);
char * GetStr(int StrId);
void GetSuperItemLoc(int x, int y, int *xx, int *yy);
unsigned char GetdDead(int x, int y);
void InitDiabloMsg(char e);
void InitLighting(void);
void InitQTextMsg(int m);
unsigned char IsDplayer(int x, int y);
void M_StartStand(int i, int md);
void ModifyPlrDex(int p, int l);
void ModifyPlrMag(int p, int l);
void ModifyPlrStr(int p, int l);
void ModifyPlrVit(int p, int l);
void NetSendCmdParam1(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1);
void NetSendCmdParam2(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1, unsigned short wParam2);
void NetSendCmdQuest(unsigned char bHiPri, unsigned char q);
void NewCursor(int i);
void PlaySFX(int psfx);
void PlaySfxLoc(int psfx, int x, int y);
struct ItemStruct * PlrHasItem(int pnum, int item, int *i);
unsigned char QuestStatus(int i);
void SetBLOCK(int x, int y);
void SetDPiece(int x, int y, short v);
void SetGoldCurs(int pnum, int i);
void SetMISSILE(int x, int y);
void SetPlrHandItem(struct ItemStruct *h, int idata);
void SetRndSeed(long s);
void SetSOLID(int x, int y);
void SetTRAP(int x, int y);
void SpawnQuestItem(int itemid, int x, int y, int randarea, int selflag);
unsigned char SpawnSkeleton(int ii, int x, int y);
void StartPlrKill(int pnum, int val);
void StartStand(int pnum, int dir);
void mem_free_dbg(void *p);
void RemoveInvItem(int pnum, int iv);   /* @0x8015D6FC INV.CPP:2399 */
void func_80159C74(int ot, int ox, int oy, int oi);   /* unnamed helper, not in this TU/segment */
