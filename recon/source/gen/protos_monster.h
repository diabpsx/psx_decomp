void DeleteMonster(int i);   /* @0x8014AB74 MONSTER.CPP:432 */
int M_GetDir(int i);   /* @0x8014ABAC MONSTER.CPP:458 */
void M_StartDelay(int i, int len);   /* @0x8014AC10 MONSTER.CPP:479 */
void M_StartRAttack(int i, int missile_type, int dam);   /* @0x8014AC60 MONSTER.CPP:502 */
void M_StartRSpAttack(int i, int missile_type, int dam);   /* @0x8014AD80 MONSTER.CPP:532 */
void M_StartSpAttack(int i);   /* @0x8014AEF4 MONSTER.CPP:564 */
void M_StartEat(int i);   /* @0x8014AFE4 MONSTER.CPP:592 */
void M_GetKnockback(int i, int d);   /* @0x8014B0BC MONSTER.CPP:615 */
void M_StartHit(int i, int pnum, int dam);   /* @0x8014B2D8 MONSTER.CPP:682 */
void M_DiabloDeath(int i, unsigned char sendmsg, int pnum);   /* @0x8014B5C0 MONSTER.CPP:745 */
void M2MStartHit(int mid, int i, int dam);   /* @0x8014B8E8 MONSTER.CPP:810 */
void MonstStartKill(int i, int pnum, unsigned char sendmsg);   /* @0x8014BBA4 MONSTER.CPP:868 */
void SyncMonstStartKill(int i, int pnum, unsigned char sendmsg);   /* @0x8014BEC0 MONSTER.CPP:953 */
void M2MStartKill(int i, int mid);   /* @0x8014C010 MONSTER.CPP:999 */
void M_StartKill(int i, int pnum);   /* @0x8014C3D8 MONSTER.CPP:1069 */
void M_SyncStartKill(int i, int x, int y, int pnum);   /* @0x8014C4E0 MONSTER.CPP:1099 */
void M_StartFadein(int i, int md, unsigned char backwards);   /* @0x8014C5F0 MONSTER.CPP:1122 */
void M_StartFadeout(int i, int md, unsigned char backwards);   /* @0x8014C74C MONSTER.CPP:1150 */
void M_StartHeal(int i);   /* @0x8014C89C MONSTER.CPP:1176 */
void M_ChangeLightOffset(int monst);   /* @0x8014C928 MONSTER.CPP:1195 */
int M_DoStand(int i);   /* @0x8014CA90 MONSTER.CPP:1275 */
int M_DoWalk(int i);   /* @0x8014CAF0 MONSTER.CPP:1301 */
int M_DoWalk2(int i);   /* @0x8014CD60 MONSTER.CPP:1355 */
int M_DoWalk3(int i);   /* @0x8014CF4C MONSTER.CPP:1389 */
void M_TryM2MHit(int i, int mid, int hper, int mind, int maxd);   /* @0x8014D1F0 MONSTER.CPP:1427 */
void M_TryH2HHit(int i, int pnum, int Hit, int MinDam, int MaxDam);   /* @0x8014D428 MONSTER.CPP:1478 */
int M_DoAttack(int i);   /* @0x8014DA3C MONSTER.CPP:1634 */
int M_DoRAttack(int i);   /* @0x8014DBE8 MONSTER.CPP:1681 */
int M_DoRSpAttack(int i);   /* @0x8014DD70 MONSTER.CPP:1711 */
int M_DoSAttack(int i);   /* @0x8014DF78 MONSTER.CPP:1741 */
int M_DoFadein(int i);   /* @0x8014E054 MONSTER.CPP:1759 */
int M_DoFadeout(int i);   /* @0x8014E134 MONSTER.CPP:1775 */
int M_DoHeal(int i);   /* @0x8014E260 MONSTER.CPP:1800 */
int M_DoTalk(int i);   /* @0x8014E2FC MONSTER.CPP:1827 */
void M_Teleport(int i);   /* @0x8014E8A0 MONSTER.CPP:1944 */
int M_DoGotHit(int i);   /* @0x8014EAB4 MONSTER.CPP:1996 */
void DoEnding(int p);   /* @0x8014EB1C MONSTER.CPP:2016 */
void PrepDoEnding(int pnum);   /* @0x8014EBC4 MONSTER.CPP:2067 */
int M_DoDeath(int i);   /* @0x8014ED0C MONSTER.CPP:2097 */
int M_DoSpStand(int i);   /* @0x8014EED0 MONSTER.CPP:2147 */
int M_DoDelay(int i);   /* @0x8014EF7C MONSTER.CPP:2162 */
int M_DoStone(int i);   /* @0x8014F090 MONSTER.CPP:2192 */
void M_WalkDir(int i, int md);   /* @0x8014F10C MONSTER.CPP:2206 */
void GroupUnity(int i);   /* @0x8014F33C MONSTER.CPP:2274 */
unsigned char M_CallWalk(int i, int md);   /* @0x8014F750 MONSTER.CPP:2359 */
unsigned char M_CallWalk2(int i, int md);   /* @0x8014F8F0 MONSTER.CPP:2410 */
unsigned char M_DumbWalk(int i, int md);   /* @0x8014F9E8 MONSTER.CPP:2431 */
unsigned char M_RoundWalk(int i, int md, int &dir);   /* @0x8014FA3C MONSTER.CPP:2445 (R = reference, hand-fixed) */
void MAI_Zombie(int i);   /* @0x8014FB88 MONSTER.CPP:2489 */
void MAI_SkelSd(int i);   /* @0x8014FD88 MONSTER.CPP:2532 */
void MAI_Snake(int i);   /* @0x8014FF38 MONSTER.CPP:2570 */
void MAI_Bat(int i);   /* @0x80150334 MONSTER.CPP:2641 */
void MAI_SkelBow(int i);   /* @0x801506E8 MONSTER.CPP:2723 */
void MAI_Fat(int i);   /* @0x801508DC MONSTER.CPP:2767 */
void MAI_Sneak(int i);   /* @0x80150AA4 MONSTER.CPP:2803 */
void MAI_Fireman(int i);   /* @0x80150E80 MONSTER.CPP:2896 */
void MAI_Fallen(int i);   /* @0x80151184 MONSTER.CPP:2984 */
void MAI_Cleaver(int i);   /* @0x80151498 MONSTER.CPP:3070 */
void MAI_Round(int i, unsigned char special);   /* @0x8015159C MONSTER.CPP:3098 */
void MAI_GoatMc(int i);   /* @0x801519DC MONSTER.CPP:3176 */
void MAI_Ranged(int i, int missile_type, unsigned char special);   /* @0x801519FC MONSTER.CPP:3184 */
void MAI_GoatBow(int i);   /* @0x80151C20 MONSTER.CPP:3243 */
void MAI_Succ(int i);   /* @0x80151C44 MONSTER.CPP:3248 */
void MAI_AcidUniq(int i);   /* @0x80151C68 MONSTER.CPP:3253 */
void MAI_Scav(int i);   /* @0x80151C8C MONSTER.CPP:3268 */
void MAI_Garg(int i);   /* @0x80152050 MONSTER.CPP:3364 */
void MAI_RoundRanged(int i, int missile_type, unsigned char checkdoors, int dam, unsigned char lessmissiles);   /* @0x80152230 MONSTER.CPP:3417 */
void MAI_Magma(int i);   /* @0x80152720 MONSTER.CPP:3513 */
void MAI_Storm(int i);   /* @0x8015274C MONSTER.CPP:3518 */
void MAI_Acid(int i);   /* @0x80152778 MONSTER.CPP:3523 */
void MAI_Diablo(int i);   /* @0x801527A8 MONSTER.CPP:3529 */
void MAI_RR2(int i, int mistype, int dam);   /* @0x801527D4 MONSTER.CPP:3534 */
void MAI_Mega(int i);   /* @0x80152CB8 MONSTER.CPP:3631 */
void MAI_SkelKing(int i);   /* @0x80152CDC MONSTER.CPP:3639 */
void MAI_Rhino(int i);   /* @0x80153218 MONSTER.CPP:3746 */
void MAI_Counselor(int i);   /* @0x801536D4 MONSTER.CPP:3841 */
void MAI_Garbud(int i);   /* @0x80153B70 MONSTER.CPP:3943 */
void MAI_Zhar(int i);   /* @0x80153D80 MONSTER.CPP:3990 */
void MAI_SnotSpil(int i);   /* @0x80153F7C MONSTER.CPP:4031 */
void MAI_Lazurus(int i);   /* @0x801541CC MONSTER.CPP:4084 */
void MAI_Lazhelp(int i);   /* @0x80154470 MONSTER.CPP:4144 */
void MAI_Lachdanan(int i);   /* @0x801545A8 MONSTER.CPP:4185 */
void MAI_Warlord(int i);   /* @0x80154758 MONSTER.CPP:4227 */
void DeleteMonsterList(void);   /* @0x801548C0 MONSTER.CPP:4269 */
void ProcessMonsters(void);   /* @0x801549E4 MONSTER.CPP:4300 */
unsigned char DirOK(int i, int mdir);   /* @0x80154FAC MONSTER.CPP:4553 */
unsigned char PosOkMissile(int x, int y);   /* @0x80155158 MONSTER.CPP:4625 */
unsigned char CheckNoSolid(int x, int y);   /* @0x801551D0 MONSTER.CPP:4634 */
unsigned char LineClearF(unsigned char (*Clear)(int, int), int x1, int y1, int x2, int y2);   /* @0x801551F0 MONSTER.CPP:4663 (hand-fixed fn-ptr arg types) */
unsigned char LineClear(int x1, int y1, int x2, int y2);   /* @0x80155478 MONSTER.CPP:4790 */
unsigned char LineClearF1(unsigned char (*Clear)(int, int, int), int monst, int x1, int y1, int x2, int y2);   /* @0x801554B8 MONSTER.CPP:4802 (hand-fixed fn-ptr arg types) */
void M_FallenFear(int x, int y);   /* @0x8015574C MONSTER.CPP:5014 */
void PrintMonstHistory(int mt);   /* @0x80155934 MONSTER.CPP:5061 */
void PrintUniqueHistory(void);   /* @0x80155BB8 MONSTER.CPP:5151 */
void MissToMonst(int i, int x, int y);   /* @0x80155CE4 MONSTER.CPP:5187 */
unsigned char PosOkMonst3(int i, int x, int y);   /* @0x801561B0 MONSTER.CPP:5353 */
int M_SpawnSkel(int x, int y, int dir);   /* @0x8015648C MONSTER.CPP:5406 */
void TalktoMonster(int i);   /* @0x801565DC MONSTER.CPP:5445 */
void SpawnGolum(int i, int x, int y, int mi);   /* @0x8015671C MONSTER.CPP:5485 */
unsigned char CanTalkToMonst(int m);   /* @0x8015694C MONSTER.CPP:5519 */
unsigned char CheckMonsterHit(int m, unsigned char &ret);   /* @0x8015698C MONSTER.CPP:5531 (R = reference, hand-fixed) */
BOOL gSameRoom(int m, int i);   /* @0x80156A68 MONSTER.CPP:5556 */
void MAI_Golum(int i);   /* @0x80156B00 MONSTER.CPP:5566 */
void M_StartAttack(int i);   /* @0x8015702C MONSTER.CPP:5786 */
void M_StartWalk(int i, int xvel, int yvel, int xadd, int yadd, int EndDir);   /* @0x8015711C MONSTER.CPP:5810 */
int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
BOOL GetMISSILE(int x, int y);   /* @0x80082E40 DPIECE.CPP:219 */
BOOL GetSOLID(int x, int y);   /* @0x80082CE0 DPIECE.CPP:194 */
void M_StartStand(int i, int md);   /* @0x8007FE70 COREMON.CPP:526 */
void play_movie(char *pszMovie);   /* @0x800AD128 COREFMV.CPP:197 */
void music_stop(void);   /* @0x80077E50 SOUND.CPP:227 */
void HappyMan(int n);   /* @0x80077FEC GAMEPAD.CPP:127 */
void PlayEffect(int i, int mode);   /* @0x8003D528 EFFECTS.CPP:433 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
void NewMonsterAnim(int i, AnimStruct &anim, int md, int AnimType);   /* @0x8007F4FC COREMON.CPP:178 (R = reference, hand-fixed) */
unsigned char PosOkMonst(int i, int x, int y);   /* @0x8008045C COREMON.CPP:665 */
unsigned char SolidLoc(int x, int y);   /* @0x80060C4C PLAYER.CPP:1339 */
unsigned char IsDplayer(int x, int y);   /* @0x8005FD10 PLAYER.CPP:262 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
unsigned char IsSkel(int mt);   /* COREMON.CPP */
int AddMonster(int x, int y, int dir, int mtype, unsigned char InMap);   /* @0x8007FDD0 COREMON.CPP:513 */
void M_StartSpStand(int i, int md);   /* COREMON.CPP */
void delta_monster_hp(int mi, long hp, unsigned char bLevel);
void NetSendCmdParam2(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1, unsigned short wParam2);
void NetSendCmdGolem(unsigned char mx, unsigned char my, unsigned char dir, unsigned char menemy, long hp, unsigned char cl);
void ObjChangeMapResync(int x1, int y1, int x2, int y2);
void RedoPlayerVision(void);
void StartPlrHit(int pnum, int dam, unsigned char forcehit);
unsigned char ChkPlrOffsets(int a0, int a1, int a2, int a3);
unsigned char PosOkPlayer(int pnum, int x, int y);
void SetPlayerOld(int pnum);
void WorldToOffset(int pnum, int x, int y);
unsigned char GetdDead(int x, int y);
void SetdDead(int x, int y, unsigned char v);
char * GetStr(int StrId);   /* @0x8007B528 LANG.CPP:171 */
void AddPanelString(char *str, int just);   /* @0x80031E60 CONTROL.CPP:1279 */
void ChangeLightOff(int i, int x, int y);   /* @0x8004D3B8 LIGHTING.CPP:1265 */
void SetLightFX(int x, int y, short s_r, short s_g, short s_b, unsigned char d_r, unsigned char d_g, unsigned char d_b);   /* @0x8004BD40 LIGHTING.CPP:416 */
void MonstPartJump(int m);   /* @0x8009F594 DAVEL.CPP:461 */
void RemoveStoneMissiles(int mon, int mx, int my);   /* @0x80147AB8 MISSILES.CPP:4997 */
void delta_kill_monster(int mi, unsigned char x, unsigned char y, unsigned char bLevel);   /* @0x8004EAF4 MSG.CPP:284 */
void NetSendCmdLocParam1(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1);   /* @0x8004F774 MSG.CPP:916 */
void MonstCheckDoors(int m);   /* @0x8005704C OBJECTS.CPP:1783 */
void ChangeLightXY(int i, int x, int y);   /* @0x8004D384 LIGHTING.CPP:1234 */
int AddMissile(int sx, int sy, int v1, int v2, int midir, int mitype, char micaster, int id, int v3, int spllvl);   /* @0x80142A04 MISSILES.CPP:3451 */
void AddDead(int dx, int dy, char dv, int ddir);   /* @0x80037F8C DEAD.CPP:99 */
void M_UpdateLeader(int i);   /* @0x8007FFD4 COREMON.CPP:559 */
unsigned char effect_is_playing(int nSFX);   /* @0x8003CF34 EFFECTS.CPP:83 */
void M_CheckEFlag(int i);   /* @0x8007F354 COREMON.CPP:110 */
void M_Enemy(int i);   /* @0x8007F5B8 COREMON.CPP:225 */
void M_ClearSquares(int i);   /* @0x8007F35C COREMON.CPP:139 */
void AddPlrMonstExper(int lvl, long exp, char pmask);   /* @0x800608A0 PLAYER.CPP:987 */
unsigned char QuestStatus(int i);   /* @0x80067B70 QUESTS.CPP:305 */
void CreateTypeItem(int x, int y, unsigned char onlygood, int itype, int imisc, unsigned char sendmsg, unsigned char delta);   /* @0x80044EC4 ITEMS.CPP:2934 */
void SpawnItem(int m, int x, int y, unsigned char sendmsg);   /* @0x800447C8 ITEMS.CPP:2746 */
void stream_stop(void);   /* @0x8003CF5C EFFECTS.CPP:107 */
void CheckQuestKill(int m, unsigned char sendmsg);   /* @0x80067C04 QUESTS.CPP:317 */
void SetRndSeed(long s);   /* @0x8003DACC ENGINE.CPP:94 */
long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP:102 */
ItemStruct * PlrHasItem(int pnum, int item, int *i);   /* @0x8003B768 TOWNERS.CPP:593 */
void RemoveInvItem(int pnum, int iv);   /* @0x8015D6FC INV.CPP:2399 */
void NetSendCmdQuest(unsigned char bHiPri, unsigned char q);   /* @0x8004F8C8 MSG.CPP:998 */
