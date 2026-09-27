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
int StoreAutoPlace(void);
int CalcPlrInv(int pnum, unsigned char loadgfx);
void SmithBuyItem(void);
void WitchRechargeItem(void);
void StoryIdItem(void);
void BoyBuyItem(void);
void HealerBuyItem(void);
void SmithRepairItem(void);
void SpawnPremium(int lvl);
void SmithBuyPItem(void);
void StoreSellItem(void);
void WitchBuyItem(void);
void S_ConfirmEnter(void);
void S_SBuyEnter(void);
void S_WBuyEnter(void);
void S_BBuyEnter(void);
void S_BoyEnter(void);
void STextUp(void);
void STextDown(void);
void stream_stop(void);   /* @0x8003CF5C EFFECTS.CPP:107 */
void STextESC(void);
void S_TalkEnter(void);
void S_SPBuyEnter(void);
void STextEnter(void);
struct CPad *PAD_GetPad(int PadNum, unsigned char both);
void CheckStoreBtn(void);
void InitQTextMsg(int m);   /* @0x8004DC78 MINITEXT.CPP:296 */
void S_WitchEnter(void);
void S_HealerEnter(void);
void S_StoryEnter(void);
void S_TavernEnter(void);
void S_BarmaidEnter(void);
void S_DrunkEnter(void);
unsigned char StoreGoldFit(int idx);
void DrawStoreHelpText(void);
struct TASK *TSK_AddTask(unsigned long Id, void (*Main)(struct TASK *), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
void DrawSTextTSK(struct TASK *T);
void DrawSText(void);
BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag);   /* @0x8009BBA0 GLUE.CPP:392 */
BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);   /* @0x8009BBB0 GLUE.CPP:404 */
void GLUE_SuspendGame(void);   /* @0x8009BA24 GLUE.CPP:266 */
void GLUE_ResumeGame(void);   /* @0x8009BA78 GLUE.CPP:281 */
BOOL GLUE_Finished(void);   /* @0x8009BB04 GLUE.CPP:331 */
void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
void DoThatDrawSText(void);
void DrawSLine(int y);
void DrawStoreArrows(void);
