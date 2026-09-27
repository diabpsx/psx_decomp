void FreeQuestText(void);   /* @0x8004D95C MINITEXT.CPP:112 */
void InitQuestText(void);   /* @0x8004D964 MINITEXT.CPP:119 */
int KANJI_strlen(char *str);   /* @0x8004E350 MINITEXT.CPP:564 */
void CalcTextSpeed(const char *Name);   /* @0x8004D970 MINITEXT.CPP:133 */
void FadeMusicTSK(TASK *T);   /* @0x8004DB2C MINITEXT.CPP:240 */
void InitQTextMsg(int m);   /* @0x8004DC78 MINITEXT.CPP:296 */
void DrawQTextBack(void);   /* @0x8004DECC MINITEXT.CPP:397 */

/* PSXSRC callees */
enum LANG_TYPE LANG_GetLang(void);   /* @0x8007B348 LANG.CPP:84 */
int BL_FileLength(char *Name, char LumpID);   /* @0x80087C34 BIGLUMP.CPP:475 */
void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */
void stream_stop(void);   /* @0x8003CF5C EFFECTS.CPP:107 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
TASK * TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
BOOL GLUE_SetShowGameScreenFlag(BOOL NewFlag);   /* @0x8009BB84 GLUE.CPP:371 */
BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);   /* @0x8009BBB0 GLUE.CPP:404 */
void GLUE_SuspendGame(void);   /* @0x8009BA24 GLUE.CPP:266 */
void STR_SoundCommand(SFXHDR *sfh, int Command);   /* @0x80099388 STREAM.CPP:876 */
void STR_setvolume(SFXHDR *sfh);   /* @0x80099010 STREAM.CPP:736 */
char * GetStr(int StrId);   /* @0x8007B528 LANG.CPP:171 */
void DrawQTextTSK(TASK *T);   /* @0x8004E068 MINITEXT.CPP:439 */
void DrawQText(void);   /* @0x8004E390 MINITEXT.CPP:587 */
BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag);   /* @0x8009BBA0 GLUE.CPP:392 */
BOOL IsKanjiLoaded(void);   /* @0x800AD718 KANJI.CPP:294 */
CPad * PAD_GetPad(int PadNum, unsigned char both);   /* @0x800897F4 PADS.CPP:251 */
void LANG_ReloadMainTXT(void);   /* @0x8007B5A4 LANG.CPP:204 */
void PostGamePad(int val, int var1, int var2, int var3);   /* @0x8007AD4C GAMEPAD.CPP:1952 */
unsigned long VID_GetTick(void);   /* @0x800840F8 VID.CPP:264 */
BOOL BL_AsyncLoadDone(void);   /* @0x80087E1C BIGLUMP.CPP:614 */

#ifdef __cplusplus
extern "C" {
#endif
void SpuSetKey(long on, unsigned long voice_bit);
#ifdef __cplusplus
}
#endif
