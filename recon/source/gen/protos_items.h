long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP:102 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
BOOL GetSOLID(int x, int y);   /* @0x80082CE0 DPIECE.CPP:194 */
void NewCursor(int i);   /* @0x80037804 CURSOR.CPP:179 */
void PlaySfxLoc(int psfx, int x, int y);   /* @0x8003D784 EFFECTS.CPP:535 */
void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */
void SetRndSeed(long s);   /* @0x8003DACC ENGINE.CPP:94 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
void NetSendCmdDItem(unsigned char a, int ii);
void DeltaAddItem(int ii);

void AddInitItems(void);   /* @0x8003E2F0 ITEMS.CPP:588 */
void BubbleSwapItem(ItemStruct *a, ItemStruct *b);   /* @0x800499B0 ITEMS.CPP:5590 */
void CalcItemValue(int i);   /* @0x80040AC4 ITEMS.CPP:1499 */
void CalcPlrBookVals(int p);   /* @0x8003F834 ITEMS.CPP:1086 */
void CalcPlrInv(int p, unsigned char Loadgfx);   /* @0x8003FB18 ITEMS.CPP:1114 */
void CalcPlrItemMin(int pnum);   /* @0x8003F754 ITEMS.CPP:1065 */
void CalcPlrItemVals(int p, unsigned char Loadgfx);   /* @0x8003E6B0 ITEMS.CPP:684 */
void CalcPlrScrolls(int p);   /* @0x8003F130 ITEMS.CPP:945 */
void CalcPlrStaff(PlayerStruct *ptrplr);   /* @0x8003F4B0 ITEMS.CPP:984 */
void CalcSelfItems(int pnum);   /* @0x8003F57C ITEMS.CPP:1004 */
void CastScroll(int pnum, int Spell);   /* @0x80047464 ITEMS.CPP:4234 */
void CheckIdentify(int pnum, int cii);   /* @0x80045D20 ITEMS.CPP:3310 */
int CheckUnique(int i, int lvl, int uper, unsigned char recreate);   /* @0x80043DB0 ITEMS.CPP:2498 */
void CreateItem(int uid, int x, int y);   /* @0x80044A20 ITEMS.CPP:2808 */
void CreateMagicArmor(int x, int y, int imisc, int icurs, unsigned char sendmsg, unsigned char delta);   /* @0x80048D30 ITEMS.CPP:4862 */
void CreateMagicWeapon(int x, int y, int imisc, int icurs, unsigned char sendmsg, unsigned char delta);   /* @0x80048EAC ITEMS.CPP:4891 */
void CreatePlrItems(int p);   /* @0x8003FEAC ITEMS.CPP:1225 */
void CreateRndItem(int x, int y, unsigned char onlygood, unsigned char sendmsg, unsigned char delta);   /* @0x80044BD8 ITEMS.CPP:2862 */
void CreateRndUseful(int pnum, int x, int y, unsigned char sendmsg);   /* @0x80044E04 ITEMS.CPP:2915 */
void CreateSpellBook(int x, int y, int ispell, unsigned char sendmsg, unsigned char delta);   /* @0x80048BA0 ITEMS.CPP:4832 */
void CreateTypeItem(int x, int y, unsigned char onlygood, int itype, int imisc, unsigned char sendmsg, unsigned char delta);   /* @0x80044EC4 ITEMS.CPP:2934 */
void DeleteItem(int ii, int i);   /* @0x800457B8 ITEMS.CPP:3127 */
void DoRecharge(int pnum, int cii);   /* @0x80046038 ITEMS.CPP:3391 */
void DoRepair(int pnum, int cii);   /* @0x80045F0C ITEMS.CPP:3356 */
void DrawUniqueInfo(void);   /* @0x80049028 ITEMS.CPP:5051 */
void FreeItemGFX(void);   /* @0x80045B70 ITEMS.CPP:3255 */
void GetBookSpell(int i, int lvl);   /* @0x80040B7C ITEMS.CPP:1512 */
void GetGoldSeed(int pnum, ItemStruct *h);   /* @0x8003FD0C ITEMS.CPP:1178 */
void GetItemAttrs(int i, int idata, int lvl);   /* @0x8004129C ITEMS.CPP:1750 */
void GetItemBonus(int i, int idata, int minlvl, int maxlvl, unsigned char onlygood);   /* @0x80043434 ITEMS.CPP:2274 */
void GetItemPower(int i, int minlvl, int maxlvl, long flgs, unsigned char onlygood);   /* @0x80042FE4 ITEMS.CPP:2165 */
unsigned char GetItemSpace(int x, int y, char inum);   /* @0x8004068C ITEMS.CPP:1397 */
void GetItemStr(int i);   /* @0x80045B78 ITEMS.CPP:3279 */
void GetPlrHandSeed(ItemStruct *h);   /* @0x8003FCE0 ITEMS.CPP:1167 */
void GetStaffPower(int i, int lvl, int bs, unsigned char onlygood);   /* @0x80040DDC ITEMS.CPP:1564 */
void GetStaffSpell(int i, int lvl, unsigned char onlygood);   /* @0x80040FC4 ITEMS.CPP:1634 */
void GetSuperItemLoc(int x, int y, int &xx, int &yy);   /* @0x800409FC ITEMS.CPP:1481 (Ri T2 = reference params; symhdr mis-renders these as pointers) */
void GetSuperItemSpace(int x, int y, char inum);   /* @0x800408A4 ITEMS.CPP:1452 */
void GetUniqueItem(int i, int _uid);   /* @0x80043F54 ITEMS.CPP:2541 */
unsigned char HealerItemOk(int i);   /* @0x80049D64 ITEMS.CPP:5651 */
void InitItemGFX(void);   /* @0x8003E24C ITEMS.CPP:556 */
void InitItems(BOOL re_init);   /* @0x8003E4F8 ITEMS.CPP:641 */
void ItemDoppel(void);   /* @0x8004580C ITEMS.CPP:3141 */
unsigned char ItemMinStats(const PlayerStruct *p, const ItemStruct *x);   /* @0x8003F6DC ITEMS.CPP:1050 */
int ItemNoFlippy(void);   /* @0x80048B3C ITEMS.CPP:4805 */
unsigned char ItemPlace(int xp, int yp);   /* @0x8003E254 ITEMS.CPP:573 */
void ItemRndDur(int ii);   /* @0x800443F4 ITEMS.CPP:2659 */
unsigned char ItemSpaceOk(int i, int j);   /* @0x8004040C ITEMS.CPP:1358 */
char * MakeItemStr(ItemStruct *ItemPtr, unsigned short ItemNo, unsigned short MaxLen);   /* @0x80049198 ITEMS.CPP:5246 */
int PLVal(int pv, int p1, int p2, int minv, int maxv);   /* @0x80041840 ITEMS.CPP:1865 */
unsigned char PremiumItemOk(int i);   /* @0x80047D98 ITEMS.CPP:4545 */
void PrintItemDetails(const ItemStruct *x);   /* @0x80046C7C ITEMS.CPP:4055 */
void PrintItemDur(const ItemStruct *x);   /* @0x800470F8 ITEMS.CPP:4153 */
void PrintItemMisc(const ItemStruct *x);   /* @0x80046A1C ITEMS.CPP:3994 */
void PrintItemOil(char IDidx);   /* @0x8004615C ITEMS.CPP:3516 */
void PrintItemPower(char plidx, const ItemStruct *x);   /* @0x80046258 ITEMS.CPP:3637 */
void ProcessItems(void);   /* @0x800458CC ITEMS.CPP:3173 */
void RecalcStoreStats(void);   /* @0x80048858 ITEMS.CPP:4782 */
void RechargeItem(ItemStruct *i, int r);   /* @0x80045FD0 ITEMS.CPP:3374 */
void RecreateBoyItem(int ii, int idx, int lvl, int iseed);   /* @0x8004A3DC ITEMS.CPP:5848 */
void RecreateEar(int ii, unsigned short ic, int iseed, unsigned char Id, int dur, int mdur, int ch, int mch, int ivalue, int ibuff);   /* @0x80045008 ITEMS.CPP:2962 */
void RecreateHealerItem(int ii, int idx, int lvl, int iseed);   /* @0x8004A308 ITEMS.CPP:5821 */
void RecreateItem(int ii, int idx, unsigned short icreateinfo, int iseed, int ivalue, int PlrCreate);   /* @0x8004BA14 ITEMS.CPP:6127 */
void RecreatePremiumItem(int ii, int idx, int plvl, int iseed);   /* @0x8004A014 ITEMS.CPP:5752 */
void RecreateSmithItem(int ii, int idx, int lvl, int iseed);   /* @0x8004A258 ITEMS.CPP:5801 */
void RecreateTownItem(int ii, int idx, unsigned short icreateinfo, int iseed, int ivalue);   /* @0x8004A4B4 ITEMS.CPP:5867 */
void RecreateWitchItem(int ii, int idx, int lvl, int iseed);   /* @0x8004A0F0 ITEMS.CPP:5770 */
void RepairItem(ItemStruct *i, int lvl);   /* @0x80045E1C ITEMS.CPP:3328 */
void RespawnItem(int i, unsigned char FlipFlag);   /* @0x80045600 ITEMS.CPP:3088 */
int RndAllItems(void);   /* @0x80043ADC ITEMS.CPP:2435 */
int RndBoyItem(int lvl);   /* @0x80049C48 ITEMS.CPP:5621 */
int RndHealerItem(int lvl);   /* @0x80049F18 ITEMS.CPP:5697 */
int RndItem(int m);   /* @0x80043660 ITEMS.CPP:2352 */
int RndPL(int param1, int param2);   /* @0x8004180C ITEMS.CPP:1857 */
int RndPremiumItem(int minlvl, int maxlvl);   /* @0x80047E14 ITEMS.CPP:4575 */
int RndSmithItem(int lvl);   /* @0x8004966C ITEMS.CPP:5461 */
int RndTypeItems(int itype, int imid);   /* @0x80043C40 ITEMS.CPP:2466 */
int RndUItem(int m);   /* @0x80043894 ITEMS.CPP:2396 */
int RndWitchItem(int lvl);   /* @0x80049804 ITEMS.CPP:5513 */
void SaveItemPower(int i, int power, int param1, int param2, int minval, int maxval, int multval);   /* @0x800418B4 ITEMS.CPP:1875 */
void SetItemMinStats(const PlayerStruct *p, ItemStruct *x);   /* @0x8003F728 ITEMS.CPP:1058 */
void SetPlrHandGoldCurs(ItemStruct *h);   /* @0x8003FE7C ITEMS.CPP:1214 */
void SetPlrHandItem(ItemStruct *h, int idata);   /* @0x8003FBC8 ITEMS.CPP:1130 */
void SetPlrHandSeed(ItemStruct *h, int iseed);   /* @0x8003FE74 ITEMS.CPP:1203 */
void SetupAllItems(int ii, int idx, int _iseed, int lvl, int uper, unsigned char onlygood, unsigned char recreate, unsigned char pregen);   /* @0x80044490 ITEMS.CPP:2670 */
void SetupAllUseful(int ii, int iseed, int lvl);   /* @0x80044D20 ITEMS.CPP:2892 */
void SetupItem(int i);   /* @0x80043530 ITEMS.CPP:2314 */
unsigned char SmithItemOk(int i);   /* @0x80049608 ITEMS.CPP:5438 */
void SortHealer(void);   /* @0x8004B884 ITEMS.CPP:6107 */
void SortSmith(void);   /* @0x8004B700 ITEMS.CPP:6085 */
void SortWitch(void);   /* @0x80049AB8 ITEMS.CPP:5600 */
void SpawnBoy(int lvl);   /* @0x8004B3FC ITEMS.CPP:6047 */
void SpawnHealer(int lvl);   /* @0x8004AE5C ITEMS.CPP:5993 */
void SpawnItem(int m, int x, int y, unsigned char sendmsg);   /* @0x800447C8 ITEMS.CPP:2746 */
void SpawnOnePremium(int i, int plvl);   /* @0x80047F18 ITEMS.CPP:4602 */
void SpawnPremium(int lvl);   /* @0x8004820C ITEMS.CPP:4651 */
void SpawnQuestItem(int itemid, int x, int y, int randarea, int selflag);   /* @0x80045208 ITEMS.CPP:3000 */
void SpawnRock(void);   /* @0x80045454 ITEMS.CPP:3055 */
void SpawnSmith(int lvl);   /* @0x8004A540 ITEMS.CPP:5883 */
void SpawnStoreGold(void);   /* @0x80048788 ITEMS.CPP:4729 */
void SpawnUnique(int uid, int x, int y);   /* @0x800442B4 ITEMS.CPP:2628 */
void SpawnWitch(int lvl);   /* @0x8004A86C ITEMS.CPP:5924 */
unsigned char StoreStatOk(ItemStruct *h);   /* @0x80047D04 ITEMS.CPP:4521 */
void UseItem(int p, int Mid, int spl);   /* @0x800476F0 ITEMS.CPP:4313 */
void WitchBookLevel(int ii);   /* @0x800485AC ITEMS.CPP:4683 */
unsigned char WitchItemOk(int i);   /* @0x80049774 ITEMS.CPP:5487 */
unsigned char IsDplayer(int x, int y);   /* @0x8005FD10 PLAYER.CPP:262 */
