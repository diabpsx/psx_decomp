void SwapMonsterType(int *oldmt);   /* @0x8015F6E8 PREMON.CPP:111 */
unsigned char MonstPlace(int xp, int yp);   /* @0x8015F75C PREMON.CPP:133 */
void InitMonsterGFX(int monst);   /* @0x8015F828 PREMON.CPP:144 */
void PlaceMonster(int i, int mtype, int x, int y);   /* @0x8015F900 PREMON.CPP:276 */
int AddMonsterType(int type, int placeflag);   /* @0x8015F98C PREMON.CPP:286 */
void GetMonsterTypes(unsigned long QuestMask);   /* @0x8015FA88 PREMON.CPP:318 */
void ClrAllMonsters(void);   /* @0x8015FB48 PREMON.CPP:339 */
void InitLevelMonsters(void);   /* @0x8015FC80 PREMON.CPP:380 */
void GetLevelMTypes(void);   /* @0x8015FD04 PREMON.CPP:402 */
void PlaceQuestMonsters(void);   /* @0x801601D8 PREMON.CPP:612 */
void LoadDiabMonsts(void);   /* @0x8016059C PREMON.CPP:698 */
void PlaceGroup(int mtype, int num, unsigned char leaderf, int leader);   /* @0x801606AC PREMON.CPP:732 */
void SetMapMonsters(unsigned char *pMap, int startx, int starty);   /* @0x80160CA0 PREMON.CPP:825 */
void InitMonsters(void);   /* @0x80160ED4 PREMON.CPP:885 */
void PlaceUniqueMonst(int uniqindex, int miniontype, int unpackfilesize);   /* @0x80161288 PREMON.CPP:1005 */
void PlaceUniques(void);   /* @0x80161BCC PREMON.CPP:1279 */
int PreSpawnSkeleton(void);   /* @0x80161D5C PREMON.CPP:1328 */
void decode_enemy(int m, int enemy);   /* @0x80161E94 PREMON.CPP:1359 */
unsigned char IsGoat(int mt);   /* @0x80161FB0 PREMON.CPP:1375 */
