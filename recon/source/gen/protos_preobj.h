int AddLight(int x, int y, int r);   /* @0x8004D2E8 LIGHTING.CPP:1184 */
void AddObject(int ot, int ox, int oy);   /* @0x80053AF8 OBJECTS.CPP:588 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);   /* @0x80074E9C TOWN.CPP:568 */
short GetDPiece(int x, int y);   /* @0x80082A44 DPIECE.CPP:151 */
long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP:102 */
BOOL GetSOLID(int x, int y);   /* @0x80082CE0 DPIECE.CPP:194 */
BOOL GetTRAP(int x, int y);   /* @0x800830D0 DPIECE.CPP:265 */
unsigned char IsDplayer(int x, int y);   /* @0x8005FD10 PLAYER.CPP:262 */
void LoadMapObjs(unsigned char *pMap, int startx, int starty);   /* @0x80059C0C OBJECTS.CPP:2451 */
int ObjIndex(int x, int y);   /* @0x801552D8 SETMAPS.CPP:103 */
void ObjSetMicro(int dx, int dy, int pn);   /* @0x80055754 OBJECTS.CPP:1280 */
void PlacePlayer(int pnum, int x, int y, unsigned char do_current);   /* @0x800A4080 PADFUNCS.CPP:1492 */
int PreSpawnSkeleton(void);   /* @0x80161D5C PREMON.CPP:1328 */
unsigned char QuestStatus(int i);   /* @0x80067B70 QUESTS.CPP:305 */
void SetBookMsg(int i, int msg);   /* @0x80053AD0 OBJECTS.CPP:562 */
void SetObjMapRange(int i, int x1, int y1, int x2, int y2, int v);   /* @0x80053A70 OBJECTS.CPP:549 */
void SetRndSeed(long s);   /* @0x8003DACC ENGINE.CPP:94 */
unsigned char SkipThemeRoom(int x, int y);   /* @0x8015BAFC GENDUNG.CPP:687 */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */
