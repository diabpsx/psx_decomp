extern struct POLY_FT4 *AddrToAvoid;   /* @0x8011AABC */
extern int DexterityTbl[3];   /* @0x800DA414 */
extern long ExpLvlsTbl[51];   /* @0x800DA468 */
extern unsigned char FriendlyMode;   /* @0x8011B7A5 */
extern int MagicTbl[3];   /* @0x800DA408 */
extern unsigned char ManashieldFlag;   /* @0x8011C28D */
extern unsigned char ManashieldFlag2;   /* @0x8011C28E */
extern int MaxStats[3][4];   /* @0x800DA438 */
extern struct TextDat *MissDat;   /* @0x8011BC28 */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern int PlayerDeathCount[2];   /* @0x8011BA10 */
extern int PlayerEar[2];   /* @0x8011BA18 */
extern char PlrGFXAnimLens[3][11];   /* @0x800DA3D8 */
extern struct ScrollStruct ScrollInfo;   /* @0x800E7914 */
extern int StrengthTbl[3];   /* @0x800DA3FC */
extern unsigned long *ThisOt;   /* @0x8011AAB4 */
extern struct POLY_FT4 *ThisPrimAddr;   /* @0x8011AAB8 */
extern int ToBlkTbl[3];   /* @0x800DA42C */
extern unsigned char TransList[256];   /* @0x800E7928 */
extern int ViewX;   /* @0x8011C114 */
extern int ViewY;   /* @0x8011C118 */
extern struct LightListStruct VisionList[32];   /* @0x800D65D0 */
extern int VitalityTbl[3];   /* @0x800DA420 */
extern int _pcurs[2];   /* @0x8011B730 */
extern int _pcursmonst[2];   /* @0x8011B758 */
extern char _pcursplr[2];   /* @0x8011B76C */
extern struct TASK *_spselflag[2];   /* @0x8011B650 */
extern BOOL allspellsflag;   /* @0x8011B244 */
extern unsigned char automapflag;   /* @0x8011C37B */
extern unsigned char currlevel;   /* @0x8011C10C */
extern int cursmx;   /* @0x8011B750 */
extern int cursmy;   /* @0x8011B754 */
unsigned char deathflag;   /* @0x8011BA0C -- TENTATIVE DEF: only player oracles reach it gp-relative */
extern unsigned char dovision;   /* @0x8011B920 */
extern unsigned char drawhpflag;   /* @0x8011B6BE */
extern unsigned char drawmanaflag;   /* @0x8011B6BF */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern unsigned char gbActivePlayers;   /* @0x8011B9A3 */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */
extern unsigned long ghMainWnd;   /* @0x8011B788 */
extern BOOL goldcheat;   /* @0x8011B224 */
extern unsigned char invflag;   /* @0x8011C32C */
extern struct ItemStruct item[128];   /* @0x800D1D54 */
extern char itemactive[127];   /* @0x800D5354 */
extern char itemavail[127];   /* @0x800D53D4 */
extern unsigned char leveltype;   /* @0x8011C10D */
char light_rad;   /* @0x8011BA0D -- TENTATIVE DEF: only player oracles reach it gp-relative */
extern struct MissileStruct missile[125];   /* @0x80102C58 */
extern short missileactive[125];   /* @0x80102A60 */
extern struct MonsterStruct monster[190];   /* @0x80105394 */
int myplr;   /* @0x8011BA08 -- TENTATIVE DEF: this TU owns it (every %gp_rel(myplr) oracle site is in asm/nonmatchings/player/) */
extern long numitems;   /* @0x8011B888 */
extern int nummissiles;   /* @0x8011C288 */
extern int numvision;   /* @0x8011B91C */
extern struct ObjectStruct object[127];   /* @0x800D8C4C */
extern char offset_x[8];   /* @0x8011C2A8 */
extern char offset_y[8];   /* @0x8011C2B0 */
extern int options_pad;   /* @0x8011B250 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern int plrxoff2[9];   /* @0x800DA390 */
extern int plryoff2[9];   /* @0x800DA3B4 */
extern struct PortalStruct portal[4];   /* @0x800E3BEC */
extern unsigned char qtextflag;   /* @0x8011B960 */
extern int sel_data;   /* @0x8011B72C */
extern unsigned char setlevel;   /* @0x8011C10E */
extern unsigned char setlvlnum;   /* @0x8011C10F */
extern int sfxdelay;   /* @0x8011B850 */
extern int sfxdnum;   /* @0x8011B854 */
extern struct SFXHDR *sghStream;   /* @0x8011B834 */
extern struct SpellData spelldata[37];   /* @0x800DDB80 */
extern char stextflag;   /* @0x8011BAE0 */
extern char visible_level;   /* @0x8011B0A8 */
extern struct CPlayer *_7CPlayer_PActiveArray[2];   /* @0x8011AD50 (class-static, no EXT record; sized from GetPlayer's assert PNum<2) */
extern char D_8011C878[2];   /* per-player post-death countdown timer, no SYM/EXT record; owned by this TU (only player/*.s reaches it) */
