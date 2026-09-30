void OVR_LoadPregame(void);   /* @0x80095424 OVERLAY.CPP:129 */
unsigned long (*GRL_SetWindowProc(unsigned long (*NewProc)(unsigned long, unsigned int, long, unsigned long)))(unsigned long, unsigned int, long, unsigned long);   /* @0x8007B21C GWIN.CPP:106 */
unsigned long DisableInputWndProc(unsigned long hWnd, unsigned int uMsg, long wParam, unsigned long lParam);   /* @0x80038894 DIABLO.CPP:2191 */
void sound_init(void);   /* @0x8003D940 EFFECTS.CPP:631 */
void DeltaSaveLevel(void);   /* @0x8004F5D4 MSG.CPP:780 */
extern "C" void app_fatal(char *pszFile, ...);   /* @0x80039F08 DIABLO.CPP:3593 */
void FreeGameMem(void);   /* @0x80037FAC DIABLO.CPP:292 */
void LoadGameLevel(unsigned char firstflag, int lvldir);   /* @0x80039270 DIABLO.CPP:2785 */
void SetReturnLvlPos(void);   /* @0x800681CC QUESTS.CPP:458 */
void GetReturnLvlPos(void);   /* @0x800682DC QUESTS.CPP:491 */
void GetPortalLevel(void);   /* @0x800813F0 PORTAL.CPP:312 */
void OVR_LoadGame(void);   /* @0x80095474 OVERLAY.CPP:146 */
void SyncPortals(void);   /* @0x80080FE8 PORTAL.CPP:189 */
void NetSendCmdLocParam1(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1);   /* @0x8004F774 MSG.CPP:916 */
void ResetPal(void);   /* @0x8007EE74 PALETTE.CPP:123 */
