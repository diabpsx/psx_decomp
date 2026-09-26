void FillSolidBlockTbls(void);   /* @0x80159EDC GENDUNG.CPP:162 */
void SetDungeonMicros(void);   /* @0x8015A068 GENDUNG.CPP:222 */
void DRLG_InitTrans(void);   /* @0x8015A070 GENDUNG.CPP:229 */
void DRLG_RectTrans(int x1, int y1, int x2, int y2);   /* @0x8015A0E4 GENDUNG.CPP:248 */
void DRLG_CopyTrans(int sx, int sy, int dx, int dy);   /* @0x8015A158 GENDUNG.CPP:262 */
void DRLG_ListTrans(int num, unsigned char *List);   /* @0x8015A1A0 GENDUNG.CPP:270 */
void DRLG_AreaTrans(int num, unsigned char *List);   /* @0x8015A214 GENDUNG.CPP:287 */
void DRLG_InitSetPC(void);   /* @0x8015A2A4 GENDUNG.CPP:307 */
void DRLG_SetPC(void);   /* @0x8015A2BC GENDUNG.CPP:319 */
void Make_SetPC(int x, int y, int w, int h);   /* @0x8015A35C GENDUNG.CPP:336 */
unsigned char DRLG_WillThemeRoomFit(int floor, int x, int y, int minSize, int maxSize, int *width, int *height);   /* @0x8015A3EC GENDUNG.CPP:380 */
void DRLG_CreateThemeRoom(int themeIndex);   /* @0x8015A6B4 GENDUNG.CPP:463 */
void DRLG_PlaceThemeRooms(int minSize, int maxSize, int floor, int freq, unsigned char rndSize);   /* @0x8015B6B8 GENDUNG.CPP:590 */
void DRLG_HoldThemeRooms(void);   /* @0x8015B958 GENDUNG.CPP:657 */
unsigned char SkipThemeRoom(int x, int y);   /* @0x8015BAFC GENDUNG.CPP:687 */
void InitLevels(void);   /* @0x8015BBC8 GENDUNG.CPP:704 */
void ConvertdPiece(void);   /* @0x8008287C DPIECE.CPP:113 */
void DRLG_MRectTrans(int x1, int y1, int x2, int y2);   /* @0x800578DC OBJECTS.CPP:1896 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);   /* @0x80074E9C TOWN.CPP:568 */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */
