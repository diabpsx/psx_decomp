unsigned long ParseCmd(int pnum, const TCmd *pCmd);   /* @0x80052468 MSG.CPP:2676 */
void SetupLocalPlayer(void);   /* @0x8005FD00 PFILE.CPP:449 */
void game_2_ui_player(const PlayerStruct *p, _uiheroinfo *heroinfo, unsigned char bHasSaveFile);   /* @0x8005FC4C PFILE.CPP:391 */
void SetRndSeed(long s);   /* @0x8003DACC ENGINE.CPP:94 */
long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP:102 */
void delta_init(void);   /* @0x8004EA9C MSG.CPP:266 */
unsigned long VID_GetTick(void);   /* @0x800840F8 VID.CPP:264 */
int veclen2(int ix, int iy);   /* @0x8004BC68 LIGHTING.CPP:328 */
void SetQuest(void);   /* @0x8009B9B4 TONY.CPP:340 */
void NetSendLoPri(const unsigned char *pbMsg, unsigned char bLen);   /* @0x80052BA4 MULTI.CPP:168 */
void InitNewSeed(long newseed);   /* @0x80052D7C MULTI.CPP:687 */
unsigned char NetInit(unsigned char bSinglePlayer, unsigned char *pfExitProgram);   /* @0x80052DF0 MULTI.CPP:708 */
