extern "C" int sprintf(char *buf, const char *fmt, ...);
void CalcPlrScrolls(int p);   /* @0x8003F130 ITEMS.CPP:945 */
void CalcPlrStaff(PlayerStruct *ptrplr);   /* @0x8003F4B0 ITEMS.CPP:984 */
unsigned char TryInvPut(void);   /* @0x8015F020 INV.CPP:2928 */
void NetSendCmdPItem(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y);   /* @0x8004FBD8 MSG.CPP:1138 */
void NewCursor(int i);   /* @0x80037804 CURSOR.CPP:179 */
void CheckInvPaste(int pnum, int mx, int my);   /* @0x8015AE70 INV.CPP:1785 */
void CheckInvCut(int pnum, int mx, int my);   /* @0x8015CBF8 INV.CPP:2258 */
void NetSendCmdParam1(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1);   /* @0x8004F834 MSG.CPP:964 */
void NetSendCmdGItem(unsigned char bHiPri, unsigned char bCmd, unsigned char mast, unsigned char pnum, unsigned char ii);   /* @0x8004F93C MSG.CPP:1011 */
unsigned char M_Talker(int i);   /* @0x8007F550 COREMON.CPP:209 */
unsigned char CanPut(int i, int j);   /* @0x800806C0 COREMON.CPP:699 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
void DeleteItem(int ii, int i);   /* @0x800457B8 ITEMS.CPP:3127 */
void CheckQuestItem(int pnum);   /* @0x8015DCD0 INV.CPP:2496 */
void NetSendCmdChItem(unsigned char bHiPri, unsigned char bLoc);   /* @0x8004FCF4 MSG.CPP:1192 */
long CalculateGold(int pnum);   /* @0x80160B64 INV.CPP:3690 */
void UseItem(int p, int Mid, int spl);   /* @0x800476F0 ITEMS.CPP:4313 */
void NetSendCmdQuest(unsigned char bHiPri, unsigned char q);   /* @0x8004F8C8 MSG.CPP:998 */
void ClearPanel(void);   /* @0x80031F20 CONTROL.CPP:1291 */
char * GetStr(int StrId);   /* @0x8007B528 LANG.CPP:171 */
char * get_pieces_str(int nGold);   /* @0x8003751C CONTROL.CPP:3563 */
char * MakeItemStr(ItemStruct *ItemPtr, unsigned short ItemNo, unsigned short MaxLen);   /* @0x80049198 ITEMS.CPP:5246 */
void PrintItemDetails(const ItemStruct *x);   /* @0x80046C7C ITEMS.CPP:4055 */
void PrintItemDur(const ItemStruct *x);   /* @0x800470F8 ITEMS.CPP:4153 */
void SetICursor(int i);   /* @0x80037744 CURSOR.CPP:148 */
void CalcPlrInv(int p, unsigned char Loadgfx);   /* @0x8003FB18 ITEMS.CPP:1114 */
void RespawnItem(int i, unsigned char FlipFlag);   /* @0x80045600 ITEMS.CPP:3088 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
unsigned char AutoPlace(int pnum, int ii, int sx, int sy, unsigned char saveflag);   /* @0x80159F24 INV.CPP:1518 */
unsigned char WeaponAutoPlace(int pnum);   /* @0x8015AAC8 INV.CPP:1739 */
unsigned char GoldAutoPlace(int pnum);   /* @0x8015A5F0 INV.CPP:1639 */
int FindGetItem(int idx, unsigned short ci, int iseed);   /* @0x8008271C COREINV.CPP:52 */
void SyncGetItem(int x, int y, int idx, unsigned short ci, int iseed);   /* @0x8015EEB8 INV.CPP:2842 */
int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
void RecreateEar(int ii, unsigned short ic, int iseed, unsigned char Id, int dur, int mdur, int ch, int mch, int ivalue, int ibuff);   /* @0x80045008 ITEMS.CPP:2962 */
void RecreateItem(int ii, int idx, unsigned short icreateinfo, int iseed, int ivalue, int PlrCreate);   /* @0x8004BA14 ITEMS.CPP:6127 */
void CheckNewPath(int pnum);   /* @0x8006708C PLAYER.CPP:4698 */
void InvSetItemCurs(void);   /* @0x8016135C INV.CPP:4023 */
void ReadPad(int NoDeb);   /* @0x8008463C DAVEO.CPP:74 */
void ClrCursor(int num);   /* @0x80077F90 GAMEPAD.CPP:113 */
void DrawUniqueInfo(void);   /* @0x80049028 ITEMS.CPP:5051 */
void InvMoveCursLeft(void);   /* @0x801614FC INV.CPP:4052 */
void InvMoveCursRight(void);   /* @0x801616A4 INV.CPP:4153 */
void InvMoveCursUp(void);   /* @0x80161958 INV.CPP:4261 */
void InvMoveCursDown(void);   /* @0x80161B50 INV.CPP:4359 */
unsigned char TryIconCurs(void);   /* @0x80038574 DIABLO.CPP:1087 */
void NetSendCmdDelItem(unsigned char bHiPri, unsigned char bLoc);   /* @0x8004FD98 MSG.CPP:1212 */
CPad *PAD_GetPad(int PadNum, unsigned char both);   /* @0x800897F4 PADS.CPP:251 */
void GLUE_SuspendGame(void);   /* @0x8009BA24 GLUE.CPP:266 */
extern "C" void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);   /* @0x8009BBB0 GLUE.CPP:404 */
void stream_stop(void);   /* @0x8003CF5C EFFECTS.CPP:107 */
BOOL GLUE_SetShowGameScreenFlag(BOOL NewFlag);   /* @0x8009BB84 GLUE.CPP:371 */
void VID_SetDBuffer(BOOL DBuf);   /* @0x80084190 VID.CPP:313 */
extern "C" void TSK_Kill(struct TASK *T);   /* @0x80020548 TASKER.C:350 */
CBlocks *BL_GetCurrentBlocks(void);   /* @0x800919EC BLOCK.CPP:2805 */
struct TextDat *GM_UseTexData(int Id);   /* @0x80093C10 GMAN.CPP:1312 */
void PostGamePad(int val, int var1, int var2, int var3);   /* @0x8007AD4C GAMEPAD.CPP:1952 */
unsigned char StoreAutoPlace(void);   /* @0x8006A408 STORES.CPP:611 */
void GM_FinishedUsing(struct TextDat *Fin);   /* @0x80093D80 GMAN.CPP:1349 */
void GM_ForceTpLoad(int Id);   /* @0x80093D44 GMAN.CPP:1337 */
void GLUE_ResumeGame(void);   /* @0x8009BA78 GLUE.CPP:281 */
BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag);   /* @0x8009BBA0 GLUE.CPP:392 */
void DoThatDrawInv(void);   /* @0x80159714 INV.CPP:1274 */
void InvDrawSlot(int X, int Y, int Frame);   /* @0x8015727C INV.CPP:448 */
void InvDrawSlotBack(int X, int Y, int W, int H, unsigned char Flag);   /* @0x80157300 INV.CPP:462 */
void InvDrawItem(int ItemX, int ItemY, int ItemNo, unsigned char StatFlag, int TransFlag);   /* @0x801575B8 INV.CPP:508 */
void DrawInfoBox(RECT *InfoRect);   /* @0x80032FA4 CONTROL.CPP:2079 */
void PRIM_Clip(RECT *R, int Depth);   /* @0x800839EC PRIMPOOL.CPP:216 */
void PRIM_FullScreen(int Depth);   /* @0x80083B20 PRIMPOOL.CPP:257 */
extern "C" struct TASK *TSK_AddTask(unsigned long Id, void (*Main)(struct TASK *), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
void DrawInvTSK(struct TASK *T);   /* @0x801590FC INV.CPP:1049 */
void SetCursor(int i);   /* @0x800377A0 CURSOR.CPP:165 */
int LANG_GetLang(void);   /* @0x8007B348 LANG.CPP:84 (real return is enum LANG_TYPE; int avoids a forward-decl dependency) */
void DrawInvBack(void);   /* @INV.CPP -- defined later in this TU; prototype avoids an implicit decl (lane fact 60) */
void DrawInvStats(void);
void DrawInvMsg(void);
void DrawInvHelpTxt(void);
void PrintStat(int Y, int Txt0, char *Txt1, unsigned char Col);
void ControlInv(void);
