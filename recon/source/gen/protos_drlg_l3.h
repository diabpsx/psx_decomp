void InitL3Dungeon(void);   /* @0x80148F98 DRLG_L3.CPP:399 */
void SetBlankL3Dungeon(void);   /* @0x8014901C DRLG_L3.CPP:421 */
void FixL3Dungeon(void);   /* @0x80149078 DRLG_L3.CPP:431 */
int DRLG_L3FillRoom(int x1, int y1, int x2, int y2);   /* @0x801490EC DRLG_L3.CPP:444 */
void DRLG_L3CreateBlock(int x, int y, int obs, int dir);   /* @0x8014933C DRLG_L3.CPP:483 */
void DRLG_L3FloorArea(int x1, int y1, int x2, int y2);   /* @0x801495BC DRLG_L3.CPP:541 */
void DRLG_L3FillDiags(void);   /* @0x80149624 DRLG_L3.CPP:553 */
void DRLG_L3FillSingles(void);   /* @0x80149750 DRLG_L3.CPP:583 */
void DRLG_L3FillStraights(void);   /* @0x8014981C DRLG_L3.CPP:610 */
void DRLG_L3Edges(void);   /* @0x80149BC8 DRLG_L3.CPP:717 */
int DRLG_L3GetFloorArea(void);   /* @0x80149C08 DRLG_L3.CPP:727 */
void DRLG_L3MakeMegas(void);   /* @0x80149C58 DRLG_L3.CPP:741 */
void DRLG_L3River(void);   /* @0x80149D94 DRLG_L3.CPP:774 */
int DRLG_L3SpawnEdge(int x, int y, int *totarea);   /* @0x8014A7BC DRLG_L3.CPP:987 */
int DRLG_L3Spawn(int x, int y, int *totarea);   /* @0x8014AA48 DRLG_L3.CPP:1017 */
void DRLG_L3Pool(void);   /* @0x8014AC54 DRLG_L3.CPP:1052 */
void DRLG_L3PoolFix(void);   /* @0x8014AEA4 DRLG_L3.CPP:1105 */
int DRLG_L3PlaceMiniSet(const unsigned char *miniset, int tmin, int tmax, int cx, int cy, int setview, int ldir);   /* @0x8014B0C4 DRLG_L3.CPP:1145 */
void DRLG_L3PlaceRndSet(const unsigned char *miniset, int rndper);   /* @0x8014B430 DRLG_L3.CPP:1289 */
unsigned char WoodVertU(int i, int y);   /* @0x8014B76C DRLG_L3.CPP:1389 */
unsigned char WoodVertD(int i, int y);   /* @0x8014B818 DRLG_L3.CPP:1406 */
unsigned char WoodHorizL(int x, int j);   /* @0x8014B8B4 DRLG_L3.CPP:1421 */
unsigned char WoodHorizR(int x, int j);   /* @0x8014B948 DRLG_L3.CPP:1438 */
void AddFenceDoors(void);   /* @0x8014B9CC DRLG_L3.CPP:1459 */
void FenceDoorFix(void);   /* @0x8014BAB0 DRLG_L3.CPP:1490 */
void DRLG_L3Wood(void);   /* @0x8014BCA4 DRLG_L3.CPP:1530 */
int DRLG_L3Anvil(void);   /* @0x8014C478 DRLG_L3.CPP:1703 */
void FixL3Warp(void);   /* @0x8014C6D0 DRLG_L3.CPP:1776 */
void FixL3HallofHeroes(void);   /* @0x8014C7B8 DRLG_L3.CPP:1808 */
void DRLG_L3LockRec(int x, int y);   /* @0x8014C90C DRLG_L3.CPP:1844 */
unsigned char DRLG_L3Lockout(void);   /* @0x8014C9A8 DRLG_L3.CPP:1857 */
void DRLG_L3SetWalls(void);   /* @0x8014CA68 DRLG_L3.CPP:1884 */
void DRLG_L3(int entry);   /* @0x8014CB1C DRLG_L3.CPP:1919 */
void DRLG_L3Pass3(void);   /* @0x8014D238 DRLG_L3.CPP:2081 */
void CreateL3Dungeon(unsigned int rseed, int entry);   /* @0x8014D450 DRLG_L3.CPP:2153 */
void LoadL3Dungeon(char *sFileName, int vx, int vy);   /* @0x8014D4C8 DRLG_L3.CPP:2218 */
void LoadPreL3Dungeon(char *sFileName, int vx, int vy);   /* @0x8014D64C DRLG_L3.CPP:2286 */

/* cross-TU (gendung/engine/quests) -- resolved by mangled name at link time */
void DRLG_InitTrans(void);
void DRLG_InitSetPC(void);
void DRLG_SetPC(void);
void DRLG_PlaceThemeRooms(int minSize, int maxSize, int floor, int freq, unsigned char rndSize);
unsigned char SkipThemeRoom(int x, int y);
unsigned char QuestStatus(int i);
long ENG_random(long v);
void SetRndSeed(long s);
void DRLG_Init_Globals(void);
void SetDPiece(int x, int y, short v);
void SetMapMonsters(unsigned char *pMap, int startx, int starty);
void SetMapObjects(unsigned char *pMap, int startx, int starty);
void mem_free_dbg(void *p);
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);
void UPDATEPROGRESS(int inc);
