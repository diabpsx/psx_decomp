void AddFenceDoors(void);   /* @0x8014B9CC DRLG_L3.CPP:1459 */
void FenceDoorFix(void);   /* @0x8014BAB0 DRLG_L3.CPP:1490 */
int DRLG_L3Anvil(void);   /* @0x8014C478 DRLG_L3.CPP:1703 */
void FixL3Warp(void);   /* @0x8014C6D0 DRLG_L3.CPP:1776 */
void FixL3HallofHeroes(void);   /* @0x8014C7B8 DRLG_L3.CPP:1808 */
void DRLG_L3LockRec(int x, int y);   /* @0x8014C90C DRLG_L3.CPP:1844 */
unsigned char DRLG_L3Lockout(void);   /* @0x8014C9A8 DRLG_L3.CPP:1857 */
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
