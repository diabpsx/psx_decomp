short TrimCol(short col);   /* @0x8003017C CONTROL.CPP:542 -- SYM types it unsigned char but oracle sign-extends 16 bits on return (no 0xff mask) */
void SetSpellTrans(char t);   /* @0x80030D38 CONTROL.CPP:742 */
void ClearPanel(void);   /* @0x80031F20 CONTROL.CPP:1291 */
void InitPanelStr(void);   /* @0x80031F50 CONTROL.CPP:1346 */
void DrawCtrlPan(void);   /* @0x8003219C CONTROL.CPP:1589 */
void DoAutoMap(void);   /* @0x800321C8 CONTROL.CPP:1672 */
void FreeControlPan(void);   /* @0x80032948 CONTROL.CPP:1856 */
char * get_pieces_str(int nGold);   /* @0x8003751C CONTROL.CPP:3563 */
int DrawDurIcon4Item(const ItemStruct *pItem, int x, int c);   /* @0x80036074 CONTROL.CPP:3064 */
void DrawLevelUpIcon(int pnum);   /* @0x80035C58 CONTROL.CPP:2993 */
char GetSBookTrans(int ii, unsigned char townok);   /* @0x80036478 CONTROL.CPP:3206 */
void CheckSBook(void);   /* @0x80037280 CONTROL.CPP:3491 */
void RedBack(void);   /* @0x800360F8 CONTROL.CPP:3112 */
char * GetStr(int StrId);   /* @0x8007B528 LANG.CPP:171 */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */
void RemoveTargetCursor(int pnum);   /* @0x800A178C PADFUNCS.CPP:466 */
void TSK_Kill(TASK *T);   /* @0x80020548 TASKER.C:350 */
void PostGamePad(int val, int var1, int var2, int var3);   /* @0x8007AD4C GAMEPAD.CPP:1952 */
BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);   /* @0x8009BBB0 GLUE.CPP:404 */
TASK * TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
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
