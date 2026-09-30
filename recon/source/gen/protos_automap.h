void StartAutomap(void);   /* @0x80161F58 AUTOMAP.CPP:130 */
void AutomapUp(void);   /* @0x80161F68 AUTOMAP.CPP:136 */
void AutomapDown(void);   /* @0x80161F88 AUTOMAP.CPP:142 */
void AutomapLeft(void);   /* @0x80161FA8 AUTOMAP.CPP:148 */
void AutomapRight(void);   /* @0x80161FC8 AUTOMAP.CPP:154 */
LINE_F2 * AMGetLine(unsigned char R, unsigned char G, unsigned char B);   /* @0x80161FE8 AUTOMAP.CPP:176 */
void AmDrawPlayer(int x0, int y0, int x1, int y1, int PNum);   /* @0x801620A0 AUTOMAP.CPP:202 */
void DrawAutomapPlr(void);   /* @0x80162124 AUTOMAP.CPP:221 */
void DrawAutoMapVertDoor(int X, int Y);   /* @0x80162490 AUTOMAP.CPP:335 */
void DrawAutoMapHorzDoor(int X, int Y);   /* @0x8016264C AUTOMAP.CPP:383 */
void DrawAutoMapVertGrate(int X, int Y);   /* @0x8016280C AUTOMAP.CPP:430 */
void DrawAutoMapHorzGrate(int X, int Y);   /* @0x801628A4 AUTOMAP.CPP:449 */
void DrawAutoMapSquare(int X, int Y);   /* @0x8016293C AUTOMAP.CPP:467 */
void DrawVertArch(int X, int Y);   /* @0x80162A70 AUTOMAP.CPP:507 */
void DrawHorzArch(int X, int Y);   /* @0x80162BA4 AUTOMAP.CPP:546 */
void DrawAutoMapStairs(int X, int Y);   /* @0x80162CD8 AUTOMAP.CPP:628 */
void DrawAutomap(void);   /* @0x80162E50 AUTOMAP.CPP:666 */

extern "C" void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */
char * GetStr(int StrId);   /* @0x8007B528 LANG.CPP:171 */
extern "C" {
void SetLineF2(LINE_F2 *p);   /* PsyQ libgpu -- lib segment */
int sprintf(char *buf, const char *fmt, ...);
}
