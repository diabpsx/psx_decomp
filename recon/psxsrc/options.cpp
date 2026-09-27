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
static int cs;              /* D_8011B230 -- confirmed by SYM: real name IS "cs", a single shared
                              * "current highlighted menu item" static used by GameSpeedPad (as the
                              * speed-submenu sub-selection counter) AND by CentrePad/LAMBO_MovePad
                              * (as the active menu's cursor position) -- ONE static, not per-function. */
static int lastcs;          /* D_8011B234 -- SYM name "lastcs"; CentrePad's previous-frame cs snapshot */
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
int options_pad;
TASK *DrawOptionsTask;
int ReturnMenu;                 /* gp_rel in FormatPad's oracle -> owned here */
BOOL CharacterBlockLoaded;      /* gp_rel in FormatPad's oracle -> owned here */
int ReturnCards;                /* gp_rel in SaveOverwritePad's oracle -> owned here */
static int lastlastcs;          /* D_8011B238 -- SYM name "lastlastcs" */
static int Spacing;             /* D_8011B22C -- SYM name "Spacing" */
static unsigned char KeyPos;    /* D_8011B270 -- SYM name "KeyPos" */
static BOOL debounce;           /* D_8011B26C -- SYM name "debounce" */
static LANG_TYPE OldLang;       /* D_8011C708 -- SYM name "OldLang" */

/* ---------------------------------------------------------------- header-copy methods ---- */
unsigned short CPad::GetDown() const
{
    if (get_both != 0)
        return both_Down;
    return Down;
}

unsigned short CPad::GetUp() const
{
    if (get_both != 0)
        return both_Up;
    return Up;
}

unsigned short CPad::GetTick() const
{
    if (get_both != 0)
        return both_Tick;
    return Tick;
}

Dialog::Dialog()
{
    BackGfx = 0x94;
    BevelGfx = 0x1A;
    BorderGfx = 0x1A;
    DialogRed = 0x80;
    DialogGreen = 0x80;
    DialogBlue = 0x80;
    DialogTRed = 0x20;
    DialogTGreen = 0x20;
    DialogTBlue = 0x20;
    DialogOTpos = CBlocks::GetOverlayOtBase();
}

Dialog::~Dialog()
{
}

void Dialog::SetRGB(unsigned char R, unsigned char G, unsigned char B)
{
    DialogRed = R;
    DialogGreen = G;
    DialogBlue = B;
}

static void PRIM_GetPrim(POLY_G4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_G4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 0x44);
    *Prim = (POLY_G4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_G4 *)ThisPrimAddr + 1);
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

    String = GetStr(MONO != 0 ? 0x29A : 0x29C);
    len = MediumFont.GetStrWidth(String) >> 1;
    MediumFont.Print(MonoX - len, ypos, String, JustLeft, &ORect, WHITER, WHITEG, WHITEB);
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

void SwitchMONO(void)
{
    PlaySFX(0x33);
    if (MONO != 0) {
        MONO = 0;
        return;
    }
    MONO = 1;
}

void CalcVolumes(void)
{
    int unit;
    int mixedVolume;
    int streamVolume;

    sglMasterVolume = MasterVol * (0xE6 / sw);
    sglMusicVolume = MusicVol * (0x1FFF / sw);
    unit = 0x3FFF / sw;
    sglSoundVolume = SoundVol * unit;
    sglSpeechVolume = SpeechVol * unit;
    if (sghMusic != NULL) {
        mixedVolume = (sglMusicVolume * sglMasterVolume) >> 8;
        sghMusic->s_volume = mixedVolume;
        sghMusic->volume = mixedVolume;
        STR_setvolume(sghMusic);
    }
    if (sghStream != NULL) {
        if (sgpStreamSFX->flags & 1)
            streamVolume = sglSoundVolume;
        else
            streamVolume = sglSpeechVolume;
        mixedVolume = (streamVolume * sglMasterVolume) >> 8;
        sghStream->s_volume = mixedVolume;
        sghStream->volume = mixedVolume;
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
    MasterVol &= ~1;
    MusicVol = mv;
    MusicVol &= ~1;
    SoundVol = sv;
    SoundVol &= ~1;
    SpeechVol = spv;
    SpeechVol &= ~1;
}

void GetVolumes(void)
{
    int m;
    OMENULIST *ml;
    int i;
    char *p;
    unsigned long *var;
    int val;

    SetLoadedVolumes();
    for (m = 0; m < 10; m++) {
        ml = &MenuList[m];
        i = 0;
        if (ml->NoEntries > 0) {
            p = (char *)ml->Item + 0xC;
            do {
                var = *(unsigned long **)(p + 4);
                if (var != NULL) {
                    val = *var;
                    *(int *)p = val;
                    if (sw < val)
                        *(int *)p = sw;
                }
                i++;
                p += 0x18;
            } while (i < ml->NoEntries);
        }
    }
}

GM_SPEEDS AlterSpeedMenu(GM_SPEEDS gs)
{
    OMENUITEM *it;

    it = MenuList[cmenu].Item + 1;
    switch (gs) {
    case GM_SPEED_NORMAL:
        it->len = 1;
        it[1].len = 0;
        return gs;
    case GM_SPEED_FAST:
        it->len = 0;
        it[1].len = gs;
        return gs;
    default:
        return gs;
    }
}

void GameSpeedPad(void)
{
    int keys;
    int slower, faster, toggle;

    toggle = 0;
    keys = PAD_GetPad(options_pad, 0)->GetDown() & 0xFFFF;
    AlterSpeedMenu(GetSpeed());
    faster = keys & 2;
    if (keys & 0x100) {
        PlaySFX(0x33);
        toggle = 1;
        faster = keys & 2;
    }
    slower = keys & 1;
    if (faster != 0) {
        PlaySFX(0x32);
        cs = cs + 1;
        slower = keys & 1;
        if (cs >= 3) {
            cs = 1;
            slower = keys & 1;
        }
    }
    if (slower != 0) {
        PlaySFX(0x32);
        cs = cs - 1;
        if (cs == 0)
            cs = 2;
    }
    if (keys & 0x40) {
        PlaySFX(0x33);
        if (cs == 1)
            SetSpeed(GM_SPEED_NORMAL);
        else if (cs == 2)
            SetSpeed(GM_SPEED_FAST);
    }
    if (toggle != 0) {
        cmenu = 1;
        cs = 0xA;
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

/* ---------------------------------------------------------------- large dialog/pad functions ---- */

void PrintSelectBack(unsigned short Str)
{
    char *S;
    int y;

    if (Str == 0x49E) {
        S = GetStr(0x49E);
        y = 0xDE;
    } else {
        S = GetStr(Str);
        y = 0xE0;
    }
    MediumFont.Print(0, y, S, JustCentre, NULL, WHITER, WHITEG, WHITEB);
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

void LAMBO_MovePad(CPad *P)
{
    OMENUITEM *iptr;
    int move;
    int lcs;
    CPad *Pad;

    iptr = MenuList[cmenu].Item;
    Pad = PAD_GetPad(options_pad, 0);
    Pad->SetPadTick(8);
    Pad->SetPadTickMask(3);
    move = -(Pad->GetTick() & 1);
    if (Pad->GetTick() & 2)
        move = 1;
    lcs = cs + move;
    cs = lcs;
    if (iptr[lcs].Text == 0) {
        do {
            if (move == 0)
                move = 1;
            lcs = cs;
            if (lcs < 0)
                move = 1;
            if (lcs < MenuList[cmenu].NoEntries - 1)
                lcs = lcs + move;
            else {
                move = -1;
                lcs = lcs + move;
            }
            cs = lcs;
        } while (iptr[lcs].Text == 0);
    }
    if (cs <= 0)
        cs = MenuList[cmenu].NoEntries - 2;
    if (!(cs < MenuList[cmenu].NoEntries - 1))
        cs = 1;
    if (cs != lcs)
        PlaySFX(0x32);
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
    CPad *P;
    OMENUITEM *iptr;
    int pressed;

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
        pressed = 0;
        if (P->GetDown() & 0x40)
            pressed = 1;
        else if (P->GetDown() & 0x10)
            pressed = 1;
        if (pressed) {
            PlaySFX(0x33);
            AlertTxt = 0;
        }
        return;
    }
    ShowCardActionText();
    LAMBO_MovePad(P);
    pressed = 0;
    if (P->GetDown() & 0x40)
        pressed = 1;
    else if (P->GetDown() & 0x10)
        pressed = 1;
    if (pressed) {
        if (D_8011B3D8[cs] != 2) {
            int oldcs;
            int link;

            oldcs = cs;
            link = iptr[oldcs].Link;
            countdownloadcharblock = 1;
            cardondelay = 5;
            PlaySFX(0x33);
            cs = 1;
            lastcs = 1;
            current_card = 0;
            cmenu = link - 1;
            return;
        } else {
            PlaySFX(0x3D3);
            AlertTxt = DoLoadedGame[cs];
        }
    }
    if (P->GetDown() & 0x100) {
        int n, link;

        PlaySFX(0x33);
        n = MenuList[cmenu].NoEntries - 1;
        cs = n;
        link = iptr[n].Link;
        if (link != -2) {
            cmenu = link - 1;
            cs = 3;
        }
    }
}

void CharacterLoadPad(void)
{
    OMENUITEM *iptr;
    CPad *P;

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
        int pressed;

        ShowAlertBox();
        pressed = 0;
        if (P->GetDown() & 0x40)
            pressed = 1;
        else if (P->GetDown() & 0x10)
            pressed = 1;
        if (pressed) {
            int n, link;

            n = MenuList[cmenu].NoEntries - 1;
            cs = n;
            link = iptr[n].Link;
            if (link != -2) {
                cmenu = link - 1;
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
    {
        int pressed;

        pressed = 0;
        if (card_status[current_card] == 0) {
            ShowCharacterFiles(cs - 1, Spacing, ORect, 0x58);
            pressed = 0;
        }
        if (P->GetDown() & 0x40)
            pressed = 1;
        else if (P->GetDown() & 0x10)
            pressed = 1;
        if (pressed) {
            if (saveflag == 0) {
                if (card_status[current_card] != 2) {
                    PlaySFX(0x33);
                    if (GetSaveStatusMessage(1, DiabloCharacterFile) == 0) {
                        /* nothing */
                    } else {
                        saveflag = 1;
                        if (card_usable[current_card] == 0) {
                            ReturnMenu = cmenu;
                            lastcs = cs;
                            cmenu = 0x10;
                            formatflag = 0;
                            cs = 2;
                            return;
                        } else {
                            int idx;

                            idx = cs - 1;
                            if (D_80157B68[1272 * idx] != 0) {
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
                } else {
                    PlaySFX(0x3D3);
                    return;
                }
            }
        }
        if (saveflag < 3)
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
                        ActivateMemcard(0, 0);
                    }
                }
            }
            return;
        }
        LAMBO_MovePad(P);
        if (P->GetDown() & 0x100) {
            int n, link;

            PlaySFX(0x33);
            n = MenuList[cmenu].NoEntries - 1;
            CharacterBlockLoaded = 0;
            cs = n;
            link = iptr[n].Link;
            if (link != -2) {
                cmenu = link - 1;
                cs = current_card + 1;
            }
        }
    }
}

void MemcardPad(void)
{
    CPad *P;
    int move;
    OMENUITEM *iptr;
    int lcs;

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
    if (AlertTxt != 0)
        goto L_9080;
    if (saveflag != 0)
        goto L_9124;
    if (loadflag != 0)
        goto L_9080;

    ShowCardActionText();
    if (P->GetTick() & 1)
        move = -1;
    if (P->GetTick() & 2)
        move = 1;
    lcs = cs + move;
    cs = lcs;
    if (iptr[lcs].Text == 0) {
        do {
            if (move == 0)
                move = 1;
            lcs = cs;
            if (lcs < 0)
                move = 1;
            if (lcs < MenuList[cmenu].NoEntries - 1)
                lcs = lcs + move;
            else {
                move = -1;
                lcs = lcs + move;
            }
            cs = lcs;
        } while (iptr[lcs].Text == 0);
    }
    if (cs <= 0)
        cs = MenuList[cmenu].NoEntries - 2;
    if (!(cs < MenuList[cmenu].NoEntries - 1))
        cs = 1;
    if (cs != lcs)
        PlaySFX(0x32);
    if (P->GetDown() & 0x100) {
        int n, link;

        n = MenuList[cmenu].NoEntries - 1;
        link = iptr[n].Link;
        if (link != -2) {
            cmenu = link - 1;
            cardondelay = 5;
            cs = lastcs;
        }
        return;
    }

    if (!(P->GetDown() & 0x40))
        goto L_8FC8;
    if (saveflag != 0)
        goto L_8FC8;
    if (loadflag != 0)
        goto L_9114;

    if (cs == 1)
        current_card = 0;
    else
        current_card = 1;
    PlaySFX(0x33);

    switch (cmenu - 9) {
    case 8: /* L800A8C28 */
        Savefilename = DiabloOptionFile;
        save_blocks = 1;
        if (GetSaveStatusMessage(1, DiabloOptionFile) == 0)
            goto L_8E4C;
        saveflag = 1;
        if (test_card_format(current_card) == 0) {
            move = 0;
        } else {
            if (GetFileNumber(current_card, Savefilename) == -1)
                move = 0;
            else
                move = 1;
        }
        if (move != 0)
            goto L_8DA8;
        goto L_8F0C;

    case 9: /* L800A8CA4 */
        if (card_status[current_card] == 2) {
            AlertTxt = card_side_empty[current_card];
            goto L_8E94;
        }
        if (card_usable[current_card] == 0) {
            AlertTxt = 0x509;
            goto L_8E4C;
        }
        if (GetFileNumber(current_card, DiabloOptionFile) == -1) {
            AlertTxt = card_side_noopt[current_card];
            goto L_8E94;
        } else {
            loadflag = 4;
            Loadfilename = DiabloOptionFile;
            goto L_8F0C;
        }

    case 3: /* L800A8D48 */
        save_blocks = 10;
        Savefilename = DiabloGameFile;
        if (GetSaveStatusMessage(save_blocks, DiabloGameFile) == 0)
            goto L_8E4C;
        saveflag = 1;
        if (GetFileNumber(current_card, Savefilename) == -1)
            goto L_8F0C;
        goto L_8DA8;

L_8DA8:
        ActivateMemcard(current_card == 0, (current_card ^ 1) == 0);
        ReturnCards = 2;
        ReturnMenu = cmenu;
        lastlastcs = cs;
        cmenu = 0x13;
        cs = 2;
        goto L_91F8;

    case 0:
    case 2: /* L800A8DF0 */
        if (card_status[current_card] == 2) {
            AlertTxt = card_side_empty[current_card];
            goto L_8E94;
        }
        if (card_usable[current_card] == 0) {
            AlertTxt = 0x509;
            goto L_8E4C;
        }
        if (GetFileNumber(current_card, DiabloGameFile) == -1) {
            AlertTxt = card_side_nogame[current_card];
            goto L_8E94;
        } else {
            loadflag = 4;
            Loadfilename = DiabloGameFile;
            goto L_8F0C;
        }

L_8E94:
        PlaySFX(0x3D3);
        goto L_8F0C;

L_8E4C:
        PlaySFX(0x3D3);
        goto L_8F0C;

    default: /* L800A8ECC */
        {
            int n, link;

            n = cs;
            link = iptr[n].Link;
            if (link == -2)
                goto L_8F0C;
            cmenu = link - 1;
            lastcs = n;
            cs = 1;
            goto L_91F8;
        }
    }

L_8F0C:
    if (saveflag != 0) {
        if (card_status[current_card] != 2) {
            if (card_usable[current_card] == 0) {
                if (read_card_block(current_card, 0) != 0) {
                    if (block_buf[0] != 0x4D) {
                        if (block_buf[1] != 0x43) {
                            int oldcmenu, oldcs;

                            oldcmenu = cmenu;
                            oldcs = cs;
                            cmenu = 0x10;
                            formatflag = 0;
                            cs = 2;
                            ReturnMenu = oldcmenu;
                            lastlastcs = oldcs;
                            goto L_91F8;
                        }
                    }
                }
            }
        }
        saveflag = 0;
    }
L_8FC8:
    if (loadflag != 0)
        goto L_9114;
    if (saveflag != 0)
        goto L_9124;
    if (cmenu - 0x11 < 2) {
        ShowGameFiles(DiabloOptionFile, 0, 0xD, ORect, 0x1C);
    } else {
        ShowGameFiles(DiabloGameFile, 0, 0xD, ORect, 0x1C);
    }
    goto L_9114;

L_9080:
    if (saveflag != 0)
        goto L_9124;
    if (loadflag != 0)
        goto L_9114;
    {
        int pressed;

        ShowAlertBox();
        pressed = 0;
        if (P->GetDown() & 0x40)
            pressed = 1;
        else if (P->GetDown() & 0x10)
            pressed = 1;
        if (pressed) {
            loadflag = 0;
            saveflag = 0;
            formatflag = 0;
            AlertTxt = 0;
            StatusTxt = 0;
            PlaySFX(0x33);
        }
    }
L_9114:
L_9124:
    if (saveflag < 3) {
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
L_91F8:
    return;
}

void SoundPad(void)
{
    CPad *P;
    int move;
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

    if (KeyTab[KeyPos] & P->GetDown()) {
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

    move = 0;
    if (P->GetTick() & 1)
        move = -1;
    if (P->GetTick() & 2)
        move = 1;
    iptr = MenuList[cmenu].Item;
    lcs = cs + move;
    cs = lcs;
    if (iptr[lcs].Text == 0) {
        do {
            if (move == 0)
                move = 1;
            lcs = cs;
            if (lcs < 0)
                move = 1;
            if (lcs < MenuList[cmenu].NoEntries - 1)
                lcs = lcs + move;
            else {
                move = -1;
                lcs = lcs + move;
            }
            cs = lcs;
        } while (iptr[lcs].Text == 0);
    }
    if (cmenu != 1 && cmenu != 8) {
        if (cs <= 0)
            cs = MenuList[cmenu].NoEntries - 2;
        if (!(cs < MenuList[cmenu].NoEntries - 1))
            cs = 1;
    }
    if (cs != lcs)
        PlaySFX(0x32);

    if (cmenu == 3) {
        int i;

        for (i = 5; i >= 1; i--)
            iptr[i].len = 0;
        iptr[NewLang].len = 1;
        if (NewLang != OldLang) {
            PlaySFX(0x33);
            ChangeLang();
            OldLang = NewLang;
        }
    }

    if (cmenu == 6) {
        if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
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
        int link;

        they_pressed = who_pressed(0x50);
        link = iptr[cs].Link;
        if (link == -1) {
            PlaySFX(0x33);
            Adjust = 0;
            ToggleOptions();
            if (optionsflag != 0)
                return;
            ignore_buttons = 1;
            return;
        }
        if (link == -2) {
            if (cmenu == 3) {
                NewLang = cs - 1;
                return;
            }
            /* else: fall through to the post-dispatch tail below */
        } else if (DiabloDieFlag == 0 || (link != 0xD && (cmenu != 1 || cs > 4))) {
            PlaySFX(0x33);
            link = iptr[cs].Link;
            lastcs = cs;
            cmenu = link - 1;
            if (link == 1 && FeFlag == 0)
                cmenu = link;
            if (cmenu == 0x17) {
                if (Qfromoptions == 0 || cs != 4) {
                    Qfromoptions = options_pad + 1;
                } else {
                    GLUE_SetShowGameScreenFlag(1);
                    cmenu = 0;
                    Qfromoptions = 0;
                    debounce = 1;
                }
            } else {
                cs = 1;
            }
            if (cmenu == 10) {
                GM_SPEEDS spd = GetSpeed();
                if (spd == GM_SPEED_NORMAL)
                    cs = 1;
                else if (spd == GM_SPEED_FAST)
                    cs = 2;
            }
            if (deathflag != 0 && cmenu < 2) {
                cs = lastcs;
                cmenu = 8;
                Adjust = 0;
                return;
            }
            if (cmenu - 5 < 2)
                cs = 2;
            Adjust = 0;
            return;
        } else {
            PlaySFX(0x3D3);
            return;
        }
    }

    if (cmenu == 2 && cs == 5) {
        if (P->GetDown() & 0xC)
            SwitchMONO();
    }
    if ((P->GetDown() & 0x100) && PadFrig != 0) {
        PadFrig = 0;
        return;
    }
    if (!(P->GetDown() & 0x100))
        return;
    if (cmenu != 8) {
        int link;

        if (Qfromoptions != 0) {
            PlaySFX(0x33);
            GLUE_SetShowGameScreenFlag(1);
            Qfromoptions = 0;
            return;
        }
        cs = MenuList[cmenu].NoEntries - 1;
        link = iptr[cs].Link;
        if (link == -1 || link == 6) {
            PlaySFX(0x33);
            Adjust = 0;
            ToggleOptions();
            if (optionsflag != 0)
                return;
            ignore_buttons = 0;
            return;
        }
        if (link == -2)
            return;
        PlaySFX(0x33);
        if (deathflag == 0) {
            if (cmenu == 7) {
                cmenu = iptr[cs].Link - 1;
                Adjust = 0;
                cs = 5;
            } else {
                Adjust = 0;
                cmenu = iptr[cs].Link - 1;
                cs = lastcs;
            }
        } else {
            if (cmenu == 6) {
                cmenu = 8;
                Adjust = 0;
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
    PlaySFX(0x3D3);
}
