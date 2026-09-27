/* TONY.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: Tony's glue -- the
 * debug error/poll hooks (new_eprint, TonysDummyPoll), the ambient-light reset, and the attract-mode
 * demo player (set_pad_record_play starts print_demo_task, which forces the demo character's stats
 * every frame and tears the demo down when demo_finish is raised). */
#include "diabpsx_types.h"

/* ---------------------------------------------------------------- types ---- */
struct TASK {   /* sizeof 92 */
    struct TASK *Next;
    struct TASK *Prev;
    unsigned long Id;
    unsigned long SleepTime;
    unsigned long fToInit : 1;
    unsigned long fToDie : 1;
    unsigned long fKillable : 1;
    unsigned long fActive : 1;
    unsigned long fXtraStack : 1;
    void *Stack;
    unsigned long StackSize;
    void *Data;
    int TskEnv[12];
    void (*Main)();
    long hndTask;
    unsigned short XtraLongs;
    unsigned short MaxStackSizeBytes;
};

struct PlayerStruct {   /* sizeof 6632 -- only the fields touched here */
    int _pmode;                         /* +0x0 */
    unsigned char pad0[0x30 - 0x4];
    short _px;                          /* +0x30 */
    short _py;                          /* +0x32 */
    unsigned char pad1[0x43 - 0x34];
    char _pgfxnum;                      /* +0x43 */
    unsigned char pad2[0x60 - 0x44];
    char _pTSpell;                      /* +0x60 */
    char _pTSplType;                    /* +0x61 */
    unsigned char pad3[0x64 - 0x62];
    int _pRSpell;                       /* +0x64 */
    char _pRSplType;                    /* +0x68 */
    unsigned char pad4[0x71 - 0x69];
    char _pSplLvl[64];                  /* +0x71 */
    unsigned char pad5[0xB8 - 0xB1];
    unsigned long long _pMemSpells;     /* +0xB8 */
    unsigned char pad6[0xD3 - 0xC0];
    unsigned char _pInvincible;         /* +0xD3 */
    unsigned char pad7[0xF8 - 0xD4];
    short _pStrength;                   /* +0xF8 */
    short _pBaseStr;                    /* +0xFA */
    unsigned char pad8[0x100 - 0xFC];
    short _pDexterity;                  /* +0x100 */
    short _pBaseDex;                    /* +0x102 */
    unsigned char pad9[0x10C - 0x104];
    int _pDamageMod;                    /* +0x10C */
    unsigned char padA[0x11C - 0x110];
    long _pHitPoints;                   /* +0x11C */
    long _pMaxHP;                       /* +0x120 */
    unsigned char padB[0x130 - 0x124];
    long _pMana;                        /* +0x130 */
    long _pMaxMana;                     /* +0x134 */
    unsigned char padC[0x13C - 0x138];
    char _pLevel;                       /* +0x13C */
    unsigned char rest[6632 - 0x13D];
};

enum GM_SPEEDS { GM_SLOW = 0, GM_FAST = 1 };
struct RECT;
enum TXT_JUST { JustLeft = 0, JustCentre = 1, JustRight = 2 };

class CFont {
public:
    unsigned char data[540];
    int Print(int X, int Y, char *Str, enum TXT_JUST Justify, struct RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
};

class FileIO {   /* sizeof 20 (layout in psxsrc/fileio.h) */
public:
    unsigned char data[20];
    BOOL ReadAtAddr(const char *Name, unsigned char *Dest, int Len);
    BOOL Save(const char *Name, unsigned char *Addr, int Len);
};

/* GMAN.H / CPLAYER.H (included by the original): header-defined inlines never called here, but
 * compiling them emits "psxsrc/gman.h" and "psxsrc/cplayer.h" -- the first two strings of .TONY_rdata. */
extern "C" BOOL GAL_Free(long Hnd);
extern "C" void DBG_Error(char *Text, char *File, int Line);
class TextDat {   /* sizeof 112 -- only the fields DumpDatFile touches */
public:
    BOOL OwnDat;                        /* +0x0 */
    int pad0[3];
    long hndDat;                        /* +0x10 */
    unsigned char rest[112 - 0x14];
    inline void DumpDatFile();
};
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}
class CPlayer;
extern CPlayer *_7CPlayer_PActiveArray[2];
class CPlayer {
public:
    unsigned char data[144];
    static CPlayer *GetPlayer(int PNum)
    {
        if (1 < (unsigned int)PNum)
            DBG_Error(NULL, "psxsrc/cplayer.h", 0x41);
        return _7CPlayer_PActiveArray[PNum];
    }
};

/* ---------------------------------------------------------------- externals ---- */
extern "C" {
int printf(const char *fmt, ...);
void DBG_Halt(void);
void DBG_SendMessage(const char *e, ...);
void DBG_SetErrorFunc(void (*EFunc)());
void DBG_SetPollRoutine(void (*Func)());
void TSK_Sleep(int Frames);
TASK *TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);
int DrawSync(int mode);
}
void SetLightFX(int x, int y, short s_r, short s_g, short s_b, unsigned char d_r, unsigned char d_g, unsigned char d_b);
BOOL GLUE_Finished(void);
BOOL IsGameLoading(void);
char *GetStr(int StrId);
void SetQSpell(int pnum, int Spell, int type);
void PlaySFX(int psfx);
void music_fade(void);
BOOL PaletteFadeOut(int fr);
BOOL GetFadeState(void);
void GLUE_StartGameExit(void);
int SetWalkStyle(int pnum, int style);
void RestoreDemoKeys(int *buffer);
void SetSpeed(enum GM_SPEEDS Speed);
FileIO *SYSI_GetFs(void);

extern struct PlayerStruct plr[2];
extern unsigned char leveltype;
extern int restore_r, restore_g, restore_b;
extern unsigned char dung_map_r[56][56];
extern unsigned char dung_map_g[56][56];
extern unsigned char dung_map_b[56][56];
extern unsigned long demo_finish;
extern int demo_pad_time;
extern int demo_pad_count;
extern unsigned char PlayDemoFlag;
extern BOOL allspellsflag;
extern unsigned char demo_buffer[900];
extern unsigned char PauseMode;
extern CFont MediumFont;
extern const unsigned char WHITER, WHITEG;
extern char D_80110B24[];                                  /* "DEMOPAD0.DAT" */

/* ---------------------------------------------------------------- TU data (.sdata) ---- */
int tony_poll = 0;                                          /* @0x8011AE34 */
int moo_moo = 0;                                            /* @0x8011AE38 */
int demo_load = 0;                                          /* @0x8011AE3C */
int demo_record_load = 0;                                   /* @0x8011AE40 */
int level_record = 0xFF;                                    /* @0x8011AE44 */
char demo_fade_finished = 1;                                /* @0x8011AE48 */
unsigned char demo_which = 0xFF;                            /* @0x8011AE49 */
unsigned char quest_cheat_num = 0xFF;                       /* @0x8011AE4A */
unsigned char cheat_quest_flag = 0;                         /* @0x8011AE4B */
unsigned char demo_level_num[5] = { 0, 1, 5, 9, 13 };       /* @0x8011AE4C */
unsigned char demo_level_player[5] = { 0, 2, 1, 0, 2 };     /* @0x8011AE54 */
unsigned char demo_level_spell1[5] = { 2, 1, 3, 2, 29 };    /* @0x8011AE5C */
unsigned char demo_level_spell2[5] = { 0, 1, 8, 13, 29 };   /* @0x8011AE64 */
unsigned char demo_level_clothe[5] = { 0, 0, 16, 32, 32 };  /* @0x8011AE6C */
unsigned char demo_level_dam[5] = { 0, 0, 10, 20, 30 };     /* @0x8011AE74 */
unsigned char demo_level_dex[5] = { 0, 30, 60, 130, 220 };  /* @0x8011AE7C */
unsigned char demo_flash = 0;                               /* @0x8011AE81 */
int tonys_Task = 0;                                         /* @0x8011AE84 */
/* uninitialized: emitted after the initialized globals */
int demo_level;                                             /* @0x8011AE88 */
enum GM_SPEEDS speedstore;                                  /* @0x8011AE8C */
int old_val;                                                /* @0x8011AE90 */
TASK *DemoTask;                                             /* @0x8011AE94 */
TASK *DemoGameTask;                                         /* @0x8011AE98 */
TASK *tonys;                                                /* @0x8011AE9C */
/* retail SYM lists buff between speedstore and old_val; defined last here because our maspsx stops
 * tracking .sdata after an .lcomm (the later uninitialized globals lose their gp-rel addressing) */
static int buff[10];                                        /* @0x8011CDC8 bss */

/* @0x8009B338 TONY.CPP:107 */
static void stub(char *e, void *argptr)
{
}

/* @0x8009B340 TONY.CPP:111 */
void new_eprint(char *Text, char *File, int Line)
{
    printf("File:%s Line:%d\t%s\n", File, Line, Text);
    DBG_Halt();
}

/* @0x8009B374 TONY.CPP:117 */
void TonysGameTask(TASK *T)
{
    for (;;) {
        if (moo_moo == 1) {
            SetLightFX(plr[0]._px, plr[0]._py, 0xA00, 0xA00, 0xA00, 0x40, 0x40, 0x40);
            moo_moo = 0;
        }
        TSK_Sleep(1);
    }
}

/* @0x8009B3FC TONY.CPP:130 */
void SetAmbientLight()
{
    int x, y;

    if (leveltype == 0)
        restore_r = restore_g = restore_b = 0x80;
    else
        restore_r = restore_g = restore_b = 0x1E;
    for (y = 0; y < 56; y++) {
        for (x = 0; x < 56; x++) {
            dung_map_r[x][y] = restore_r;
            dung_map_g[x][y] = restore_g;
            dung_map_b[x][y] = restore_b;
        }
    }
}

/* @0x8009B4BC TONY.CPP:170 */
void SetDemoPlayer()
{
    plr[0]._pHitPoints = 0x9600;
    plr[0]._pMaxHP = 0x9600;
    plr[0]._pMana = 0x4B00;
    plr[0]._pMaxMana = 0x4B00;
}

/* @0x8009B4EC TONY.CPP:178
 * OPEN (bytes 33 diffs): block tree exact (`while (1) { int demo_char; ...` keeps the demo_finish
 * exit test from being duplicated).  Residual: demo_which % 5 is computed in a0 then andi'd into s0
 * (retail computes it in s0), plus SetQSpell arg scheduling. */
void print_demo_task(TASK *T)
{
    while (1) {
        int demo_char;
        char *p;   /* copy-propagated: no SYM record; makes the fill loop a reduced pointer walk */

        if (demo_finish)
            break;
        if (demo_load) {
            SetDemoPlayer();
            demo_load = 0;
        }
        if (!demo_record_load) {
            demo_char = 0;
            if (GLUE_Finished() == 0)
                demo_char = IsGameLoading() == 0;
            if (demo_char) {
                if (demo_flash++ & 0x20) {
                    MediumFont.Print(0xA0, 0x28, GetStr(0xF8), JustCentre, NULL, WHITER, WHITEG, WHITEG);
                    MediumFont.Print(0xA0, 0x36, GetStr(0x32E), JustCentre, NULL, WHITER, WHITEG, WHITEG);
                }
            } else if (IsGameLoading())
                MediumFont.Print(0x88, 0x28, GetStr(0xF8), JustCentre, NULL, WHITER, WHITEG, WHITEG);
        }
        for (int x = 63; x >= 0; x--)
            *(p = &plr->_pSplLvl[x]) = 100;
        demo_char = demo_which % 5;
        plr[0]._pRSpell = demo_level_spell1[demo_char];
        plr[0]._pRSplType = 1;
        plr[0]._pTSpell = 4;
        plr[0]._pTSplType = 0;
        SetQSpell(0, demo_level_spell2[demo_char], 1);
        plr[0]._pMemSpells = -1;
        plr[0]._pStrength = 100;
        plr[0]._pBaseStr = 100;
        plr[0]._pBaseDex = 100;
        plr[0]._pgfxnum |= demo_level_clothe[demo_char];
        plr[0]._pLevel = 5;
        plr[0]._pDexterity = demo_level_dex[demo_char];
        plr[0]._pDamageMod = demo_level_dam[demo_char];
        allspellsflag = 1;
        TSK_Sleep(1);
    }
    if (demo_finish == 2)
        PlaySFX(0x33);
    music_fade();
    if (PaletteFadeOut(8)) {
        while (GetFadeState())
            TSK_Sleep(1);
    } else
        DBG_SendMessage("FADE OUT - MISSED %s %d", "psxsrc/TONY.CPP", 0xF1);
    PauseMode = 1;
    demo_fade_finished = 1;
    GLUE_StartGameExit();
    PlayDemoFlag = 0;
    demo_pad_time = 0;
    demo_finish = 0;
    SetWalkStyle(0, old_val);
    RestoreDemoKeys(buff);
    SetSpeed(speedstore);
    plr[0]._pInvincible = 0;
}

/* PsyQ 4.0 LIBSN.H (verbatim): an SDK asm() macro, allowed by the user ruling (same class as GTE/BIOS) */
#define	pollhost()	asm("break 1024")	/* inline to keep variable scope */

/* @0x8009B82C TONY.CPP:259 */
void TonysDummyPoll()
{
    if (tony_poll) {
        DrawSync(0);
        pollhost();
    }
}

/* @0x8009B858 TONY.CPP:268 */
void SetTonyPoll()
{
    tony_poll = 0;
}

/* @0x8009B864 TONY.CPP:273 */
void ClearTonyPoll()
{
    tony_poll = 0;
}

/* @0x8009B870 TONY.CPP:278 */
void load_demo_pad_data(unsigned long demo_num)
{
    FileIO *Fs = SYSI_GetFs();

    if (demo_num >= 10)
        demo_num += 7;
    D_80110B24[7] = demo_num + '0';
    Fs->ReadAtAddr("DEMOPAD0.DAT", demo_buffer, -1);
}

/* @0x8009B8D0 TONY.CPP:289 */
void save_demo_pad_data(unsigned long demo_num)
{
    FileIO *Fs = SYSI_GetFs();

    if (demo_num >= 10)
        demo_num += 7;
    D_80110B24[7] = demo_num + '0';
    Fs->Save("DEMOPAD0.DAT", demo_buffer, 900);
}

/* @0x8009B930 TONY.CPP:308 */
void set_pad_record_play(int level)
{
    if (!demo_record_load)
        load_demo_pad_data(level);
    demo_level = level;
    demo_fade_finished = 0;
    demo_finish = 0;
    demo_pad_count = 0;
    demo_pad_time = 899;
    DemoTask = TSK_AddTask(0x4000, (void (*)())print_demo_task, 0x1000, 0);
}

/* @0x8009B9A4 TONY.CPP:324 -- the 16-byte frame with no locals is the outgoing-argument area of a
 * call the optimiser deleted (dead code); ra is not saved because no call survives. */
void start_demo()
{
    if (0)
        TSK_Sleep(1);
}

/* @0x8009B9B4 TONY.CPP:340 */
void SetQuest()
{
}

/* @0x8009B9BC TONY.CPP:344 */
void DrawManaShield(PlayerStruct *ptrplr)
{
}

/* @0x8009B9C4 TONY.CPP:368 */
void ManaTask(TASK *T)
{
}

/* @0x8009B9CC TONY.CPP:389 */
void tony()
{
    DBG_SetErrorFunc((void (*)())new_eprint);
    DBG_SetPollRoutine(TonysDummyPoll);
    ClearTonyPoll();
}
