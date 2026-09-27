/* prototypes of MAIN.CPP callees (tools/symhdr.py proto ...) */
void SYSI_Init(void);   /* @0x800B059C SYSINIT.CPP:97 */
void VER_InitVersion(void);   /* @0x800826A0 VERSION.CPP:230 */
void InitPrinty(void);   /* @0x80089CFC PRINTY.CPP:581 */
void InitDialog(void);   /* @0x8008BB24 DIALOG.CPP:476 */
void LANG_SetLang(enum LANG_TYPE NewLanguageType);   /* @0x8007B5E8 LANG.CPP:222 */
void BL_LoadStreamDir(void);   /* @0x800876F4 BIGLUMP.CPP:286 */
void LoadKanji(enum LANG_DB_NO NewLangDbNo);   /* @0x800AD5D8 KANJI.CPP:245 */
BOOL SetKanjiLoaded(BOOL loaded);   /* @0x800AD708 KANJI.CPP:286 */
void Init_GamePad(void);   /* @0x8007AE50 GAMEPAD.CPP:2014 */
void OVR_LoadFrontend(void);   /* @0x8009544C OVERLAY.CPP:137 */
void UPDATEPROGRESS(int inc);   /* @0x800A457C LOADING.CPP:162 */
void PAD_Handler(void);   /* @0x800895F8 PADS.CPP:176 */
void VID_AfterDisplay(void);   /* @0x80084030 VID.CPP:149 */
void DEC_DoDecompRequests(void);   /* @0x800A4458 DECOMP.CPP:102 */
void SCR_Handler(void);   /* @0x8009B0AC SCRATCH.CPP:402 */
void MSG_ClearOutCompMap(void);   /* @0x800528FC MSG.CPP:2821 */
void InitAllItemsUseable(void);   /* @0x8003E214 ITEMDAT.CPP:969 */
void alloc_plr(void);   /* @0x80039EB8 DIABLO.CPP:3448 */
void ATT_DoAttract(void);   /* @0x8008D274 ATTRACT.CPP:71 */
void set_pad_record_play(int level);   /* @0x8009B930 TONY.CPP:308 */
void GLUE_PreTown(void);   /* @0x8009BACC GLUE.CPP:296 */
unsigned char StartGame(unsigned char bNewGame, unsigned char bSinglePlayer);   /* @0x8003820C DIABLO.CPP:433 */
void GLUE_SetFinished(BOOL NewFinished);   /* @0x8009BB10 GLUE.CPP:342 */
void DoEnding(int p);   /* @0x8014EB1C MONSTER.CPP:2016 */

/* TASKER.C/TICK.C/GAL.C -- plain-C library callees, own local prototypes */
TASK *TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
void TSK_RepointProc(TASK *T, void (*Func)());   /* @0x8002066C TASKER.C:430 */
void TSK_DoTasks(void);   /* @0x800201F8 TASKER.C:218 */
void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
void TICK_Update(void);   /* @0x80020C2C TICK.C:58 */
void GAL_SetTimeStamp(int Time);   /* @0x800227A0 GAL.C:1731 */
