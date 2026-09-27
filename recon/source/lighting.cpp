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
int g_lightfx_dr;    /* @D_8011C7E4: SetLightFX's d_r<<8 (dest-red target, accumulated by weird-cheat) */
int g_lightfx_sr;    /* @D_8011C7E8: SetLightFX's s_r (signed source-red delta) */
int g_lightfx_dg;    /* @D_8011C7EC: SetLightFX's d_g<<8 */
int g_lightfx_sg;    /* @D_8011C7F0: SetLightFX's s_g */
int g_lightfx_db;    /* @D_8011C7F4: SetLightFX's d_b<<8 */
int g_lightfx_sb;    /* @D_8011C7F8: SetLightFX's s_b */
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

    t = ix;
    if (t < 0)
        t = -t;
    ix = t;
    t = iy;
    if (t < 0)
        t = -t;
    iy = t;
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
    g_lightfx_sr = s_r;
    g_lightfx_sg = s_g;
    g_lightfx_db = d_b << 8;
    g_lightfx_dg = d_g << 8;
    g_lightfx_dr = d_r << 8;
    g_lightfx_sb = s_b;
    AddLight(x, y, 0x6070);
}

void SetWeirdFX(void)
{
    if (weird_cheat)
        return;

    g_lightfx_dr = 0x4000;
    g_lightfx_dg = 0x2000;
    g_lightfx_db = 0x1000;
    g_lightfx_sr = 0xA80;
    g_lightfx_sg = -0xA10;
    restore_b = 0;
    restore_g = 0;
    restore_r = 0;
    g_lightfx_sb = 0xAA0;
    ChangeLightColour(plr[myplr]._plid, 0xE070);
    weird_cheat = 1;
}

/* OPEN, INCOMPLETE -- PSX-only coloured radial light-fill; no PC twin (retail dropped the
 * crawl-table/lightblock approach devilution/hellfire both use and replaced it with a
 * colour_mask/shift_mask/weirdy/cont bitfield-packed nRadius + a per-screen-pixel dung_map_r/g/b
 * paint). Built incrementally from the skel m2c draft (skel/SOURCE/LIGHTING.CPP) + the raw oracle:
 * the header (bitfield unpack, radius/light_level/D_800D62E0+F0 lookup, the "weirdy" cheat-colour
 * override + early-return, the xoff/yoff/block_x/block_y screen-position setup, and the screen-
 * visibility clip test) plus ONE of the four inner paint arms (unclipped, shift_mask==0) are
 * transcribed below; the other three arms (clipped shift_mask==0, clipped shift_mask!=0, unclipped
 * shift_mask!=0) are TODO stubs -- see asm/nonmatchings/lighting/DoLighting__Fiiii.s for their
 * bodies (each is a near-twin of the implemented arm with an added per-channel shift_mask
 * sub-blend: bits 1/8 -> >>1 / *2 additions gated per channel). NOT YET BYTE-VERIFIED against the
 * oracle -- this is a structural draft, not a gated pass. Field-offset uncertainty flagged inline. */
void DoLighting(int nXPos, int nYPos, int nRadius, int Lnum)
{
    int xoff, yoff;
    int colour_mask, shift_mask, weirdy, cont;
    int radius;
    int amp_idx;
    int light_x, light_y;
    int block_x, block_y;
    int scr_x, scr_y;
    int v, max_x;
    int mult;
    int x, y;
    int radius_block;
    int val;

    xoff = 0;
    yoff = 0;
    colour_mask = (nRadius >> 4) & 7;
    shift_mask = (nRadius >> 7) & 0x3F;
    weirdy = (nRadius >> 0xE) & 1;

    if (weirdy || g_weirdy_prev != 1) {
        if (weirdy == 1)
            g_weirdy_prev = weirdy;
        radius = nRadius & 0xF;
        cont = (nRadius >> 0xF) & 1;
        if (leveltype == 3) {
            /* FIELD OFFSET UNCERTAIN: oracle reads plr+0x1D/plr+0x1A05 (== plr[1]+0x1D by struct
             * size) with NO myplr multiply -- i.e. it tests plr[0] and plr[1] directly (2-player
             * PSX split-screen?), not plr[myplr]. Named plractive/_ 1plid mechanically from the
             * struct layout; semantic role (co-op infra-vision boost?) not confirmed. */
            if (plr[0].plractive != 0 && Lnum == plr[0]._plid)
                radius = 0xA;
            if (plr[1].plractive != 0 && Lnum == plr[1]._plid)
                radius = 0xA;
        }
        amp_idx = radius + light_level[leveltype];
        if (amp_idx >= 0x10)
            amp_idx = 0xF;
        g_light_amp = D_800D62E0[amp_idx];
        g_light_amp2 = D_800D62F0[amp_idx];
        if (weirdy) {
            g_light_amp = 0x40;
            g_light_amp2 = 4;
            g_light_clamp = 0xFF;
            scr_x = g_lightfx_dr + g_lightfx_sr;
            g_lightfx_dr = scr_x;
            g_lightfx_dg += g_lightfx_sg;
            g_lightfx_db += g_lightfx_sb;
            if (!cont && scr_x > 0xC800) {
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
        if (leveltype != 0) {
            nXPos = (nXPos - 0x10) / 2;
            nYPos = (nYPos - 0x10) / 2;
            block_x = (nXPos * 0x10 | xoff) - 8;
            block_y = (nYPos * 0x10 | yoff) - 8;
        } else {
            nXPos = (nXPos + 2) / 2 - 2;
            nYPos = (nYPos + 2) / 2 - 2;
            block_x = (nXPos * 0x10 | xoff) + 4;
            block_y = (nYPos * 0x10 | yoff) + 4;
        }

        if (radius >= 0) {
            /* NOTE: the oracle's "shake"(GU_GetRnd jitter) arm is dead code in this build (the
             * gate that would enable it is a compiled-out `1==0`) -- omitted, matches retail. */
            x = nXPos;
            y = nYPos;
            v = gr_scrxoff / 2621440;
            light_y = y - (g_light_amp >> 4);
            max_x = gr_scryoff / 2621440;
            light_x = x - (g_light_amp >> 4);
            if (leveltype == 0) {
                x -= 6;
                y -= 8;
            }
            if ((v - 2) < (x + 8) && x < (v + 6) && (max_x - 8) < (y + 8) && y < max_x) {
                mult = g_light_amp >> 3;
                if (light_y < 0 || (light_y + mult) > 0x30 || light_x < 0 || (light_x + mult) > 0x30) {
                    if (shift_mask == 0) {
                        /* TODO clipped, shift_mask==0 arm -- see .L8004C1CC in the oracle. */
                    } else {
                        /* TODO clipped, shift_mask!=0 arm -- see .L8004C414 in the oracle. */
                    }
                } else if (shift_mask == 0) {
                    /* Unclipped arm, shift_mask==0 (implemented; not yet byte-verified). */
                    for (y = light_y; y < light_y + mult; y++) {
                        for (x = light_x; x < light_x + mult; x++) {
                            radius_block = g_light_amp - veclen2(block_x - x * 0x10, block_y - y * 0x10);
                            if (radius_block < 0)
                                radius_block = 0;
                            if (colour_mask & 1) {
                                if (weirdy)
                                    val = g_lightband[(radius_block + (g_lightfx_dr >> 8)) & g_lightband_mask] * g_light_amp2;
                                else
                                    val = radius_block * g_light_amp2;
                                val = dung_map_r[x][y] + (val & 0xFF);
                                if (val > g_light_clamp)
                                    val = g_light_clamp;
                                dung_map_r[x][y] = val;
                            }
                            if (colour_mask & 2) {
                                if (weirdy)
                                    val = g_lightband[(radius_block + (g_lightfx_dg >> 8)) & g_lightband_mask] * g_light_amp2;
                                else
                                    val = radius_block * g_light_amp2;
                                val = dung_map_g[x][y] + (val & 0xFF);
                                if (val > g_light_clamp)
                                    val = g_light_clamp;
                                dung_map_g[x][y] = val;
                            }
                            if (colour_mask & 4) {
                                if (weirdy)
                                    val = g_lightband[(radius_block + (g_lightfx_db >> 8)) & g_lightband_mask] * g_light_amp2;
                                else
                                    val = radius_block * g_light_amp2;
                                val = dung_map_b[x][y] + (val & 0xFF);
                                if (val > g_light_clamp)
                                    val = g_light_clamp;
                                dung_map_b[x][y] = val;
                            }
                        }
                    }
                } else {
                    /* Unclipped arm, shift_mask!=0 (from the m2c draft; it shows NO weirdy/
                     * g_lightband branch here -- plain radius_block blend with a per-channel
                     * shift_mask sub-select of >>1 / *2 additions). Not yet byte-verified. */
                    for (y = light_y; y < light_y + mult; y++) {
                        for (x = light_x; x < light_x + mult; x++) {
                            radius_block = g_light_amp - veclen2(block_x - x * 0x10, block_y - y * 0x10);
                            if (radius_block < 0)
                                radius_block = 0;
                            if (colour_mask & 1) {
                                val = dung_map_r[x][y];
                                if (!(shift_mask & 9)) {
                                    val += radius_block;
                                } else {
                                    if (shift_mask & 1)
                                        val += radius_block >> 1;
                                    if (shift_mask & 8)
                                        val += radius_block * 2;
                                }
                                if (val > g_light_clamp)
                                    val = g_light_clamp;
                                dung_map_r[x][y] = val;
                            }
                            if (colour_mask & 2) {
                                val = dung_map_g[x][y];
                                if (!(shift_mask & 0x12)) {
                                    val += radius_block;
                                } else {
                                    if (shift_mask & 2)
                                        val += radius_block >> 1;
                                    if (shift_mask & 0x10)
                                        val += radius_block * 2;
                                }
                                if (val > g_light_clamp)
                                    val = g_light_clamp;
                                dung_map_g[x][y] = val;
                            }
                            if (colour_mask & 4) {
                                val = dung_map_b[x][y];
                                if (!(shift_mask & 0x24)) {
                                    val += radius_block;
                                } else {
                                    if (shift_mask & 4)
                                        val += radius_block >> 1;
                                    if (shift_mask & 0x20)
                                        val += radius_block * 2;
                                }
                                if (val > g_light_clamp)
                                    val = g_light_clamp;
                                dung_map_b[x][y] = val;
                            }
                        }
                    }
                }
            }
        }
    }
}

/* Best-effort transcription from the oracle (PSX-only screen-space colour restore; no PC twin --
 * PC's DoUnLight(x,y,r) just copies dPreLight back over dLight, this build's DoUnLight(void)
 * instead re-paints the visible screen rect of dung_map_r/g/b back to restore_r/g/b). OPEN: bytes
 * not yet verified against the oracle -- transcribed straight from the disassembly's register flow,
 * not yet gated. */
void DoUnLight(void)
{
    int nXPos, nYPos, x, y, max_x, max_y;

    nXPos = ((gr_scrxoff >> 16) / 40) - 0x9;
    nYPos = ((gr_scryoff >> 16) / 40) - 0xD;
    if (leveltype == 0) {
        nXPos = ((gr_scrxoff >> 16) / 40) - 1;
        nYPos = ((gr_scryoff >> 16) / 40) - 5;
    }

    max_x = 0x30;
    max_y = 0x30;
    if (nYPos < 0) {
        if (nYPos + 0xE > max_y)
            return;
    } else if (nYPos + max_y < nXPos) {
        /* unreachable in practice -- literal transcription of the oracle's clip test */
    }
    if (nXPos < 0) {
        if (nXPos + 0xD <= max_x)
            goto negx;
        return;
    }

    for (x = nXPos; x < nXPos + 0xD; x++) {
        for (y = nYPos; y < nYPos + 0xE; y++) {
            if (x >= 0 && x < max_x && y >= 0 && y < max_y) {
                dung_map_r[x][y] = restore_r;
                dung_map_g[x][y] = restore_g;
                dung_map_b[x][y] = restore_b;
            }
        }
    }
    return;

negx:
    for (x = nXPos; x < nXPos + 0xD; x++) {
        for (y = nYPos; y < nYPos + 0xE; y++) {
            dung_map_r[x][y] = restore_r;
            dung_map_g[x][y] = restore_g;
            dung_map_b[x][y] = restore_b;
        }
    }
}

void DoUnVision(int nXPos, int nYPos, int nRadius, int num)
{
    int i, j, x1, y1, x2, y2;

    switch (num) {
    case 0:
        num = 1;
        break;
    case 1:
        num = 2;
        break;
    default:
        num = 3;
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
            if (dung_map[i][j].dFlags & 1) {
                if (dung_map[i][j].dFlags & 2)
                    dung_map[i][j].dFlags &= ~num;
                else
                    dung_map[i][j].dFlags &= ~(num | 4);
            } else {
                dung_map[i][j].dFlags &= ~(num | 4);
            }
        }
    }
}

/* OPEN -- PSX-only; the PC twin (devilution DoVision) uses the vCrawlTable/RadiusAdj crawl
 * algorithm which this build's oracle does NOT match (no vCrawlTable/RadiusAdj/nBlockTable refs in
 * the DoVision__FiiiUcUc oracle) -- not yet attempted. */
void DoVision(int nXPos, int nYPos, int nRadius, unsigned char doautomap, unsigned char visible)
{
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
    unsigned char *p;

    numlights = 0;
    i = 0x4F;
    p = &lightactive[0x4F];
    do {
        *p = i;
        i--;
        p--;
    } while (i >= 0);
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
    unsigned char *p;

    DoUnLight();
    for (i = 0; i < numlights; i++) {
        j = lightactive[i];
        ll = &LightList[j];
        if (!ll->_ldel)
            DoLighting(ll->_lx, ll->_ly, ll->_lradius, j);
    }
    i = 0;
    p = lightactive;
    while (i < numlights) {
        j = *p;
        ll = &LightList[j];
        if (ll->_ldel) {
            numlights--;
            temp = lightactive[numlights];
            lightactive[numlights] = *p;
            *p = temp;
        } else {
            i++;
            p++;
        }
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

    if (!dovision) {
        dovision = 0;
        return;
    }
    for (i = 0; i < numvision; i++) {
        vl = &VisionList[i];
        if (vl->_ldel)
            DoUnVision(vl->_lx, vl->_ly, vl->_lradius, vl->_lflags);
        if (vl->_lunflag) {
            DoUnVision(vl->_lunx, vl->_luny, vl->_lunr, 1);
            vl->_lunflag = 0;
        }
    }
    for (i = 0; i < TransVal; i++)
        TransList[i] = 0;
    for (i = 0; i < numvision; i++) {
        vl = &VisionList[i];
        if (!vl->_ldel)
            DoVision(vl->_lx, vl->_ly, vl->_lradius, 1, vl->_lflags);
    }
    do {
        delflag = 0;
        for (i = 0; i < numvision; i++) {
            if (VisionList[i]._ldel) {
                numvision--;
                if (numvision > 0 && i != numvision)
                    VisionList[i] = VisionList[numvision];
                delflag = 1;
            }
        }
    } while (delflag);
    dovision = 0;
}
