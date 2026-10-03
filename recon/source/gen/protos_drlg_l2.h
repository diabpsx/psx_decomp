void InitDungeon(void);   /* @0x80143E44 DRLG_L2.CPP:1490 */
void L2LockoutFix(void);   /* @0x801470F4 DRLG_L2.CPP:2733 */
void L2DoorFix(void);   /* @0x80147478 DRLG_L2.CPP:2781 */
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
