/* STORES.CPP -- externs (functions defined in other TUs). */
unsigned char * GRL_LoadFileInMemSig(const char *Name, unsigned long *Len);   /* @0x80074E9C TOWN.CPP */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP */
unsigned char QuestStatus(int i);   /* @0x80067B70 QUESTS.CPP */
char * GetStr(int StrId);   /* @0x8007B528 LANG.CPP */
void AddSText(int x, int y, unsigned char j, char *str, char clr, unsigned char sel);
void AddSLine(int y);
void StartStore(char s);
void S_StartSmith(void);
void S_StartSBuy(void);
unsigned char S_StartSPBuy(void);
void S_StartSSell(void);
void S_StartSRepair(void);
void S_StartWitch(void);
void S_StartWBuy(void);
void S_StartWSell(void);
void S_StartWRecharge(void);
void S_StartNoMoney(void);
void S_StartNoRoom(void);
void S_StartNoItems(void);
void S_StartConfirm(void);
void S_StartBoy(void);
void S_StartBBoy(void);
void S_StartHealer(void);
void S_StartHBuy(void);
void S_StartStory(void);
void S_StartSIdentify(void);
void S_StartTalk(void);
void S_StartIdShow(void);
void S_StartTavern(void);
void S_StartDrunk(void);
void S_StartBarMaid(void);
void ReleaseStoreBtn(void);
void PlaySFX(int i);
void ClearSText(int s, int e);
long CalculateGold(int pnum);   /* func_80160B64 */
void RemoveSpdBarItem(int pnum, int idx);   /* func_8015D9AC */
void RemoveInvItem(int pnum, int idx);   /* func_8015D6FC */
void SetSpdbarGoldCurs(int pnum, int i);
void SetGoldCurs(int pnum, int i);
void GetGoldSeed(int pnum, ItemStruct *itm);
struct TextDat * GM_UseTexData(int Id);
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, int SpinB, int spinradius, int spinbright, int angle, bool Sparkle, int OtPos, bool cross, bool iso, int SinStep);
int sprintf(char *buf, const char *fmt, ...);
void S_SmithEnter(void);
void S_SSellEnter(void);
void S_WRechargeEnter(void);
void S_SIDEnter(void);
void S_SRepairEnter(void);
void S_WSellEnter(void);
void SetCursor(int i);   /* @0x800377A0 CURSOR.CPP:165 */
int func_80159F24(int pnum, int i, int x, int y, int seed);
int func_8015A24C(int pnum, int i, int x, int y, int seed);
void S_HBuyEnter(void);
void S_WitchEnter(void);
void S_HealerEnter(void);
void S_StoryEnter(void);
void S_TavernEnter(void);
void S_BarmaidEnter(void);
void S_DrunkEnter(void);
unsigned char StoreGoldFit(int idx);
