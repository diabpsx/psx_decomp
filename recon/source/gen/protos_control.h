unsigned char TrimCol(short col);   /* @0x8003017C CONTROL.CPP:542; retail UCHAR result */
void SetSpellTrans(char t);   /* @0x80030D38 CONTROL.CPP:742 */
void ClearPanel(void);   /* @0x80031F20 CONTROL.CPP:1291 */
void InitPanelStr(void);   /* @0x80031F50 CONTROL.CPP:1346 */
void DrawCtrlPan(void);   /* @0x8003219C CONTROL.CPP:1589 */
void DoAutoMap(void);   /* @0x800321C8 CONTROL.CPP:1672 */
void FreeControlPan(void);   /* @0x80032948 CONTROL.CPP:1856 */
char * get_pieces_str(int nGold);   /* @0x8003751C CONTROL.CPP:3563 */
static int DrawDurIcon4Item(const ItemStruct *pItem, int x, int c);   /* @0x80036074 CONTROL.CPP:3064 */
void DrawLevelUpIcon(int pnum);   /* @0x80035C58 CONTROL.CPP:2993 */
char GetSBookTrans(int ii, unsigned char townok);   /* @0x80036478 CONTROL.CPP:3206 */
void CheckSBook(void);   /* @0x80037280 CONTROL.CPP:3491 */
void RedBack(void);   /* @0x800360F8 CONTROL.CPP:3112 */
char * GetStr(int StrId);   /* @0x8007B528 LANG.CPP:171 */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */
void RemoveTargetCursor(int pnum);   /* @0x800A178C PADFUNCS.CPP:466 */
extern "C" void TSK_Kill(TASK *T);   /* @0x80020548 TASKER.C:350 */
void PostGamePad(int val, int var1, int var2, int var3);   /* @0x8007AD4C GAMEPAD.CPP:1952 */
BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);   /* @0x8009BBB0 GLUE.CPP:404 */
extern "C" TASK * TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
TextDat * GM_UseTexData(int Id);   /* @0x80093C10 GMAN.CPP:1312 */
void InitDiabloMsg(char e);   /* @0x8003DC44 ERROR.CPP:156 */
unsigned char CheckSpell(int id, int sn, char st, unsigned char manaonly);   /* @0x80077498 SPELLS.CPP:170 */
void DrawInfoBox(RECT *InfoRect);   /* @0x80032FA4 CONTROL.CPP:2079 */
void DrawLevelUpIcon(int pnum);   /* @0x80035C58 CONTROL.CPP:2993 */
void DrawPlus(int n, int pnum);   /* @0x80033E90 CONTROL.CPP:2444 */
void RedBack(void);   /* @0x800360F8 CONTROL.CPP:3112 */
void ToggleSpell(int pnum);   /* @0x80031004 CONTROL.CPP:837 */
void SetSpell(int pnum);   /* @0x80031D54 CONTROL.CPP:1255 */
void DrawSpeedSpellTSK(TASK *T);   /* @0x80030ED4 CONTROL.CPP:811 */
void AddPanelString(const char *str, int just);   /* @0x80031E60 CONTROL.CPP:1279 */
void DrawArrows(void);   /* @0x80034334 CONTROL.CPP:2564 */
static void ADD_PlrStringXY(const char *pszStr, char col);   /* @0x80033DE8 CONTROL.CPP:2398 */
BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag);   /* @0x8009BBA0 GLUE.CPP:392 */
BOOL GLUE_SetShowGameScreenFlag(BOOL NewFlag);   /* @0x8009BB84 GLUE.CPP:371 */
void GLUE_SuspendGame(void);   /* @0x8009BA24 GLUE.CPP:266 */
void stream_pause(void);   /* @0x8003CFB8 EFFECTS.CPP:127 */
extern "C" void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
void DrawChr(void);   /* @0x80035698 CONTROL.CPP:2808 */
void stream_resume(void);   /* @0x8003D01C EFFECTS.CPP:148 */
void GLUE_ResumeGame(void);   /* @0x8009BA78 GLUE.CPP:281 */
void DrawChrTSK(TASK *T);   /* @0x80035B48 CONTROL.CPP:2959 */
BOOL GLUE_Finished(void);   /* @0x8009BB04 GLUE.CPP:331 */
BOOL SelectorActive(void);   /* @0x800A336C PADFUNCS.CPP:1146 */
void DrawSpellList(void);   /* @0x800310B8 CONTROL.CPP:895 */
void stream_stop(void);   /* @0x8003CF5C EFFECTS.CPP:107 */
static void DrawSpellBook(BOOL DrawBg);   /* @0x800366D8 CONTROL.CPP:3253 */
void ToggleOptions(void);   /* @0x800AA9CC OPTIONS.CPP:3174 */
void DrawSpellBookTSK(TASK *T);   /* @0x80030D44 CONTROL.CPP:754 */
int LANG_GetLang(void);   /* @0x8007B348 LANG.CPP:84 (real return is enum LANG_TYPE; int avoids a forward-decl dependency) */
void PrintSBookStr(int x, int y, int cspel, const char *pszStr, unsigned char bright, unsigned char Staff);   /* @0x800361F0 CONTROL.CPP:3133 */
void ChrCheckValidButton(int move);   /* @0x80034028 CONTROL.CPP:2500 */
void NetSendCmdParam1(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1);   /* @0x8004F834 MSG.CPP:964 */
void BuildChr(void);   /* @0x80034434 CONTROL.CPP:2596 */
void CheckChrBtns(void);   /* @0x80035CEC CONTROL.CPP:3006 */
int CPrintString(int No, char *pszStr, int Just);   /* @0x80032A58 CONTROL.CPP:1894 */
unsigned char *LoadFileInMem(const char *pszName, unsigned long *pdwFileLen);   /* @0x8003DC2C ENGINE.CPP:490 */
void InitControlPan(void);   /* @0x80031F70 CONTROL.CPP:1433 */
char * MakeItemStr(ItemStruct *ItemPtr, unsigned short ItemNo, unsigned short MaxLen);   /* @0x80049198 ITEMS.CPP:5246 */
void GetObjectStr(int i);   /* @0x8005F4C8 OBJECTS.CPP:4324 */
void GetItemStr(int i);   /* @0x80045B78 ITEMS.CPP:3279 */
void PrintMonstHistory(int mt);   /* @0x80155934 MONSTER.CPP:5061 */
void PrintUniqueHistory(void);   /* @0x80155BB8 MONSTER.CPP:5151 */
extern "C" int sprintf(char *buf, const char *fmt, ...);
char CheckInvHLight(void);   /* @0x8015FA64 INV.CPP */
CPad * PAD_GetPad(int PadNum, unsigned char both);   /* @0x800897F4 PADS */
void PrintSelectBack(unsigned short Str);   /* @0x800A68D0 */
int GetManaAmount(int id, int sn);   /* @0x80077054 SPELLS.CPP */
void GetDamageAmt(int i, int *mind, int *maxd);   /* @0x80139C04 (overlay) */
void DrawSpellCel(long xp, long yp, unsigned char Trans, long nCel, unsigned char w, char sel);   /* @0x800301B4 CONTROL.CPP:551 */
POLY_GT4 * PRIM_GetNextPolyGt4(void);   /* @0x80083E54 PRIMPOOL.CPP */
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, bool Sparkle, int Ot, bool cross, bool iso, unsigned char Type);   /* @0x800A6A44 */
#include "glibdev/gdebug.h"
unsigned long VID_GetTick(void);   /* @0x800840F8 VID.CPP:264 */
