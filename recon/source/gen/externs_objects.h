extern struct ObjectStruct object[127];   /* @0x800D8C4C */
extern struct ItemDataStruct AllItemsList[157];   /* @0x801113A4 */
extern struct ObjDataStruct AllObjects[99];   /* @0x800D84B0 */
extern int DebugMonsters[10];   /* @0x800CEC84 */
extern int FePlayerNo;   /* @0x8011B378 */
extern char ObjFileList[40];   /* @0x800DA320 */
extern int ObjTypeConv[113];   /* @0x800D82EC */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern int PosAdj;   /* @0x8011ACAC */
extern int ScrollFlag[2];   /* @0x8011B8B8 */
extern int StorePlrNo;   /* @0x8011BAB4 */
extern unsigned short StoryBookName[9];   /* @0x800D8C38 */
extern char TransVal;   /* @0x8011C148 */
extern struct UniqMonstStruct UniqMonst[96];   /* @0x8010C708 */
extern unsigned char armorFlag;   /* @0x8011C194 */
extern unsigned char automapview[5][40];   /* @0x8010D6E4 */
extern unsigned char currlevel;   /* @0x8011C10C */
extern short *dPiece;   /* @0x8011BE44 */
extern unsigned char deltaload;   /* @0x8011B97D */
extern unsigned char drawhpflag;   /* @0x8011B6BE */
extern unsigned char dropGoldFlag;   /* @0x8011B6B4 */
extern int dropGoldValue;   /* @0x8011B6C8 */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern unsigned short dungeon[48][48];   /* @0x800E40C4 */
extern int force_redraw;   /* @0x8011B790 */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */
extern char level_lamp[5];   /* @0x8011B90C */
extern unsigned char leveltype;   /* @0x8011C10D */
extern short monstactive[190];   /* @0x8010A0C4 */
extern struct MonsterStruct monster[190];   /* @0x80105394 */
extern short monstactive[190];   /* @0x8010A0C4 */
extern int myplr;   /* @0x8011BA08 */
extern unsigned char nBlockTable[2049];   /* @0x800E5904 */
extern unsigned char nMissileTable[2049];   /* @0x800E690C */
extern unsigned char nSolidTable[2049];   /* @0x800E6108 */
extern unsigned char nTrapTable[2049];   /* @0x800E7110 */
extern long numitems;   /* @0x8011B888 */
extern long nummonsters;   /* @0x8011C2CC */
extern int numthemes;   /* @0x8011C18C */
extern char objectactive[127];   /* @0x800DA220 */
extern char objectavail[127];   /* @0x800DA2A0 */
extern unsigned char pdungeon[40][40];   /* @0x800E52C4 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern unsigned char qtextflag;   /* @0x8011B960 */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern int sel_data;   /* @0x8011B72C */
extern unsigned char setlevel;   /* @0x8011C10E */
extern unsigned char setlvlnum;   /* @0x8011C10F */
extern int setpc_w;   /* @0x8011C0EC */
extern int setpc_x;   /* @0x8011C0E4 */
extern int setpc_y;   /* @0x8011C0E8 */
extern char shrineavail[26];   /* @0x800D8C1C */
extern unsigned short shrinestrs[26];   /* @0x800D8BE8 */
extern char tempstr[256];   /* @0x800CEA10 */
extern struct ThemeStruct theme[50];   /* @0x80102848 */
extern unsigned char weaponFlag;   /* @0x8011C196 */
extern struct ItemStruct _golditem[2];   /* @0x800E1CB0 */
extern char _infoclr[2];   /* @0x8011B6BC */
extern char _infostr[2][256];   /* @0x800CE810 */


/* TU-owned (gp-rel in the oracle): numobjects, numobjfiles, InitObjFlag are defined in objects.cpp itself, not extern'd here */
