BOOL GLUE_Finished(void);   /* @0x8009BB04 GLUE.CPP:331 */
BOOL IsGameLoading(void);   /* @0x800A4648 LOADING.CPP:212 */
void DrawSText(void);   /* @0x8006FD64 STORES.CPP:2121 */
void DrawInv(void);   /* @0x801590B4 INV.CPP:1041 */
void DrawLevelUpIcon(int pnum);   /* @0x80035C58 CONTROL.CPP:2993 */
void DrawDiabloMsg(void);   /* @0x8003DD04 ERROR.CPP:185 */
void SetDPiece(int x, int y, short v);   /* @0x80082ACC DPIECE.CPP:158 */
void LoadMegaTiles(const char *LoadFile);   /* @0x800389E8 DIABLO.CPP:2452 */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
FileIO * SYSI_GetFs(void);   /* @0x80084474 SYSINIT.CPP:182 */
void * Tmalloc(int MemSize);   /* @0x800882A8 TMALLOC.CPP:78 */
void UPDATEPROGRESS(int inc);   /* @0x800A457C LOADING.CPP:162 */
void T_DrawView(int StartX, int StartY);   /* @0x80074478 TOWN.CPP:129 */
void T_FillSector(unsigned char *P3Tiles, unsigned char *pSector, int xi, int yi, int w, int h, BOOL AddSec);   /* @0x80074628 TOWN.CPP:216 */
void T_FillTile(unsigned char *P3Tiles, int xx, int yy, int t);   /* @0x8007486C TOWN.CPP:282 */
void TownFixupBodges(void);   /* @0x8007497C TOWN.CPP:343 */
void T_Pass3(void);   /* @0x800749BC TOWN.CPP:351 */
void CreateTown(int entry);   /* @0x80074D48 TOWN.CPP:453 */
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);   /* @0x80074E9C TOWN.CPP:568 */
void GRL_StripDir(char *Dest, const char *Src);   /* @0x80074F80 TOWN.CPP:612 */
