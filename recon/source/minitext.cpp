/* MINITEXT.CPP — Diablo PSX (Climax 1998) reconstruction.
 * Twin: refs/diablo-hellfire/src/MINITEXT.CPP -- names only (InitQuestText/FreeQuestText/DrawQTextBack/
 * DrawQText/InitQTextMsg match), the bodies are genuinely different: the PC build blits the quest-text
 * box with inline x86 asm + DirectDraw; the PSX build draws it with the PsyQ font/GPU pipeline
 * (CFont::Print/GetWrap, Dialog::Back, TSK tasks) and computes the scroll speed (CalcTextSpeed) from a
 * VAG voice-file length instead of the PC's fixed qtextDelaySpd[] table.  Reconstructed from the retail
 * asm oracle + skel/SOURCE/MINITEXT.CPP (Ghidra/IDA draft). */
#include "diabpsx_types.h"
#include "source/gen/structs_minitext.h"
#include "source/gen/externs_minitext.h"
#include "source/gen/protos_minitext.h"
#include "source/diablo.h"

/* real (non-static) globals DEFINED in this TU -- see externs_minitext.h note */
unsigned char qtextflag;
int qtextSpd;

/* file statics (SYM STAT records, TU-owned -> tentative defs, gp-rel in the oracle) */
static unsigned char *pMedTextCels;
static unsigned char *pTextBoxCels;
static const char *qtextptr;
static int qtexty;
static BOOL qtbodge;
static int textadj;
static int fetextadj;
static char FadeState;
static BOOL MusicFading;
static int iBookName;
static unsigned long sgLastScroll;
static unsigned long scrolltexty;
static int TextNum;
int TextWait;   /* @0x8011B95C EXT, gp-rel in the oracle -> TU-owned */
static BOOL qtextonflag;

Dialog QBack;   /* @0x800D6790 -- first initialized public global: names the _GLOBAL_.I/D.QBack thunks */

void FreeQuestText(void)
{
}

void InitQuestText(void)
{
    qtextflag = 0;
}

int KANJI_strlen(char *str)
{
    int l;

    l = 0;
    while (*str != 0) {
        if ((unsigned char)*str & 0x80)
            str++;
        str++;
        l++;
    }
    return l;
}

void CalcTextSpeed(const char *Name)
{
    char *ptr;
    char SpeechName[16];
    unsigned long SfxFrames;
    unsigned long TextHeight;

    ptr = (char *)qtextptr;
    if (FileSYS == 2) {
        LANG_TYPE Lang;
        char Prefix[2];
        RECT Window;

        Lang = LANG_GetLang();
        switch (Lang) {
        case LANG_ENGLISH:
            Prefix[0] = 0x45;
            break;
        case LANG_FRENCH:
            Prefix[0] = 0x46;
            break;
        case LANG_GERMAN:
            Prefix[0] = 0x47;
            break;
        case LANG_SWEDISH:
            Prefix[0] = 0x53;
            break;
        case LANG_JAP:
            Prefix[0] = 0x4A;
            break;
        case LANG_NONE:
            if ("NO LANGUAGE SELECTED ???" != NULL)
                DBG_Error(0, "source/MINITEXT.cpp", 0xA5);
            break;
        }
        Prefix[1] = 0;
        sprintf(SpeechName, "%s%s.VAG", Prefix, Name);
        SfxFrames = BL_FileLength(SpeechName, 0);
        if (SfxFrames == 0)
            DBG_Error(0, "source/MINITEXT.cpp", 0xAF);
        SfxFrames /= 105;
        Window.x = 0;
        Window.y = 0;
        Window.w = 0x118;
        Window.h = -1;
        TextHeight = MediumFont.GetWrap(ptr, &Window) * 15 + 0xD7;
        if (FeFlag != 0)
            TextHeight -= fetextadj;
        else
            TextHeight -= textadj;
        qtextSpd = (TextHeight << 16) / SfxFrames;
    } else {
        qtextSpd = 0x10000;
    }
    qtbodge = 0;
    scrolltexty = qtexty << 16;
}

void FadeMusicTSK(TASK *T)
{
    long MusicVolume;

    if (MusicFading == 0) {
        MusicVolume = sglMusicVolume;
        MusicFading = 1;
        while (FadeState != 0) {
            if (sghMusic != NULL) {
                switch (FadeState) {
                case 2:
                    if (MusicVolume < sglMusicVolume) {
                        if (sghMusic->state == 3)
                            STR_SoundCommand(sghMusic, 4);
                        MusicVolume += 0x80;
                    } else {
                        if (sghMusic->state == 3)
                            STR_SoundCommand(sghMusic, 4);
                        FadeState = 0;
                    }
                    break;
                case 3:
                    if (MusicVolume > 0) {
                        MusicVolume -= 0x40;
                    } else {
                        STR_SoundCommand(sghMusic, 3);
                        FadeState = 1;
                    }
                    break;
                }
                sghMusic->s_volume = sghMusic->volume = (MusicVolume * sglMasterVolume) >> 8;
                STR_setvolume(sghMusic);
            }
            TSK_Sleep(1);
        }
        MusicFading = 0;
    }
}

void InitQTextMsg(int m)
{
    TextNum = m;
    if (qtextflag != 0)
        return;
    qtextflag = 1;
    gbProcessPlayers = 0;
    PauseMode = 1;
    TSK_Sleep(1);
    if (FeFlag != 0) {
        switch (m) {
        case 0x103:
            iBookName = 0x2001;
            break;
        case 0x104:
            iBookName = 0x2002;
            break;
        case 0x105:
            iBookName = 0x2003;
            break;
        case 0x106:
            iBookName = 0x2004;
            break;
        case 0x107:
            iBookName = 0x2005;
            break;
        case 0x108:
            iBookName = 0x2006;
            break;
        case 0x109:
            iBookName = 0x2007;
            break;
        case 0x10A:
            iBookName = 0x2008;
            break;
        case 0x10B:
            iBookName = 0x2009;
            break;
        case 0x10C:
            iBookName = 0x200A;
            break;
        }
    }
    stream_stop();
    for (int i = 1; i < 24; i++)
        SpuSetKey(0, 1 << i);
    while (SFXTab[1].used)
        TSK_Sleep(1);
    if (alltext[m].scrlltxt != 0) {
        DEF_ARGS *args;
        CDWAIT = 1;
        if (FadeState == 0)
            TSK_AddTask(0, (void (*)())FadeMusicTSK, 0x800, 0);
        FadeState = 3;
        if (stextflag != 0) {
            GLUE_SetShowGameScreenFlag(0);
            GLUE_SetShowPanelFlag(0);
            GLUE_SuspendGame();
            TSK_Sleep(1);
        }
        if (options_pad == -1)
            options_pad = myplr;
        qtextptr = NULL;
        qtexty = 0xE6;
        args = (DEF_ARGS *)TSK_AddTask(0, (void (*)())DrawQTextTSK, 0x800, 0x10)->Data;
        args->a0 = options_pad;
        args->a1 = m;
    } else {
        qtextflag = 0;
        PauseMode = 0;
        CDWAIT = 0;
        PlaySFX(alltext[m].sfxnr);
        gbProcessPlayers = 1;
    }
}

void DrawQTextBack(void)
{
    QBack.SetBorder(0x1A);
    QBack.SetRGB(BORDERR, BORDERG, BORDERB);
    if (stextflag != 0 && qtextflag == 0) {
        QBack.Back(0x14, 0x14, 0x118, 0xCD);
    } else {
        if (FeFlag == 0) {
            QBack.Back(0x14, 0x14, 0x118, 0xBD);
        } else {
            char BookName[80];
            RECT ClipRect;
            int oldot;

            strcpy(BookName, GetStr(iBookName));
            ClipRect.x = 0x14;
            ClipRect.y = 0;
            ClipRect.w = 0x118;
            ClipRect.h = 0xB9;
            QBack.Back(0x14, 0x40, 0x118, 0x91);
            oldot = LargeFont.SetOTpos(0x80);
            if (LargeFont.GetStrWidth(BookName) < 0x118)
                LargeFont.Print(0, 0x32, BookName, JustCentre, &ClipRect, BLUER, BLUEG, BLUEB);
            else
                LargeFont.Print(0, 0x28, BookName, JustCentre, &ClipRect, BLUER, BLUEG, BLUEB);
            LargeFont.SetOTpos(oldot);
        }
    }
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

unsigned short CPad::GetDown() const
{
    if (get_both != 0)
        return both_Down;
    return Down;
}

void DrawQTextTSK(TASK *T)
{
    DEF_ARGS *args;
    int pnum;
    char Name[14];
    char stextflagsave;

    args = (DEF_ARGS *)T->Data;
    stextflagsave = stextflag;
    pnum = args->a0;
    GLUE_SuspendGame();
    GLUE_SetHomingScrollFlag(0);
    GLUE_SetShowPanelFlag(0);
    qtextptr = GetStr(*(int *)&alltext[args->a1]);
    while (!IsKanjiLoaded())
        TSK_Sleep(1);
    sprintf(Name, "%04X", alltext[args->a1].sfxnr);
    CalcTextSpeed(Name);
    stextflag = 0;
    qtextonflag = qtextflag != 0;
    sgLastScroll = VID_GetTick();
    while (qtextonflag != 0) {
            DrawQText();
            TSK_Sleep(1);
            if (FeFlag != 0) {
                if (PAD_GetPad(0, 1)->GetDown() & 0x100)
                    qtextonflag = 0;
            } else if (PAD_GetPad(pnum, 0)->GetDown() & 0x100) {
                ignore_buttons = 1;
                qtextonflag = 0;
            }
            if (qtextonflag == 0 && CDWAIT != 0)
                qtextonflag = 1;
    }
    CDWAIT = 1;
    PauseMode = 1;
    qtextonflag = 0;
    ignore_buttons = 1;
    PlaySFX(0x33);
    stream_stop();
    while (SFXTab[1].used)
        TSK_Sleep(1);
    if (FadeState == 0)
        TSK_AddTask(0, (void (*)())FadeMusicTSK, 0x800, 0);
    FadeState = 2;
    stextflag = stextflagsave;
    if (stextflagsave == 0)
        options_pad = -1;
    if (Qfromoptions != 0) {
        options_pad = Qfromoptions - 1;
    } else {
        if (stextflagsave == 0 && questlog == 0) {
            PostGamePad(5, 0, 0, 0);
            GLUE_SetHomingScrollFlag(1);
            GLUE_SetShowPanelFlag(1);
        }
        ignore_buttons = 1;
    }
    LANG_ReloadMainTXT();
}

void DrawQText(void)
{
    char *p;
    const char *pnl;
    char *SpacePtr;
    int ty;
    int l;
    unsigned char doneflag;
    RECT ClipRect;
    unsigned long currTime;
    int LetterCount;
    int KanjiCount;
    char *t;
    int textot;
    int OldDOt;
    int OldOt;
    int TextYSize;

    memset(tempstr, 0, 0x100);
    if (FeFlag == 0) {
        ClipRect.x = 0x14;
        ClipRect.y = 0x18;
        ClipRect.w = 0x118;
        ClipRect.h = 0xB9;
    } else {
        ClipRect.x = 0x14;
        ClipRect.y = 0x40;
        ClipRect.w = 0x118;
        ClipRect.h = 0x91;
    }
    textot = CBlocks::GetOverlayOtBase();
    OldDOt = QBack.SetOTpos(textot - 1);
    OldOt = MediumFont.SetOTpos(textot);
    DrawQTextBack();
    QBack.SetOTpos(OldDOt);
    if (qtextptr == NULL)
        return;
    if (!BL_AsyncLoadDone())
        return;
    pnl = NULL;
    doneflag = 0;
    p = (char *)qtextptr;
    ty = qtexty;
    while (!doneflag) {
        char c;

        l = 0;
        SpacePtr = NULL;
        LetterCount = 0;
        KanjiCount = 0;
        t = tempstr;
        do {
            c = *p;
            if (c == '
' || c == 0)
                break;
            *t = c;
            p++;
            l += MediumFont.GetCharWidth(*t);
            if (*t == ' ') {
                SpacePtr = p - 1;
                LetterCount = 0;
            }
            if (*t & 0x80) {
                KanjiCount += 2;
                t++;
                *t = *p++;
            } else {
                LetterCount++;
            }
            t++;
        } while (l < 0x118);
        if (l >= 0x118 && SpacePtr != NULL) {
            p = SpacePtr;
            t -= LetterCount;
            t -= KanjiCount;
        }
        if (*p == '
')
            p++;
        if (*p == 0)
            doneflag = 1;
        *t = 0;
        KANJI_strlen(tempstr);
        if (FeFlag != 0)
            MediumFont.Print(0x10, ty - 0x46, tempstr, JustLeft, &ClipRect, BORDERR, BORDERG, BORDERB);
        else
            MediumFont.Print(0x10, ty - 0x1E, tempstr, JustLeft, &ClipRect, BORDERR, BORDERG, BORDERB);
        if (pnl == NULL)
            pnl = p;
        ty += 0xF;
        if (ty >= 0xE7)
            doneflag = 1;
    }
    if (FileSYS == 2) {
        if (sghStream == NULL && qtexty > TextWait) {
            long diff;

            currTime = VID_GetTick();
            diff = -0x10000;
            scrolltexty += diff;
            sgLastScroll = currTime;
            qtexty = scrolltexty >> 16;
            if (TextWait >= qtexty)
                PlaySFX(alltext[TextNum].sfxnr);
        }
        if (sghStream != NULL) {
            long diff;

            currTime = VID_GetTick();
            diff = currTime - sgLastScroll;
            if (diff < 0)
                diff = -diff;
            sgLastScroll = currTime;
            scrolltexty -= qtextSpd * diff;
            qtexty = scrolltexty >> 16;
            if (sghStream->playing != 0 && sghStream->stream_stall == 0)
                qtbodge = 1;
        } else {
            if (qtbodge != 0) {
                long diff;

                currTime = VID_GetTick();
                diff = currTime - sgLastScroll;
                if (diff < 0)
                    diff = -diff;
                sgLastScroll = currTime;
                scrolltexty -= diff * qtextSpd;
                qtexty = scrolltexty >> 16;
            }
        }
    } else {
        currTime = VID_GetTick();
        scrolltexty -= qtextSpd * (currTime - sgLastScroll);
        sgLastScroll = currTime;
        qtexty = scrolltexty >> 16;
    }
    if (FeFlag != 0)
        TextYSize = 0x3C;
    else
        TextYSize = 0xF;
    if (qtexty <= TextYSize) {
        scrolltexty += 0xF0000;
        qtextptr = pnl;
        qtexty = scrolltexty >> 16;
        if (pnl[-1] == 0)
            qtextonflag = 0;
        if (pnl[0] == 0)
            qtextonflag = 0;
        if (pnl[1] == 0)
            qtextonflag = 0;
        if (sghStream != NULL && qtextonflag == 0)
            qtextonflag = 1;
    }
    if (FeFlag != 0)
        strcpy(MtPrevText, GetStr(0x2000));
    else
        strcpy(MtPrevText, GetStr(0x10C1));
    MediumFont.Print((0x100 - MediumFont.GetStrWidth(MtPrevText)) / 2 + 0x20, 0xE0, MtPrevText, JustLeft, NULL,
                     WHITER, WHITEG, WHITEB);
    MediumFont.SetOTpos(OldOt);
}
