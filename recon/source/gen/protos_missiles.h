void GetDamageAmt(int i, int *mind, int *maxd);   /* @0x80139C04 MISSILES.CPP:274 */
int CheckBlock(int fx, int fy, int tx, int ty);   /* @0x8013A1FC MISSILES.CPP:443 */
int FindClosest(int sx, int sy, int rad);   /* @0x8013A2B0 MISSILES.CPP:469 */
int GetSpellLevel(int id, int sn);   /* @0x8013A43C MISSILES.CPP:498 */
int GetDirection8(int x1, int y1, int x2, int y2);   /* @0x8013A4B0 MISSILES.CPP:530 */
int GetDirection16(int x1, int y1, int x2, int y2);   /* @0x8013A6CC MISSILES.CPP:576 */
void DeleteMissile(int mi, int i);   /* @0x8013A8E8 MISSILES.CPP:622 */
void GetMissileVel(int i, int sx, int sy, int dx, int dy, int v);   /* @0x8013A988 MISSILES.CPP:637 */
void PutMissile(int i);   /* @0x8013AB44 MISSILES.CPP:656 */
void GetMissilePos(int i);   /* @0x8013ADA0 MISSILES.CPP:719 */
void MoveMissilePos(int i);   /* @0x8013AED4 MISSILES.CPP:761 */
unsigned char MonsterTrapHit(int m, int mindam, int maxdam, int dist, int t, unsigned char shift);   /* @0x8013B04C MISSILES.CPP:826 */
unsigned char MonsterMHit(int pnum, int m, int mindam, int maxdam, int dist, int t, unsigned char shift);   /* @0x8013B3D0 MISSILES.CPP:906 */
unsigned char PlayerMHit(int pnum, int m, int dist, int mind, int maxd, int mtype, unsigned char shift, unsigned char earflag);   /* @0x8013BB90 MISSILES.CPP:1030 */
unsigned char Plr2PlrMHit(int pnum, int p, int mindam, int maxdam, int dist, int mtype, unsigned char shift);   /* @0x8013C5EC MISSILES.CPP:1162 */
void CheckMissileCol(int i, int mindam, int maxdam, unsigned char shift, int mx, int my, unsigned char nodel, BOOL HurtPlr);   /* @0x8013CD88 MISSILES.CPP:1261 */
unsigned char GetTableValue(unsigned char code, int dir);   /* @0x8013D2B8 MISSILES.CPP:1358 */
void SetMissAnim(int mi, int animtype);   /* @0x8013D34C MISSILES.CPP:1378 */
void SetMissDir(int mi, int dir);   /* @0x8013D424 MISSILES.CPP:1402 */
void AddLArrow(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013D470 MISSILES.CPP:1558 */
void AddArrow(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013D658 MISSILES.CPP:1591 */
void GetVileMissPos(int mi, int dx, int dy);   /* @0x8013D818 MISSILES.CPP:1616 */
void AddRndTeleport(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013D954 MISSILES.CPP:1646 */
void AddFirebolt(int mi, int sx, int sy, int dx, int dy, int midir, char micaster, int id, int dam);   /* @0x8013DC98 MISSILES.CPP:1709 */
void AddMagmaball(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013DED0 MISSILES.CPP:1757 */
void AddTeleport(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013DFEC MISSILES.CPP:1791 */
void AddLightball(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013E228 MISSILES.CPP:1836 */
void AddFirewall(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013E390 MISSILES.CPP:1858 */
void AddFireball(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013E588 MISSILES.CPP:1883 */
void AddLightctrl(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013E7F4 MISSILES.CPP:1929 */
void AddLightning(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013E8E0 MISSILES.CPP:1944 */
void AddMisexp(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013EACC MISSILES.CPP:1980 */
void AddWeapexp(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013ECF8 MISSILES.CPP:2010 */
unsigned char CheckIfTrig(int x, int y);   /* @0x8013EDF8 MISSILES.CPP:2028 */
void AddTown(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013EFA0 MISSILES.CPP:2050 */
void AddFlash(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013F420 MISSILES.CPP:2130 */
void AddFlash2(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013F64C MISSILES.CPP:2158 */
void AddManashield(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013F83C MISSILES.CPP:2189 */
void AddFiremove(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013F910 MISSILES.CPP:2208 */
void AddGuardian(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013FA70 MISSILES.CPP:2225 */
void AddChain(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013FEE4 MISSILES.CPP:2287 */
void AddRhino(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x8013FF48 MISSILES.CPP:2430 */
void AddFlare(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x801400CC MISSILES.CPP:2506 */
void AddAcid(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x801403DC MISSILES.CPP:2559 */
void AddAcidpud(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x801404F0 MISSILES.CPP:2641 */
void AddStone(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x801405D4 MISSILES.CPP:2669 */
void AddGolem(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80140904 MISSILES.CPP:2745 */
void AddBoom(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80140C44 MISSILES.CPP:2869 */
void AddHeal(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80140CE8 MISSILES.CPP:2886 */
void AddHealOther(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80140F14 MISSILES.CPP:2913 */
void AddElement(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80140F84 MISSILES.CPP:2927 */
void AddIdentify(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x801411B4 MISSILES.CPP:2965 */
void AddFirewallC(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80141258 MISSILES.CPP:2982 */
void AddInfra(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80141518 MISSILES.CPP:3033 */
void AddWave(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80141624 MISSILES.CPP:3049 */
void AddNova(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x801416B0 MISSILES.CPP:3064 */
void AddRepair(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x801418C0 MISSILES.CPP:3104 */
void AddRecharge(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80141978 MISSILES.CPP:3121 */
void AddDisarm(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80141A30 MISSILES.CPP:3138 */
void AddApoca(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80141AA0 MISSILES.CPP:3153 */
void AddFlame(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int seqno);   /* @0x80141D08 MISSILES.CPP:3184 */
void AddFlamec(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80141F40 MISSILES.CPP:3221 */
void AddCbolt(int mi, int sx, int sy, int dx, int dy, int midir, char micaster, int id, int dam);   /* @0x80142038 MISSILES.CPP:3245 */
void AddHbolt(int mi, int sx, int sy, int dx, int dy, int midir, char micaster, int id, int dam);   /* @0x80142248 MISSILES.CPP:3289 */
void AddResurrect(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80142414 MISSILES.CPP:3322 */
void AddResurrectBeam(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80142490 MISSILES.CPP:3334 */
void AddTelekinesis(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80142520 MISSILES.CPP:3351 */
void AddBoneSpirit(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80142590 MISSILES.CPP:3365 */
void AddRportal(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x80142794 MISSILES.CPP:3412 */
void AddDiabApoca(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);   /* @0x801428C0 MISSILES.CPP:3435 */
int AddMissile(int sx, int sy, int v1, int v2, int midir, int mitype, char micaster, int id, int v3, int spllvl);   /* @0x80142A04 MISSILES.CPP:3451 */
int Sentfire(int i, int sx, int sy);   /* @0x80142E90 MISSILES.CPP:3561 */
void MI_Dummy(int i);   /* @0x80143078 MISSILES.CPP:3587 */
void MI_Golem(int i);   /* @0x80143080 MISSILES.CPP:3591 */
void MI_SetManashield(int i);   /* @0x801432FC MISSILES.CPP:3627 */
void MI_LArrow(int i);   /* @0x80143340 MISSILES.CPP:3635 */
void MI_Arrow(int i);   /* @0x80143B54 MISSILES.CPP:3725 */
void MI_Firebolt(int i);   /* @0x80143D98 MISSILES.CPP:3754 */
void MI_Lightball(int i);   /* @0x801444AC MISSILES.CPP:3855 */
void MI_Acidpud(int i);   /* @0x80144764 MISSILES.CPP:3901 */
void MI_Firewall(int i);   /* @0x80144890 MISSILES.CPP:3930 */
void MI_Fireball(int i);   /* @0x80144BAC MISSILES.CPP:3971 */
void MI_Lightctrl(int i);   /* @0x80145528 MISSILES.CPP:4070 */
void MI_Lightning(int i);   /* @0x801458E0 MISSILES.CPP:4140 */
void MI_Town(int i);   /* @0x801459E0 MISSILES.CPP:4166 */
void MI_Flash(int i);   /* @0x80145D38 MISSILES.CPP:4219 */
void MI_Flash2(int i);   /* @0x801460AC MISSILES.CPP:4257 */
void MI_Manashield(int i);   /* @0x80146288 MISSILES.CPP:4288 */
void MI_Firemove(int i);   /* @0x80146588 MISSILES.CPP:4426 */
void MI_Guardian(int i);   /* @0x80146828 MISSILES.CPP:4473 */
void MI_Chain(int i);   /* @0x80146AE0 MISSILES.CPP:4545 */
void MI_Weapexp(int i);   /* @0x80146D48 MISSILES.CPP:4674 */
void MI_Misexp(int i);   /* @0x801470A4 MISSILES.CPP:4718 */
void MI_Acidsplat(int i);   /* @0x801473C4 MISSILES.CPP:4773 */
void MI_Teleport(int i);   /* @0x80147570 MISSILES.CPP:4797 */
void MI_Stone(int i);   /* @0x801478DC MISSILES.CPP:4964 */
void RemoveStoneMissiles(int mon, int mx, int my);   /* @0x80147AB8 MISSILES.CPP:4997 */
void MI_Boom(int i);   /* @0x80147B40 MISSILES.CPP:5013 */
void MI_Rhino(int i);   /* @0x80147C44 MISSILES.CPP:5024 */
void MI_FirewallC(int i);   /* @0x80148054 MISSILES.CPP:5179 */
void MI_Infra(int i);   /* @0x80148288 MISSILES.CPP:5221 */
void MI_Apoca(int i);   /* @0x80148348 MISSILES.CPP:5235 */
void MI_Wave(int i);   /* @0x80148600 MISSILES.CPP:5265 */
void MI_Nova(int i);   /* @0x80148A9C MISSILES.CPP:5328 */
void MI_Flame(int i);   /* @0x80148D78 MISSILES.CPP:5438 */
void MI_Flamec(int i);   /* @0x80148F94 MISSILES.CPP:5466 */
void MI_Cbolt(int i);   /* @0x80149210 MISSILES.CPP:5498 */
void MI_Hbolt(int i);   /* @0x80149564 MISSILES.CPP:5545 */
void MI_Element(int i);   /* @0x80149890 MISSILES.CPP:5587 */
void MI_Bonespirit(int i);   /* @0x80149FAC MISSILES.CPP:5670 */
void MI_ResurrectBeam(int i);   /* @0x8014A3E0 MISSILES.CPP:5743 */
void MI_Rportal(int i);   /* @0x8014A458 MISSILES.CPP:5753 */
void ProcessMissiles(void);   /* @0x8014A694 MISSILES.CPP:5780 */
void ClearMissileSpot(int mi);   /* @0x8014AAC0 MISSILES.CPP:5885 */

/* cross-TU callees (symhdr.py proto <mangled>) */
unsigned char PosOkMonst(int i, int x, int y);   /* @0x8008045C COREMON.CPP:665 */
int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
void ChangeLightOff(int i, int x, int y);   /* @0x8004D3B8 LIGHTING.CPP:1265 */
BOOL GetMISSILE(int x, int y);   /* @0x80082E40 DPIECE.CPP:219 */
BOOL GetSOLID(int x, int y);   /* @0x80082CE0 DPIECE.CPP:194 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
int veclen2(int dx, int dy);   /* @0x8004BC68 ENGINE.CPP; integer distance approximation, NOT sqrt(dx*dx+dy*dy) -- confirmed via raw oracle jal target */
void SpawnGolum(int id, int x, int y, int mi);   /* @0x8015671C MONSTER.CPP (SYM: SpawnGolum__Fiiii, VOID) */
void NetSendCmdParam1(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1);   /* MSG.CPP:487 */
void ClrPlrPath(int pnum);   /* PLAYER.CPP:372 */
void NetSendCmd(unsigned char bHiPri, unsigned char bCmd);   /* MSG.CPP:419 */
void SetPlayerHitPoints(int pnum, int val);   /* PLAYER.CPP:282 */
void UseMana(int id, int sn);   /* @0x80077308 SPELLS.CPP:110 */
void NewCursor(int i);   /* @0x80037804 CURSOR.CPP:179 */
void AddUnLight(int i);   /* @0x8004D340 LIGHTING.CPP:1207 */
int AddLight(int x, int y, int r);   /* @0x8004D2A0 LIGHTING.CPP */
void M_StartKill(int i, int pnum);   /* @0x8014C3D8 MONSTER.CPP:1069 */
void M_StartHit(int i, int pnum, int dam);   /* @0x8014B2D8 MONSTER.CPP:682 */
void PlayEffect(int i, int mode);   /* @0x8003D528 EFFECTS.CPP:433 */
void M_GetKnockback(int i, int d);   /* @0x8014B0BC MONSTER.CPP:615 */
void StartPlrBlock(int pnum, int dir);   /* @0x80066F08 PLAYER.CPP:4691 */
void StartPlrHit(int pnum, int dam, unsigned char forcehit);   /* @0x80066F54 PLAYER.CPP:4692 */
void SyncPlrKill(int pnum, int earflag);   /* @0x80066DD8 PLAYER.CPP:4687 */
void PlaySfxLoc(int psfx, int x, int y);   /* @0x8003D784 EFFECTS.CPP:535 */
unsigned char CheckMonsterHit(int m, unsigned char *ret);   /* @0x8015698C MONSTER.CPP:5531 */
void StartPlrKill(int pnum, int val);   /* @0x80066E24 PLAYER.CPP:4688 */
unsigned char LineClear(int x1, int y1, int x2, int y2);   /* @0x80155478 MONSTER.CPP:4790 */
void AddDead(int dx, int dy, char dv, int ddir);   /* @0x80037F8C DEAD.CPP:99 */
void ChangeLight(int i, int x, int y, int r);   /* @0x8004D3E0 LIGHTING.CPP:1283 */
BOOL GetMISSILE(int x, int y);   /* @0x80082E40 DPIECE.CPP:219 */
unsigned char PosOkPlayer(int pnum, int x, int y);   /* @0x80066B6C PLAYER.CPP:4679 */
unsigned char IsDplayer(int x, int y);   /* @0x8005FD10 PLAYER.CPP:262 */
void CalcPlrItemVals(int p, unsigned char Loadgfx);   /* @0x8003E6B0 ITEMS.CPP:684 */
