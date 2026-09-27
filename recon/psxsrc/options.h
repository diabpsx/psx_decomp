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

struct TextDat;

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
    int Print(int X, int Y, char *Str, TXT_JUST Justify, RECT *TextWindow, int R, int G, int B);
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
    void SetPadTick(unsigned short v) { PADTICK = (unsigned char)v; }
    void SetPadTickMask(unsigned short v) { PADTICKMASK = v; }
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

struct POLY_G4 {   /* sizeof 36 */
    unsigned long tag;   u_char r0, g0, b0, code;
    short x0, y0; u_char r1, g1, b1, pad1;
    short x1, y1; u_char r2, g2, b2, pad2;
    short x2, y2; u_char r3, g3, b3, pad3;
    short x3, y3;
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
extern int MonoX;
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
void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
CPad * PAD_GetPad(int PadNum, unsigned char both);   /* @0x800897F4 PADS.CPP:251 */
void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */

BOOL IS_GameOver(void);   /* @0x800821DC GAMEOVER.CPP:83 */
BOOL RemoveCtrlScreen(void);   /* @0x8009C7C4 CTRL.CPP:396 */
void MemcardOFF(void);   /* @0x800A5558 CARDCORE.CPP:396 */
void OVR_LoadGame(void);   /* @0x80095474 OVERLAY.CPP:146 */
void stream_pause(void);   /* @0x8003CFB8 EFFECTS.CPP:127 */
void stream_resume(void);   /* @0x8003D01C EFFECTS.CPP:148 */
TASK * TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
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
GM_SPEEDS AlterSpeedMenu(GM_SPEEDS speed);   /* @0x800AA154 OPTIONS.CPP:2621 */
void GameSpeedPad(void);   /* @0x800AA1A8 OPTIONS.CPP:2644 */
void ToggleOptions(void);   /* @0x800AA9CC OPTIONS.CPP:3174 */
void PrintSelectBack(unsigned short Str);   /* @0x800A68D0 OPTIONS.CPP:817 */
void DrawDialogBox(int e, int f, RECT *DRect, int X, int Y, int W, int H);   /* @0x800A6960 OPTIONS.CPP:862 */
void CentrePad(void);   /* @0x800A9C68 OPTIONS.CPP:2409 */
void LAMBO_MovePad(CPad *P);   /* @0x800AB300 OPTIONS.CPP:3508 */
void FormatPad(void);   /* @0x800AAB74 OPTIONS.CPP:3234 */
void SaveOverwritePad(void);   /* @0x800AAE7C OPTIONS.CPP:3350 */
void CharCardSelectMemcardPad(void);   /* @0x800AB0B8 OPTIONS.CPP:3432 */

#endif
