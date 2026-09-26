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
static unsigned char FadeState;
static BOOL MusicFading;
static int iBookName;
static unsigned long sgLastScroll;
static unsigned long scrolltexty;
static int TextNum;
static BOOL qtextonflag;

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
    LANG_TYPE Lang;
    char Prefix[2];
    RECT Window;
    unsigned long TextHeight;

    ptr = (char *)qtextptr;
    if (FileSYS == 2) {
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
        Window.x = 0;
        Window.y = 0;
        Window.w = 0x118;
        Window.h = -1;
        TextHeight = MediumFont.GetWrap(ptr, &Window);
        if (FeFlag != 0)
            textadj = fetextadj;
        qtextSpd = (((SfxFrames * 0x38138139) >> 32) * 15 + 0xD7 - textadj) << 16 / TextHeight;
        qtbodge = 0;
        scrolltexty = qtexty << 16;
    } else {
        qtextSpd = 0x10000;
    }
    qtbodge = 0;
    scrolltexty = qtexty << 16;
}

void FadeMusicTSK(TASK *T)
{
    long MusicVolume;
    int Command;
    unsigned char state;

    if (MusicFading == 0) {
        MusicVolume = sglMusicVolume;
        state = FadeState;
        MusicFading = 1;
        if ((signed char)FadeState != 0) {
            do {
                if (sghMusic != NULL) {
                    switch ((signed char)state) {
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
                    Command = (MusicVolume * sglMasterVolume) >> 8;
                    sghMusic->volume = Command;
                    sghMusic->s_volume = Command;
                    STR_setvolume(sghMusic);
                }
                TSK_Sleep(1);
                state = FadeState;
            } while ((signed char)FadeState != 0);
        }
        MusicFading = 0;
    }
}

void InitQTextMsg(int m)
{
    int i;
    TASK *t;
    void **args;

    TextNum = m;
    if (qtextflag == 0) {
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
        i = 1;
        do {
            SpuSetKey(0, 1 << i);
            i++;
        } while (i < 24);
        if (alltext[m].scrlltxt != 0) {
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
            t = TSK_AddTask(0, (void (*)())DrawQTextTSK, 0x800, 0x10);
            args = (void **)t->Data;
            args[0] = (void *)options_pad;
            args[1] = (void *)m;
            return;
        }
        qtextflag = 0;
        PauseMode = 0;
        CDWAIT = 0;
        PlaySFX(alltext[m].sfxnr);
        gbProcessPlayers = 1;
    }
}

void DrawQTextBack(void)
{
    char BookName[80];
    RECT ClipRect;
    int oldot;
    int H;

    QBack.SetBorder(0x1A);
    QBack.SetRGB(BORDERR, BORDERG, BORDERB);
    if ((stextflag != 0 && qtextflag == 0) || FeFlag == 0) {
        QBack.Back(0x14, 0x14, 0x118, (stextflag != 0 && qtextflag == 0) ? 0xCD : 0xBD);
        return;
    }
    strcpy(BookName, GetStr(iBookName));
    ClipRect.x = 0x14;
    ClipRect.w = 0x118;
    ClipRect.h = 0xB9;
    ClipRect.y = 0;
    QBack.Back(0x14, 0x40, 0x118, 0x91);
    oldot = LargeFont.SetOTpos(0x80);
    if (LargeFont.GetStrWidth(BookName) < 0x118)
        H = 0x32;
    else
        H = 0x28;
    LargeFont.Print(0, H, BookName, JustCentre, &ClipRect, BLUER, BLUEG, BLUEB);
    LargeFont.SetOTpos(oldot);
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
