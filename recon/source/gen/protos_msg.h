void ActivatePortal(int i, int x, int y, int lvl, int lvltype, unsigned char sp);   /* @0x8008113C PORTAL.CPP:236 */
int AddVision(int x, int y, int r, unsigned char mine);   /* @0x8004D5A8 LIGHTING.CPP:1436 */
void ClrPlrPath(int pnum);   /* @0x80067254 PLAYER.CPP:4704 */
void DeactivatePortal(int i);   /* @0x800811C8 PORTAL.CPP:253 */
void FadeGameOut(void);   /* @0x800768F0 TRIGS.CPP:833 */
int FindGetItem(int idx, unsigned short ci, int iseed);   /* @0x8008271C COREINV.CPP:52 */
long GAL_AlignSizeToType(unsigned long Size, unsigned long MemType);   /* @0x800227E0 GAL.C:1769 */
DLevel * GetDLevel(int LevNum, BOOL SetLevel);   /* @0x80052888 MSG.CPP:2790 */
int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP:102 */
void InitGamePadVars(void);   /* @0x8007AE80 GAMEPAD.CPP:2021 */
void MakePlrPath(int pnum, int xx, int yy, unsigned char endspace);   /* @0x80066D3C PLAYER.CPP:4685 */
void ModifyPlrDex(int p, int l);   /* @0x80065FA8 PLAYER.CPP:4462 */
void ModifyPlrMag(int p, int l);   /* @0x80065EBC PLAYER.CPP:4437 */
void ModifyPlrStr(int p, int l);   /* @0x80065DA0 PLAYER.CPP:4417 */
void ModifyPlrVit(int p, int l);   /* @0x8006608C PLAYER.CPP:4480 */
void NetSendCmdExtra(const TCmdGItem *p);   /* @0x8004FB68 MSG.CPP:1126 */
void NetSendCmdGItem2(unsigned char usonly, unsigned char bCmd, unsigned char mast, unsigned char pnum, const TCmdGItem *p);   /* @0x8004FA84 MSG.CPP:1069 */
unsigned char NetSendCmdReq2(unsigned char bCmd, unsigned char mast, unsigned char pnum, const TCmdGItem *p);   /* @0x8004FB08 MSG.CPP:1100 */
void NetSendLoPri(const unsigned char *pbMsg, unsigned char bLen);   /* @0x80052BA4 MULTI.CPP:168 */
void NewPlrAnim(int pnum, int Peq, int numFrames, int Delay);   /* @0x80066E70 PLAYER.CPP:4689 */
int PAK_DoPak(unsigned char *Dest, const unsigned char *buffer, int insize);   /* @0x800AE084 PAK.CPP:118 */
int PAK_DoUnpak(unsigned char *Dest, const unsigned char *Source);   /* @0x800AE2C4 PAK.CPP:245 */
BOOL PA_SetPauseOk(BOOL NewPause);   /* @0x80088BF4 PAUSE.CPP:573 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
unsigned char PortalOnLevel(int i);   /* @0x800811E8 PORTAL.CPP:262 */
void ReleaseDLevel(DLevel *Dl);   /* @0x800528D0 MSG.CPP:2807 */
void RemovePortalMissile(int id);   /* @0x80081280 PORTAL.CPP:285 */
void RestartTownLvl(int pnum);   /* @0x800672EC PLAYER.CPP:4706 */
void SetMultiQuest(int q, int s, unsigned char l, int v1);   /* @0x8006916C QUESTS.CPP:945 */
void SetPlrDex(int p, int v);   /* @0x800662F8 PLAYER.CPP:4546 */
void SetPlrMag(int p, int v);   /* @0x80066288 PLAYER.CPP:4530 */
void SetPlrStr(int p, int v);   /* @0x800661AC PLAYER.CPP:4514 */
void SetPlrVit(int p, int v);   /* @0x800663D4 PLAYER.CPP:4562 */
void StartNewLvl(int pnum, int fom, int lvl);   /* @0x80066C04 PLAYER.CPP:4681 */
void StartPlrKill(PlayerStruct *ptrplr, int earflag);   /* @0x80061C54 PLAYER.CPP:2254 */
void StartStand(int pnum, int dir);   /* @0x80066CA4 PLAYER.CPP:4683 */
void StartWarpLvl(int pnum, int pidx);   /* @0x80066D8C PLAYER.CPP:4686 */
void SyncBreakObj(int pnum, int oi);   /* @0x8005ECA4 OBJECTS.CPP:4085 */
void SyncInitPlr(int pnum);   /* @0x800672A0 PLAYER.CPP:4705 */
void SyncOpObject(int pnum, int cmd, int i);   /* @0x8005E1A4 OBJECTS.CPP:3845 */
void SyncPlrKill(int pnum, int earflag);   /* @0x80066DD8 PLAYER.CPP:4687 */
void TeleStop(int plr);   /* @0x800A040C DAVEL.CPP:749 */
int encode_enemy(int m);   /* @0x80080974 COREMON.CPP:739 */
void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */
void DeleteMissile(int mi, int i);   /* @0x8013A8E8 MISSILES.CPP:622 */
int AddMissile(int sx, int sy, int v1, int v2, int midir, int mitype, char micaster, int id, int v3, int spllvl);   /* @0x80142A04 MISSILES.CPP:3451 */
void ClearMissileSpot(int mi);   /* @0x8014AAC0 MISSILES.CPP:5885 */
void M_GetKnockback(int i, int d);   /* @0x8014B0BC MONSTER.CPP:615 */
void M_StartHit(int i, int pnum, int dam);   /* @0x8014B2D8 MONSTER.CPP:682 */
void M_SyncStartKill(int i, int x, int y, int pnum);   /* @0x8014C4E0 MONSTER.CPP:1099 */
void InvGetItem(int pnum, int ii);   /* @0x8015E180 INV.CPP:2589 */
void AutoGetItem(int pnum, int ii);   /* @0x8015E45C INV.CPP:2655 */
void SyncGetItem(int x, int y, int idx, unsigned short ci, int iseed);   /* @0x8015EEB8 INV.CPP:2842 */
int InvPutItem(int pnum, int x, int y);   /* @0x8015F16C INV.CPP:2990 */
int SyncPutItem(int pnum, int x, int y, int idx, unsigned short icreateinfo, int iseed, unsigned char Id, int dur, int mdur, int ch, int mch, int ivalue, unsigned long ibuff);   /* @0x8015F504 INV.CPP:3138 */
void DoResurrect(int pnum, int rid);   /* @0x80077850 SPELLS.CPP:250 */
void DoHealOther(int pnum, int rid);   /* @0x80077AB8 SPELLS.CPP:320 */
