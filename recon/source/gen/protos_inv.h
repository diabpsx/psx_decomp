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
int CalculateGold(int pnum);   /* @0x80160B64 INV.CPP:3690 */
