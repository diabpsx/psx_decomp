/* OPTIONS.CPP -- Climax PSX options-menu layer (PSXSRC/OPTIONS.CPP).  38 SYM'd oracle entries (25 real
 * functions + 13 header-copy methods: CPad getters/setters, Dialog ctor/dtor/SetBorder/SetRGB/SetBack,
 * CBlocks::GetOverlayOtBase, TextDat::GetFr, PRIM_GetPrim<POLY_G4>).  No PC twin (PSX-only GPU/CPad
 * menu layer).  Reconstructed from the retail asm oracle + skel/PSXSRC/OPTIONS.CPP (Ghidra/IDA draft) +
 * refs/skeleton/JAP_1998_05_29/DIABPSX/PSXSRC/OPTIONS.H (prototypes only, no data layout). */
#include "psxsrc/options.h"

/* TU-owned statics (SYM STAT records, gp-rel in the oracle -> tentative definitions here) */
static LANG_TYPE NewLang;
static LANG_TYPE OrigLang;
static int sw;             /* D_8011C6F4 -- volume-slider scale divisor */
static RECT ORect;         /* D_8011C710 -- PrintMono's clip rect */
static int cs = 1;          /* D_8011B230 -- confirmed by SYM: real name IS "cs", a single shared
                              * "current highlighted menu item" static used by GameSpeedPad (as the
                              * speed-submenu sub-selection counter) AND by CentrePad/LAMBO_MovePad
                              * (as the active menu's cursor position) -- ONE static, not per-function. */
static int lastcs = 1;      /* D_8011B234 -- SYM name "lastcs"; CentrePad's previous-frame cs snapshot */
static int sx;               /* D_8011C6F8 -- SYM name "sx"; CentrePad's screen X offset accumulator */
static int sy;               /* D_8011C6FC -- SYM name "sy"; CentrePad's screen Y offset accumulator */
static unsigned char Adjust; /* D_8011C700 -- SYM name "Adjust"; CentrePad's one-shot "changed" latch */

/* real (non-static) globals DEFINED in this TU (SYM class EXT, but THIS TU's oracle reaches every one
 * of these via %gp_rel across 13 OPTIONS.CPP function oracles -> OPTIONS.CPP owns them, per the
 * project's ownership rule: a module owns a global iff its own oracle addresses it %gp_rel, regardless
 * of the SYM "EXT" linkage label. Kept `extern` in options.h ONLY for globals this TU's oracle reaches
 * via an absolute lui/lw (owned elsewhere -- e.g. FeFlag, sghMusic, MediumFont, deathflag, etc). */
unsigned long MasterVol;
unsigned long MusicVol;
unsigned long SoundVol;
unsigned long SpeechVol;
BOOL optionsflag;
int cmenu;
int options_pad = -1;
TASK *DrawOptionsTask;
int ReturnMenu;                 /* gp_rel in FormatPad's oracle -> owned here */
BOOL CharacterBlockLoaded;      /* gp_rel in FormatPad's oracle -> owned here */
int ReturnCards;                /* gp_rel in SaveOverwritePad's oracle -> owned here */
int MonoX = 178;                 /* gp_rel only in PrintMono -> owned here */
BOOL OptionsSetSeed;            /* gp_rel in DrawOptions's oracle -> owned here */
unsigned char Qfromoptions = 0;
BOOL PadFrig = false;
int old_pad = -1;
BOOL DiabloDieFlag = false;
int they_pressed = 0;
static int lastlastcs = 1;      /* D_8011B238 -- SYM name "lastlastcs" */
static int Spacing = 13;        /* D_8011B22C -- SYM name "Spacing" */
static unsigned char KeyPos = 0; /* D_8011B270 -- SYM name "KeyPos" */
static BOOL debounce = 0;       /* D_8011B26C -- SYM name "debounce" */
static LANG_TYPE OldLang;       /* D_8011C708 -- SYM name "OldLang" */
static TextDat *Slider;         /* D_8011C6F0 -- SYM name "Slider" */
static unsigned char qspin;     /* D_8011C701 -- SYM name "qspin" */
static unsigned char lqspin;    /* D_8011C702 -- SYM name "lqspin" */

/* ---------------------------------------------------------------- large dialog/pad functions ---- */

void PrintSelectBack(unsigned short Str)
{
    char *S;

    if (Str == 0x49E) {
        S = GetStr(0x49E);
        MediumFont.Print(0, 0xDE, S, JustCentre, NULL, WHITER, WHITEG, WHITEB);
    } else {
        S = GetStr(Str);
        MediumFont.Print(0, 0xE0, S, JustCentre, NULL, WHITER, WHITEG, WHITEB);
    }
}

void DrawDialogBox(int e, int f, RECT *DRect, int X, int Y, int W, int H)
{
    Dialog DBack;

    DBack.SetBorder(e);
    DBack.SetBack(f);
    DBack.SetRGB(BORDERR, BORDERG, BORDERB);
    DBack.Back(X, Y, W, H);
    if (DRect != NULL) {
        DRect->x = X;
        DRect->y = Y;
        DRect->w = W;
        DRect->h = H;
    }
}

/* PsyQ 4.0 LIBGPU.H primitive colour / screen-point macros (verbatim, one line each) */
#ifndef setRGB0
#define setRGB0(p,_r0,_g0,_b0) (p)->r0 = _r0,(p)->g0 = _g0,(p)->b0 = _b0
#define setRGB1(p,_r1,_g1,_b1) (p)->r1 = _r1,(p)->g1 = _g1,(p)->b1 = _b1
#define setRGB2(p,_r2,_g2,_b2) (p)->r2 = _r2,(p)->g2 = _g2,(p)->b2 = _b2
#define setRGB3(p,_r3,_g3,_b3) (p)->r3 = _r3,(p)->g3 = _g3,(p)->b3 = _b3
#endif
#ifndef setXY4
#define setXY4(p,_x0,_y0,_x1,_y1,_x2,_y2,_x3,_y3) (p)->x0 = (_x0), (p)->y0 = (_y0), (p)->x1 = (_x1), (p)->y1 = (_y1), (p)->x2 = (_x2), (p)->y2 = (_y2), (p)->x3 = (_x3), (p)->y3 = (_y3)
#endif

void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB,
                  int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross,
                  BOOL iso, unsigned char SinStep)
{
    POLY_FT4 *FT4;
    POLY_GT4 *GT4;
    TextDat *ThisDat;
    unsigned char rand;
    int f;
    unsigned short bright;
    unsigned short r, g, b;
    unsigned short r2, g2, b2;
    int x1, y1, x2, y2, x3, y3;
    int radius;

    if (OtPos == 0xFFFF) OtPos = CBlocks::GetOverlayOtBase() + 4;

    ThisDat = GM_UseTexData(0);

    if (PauseMode && !Sparkle) {
        rand = 0x10;
        f = 4;
    } else {
        rand = GU_GetRnd() & 0x1F;
        f = (VID_GetTick() >> 2) & 7;
    }
    bright = rand + spinbright;
    radius = spinradius >> 1;
    if ((short)bright < 0)
        bright = 0;
    r = (SpinR * bright) >> 8;
    g = (SpinG * bright) >> 8;
    b = (SpinB * bright) >> 8;
    if (r > 255) r = 255;
    if (g > 255) g = 255;
    if (b > 255) b = 255;

    if (Sparkle) {
        f += 0xD0;
        FT4 = ThisDat->PrintFt4(f, x, y, 0, OtPos, 0);
        setRGB0(FT4, SpinR, SpinG, SpinB);
        setSemiTrans(FT4, 1);
        setShadeTex(FT4, 0);
    }

    x += 3;
    y -= 3;
    r2 = r >> 2;
    g2 = g >> 2;
    b2 = b >> 2;
    for (int i = 0; i < 64; i += SinStep * 2) {
        GT4 = ThisDat->PrintGt4(0xD8, x, y, 0, OtPos + 1, 0);
        GT4->tpage |= 0x20;
        GT4->u1 = GT4->u1 - 1;
        GT4->v2 = GT4->v2 - 1;
        GT4->u3 = GT4->u3 - 1;
        GT4->v3 = GT4->v3 - 1;
        if (!iso) {
            x1 = x + ((Circle[(angle + i) & 0x3F] * radius) >> 8);
            y1 = y + ((Circle[(angle + i + 0x10) & 0x3F] * radius) >> 8);
            x2 = (Circle[(angle + i + SinStep) & 0x3F] * radius) >> 8;
            y2 = (Circle[(angle + i + SinStep + 0x10) & 0x3F] * radius) >> 8;
            x3 = x + ((Circle[(angle + i + SinStep * 2) & 0x3F] * radius) >> 8);
            y3 = y + ((Circle[(angle + i + SinStep * 2 + 0x10) & 0x3F] * radius) >> 8);
        } else {
            x1 = x + ((Circle[(angle + i) & 0x3F] * radius) >> 8);
            y1 = y + ((Circle[(angle + i + 0x10) & 0x3F] * radius) >> 9);
            x2 = (Circle[(angle + i + SinStep) & 0x3F] * radius) >> 8;
            y2 = (Circle[(angle + i + SinStep + 0x10) & 0x3F] * radius) >> 9;
            x3 = x + ((Circle[(angle + i + SinStep * 2) & 0x3F] * radius) >> 8);
            y3 = y + ((Circle[(angle + i + SinStep * 2 + 0x10) & 0x3F] * radius) >> 9);
        }
        setXY4(GT4, x1, y1, x, y, x + x2, y + y2, x3, y3);
        setSemiTrans(GT4, 1);
        setShadeTex(GT4, 0);
        setRGB0(GT4, 0, 0, 0);
        setRGB1(GT4, r, g, b);
        setRGB2(GT4, 0, 0, 0);
        setRGB3(GT4, 0, 0, 0);
        if (cross) {
            GT4 = ThisDat->PrintGt4(0xD8, x, y, 0, OtPos + 1, 0);
            GT4->tpage |= 0x20;
            x2 >>= 3;
            y2 >>= 3;
            GT4->u1 = GT4->u1 - 1;
            GT4->v2 = GT4->v2 - 1;
            GT4->u3 = GT4->u3 - 1;
            GT4->v3 = GT4->v3 - 1;
            setXY4(GT4, x1, y1, x, y, x + x2, y + y2, x3, y3);
            setSemiTrans(GT4, 1);
            setShadeTex(GT4, 0);
            setRGB0(GT4, r2, g2, b2);
            setRGB1(GT4, r, g, b);
            setRGB2(GT4, r2, g2, b2);
            setRGB3(GT4, r2, g2, b2);
        }
    }
    GM_FinishedUsing(ThisDat);
}

/* ---------------------------------------------------------------- small game functions ---- */

void SetLoadedLang(LANG_TYPE LoadLang)
{
    if (LoadLang != LANG_GetLang()) {
        CDWAIT = 1;
        music_stop();
        LANG_SetLang(LoadLang);
        if (FileSYS != 1)
            BL_LoadStreamDir();
        if (!IsGameLoading()) {
            music_start(sgnMusicTrack);
            STR_pauseall();
            snd_stop_snd(0);
        }
        CDWAIT = 0;
    }
    NewLang = LoadLang;
    OrigLang = LoadLang;
}

void ChangeLang(void)
{
    if (NewLang != OrigLang) {
        music_fade();
        if (FileSYS != 1) {
            while (sghMusic->volume > 0)
                TSK_Sleep(1);
        }
        CDWAIT = 1;
        LANG_SetLang(NewLang);
        if (FileSYS != 1)
            BL_LoadStreamDir();
        CDWAIT = 0;
        music_start(5);
        OrigLang = NewLang;
    }
}

void DrawLeftRight(void)
{
}

void PrintMono(int ypos)
{
    char *String;
    int len;

    if (MONO != 0)
        String = GetStr(0x29A);
    else
        String = GetStr(0x29C);
    len = MediumFont.GetStrWidth(String);
    len = len >> 1;
    MediumFont.Print(MonoX - len, ypos, String, JustLeft, &ORect, WHITER, WHITEG, WHITEB);
}

void DrawMenu(int MenuNo)
{
    if (cmenu + 1 == 3) {
        if (FeFlag != 0) {
            SoundMenu[2].y = 1;
            SoundMenu[3].y = 2;
            SoundMenu[4].y = 3;
            SoundMenu[1].y = 0;
            SoundMenu[6].y = 5;
        } else {
            SoundMenu[1].y = 1;
            SoundMenu[2].y = 2;
            SoundMenu[3].y = 3;
            SoundMenu[4].y = 4;
            SoundMenu[6].y = 6;
        }
    }

    if (MenuNo + 1 == 1 && FeFlag == 0) {
        if (deathflag != 0) {
            cmenu = 8;
            MenuNo = 8;
        } else {
            cmenu = MenuNo + 1;
            MenuNo = 1;
        }
    }
    if (MenuNo + 1 == 2 && FeFlag != 0) {
        cmenu = 0;
        MenuNo = 0;
    }

    OMENULIST *mptr;
    OMENUITEM *iptr;
    int sh;
    POLY_G4 *G4;
    int yoff;
    int len;
    int depth;
    unsigned char r, g, b;
    int mx, my;
    int BARFRAC;
    int mptrx, mptry;
    mptr = &MenuList[MenuNo];
    iptr = mptr->Item;
    sh = (Slider->GetFr(0x96)->H) - 4;
    depth = CBlocks::GetOverlayOtBase();
    depth = depth + 4;
    mptrx = ((0x100 - mptr->w) / 2) + 0x20;
    BARFRAC = 0x8000 / sw;
    mptry = ((0xB0 - mptr->h) / 2) + 0x20;
    mx = mptrx;
    if (FeFlag == 0) {
        Spacing = 0xD;
        my = mptry;
    } else {
        Spacing = 0xD;
        my = 0x20;
    }

    if (MenuNo + 1 == 5) {
        DrawDialogBox(0x12, 0x94, &ORect, 10, 0x14, 0x129, 0xCD);
        ORect.x = 10;
        ORect.y = 0x14;
        ORect.w = 0x129;
        ORect.h = 0xCD;
        mx = 10;
        my = 0x14;
    } else if (FeFlag == 0) {
        DrawDialogBox(0x12, 0x94, &ORect, mptrx, mptry, mptr->w, mptr->h);
        ORect.x = mx;
        ORect.y = my;
        ORect.w = mptr->w;
        ORect.h = mptr->h;
    } else {
        ORect.x = mx;
        ORect.y = my;
        ORect.w = mptr->w;
        ORect.h = mptr->h + 100;
    }

    yoff = 0xC;
    for (int i = 0; i < mptr->NoEntries; i++) {
        r = WHITER;
        g = WHITEG;
        b = WHITEB;
        if (i != 0)
            yoff = Spacing + 4;
        if (iptr->var != NULL) {
            int sxp, syp;
            unsigned char barg, barr;

            sxp = (mx + mptr->w) - sw - 14;
            syp = my + iptr->y * Spacing + yoff;
            if (FeFlag != 0 && cmenu + 1 == 3)
                syp += 0x20;
            len = iptr->len;
            if (i != cs)
                Slider->PrintFt4(0x98, sxp + len - 3, syp - 8, 0, depth, 0);
            else
                Slider->PrintFt4(0x97, sxp + len - 3, syp - 8, 0, depth, 0);
            sxp -= 2;
            syp -= 6;
            barg = (BARFRAC * len) >> 8;
            barr = 0x80 - barg;
            DrawDialogBox(0x12, 0x94, NULL, sxp, syp + 1, sw, sh - 2);
            PRIM_GetPrim(&G4);
            setlen(G4, 8);
            G4->code = 0x38;
            G4->code = G4->code & 0xFD;
            G4->code = G4->code & 0xFE;
            G4->r0 = 0x40;
            G4->g0 = 0;
            G4->b0 = 0;
            G4->r1 = barr >> 1;
            G4->g1 = barg >> 1;
            G4->b1 = 0;
            G4->r2 = 0x80;
            G4->g2 = 0;
            G4->b2 = 0;
            G4->r3 = barr;
            G4->g3 = barg;
            sxp--;
            G4->b3 = 0;
            setXYWH(G4, sxp, syp, len, sh / 2);
            addPrim(ThisOt + depth, G4);

            PRIM_GetPrim(&G4);
            setlen(G4, 8);
            G4->code = 0x38;
            G4->code = G4->code & 0xFD;
            G4->code = G4->code & 0xFE;
            G4->r0 = 0x80;
            G4->g0 = 0;
            G4->b0 = 0;
            G4->r1 = barr;
            G4->g1 = barg;
            G4->b1 = 0;
            G4->r2 = 0x40;
            G4->g2 = 0;
            G4->b2 = 0;
            G4->r3 = barr >> 1;
            G4->g3 = barg >> 1;
            G4->b3 = 0;
            setXYWH(G4, sxp, syp + sh / 2, len, sh / 2);
            addPrim(ThisOt + depth, G4);

        }
        if (i == 0) {
            r = BLUER;
            g = BLUEG;
            b = BLUEB;
        }
        if (i == cs && iptr->Text != 0) {
            int cx, cy;


            r = GOLDR;
            g = GOLDG;
            b = GOLDB;
            if ((unsigned)(MenuNo - 0xE) < 2 && MemCardActive != 0) {
                len = 0x280;
                if (card_status[current_card] == 0 && CharacterBlockLoaded != 0)
                    len = GetSpinnerWidth(i - 1);
            } else {
                if (FeFlag != 0 && i == 0) {
                    len = LargeFont.GetStrWidth(GetStr(iptr->Text));
                } else {
                    len = MediumFont.GetStrWidth(GetStr(iptr->Text));
                }
            }
            cy = (my + iptr->y * Spacing + yoff) - 2;
            if (cmenu + 1 == 3 && cs != 7) {
                len = len + 10;
                cx = mx + 2;
                if (FeFlag != 0) {
                    cx = mx - 8;
                    len = len + 6;
                }
            } else {
                cx = (((0x100 - len)) / 2) + 0x14;
                len = len + 0x10;
            }
            if (FeFlag != 0 && cmenu + 1 == 3)
                cy = cy + 0x20;
            if (MenuNo + 1 != 5) {
                if (AlertTxt == 0) {
                    DrawSpinner(cx, cy, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, depth, 1, 0, 8);
                    DrawSpinner(cx + len, cy, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, depth, 1, 0, 8);
                } else if (FeFlag != 0) {
                    DrawSpinner(cx, cy, 0xA0, 0xA0, 0x40, 0x10, 0x40, 8, 0, depth, 1, 0, 8);
                    DrawSpinner(cx + len, cy, 0xA0, 0xA0, 0x40, 0x10, 0x40, 8, 0, depth, 1, 0, 8);
                }
            }
        }
        if (iptr->Text != 0) {
            if (Adjust != 0 && i == 3) {
                r = REDR;
                g = REDG;
                b = REDB;
            }
            if (MenuNo + 1 == 4 && iptr->len != 0 && iptr->Link != 1) {
                r = REDR;
                g = REDG;
                b = REDB;
            }
            if (MenuNo + 1 == 11 && iptr->len != 0 && iptr->Link == -2) {
                r = REDR;
                g = REDG;
                b = REDB;
            }
            if (DiabloDieFlag != 0) {
                if (MenuNo + 1 == 8 && iptr->Link == 0xD) {
                    b = 0x28;
                    g = 0x28;
                    r = 0x28;
                }
                if (MenuNo + 1 == 2 && i != 0 && i < 5) {
                    b = 0x28;
                    g = 0x28;
                    r = 0x28;
                }
            }
            if (FeFlag != 0) {
                if (i == 0) {
                    ORect.y -= 0x20;
                    if (iptr->Text == 0x3B6) {
                        ORect.x -= 0x40;
                        ORect.w += 0x80;
                    }
                    LargeFont.Print(0, iptr->y * Spacing + yoff + 0x22, GetStr(iptr->Text), iptr->Just, &ORect, BLUER, BLUEG, BLUEB);
                    if (iptr->Text == 0x3B6) {
                        ORect.x += 0x40;
                        ORect.w -= 0x80;
                    }
                    ORect.y += 0x20;
                } else if (cmenu + 1 == 3) {
                    MediumFont.Print(0, iptr->y * Spacing + yoff + 0x20, GetStr(iptr->Text), iptr->Just, &ORect, r, g, b);
                    if (i == 5)
                        PrintMono(iptr->y * Spacing + yoff + 0x20);
                } else {
                    MediumFont.Print(8, iptr->y * Spacing + yoff, GetStr(iptr->Text), iptr->Just, &ORect, r, g, b);
                }
            } else {
                if (i != 0 && cmenu + 1 == 3) {
                    MediumFont.Print(8, iptr->y * Spacing + yoff, GetStr(iptr->Text), iptr->Just, &ORect, r, g, b);
                    if (i == 5)
                        PrintMono(iptr->y * Spacing + yoff);
                } else {
                    MediumFont.Print(0, iptr->y * Spacing + yoff, GetStr(iptr->Text), iptr->Just, &ORect, r, g, b);
                }
            }
        }
        iptr++;
    }
    if (MenuNo == 2)
        PrintSelectBack(0x331);
    else if (MenuNo == 4)
        PrintSelectBack(0x49E);
    else if (MenuNo == 8)
        PrintSelectBack(0x4E5);
    else
        PrintSelectBack(0x4E6);
}

int who_pressed(int pval)
{
    CPad *Pad, *Pad1;

    Pad = PAD_GetPad(0, 0);
    Pad1 = PAD_GetPad(1, 0);
    if (Pad->GetDown() & 0xFFFF & pval)
        return 0;
    if (Pad1->GetDown() & 0xFFFF & pval)
        return 1;
    return -1;
}

void CharacterLoadPad(void)
{
    CPad *P;
    OMENUITEM *iptr;

    iptr = MenuList[cmenu].Item;
    if (cardondelay > 0) {
        cardondelay = cardondelay - 1;
        if (countdownloadcharblock != 0)
            ShowLoadingBox(card_side_read[current_card]);
        else
            ShowLoadingBox(0x348);
        return;
    }
    if (countdownloadcharblock != 0)
        ActivateCharacterMemcard(current_card == 0, (current_card ^ 1) == 0);
    if (CharacterBlockLoaded == 0)
        ActivateCharacterMemcard(current_card == 0, (current_card ^ 1) == 0);
    P = PAD_GetPad(options_pad, 0);
    if (AlertTxt != 0) {
        ShowAlertBox();
        if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
            cs = MenuList[cmenu].NoEntries - 1;
            if (iptr[cs].Link != -2) {
                cmenu = iptr[cs].Link - 1;
                cs = 3;
                CharacterBlockLoaded = 0;
            }
            PlaySFX(0x33);
            AlertTxt = 0;
            StatusTxt = 0;
            loadflag = 0;
            saveflag = 0;
        }
        return;
    }

    if (card_status[current_card] == 2) {
        AlertTxt = card_side_empty[current_card];
        return;
    }
    ShowCardActionText();
    if (card_status[current_card] == 0) {
        ShowCharacterFiles(cs - 1, Spacing, ORect, 0x58);
    }
        if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
            if (saveflag == 0) {
                if (card_status[current_card] == 2) {
                    PlaySFX(0x3D3);
                    return;
                }
                PlaySFX(0x33);
                if (GetSaveStatusMessage(1, DiabloCharacterFile) == 0) {
                    PlaySFX(0x3D3);
                    return;
                }
                saveflag = 1;
                if (card_usable[current_card] == 0) {
                    ReturnMenu = cmenu;
                    lastcs = cs;
                    cmenu = 0x10;
                    formatflag = 0;
                    cs = 2;
                    return;
                } else {
                    if (D_80157B68[cs - 1].first != 0) {
                        ActivateMemcard(current_card == 0, (current_card ^ 1) == 0);
                        ReturnCards = 1;
                        ReturnMenu = cmenu;
                        lastlastcs = cs;
                        cmenu = 0x13;
                        cs = 2;
                        return;
                    }
                }
            }
        }
        if (saveflag >= 3)
            ShowLoadingBox(card_side_save[current_card]);
        if (saveflag != 0) {
            saveflag = saveflag + 1;
            if (saveflag == 0xA) {
                saveflag = 0;
                if (GetSaveStatusMessage(1, DiabloCharacterFile) != 0) {
                    if (PSX_CH_SaveGame(current_card, cs - 1) != 0) {
                        AlertTxt = 0x50F;
                        ActivateMemcard(0, 0);
                    } else {
                        AlertTxt = 0x506;
                    }
                    ActivateMemcard(0, 0);
                }
            }
            return;
        }
        LAMBO_MovePad(P);
        if (P->GetDown() & 0x100) {
            PlaySFX(0x33);
            cs = MenuList[cmenu].NoEntries - 1;
            CharacterBlockLoaded = 0;
            if (iptr[cs].Link != -2) {
                cmenu = iptr[cs].Link - 1;
                cs = current_card + 1;
            }
        }
}

void MemcardPad(void)
{
    CPad *P;
    int move;
    OMENUITEM *iptr;

    iptr = MenuList[cmenu].Item;
    P = PAD_GetPad(options_pad, 0);
    P->SetPadTick(8);
    P->SetPadTickMask(3);
    move = 0;
    if (cardondelay > 0) {
        cardondelay = cardondelay - 1;
        if (cardondelay == 0) {
            ActivateMemcard(1, 1);
        } else {
            ShowLoadingBox(0x348);
            return;
        }
    }
    if (AlertTxt == 0 && saveflag == 0 && loadflag == 0) {
    int lcs;
    ShowCardActionText();
    if (P->GetTick() & 1)
        move = -1;
    if (P->GetTick() & 2)
        move = 1;
    lcs = cs;
    cs += move;
    if (iptr[cs].Text == 0) {
        do {
            if (move == 0)
                move = 1;
            if (cs < 0)
                move = 1;
            if (!(cs < MenuList[cmenu].NoEntries))
                move = -1;
            cs += move;
        } while (iptr[cs].Text == 0);
    }
    if (cs <= 0)
        cs = MenuList[cmenu].NoEntries - 2;
    if (!(cs < MenuList[cmenu].NoEntries - 1))
        cs = 1;
    if (cs != lcs)
        PlaySFX(0x32);
    if (P->GetDown() & 0x100) {
        PlaySFX(0x33);
        cs = MenuList[cmenu].NoEntries - 1;
        if (iptr[cs].Link != -2) {
            cmenu = iptr[cs].Link - 1;
            cardondelay = 5;
            cs = lastcs;
            return;
        }
    }

    if ((P->GetDown() & 0x40) && saveflag == 0 && loadflag == 0) {

    if (cs == 1)
        current_card = 0;
    else
        current_card = 1;
    PlaySFX(0x33);

    switch (cmenu - 9) {
    case 8: /* L800A8C28 */
        Savefilename = DiabloOptionFile;
        save_blocks = 1;
        if (GetSaveStatusMessage(1, DiabloOptionFile) == 0) {
            PlaySFX(0x3D3);
            break;
        }
        saveflag = 1;
        move = 0;
        if (test_card_format(current_card) != 0) {
            if (GetFileNumber(current_card, Savefilename) == -1)
                move = 0;
            else
                move = 1;
        }
        if (move != 0) {
            ActivateMemcard(current_card == 0, (current_card ^ 1) == 0);
            ReturnCards = 2;
            ReturnMenu = cmenu;
            lastlastcs = cs;
            cmenu = 0x13;
            cs = 2;
            return;
        }
        break;

    case 9: /* L800A8CA4 */
        if (card_status[current_card] == 2) {
            AlertTxt = card_side_empty[current_card];
            PlaySFX(0x3D3);
            break;
        }
        if (card_usable[current_card] == 0) {
            AlertTxt = 0x509;
            PlaySFX(0x3D3);
            break;
        }
        if (GetFileNumber(current_card, DiabloOptionFile) == -1) {
            AlertTxt = card_side_noopt[current_card];
            PlaySFX(0x3D3);
            break;
        } else {
            loadflag = 4;
            Loadfilename = DiabloOptionFile;
            break;
        }

    case 3: /* L800A8D48 */
        /* The memory-card worker owns these asynchronously. Volatile accesses preserve retail's
         * store/load order while forwarding one DiabloGameFile value to Savefilename and a1. */
        *(volatile int *)&save_blocks = 10;
        Savefilename = *(char *volatile *)&DiabloGameFile;
        if (GetSaveStatusMessage(*(volatile int *)&save_blocks, Savefilename) == 0) {
            PlaySFX(0x3D3);
            break;
        }
        saveflag = 1;
        if (GetFileNumber(current_card, Savefilename) == -1)
            break;
        ActivateMemcard(current_card == 0, (current_card ^ 1) == 0);
        ReturnCards = 2;
        ReturnMenu = cmenu;
        lastlastcs = cs;
        cmenu = 0x13;
        cs = 2;
        return;

    case 0:
    case 2: /* L800A8DF0 */
        if (card_status[current_card] == 2) {
            AlertTxt = card_side_empty[current_card];
            PlaySFX(0x3D3);
            break;
        }
        if (card_usable[current_card] == 0) {
            AlertTxt = 0x509;
            PlaySFX(0x3D3);
            break;
        }
        if (GetFileNumber(current_card, DiabloGameFile) == -1) {
            AlertTxt = card_side_nogame[current_card];
            PlaySFX(0x3D3);
            break;
        } else {
            loadflag = 4;
            Loadfilename = DiabloGameFile;
            break;
        }

    default: /* L800A8ECC */
        if (iptr[cs].Link == -2)
            break;
        cmenu = iptr[cs].Link - 1;
        lastcs = cs;
        cs = 1;
        return;
    }

    if (saveflag != 0) {
        if (card_status[current_card] != 2) {
            if (card_usable[current_card] == 0) {
                if (read_card_block(current_card, 0) != 0) {
                    if (block_buf[0] != 0x4D) {
                        if (block_buf[1] != 0x43) {
                            ReturnMenu = cmenu;
                            lastlastcs = cs;
                            cmenu = 0x10;
                            formatflag = 0;
                            cs = 2;
                            return;
                        }
                    }
                }
                saveflag = 0;
            }
        }
    }
    }
    if (loadflag == 0 && saveflag == 0) {
        if ((unsigned)(cmenu - 0x11) < 2)
            ShowGameFiles(DiabloOptionFile, 0, 0xD, ORect, 0x1C);
        else
            ShowGameFiles(DiabloGameFile, 0, 0xD, ORect, 0x1C);
    }
    } else if (saveflag == 0 && loadflag == 0) {
        ShowAlertBox();
        if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
            loadflag = 0;
            saveflag = 0;
            formatflag = 0;
            AlertTxt = 0;
            StatusTxt = 0;
            PlaySFX(0x33);
        }
    }
    if (saveflag >= 3) {
        if (AlertTxt == 0)
            ShowLoadingBox(card_side_save[current_card]);
    }
    if (loadflag != 0) {
        if (AlertTxt == 0)
            ShowLoadingBox(card_side_load[current_card]);
        if (loadflag > 0)
            loadflag = CountdownLoad(loadflag);
    }
    if (saveflag > 0)
        saveflag = CountdownSave(saveflag);
    return;
}

void SwitchMONO(void)
{
    PlaySFX(0x33);
    if (MONO != 0) {
        MONO = 0;
        return;
    }
    MONO = 1;
}

void SoundPad(void)
{
    CPad *P;
    int move = 0;
    OMENUITEM *iptr;
    int lcs;

    P = PAD_GetPad(options_pad, 0);
    if (MemCardActive != 0) {
        MemcardOFF();
        cardondelay = 5;
        card_active[1] = 0;
        card_active[0] = 0;
    }
    if (CDWAIT != 0)
        return;

    if (P->GetDown() & KeyTab[KeyPos]) {
        KeyPos = KeyPos + 1;
        if (KeyTab[KeyPos & 0xFF] == 0)
            PlaySFX(0x2AF);
    } else {
        if (P->GetDown() & 0xFFFF)
            KeyPos = 0;
    }

    if (FeFlag != 0)
        P->SetPadTick(0xC);
    else if (cmenu == 2)
        P->SetPadTick(4);
    else
        P->SetPadTick(8);
    P->SetPadTickMask(0xF);

    if (P->GetTick() & 1)
        move = -1;
    if (P->GetTick() & 2)
        move = 1;
    iptr = MenuList[cmenu].Item;
    lcs = cs;
    cs += move;
    if (iptr[cs].Text == 0) {
        do {
            if (move == 0)
                move = 1;
            if (cs < 0)
                move = 1;
            if (!(cs < MenuList[cmenu].NoEntries - 1))
                move = -1;
            cs += move;
        } while (iptr[cs].Text == 0);
    }
    if (cmenu != 1 && cmenu != 8) {
        if (cs <= 0)
            cs = MenuList[cmenu].NoEntries - 2;
        if (!(cs < MenuList[cmenu].NoEntries - 1))
            cs = 1;
    } else {
        if (cs <= 0)
            cs = MenuList[cmenu].NoEntries - 1;
        if (cs >= MenuList[cmenu].NoEntries)
            cs = 1;
    }
    if (cs != lcs)
        PlaySFX(0x32);

    if (cmenu + 1 == 4) {
        for (int l = 4; l >= 0; l--)
            iptr[l + 1].len = 0;
        iptr[NewLang + 1].len = 1;
        if (NewLang != OldLang) {
            PlaySFX(0x33);
            ChangeLang();
            OldLang = NewLang;
        }
    }

    move = 0;
    if (cmenu == 6) {
        move = (P->GetDown() & 0x40) || (P->GetDown() & 0x10);
        if (move) {
            if (cs == 1) {
                optionsflag = 0;
                options_pad = -1;
                PlaySFX(0x33);
                TSK_Sleep(1);
                GO_DoGameOver();
            }
        }
    } else {
        if (iptr[cs].var != NULL) {
            int llen;

            llen = iptr[cs].len;
            if (P->GetTick() & 4) {
                iptr[cs].len = iptr[cs].len - 2;
                if (iptr[cs].len < 0)
                    iptr[cs].len = 0;
            }
            if (P->GetTick() & 8) {
                iptr[cs].len = iptr[cs].len + 2;
                if (sw < iptr[cs].len)
                    iptr[cs].len = sw;
            }
            if (llen != iptr[cs].len)
                PlaySFX(cs == 4 ? 0x79 : 0x32);
            *iptr[cs].var = iptr[cs].len;
        }
    }

    if ((P->GetUp() & 0x40) || (P->GetUp() & 0x10)) {
        ignore_buttons = 1;
        debounce = 1;
    }

    if (((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) && debounce != 0) {

        they_pressed = who_pressed(0x50);
        if (iptr[cs].Link == -1) {
            PlaySFX(0x33);
            Adjust = 0;
            ToggleOptions();
            if (optionsflag != 0)
                return;
            ignore_buttons = 1;
            return;
        }
        if (iptr[cs].Link != -2) {
            if (DiabloDieFlag == 0 || (iptr[cs].Link != 0xD && (cmenu + 1 != 2 || cs > 4))) {
                PlaySFX(0x33);
                lastcs = cs;
                cmenu = iptr[cs].Link - 1;
                if (cmenu + 1 == 1 && FeFlag == 0)
                    cmenu++;
                if (cmenu + 1 == 0x18) {
                    if (Qfromoptions != 0 && cs == 4) {
                        GLUE_SetShowGameScreenFlag(1);
                        cmenu = 0;
                        Qfromoptions = 0;
                        debounce = 1;
                    } else {
                        Qfromoptions = options_pad + 1;
                    }
                } else {
                    cs = 1;
                }
                if (cmenu + 1 == 11) {
                    switch (GetSpeed()) {
                    case GM_SPEED_NORMAL: cs = 1; break;
                    case GM_SPEED_FAST: cs = 2; break;
                    }
                }
                if (deathflag != 0 && (unsigned int)cmenu < 2) {
                    cs = lastcs;
                    cmenu = 8;
                    Adjust = 0;
                    return;
                }
                if ((unsigned int)(cmenu - 5) < 2)
                    cs = 2;
                Adjust = 0;
                return;
            } else {
                PlaySFX(0x3D3);
                return;
            }
        } else if (cmenu + 1 == 4) {
            NewLang = (LANG_TYPE)(cs - 1);
            return;
        }
    }

    if (cmenu + 1 == 3 && cs == 5) {
        if (P->GetDown() & 0xC)
            SwitchMONO();
    }
    if ((P->GetDown() & 0x100) && PadFrig != 0) {
        PadFrig = 0;
        return;
    }
    if (!(P->GetDown() & 0x100))
        return;
    if (cmenu + 1 == 9) {
        PlaySFX(0x3D3);
        return;
    }
    {

        if (Qfromoptions != 0) {
            PlaySFX(0x33);
            GLUE_SetShowGameScreenFlag(1);
            Qfromoptions = 0;
            return;
        }
        cs = MenuList[cmenu].NoEntries - 1;
        if (iptr[cs].Link == -1 || iptr[cs].Link == 6) {
            PlaySFX(0x33);
            Adjust = 0;
            ToggleOptions();
            if (optionsflag != 0)
                return;
            ignore_buttons = 0;
            return;
        }
        if (iptr[cs].Link == -2)
            return;
        PlaySFX(0x33);
        if (deathflag != 0) {
            if (cmenu + 1 == 7) {
                cmenu = 8;
                Adjust = 0;
                cs = lastcs;
            }
        } else {
            if (cmenu + 1 == 8) {
                cmenu = iptr[cs].Link - 1;
                cs = 5;
                Adjust = 0;
            } else {
                Adjust = 0;
                cmenu = iptr[cs].Link - 1;
                cs = lastcs;
            }
        }
        if (MemcardOverlay == 0)
            return;
        MemcardOverlay = 0;
        if (FeFlag != 0)
            return;
        OVR_LoadGame();
        return;
    }
}

void CentrePad(void)
{
    CPad *P;
    OMENUITEM *iptr;
    int osx, osy;

    sx = VID_GetXOff();
    sy = VID_GetYOff();
    P = PAD_GetPad(options_pad, 0);
    if (FeFlag != 0)
        P->SetPadTick(0xA);
    else
        P->SetPadTick(3);
    P->SetPadTickMask(0xF);
    iptr = MenuList[cmenu].Item;
    osx = sx;
    osy = sy;
    if (P->GetTick() & 1) {
        if (sy >= -2)
            sy = sy - 1;
    }
    if (P->GetTick() & 2) {
        if (sy < 3)
            sy = sy + 1;
    }
    if (P->GetTick() & 4) {
        if (sx >= -2)
            sx = sx - 1;
    }
    if (P->GetTick() & 8) {
        if (sx < 3)
            sx = sx + 1;
    }
    if (sx != osx || sy != osy)
        PlaySFX(0x32);
    if (P->GetDown() & 0x80) {
        PlaySFX(0x33);
        sx = 0;
        sy = 0;
    }
    if ((P->GetDown() & 0x100) && Adjust == 0) {
        PlaySFX(0x33);
        cs = MenuList[cmenu].NoEntries - 1;
        if (iptr[cs].Link != -2) {
            cmenu = iptr[cs].Link - 1;
            Adjust = 0;
            cs = lastcs;
        }
    }
    DaveCentreStuff();
    VID_SetXYOff(sx, sy);
}

void CalcVolumes(void)
{
    int unit;

    sglMasterVolume = MasterVol * (0xE6 / sw);
    sglMusicVolume = MusicVol * (0x1FFF / sw);
    unit = 0x3FFF / sw;
    sglSoundVolume = SoundVol * unit;
    sglSpeechVolume = SpeechVol * unit;
    if (sghMusic != NULL) {
        sghMusic->s_volume = (sglMusicVolume * sglMasterVolume) >> 8;
        sghMusic->volume = sghMusic->s_volume;
        STR_setvolume(sghMusic);
    }
    if (sghStream != NULL) {
        if (sgpStreamSFX->flags & 1)
            sghStream->volume = sghStream->s_volume = (sglSoundVolume * sglMasterVolume) >> 8;
        else
            sghStream->volume = sghStream->s_volume = (sglSpeechVolume * sglMasterVolume) >> 8;
        if (sghStream->state != 3)
            STR_setvolume(sghStream);
    }
}

void SetLoadedVolumes(void)
{
    int unit;
    int m, mv, sv, spv;

    m = sglMasterVolume / (0xE6 / sw);
    unit = 0x3FFF / sw;
    mv = (sglMusicVolume * 2) / unit;
    sv = sglSoundVolume / unit;
    spv = sglSpeechVolume / unit;
    MasterVol = m;
    MusicVol = mv;
    SoundVol = sv;
    SpeechVol = spv;
    MasterVol &= ~1;
    MusicVol &= ~1;
    SoundVol &= ~1;
    SpeechVol &= ~1;
}

void GetVolumes(void)
{
    union {
        struct {
            unsigned int : 32;
            unsigned int : 32;
        };
    };

    SetLoadedVolumes();
    for (int i = 0; i < 10; i++) {
        OMENULIST *mptr;
        OMENUITEM *iptr;

        mptr = &MenuList[i];
        iptr = mptr->Item;
        {
            int s;
            const int entries = mptr->NoEntries;

            if (entries > 0) {
                s = 0;
                do {
                    if (iptr->var != NULL) {
                        iptr->len = *iptr->var;
                        if (sw < iptr->len)
                            iptr->len = sw;
                    }
                    iptr++;
                    s++;
                } while (s < mptr->NoEntries);
            }
        }
    }
}

void AlterSpeedMenu(GM_SPEEDS gs)
{
    OMENUITEM *it;

    it = MenuList[cmenu].Item;
    it++;
    switch (gs) {
    case GM_SPEED_NORMAL:
        it->len = 1;
        it[1].len = 0;
        return;
    case GM_SPEED_FAST:
        it->len = 0;
        it[1].len = gs;
        return;
    default:
        return;
    }
}

void GameSpeedPad(void)
{
    int cp;
    BOOL exit_flag;

    exit_flag = 0;
    cp = PAD_GetPad(options_pad, 0)->GetDown() & 0xFFFF;
    AlterSpeedMenu(GetSpeed());
    if (cp & 0x100) {
        PlaySFX(0x33);
        exit_flag = 1;
    }
    if (cp & 2) {
        PlaySFX(0x32);
        cs = cs + 1;
        if (cs >= 3) {
            cs = 1;
        }
    }
    if (cp & 1) {
        PlaySFX(0x32);
        cs = cs - 1;
        if (cs == 0)
            cs = 2;
    }
    if (cp & 0x40) {
        PlaySFX(0x33);
        switch (cs) {
        case 1:
            SetSpeed(GM_SPEED_NORMAL);
            break;
        case 2:
            SetSpeed(GM_SPEED_FAST);
            break;
        }
    }
    if (exit_flag != 0) {
        cmenu = 1;
        cs = 0xA;
    }
}

void DrawOptions(TASK *T)
{
    CPad *P;

    if (options_pad == -1 && deathflag == 0) {
        ToggleOptions();
        return;
    }
    P = PAD_GetPad(options_pad, 0);
    Slider = GM_UseTexData(0);
    sw = Slider->GetFr(0x96)->W - 2;
    if (deathflag == 0)
        cmenu = 1;
    else
        cmenu = 8;
    if (Qfromoptions != 0) {
        cs = Qfromoptions;
        Qfromoptions = 0;
    } else {
        if (FeFlag == 0)
            PlaySFX(0x33);
        cs = 1;
    }
    qspin = 0;
    lqspin = 0;
    OptionsSetSeed = 0;
    GetVolumes();
    GLUE_SetHomingScrollFlag(0);
    GLUE_SetShowPanelFlag(0);
    GLUE_SuspendGame();
    TSK_Sleep(1);
    debounce = 1;
    if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10))
        debounce = 0;
    OrigLang = LANG_GetLang();
    OldLang = OrigLang;
    PadFrig = 0;
    old_pad = options_pad;
    while (msgflag != 0 && msgholdflag != 0) {
        msgholdflag = 0;
        TSK_Sleep(1);
    }
    while (optionsflag != 0 && options_pad != -1) {
        switch (cmenu) {
        case 0:
        case 1:
        case 3:
        case 5:
        case 6:
        case 7:
        case 8:
            DrawMenu(cmenu);
            SoundPad();
            break;
        case 2:
            DrawMenu(cmenu);
            CalcVolumes();
            SoundPad();
            break;
        case 0x14:
            DrawCtrlSetup();
            if (FeFlag)
                cs = 2;
            else
                cs = 7;
            break;
        case 0x19:
            DrawHelp();
            if (FeFlag)
                cs = 5;
            else
                cs = 9;
            break;
        case 0x10:
            DrawMenu(cmenu);
            FormatPad();
            break;
        case 0xE:
            current_card = 0;
            CharacterLoadPad();
            DrawMenu(cmenu);
            break;
        case 0xF:
            current_card = 1;
            CharacterLoadPad();
            DrawMenu(cmenu);
            break;
        case 0xD:
            CharCardSelectMemcardPad();
            DrawMenu(cmenu);
            break;
        case 0x13:
            SaveOverwritePad();
            DrawMenu(cmenu);
            break;
        case 9:
        case 0xB:
        case 0xC:
        case 0x11:
        case 0x12:
            MemcardPad();
            DrawMenu(cmenu);
            break;
        case 4:
            DrawMenu(cmenu);
            CentrePad();
            break;
        case 0x16:
            cmenu = 0;
            cs = 4;
            PaletteFadeOut(8);
            while (GetFadeState() != 0) {
                DrawMenu(cmenu);
                TSK_Sleep(1);
            }
            InitCredits();
            PaletteFadeIn(8);
            break;
        case 0x17:
            Qfromoptions = options_pad + 1;
            ToggleOptions();
            pad_func_SplBook(options_pad);
            cs = 4;
            options_pad = old_pad;
            break;
        case 0x18:
            Qfromoptions = options_pad + 1;
            ToggleOptions();
            StartQuestlog();
            cs = 4;
            options_pad = old_pad;
            break;
        case 0x1A:
            ToggleOptions();
            invflag = 1;
            cs = 4;
            options_pad = old_pad;
            break;
        case 0x1B:
            ToggleOptions();
            pad_func_Chr(options_pad);
            cs = 4;
            options_pad = old_pad;
            break;
        case 10:
            GameSpeedPad();
            DrawMenu(cmenu);
            break;
        }
        if (Qfromoptions != 0 && cs == 4)
            debounce = 1;
        TSK_Sleep(1);
        if (FeFlag == 0) {
            if ((P->GetDown() & 0x20) && MemCardActive == 0) {
                if (cmenu == 1) {
                    if (PadFrig == 0) {
                        PlaySFX(ctrlflag == 0 ? 0x33 : 0x3D3);
                        ToggleOptions();
                        if (optionsflag == 0)
                            ignore_buttons = 1;
                    } else {
                        PadFrig = 0;
                    }
                } else {
                    if (ctrlflag != 0) {
                        if (!RemoveCtrlScreen()) {
                            PlaySFX(0x3D3);
                        } else {
                            PlaySFX(0x33);
                            cmenu = 1;
                            cs = lastcs;
                        }
                    } else {
                        if (deathflag == 0) {
                            if (cmenu + 1 == 8)
                                cs = 5;
                            else
                                cs = lastcs;
                            cmenu = 1;
                            PlaySFX(0x33);
                        }
                    }
                }
            }
            if (FeFlag == 0 && GLUE_Finished() != 0)
                optionsflag = 0;
        }
    }
    Adjust = 0;
    if (MemCardActive != 0)
        MemcardOFF();
    if (MemcardOverlay != 0) {
        MemcardOverlay = 0;
        if (FeFlag == 0)
            OVR_LoadGame();
        music_start(sgnMusicTrack);
    }
    if (initchr == 0) {
        if (TSK_Exist(NULL, 0x8001, 0xFFFFFFFF) == NULL && Qfromoptions == 0) {
            GLUE_ResumeGame();
            GLUE_SetShowPanelFlag(1);
            GLUE_SetHomingScrollFlag(1);
            PauseMode = 0;
            PostGamePad(5, 0, 0, 0);
        }
        if (ctrlflag != 0)
            RemoveCtrlScreen();
        if (Qfromoptions == 0)
            GLUE_SetShowGameScreenFlag(1);
    }
}

void ToggleOptions(void)
{
    if (deathflag == 0) {
        if (IS_GameOver())
            return;
    }
    if (optionsflag == 0) {
        msgholdflag = 1;
        PauseMode = 1;
        optionsflag = 1;
        saveflag = 0;
        loadflag = 0;
        AlertTxt = 0;
        StatusTxt = 0;
        cardondelay = 5;
        card_active[1] = 0;
        card_active[0] = 0;
        MemCardActive = 0;
        stream_pause();
        DrawOptionsTask = TSK_AddTask(0, (void (*)())DrawOptions, 0x4000, 0);
        return;
    }
    msgholdflag = 0;
    if (ctrlflag != 0 && !RemoveCtrlScreen()) {
        PlaySFX(0x3D3);
        return;
    }
    if (MemCardActive != 0)
        MemcardOFF();
    if (MemcardOverlay != 0) {
        MemcardOverlay = 0;
        if (FeFlag == 0)
            OVR_LoadGame();
        if (sghMusic == NULL)
            music_start(sgnMusicTrack);
    }
    PauseMode = 0;
    optionsflag = 0;
    stream_resume();
    if (sbookflag == 0)
        options_pad = -1;
}

void FormatPad(void)
{
    CPad *P;
    char *S;

    int sn;

    ActivateMemcard(current_card == 0, (current_card ^ 1) == 0);
    if (current_card == 0)
        sn = 0x288;
    else
        sn = 0x289;
    S = GetStr(sn);
    MediumFont.Print(0, 0x38, S, JustCentre, NULL, GOLDR, GOLDG, GOLDB);

    if (card_status[current_card] == 2) {
        AlertTxt = card_side_empty[current_card];
        ActivateMemcard(1, 1);
        cardondelay = 5;
        saveflag = 0;
        cs = current_card + 1;
        cmenu = ReturnMenu;
        return;
    }

    if (formatflag == 0) {
        P = PAD_GetPad(options_pad, 0);
        LAMBO_MovePad(P);
        if (P->GetDown() & 0x100) {
            PlaySFX(0x33);
            ActivateMemcard(1, 1);
            saveflag = 0;
            AlertTxt = 0;
            cs = current_card + 1;
            cmenu = ReturnMenu;
            return;
        }
        if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
            PlaySFX(0x33);
            if (cs == 1) {
                formatflag = cs;
            } else {
                formatflag = 0;
                saveflag = 0;
                AlertTxt = 0;
                ActivateMemcard(1, 1);
                cs = current_card + 1;
                cmenu = ReturnMenu;
            }
        }
        if (formatflag == 0)
            return;
    }

    formatflag = formatflag + 1;
    if (formatflag < 3)
        return;
    ShowLoadingBox(card_side_format[current_card]);
    if (formatflag < 0xB)
        return;
    if (format_card(current_card) == 0) {
        AlertTxt = 0x507;
        ActivateMemcard(1, 1);
        cardondelay = 5;
        CharacterBlockLoaded = 0;
        saveflag = 0;
        formatflag = 0;
        cs = lastcs;
        cmenu = ReturnMenu;
        return;
    }
    formatflag = 0;
    AlertTxt = 0;
    cs = lastcs;
    cmenu = ReturnMenu;
}

void SaveOverwritePad(void)
{
    CPad *P;
    char *S;
    int sn;

    P = PAD_GetPad(options_pad, 0);
    LAMBO_MovePad(P);
    if (current_card == 0)
        sn = 0x288;
    else
        sn = 0x289;
    S = GetStr(sn);
    MediumFont.Print(0, 0x60, S, JustCentre, NULL, GOLDR, GOLDG, GOLDB);

    if (card_status[current_card] == 2) {
        AlertTxt = card_side_empty[current_card];
        ActivateMemcard(1, 1);
        saveflag = 0;
        cs = current_card + 1;
        cmenu = ReturnMenu;
        return;
    }

    if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
        PlaySFX(0x33);
        if (cs == 2) {
            if (ReturnCards == 1)
                ActivateCharacterMemcard(current_card == 0, (current_card ^ 1) == 0);
            else
                ActivateMemcard(1, 1);
            loadflag = 0;
            saveflag = 0;
        }
        StatusTxt = 0;
        cs = lastlastcs;
        cmenu = ReturnMenu;
        return;
    }

    if (P->GetDown() & 0x100) {
        if (ReturnCards == 1)
            ActivateCharacterMemcard(current_card == 0, (current_card ^ 1) == 0);
        else
            ActivateMemcard(1, 1);
        PlaySFX(0x33);
        loadflag = 0;
        saveflag = 0;
        AlertTxt = 0;
        cs = lastlastcs;
        cmenu = ReturnMenu;
    }
}

void CharCardSelectMemcardPad(void)
{
    OMENUITEM *iptr;
    CPad *P;

    iptr = MenuList[cmenu].Item;
    P = PAD_GetPad(options_pad, 0);
    if (cardondelay > 0) {
        cardondelay = cardondelay - 1;
        ShowLoadingBox(0x348);
        return;
    }
    ActivateMemcard(1, 1);
    if (AlertTxt != 0) {
        ShowAlertBox();
        if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
            PlaySFX(0x33);
            AlertTxt = 0;
        }
        return;
    }
    ShowCardActionText();
    LAMBO_MovePad(P);
    if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
        if (D_8011B3D8[cs] != 2) {
            countdownloadcharblock = 1;
            cardondelay = 5;
            PlaySFX(0x33);
            cmenu = iptr[cs].Link - 1;
            cs = 1;
            lastcs = 1;
            current_card = 0;
            return;
        } else {
            PlaySFX(0x3D3);
            AlertTxt = DoLoadedGame[cs];
        }
    }
    if (P->GetDown() & 0x100) {
        PlaySFX(0x33);
        cs = MenuList[cmenu].NoEntries - 1;
        if (iptr[cs].Link != -2) {
            cmenu = iptr[cs].Link - 1;
            cs = 3;
        }
    }
}

void LAMBO_MovePad(CPad *P)
{
    OMENUITEM *iptr;
    int move;
    int lcs;

    iptr = MenuList[cmenu].Item;
    P = PAD_GetPad(options_pad, 0);
    P->SetPadTick(8);
    P->SetPadTickMask(3);
    move = -(P->GetTick() & 1);
    if (P->GetTick() & 2)
        move = 1;
    lcs = cs;
    cs += move;
    if (iptr[cs].Text == 0) {
        do {
            if (move == 0)
                move = 1;
            if (cs < 0)
                move = 1;
            if (!(cs < MenuList[cmenu].NoEntries - 1))
                move = -1;
            cs += move;
        } while (iptr[cs].Text == 0);
    }
    if (cs <= 0)
        cs = MenuList[cmenu].NoEntries - 2;
    if (!(cs < MenuList[cmenu].NoEntries - 1))
        cs = 1;
    if (cs != lcs)
        PlaySFX(0x32);
}
