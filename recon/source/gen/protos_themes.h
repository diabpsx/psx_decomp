unsigned char TFit_Shrine(int i);   /* @0x8015BC0C THEMES.CPP:106 */
unsigned char TFit_Obj5(int t);   /* @0x8015BEFC THEMES.CPP:157 */
unsigned char TFit_SkelRoom(int t);   /* @0x8015C0C0 THEMES.CPP:199 */
unsigned char TFit_GoatShrine(int t);   /* @0x8015C170 THEMES.CPP:220 */
unsigned char CheckThemeObj3(int xp, int yp, int t, int f);   /* @0x8015C208 THEMES.CPP:238 */
unsigned char TFit_Obj3(int t);   /* @0x8015C354 THEMES.CPP:260 */
unsigned char CheckThemeReqs(int t);   /* @0x8015C414 THEMES.CPP:286 */
unsigned char SpecialThemeFit(int i, int t);   /* @0x8015C4E0 THEMES.CPP:325 */
unsigned char CheckThemeRoom(int tv);   /* @0x8015C6BC THEMES.CPP:387 */
void InitThemes(void);   /* @0x8015C980 THEMES.CPP:433 */
void HoldThemeRooms(void);   /* @0x8015CCCC THEMES.CPP:504 */
void PlaceThemeMonsts(int t, int f);   /* @0x8015CDB0 THEMES.CPP:530 */
void Theme_Barrel(int t);   /* @0x8015CF34 THEMES.CPP:563 */
void Theme_Shrine(int t);   /* @0x8015D090 THEMES.CPP:588 */
void Theme_MonstPit(int t);   /* @0x8015D178 THEMES.CPP:608 */
void Theme_SkelRoom(int t);   /* @0x8015D2BC THEMES.CPP:642 */
void Theme_Treasure(int t);   /* @0x8015D5F8 THEMES.CPP:703 */
void Theme_Library(int t);   /* @0x8015D83C THEMES.CPP:742 */
void Theme_Torture(int t);   /* @0x8015DAC0 THEMES.CPP:789 */
void Theme_BloodFountain(int t);   /* @0x8015DC18 THEMES.CPP:812 */
void Theme_Decap(int t);   /* @0x8015DC8C THEMES.CPP:824 */
void Theme_PurifyingFountain(int t);   /* @0x8015DDE4 THEMES.CPP:847 */
void Theme_ArmorStand(int t);   /* @0x8015DE58 THEMES.CPP:859 */
void Theme_GoatShrine(int t);   /* @0x8015DFD4 THEMES.CPP:889 */
void Theme_Cauldron(int t);   /* @0x8015E108 THEMES.CPP:913 */
void Theme_MurkyFountain(int t);   /* @0x8015E17C THEMES.CPP:925 */
void Theme_TearFountain(int t);   /* @0x8015E1F0 THEMES.CPP:937 */
void Theme_BrnCross(int t);   /* @0x8015E264 THEMES.CPP:949 */
void Theme_WeaponRack(int t);   /* @0x8015E3C0 THEMES.CPP:974 */
void UpdateL4Trans(void);   /* @0x8015E53C THEMES.CPP:1004 */
void CreateThemeRooms(void);   /* @0x8015E598 THEMES.CPP:1019 */
int AddMonster(int x, int y, int dir, int mtype, unsigned char InMap);   /* @0x8007FDD0 COREMON.CPP:513 */
void AddObject(int ot, int ox, int oy);   /* @0x80053AF8 OBJECTS.CPP:588 */
void CreateRndItem(int x, int y, unsigned char onlygood, unsigned char sendmsg, unsigned char delta);   /* @0x80044BD8 ITEMS.CPP:2862 */
void CreateTypeItem(int x, int y, unsigned char onlygood, int itype, int imisc, unsigned char sendmsg, unsigned char delta);   /* @0x80044EC4 ITEMS.CPP:2934 */
void DRLG_HoldThemeRooms(void);   /* @0x8015B958 GENDUNG.CPP:657 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP:102 */
BOOL GetSOLID(int x, int y);   /* @0x80082CE0 DPIECE.CPP:194 */
BOOL GetTRAP(int x, int y);   /* @0x800830D0 DPIECE.CPP:265 */
unsigned char IsGoat(int mt);   /* @0x80161FB0 PREMON.CPP:1375 */
unsigned char IsSkel(int mt);   /* @0x8007F49C COREMON.CPP:168 */
int ItemNoFlippy(void);   /* @0x80048B3C ITEMS.CPP:4805 */
int PreSpawnSkeleton(void);   /* @0x80161D5C PREMON.CPP:1328 */
unsigned char QuestStatus(int i);   /* @0x80067B70 QUESTS.CPP:305 */
unsigned char SpawnSkeleton(int ii, int x, int y);   /* @0x80080184 COREMON.CPP:594 */
