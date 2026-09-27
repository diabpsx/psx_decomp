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
static int cs;             /* D_8011B230 -- GameSpeedPad's sub-selection counter */

/* real (non-static) globals DEFINED in this TU (SYM EXT, oracle reaches them via %gp_rel) */
unsigned long MasterVol;
unsigned long MusicVol;
unsigned long SoundVol;
unsigned long SpeechVol;

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

void SetLoadedLang(LANG_TYPE Lang)
{
    if (Lang != LANG_GetLang()) {
        CDWAIT = 1;
        music_stop();
        LANG_SetLang(Lang);
        if (FileSYS != 1)
            BL_LoadStreamDir();
        if (!IsGameLoading()) {
            music_start(sgnMusicTrack);
            STR_pauseall();
            snd_stop_snd(0);
        }
        CDWAIT = 0;
    }
    NewLang = Lang;
    OrigLang = Lang;
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

    String = GetStr(MONO != 0 ? 0x29A : 0x29C);
    MediumFont.Print(MonoX - (MediumFont.GetStrWidth(String) >> 1), ypos, String, JustLeft, &ORect, WHITER, WHITEG, WHITEB);
}

int who_pressed(int mask)
{
    CPad *P0, *P1;

    P0 = PAD_GetPad(0, 0);
    P1 = PAD_GetPad(1, 0);
    if (P0->GetDown() & 0xFFFF & mask)
        return 0;
    if (P1->GetDown() & 0xFFFF & mask)
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
    char *it;

    it = (char *)MenuList[cmenu].Item + 0x18;
    switch (gs) {
    case GM_SPEED_NORMAL:
        *(int *)(it + 0xC) = 1;
        *(int *)(it + 0x24) = 0;
        return gs;
    case GM_SPEED_FAST:
        *(int *)(it + 0xC) = 0;
        *(int *)(it + 0x24) = gs;
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
    if (deathflag != 0 || !IS_GameOver()) {
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
}
