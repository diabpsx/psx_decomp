short GetDPiece(int x, int y);   /* @0x80082A44 DPIECE.CPP:151 */
void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */
char * GetStr(int StrId);   /* @0x8007B528 LANG.CPP:171 */
void StartNewLvl(int pnum, int fom, int lvl);   /* @0x80066C04 PLAYER.CPP:4681 */
void PlacePlayer(int pnum, int x, int y, unsigned char do_current);   /* @0x800A4080 PADFUNCS.CPP:1492 */
void ChangeLight(int i, int x, int y, int r);   /* @0x8004D3E0 LIGHTING.CPP:1283 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
void InitDiabloMsg(char e);   /* @0x8003DC44 ERROR.CPP:156 */
void NetSendCmdLoc(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y);   /* @0x8004F744 MSG.CPP:900 */
BOOL PA_SetPauseOk(BOOL NewPause);   /* @0x80088BF4 PAUSE.CPP:573 */
BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag);   /* @0x8009BBA0 GLUE.CPP:392 */
void music_fade(void);   /* @0x80077E90 SOUND.CPP:245 */
void stream_stop(void);   /* @0x8003CF5C EFFECTS.CPP:107 */
BOOL PaletteFadeOut(int fr);   /* @0x8007F2F8 PALETTE.CPP:403 */
BOOL GetFadeState(void);   /* @0x8007EEAC PALETTE.CPP:179 */
void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
BOOL GLUE_SetShowGameScreenFlag(BOOL NewFlag);   /* @0x8009BB84 GLUE.CPP:371 */
BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);   /* @0x8009BBB0 GLUE.CPP:404 */
void BlackPalette(void);   /* @0x8007F064 PALETTE.CPP:287 */
void music_stop(void);   /* @0x80077E50 SOUND.CPP:227 */
unsigned char DropItemBeforeTrig(void);   /* @0x80160C9C INV.CPP:3723 */
unsigned char ForceQuests(void);   /* @0x800679CC QUESTS.CPP:273 */
void ClearPanel(void);   /* @0x80031F20 CONTROL.CPP:1291 */
