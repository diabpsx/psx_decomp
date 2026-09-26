/* DRLG_L4.CPP -- externs (functions defined in other TUs). */
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);   /* @0x80074E9C TOWN.CPP */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP */
unsigned char QuestStatus(int i);   /* @0x80067B70 QUESTS.CPP */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP */
void DRLG_InitTrans(void);   /* @0x8015A070 GENDUNG.CPP */
void DRLG_InitSetPC(void);   /* @0x8015A2A4 GENDUNG.CPP */
void DRLG_SetPC(void);   /* @0x8015A2BC GENDUNG.CPP */
void Make_SetPC(int x, int y, int w, int h);   /* @0x8015A35C GENDUNG.CPP */
void DRLG_PlaceThemeRooms(int minSize, int maxSize, int floor, int freq, unsigned char rndSize);   /* @0x8015B6B8 GENDUNG.CPP */
void UPDATEPROGRESS(int i);
void DRLG_Init_Globals(void);
void DRLG_CheckQuests(int x, int y);
