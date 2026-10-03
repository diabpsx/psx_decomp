void ClrCursor(int num);   /* @0x80077F90 GAMEPAD.CPP:113 */
void HappyMan(int n);   /* @0x80077FEC GAMEPAD.CPP:127 */
GamePad *GetGamePad(int pnum);   /* @0x8007AD2C GAMEPAD.CPP:1945 */
char GetPadStyle(int pnum);   /* @0x8007B07C GAMEPAD.CPP:2092 */
void WorldToOffset(int pnum, int WorldX, int WorldY);   /* @0x80078440 GAMEPAD.CPP:268 */
int SetWalkStyle(int pnum, int style);   /* @0x8007B00C GAMEPAD.CPP:2079 */
void Init_GamePad(void);   /* @0x8007AE50 GAMEPAD.CPP:2014 */
void InitGamePadVars(void);   /* @0x8007AE80 GAMEPAD.CPP:2021 */
void PostGamePad(int val, int var1, int var2, int var3);   /* @0x8007AD4C GAMEPAD.CPP:1952 */
char pad_UpIsUpRight(int pval, char other);   /* @0x800784C0 GAMEPAD.CPP:351 */
