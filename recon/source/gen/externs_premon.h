extern int DebugMonsters[10];   /* @0x800CEC84 */
extern char MonstAvailTbl[112];   /* @0x8010C698 */
extern struct CMonster Monsters[16];   /* @0x8010A3BC */
extern struct UniqMonstStruct UniqMonst[96];   /* @0x8010C708 */
extern unsigned char currlevel;   /* @0x8011C10C */
extern int debugmonsttypes;   /* @0x8011B7A0 */
extern int diabquad1x;   /* @0x8011BF7C */
extern int diabquad1y;   /* @0x8011BF8C */
extern int diabquad2x;   /* @0x8011BF80 */
extern int diabquad2y;   /* @0x8011BF90 */
extern int diabquad3x;   /* @0x8011BF84 */
extern int diabquad3y;   /* @0x8011BF94 */
extern int diabquad4x;   /* @0x8011BF88 */
extern int diabquad4y;   /* @0x8011BF98 */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern unsigned char gbActivePlayers;   /* @0x8011B9A3 */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */
extern int gnDifficulty;   /* @0x8011C108 */
extern short monstactive[190];   /* @0x8010A0C4 */
extern unsigned char monstdebug;   /* @0x8011B799 */
extern struct MonsterStruct monster[190];   /* @0x80105394 */
extern struct MonsterData monsterdata[113];   /* @0x8010AB9C */
extern char MonstConvTbl[128];   /* @0x8010C618 -- placed immediately after monsterdata[] */
extern long monstimgtot;   /* @0x8011C2D0 */
extern long nummonsters;   /* @0x8011C2CC */
extern int nummtypes;   /* @0x8011C29C */
extern int numtrigs;   /* @0x8011BB78 */
extern char offset_x[8];   /* @0x8011C2A8 */
extern char offset_y[8];   /* @0x8011C2B0 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern unsigned char setlevel;   /* @0x8011C10E */
extern unsigned char setlvlnum;   /* @0x8011C10F */
extern int setpc_x;   /* @0x8011C0E4 */
extern int setpc_y;   /* @0x8011C0E8 */
extern int themeCount;   /* @0x8011C14C */
extern struct THEME_LOC themeLoc[50];   /* @0x80139C68 */
extern unsigned char totalmonsters;   /* @0x8011C2D4 */
extern struct TriggerStruct trigs[5];   /* @0x800E33CC */
extern int uniquetrans;   /* @0x8011C2D8 */
extern int zharlib;   /* @0x8011C190 */

extern int AddLight(int x, int y, int r);   /* @0x8004D2E8 LIGHTING.CPP:1184 */
extern int AddMonster(int x, int y, int dir, int mtype, unsigned char InMap);   /* @0x8007FDD0 COREMON.CPP:513 */
extern unsigned long CM_QuestToBitPattern(int QuestNum);   /* @0x80155A04 CHOOSEM.CPP:134 */
extern void ClearMVars(int i);   /* @0x8007F7D0 COREMON.CPP:370 */
extern void DoUnVision(int nXPos, int nYPos, int nRadius, int num);   /* @0x8004CD38 LIGHTING.CPP:892 */
extern void DoVision(int nXPos, int nYPos, int nRadius, unsigned char doautomap, unsigned char visible);   /* @0x8004CE40 LIGHTING.CPP:939 */
extern long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
extern unsigned char *GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);   /* @0x80074E9C TOWN.CPP:568 */
extern short GetDPiece(int x, int y);   /* @0x80082A44 DPIECE.CPP:151 */
extern void InitMonsterSND(int monst);   /* @0x8003D17C EFFECTS.CPP:249 */
extern void InitMonster(int i, int rd, int mtype, int x, int y);   /* @0x8007F84C COREMON.CPP:383 */
extern unsigned char IsDplayer(int x, int y);   /* @0x8005FD10 PLAYER.CPP:262 */
extern unsigned char IsSkel(int mt);   /* @0x8007F49C COREMON.CPP:168 */
extern void M_StartStand(int i, int md);   /* @0x8007FE70 COREMON.CPP:526 */
extern int ML_GetPresetMonsters(int currlevel, int *typelist, unsigned long QuestsNeededMask);   /* @0x8007D7F8 MLIST.CPP:163 */
extern void ObjChangeMapResync(int x1, int y1, int x2, int y2);   /* @0x80057978 OBJECTS.CPP:1914 */
extern unsigned char QuestStatus(int i);   /* @0x80067B70 QUESTS.CPP:305 */
extern void RedoPlayerVision(void);   /* @0x80055C20 OBJECTS.CPP:1459 */
extern unsigned char SolidLoc(int x, int y);   /* @0x80060C4C PLAYER.CPP:1339 */
extern void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */
extern "C" void DBG_SendMessage(const char *file, const char *fmt, ...);   /* @0x80020E6C GDEBUG.C:108 */
extern char animletter[7];   /* @0x8011C2A0 */
