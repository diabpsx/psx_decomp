void M_CheckEFlag(int i);   /* @0x8007F354 COREMON.CPP:110 */
void M_ClearSquares(int i);   /* @0x8007F35C COREMON.CPP:139 */
unsigned char IsSkel(int mt);   /* @0x8007F49C COREMON.CPP:168 */
void NewMonsterAnim(int i, AnimStruct *anim, int md, int AnimType);   /* @0x8007F4FC COREMON.CPP:178 */
unsigned char M_Talker(int i);   /* @0x8007F550 COREMON.CPP:209 */
void M_Enemy(int i);   /* @0x8007F5B8 COREMON.CPP:225 */
void ClearMVars(int i);   /* @0x8007F7D0 COREMON.CPP:370 */
void InitMonster(int i, int rd, int mtype, int x, int y);   /* @0x8007F84C COREMON.CPP:383 */
int AddMonster(int x, int y, int dir, int mtype, unsigned char InMap);   /* @0x8007FDD0 COREMON.CPP:513 */
void M_StartStand(int i, int md);   /* @0x8007FE70 COREMON.CPP:526 */
void M_UpdateLeader(int i);   /* @0x8007FFD4 COREMON.CPP:559 */
void ActivateSpawn(int i, int x, int y, int dir);   /* @0x800800E4 COREMON.CPP:582 */
unsigned char SpawnSkeleton(int ii, int x, int y);   /* @0x80080184 COREMON.CPP:594 */
void M_StartSpStand(int i, int md);   /* @0x80080374 COREMON.CPP:644 */
unsigned char PosOkMonst(int i, int x, int y);   /* @0x8008045C COREMON.CPP:665 */
unsigned char CanPut(int i, int j);   /* @0x800806C0 COREMON.CPP:699 */
int encode_enemy(int m);   /* @0x80080974 COREMON.CPP:739 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
BOOL GetSOLID(int x, int y);   /* @0x80082CE0 DPIECE.CPP:194 */
unsigned char IsDplayer(int x, int y);   /* @0x8005FD10 PLAYER.CPP:262 */
unsigned char SolidLoc(int x, int y);   /* @0x80060C4C PLAYER.CPP:1339 */
