void SetObjMapRange(int i, int x1, int y1, int x2, int y2, int v);   /* @0x80053A70 OBJECTS.CPP:549 */
void LoadPreL1Dungeon(char *sFileName, int vx, int vy);   /* @0x8013D138 DRLG_L1.CPP:971 */
void LoadL1Dungeon(char *sFileName, int vx, int vy);   /* @0x8013CF64 DRLG_L1.CPP:905 */
void LoadPreL2Dungeon(char *sFileName, int vx, int vy);   /* @0x80148358 DRLG_L2.CPP:3189 */
void LoadL2Dungeon(char *sFileName, int vx, int vy);   /* @0x8014813C DRLG_L2.CPP:3098 */
void LoadPreL3Dungeon(char *sFileName, int vx, int vy);   /* @0x8014D64C DRLG_L3.CPP:2286 */
void LoadL3Dungeon(char *sFileName, int vx, int vy);   /* @0x8014D4C8 DRLG_L3.CPP:2218 */
void LoadPalette(char *pszFileName);   /* @0x8007EE64 PALETTE.CPP:78 */
void DRLG_ListTrans(int num, unsigned char *List);   /* @0x8015A1A0 GENDUNG.CPP:270 */
void DRLG_AreaTrans(int num, unsigned char *List);   /* @0x8015A214 GENDUNG.CPP:287 */
void AddL1Objs(int x1, int y1, int x2, int y2);   /* @0x801583A0 PREOBJ.CPP:1188 */
void AddL2Objs(int x1, int y1, int x2, int y2);   /* @0x801584AC PREOBJ.CPP:1207 */
void InitSKingTriggers(void);   /* @0x80162BF8 PRETRIGS.CPP:316 */
void InitSChambTriggers(void);   /* @0x80162C44 PRETRIGS.CPP:328 */
void InitPWaterTriggers(void);   /* @0x80162C90 PRETRIGS.CPP:340 */
void InitNoTriggers(void);   /* @0x801621AC PRETRIGS.CPP:86 */
extern "C" void app_fatal(char *pszFile, ...);   /* @0x80039F08 DIABLO.CPP:3593 */
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);   /* @0x80074E9C TOWN.CPP:568 */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */
