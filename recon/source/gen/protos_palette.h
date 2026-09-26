void SetFadeLevel(int fadeval);   /* @0x8007EE7C PALETTE.CPP:137 */
BOOL GetFadeState(void);   /* @0x8007EEAC PALETTE.CPP:179 */
void SetPolyXY(POLY_GT4 *gt4, unsigned char *coords);   /* @0x8007EEB8 PALETTE.CPP:200 */
void SmearScreen(void);   /* @0x8007EFD4 PALETTE.CPP:232 */
void DrawFadedScreen(void);   /* @0x8007EFDC PALETTE.CPP:258 */
void BlackPalette(void);   /* @0x8007F064 PALETTE.CPP:287 */
void PaletteFadeInTask(TASK *T);   /* @0x8007F160 PALETTE.CPP:311 */
BOOL PaletteFadeIn(int fr);   /* @0x8007F1F0 PALETTE.CPP:346 */
void PaletteFadeOutTask(TASK *T);   /* @0x8007F248 PALETTE.CPP:361 */
BOOL PaletteFadeOut(int fr);   /* @0x8007F2F8 PALETTE.CPP:403 */
void LoadPalette(const char *pszFileName);   /* @0x8007EE64 PALETTE.CPP:78 */
void LoadRndLvlPal(int l);   /* @0x8007EE6C PALETTE.CPP:105 */
void ResetPal(void);   /* @0x8007EE74 PALETTE.CPP:123 */

/* PSXSRC callees (GMAN.CPP / TASKER.C / VID.CPP / BLOCK.H) */
TextDat * GM_UseTexData(int Id);   /* @0x80093C10 GMAN.CPP:1312 */
TASK * TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
unsigned long VID_GetTick(void);   /* @0x800840F8 VID.CPP:264 */
