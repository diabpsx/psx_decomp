/* SPLTARGT.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/SPLTARGT.CPP).  No PC twin: the gamepad
 * spell-target cursor (SpellTarget, one per GamePad) and the spinning "arrow" task.
 * Sources: retail asm oracle (asm/nonmatchings/spltargt) > SYM (scratch/tuinfo.py SPLTARGT.CPP)
 * > refs/skeleton drafts.  Layouts: tools/symhdr.py -> psxsrc/gen/structs_spltargt.h. */
#include "diabpsx_types.h"
#include "psxsrc/gen/structs_spltargt.h"

#define TRUE  1
#define FALSE 0

/* ---- externs (tools/symhdr.py extern) ---- */
extern char offset_x[8];   /* @0x8011C2A8 */
extern char offset_y[8];   /* @0x8011C2B0 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern struct MonsterStruct monster[190];   /* @0x80105394 */
extern struct MissileStruct missile[125];   /* @0x80102C58 */
extern unsigned char invflag;   /* @0x8011C32C */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern int sel_data;   /* @0x8011B72C */
extern int myplr;   /* @0x8011BA08 */
extern unsigned char deathflag;   /* @0x8011BA0C */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern int _pcurs[2];   /* @0x8011B730 */

/* ---- prototypes (tools/symhdr.py proto; DrawSpinner narrowed to its mangling FiiUcUcUciiibiT8T8Uc) ---- */
CBlocks *BL_GetCurrentBlocks(void);   /* @0x800919EC BLOCK.CPP:2805 */
unsigned char CheckSpell(int id, int sn, char st, unsigned char manaonly);   /* @0x80077498 SPELLS.CPP:170 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
int AddLight(int x, int y, int r);   /* @0x8004D2E8 LIGHTING.CPP:1184 */
void ChangeLightOff(int i, int x, int y);   /* @0x8004D3B8 LIGHTING.CPP:1265 */
void NewCursor(int i);   /* @0x80037804 CURSOR.CPP:179 */
void AddUnLight(int i);   /* @0x8004D340 LIGHTING.CPP:1207 */
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross, BOOL iso, unsigned char SinStep);   /* @0x800A6A44 OPTIONS.CPP:898 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
CPad *PAD_GetPad(int PadNum, unsigned char both);   /* @0x800897F4 PADS.CPP:251 */
void ClrCursor(int num);   /* @0x80077F90 GAMEPAD.CPP:113 */
char GetPadStyle(int pnum);   /* @0x8007B07C GAMEPAD.CPP:2092 */
char pad_UpIsUpRight(int pval, char other);   /* @0x800784C0 GAMEPAD.CPP:351 */
unsigned char CheckRangeObject(int x, int y, int distance);   /* @0x800A3724 PADFUNCS.CPP:1267 */
unsigned char CanTalkToMonst(int m);   /* @0x8015694C MONSTER.CPP:5519 */
GamePad *GetGamePad(int pnum);   /* @0x8007AD2C GAMEPAD.CPP:1945 */
BOOL GLUE_Finished(void);   /* @0x8009BB04 GLUE.CPP:331 */
BOOL GLUE_GetShowGameScreenFlag(void);   /* @0x8009BB94 GLUE.CPP:383 */
extern "C" void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
extern "C" TASK *TSK_AddTask(unsigned long Id, void (*Main)(TASK *T), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
void ChangeLightXY(int i, int x, int y);   /* @0x8004D384 LIGHTING.CPP:1234 */
int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
void StartStand(int pnum, int dir);   /* @0x80066CA4 PLAYER.CPP:4683 */

/* @0x800CD650 (.data, no SYM record): spells that auto-target a monster */
static int AutoTargetSpells[12] = { 0x1D, 0x1E, 0x1F, 0x23, 0x24, 0x0C, 0x0F, 0x14, 0x01, 0x03, 0x06, 0x08 };

static BOOL IsAutoTarget(int Spell)
{
    for (int i = 0; i < 12; i++) {
        if (AutoTargetSpells[i] == Spell)
            return TRUE;
    }
    return FALSE;
}

static int GetXOff(int wx, int wy)
{
    int xo = ((wx & 7) - (wy & 7)) << 2;
    xo = (xo * 625) / 1000;
    return xo;
}

static int GetYOff(int wx, int wy)
{
    int yo = ((wx & 7) + (wy & 7) - 8) << 1;
    yo = (yo * 625) / 1000;
    return yo;
}

static void GetScrXY(int *wx, int *wy)
{
    CBlocks *gblocks = BL_GetCurrentBlocks();
    RECT R;
    int plx, ply, xo, x, y;

    if (gblocks) {
        plx = *wx;
        ply = *wy;
        xo = GetXOff(plx, ply);
        x = plx >> 3;
        y = ply >> 3;
        gblocks->GetScrXY(R, x * 20, y * 20, xo, GetYOff(plx, ply));
        *wx = R.x;
        *wy = R.y;
    }
}

void SpellTarget::ClearTrails(void)
{
    for (int i = 0; i < 8; i++) {
        lastx[i] = -1;
        lasty[i] = -1;
    }
}

void SpellTarget::Init(int plrn)
{
    pnum = plrn;
    player = &plr[plrn];
    if (player->_pSplType == 1) {
        if (!CheckSpell(pnum, player->_pSpell, 1, FALSE)) {
            if (player->_pSplType == 1) {
                int SplLvl = player->_pSplLvl[player->_pSpell] + player->_pISplLvlAdd;
                if (SplLvl == 0) {
                    if (player->_pClass == 0)
                        PlaySFX(0x2ED);
                    else if (player->_pClass == 1)
                        PlaySFX(0x27F);
                    else if (player->_pClass == 2)
                        PlaySFX(0x217);
                } else {
                    if (player->_pClass == 0)
                        PlaySFX(0x2F4);
                    else if (player->_pClass == 1)
                        PlaySFX(0x286);
                    else if (player->_pClass == 2)
                        PlaySFX(0x21E);
                }
            }
            return;
        }
    }
    active = TRUE;
    changed = TRUE;
    if (!forcespell) {
        _sx = _nsx = (player->_px + offset_x[player->_pdir]) << 3;
        _sy = _nsy = (player->_py + offset_y[player->_pdir]) << 3;
        ClearTrails();
    }
    if (spotid == -1)
        spotid = AddLight(_sx, _sy, pnum ? 0x12 : 0x42);
    ChangeLightOff(spotid, (_sx & 1) ? 4 : -4, (_sy & 1) ? 4 : -4);
    NewCursor(9);
    forcespell = 0;
}

void SpellTarget::Remove(void)
{
    active = FALSE;
    _pcurs[pnum] = 1;
    if (spotid != -1) {
        AddUnLight(spotid);
        spotid = -1;
    }
}

void SpellTarget::DrawArrow(int x1, int y1)
{
    int bright = 30;
    char r = pnum ? -1 : 127;
    char g = 127;
    char b = pnum ? 127 : -1;
    int otpos;

    if (!forcespell)
        otpos = CBlocks::GetOverlayOtBase();
    else
        otpos = 3;
    x1 -= 4;
    y1 += 4;
    for (int ni = 7; ni > 0; ni--) {
        lastx[ni] = lastx[ni - 1];
        lasty[ni] = lasty[ni - 1];
    }
    lastx[0] = x1;
    lasty[0] = y1;
    DrawSpinner(lastx[0], lasty[0], r, g, b, bright + 16, 40, angle, FALSE, otpos, TRUE, TRUE, 8);
    DrawSpinner(lastx[0], lasty[0], r, g, b, bright + 8, 40, -(angle + 45), FALSE, otpos, TRUE, TRUE, 8);
    if (pnum) {
        r = -1;
        g = 127;
        b = ENG_random(255);
    } else {
        r = ENG_random(255);
        g = 127;
        b = -1;
    }
    for (int i = 1; i < 8; i++) {
        bright = 30 - i * 3;
        DrawSpinner(lastx[i], lasty[i], r, g, b, bright + 12, bright + 5, (i & 1) ? angle * 2 : -angle * 2, FALSE, otpos, TRUE, TRUE, 8);
    }
    angle++;
}

void SpellTarget::Show(void)
{
    int x = 0;
    int y = 0;
    CPad *Pad = PAD_GetPad(pnum, 0);
    int otx, oty;
    int cp;
    int plx, ply;
    MonsterStruct *Monst = &monster[forcespell - 1];
    int ops;

    if (!active && !forcespell)
        return;
    if (invflag)
        return;

    otx = _nsx;
    oty = _nsy;
    if (!forcespell) {
        int vis_flag;
        int inthatx;
        int inthaty;
        ClrCursor(pnum);
        plx = otx;
        cp = Pad->GetCur() & 0xF;
        const int dir = pad_UpIsUpRight(cp, GetPadStyle(pnum));
        x = offset_x[dir];
        ply = oty;
        y = offset_y[dir];
        if (dir != -1) {
            plx += x * 2;
            ply += y * 2;
            if (player->_px == (plx >> 3) && player->_py == (ply >> 3)) {
                plx += x * 8;
                ply += y * 8;
            }
            if ((unsigned)((plx >> 3) - 16) > 81)
                plx = otx;
            if ((unsigned)((ply >> 3) - 16) > 81)
                ply = oty;
        }
        inthatx = plx >> 3;
        inthaty = ply >> 3;
        vis_flag = pnum + 1;
        if (dung_map[inthatx][inthaty].dFlags & vis_flag) {
            /* two-compare test on _pTSpell with identical arms: jump2 cross-jumps the arms and
             * deletes the branches, but the _pTSpell load survives (as in retail).  The compared
             * values are erased by the merge; 2/7 are placeholders. */
            if (player->_pTSpell == 2 || player->_pTSpell == 7)
                CheckRangeObject(inthatx, inthaty, 1);
            else
                CheckRangeObject(inthatx, inthaty, 1);
        }
    } else {
        if (!IsAutoTarget(player->_pRSpell) || player->_pRSplType == 4 || (Monst->_mhitpoints >> 6) <= 0) {
            forcespell = 0;
            return;
        }
        plx = Monst->_mx << 3;
        ply = Monst->_my << 3;
        if (!changed) {
            _sx = plx;
            _sy = ply;
        } else if ((_sx >> 3) == (plx >> 3) && (_sy >> 3) == (ply >> 3)) {
            changed = FALSE;
        }
    }

    if ((_sx & ~1) < (plx & ~1))
        _sx += 2;
    else if ((_sx & ~1) > (plx & ~1))
        _sx -= 2;
    if ((_sy & ~1) < (ply & ~1))
        _sy += 2;
    else if ((_sy & ~1) > (ply & ~1))
        _sy -= 2;

    x = _sx;
    y = _sy;
    GetScrXY(&x, &y);
    if (!forcespell) {
        while ((unsigned)x > 320 || (unsigned)y > 240) {
            int d = GetDirection(_nsx, _nsy, player->WorldX, player->WorldY);
            _sx += offset_x[d];
            _sy += offset_y[d];
            x = _sx;
            y = _sy;
            GetScrXY(&x, &y);
        }
        plx = _nsx = _sx;
        ply = _nsy = _sy;
    } else {
        _nsx = plx;
        _nsy = ply;
    }

    ops = sel_data;
    sel_data = pnum;
    plx >>= 3;
    ply >>= 3;
    if (forcespell) {
        x += -2 + (Monst->_mxoff >> 1);
        y += 4 + (Monst->_myoff >> 1);
        _stx = Monst->_mfutx;
        _sty = Monst->_mfuty;
    } else {
        _stx = plx;
        _sty = ply;
    }
    DrawArrow(x, y + 10);
    sel_data = ops;
    if (!forcespell) {
        ChangeLightXY(spotid, plx, ply);
        ChangeLightOff(spotid, (plx & 1) ? 4 : -4, (ply & 1) ? 4 : -4);
        StartStand(pnum, player->_pdir = GetDirection(player->_px, player->_py, plx, ply));
    }
}

void SpellTarget::ForceTarget(int monst, int x, int y)
{
    if (myplr == -1)
        return;
    pnum = myplr;
    player = &plr[myplr];
    if (monst > 0 && CanTalkToMonst(monst))
        return;
    if (!IsAutoTarget(player->_pRSpell))
        return;
    if (player->_pRSplType == 4)
        return;
    if (active)
        return;
    monst++;
    if (monst != forcespell) {
        changed = TRUE;
        ClearTrails();
    }
    if (!forcespell) {
        _sx = player->WorldX;
        _sy = player->WorldY;
        changed = TRUE;
    }
    _nsx = x << 3;
    _nsy = y << 3;
    forcespell = monst;
}

BOOL TargetActive(int pnum)
{
    return GetGamePad(pnum)->spell.Active();
}

SpellTarget *GetSpellTarget(int pnum)
{
    return &GetGamePad(pnum)->spell;
}

static void ArrowTask(TASK *T)
{
    DEF_ARGS *args = (DEF_ARGS *)T->Data;
    int pnum;
    int times;
    int bright;
    TARGET targ;
    RECT R;
    int angle;
    int r;
    int g;
    int b;

    times = args->a1;
    pnum = args->a0;
    bright = args->a2;
    targ = (TARGET)args->a3;
    angle = ENG_random(0x1000);
    r = 127;
    g = 127;
    b = 127;

    while (times && !GLUE_Finished() && !deathflag) {
        if (GLUE_GetShowGameScreenFlag()) {
            int plx, ply;
            int otpos;
            switch (targ) {
            case T_PLAYER: {
                PlayerStruct *ptrplr = &plr[pnum];
                r = 127;
                if (pnum & 1)
                    r = 255;
                g = 127;
                b = (pnum & 1) ? 127 : 255;
                plx = ptrplr->WorldX;
                ply = ptrplr->WorldY;
                GetScrXY(&plx, &ply);
                plx -= 3;
                ply += 5;
            } break;
            case T_MONSTER: {
                MonsterStruct *Monst = &monster[pnum];
                plx = Monst->_mx << 3;
                ply = Monst->_my << 3;
                GetScrXY(&plx, &ply);
            } break;
            case T_MISSILE: {
                MissileStruct *Miss = &missile[pnum];
                CBlocks *gblocks = BL_GetCurrentBlocks();
                plx = Miss->_mix * 20;
                ply = Miss->_miy * 20;
                int pxo = (Miss->_mixoff * 625) / 1000;
                int pyo = (Miss->_miyoff * 625) / 1000;
                gblocks->GetScrXY(R, plx, ply, pxo, pyo);
                plx = R.x;
                ply = R.y;
            } break;
            }
            otpos = CBlocks::GetOverlayOtBase() - 1;
            DrawSpinner(plx, ply, r, g, b, bright << 3, 70, angle, FALSE, otpos, TRUE, FALSE, 8);
            DrawSpinner(plx, ply, r, g, b, bright << 2, 70, -(angle + 45), FALSE, otpos, TRUE, FALSE, 4);
            if (!PauseMode) {
                times--;
                angle++;
            }
        }
        TSK_Sleep(1);
    }
}

void SPL_Arrow(TARGET t, int pnum, int times, int size)
{
    DEF_ARGS *args;
    TASK *T = TSK_AddTask(0x8000, ArrowTask, 0x400, 0x10);
    if (T) {
        args = (DEF_ARGS *)T->Data;
        args->a0 = pnum;
        args->a1 = times;
        args->a2 = size;
        args->a3 = t;
    }
}
