/* DRLG_L1.CPP -- externs (globals owned by other TUs, plus this TU's own data objects). */

/* owned by GENDUNG.CPP */
extern unsigned short dungeon[48][48];   /* @0x800E40C4 */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern unsigned char currlevel;   /* @0x8011C10C */
extern unsigned char leveltype;   /* @0x8011C10D */
extern unsigned char setlevel;   /* @0x8011C10E */
extern int setpc_x;   /* @0x8011C0E4 */
extern int setpc_y;   /* @0x8011C0E8 */
extern int setpc_w;   /* @0x8011C0EC */
extern int setpc_h;   /* @0x8011C0F0 */
extern char TransVal;   /* @0x8011C148 */
extern int themeCount;   /* @0x8011C14C */
extern int dminx;   /* @0x8011C0F8 */
extern int dminy;   /* @0x8011C0FC */
extern int dmaxx;   /* @0x8011C100 */
extern int dmaxy;   /* @0x8011C104 */
extern int ViewX;   /* @0x8011C114 */
extern int ViewY;   /* @0x8011C118 */
extern int LvlViewX;   /* @0x8011C12C */
extern int LvlViewY;   /* @0x8011C130 */
void DRLG_CopyTrans(int sx, int sy, int dx, int dy);   /* @0x8015A158 GENDUNG.CPP:262 */
void DRLG_InitTrans(void);   /* @0x8015A070 GENDUNG.CPP:229 */
void DRLG_InitSetPC(void);   /* @0x8015A2A4 GENDUNG.CPP:307 */
void DRLG_SetPC(void);   /* @0x8015A2BC GENDUNG.CPP:319 */

/* owned by DRLG_L2.CPP (generation-time dflags scratch, shared by all DRLG_L*) */
extern unsigned char *mydflags;   /* @0x8011C0D8 */

/* owned by DPIECE.CPP */
void SetDPiece(int x, int y, short v);   /* @0x80082ACC DPIECE.CPP:158 */
extern unsigned char pMegaTiles[2736];   /* @0x800CECAC */
extern unsigned char pdungeon[40][40];   /* @0x800E52C4 */

/* owned by PRETRIGS.CPP / TOWNERS.CPP */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */

/* owned by PREQUEST.CPP */
void DRLG_CheckQuests(int x, int y);   /* @0x8015F334 PREQUEST.CPP:401 */

/* owned by QUESTS.CPP */
unsigned char QuestStatus(int i);   /* @0x80067B70 QUESTS.CPP:305 */

/* owned by OBJECTS.CPP */
void DRLG_MRectTrans(int x1, int y1, int x2, int y2);   /* @0x800578DC OBJECTS.CPP:1896 */

/* owned by PREMON.CPP / PREOBJ.CPP */
void SetMapMonsters(unsigned char *pMap, int startx, int starty);   /* @0x80160CA0 PREMON.CPP:825 */
void SetMapObjects(unsigned char *pMap, int startx, int starty);   /* @0x80157A88 PREOBJ.CPP:823 */

/* owned by TOWN.CPP */
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);   /* @0x80074E9C TOWN.CPP:568 */

/* owned by LOADING.CPP */
void UPDATEPROGRESS(int inc);   /* @0x800A457C LOADING.CPP:162 */

/* owned by ENGINE.CPP */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
void SetRndSeed(long s);   /* @0x8003DACC ENGINE.CPP:94 */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */

/* DRLG_L1.CPP's own scalar globals */
extern unsigned char *pSetPiece;   /* @0x8011C0DC */
extern unsigned char setloadflag;  /* @0x8011C0F4 */

/* PSX lighting-restore globals (own to a shared lighting TU; DRLG_L1 only reads/writes them) */
extern unsigned char dung_map_r[56][56];   /* @0x80100228 */
extern unsigned char dung_map_g[56][56];   /* @0x80100E68 */
extern unsigned char dung_map_b[56][56];   /* @0x80101AA8 */
extern int restore_r;   /* @0x8011B8F8 */
extern int restore_g;   /* @0x8011B8FC */
extern int restore_b;   /* @0x8011B900 */
