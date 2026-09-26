extern char CrawlTable[2749];   /* @0x800D5554 */
extern int FePlayerNo;   /* @0x8011B378 */
/* ManashieldFlag/ManashieldFlag2/MissilePreFlag/nummissiles/fadetob/fadetog/fadetor: owned by
 * MISSILES.CPP (oracle reaches them via %gp_rel) -> tentative-defined in missiles.cpp itself, not
 * extern'd here (see feedback_sym_module_canonical / methodology 3.12#6). */
extern void (*MissPrintRoutines[68])();   /* @0x800D6E50 */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern struct ScrollStruct ScrollInfo;   /* @0x800E7914 */
extern int SetParticle;   /* @0x8011B0E4 */
extern unsigned char StringTable[6][9];   /* @0x80102A28 */
extern unsigned char TransList[256];   /* @0x800E7928 */
extern unsigned char ValueTable[16];   /* @0x80102A18 */
extern int ViewX;   /* @0x8011C114 */
extern int ViewY;   /* @0x8011C118 */
extern int XDirAdd[8];   /* @0x801029D8 */
extern int YDirAdd[8];   /* @0x801029F8 */
extern unsigned char currlevel;   /* @0x8011C10C */
extern char dMissArray[32][4];   /* @0x80105174 */
extern unsigned char drawhpflag;   /* @0x8011B6BE */
extern unsigned char drawmanaflag;   /* @0x8011B6BF */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */
extern struct CPlayer *gplayer;   /* @0x8011B110 */
extern unsigned char invflag;   /* @0x8011C32C */
extern unsigned char leveltype;   /* @0x8011C10D */
extern struct MisFileData misfiledata[47];   /* @0x800D6F60 */
extern struct MissileStruct missile[125];   /* @0x80102C58 */
extern short missileactive[125];   /* @0x80102A60 */
extern short missileavail[125];   /* @0x80102B5C */
extern struct MissileData missiledata[68];   /* @0x800D67F0 */
extern struct MonsterStruct monster[190];   /* @0x80105394 */
extern int myplr;   /* @0x8011BA08 */
extern int numtrigs;   /* @0x8011BB78 */
extern struct ObjectStruct object[127];   /* @0x800D8C4C */
extern int options_pad;   /* @0x8011B250 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern unsigned char qtextflag;   /* @0x8011B960 */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern int restore_b;   /* @0x8011B900 */
extern int restore_g;   /* @0x8011B8FC */
extern int restore_r;   /* @0x8011B8F8 */
extern unsigned char sbookflag;   /* @0x8011B6C6 */
extern unsigned char setlevel;   /* @0x8011C10E */
extern unsigned char setlvlnum;   /* @0x8011C10F */
extern int stonendx;   /* @0x8011B774 */
extern struct TriggerStruct trigs[5];   /* @0x800E33CC */
extern unsigned char vCrawlTable[23][30];   /* @0x800D6014 */
