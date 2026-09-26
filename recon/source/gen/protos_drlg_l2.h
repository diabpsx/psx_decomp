unsigned char DRLG_L2PlaceMiniSet(unsigned char *miniset, int tmin, int tmax, int cx, int cy, int setview, int ldir);   /* @0x80143408 DRLG_L2.CPP:1205 */
void DRLG_L2PlaceRndSet(unsigned char *miniset, int rndper);   /* @0x80143798 DRLG_L2.CPP:1361 */
void DRLG_L2Subs(void);   /* @0x80143A90 DRLG_L2.CPP:1417 */
void DRLG_L2Shadows(void);   /* @0x80143C80 DRLG_L2.CPP:1458 */
void InitDungeon(void);   /* @0x80143E44 DRLG_L2.CPP:1490 */
void DRLG_LoadL2SP(void);   /* @0x80143E8C DRLG_L2.CPP:1509 */
void DRLG_FreeL2SP(void);   /* @0x80143F2C DRLG_L2.CPP:1531 */
void DRLG_L2SetRoom(int rx1, int ry1);   /* @0x80143F5C DRLG_L2.CPP:1540 */
void DefineRoom(int nX1, int nY1, int nX2, int nY2, int ForceHW);   /* @0x8014405C DRLG_L2.CPP:1576 */
void CreateDoorType(int nX, int nY);   /* @0x80144260 DRLG_L2.CPP:1627 */
void PlaceHallExt(int nX, int nY);   /* @0x80144344 DRLG_L2.CPP:1657 */
void AddHall(int nX1, int nY1, int nX2, int nY2, int nHd);   /* @0x8014437C DRLG_L2.CPP:1668 */
void CreateRoom(int nX1, int nY1, int nX2, int nY2, int nRDest, int nHDir, int ForceHW, int nH, int nW);   /* @0x80144454 DRLG_L2.CPP:1702 */
void GetHall(int *nX1, int *nY1, int *nX2, int *nY2, int *nHd);   /* @0x80144AC4 DRLG_L2.CPP:1826 */
void ConnectHall(int nX1, int nY1, int nX2, int nY2, int nHd);   /* @0x80144B5C DRLG_L2.CPP:1844 */
void DoPatternCheck(int i, int j);   /* @0x801451BC DRLG_L2.CPP:1998 */
void L2TileFix(void);   /* @0x80145494 DRLG_L2.CPP:2075 */
unsigned char DL2_Cont(unsigned char x1f, unsigned char y1f, unsigned char x2f, unsigned char y2f);   /* @0x801455B8 DRLG_L2.CPP:2099 */
int DL2_NumNoChar(void);   /* @0x80145638 DRLG_L2.CPP:2111 */
void DL2_DrawRoom(int x1, int y1, int x2, int y2);   /* @0x80145694 DRLG_L2.CPP:2125 */
void DL2_KnockWalls(int x1, int y1, int x2, int y2);   /* @0x80145798 DRLG_L2.CPP:2146 */
unsigned char DL2_FillVoids(void);   /* @0x80145968 DRLG_L2.CPP:2206 */
unsigned char CreateDungeon(void);   /* @0x801462E4 DRLG_L2.CPP:2410 */
void DRLG_L2Pass3(void);   /* @0x801465F0 DRLG_L2.CPP:2495 */
void DRLG_L2FTVR(int i, int j, int x, int y, int d);   /* @0x801467E8 DRLG_L2.CPP:2603 */
void DRLG_L2FloodTVal(void);   /* @0x80146C70 DRLG_L2.CPP:2647 */
void DRLG_L2TransFix(void);   /* @0x80146D68 DRLG_L2.CPP:2670 */
void L2DirtFix(void);   /* @0x80146F94 DRLG_L2.CPP:2710 */
void L2LockoutFix(void);   /* @0x801470F4 DRLG_L2.CPP:2733 */
void L2DoorFix(void);   /* @0x80147478 DRLG_L2.CPP:2781 */
void DRLG_L2SetWalls(void);   /* @0x80147528 DRLG_L2.CPP:2795 */
void DRLG_L2(int entry);   /* @0x801476E0 DRLG_L2.CPP:2834 */
void DRLG_InitL2Vals(void);   /* @0x80148134 DRLG_L2.CPP:3057 */
void LoadL2Dungeon(char *sFileName, int vx, int vy);   /* @0x8014813C DRLG_L2.CPP:3098 */
void LoadPreL2Dungeon(char *sFileName, int vx, int vy);   /* @0x80148358 DRLG_L2.CPP:3189 */
void CreateL2Dungeon(unsigned int rseed, int entry);   /* @0x8014854C DRLG_L2.CPP:3238 */

/* cross-TU (gendung/engine/quests/premon/preobj/loading) -- resolved by mangled name at link time */
void DRLG_InitTrans(void);
void DRLG_SetPC(void);
void DRLG_InitSetPC(void);
unsigned char DRLG_WillThemeRoomFit(int floor, int x, int y, int minSize, int maxSize, int *width, int *height);
void DRLG_PlaceThemeRooms(int minSize, int maxSize, int floor, int freq, unsigned char rndSize);
unsigned char * DiabloAllocPtr(unsigned long dwBytes);
unsigned char QuestStatus(int i);
long ENG_random(long v);
void SetRndSeed(long s);
void DRLG_CheckQuests(int x, int y);
void DRLG_Init_Globals(void);
void SetDPiece(int x, int y, short v);
void SetMapMonsters(unsigned char *pMap, int startx, int starty);
void SetMapObjects(unsigned char *pMap, int startx, int starty);
void mem_free_dbg(void *p);
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);
void UPDATEPROGRESS(int inc);
