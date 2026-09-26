/* DRLG_L4.CPP -- externs (globals owned by other TUs, plus this TU's own data objects). */

/* owned by GENDUNG.CPP */
extern unsigned short dungeon[48][48];   /* @0x800E40C4 */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern unsigned char currlevel;   /* @0x8011C10D */
extern int setpc_x;   /* @0x8011C0E4 */
extern int setpc_y;   /* @0x8011C0E8 */
extern int setpc_w;   /* @0x8011C0EC */
extern int setpc_h;   /* @0x8011C0F0 */
extern char TransVal;   /* @0x8011C148 */

/* owned by DRLG_L2.CPP (generation-time dflags scratch, shared by all DRLG_L*) */
extern unsigned char *mydflags;   /* @0x8011C0D8 */

/* owned by DPIECE.CPP */
short GetDPiece(int x, int y);   /* @0x80082A44 */
void SetDPiece(int x, int y, short v);   /* @0x80082ACC */
extern unsigned char pMegaTiles[2736];   /* @0x800CECAC */
extern unsigned char pdungeon[40][40];   /* @0x800E52C4 */

/* owned by PRETRIGS.CPP / TOWNERS.CPP */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */

/* owned by ENGINE.CPP */
void SetRndSeed(long s);   /* @0x8003DACC */

/* DRLG_L4.CPP's own data objects (data-as-code region at the segment start, func_8014D7F8) */
extern unsigned char dung[20][20];         /* @0x8014D874 */
extern unsigned char hallok[20];           /* @0x8014DA04 */
extern unsigned char L4dungeon[80][80];    /* @0x8014DA18 */

/* DRLG_L4.CPP's own scalar globals */
extern unsigned char *pSetPiece;   /* @0x8011C0DC */
extern unsigned char setloadflag;  /* @0x8011C0F4 */
/* diabquad1-4x-y, SP4x1-y2, l4holdx-y are owned by THIS TU: tentative-defined below
 * (gp-relative in the oracle -- methodology 3.12#6), not extern. */
extern int dminx;   /* @0x8011C0F8 */
extern int dminy;   /* @0x8011C0FC */
extern int dmaxx;   /* @0x8011C100 */
extern int dmaxy;   /* @0x8011C104 */
extern int ViewX;   /* @0x8011C114 */
extern int ViewY;   /* @0x8011C118 */
extern int LvlViewX;   /* @0x8011C12C */
extern int LvlViewY;   /* @0x8011C130 */
