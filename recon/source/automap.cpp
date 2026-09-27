/* SOURCE/AUTOMAP.CPP — Diablo PSX (Climax 1998) reconstruction.
 * PC lineage: refs/diablo-hellfire/src/AUTOMAP.CPP -- the navigation entry points (StartAutomap,
 * AutomapUp/Down/Left/Right) and GetAutomapType/SetAutomapView (coreauto.cpp) / InitAutomap
 * (preauto.cpp) match the PC source closely, but the actual on-screen RENDERING is a completely
 * PSX-original rasterizer: instead of devilution's per-tile DrawAMShape() calling generic
 * DrawLine()/DrawPoint() in screen space, the PSX build draws each wall/door/stairs/arch shape as a
 * handful of hardware GPU LINE_F2 primitives (via AMGetLine, a PRIM_GetPrim<LINE_F2> + addPrim
 * wrapper) computed directly in a fixed-point tile-relative coordinate space (AutoMapScale,
 * AMPlayerX/Y, AMPx/AMPy for the 2-player split-screen case).  Layouts, prototypes, externs
 * generated from DIABPSX.SYM (tools/symhdr.py -> gen headers). */
#include "diabpsx_types.h"
#include "source/gen/structs_automap.h"
#include "source/gen/externs_automap.h"
#include "source/gen/protos_automap.h"

/* AUTOMAP.CPP-owned globals (.sdata; SYM class EXT / unnamed D_ data).  Tentative definitions in the
 * OWNER TU make them gp-relative exactly like retail; preauto.cpp/coreauto.cpp reach these `extern`
 * (absolute), since only THIS TU's oracle reaches them via %gp_rel (methodology 3.12 #6). */
unsigned char automapflag;
int AutoMapScale;
int AutoMapXOfs;
int AutoMapYOfs;
int D_8011C36C;   /* OT layer/index scratch for AMGetLine's addPrim -- no SYM name, retail static data */
int AMPlayerX;
int AMPlayerY;
int AMPx[2];   /* %gp_rel(AMPx) in DrawAutomap's oracle -> owned here */
int AMPy[2];
static int SetLevelName[6] = { 1274, 978, 114, 646, 796, 30 };   /* @0x8010D6CC STAT */

/* PsyQ PSXSRC/PRIMPOOL.H template, LINE_F2 instantiation (one out-of-line copy per TU that uses it --
 * this TU declares its own local copy, matching the source/*.cpp "self-contained" convention). */
static inline void PRIM_GetPrim(LINE_F2 **Prim)
{
    if ((unsigned char *)ThisPrimAddr + sizeof(LINE_F2) * 10 >= (unsigned char *)AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 0x44);
    *Prim = (LINE_F2 *)ThisPrimAddr;
    ThisPrimAddr = (struct POLY_FT4 *)((LINE_F2 *)ThisPrimAddr + 1);
}

/* PsyQ libgpu.h OT-link macros (P_TAG's addr:24 bitfield) */
#define getaddr(p) (((P_TAG *)(p))->addr)
#define setaddr(p, _addr) (((P_TAG *)(p))->addr = (unsigned long)(_addr))
#define addPrim(ot, p) (setaddr(p, getaddr(ot)), setaddr(ot, p))

/* line 130 @0x80161F58 */
void StartAutomap(void)
{
    automapflag = 1;
}

/* line 136 @0x80161F68 */
void AutomapUp(void)
{
    if (AutoMapYOfs >= -0x27)
        AutoMapYOfs -= 2;
}

/* line 142 @0x80161F88 */
void AutomapDown(void)
{
    if (AutoMapYOfs < 0x28)
        AutoMapYOfs += 2;
}

/* line 148 @0x80161FA8 */
void AutomapLeft(void)
{
    if (AutoMapXOfs >= -0x4F)
        AutoMapXOfs -= 2;
}

/* line 154 @0x80161FC8 */
void AutomapRight(void)
{
    if (AutoMapXOfs < 0x50)
        AutoMapXOfs += 2;
}

/* line 176 @0x80161FE8 */
LINE_F2 *AMGetLine(unsigned char R, unsigned char G, unsigned char B)
{
    LINE_F2 *L2;

    PRIM_GetPrim(&L2);
    SetLineF2(L2);
    L2->r0 = R;
    L2->g0 = G;
    L2->b0 = B;

    addPrim(&ThisOt[D_8011C36C], L2);
    return L2;
}

/* line 221 @0x80162124 -- twin: devilution DrawAutomapPlr's per-direction 3-segment marker, but each
 * segment is a colored AmDrawPlayer() GPU line (not a generic DrawLine), one marker per active
 * player (2-player split-screen), using this player's AMPx/AMPy offset from DrawAutomap. */
void DrawAutomapPlr(void)
{
    int x, y;
    int automaps3, automaps4, automaps5;

    automaps3 = AutoMapScale;
    automaps4 = automaps3 >> 1;
    automaps5 = automaps3 >> 2;

    for (int pc = 0; pc < 2; pc++) {
        if (!plr[pc].plractive)
            continue;

        x = AutoMapXOfs + AMPx[pc] + 0x9E;
        y = AutoMapYOfs + AMPy[pc] + 0x65;

        switch (plr[pc]._pdir) {
        case 4:
            AmDrawPlayer(x, y, x, y - automaps3, pc);
            AmDrawPlayer(x, y - automaps3, x - automaps5, y - automaps4, pc);
            AmDrawPlayer(x, y - automaps3, x + automaps5, y - automaps4, pc);
            break;
        case 5:
            AmDrawPlayer(x, y, x + automaps3, y - automaps4, pc);
            AmDrawPlayer(x + automaps3, y - automaps4, x + automaps4, y - automaps4, pc);
            AmDrawPlayer(x + automaps3, y - automaps4, x + automaps4 + automaps5, y, pc);
            break;
        case 6:
            AmDrawPlayer(x, y, x + automaps3, y, pc);
            AmDrawPlayer(x + automaps3, y, x + automaps4, y - automaps5, pc);
            AmDrawPlayer(x + automaps3, y, x + automaps4, y + automaps5, pc);
            break;
        case 7:
            AmDrawPlayer(x, y, x + automaps3, y + automaps4, pc);
            AmDrawPlayer(x + automaps3, y + automaps4, x + automaps4 + automaps5, y, pc);
            AmDrawPlayer(x + automaps3, y + automaps4, x + automaps4, y + automaps4, pc);
            break;
        case 0:
            AmDrawPlayer(x, y, x, y + automaps3, pc);
            AmDrawPlayer(x, y + automaps3, x + automaps5, y + automaps4, pc);
            AmDrawPlayer(x, y + automaps3, x - automaps5, y + automaps4, pc);
            break;
        case 1:
            AmDrawPlayer(x, y, x - automaps3, y + automaps4, pc);
            AmDrawPlayer(x - automaps3, y + automaps4, x - automaps4 - automaps5, y, pc);
            AmDrawPlayer(x - automaps3, y + automaps4, x - automaps4, y + automaps4, pc);
            break;
        case 2:
            AmDrawPlayer(x, y, x - automaps3, y, pc);
            AmDrawPlayer(x - automaps3, y, x - automaps4, y - automaps5, pc);
            AmDrawPlayer(x - automaps3, y, x - automaps4, y + automaps5, pc);
            break;
        case 3:
            AmDrawPlayer(x, y, x - automaps3, y - automaps4, pc);
            AmDrawPlayer(x - automaps3, y - automaps4, x - automaps4, y - automaps4, pc);
            AmDrawPlayer(x - automaps3, y - automaps4, x - automaps4 - automaps5, y, pc);
            break;
        }
    }
}

/* line 202 @0x801620A0 */
void AmDrawPlayer(int x0, int y0, int x1, int y1, int PNum)
{
    LINE_F2 *L2;

    if (PNum == 0)
        L2 = AMGetLine(0x20, 0xFF, 0);
    else
        L2 = AMGetLine(0xFF, 0, 0xE0);

    L2->x0 = x0;
    L2->y0 = y0;
    L2->x1 = x1;
    L2->y1 = y1;
}

/* line 335 @0x80162490 */
void DrawAutoMapVertDoor(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly, Frac, y0, x1, y1, y2, x3;

    Frac = AutoMapScale >> 1;
    X *= AutoMapScale;
    Y *= AutoMapScale;
    Lx = (X - Y) * 2;
    Ly = Y + X;
    Lx += AMPlayerX; Ly += AMPlayerY;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = Lx; L2->y0 = Ly;
    L2->x1 = Lx - Frac; L2->y1 = Ly + Frac / 2;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = Lx - AutoMapScale * 2 + Frac; L2->y0 = Ly + AutoMapScale - Frac / 2;
    L2->x1 = Lx - AutoMapScale * 2; L2->y1 = Ly + AutoMapScale;

    Lx -= Frac * 2;
    y0 = Ly + Frac - Frac;   /* HorzDoor's y0 formula; as a plain copy cse folds y0 into Ly and its SYM record vanishes */
    x1 = Lx - AutoMapScale * 2 + Frac * 2; y1 = Ly + AutoMapScale - Frac;
    y2 = Ly + AutoMapScale * 2 - Frac - Frac;
    x3 = Lx + AutoMapScale * 2 - Frac * 2;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = Lx; L2->y0 = y0;
    L2->x1 = x1; L2->y1 = y1;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = x1; L2->y0 = y1;
    L2->x1 = Lx; L2->y1 = y2;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = Lx; L2->y0 = y2;
    L2->x1 = x3; L2->y1 = y1;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = x3; L2->y0 = y1;
    L2->x1 = Lx; L2->y1 = y0;
}

/* line 383 @0x8016264C */
void DrawAutoMapHorzDoor(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly, Frac, y0, x1, y1, y2, x3;

    Frac = AutoMapScale >> 1;
    X *= AutoMapScale;
    Y *= AutoMapScale;
    Lx = (X - Y) * 2;
    Ly = Y + X;
    Lx += AMPlayerX; Ly += AMPlayerY;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = Lx; L2->y0 = Ly;
    L2->x1 = Lx + Frac; L2->y1 = Ly + Frac / 2;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = Lx + AutoMapScale * 2 - Frac; L2->y0 = Ly + AutoMapScale - Frac / 2;
    L2->x1 = Lx + AutoMapScale * 2; L2->y1 = Ly + AutoMapScale;

    Lx += Frac * 2; Ly -= Frac;
    y0 = Ly + Frac;
    x1 = Lx - AutoMapScale * 2 + Frac * 2; y1 = Ly + AutoMapScale;
    y2 = Ly + AutoMapScale * 2 - Frac;
    x3 = Lx + AutoMapScale * 2 - Frac * 2;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = Lx; L2->y0 = y0;
    L2->x1 = x1; L2->y1 = y1;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = x1; L2->y0 = y1;
    L2->x1 = Lx; L2->y1 = y2;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = Lx; L2->y0 = y2;
    L2->x1 = x3; L2->y1 = y1;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = x3; L2->y0 = y1;
    L2->x1 = Lx; L2->y1 = y0;
}

/* line 430 @0x8016280C */
void DrawAutoMapVertGrate(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    X *= AutoMapScale;
    Y *= AutoMapScale;
    Ly = Y + X;
    Ly += AMPlayerY;
    Lx = (X - Y) * 2 + AMPlayerX;
    L2->x0 = Lx; L2->y0 = Ly; L2->x1 = Lx - AutoMapScale * 2; L2->y1 = Ly + AutoMapScale;
}

/* line 449 @0x801628A4 */
void DrawAutoMapHorzGrate(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    X *= AutoMapScale;
    Y *= AutoMapScale;
    Ly = Y + X;
    Ly += AMPlayerY;
    Lx = (X - Y) * 2 + AMPlayerX;
    L2->x0 = Lx; L2->y0 = Ly; L2->x1 = Lx + AutoMapScale * 2; L2->y1 = Ly + AutoMapScale;
}

/* line 467 @0x8016293C */
void DrawAutoMapSquare(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly, Frac, y0, x1, y1, y2, x3;

    Frac = AutoMapScale >> 1;
    X *= AutoMapScale;
    Y *= AutoMapScale;
    Lx = (X - Y) * 2;
    Ly = Y + X;
    Lx -= Frac * 2;
    Ly -= Frac;
    Lx += AMPlayerX; Ly += AMPlayerY;
    y0 = Ly + Frac;
    x1 = Lx - AutoMapScale * 2 + Frac * 2; y1 = Ly + AutoMapScale;
    y2 = Ly + AutoMapScale * 2 - Frac;
    x3 = Lx + AutoMapScale * 2 - Frac * 2;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = Lx;
    L2->y0 = y0;
    L2->x1 = x1;
    L2->y1 = y1;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x1;
    L2->y0 = y1;
    L2->x1 = Lx;
    L2->y1 = y2;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = Lx;
    L2->y0 = y2;
    L2->x1 = x3;
    L2->y1 = y1;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x3;
    L2->y0 = y1;
    L2->x1 = Lx;
    L2->y1 = y0;
}

/* line 507 @0x80162A70 -- Twin: hellfire
 * AUTOMAP.CPP's DrawAMShape AMS_ARCHL/AMS_ARCHR square block, factored into its own function with a
 * PSX-specific fixed +-8/+-4 pixel nudge on the diamond corners. */
void DrawVertArch(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly;
    int Frac;
    int x0, y0, x1, y1, x2, y2, x3, y3;
    int K8 = 8, K4 = 4;

    X <<= 2;
    Y <<= 2;
    Lx = (X - Y) << 1;
    Ly = Y + X;
    Lx += AMPlayerX;
    Ly += AMPlayerY;
    Frac = AutoMapScale >> 2;
    x0 = Lx - Frac;
    y0 = Ly - Frac;
    x1 = Lx - (Frac + K8);
    y1 = Ly - (Frac - K4);
    x2 = Lx + (Frac - K8);
    y2 = Ly + (Frac + K4);
    x3 = Lx + Frac;
    y3 = Ly + Frac;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    L2->x0 = x0;
    L2->y0 = y0;
    L2->x1 = x1;
    L2->y1 = y1;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    L2->x0 = x1;
    L2->y0 = y1;
    L2->x1 = x2;
    L2->y1 = y2;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    L2->x0 = x2;
    L2->y0 = y2;
    L2->x1 = x3;
    L2->y1 = y3;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    L2->x0 = x3;
    L2->y0 = y3;
    L2->x1 = x0;
    L2->y1 = y0;
}

/* line 546 @0x80162BA4 -- mirror of
 * DrawVertArch (x-offsets negated). */
void DrawHorzArch(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly;
    int Frac;
    int x0, y0, x1, y1, x2, y2, x3, y3;
    int K8 = 8, K4 = 4;

    X <<= 2;
    Y <<= 2;
    Lx = (X - Y) << 1;
    Ly = Y + X;
    Lx += AMPlayerX;
    Ly += AMPlayerY;
    Frac = AutoMapScale >> 2;
    x0 = Lx + Frac;
    y0 = Ly - Frac;
    x1 = Lx + (Frac + K8);
    y1 = Ly - (Frac - K4);
    x2 = Lx - (Frac - K8);
    y2 = Ly + (Frac + K4);
    x3 = Lx - Frac;
    y3 = Ly + Frac;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    L2->x0 = x0;
    L2->y0 = y0;
    L2->x1 = x1;
    L2->y1 = y1;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    L2->x0 = x1;
    L2->y0 = y1;
    L2->x1 = x2;
    L2->y1 = y2;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    L2->x0 = x2;
    L2->y0 = y2;
    L2->x1 = x3;
    L2->y1 = y3;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    L2->x0 = x3;
    L2->y0 = y3;
    L2->x1 = x0;
    L2->y1 = y0;
}

/* line 628 @0x80162CD8 */
void DrawAutoMapStairs(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly, Frac, x1, y1, y2;
    int Scale;
    X *= AutoMapScale;
    Y *= AutoMapScale;
    Scale = AutoMapScale;
    Ly = Y + X;
    Lx = (X - Y) * 2;
    Ly += AMPlayerY;
    Lx += AMPlayerX;
    y1 = Ly + Scale;
    x1 = Lx - Scale * 2;
    y2 = Ly + Scale * 2;
    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x1; L2->y0 = y1; L2->x1 = Lx; L2->y1 = y2;
    Frac = Scale >> 1;
    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x1 + Frac; L2->y0 = y1 - Frac / 2; L2->x1 = Lx + Frac; L2->y1 = y2 - Frac / 2;
    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x1 + Frac * 2; L2->y0 = y1 - Frac; L2->x1 = Lx + Frac * 2; L2->y1 = y2 - Frac;
    L2 = AMGetLine(0x5F, 0x58, 0x38);
    x1 += Frac * 3; y1 -= (Frac * 3) / 2; Lx += Frac * 3; y2 -= (Frac * 3) / 2;
    L2->x0 = x1; L2->y0 = y1; L2->x1 = Lx; L2->y1 = y2;
}

/* line 666 @0x80162E50 -- TODO (open, MAJOR): custom automapview[][] rasterizer, ~1000 raw insns.
 * NOT YET TRANSCRIBED -- see refs/m2c/automap.c lines 648-1254 for the m2c draft (leveltype==3
 * horizontal-run door/square/arch merge pass over automapview + draw_game_info-equivalent text via
 * MediumFont.Print, GOLDR/G/B, GetStr()).  Stubbed to keep the TU link-complete; every other function
 * in this TU is either sealed or has a concrete near-miss target. */
void DrawAutomap(void)
{
    /* SYM-first rewrite (records/blocks from tuinfo, body from the JAP skeleton's Ghidra, run
     * merging as in hellfire's DrawAutomap).  P1x/P1y/P2x/P2y double as the player-tile temps in
     * the setup; PAx/PAy are the two-player midpoint (their own SYM block). */
    LINE_F2 *L2;
    int Lx, Ly;
    int LineY, MapX, MapY;
    int LLSx, LLSy, LRSx, LRSy, LSx, LSy, RSx, RSy;
    int LLen, RLen, LLLen, LRLen;
    unsigned char AMLWallFlag, AMRWallFlag;
    unsigned short AmTile;
    unsigned char AmTileType;
    unsigned char *AmTileTypePtr = (unsigned char *)&AmTile + 1;
    int P1x, P1y, P2x, P2y;
    char levname[64];
    int len;

    if (PauseMode)
        return;
    if (!plr[0].plractive && !plr[1].plractive)
        return;
    D_8011C36C = CBlocks::GetOverlayOtBase();
    P1x = plr[0]._px - 16;
    P1y = plr[0]._py - 16;
    P2x = plr[1]._px - 16;
    P2y = plr[1]._py - 16;
    if (!plr[1].plractive) {
        AMPlayerX = (P1x - P1y) * 2;
        AMPlayerY = P1x + P1y;
        AMPx[0] = 0;
        AMPy[0] = 0;
    } else if (!plr[0].plractive) {
        AMPlayerX = (P2x - P2y) * 2;
        AMPlayerY = P2x + P2y;
        AMPx[1] = 0;
        AMPy[1] = 0;
    } else {
        int PAx = (P1x + P2x) >> 1;
        int PAy = (P1y + P2y) >> 1;

        AMPlayerX = (PAx - PAy) * 2;
        AMPlayerY = PAx + PAy;
        AMPx[0] = (P1x - PAx) * 2;
        AMPy[0] = (P1y - PAy) * 2;
        AMPx[1] = (P2x - PAx) * 2;
        AMPy[1] = (P2y - PAy) * 2;
    }
    LLSx = LLSy = LRSx = LRSy = LSx = LSy = RSx = RSy = 0;
    Lx = AMPlayerX * AutoMapScale;
    Ly = AMPlayerY * AutoMapScale;
    AMPlayerX = (AutoMapXOfs + 160) - (Lx >> 1);
    AMPlayerY = (AutoMapYOfs + 100) - (Ly >> 1);
    MapX = 0;
        if (leveltype == 3) {
            do {
                MapY = 0;
                RLen = 0;
                LLen = 0;
                LRLen = 0;
                LLLen = 0;
                do {
                    if ((automapview[MapX >> 3][MapY] >> (MapX & 7)) & 1) {
                        AmTile = automaptype[dungeon[MapX][MapY]];
                        AmTileType = *AmTileTypePtr;
                        AMLWallFlag = AmLTab[AmTile & 0xF];
                        if (AmTileType & 0x80)
                            DrawAutoMapStairs(MapX, MapY);
                        if (!(AmTileType & 0x15) && (AMLWallFlag & 2)) {
                            if (LLen == 0) {
                                LSx = MapX;
                                LSy = MapY;
                            }
                            LLen++;
                        } else if (LLen != 0) {
                            L2 = AMGetLine(0x5F, 0x58, 0x38);
                            P1x = (LSx - LSy) * 8 + AMPlayerX;
                            P1y = (LSy + LSx) * 4 + AMPlayerY;
                            P2x = P1x - LLen * 8;
                            P2y = P1y + LLen * 4;
                            LLen = 0;
                            L2->x0 = P1x;
                            L2->y0 = P1y;
                            L2->x1 = P2x;
                            L2->y1 = P2y;
                        }
                        if (AMLWallFlag & 1)
                            DrawAutoMapSquare(MapX, MapY);
                        if (!(AmTileType & 0x15) && (AMLWallFlag & 4)) {
                            if (LLLen == 0) {
                                LLSx = MapX;
                                LLSy = MapY + 1;
                            }
                            LLLen++;
                        } else {
                        if (LLLen != 0) {
                            L2 = AMGetLine(0x5F, 0x58, 0x38);
                            P1x = (LLSx - LLSy) * 8 + AMPlayerX;
                            P1y = (LLSy + LLSx) * 4 + AMPlayerY;
                            P2x = P1x + LLLen * 8;
                            P2y = P1y + LLLen * 4;
                            LLLen = 0;
                            L2->x0 = P1x;
                            L2->y0 = P1y;
                            L2->x1 = P2x;
                            L2->y1 = P2y;
                        }
                            if (AmTileType != 0) {
                                if (AmTileType & 1)
                                    DrawAutoMapHorzDoor(MapX, MapY + 1);
                                else if (AmTileType & 0x10)
                                    DrawAutoMapHorzGrate(MapX, MapY + 1);
                                else if (AmTileType & 4)
                                    DrawHorzArch(MapX, MapY + 1);
                            }
                        }
                    } else {
                    if (LLen != 0) {
                        L2 = AMGetLine(0x5F, 0x58, 0x38);
                        P1x = (LSx - LSy) * 8 + AMPlayerX;
                        P1y = (LSy + LSx) * 4 + AMPlayerY;
                        P2x = P1x - LLen * 8;
                        P2y = P1y + LLen * 4;
                        LLen = 0;
                        L2->x0 = P1x;
                        L2->y0 = P1y;
                        L2->x1 = P2x;
                        L2->y1 = P2y;
                    }
                    if (LLLen != 0) {
                        L2 = AMGetLine(0x5F, 0x58, 0x38);
                        P1x = (LLSx - LLSy) * 8 + AMPlayerX;
                        P1y = (LLSy + LLSx) * 4 + AMPlayerY;
                        P2x = P1x + LLLen * 8;
                        P2y = P1y + LLLen * 4;
                        LLLen = 0;
                        L2->x0 = P1x;
                        L2->y0 = P1y;
                        L2->x1 = P2x;
                        L2->y1 = P2y;
                    }
                    }
                    if ((automapview[MapY >> 3][MapX] >> (MapY & 7)) & 1) {
                        AmTile = automaptype[dungeon[MapY][MapX]];
                        AmTileType = *AmTileTypePtr;
                        AMRWallFlag = AmRTab[AmTile & 0xF];
                        if (!(AmTileType & 0x2A) && (AMRWallFlag & 8)) {
                            if (RLen == 0) {
                                RSx = MapY;
                                RSy = MapX;
                            }
                            RLen++;
                        } else if (RLen != 0) {
                            L2 = AMGetLine(0x5F, 0x58, 0x38);
                            P1x = (RSx - RSy) * 8 + AMPlayerX;
                            P1y = (RSy + RSx) * 4 + AMPlayerY;
                            P2x = P1x + RLen * 8;
                            P2y = P1y + RLen * 4;
                            RLen = 0;
                            L2->x0 = P1x;
                            L2->y0 = P1y;
                            L2->x1 = P2x;
                            L2->y1 = P2y;
                        }
                        if (!(AmTileType & 0x2A) && (AMRWallFlag & 0x10)) {
                            if (LRLen == 0) {
                                LRSx = MapY + 1;
                                LRSy = MapX;
                            }
                            LRLen++;
                        } else {
                        if (LRLen != 0) {
                            L2 = AMGetLine(0x5F, 0x58, 0x38);
                            P1x = (LRSx - LRSy) * 8 + AMPlayerX;
                            P1y = (LRSy + LRSx) * 4 + AMPlayerY;
                            P2x = P1x - LRLen * 8;
                            P2y = P1y + LRLen * 4;
                            LRLen = 0;
                            L2->x0 = P1x;
                            L2->y0 = P1y;
                            L2->x1 = P2x;
                            L2->y1 = P2y;
                        }
                            if (AmTileType != 0) {
                                if (AmTileType & 2)
                                    DrawAutoMapVertDoor(MapY + 1, MapX);
                                else if (AmTileType & 0x20)
                                    DrawAutoMapVertGrate(MapY + 1, MapX);
                                else if (AmTileType & 8)
                                    DrawVertArch(MapY + 1, MapX);
                            }
                        }
                    } else {
                    if (RLen != 0) {
                        L2 = AMGetLine(0x5F, 0x58, 0x38);
                        P1x = (RSx - RSy) * 8 + AMPlayerX;
                        P1y = (RSy + RSx) * 4 + AMPlayerY;
                        P2x = P1x + RLen * 8;
                        P2y = P1y + RLen * 4;
                        RLen = 0;
                        L2->x0 = P1x;
                        L2->y0 = P1y;
                        L2->x1 = P2x;
                        L2->y1 = P2y;
                    }
                    if (LRLen != 0) {
                        L2 = AMGetLine(0x5F, 0x58, 0x38);
                        P1x = (LRSx - LRSy) * 8 + AMPlayerX;
                        P1y = (LRSy + LRSx) * 4 + AMPlayerY;
                        P2x = P1x - LRLen * 8;
                        P2y = P1y + LRLen * 4;
                        LRLen = 0;
                        L2->x0 = P1x;
                        L2->y0 = P1y;
                        L2->x1 = P2x;
                        L2->y1 = P2y;
                    }
                    }
                    MapY++;
                } while (MapY < 40);
                if (LLen != 0) {
                L2 = AMGetLine(0x5F, 0x58, 0x38);
                P1x = (LSx - LSy) * 8 + AMPlayerX;
                P1y = (LSy + LSx) * 4 + AMPlayerY;
                P2x = P1x - LLen * 8;
                P2y = P1y + LLen * 4;
                L2->x1 = P2x;
                L2->x0 = P1x;
                L2->y0 = P1y;
                L2->y1 = P2y;
                }
                if (LLLen != 0) {
                L2 = AMGetLine(0x5F, 0x58, 0x38);
                P1x = (LLSx - LLSy) * 8 + AMPlayerX;
                P1y = (LLSy + LLSx) * 4 + AMPlayerY;
                P2x = P1x + LLLen * 8;
                P2y = P1y + LLLen * 4;
                L2->x1 = P2x;
                L2->x0 = P1x;
                L2->y0 = P1y;
                L2->y1 = P2y;
                }
                if (RLen != 0) {
                L2 = AMGetLine(0x5F, 0x58, 0x38);
                P1x = (RSx - RSy) * 8 + AMPlayerX;
                P1y = (RSy + RSx) * 4 + AMPlayerY;
                P2x = P1x + RLen * 8;
                P2y = P1y + RLen * 4;
                L2->x1 = P2x;
                L2->x0 = P1x;
                L2->y0 = P1y;
                L2->y1 = P2y;
                }
                if (LRLen != 0) {
                L2 = AMGetLine(0x5F, 0x58, 0x38);
                P1x = (LRSx - LRSy) * 8 + AMPlayerX;
                P1y = (LRSy + LRSx) * 4 + AMPlayerY;
                P2x = P1x - LRLen * 8;
                P2y = P1y + LRLen * 4;
                L2->x1 = P2x;
                L2->x0 = P1x;
                L2->y0 = P1y;
                L2->y1 = P2y;
                }
                MapX++;
            } while (MapX < 40);
        } else {
            do {
                MapY = 0;
                RLen = 0;
                LLen = 0;
                do {
                    if ((automapview[MapX >> 3][MapY] >> (MapX & 7)) & 1) {
                        AmTile = automaptype[dungeon[MapX][MapY]];
                        AmTileType = *AmTileTypePtr;
                        AMLWallFlag = AmLTab[AmTile & 0xF];
                        if (AmTileType & 0x80)
                            DrawAutoMapStairs(MapX, MapY);
                        if (!(AmTileType & 0x15) && (AMLWallFlag & 2)) {
                            if (LLen == 0) {
                                LSx = MapX;
                                LSy = MapY;
                            }
                            LLen++;
                        } else {
                        if (LLen != 0) {
                            L2 = AMGetLine(0x5F, 0x58, 0x38);
                            P1x = (LSx - LSy) * 8 + AMPlayerX;
                            P1y = (LSy + LSx) * 4 + AMPlayerY;
                            P2x = P1x - LLen * 8;
                            P2y = P1y + LLen * 4;
                            LLen = 0;
                            L2->x0 = P1x;
                            L2->y0 = P1y;
                            L2->x1 = P2x;
                            L2->y1 = P2y;
                        }
                            if (AmTileType != 0) {
                                if (AmTileType & 1)
                                    DrawAutoMapVertDoor(MapX, MapY);
                                else if (AmTileType & 0x10)
                                    DrawAutoMapVertGrate(MapX, MapY);
                                else if (AmTileType & 4)
                                    DrawVertArch(MapX, MapY);
                            }
                            if (AMLWallFlag & 1)
                                DrawAutoMapSquare(MapX, MapY);
                        }
                    } else {
                    if (LLen != 0) {
                        L2 = AMGetLine(0x5F, 0x58, 0x38);
                        P1x = (LSx - LSy) * 8 + AMPlayerX;
                        P1y = (LSy + LSx) * 4 + AMPlayerY;
                        P2x = P1x - LLen * 8;
                        P2y = P1y + LLen * 4;
                        LLen = 0;
                        L2->x0 = P1x;
                        L2->y0 = P1y;
                        L2->x1 = P2x;
                        L2->y1 = P2y;
                    }
                    }
                    if ((automapview[MapY >> 3][MapX] >> (MapY & 7)) & 1) {
                        AmTile = automaptype[dungeon[MapY][MapX]];
                        AmTileType = *AmTileTypePtr;
                        AMRWallFlag = AmRTab[AmTile & 0xF];
                        if (!(AmTileType & 0x2A) && (AMRWallFlag & 8)) {
                            if (RLen == 0) {
                                RSx = MapY;
                                RSy = MapX;
                            }
                            RLen++;
                        } else {
                        if (RLen != 0) {
                            L2 = AMGetLine(0x5F, 0x58, 0x38);
                            P1x = (RSx - RSy) * 8 + AMPlayerX;
                            P1y = (RSy + RSx) * 4 + AMPlayerY;
                            P2x = P1x + RLen * 8;
                            P2y = P1y + RLen * 4;
                            RLen = 0;
                            L2->x0 = P1x;
                            L2->y0 = P1y;
                            L2->x1 = P2x;
                            L2->y1 = P2y;
                        }
                            if (AmTileType != 0) {
                                if (AmTileType & 2)
                                    DrawAutoMapHorzDoor(MapY, MapX);
                                else if (AmTileType & 0x20)
                                    DrawAutoMapHorzGrate(MapY, MapX);
                                else if (AmTileType & 8)
                                    DrawHorzArch(MapY, MapX);
                            }
                        }
                    } else {
                    if (RLen != 0) {
                        L2 = AMGetLine(0x5F, 0x58, 0x38);
                        P1x = (RSx - RSy) * 8 + AMPlayerX;
                        P1y = (RSy + RSx) * 4 + AMPlayerY;
                        P2x = P1x + RLen * 8;
                        P2y = P1y + RLen * 4;
                        RLen = 0;
                        L2->x0 = P1x;
                        L2->y0 = P1y;
                        L2->x1 = P2x;
                        L2->y1 = P2y;
                    }
                    }
                    MapY++;
                } while (MapY < 40);
                if (LLen != 0) {
                L2 = AMGetLine(0x5F, 0x58, 0x38);
                P1x = (LSx - LSy) * 8 + AMPlayerX;
                P1y = (LSy + LSx) * 4 + AMPlayerY;
                P2x = P1x - LLen * 8;
                P2y = P1y + LLen * 4;
                L2->x1 = P2x;
                L2->x0 = P1x;
                L2->y0 = P1y;
                L2->y1 = P2y;
                }
                if (RLen != 0) {
                L2 = AMGetLine(0x5F, 0x58, 0x38);
                P1x = (RSx - RSy) * 8 + AMPlayerX;
                P1y = (RSy + RSx) * 4 + AMPlayerY;
                P2x = P1x + RLen * 8;
                P2y = P1y + RLen * 4;
                L2->x1 = P2x;
                L2->x0 = P1x;
                L2->y0 = P1y;
                L2->y1 = P2y;
                }
                MapX++;
            } while (MapX < 40);
        }
    DrawAutomapPlr();
    if (!setlevel)
        sprintf(levname, "%s %d", GetStr(0x243), currlevel);
    else
        sprintf(levname, "%s", GetStr(SetLevelName[setlvlnum]));
    len = MediumFont.GetStrWidth(levname);
    if (gbActivePlayers >= 2)
        MediumFont.Print((256 - len) / 2 + 32, 0xC0, levname, JustLeft, NULL, GOLDR, GOLDG, GOLDB);
    else
        MediumFont.Print((256 - len) / 2 + 32, 0x20, levname, JustLeft, NULL, GOLDR, GOLDG, GOLDB);
}
