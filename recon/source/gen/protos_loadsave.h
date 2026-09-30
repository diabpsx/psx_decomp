void PostGamePad(int val, int var1, int var2, int var3);   /* @0x8007AD4C GAMEPAD.CPP:1952 */
struct FileIO * SYSI_GetFs(void);   /* @0x80084474 SYSINIT.CPP:182 */
void VID_SetXYOff(int x, int y);   /* @0x8008415C VID.CPP:287 */
void SetSpeed(enum GM_SPEEDS Speed);   /* @0x80039BA8 DIABLO.CPP:3163 */
enum GM_SPEEDS GetSpeed(void);   /* @0x80039BBC DIABLO.CPP:3169 */
int VID_GetXOff(void);   /* @0x8008416C VID.CPP:293 */
int VID_GetYOff(void);   /* @0x80084178 VID.CPP:298 */
int GetFileNumber(int side, char *file_name);   /* @0x80159590 DLG.CPP:188 */
int delete_card_file(int card_number, int file);   /* @0x80142D20 MEMCARD.CPP:520 */
int write_card_file(int card_number, int id, char *name, char *title, unsigned char *icon, unsigned short *clut, int size, unsigned char *buf);   /* @0x801430B8 MEMCARD.CPP:757 */
int read_card_file(int card_number, int file, int id, char *buf);   /* @0x80142E18 MEMCARD.CPP:572 */
enum LANG_TYPE LANG_GetLang(void);   /* @0x8007B348 LANG.CPP:84 */
void SetLoadedLang(enum LANG_TYPE LoadLang);   /* @0x800A70C0 OPTIONS.CPP:1059 */
void UnPackPlayer(const struct PkPlayerStruct *pPack, int pnum, unsigned char killok);   /* @0x8015AFB8 DLG.CPP:1057 */
void PackPlayer(struct PkPlayerStruct *pPack, int pnum);   /* @0x8015AB98 DLG.CPP:929 */
int DeltaImportData(char *Src);   /* @0x8004F58C MSG.CPP:754 */
void FreeGameMem(void);   /* @0x80037FAC */
void delta_init(void);   /* @0x8004EA9C */
void SetReturnLvlPos(void);   /* @0x800681CC */
void ResyncQuests(void);   /* @0x80068330 */
void SetLoadedVolumes(void);   /* @0x800AA008 */
void CalcVolumes(void);   /* @0x800A9EAC */
void ClearQuestFlags(void);   /* @0x800857F8 */
int RestoreLoadedData(BOOL firstflag);   /* @0x8015C9CC LOADSAVE.CPP:1358 */
void DeltaSaveLevel(void);   /* @0x8004F5D4 MSG.CPP:780 */
int DeltaExportData(char *Dst);   /* @0x8004F560 MSG.CPP:731 */
void GLUE_SetShowGameScreenFlag(BOOL NewFlag);   /* GLUE.CPP: game C++ entry */
