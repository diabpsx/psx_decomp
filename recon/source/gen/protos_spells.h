int GetManaAmount(int id, int sn);   /* @0x80077054 SPELLS.CPP:54 */
void UseMana(int id, int sn);   /* @0x80077308 SPELLS.CPP:110 */
unsigned char CheckSpell(int id, int sn, char st, unsigned char manaonly);   /* @0x80077498 SPELLS.CPP:170 */
void CastSpell(int id, int spl, int sx, int sy, int dx, int dy, int caster, int spllvl);   /* @0x80077538 SPELLS.CPP:203 */
void DoResurrect(int pnum, int rid);   /* @0x80077850 SPELLS.CPP:250 */
void DoHealOther(int pnum, int rid);   /* @0x80077AB8 SPELLS.CPP:320 */
void RemoveScroll(int pnum);   /* @0x8015FDFC INV.CPP:3380 */
void UseStaffCharge(PlayerStruct *ptrplr);   /* @0x80160248 INV.CPP:3438 */
int GetSpellLevel(int id, int sn);   /* @0x8013A43C MISSILES.CPP:498 */
int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
void ChangeLightColour(int i, int c);   /* @0x8004D40C LIGHTING.CPP:1299 */
void NetSendCmdLocParam1(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1);   /* @0x8004F774 MSG.CPP:916 */
int AddMissile(int sx, int sy, int v1, int v2, int midir, int mitype, char micaster, int id, int v3, int spllvl);   /* @0x80142A04 MISSILES.CPP:3451 */
void gamemenu_off(void);   /* @0x800827D0 GAMEMENU.CPP:64 */
void ClrPlrPath(int pnum);   /* @0x80067254 PLAYER.CPP:4704 */
void PostGamePad(int val, int var1, int var2, int var3);   /* @0x8007AD4C GAMEPAD.CPP:1952 */
void SetPlayerHitPoints(int pnum, int val);   /* @0x80066CF0 PLAYER.CPP:4684 */
void CalcPlrInv(int p, unsigned char Loadgfx);   /* @0x8003FB18 ITEMS.CPP:1114 */
void StartStand(int pnum, int dir);   /* @0x80066CA4 PLAYER.CPP:4683 */
void PlacePlayer(int pnum, int x, int y, unsigned char do_current);   /* @0x800A4080 PADFUNCS.CPP:1492 */
int AddLight(int x, int y, int r);   /* @0x8004D2E8 LIGHTING.CPP:1184 */
void ChangeLightXY(int i, int x, int y);   /* @0x8004D384 LIGHTING.CPP:1234 */
int AddVision(int x, int y, int r, unsigned char mine);   /* @0x8004D5A8 LIGHTING.CPP:1436 */
void ChangeVisionXY(int id, int x, int y);   /* @0x8004D6D0 LIGHTING.CPP:1493 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
void NewCursor(int i);   /* @0x80037804 CURSOR.CPP:179 */
