#ifndef PSXSRC_OPTIONS_H
#define PSXSRC_OPTIONS_H
/* OPTIONS.CPP -- Climax PSX options-menu layer (C:\diabpsx\PSXSRC\OPTIONS.CPP).  PSX-only: no PC twin
 * (devilution/devilutionx don't have a PSXSRC layer; the closest PC analogue -- CONTROL.CPP's option
 * panel -- shares no code with this GPU/CPad-driven menu). Reconstructed from the retail asm oracle +
 * skel/PSXSRC/OPTIONS.CPP (Ghidra/IDA draft) + refs/skeleton/JAP_1998_05_29/DIABPSX/PSXSRC headers. */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"

enum LANG_TYPE {
    LANG_NONE = 5,
    LANG_JAP = 4,
    LANG_SWEDISH = 3,
    LANG_GERMAN = 2,
    LANG_FRENCH = 1,
    LANG_ENGLISH = 0
};

enum TXT_JUST {
    JustRight = 2,
    JustCentre = 1,
    JustLeft = 0
};

enum GM_SPEEDS {
    GM_SPEED_NORMAL = 0,
    GM_SPEED_FAST = 1,
    GM_SPEED_FASTER = 2,
    GM_SPEED_FASTEST = 3
};

int VID_GetXOff(void);   /* @0x8008416C VID.CPP */
int VID_GetYOff(void);   /* @0x80084178 VID.CPP */
void VID_SetXYOff(int X, int Y);   /* @0x8008415C VID.CPP */
void DaveCentreStuff(void);   /* @0x800847D4 -- real fn, another TU */

struct FRAME_HDR {   /* size 12; only .W accessed here */
    unsigned int FrOffset;
    unsigned int X : 8, Y : 8, PalNum : 8, NotTrans : 1, Rotated : 1, InVRAM : 1, CompType : 2,
        Floor : 1, Cycle : 1, pad : 1;
    unsigned int W : 9, H : 9, PentaGram : 1, pad2 : 13;
};
struct TextDat {   /* sizeof 112 (SYM); only Frames is named */
    unsigned char _pad0[0x24];
    FRAME_HDR *Frames;   /* +0x24 */
    unsigned char _rest[112 - 0x28];

    POLY_FT4 * PrintFt4(int a, int b, int c, int d, int e, int f);
    POLY_GT4 * PrintGt4(int a, int b, int c, int d, int e, int f);
    /* GMAN.H in-class inline; -fno-inline emits the out-of-line copy (GetFr__7TextDati_800ab694) here */
    FRAME_HDR *GetFr(int FrNum) { return Frames + (unsigned short)FrNum; }
};
TextDat * GM_UseTexData(int idx);   /* @0x80093C10 */
void GM_FinishedUsing(TextDat *td);   /* @0x80093D80 */
extern short Circle[64];   /* @0x800CD2E0 -- sin/cos lookup table, another module */
extern "C" unsigned long GU_GetRnd(void);   /* @0x80020CF4 */
unsigned long VID_GetTick(void);   /* @0x800840F8 VID.CPP */

struct CFont {   /* sizeof 540 */
    int TextureId;   /* +0x0 */
    unsigned short FontTab[256];   /* +0x4 */
    int PrintyOTpos;   /* +0x204 */
    int MinX;   /* +0x208 */
    int MaxX;   /* +0x20C */
    int Width;   /* +0x210 */
    struct TextDat *ThisDat;   /* +0x214 */
    unsigned char FontHeight;   /* +0x218 */

    int GetStrWidth(char *Str);
    int Print(int X, int Y, char *Str, TXT_JUST Justify, RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
};

struct CPad {   /* sizeof 236 */
    unsigned char get_both;   /* +0x0 */
    unsigned char active;   /* +0x1 */
    unsigned char PadType;   /* +0x2 */
    unsigned char PADTICK;   /* +0x3 */
    unsigned short PADTICKMASK;   /* +0x4 */
    unsigned short PadNum;   /* +0x6 */
    unsigned short Cur;   /* +0x8 */
    unsigned short Up;   /* +0xA */
    unsigned short Down;   /* +0xC */
    unsigned short Tick;   /* +0xE */
    unsigned short Old;   /* +0x10 */
    unsigned short both_Cur;   /* +0x12 */
    unsigned short both_Up;   /* +0x14 */
    unsigned short both_Down;   /* +0x16 */
    unsigned short both_Tick;   /* +0x18 */
    unsigned short both_Old;   /* +0x1A */
    BOOL TickDown[16];   /* +0x1C */
    BOOL TickBoth[16];   /* +0x5C */
    unsigned char TickCount[16];   /* +0x9C */
    unsigned short BothTickCount[16];   /* +0xAC */
    unsigned short GazTickCount[16];   /* +0xCC */

    unsigned short GetDown() const;
    unsigned short GetUp() const;
    unsigned short GetTick() const;
    void SetPadTick(unsigned short tick) { PADTICK = (unsigned char)tick; }
    void SetPadTickMask(unsigned short mask) { PADTICKMASK = mask; }
};

struct Dialog {   /* sizeof 16 */
    int BevelGfx;   /* +0x0 */
    int BorderGfx;   /* +0x4 */
    int BackGfx;   /* +0x8 */
    int DialogOTpos;   /* +0xC */

    Dialog();
    ~Dialog();
    void SetBorder(int Type) { BorderGfx = Type; }
    void SetBack(int Type) { BackGfx = Type; }
    void SetRGB(unsigned char R, unsigned char G, unsigned char B);
    void Back(int DX, int DY, int DW, int DH);   /* @0x8008BEE0 -- real fn, another TU (DIALOG.CPP) */
};

class CBlocks {
public:
    static int GetOverlayOtBase() { return 0x1E8; }
};

struct SFXHDR {   /* fields accessed here only */
    char used;   /* +0x0 */
    char loop;   /* +0x1 */
    char playing;   /* +0x2 */
    char state;   /* +0x3 */
    BOOL TaskAlive;   /* +0x4 */
    void *StreamHND;   /* +0x8 */
    unsigned char type;   /* +0xC */
    unsigned char ChunkGot;   /* +0xD */
    int voice;   /* +0x10 */
    int volume;   /* +0x14 */
    int s_volume;   /* +0x18 */
};

struct TSFX {   /* sizeof unknown -- only byte offset +1 accessed here */
    char _pad0;
    unsigned char flags;   /* +0x1 */
};

struct TSnd;
struct TASK;

struct OMENUITEM {   /* sizeof 24 */
    unsigned char y;   /* +0x0 */
    int Text;   /* +0x4 */
    TXT_JUST Just;   /* +0x8 */
    int len;   /* +0xC */
    unsigned long *var;   /* +0x10 */
    int Link;   /* +0x14 */
};

struct OMENULIST {   /* sizeof 8 */
    unsigned short w;   /* +0x0 */
    unsigned char h;   /* +0x2 */
    unsigned char NoEntries;   /* +0x3 */
    OMENUITEM *Item;   /* +0x4 */
};

extern "C" {
void *memset(void *s, int c, unsigned long n);
int sprintf(char *buf, const char *fmt, ...);
char *strcpy(char *dst, const char *src);
}

extern BOOL CDWAIT;
extern int FileSYS;
extern SFXHDR *sghMusic;
extern SFXHDR *sghStream;
extern TSFX *sgpStreamSFX;
extern long sglMasterVolume;
extern long sglMusicVolume;
extern long sglSoundVolume;
extern long sglSpeechVolume;
extern int sgnMusicTrack;
extern BOOL MONO;
extern int MonoX;   /* defined in options.cpp (gp_rel only here) */
/* MasterVol/MusicVol/SoundVol/SpeechVol: SYM class EXT = external linkage; this TU's oracle reaches
 * them via %gp_rel -> OPTIONS.CPP owns the definitions (see options.cpp), not extern here. */
extern CFont MediumFont;
extern unsigned char DialogRed, DialogGreen, DialogBlue;
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;
extern unsigned char PauseMode;
extern unsigned char FeFlag;
extern unsigned char WHITER, WHITEG, WHITEB;
extern unsigned char BORDERR, BORDERG, BORDERB;
extern POLY_FT4 *ThisPrimAddr;
extern POLY_FT4 *AddrToAvoid;

char * GetStr(int StrId);   /* @0x8007B528 LANG.CPP:171 */
enum LANG_TYPE LANG_GetLang(void);   /* @0x8007B348 LANG.CPP:84 */
void LANG_SetLang(LANG_TYPE NewLanguageType);   /* @0x8007B5E8 LANG.CPP:222 */
void music_stop(void);   /* @0x80077E50 SOUND.CPP:227 */
void music_start(int nTrack);   /* @0x80077ED0 SOUND.CPP:261 */
void music_fade(void);   /* @0x80077E90 SOUND.CPP:245 */
void BL_LoadStreamDir(void);   /* @0x800876F4 BIGLUMP.CPP:286 */
BOOL IsGameLoading(void);   /* @0x800A4648 LOADING.CPP:212 */
void STR_pauseall(void);   /* @0x80099234 STREAM.CPP:816 */
void snd_stop_snd(TSnd *pSnd);   /* @0x80077D1C SOUND.CPP:132 */
void STR_setvolume(SFXHDR *sfh);   /* @0x80099010 STREAM.CPP:736 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
extern "C" void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
CPad * PAD_GetPad(int PadNum, unsigned char both);   /* @0x800897F4 PADS.CPP:251 */
extern "C" void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */

BOOL IS_GameOver(void);   /* @0x800821DC GAMEOVER.CPP:83 */
BOOL RemoveCtrlScreen(void);   /* @0x8009C7C4 CTRL.CPP:396 */
void MemcardOFF(void);   /* @0x800A5558 CARDCORE.CPP:396 */
void OVR_LoadGame(void);   /* @0x80095474 OVERLAY.CPP:146 */
void stream_pause(void);   /* @0x8003CFB8 EFFECTS.CPP:127 */
void stream_resume(void);   /* @0x8003D01C EFFECTS.CPP:148 */
extern "C" TASK * TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
enum GM_SPEEDS GetSpeed(void);   /* @0x80039BBC DIABLO.CPP:3169 */
void SetSpeed(enum GM_SPEEDS Speed);   /* @0x80039BA8 DIABLO.CPP:3163 */

extern unsigned char deathflag;
/* optionsflag/cmenu/options_pad/DrawOptionsTask: SYM class EXT, but THIS TU's own oracle reaches every
 * one of them via %gp_rel -> OPTIONS.CPP owns the definitions (see options.cpp), not extern here.
 * MemCardActive/MemcardOverlay stay extern below: confirmed via the ToggleOptions oracle they're
 * addressed by plain absolute lui/lw here, not %gp_rel -- owned elsewhere. */
extern char msgholdflag;
extern int saveflag;
extern int loadflag;
extern int AlertTxt;
extern int StatusTxt;
extern int cardondelay;
extern int card_active[2];
extern BOOL MemCardActive;
extern BOOL MemcardOverlay;
extern unsigned char ctrlflag;
extern unsigned char sbookflag;
extern OMENULIST MenuList[20];
extern unsigned char GOLDR, GOLDG, GOLDB;
extern unsigned char BLUER, BLUEG, BLUEB;
extern unsigned char REDR, REDG, REDB;
extern CFont LargeFont;
extern unsigned long *ThisOt;
extern OMENUITEM SoundMenu[7];
int GetSpinnerWidth(int idx);   /* @0x8015B37C -- another module */
BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag);   /* @0x8009BBA0 GLUE.CPP */
BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);   /* @0x8009BBB0 GLUE.CPP */
void GLUE_SuspendGame(void);   /* @0x8009BA24 GLUE.CPP */
void PostGamePad(int val, int var1, int var2, int var3);   /* @0x8007AD4C GAMEPAD.CPP */
extern int current_card;
extern int card_status[2];
extern int card_side_empty[2];
extern int card_side_format[2];
extern int formatflag;
/* ReturnMenu/CharacterBlockLoaded: also %gp_rel in THIS TU's oracle (FormatPad) -> owned here too. */

void ActivateMemcard(int a, int b);   /* @0x800A5790 CARDCORE.CPP */
void ActivateCharacterMemcard(int a, int b);   /* @0x800A57CC CARDCORE.CPP */
void ShowCardActionText(void);   /* @0x800A5888 CARDCORE.CPP */
void ShowAlertBox(void);   /* @0x8015A3BC -- real fn, another module */
extern int D_8011B3D8[];   /* SYM has no name for this address (gap between CreditSubTitleNo and
                             * dirflag/card_status); absolute lui/lw in this TU's oracle -> extern, owned
                             * elsewhere. Indexed [cs]. */
extern BOOL DoLoadedGame[];
extern int countdownloadcharblock;
extern int card_side_read[2];
extern int card_side_save[2];
extern int card_usable[2];
extern char *DiabloCharacterFile;
struct CharacterSaveSlot {
    signed char first;
    unsigned char data[1271];
};
extern CharacterSaveSlot D_80157B68[];   /* SYM has no name; big per-slot table, indexed by slot
                                           * and read at byte zero -- owned elsewhere. */
BOOL GetSaveStatusMessage(int a, char *Name);   /* @0x8015A67C -- another module */
void ShowCharacterFiles(int idx, int Spacing, RECT R, int Height);   /* @0x8015A90C -- another module,
                                                                        * RECT passed BY VALUE (packed
                                                                        * into 2 words per the SYM
                                                                        * "G4RECT" mangling) */
int PSX_CH_SaveGame(int a, int b);   /* @0x8015C3B0 -- another module */
int read_card_block(int card, int block);   /* @0x800A56C8 CARDCORE.CPP */
int CountdownLoad(int a);   /* @0x800A5B6C CARDCORE.CPP */
int CountdownSave(int a);   /* @0x800A5D7C CARDCORE.CPP */
int test_card_format(int card);   /* @0x80142BF4 -- another module */
int GetFileNumber(int card, char *Name);   /* @0x80159590 -- another module */
void ShowGameFiles(char *Name, int idx, int Spacing, RECT R, int Height);   /* @0x8015A79C --
                                                                               * another module, RECT
                                                                               * passed BY VALUE */
extern char *DiabloOptionFile;
extern char *DiabloGameFile;
extern char *Savefilename;
extern char *Loadfilename;
extern int save_blocks;
extern unsigned char block_buf[128];
extern int card_side_load[2];
extern int card_side_nogame[2];
extern int card_side_noopt[2];

/* SoundPad additions */
extern unsigned short KeyTab[10];   /* @0x800CD360 -- keyboard-remap mask table, another module */
extern int they_pressed;
extern unsigned char Qfromoptions;
extern BOOL DiabloDieFlag;
extern BOOL PadFrig;
void GO_DoGameOver(void);   /* @0x80082204 -- another module */
void DrawCtrlSetup(void);   /* @0x8009D5D8 CTRL.CPP */
void InitCredits(void);   /* @0x8013D1B4 CREDITS.CPP */
BOOL PaletteFadeOut(int a);   /* @0x8007F2F8 PALETTE.CPP */
BOOL PaletteFadeIn(int a);   /* @0x8007F1F0 PALETTE.CPP */
BOOL GetFadeState(void);   /* @0x8007EEAC PALETTE.CPP */
void pad_func_SplBook(int pad);   /* @0x800A2244 OPTIONS.CPP (or CTRL.CPP) */
void StartQuestlog(void);   /* @0x80068D40 QUESTS.CPP */
void pad_func_Chr(int pad);   /* @0x800A1FE0 */
void DrawHelp(void);   /* @0x800AECD0 */
BOOL GLUE_Finished(void);   /* @0x8009BB04 GLUE.CPP */
void GLUE_ResumeGame(void);   /* @0x8009BA78 GLUE.CPP */
extern "C" TASK * TSK_Exist(TASK *T, unsigned long Id, unsigned long Mask);   /* @0x800206D8 TASKER.C */
extern unsigned char invflag;
extern char msgflag;
extern BOOL initchr;
extern int old_pad;
void DrawMenu(int cmenu);   /* @0x800A72F4 OPTIONS.CPP -- not yet reconstructed in this TU */
BOOL GLUE_SetShowGameScreenFlag(BOOL NewFlag);   /* @0x8009BB84 GLUE.CPP */
extern BOOL ignore_buttons;
void ShowLoadingBox(int Str);   /* @0x800A5E5C CARDCORE.CPP */
int format_card(int card);   /* @0x80142FF4 -- another module, real fn (not a BIOS syscall) */
void DrawOptions(TASK *T);   /* @0x800AA2D0 OPTIONS.CPP:2703 -- not yet reconstructed in this TU */

void SetLoadedLang(LANG_TYPE LoadLang);   /* @0x800A70C0 OPTIONS.CPP:1059 */
void ChangeLang(void);   /* @0x800A7170 OPTIONS.CPP:1091 */
void DrawLeftRight(void);   /* @0x800A7234 OPTIONS.CPP:1121 */
void PrintMono(int ypos);   /* @0x800A723C OPTIONS.CPP:1137 */
int who_pressed(int pval);   /* @0x800A8314 OPTIONS.CPP:1498 */
void SwitchMONO(void);   /* @0x800A9214 OPTIONS.CPP:2023 */
void CalcVolumes(void);   /* @0x800A9EAC OPTIONS.CPP:2463 */
void SetLoadedVolumes(void);   /* @0x800AA008 OPTIONS.CPP:2498 */
void GetVolumes(void);   /* @0x800AA0B8 OPTIONS.CPP:2514 */
void AlterSpeedMenu(GM_SPEEDS speed);   /* @0x800AA154 OPTIONS.CPP:2621 */
void GameSpeedPad(void);   /* @0x800AA1A8 OPTIONS.CPP:2644 */
void ToggleOptions(void);   /* @0x800AA9CC OPTIONS.CPP:3174 */
void PrintSelectBack(unsigned short Str);   /* @0x800A68D0 OPTIONS.CPP:817 */
void DrawDialogBox(int e, int f, RECT *DRect, int X, int Y, int W, int H);   /* @0x800A6960 OPTIONS.CPP:862 */
void CentrePad(void);   /* @0x800A9C68 OPTIONS.CPP:2409 */
void LAMBO_MovePad(CPad *P);   /* @0x800AB300 OPTIONS.CPP:3508 */
void FormatPad(void);   /* @0x800AAB74 OPTIONS.CPP:3234 */
void SaveOverwritePad(void);   /* @0x800AAE7C OPTIONS.CPP:3350 */
void CharCardSelectMemcardPad(void);   /* @0x800AB0B8 OPTIONS.CPP:3432 */
void CharacterLoadPad(void);   /* @0x800A839C OPTIONS.CPP:1522 */
void MemcardPad(void);   /* @0x800A88F0 OPTIONS.CPP:1719 */
void SoundPad(void);   /* @0x800A9260 OPTIONS.CPP:2043 */
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB,
                  int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross,
                  BOOL iso, unsigned char SinStep);   /* @0x800A6A44 OPTIONS.CPP:898 */

#endif
