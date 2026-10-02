/* LIGHTING.CPP -- Diablo PSX (Climax 1998) reconstruction (main image).
 * Twin: refs/devilution/Source/lighting.cpp for the generic light/vision LIST management
 * (AddLight, the Change-light/vision setters, Process(Light|Vision)List, InitLighting, InitVision,
 * AddVision, the Change-vision setters, DoUnVision) --
 * these match the PC 1.09 shape closely (minus the lightflag/dolighting/undo-tracking PC keeps
 * for Light; PSX drops that bookkeeping for LightList entirely -- Change*() write the fields
 * directly, no lightflag guard, no _lunflag/_lunx/_luny/_lunr history kept for lights).
 * DoLighting/DoVision/DoUnLight/MakeLightTable/veclen2/set_light_bands/SetLightFX/SetWeirdFX are
 * PSX-ONLY: Climax replaced the PC's greyscale dLight[]/lightblock[] radius engine with a
 * dynamic COLOURED light engine (dung_map_r/g/b[56][56], a packed-bitfield nRadius encoding
 * colour_mask/shift_mask/weirdy/cont, and a screen-space "weird cheat" colour-cycle effect) --
 * there is no PC source for these; they are transcribed directly from the oracle disassembly. */
#include "diabpsx_types.h"
#include "source/gen/structs_lighting.h"
#include "source/gen/externs_lighting.h"
#include "source/gen/protos_lighting.h"
#include "source/diablo.h"

#define MAXLIGHTS 80
#define MAXVISION 32

/* PSX-only per-call-persistent state for the coloured light engine (all gp-rel D_<va> in the
 * oracle, none exported/named in the SYM -- file-owned tentative defs per the gp-rel lever). */
static int disp_tab_r;    /* @D_8011C7E4: SetLightFX's d_r<<8 (dest-red target, accumulated by weird-cheat) */
static int dispy_r;    /* @D_8011C7E8: SetLightFX's s_r (signed source-red delta) */
static int disp_tab_g;    /* @D_8011C7EC: SetLightFX's d_g<<8 */
static int dispy_g;    /* @D_8011C7F0: SetLightFX's s_g */
static int disp_tab_b;    /* @D_8011C7F4: SetLightFX's d_b<<8 */
static int dispy_b;    /* @D_8011C7F8: SetLightFX's s_b */
int g_light_amp;      /* @D_8011C7FC: per-DoLighting-call colour amplitude (from D_800D62E0[radius]) */
int g_light_amp2;     /* @D_8011C800: per-DoLighting-call secondary amplitude (from D_800D62F0[radius]) */
int g_light_clamp;    /* @D_8011C804: per-DoLighting-call colour clamp ceiling */
int g_weirdy_prev;    /* @D_8011C7E0: last weirdy flag DoLighting saw (drives the once-only weird-cheat gate) */
int g_lightband_mask;   /* @D_8011C7DC: set_light_bands' circular-buffer mask (0x7F; stored as a full word) */
unsigned char g_lightband[192];  /* @D_8012ED58: set_light_bands' gradient band table (BSS) */

/* per-radius colour amplitude curves (0..15), read via D_800D62E0[radius]/D_800D62F0[radius] */
static signed char D_800D62E0[16] = { -1, 24, 26, 29, 32, 35, 37, 40, 43, 46, 49, 51, 54, 57, 60, 64 };
static signed char D_800D62F0[16] = { -1, 2, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 3, 2, 2, 2 };

int AddLight(int x, int y, int r);
void ChangeLightColour(int i, int c);
void DoLighting(int nXPos, int nYPos, int nRadius, int Lnum);
void DoUnLight(void);
void DoUnVision(int nXPos, int nYPos, int nRadius, int num);
void DoVision(int nXPos, int nYPos, int nRadius, unsigned char doautomap, unsigned char visible);
void SetAutomapView(int x, int y);

/* LIGHTING.CPP OWNS these (reaches them via %gp_rel here; other TUs like missiles.cpp reach them
 * absolute -- methodology lever #6, gp-rel ownership by tentative definition). */
int weird_cheat;
int restore_r;
int restore_g;
int restore_b;
int numlights;
int numvision;
unsigned char dovision;
int visionid;
char lightmax;

int veclen2(int ix, int iy)
{
    int t;

    ix = ix < 0 ? -ix : ix;
    iy = iy < 0 ? -iy : iy;
    if (ix < iy) {
        ix ^= iy;
        iy ^= ix;
        ix ^= iy;
    }
    t = iy + (iy >> 1);
    return ix - (ix >> 5) - (ix >> 7) + (t >> 2) + (t >> 6);
}

void set_light_bands(void)
{
    int v, y;
    unsigned char *l;

    y = 0;
    l = g_lightband;
    v = 0x7E;
    g_lightband_mask = 0x7F;
    g_light_clamp = 0x80;
    do {
        *l++ = 0;
    } while (--v >= 0);
    l = g_lightband;
    v = 0x1F;
    do {
        *l = y;
        y++;
        l++;
    } while (--v >= 0);
    v = 0x1F;
    do {
        *l = y;
        y--;
        l++;
    } while (--v >= 0);
}

void SetLightFX(int x, int y, short s_r, short s_g, short s_b, unsigned char d_r, unsigned char d_g, unsigned char d_b)
{
    disp_tab_r = d_r << 8;
    disp_tab_g = d_g << 8;
    disp_tab_b = d_b << 8;
    dispy_r = s_r;
    dispy_g = s_g;
    dispy_b = s_b;
    AddLight(x, y, 0x6070);
}

void SetWeirdFX(void)
{
    if (weird_cheat)
        return;

    disp_tab_r = 0x4000;
    disp_tab_g = 0x2000;
    disp_tab_b = 0x1000;
    dispy_r = 0xA80;
    dispy_g = -0xA10;
    restore_b = 0;
    restore_g = 0;
    restore_r = 0;
    dispy_b = 0xAA0;
    ChangeLightColour(plr[0]._plid, 0xE070);
    weird_cheat = 1;
}

/* @0x8004BE20 -- PSX-only coloured radial light-fill (no PC twin). All four paint arms are written from
 * the oracle: clipped/unclipped x shift_mask==0/!=0. Parameters are reused as loop rows/columns
 * (arm A: nYPos = block_y + y per row; arm B: rows counted in nYPos with y = nYPos copied at the row head and the loads indexed through y; unclipped arms: nYPos walks beside the y counter).
 * dist_y is set inside the x loop (retail computes it after the inner entry test). The shake jitter
 * (two GU_GetRnd calls) is dead in this build: shake is the constant 1.
 * NEAR-MISS: 812/821 insns; the remaining gap is register allocation, caller-save slots and the plr[0]
 * preload -- see the report. */
void DoLighting(int nXPos, int nYPos, int nRadius, int Lnum)
{
    int xoff, yoff;
    int x, y;
    int v;
    int colour_mask, shift_mask, shake;
    int light_x, light_y;
    int block_x, block_y;
    int dist_y;
    int max_x;
    int mult, mult_st;
    int radius_block;
    int scr_x, scr_y;
    int temp_x, temp_y;
    int weirdy, cont;
    int p0 = plr[0].plractive;   /* unused carrier: retail loads plr[0].plractive in the entry block; an unused initialised local leaves no SYM record and cse propagates it into the leveltype==3 test */

    xoff = 0;
    yoff = 0;
    colour_mask = (nRadius >> 4) & 7;
    shift_mask = (nRadius >> 7) & 0x3F;
    shake = 1;
    weirdy = (nRadius >> 14) & 1;
    if (!weirdy && g_weirdy_prev == 1)
        return;
    if (weirdy == 1)
        g_weirdy_prev = weirdy;
    cont = (nRadius >> 15) & 1;
    nRadius &= 0xF;
    if (leveltype == 3) {
        if (plr[0].plractive && Lnum == plr[0]._plid)
            nRadius = 10;
        if (plr[1].plractive && Lnum == plr[1]._plid)
            nRadius = 10;
    }
    nRadius += light_level[leveltype];
    if (nRadius > 15)
        nRadius = 15;
    g_light_amp = D_800D62E0[nRadius];
    g_light_amp2 = D_800D62F0[nRadius];
    if (weirdy) {
        g_light_amp = 0x40;
        g_light_amp2 = 4;
        g_light_clamp = 0xFF;
        disp_tab_r += dispy_r;
        disp_tab_g += dispy_g;
        disp_tab_b += dispy_b;
        if (!cont && disp_tab_r > 0xC800) {
            g_weirdy_prev = 0;
            LightList[Lnum]._ldel = 1;
            g_light_clamp = 0x80;
            return;
        }
    }
    if (Lnum >= 0) {
        xoff = LightList[Lnum]._xoff + 8;
        yoff = LightList[Lnum]._yoff + 8;
    }
    if (leveltype) {
        nXPos = (nXPos - 16) / 2;
        nYPos = (nYPos - 16) / 2;
        light_x = ((nXPos << 4) | xoff) - 8;
        light_y = ((nYPos << 4) | yoff) - 8;
    } else {
        nXPos = (nXPos + 2) / 2 - 2;
        nYPos = (nYPos + 2) / 2 - 2;
        light_x = ((nXPos << 4) | xoff) + 4;
        light_y = ((nYPos << 4) | yoff) + 4;
    }
    if (nRadius < 0)
        return;
    if (!shake) {
        light_x += GU_GetRnd() & 1;
        light_y += GU_GetRnd() & 1;
    }
    temp_x = nXPos;
    temp_y = nYPos;
    block_x = nXPos - (g_light_amp >> 4);
    block_y = nYPos - (g_light_amp >> 4);
    scr_x = (gr_scrxoff >> 16) / 40 - 2;
    scr_y = (gr_scryoff >> 16) / 40 - 8;
    if (!leveltype) {
        temp_x -= 6;
        temp_y -= 8;
    }
    if (scr_x < temp_x + 8 && temp_x < scr_x + 8 && scr_y < temp_y + 8 && temp_y < scr_y + 8) {
        max_x = 48;
        radius_block = g_light_amp >> 3;
        if (block_y < 0 || block_y + radius_block > max_x || block_x < 0 || block_x + radius_block > max_x) {
            if (!shift_mask) {
                for (y = 0; y <= radius_block; y++) {
                    nYPos = block_y + y;
                    if (nYPos >= 0) if (nYPos < 48) {
                        for (x = 0; x <= radius_block; x++) {
                            dist_y = light_y - ((nYPos) << 4);
                            mult_st = g_light_amp - veclen2(light_x - ((block_x + x) << 4), dist_y);
                            if (mult_st < 0)
                                mult_st = 0;
                            if (block_x + x >= 0 && block_x + x < max_x) {
                                if (colour_mask & 1) {
                                    if (weirdy)
                                        mult = g_lightband[(mult_st + (disp_tab_r >> 8)) & g_lightband_mask] * g_light_amp2;
                                    else
                                        mult = mult_st * g_light_amp2;
                                    v = dung_map_r[block_x + x][nYPos] + (mult & 0xFF);
                                    if (v > g_light_clamp)
                                        v = g_light_clamp;
                                    dung_map_r[block_x + x][nYPos] = v;
                                }
                                if (colour_mask & 2) {
                                    if (weirdy)
                                        mult = g_lightband[(mult_st + (disp_tab_g >> 8)) & g_lightband_mask] * g_light_amp2;
                                    else
                                        mult = mult_st * g_light_amp2;
                                    v = dung_map_g[block_x + x][nYPos] + (mult & 0xFF);
                                    if (v > g_light_clamp)
                                        v = g_light_clamp;
                                    dung_map_g[block_x + x][nYPos] = v;
                                }
                                if (colour_mask & 4) {
                                    if (weirdy)
                                        mult = g_lightband[(mult_st + (disp_tab_b >> 8)) & g_lightband_mask] * g_light_amp2;
                                    else
                                        mult = mult_st * g_light_amp2;
                                    v = dung_map_b[block_x + x][nYPos] + (mult & 0xFF);
                                    if (v > g_light_clamp)
                                        v = g_light_clamp;
                                    dung_map_b[block_x + x][nYPos] = v;
                                }
                            }
                        }
                    }
                }
            } else {
                for (nYPos = block_y; nYPos <= block_y + radius_block; nYPos++) {
                    if (nYPos >= 0) if (nYPos < 48) {
                        y = nYPos;
                        for (x = 0; x <= radius_block; x++) {
                            dist_y = light_y - ((nYPos) << 4);
                            mult = (g_light_amp - veclen2(light_x - ((block_x + x) << 4), dist_y)) * g_light_amp2;
                            if (mult < 0)
                                mult = 0;
                            if (block_x + x >= 0 && block_x + x < max_x) {
                                v = dung_map_r[block_x + x][y];
                                if (colour_mask & 1) {
                                    if (!(shift_mask & 0x9)) {
                                        v += mult;
                                    } else {
                                        if (shift_mask & 1)
                                            v += mult >> 1;
                                        if (shift_mask & 0x8)
                                            v += mult * 2;
                                    }
                                    if (v > g_light_clamp)
                                        v = g_light_clamp;
                                    dung_map_r[block_x + x][nYPos] = v;
                                }
                                v = dung_map_g[block_x + x][y];
                                if (colour_mask & 2) {
                                    if (!(shift_mask & 0x12)) {
                                        v += mult;
                                    } else {
                                        if (shift_mask & 2)
                                            v += mult >> 1;
                                        if (shift_mask & 0x10)
                                            v += mult * 2;
                                    }
                                    if (v > g_light_clamp)
                                        v = g_light_clamp;
                                    dung_map_g[block_x + x][nYPos] = v;
                                }
                                v = dung_map_b[block_x + x][y];
                                if (colour_mask & 4) {
                                    if (!(shift_mask & 0x24)) {
                                        v += mult;
                                    } else {
                                        if (shift_mask & 4)
                                            v += mult >> 1;
                                        if (shift_mask & 0x20)
                                            v += mult * 2;
                                    }
                                    if (v > g_light_clamp)
                                        v = g_light_clamp;
                                    dung_map_b[block_x + x][nYPos] = v;
                                }
                            }
                        }
                    }
                }
            }
        } else if (!shift_mask) {
            nYPos = block_y;
            for (y = 0; y <= radius_block; y++, nYPos++) {
                for (x = 0; x <= radius_block; x++) {
                    dist_y = light_y - ((nYPos) << 4);
                    mult_st = g_light_amp - veclen2(light_x - ((block_x + x) << 4), dist_y);
                    if (mult_st < 0)
                        mult_st = 0;
                    if (colour_mask & 1) {
                        if (weirdy)
                            mult = g_lightband[(mult_st + (disp_tab_r >> 8)) & g_lightband_mask] * g_light_amp2;
                        else
                            mult = mult_st * g_light_amp2;
                        v = dung_map_r[block_x + x][nYPos] + (mult & 0xFF);
                        if (v > g_light_clamp)
                            v = g_light_clamp;
                        dung_map_r[block_x + x][nYPos] = v;
                    }
                    if (colour_mask & 2) {
                        if (weirdy)
                            mult = g_lightband[(mult_st + (disp_tab_g >> 8)) & g_lightband_mask] * g_light_amp2;
                        else
                            mult = mult_st * g_light_amp2;
                        v = dung_map_g[block_x + x][nYPos] + (mult & 0xFF);
                        if (v > g_light_clamp)
                            v = g_light_clamp;
                        dung_map_g[block_x + x][nYPos] = v;
                    }
                    if (colour_mask & 4) {
                        if (weirdy)
                            mult = g_lightband[(mult_st + (disp_tab_b >> 8)) & g_lightband_mask] * g_light_amp2;
                        else
                            mult = mult_st * g_light_amp2;
                        v = dung_map_b[block_x + x][nYPos] + (mult & 0xFF);
                        if (v > g_light_clamp)
                            v = g_light_clamp;
                        dung_map_b[block_x + x][nYPos] = v;
                    }
                }
            }
        } else {
            nYPos = block_y;
            for (y = 0; y <= radius_block; y++, nYPos++) {
                for (x = 0; x <= radius_block; x++) {
                    dist_y = light_y - ((nYPos) << 4);
                    mult = (g_light_amp - veclen2(light_x - ((block_x + x) << 4), dist_y)) * g_light_amp2;
                    if (mult < 0)
                        mult = 0;
                    v = dung_map_r[block_x + x][nYPos];
                    if (colour_mask & 1) {
                        if (!(shift_mask & 0x9)) {
                            v += mult;
                        } else {
                            if (shift_mask & 1)
                                v += mult >> 1;
                            if (shift_mask & 0x8)
                                v += mult * 2;
                        }
                        if (v > g_light_clamp)
                            v = g_light_clamp;
                        dung_map_r[block_x + x][nYPos] = v;
                    }
                    v = dung_map_g[block_x + x][nYPos];
                    if (colour_mask & 2) {
                        if (!(shift_mask & 0x12)) {
                            v += mult;
                        } else {
                            if (shift_mask & 2)
                                v += mult >> 1;
                            if (shift_mask & 0x10)
                                v += mult * 2;
                        }
                        if (v > g_light_clamp)
                            v = g_light_clamp;
                        dung_map_g[block_x + x][nYPos] = v;
                    }
                    v = dung_map_b[block_x + x][nYPos];
                    if (colour_mask & 4) {
                        if (!(shift_mask & 0x24)) {
                            v += mult;
                        } else {
                            if (shift_mask & 4)
                                v += mult >> 1;
                            if (shift_mask & 0x20)
                                v += mult * 2;
                        }
                        if (v > g_light_clamp)
                            v = g_light_clamp;
                        dung_map_b[block_x + x][nYPos] = v;
                    }
                }
            }
        }
    }
}

/* Best-effort transcription from the oracle (PSX-only screen-space colour restore; no PC twin --
 * PC's DoUnLight(x,y,r) just copies dPreLight back over dLight, this build's DoUnLight(void)
 * instead re-paints the visible screen rect of dung_map_r/g/b back to restore_r/g/b). The clip
 * block below was re-derived instruction-by-instruction from asm/nonmatchings/lighting/DoUnLight__Fv.s
 * (the earlier if/goto guess is gone): the oracle's 6-branch sequence reduces to "if the whole
 * 13x14 tile is already in [0,0x30] bounds, paint it unconditionally (X outer, Y inner, matching
 * dung_map_r/g/b[x][y]'s row-major layout); otherwise paint with a per-tile bounds check" -- one
 * of the branches in the oracle's sequence (comparing X+13 against X itself) is PROVABLY always
 * false and never taken, confirmed algebraically, so it is omitted here as genuine dead code, not
 * an approximation. Still not byte-verified past this structural derivation. */
void DoUnLight(void)
{
    int x, y, max_x, max_y, nXPos, nYPos;
    unsigned char *r, *g, *b;
    int radius_block_x, radius_block_y;

    nXPos = (gr_scrxoff >> 16) / 40 - 9;
    nYPos = (gr_scryoff >> 16) / 40 - 13;
    if (!leveltype) {
        nXPos = (gr_scrxoff >> 16) / 40 - 1;
        nYPos = (gr_scryoff >> 16) / 40 - 5;
    }
    radius_block_x = 13;
    radius_block_y = 14;
    max_x = 48;
    max_y = 48;
    if (nYPos < 0 || nYPos + radius_block_y > max_y || nXPos < 0 || nXPos + radius_block_x > max_y) {
        for (x = nXPos; x <= nXPos + radius_block_x; x++) {
            for (y = nYPos; y <= nYPos + radius_block_y; y++) {
                if (x >= 0 && x <= max_x && y >= 0 && y <= max_y) {
                    dung_map_r[x][y] = restore_r;
                    dung_map_g[x][y] = restore_g;
                    dung_map_b[x][y] = restore_b;
                }
            }
        }
    } else {
        for (x = nXPos; x <= nXPos + radius_block_x; x++) {
            r = &dung_map_r[x][nYPos];
            g = &dung_map_g[x][nYPos];
            b = &dung_map_b[x][nYPos];
            for (y = nYPos; y <= nYPos + radius_block_y; y++) {
                *r++ = restore_r;
                *g++ = restore_g;
                *b++ = restore_b;
            }
        }
    }
}

void DoUnVision(int nXPos, int nYPos, int nRadius, int num)
{
    int i, j, x1, y1, x2, y2;
    int vis_flag;

    switch (num) {
    case 0:
        vis_flag = 1;
        break;
    case 1:
        vis_flag = 2;
        break;
    default:
        vis_flag = 3;
        break;
    }
    nRadius++;
    y1 = nYPos - nRadius;
    y2 = nYPos + nRadius;
    x1 = nXPos - nRadius;
    x2 = nXPos + nRadius;
    if (y1 < 0)
        y1 = 0;
    if (y2 > 0x60)
        y2 = 0x60;
    if (x1 < 0)
        x1 = 0;
    if (x2 > 0x60)
        x2 = 0x60;
    for (i = x1; i < x2; i++) {
        for (j = y1; j < y2; j++) {
            if ((dung_map[i][j].dFlags & 1) && (dung_map[i][j].dFlags & 2))
                dung_map[i][j].dFlags &= ~vis_flag;
            else
                dung_map[i][j].dFlags &= ~(vis_flag | 4);
        }
    }
}

/* CORRECTION (this pass): the earlier note was wrong -- the oracle DOES use vCrawlTable/RadiusAdj
 * (confirmed via `lui %hi(vCrawlTable)`/`lui %hi(RadiusAdj)` in the raw .s and their real EXT
 * symbols in configs/symbol_addrs.txt, size 0x2B2=23*30 and 0x17=23). DoVision is in fact devilution's
 * SAME crawl-radius/vCrawlTable algorithm (GetBLOCK__Fii here plays the role of PC's
 * nBlockTable[dPiece[x][y]]), just with PSX's dung_map[][].dFlags field access and a different
 * dFlags bit layout (the oracle ORs in `(visible+1)|4` unconditionally rather than PC's separate
 * BFLAG_LIT/BFLAG_VISIBLE bits -- transcribed literally, not mapped to PC bit names). Data tables
 * copied verbatim from refs/devilution/Source/lighting.cpp (byte-for-byte game data, not prose).
 * Structural draft built from the devilution twin + the raw oracle; NOT YET byte-verified.
 * OWNERSHIP: vCrawlTable/RadiusAdj are addressed ABSOLUTE (`hi()/lo()`, not %gp_rel) in this TU's
 * own oracle AND in missiles.cpp's oracle (which already `extern`s vCrawlTable, non-static) --
 * defined here (non-static, real initializer) as the true owner; missiles.cpp's existing extern
 * decl is unchanged and now resolves against this definition. */
BOOL GetBLOCK(int x, int y);

unsigned char vCrawlTable[23][30] = {
    { 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 0, 11, 0, 12, 0, 13, 0, 14, 0, 15, 0 },
    { 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 1, 9, 1, 10, 1, 11, 1, 12, 1, 13, 1, 14, 1, 15, 1 },
    { 1, 0, 2, 0, 3, 0, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 1, 11, 1, 12, 2, 13, 2, 14, 2, 15, 2 },
    { 1, 0, 2, 0, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 2, 9, 2, 10, 2, 11, 2, 12, 2, 13, 3, 14, 3, 15, 3 },
    { 1, 0, 2, 1, 3, 1, 4, 1, 5, 1, 6, 2, 7, 2, 8, 2, 9, 3, 10, 3, 11, 3, 12, 3, 13, 4, 14, 4, 0, 0 },
    { 1, 0, 2, 1, 3, 1, 4, 1, 5, 2, 6, 2, 7, 3, 8, 3, 9, 3, 10, 4, 11, 4, 12, 4, 13, 5, 14, 5, 0, 0 },
    { 1, 0, 2, 1, 3, 1, 4, 2, 5, 2, 6, 3, 7, 3, 8, 3, 9, 4, 10, 4, 11, 5, 12, 5, 13, 6, 14, 6, 0, 0 },
    { 1, 1, 2, 1, 3, 2, 4, 2, 5, 3, 6, 3, 7, 4, 8, 4, 9, 5, 10, 5, 11, 6, 12, 6, 13, 7, 0, 0, 0, 0 },
    { 1, 1, 2, 1, 3, 2, 4, 2, 5, 3, 6, 4, 7, 4, 8, 5, 9, 6, 10, 6, 11, 7, 12, 7, 12, 8, 13, 8, 0, 0 },
    { 1, 1, 2, 2, 3, 2, 4, 3, 5, 4, 6, 5, 7, 5, 8, 6, 9, 7, 10, 7, 10, 8, 11, 8, 12, 9, 0, 0, 0, 0 },
    { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 5, 7, 6, 8, 7, 9, 8, 10, 9, 11, 9, 11, 10, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 9, 11, 10, 11, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 5, 7, 6, 8, 7, 9, 7, 10, 8, 10, 8, 11, 9, 12, 0, 0, 0, 0 },
    { 1, 1, 1, 2, 2, 3, 2, 4, 3, 5, 4, 6, 4, 7, 5, 8, 6, 9, 6, 10, 7, 11, 7, 12, 8, 12, 8, 13, 0, 0 },
    { 1, 1, 1, 2, 2, 3, 2, 4, 3, 5, 3, 6, 4, 7, 4, 8, 5, 9, 5, 10, 6, 11, 6, 12, 7, 13, 0, 0, 0, 0 },
    { 0, 1, 1, 2, 1, 3, 2, 4, 2, 5, 3, 6, 3, 7, 3, 8, 4, 9, 4, 10, 5, 11, 5, 12, 6, 13, 6, 14, 0, 0 },
    { 0, 1, 1, 2, 1, 3, 1, 4, 2, 5, 2, 6, 3, 7, 3, 8, 3, 9, 4, 10, 4, 11, 4, 12, 5, 13, 5, 14, 0, 0 },
    { 0, 1, 1, 2, 1, 3, 1, 4, 1, 5, 2, 6, 2, 7, 2, 8, 3, 9, 3, 10, 3, 11, 3, 12, 4, 13, 4, 14, 0, 0 },
    { 0, 1, 0, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 2, 8, 2, 9, 2, 10, 2, 11, 2, 12, 3, 13, 3, 14, 3, 15 },
    { 0, 1, 0, 2, 0, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 1, 11, 2, 12, 2, 13, 2, 14, 2, 15 },
    { 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 1, 8, 1, 9, 1, 10, 1, 11, 1, 12, 1, 13, 1, 14, 1, 15 },
    { 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 0, 11, 0, 12, 0, 13, 0, 14, 0, 15 },
};

unsigned char RadiusAdj[23] = { 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 4, 3, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0 };

void DoVision(int nXPos, int nYPos, int nRadius, unsigned char doautomap, unsigned char visible)
{
    int nCrawlX = 0, nCrawlY = 0;
    int nLineLen;
    int nBlockerFlag;
    int i, j, k, v;
    int x1adj, x2adj, y1adj, y2adj;
    int vis_flag;

    vis_flag = visible + 1;
    if (nXPos >= 0 && nXPos <= 96 && nYPos >= 0 && nYPos <= 96) {
        if (doautomap) {
            if (dung_map[nXPos][nYPos].dFlags >= 0)
                SetAutomapView(nXPos, nXPos);
            dung_map[nXPos][nYPos].dFlags |= 0x80;
        }
        dung_map[nXPos][nYPos].dFlags = dung_map[nXPos][nYPos].dFlags | vis_flag | 4;
    }
    for (k = 0; k < 4; k++) {
        for (j = 0; j < 23; j++) {
            nBlockerFlag = 0;
            nLineLen = (nRadius - RadiusAdj[j]) << 1;
            for (i = 0; i < nLineLen && !nBlockerFlag; i += 2) {
                x1adj = 0;
                x2adj = 0;
                y1adj = 0;
                y2adj = 0;
                switch (k) {
                case 0:
                    nCrawlX = nXPos + vCrawlTable[j][i];
                    nCrawlY = nYPos + vCrawlTable[j][i + 1];
                    if (vCrawlTable[j][i] && vCrawlTable[j][i + 1]) {
                        x1adj = -1;
                        y2adj = -1;
                    }
                    break;
                case 1:
                    nCrawlX = nXPos - vCrawlTable[j][i];
                    nCrawlY = nYPos - vCrawlTable[j][i + 1];
                    if (vCrawlTable[j][i] && vCrawlTable[j][i + 1]) {
                        y1adj = 1;
                        x2adj = 1;
                    }
                    break;
                case 2:
                    nCrawlX = nXPos + vCrawlTable[j][i];
                    nCrawlY = nYPos - vCrawlTable[j][i + 1];
                    if (vCrawlTable[j][i] && vCrawlTable[j][i + 1]) {
                        x1adj = -1;
                        y2adj = 1;
                    }
                    break;
                case 3:
                    nCrawlX = nXPos - vCrawlTable[j][i];
                    nCrawlY = nYPos + vCrawlTable[j][i + 1];
                    if (vCrawlTable[j][i] && vCrawlTable[j][i + 1]) {
                        y1adj = -1;
                        x2adj = 1;
                    }
                    break;
                }
                if (nCrawlX >= 0 && nCrawlX <= 96 && nCrawlY >= 0 && nCrawlY <= 96) {
                    nBlockerFlag = GetBLOCK(nCrawlX, nCrawlY);
                    if (!GetBLOCK(nCrawlX + x1adj, nCrawlY + y1adj) || !GetBLOCK(nCrawlX + x2adj, nCrawlY + y2adj)) {
                        if (doautomap) {
                            if (dung_map[nCrawlX][nCrawlY].dFlags >= 0) {
                                SetAutomapView(nCrawlX, nCrawlY);
                                SetAutomapView(nCrawlX + 1, nCrawlY);
                            }
                            dung_map[nCrawlX][nCrawlY].dFlags |= 0x80;
                        }
                        dung_map[nCrawlX][nCrawlY].dFlags = dung_map[nCrawlX][nCrawlY].dFlags | vis_flag | 4;
                        if (!nBlockerFlag) {
                            v = dung_map[nCrawlX][nCrawlY].dTransVal;
                            if (v != 0)
                                TransList[v] = 1;
                        }
                    }
                }
            }
        }
    }
}

void FreeLightTable(void)
{
}

void InitLightTable(void)
{
}

void MakeLightTable(void)
{
}

void InitLightMax(void)
{
    if (light4flag)
        lightmax = 3;
    else
        lightmax = -0x80;
}

void InitLighting(void)
{
    int i;

    numlights = 0;
    for (i = 0; i < MAXLIGHTS; i++)
        lightactive[i] = i;
    set_light_bands();
    g_weirdy_prev = 0;
}

int AddLight(int x, int y, int r)
{
    int lid;
    struct LightListStruct2 *ll;

    lid = -1;
    if (numlights < MAXLIGHTS) {
        lid = lightactive[numlights++];
        ll = &LightList[lid];
        ll->_lx = x;
        ll->_ly = y;
        ll->_lradius = r;
        ll->_xoff = 0;
        ll->_yoff = 0;
        ll->_ldel = 0;
    }
    return lid;
}

void AddUnLight(int i)
{
    if (i == -1)
        return;
    LightList[i]._ldel = 1;
}

void ChangeLightRadius(int i, int r)
{
    if (i == -1)
        return;
    LightList[i]._lradius = r;
}

void ChangeLightXY(int i, int x, int y)
{
    struct LightListStruct2 *ll;

    ll = &LightList[i];
    if (i == -1)
        return;
    ll->_lx = x;
    ll->_ly = y;
}

void light_fix(int i)
{
}

void ChangeLightOff(int i, int x, int y)
{
    struct LightListStruct2 *ll;

    if (i == -1)
        return;
    ll = &LightList[i];
    ll->_xoff = x;
    ll->_yoff = y;
}

void ChangeLight(int i, int x, int y, int r)
{
    struct LightListStruct2 *ll;

    if (i == -1)
        return;
    ll = &LightList[i];
    ll->_lx = x;
    ll->_ly = y;
    ll->_lradius = r;
}

void ChangeLightColour(int i, int c)
{
    struct LightListStruct2 *ll;

    ll = &LightList[i];
    ll->_lradius = (ll->_lradius & 0xF) | c;
}

void ProcessLightList(void)
{
    int i, j;
    unsigned char temp;
    struct LightListStruct2 *ll;

    DoUnLight();
    for (j = 0; j < numlights; j++) {
        i = lightactive[j];
        ll = &LightList[i];
        if (!ll->_ldel)
            DoLighting(ll->_lx, ll->_ly, ll->_lradius, i);
    }
    for (j = 0; j < numlights;) {
        i = lightactive[j];
        ll = &LightList[i];
        if (ll->_ldel) {
            temp = lightactive[--numlights];
            lightactive[numlights] = lightactive[j];
            lightactive[j] = temp;
        } else
            j++;
    }
}

void SavePreLighting(void)
{
}

void InitVision(void)
{
    int i;

    numvision = 0;
    dovision = 0;
    visionid = 1;
    for (i = 0; i < TransVal; i++)
        TransList[i] = 0;
}

int AddVision(int x, int y, int r, unsigned char mine)
{
    int vid = 0;

    if (numvision < MAXVISION) {
        struct LightListStruct *vl;

        vl = &VisionList[numvision];
        vl->_lx = x;
        vl->_ly = y;
        vl->_lradius = r;
        vid = visionid++;
        vl->_lid = vid;
        vl->_ldel = 0;
        vl->_lunflag = 0;
        vl->_lflags = mine;
        numvision++;
        dovision = 1;
    }
    return vid;
}

void ChangeVisionRadius(int id, int r)
{
    int i;

    for (i = 0; i < numvision; i++) {
        if (VisionList[i]._lid == id) {
            VisionList[i]._lunflag = 1;
            VisionList[i]._lunx = VisionList[i]._lx;
            VisionList[i]._luny = VisionList[i]._ly;
            VisionList[i]._lunr = VisionList[i]._lradius;
            VisionList[i]._lradius = r;
            dovision = 1;
        }
    }
}

void ChangeVisionXY(int id, int x, int y)
{
    int i;
    struct LightListStruct *vl;

    vl = VisionList;
    for (i = 0; i < numvision; i++) {
        if (vl->_lid == id) {
            vl->_lunflag = 1;
            vl->_lunx = vl->_lx;
            vl->_luny = vl->_ly;
            vl->_lunr = vl->_lradius;
            vl->_lx = x;
            vl->_ly = y;
            dovision = 1;
        }
        vl++;
    }
}

void ProcessVisionList(void)
{
    int i;
    unsigned char delflag;
    struct LightListStruct *vl;

    if (dovision) {
        vl = VisionList;
        for (i = 0; i < numvision; vl++, i++) {
            if (vl->_ldel)
                DoUnVision(vl->_lx, vl->_ly, vl->_lradius, vl->_lflags);
            if (vl->_lunflag) {
                DoUnVision(vl->_lunx, vl->_luny, vl->_lunr, vl->_lflags);
                vl->_lunflag = 0;
            }
        }
        for (i = 0; i < TransVal; i++)
            TransList[i] = 0;
        vl = VisionList;
        for (i = 0; i < numvision; vl++, i++)
            if (!vl->_ldel)
                DoVision(vl->_lx, vl->_ly, vl->_lradius, 1, vl->_lflags);
        do {
            delflag = 0;
            vl = VisionList;
            for (i = 0; i < numvision; vl++, i++) {
                if (vl->_ldel) {
                    numvision--;
                    if (numvision > 0 && i != numvision)
                        *vl = VisionList[numvision];
                    delflag = 1;
                }
            }
        } while (delflag);
    }
    dovision = 0;
}
