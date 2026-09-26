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
    int scale, xs, ys;

    scale = AutoMapScale;
    xs = X * scale;
    ys = Y * scale;
    Ly = xs + ys + AMPlayerY;
    Lx = (xs - ys) * 2 + AMPlayerX;
    L2 = AMGetLine(0x5F, 0x58, 0x38);
    Frac = AutoMapScale >> 1;
    y0 = Ly + ((Frac + ((unsigned)AutoMapScale >> 31)) >> 1);
    L2->x1 = Lx - Frac;
    L2->x0 = Lx;
    L2->y0 = Ly;
    L2->y1 = y0;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    x3 = AutoMapScale * 2;
    x1 = Lx - x3;   /* anonymous compiler temp ($a3 -- no SYM record) reused below */
    Lx = Lx - Frac * 2;
    y1 = Ly + AutoMapScale;
    y2 = (Lx - x3) + Frac * 2;   /* final x1, computed with NEW Lx -- stashed in y2 for now */
    L2->y1 = y1;
    L2->y0 = y1 - y0;
    y1 = y1 - Frac;
    y0 = ((Ly + x3) - Frac) - Frac;   /* final y2, reuses y0's slot */
    x3 = (Lx + x3) - Frac * 2;
    L2->x0 = x1 + Frac;
    L2->x1 = x1;
    x1 = y2;   /* final x1 */
    y2 = y0;   /* final y2 */

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = Lx;
    L2->y0 = Ly;
    L2->x1 = x1;
    L2->y1 = y1;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = x1;
    L2->y0 = y1;
    L2->x1 = Lx;
    L2->y1 = y2;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = Lx;
    L2->y0 = y2;
    L2->x1 = x3;
    L2->y1 = y1;

    L2->x0 = x3;
    L2->y0 = y1;
    L2->x1 = Lx;
    L2->y1 = Ly;
}

/* line 383 @0x8016264C */
void DrawAutoMapHorzDoor(int X, int Y)
{
    /* twin of DrawAutoMapVertDoor, X/Y swapped-role mirrored -- see that function's header note. */
    LINE_F2 *L2;
    int Lx, Ly, Frac, y0, x1, y1, y2, x3;
    int scale, xs, ys;

    scale = AutoMapScale;
    xs = X * scale;
    ys = Y * scale;
    Ly = xs + ys + AMPlayerY;
    Lx = (xs - ys) * 2 + AMPlayerX;
    L2 = AMGetLine(0x5F, 0x58, 0x38);
    Frac = AutoMapScale >> 1;
    y0 = Ly + ((Frac + ((unsigned)AutoMapScale >> 31)) >> 1);
    L2->x1 = Lx + Frac;
    L2->x0 = Lx;
    L2->y0 = Ly;
    L2->y1 = y0;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    x3 = AutoMapScale * 2;
    x1 = Lx + x3;
    Lx = Lx + Frac * 2;
    y1 = Ly + AutoMapScale;
    y2 = (Lx + x3) - Frac * 2;
    L2->y1 = y1;
    L2->y0 = y1 - y0;
    y1 = y1 - Frac;
    y0 = ((Ly + x3) - Frac) - Frac;
    x3 = (Lx - x3) + Frac * 2;
    L2->x0 = x1 - Frac;
    L2->x1 = x1;
    x1 = y2;
    y2 = y0;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = Lx;
    L2->y0 = y2;
    L2->x1 = x1;
    L2->y1 = y1;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = x1;
    L2->y0 = y1;
    L2->x1 = Lx;
    L2->y1 = y2;

    L2 = AMGetLine(0x7F, 0x7F, 0x64);
    L2->x0 = Lx;
    L2->y0 = y2;
    L2->x1 = x3;
    L2->y1 = y1;

    L2->x0 = x3;
    L2->y0 = y1;
    L2->x1 = Lx;
    L2->y1 = Ly;
}

/* line 430 @0x8016280C */
void DrawAutoMapVertGrate(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly;
    int xs, ys;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    xs = X * AutoMapScale;
    ys = Y * AutoMapScale;
    Ly = xs + ys + AMPlayerY;
    Lx = (xs - ys) * 2 + AMPlayerX;
    L2->y0 = Ly;
    L2->y1 = Ly + AutoMapScale;
    L2->x0 = Lx;
    L2->x1 = Lx - AutoMapScale * 2;
}

/* line 449 @0x801628A4 */
void DrawAutoMapHorzGrate(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly;
    int scale, xs, ys;

    L2 = AMGetLine(0x3A, 0x38, 0x2D);
    scale = AutoMapScale;
    xs = X * scale;
    ys = Y * scale;
    Ly = xs + ys + AMPlayerY;
    L2->y0 = Ly;
    L2->y1 = Ly + AutoMapScale;
    Lx = (xs - ys) * 2 + AMPlayerX;
    L2->x0 = Lx;
    L2->x1 = Lx + AutoMapScale * 2;
}

/* line 467 @0x8016293C */
void DrawAutoMapSquare(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly, Frac, y0, x1, y1, y2, x3;
    int xs, ys;

    xs = X * AutoMapScale;
    ys = Y * AutoMapScale;
    Frac = AutoMapScale >> 1;
    Ly = (ys + xs - Frac) + AMPlayerY;
    x3 = AutoMapScale * 2;
    y0 = Ly + Frac;
    y2 = Ly + AutoMapScale;
    y1 = (Ly + x3) - Frac;
    Lx = (((xs - ys) * 2) - (Frac * 2)) + AMPlayerX;
    x1 = (Lx - x3) + (Frac * 2);
    x3 = (Lx + x3) - (Frac * 2);

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = Lx;
    L2->y0 = y0;
    L2->x1 = x1;
    L2->y1 = y2;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x1;
    L2->y0 = y2;
    L2->x1 = Lx;
    L2->y1 = y1;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = Lx;
    L2->y0 = y1;
    L2->x1 = x3;
    L2->y1 = y2;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x3;
    L2->y0 = y2;
    L2->x1 = Lx;
    L2->y1 = y0;
}

/* line 507 @0x80162A70 -- TODO (open): near-miss target only, not yet byte-verified.  Twin: hellfire
 * AUTOMAP.CPP's DrawAMShape AMS_ARCHL/AMS_ARCHR square block, factored into its own function with a
 * PSX-specific fixed +-8/+-4 pixel nudge on the diamond corners. */
void DrawVertArch(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly;
    int x0, y0, x1, y1, x2, y2, x3, y3;
    int a, b, half;

    a = X * 4;
    b = Y * 4;
    Lx = ((a - b) * 2) + AMPlayerX;
    Ly = (b + a) + AMPlayerY;
    half = AutoMapScale >> 2;
    x0 = Lx - half;
    y0 = Ly - half;
    x1 = Lx - (half + 8);
    y1 = Ly - (half - 4);
    x2 = Lx + (half - 8);
    y2 = Ly + (half + 4);
    x3 = Lx + half;
    y3 = Ly + half;

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

/* line 546 @0x80162BA4 -- TODO (open): near-miss target only, not yet byte-verified; mirror of
 * DrawVertArch (x-offsets negated). */
void DrawHorzArch(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly;
    int x0, y0, x1, y1, x2, y2, x3, y3;
    int a, b, half;

    a = X * 4;
    b = Y * 4;
    Lx = ((a - b) * 2) + AMPlayerX;
    Ly = (b + a) + AMPlayerY;
    half = AutoMapScale >> 2;
    x0 = Lx + half;
    y0 = Ly - half;
    x1 = Lx + (half + 8);
    y1 = Ly - (half - 4);
    x2 = Lx - (half - 8);
    y2 = Ly + (half + 4);
    x3 = Lx - half;
    y3 = Ly + half;

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

/* line 628 @0x80162CD8 -- TODO (open): near-miss target only, not yet byte-verified. */
void DrawAutoMapStairs(int X, int Y)
{
    LINE_F2 *L2;
    int Lx, Ly, Frac, x1, y1, y2;
    int scale, xs, ys;

    scale = AutoMapScale;
    xs = X * scale;
    ys = Y * scale;
    Ly = xs + ys + AMPlayerY;
    y1 = Ly + scale;
    Lx = (xs - ys) * 2 + AMPlayerX;
    x1 = Lx - scale * 2;
    y2 = Ly + scale * 2;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x1;
    L2->y0 = y1;
    L2->x1 = Lx;
    L2->y1 = y2;

    Frac = scale >> 1;
    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x1 + Frac;
    L2->y0 = y1 - ((Frac + ((unsigned)scale >> 31)) >> 1);
    L2->x1 = Lx + Frac;
    L2->y1 = y2 - ((Frac + ((unsigned)scale >> 31)) >> 1);

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x1 + Frac * 2;
    L2->y0 = y1 - Frac;
    L2->x1 = Lx + Frac * 2;
    L2->y1 = y2 - Frac;

    L2 = AMGetLine(0x5F, 0x58, 0x38);
    L2->x0 = x1 + Frac * 3;
    L2->y0 = y1 - (Frac * 3) / 2;
    L2->x1 = Lx + Frac * 3;
    L2->y1 = y2 - (Frac * 3) / 2;
}

/* line 666 @0x80162E50 -- TODO (open, MAJOR): custom automapview[][] rasterizer, ~1000 raw insns.
 * NOT YET TRANSCRIBED -- see refs/m2c/automap.c lines 648-1254 for the m2c draft (leveltype==3
 * horizontal-run door/square/arch merge pass over automapview + draw_game_info-equivalent text via
 * MediumFont.Print, GOLDR/G/B, GetStr()).  Stubbed to keep the TU link-complete; every other function
 * in this TU is either sealed or has a concrete near-miss target. */
void DrawAutomap(void)
{
    /* Setup block transcribed from refs/m2c/automap.c:791-835 (AMPlayerX/Y + per-player AMPx/AMPy
     * split-screen offsets) -- structurally complete but NOT YET byte-verified in isolation.
     * The leveltype==3 / else run-merge rasterizer bodies (refs/m2c/automap.c:836-1148, ~650 raw
     * insns) and the draw_game_info-equivalent text tail (refs/m2c/automap.c:1148-1254) are TODO. */
    if (PauseMode == 0 && (plr[0].plractive || plr[1].plractive)) {
        int a1, a2, a3, t0;

        D_8011C36C = CBlocks::GetOverlayOtBase();
        a1 = plr[0]._px - 0x10;
        a2 = plr[0]._py - 0x10;
        a3 = plr[1]._px - 0x10;
        t0 = plr[1]._py - 0x10;

        if (!plr[1].plractive) {
            AMPlayerX = (a1 - a2) * 2;
            AMPlayerY = a1 + a2;
            AMPx[0] = 0;
            AMPy[0] = 0;
        } else if (!plr[0].plractive) {
            AMPlayerX = (a3 - t0) * 2;
            AMPlayerY = a3 + t0;
            AMPx[1] = 0;
            AMPy[1] = 0;
        } else {
            int mx, my;

            mx = (a1 + a3) >> 1;
            my = (a2 + t0) >> 1;
            AMPlayerX = (mx - my) * 2;
            AMPlayerY = mx + my;
            AMPx[0] = (a1 - mx) * 2;
            AMPy[0] = (a2 - my) * 2;
            AMPx[1] = (a3 - mx) * 2;
            AMPy[1] = (t0 - my) * 2;
        }

        {
            int lo, lo2;

            lo = AMPlayerX * AutoMapScale;
            lo2 = AMPlayerY * AutoMapScale;
            AMPlayerX = (AutoMapXOfs + 0xA0) - (lo >> 1);
            AMPlayerY = (AutoMapYOfs + 0x64) - (lo2 >> 1);
        }

        if (leveltype == 3) {
            /* TODO (open): the horizontal wall/door/grate/arch run-merge pass over
             * automapview[][]/dungeon[][]/automaptype[]/AmRTab[] for the 40x40 visible window --
             * refs/m2c/automap.c:836-1077. */
        } else {
            /* TODO (open): the leveltype!=3 sibling pass using AmLTab[] +
             * DrawAutoMapStairs/HorzDoor/HorzGrate/DrawHorzArch -- refs/m2c/automap.c:1078-1148. */
        }
    }

    DrawAutomapPlr();

    /* TODO (open): draw_game_info-equivalent tail (MediumFont.Print/GetStr/sprintf/GOLDR,G,B) --
     * refs/m2c/automap.c:1148-1254. */
}
