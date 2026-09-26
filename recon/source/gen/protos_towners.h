unsigned char * LoadFileInMem(char *pszName, unsigned long *pdwFileLen);   /* @0x8003DC2C ENGINE.CPP:490 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
void PlaySfxLoc(int psfx, int x, int y);   /* @0x8003D784 EFFECTS.CPP:535 */
void InitQTextMsg(int m);   /* @0x8004DC78 MINITEXT.CPP:296 */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */
long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP:102 */
unsigned char IsDplayer(int x, int y);   /* @0x8005FD10 PLAYER.CPP:262 */
void NetSendCmdQuest(unsigned char bHiPri, unsigned char q);   /* @0x8004F8C8 MSG.CPP:998 */
void StartStore(char s);   /* @0x8006F96C STORES.CPP:1988 */
unsigned char effect_is_playing(int nSFX);   /* @0x8003CF34 EFFECTS.CPP:83 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
void SpawnQuestItem(int itemid, int x, int y, int randarea, int selflag);   /* @0x80045208 ITEMS.CPP:3000 */
void CreateItem(int uid, int x, int y);   /* @0x80044A20 ITEMS.CPP:2808 */
void RemoveInvItem(int pnum, int iv);   /* @0x8015D6FC INV.CPP:2399 */
unsigned char DropItemBeforeTrig(void);   /* @0x80160C9C INV.CPP:3723 */
