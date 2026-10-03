int AddMissile(int sx, int sy, int v1, int v2, int midir, int mitype, char micaster, int id, int v3, int spllvl);   /* @0x80142A04 MISSILES.CPP:3451 */
int AddLight(int x, int y, int r);   /* @0x8004D2E8 LIGHTING.CPP:1184 */
void AddUnLight(int i);   /* @0x8004D340 LIGHTING.CPP:1207 */
void NetSendCmd(unsigned char bHiPri, unsigned char bCmd);   /* @0x8004F6D0 MSG.CPP:870 */
void SetMissDir(int mi, int dir);   /* @0x8013D424 MISSILES.CPP:1402 */
void AddWarpMissile(int i, int x, int y);   /* @0x80080EF8 PORTAL.CPP:151 */
void SyncPortals(void);   /* @0x80080FE8 PORTAL.CPP:189 */
void ActivatePortal(int i, int x, int y, int lvl, int lvltype, unsigned char sp);   /* @0x8008113C PORTAL.CPP:236 */
void DeactivatePortal(int i);   /* @0x800811C8 PORTAL.CPP:253 */
unsigned char PortalOnLevel(int i);   /* @0x800811E8 PORTAL.CPP:262 */
void RemovePortalMissile(int id);   /* @0x80081280 PORTAL.CPP:285 */
void SetCurrentPortal(int p);   /* @0x800813E4 PORTAL.CPP:306 */
void GetPortalLevel(void);   /* @0x800813F0 PORTAL.CPP:312 */
void GetPortalLvlPos(void);   /* @0x80081554 PORTAL.CPP:346 */
