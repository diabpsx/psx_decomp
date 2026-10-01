void DRLG_PlaceDoor(int x, int y);   /* @0x8013BCB0 DRLG_L1.CPP:271 */
void DRLG_L1Shadows(void);   /* @0x8013C190 DRLG_L1.CPP:329 */
int DRLG_PlaceMiniSet(const unsigned char *miniset, int tmin, int tmax, int cx, int cy, int setview, int noquad, int ldir);   /* @0x8013C5A0 DRLG_L1.CPP:399 */
void DRLG_SetWalls(void);   /* @0x8013CA08 DRLG_L1.CPP:614 */
void DRLG_L1Floor(void);   /* @0x8013CAC4 DRLG_L1.CPP:649 */
void DRLG_L1Pass3(void);   /* @0x8013CBA8 DRLG_L1.CPP:689 */
void DRLG_LoadL1SP(void);   /* @0x8013CDA0 DRLG_L1.CPP:787 */
void DRLG_FreeL1SP(void);   /* @0x8013CE7C DRLG_L1.CPP:805 */
void DRLG_Init_Globals(void);   /* @0x8013CEAC DRLG_L1.CPP:812 */
void set_restore_lighting(void);   /* @0x8013CECC DRLG_L1.CPP:855 */
void DRLG_InitL1Vals(void);   /* @0x8013CF5C DRLG_L1.CPP:870 */
void LoadL1Dungeon(char *sFileName, int vx, int vy);   /* @0x8013CF64 DRLG_L1.CPP:905 */
void LoadPreL1Dungeon(char *sFileName, int vx, int vy);   /* @0x8013D138 DRLG_L1.CPP:971 */
void InitL5Dungeon(void);   /* @0x8013D2F8 DRLG_L1.CPP:1054 */
void L5ClearFlags(void);   /* @0x8013D37C DRLG_L1.CPP:1081 */
void L5drawRoom(int x, int y, int w, int h);   /* @0x8013D3CC DRLG_L1.CPP:1092 */
unsigned char L5checkRoom(int x, int y, int width, int height);   /* @0x8013D438 DRLG_L1.CPP:1108 */
void L5roomGen(int x, int y, int w, int h, int dir);   /* @0x8013D4CC DRLG_L1.CPP:1124 */
void L5firstRoom(void);   /* @0x8013D7FC DRLG_L1.CPP:1216 */
long L5GetArea(void);   /* @0x8013DB9C DRLG_L1.CPP:1274 */
void L5makeDungeon(void);   /* @0x8013DBFC DRLG_L1.CPP:1290 */
void L5makeDmt(void);   /* @0x8013DC88 DRLG_L1.CPP:1309 */
int L5HWallOk(int i, int j);   /* @0x8013DD70 DRLG_L1.CPP:1337 */
int L5VWallOk(int i, int j);   /* @0x8013DEAC DRLG_L1.CPP:1358 */
void L5HorizWall(int i, int j, char p, int dx);   /* @0x8013DFF4 DRLG_L1.CPP:1379 */
void L5VertWall(int i, int j, char p, int dy);   /* @0x8013E22C DRLG_L1.CPP:1418 */
void L5AddWall(void);   /* @0x8013E458 DRLG_L1.CPP:1458 */
void DRLG_L5GChamber(int sx, int sy, int topflag, int bottomflag, int leftflag, int rightflag);   /* @0x8013E6B4 DRLG_L1.CPP:1497 */
void DRLG_L5GHall(int x1, int y1, int x2, int y2);   /* @0x8013E974 DRLG_L1.CPP:1557 */
void L5tileFix(void);   /* @0x8013EA28 DRLG_L1.CPP:1579 */
void DRLG_L5Subs(void);   /* @0x8013F2EC DRLG_L1.CPP:1648 */
void DRLG_L5SetRoom(int rx1, int ry1);   /* @0x8013F4F8 DRLG_L1.CPP:1688 */
void L5FillChambers(void);   /* @0x8013F5F8 DRLG_L1.CPP:1722 */
void DRLG_L5FTVR(int i, int j, int x, int y, int d);   /* @0x8013FCE4 DRLG_L1.CPP:1807 */
void DRLG_L5FloodTVal(void);   /* @0x8014016C DRLG_L1.CPP:1852 */
void DRLG_L5TransFix(void);   /* @0x80140264 DRLG_L1.CPP:1875 */
void DRLG_L5DirtFix(void);   /* @0x801406A8 DRLG_L1.CPP:1987 */
void DRLG_L5CornerFix(void);   /* @0x80140824 DRLG_L1.CPP:2008 */
void DRLG_L5(int entry);   /* @0x80140930 DRLG_L1.CPP:2029 */
void CreateL5Dungeon(unsigned int rseed, int entry);   /* @0x80140E64 DRLG_L1.CPP:2176 */
