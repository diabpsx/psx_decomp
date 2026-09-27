/* CARDCORE.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  PSX-only (no PC twin): the memory-card
 * core -- BIOS card events, card polling task, save/load countdowns, the "please wait" boxes, and
 * KillItemDead (the PSX copy of hellfire CheckInvCut's item-removal core).
 * Reconstructed from the raw oracle (asm/nonmatchings/cardcore/*.s) + the SYM; drafts from refs/skeleton.
 * Header inlines (Dialog, CBlocks) are emitted out of line in this object (-fno-inline). */
#include "diabpsx_types.h"

struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};

enum TXT_JUST { JustLeft = 0, JustCentre = 1, JustRight = 2 };

enum PLR_MODE {
    PM_STAND = 0, PM_WALK = 1, PM_WALK2 = 2, PM_WALK3 = 3, PM_ATTACK = 4, PM_RATTACK = 5,
    PM_BLOCK = 6, PM_GOTHIT = 7, PM_DEATH = 8, PM_SPELL = 9, PM_NEWLVL = 10, PM_QUIT = 11
};

struct ItemStruct {   /* sizeof 108 */
    int _iVAdd1;   /* +0x0 */
    int _iVMult1;   /* +0x4 */
    int _iVAdd2;   /* +0x8 */
    int _iVMult2;   /* +0xC */
    int _iSeed;   /* +0x10 */
    int _ivalue;   /* +0x14 */
    int _iIvalue;   /* +0x18 */
    long _iFlags;   /* +0x1C */
    int _iPLAC;   /* +0x20 */
    unsigned short _iCreateInfo;   /* +0x24 */
    unsigned short _iName;   /* +0x26 */
    unsigned short _iIName;   /* +0x28 */
    unsigned short ItemFrame;   /* +0x2A */
    short _itype;   /* +0x2C */
    short IDidx;   /* +0x2E */
    short _iPLMana;   /* +0x30 */
    short _iPLHP;   /* +0x32 */
    char _iUid;   /* +0x34 */
    short _iPLToHit;   /* +0x36 */
    short _iPLDam;   /* +0x38 */
    char _iPLDamMod;   /* +0x3A */
    char _iMinDam;   /* +0x3B */
    char _iMaxDam;   /* +0x3C */
    char _iSpell;   /* +0x3D */
    short _iDurability;   /* +0x3E */
    short _iMaxDur;   /* +0x40 */
    char _iPLGetHit;   /* +0x42 */
    char _iPLLight;   /* +0x43 */
    char _iFMinDam;   /* +0x44 */
    char _iFMaxDam;   /* +0x45 */
    char _iLMinDam;   /* +0x46 */
    char _iLMaxDam;   /* +0x47 */
    char _iPLEnAc;   /* +0x48 */
    unsigned char _iCharges;   /* +0x49 */
    char _iAC;   /* +0x4A */
    unsigned char _iMaxCharges;   /* +0x4B */
    unsigned char _iCurs;   /* +0x4C */
    unsigned char _iMiscId;   /* +0x4D */
    char _iAnimLen;   /* +0x4E */
    char _iAnimFrame;   /* +0x4F */
    char _iSelFlag;   /* +0x50 */
    char _iMagical;   /* +0x51 */
    char _ix;   /* +0x52 */
    char _iy;   /* +0x53 */
    char _iLoc;   /* +0x54 */
    char _iClass;   /* +0x55 */
    char _iPLStr;   /* +0x56 */
    char _iPLMag;   /* +0x57 */
    char _iPLDex;   /* +0x58 */
    char _iPLVit;   /* +0x59 */
    char _iPLFR;   /* +0x5A */
    char _iPLLR;   /* +0x5B */
    char _iPLMR;   /* +0x5C */
    char _iSplLvlAdd;   /* +0x5D */
    char _iRequest;   /* +0x5E */
    char _iPrePower;   /* +0x5F */
    char _iSufPower;   /* +0x60 */
    unsigned char _iMinStr;   /* +0x61 */
    unsigned char _iMinDex;   /* +0x62 */
    char _oldlight;   /* +0x63 */
    unsigned char _iMinMag;   /* +0x64 */
    char _PlrCreate;   /* +0x65 */
    char _iStatFlag;   /* +0x66 */
    char _iPostDraw;   /* +0x67 */
    char _iAnimFlag;   /* +0x68 */
    char _iIdentified;   /* +0x69 */
};

struct PlayerStruct {   /* sizeof 6632 */
    enum PLR_MODE _pmode;   /* +0x0 */
    char walkpath[25];   /* +0x4 */
    unsigned char plractive;   /* +0x1D */
    char destAction;   /* +0x1E */
    char destParam1;   /* +0x1F */
    char destParam2;   /* +0x20 */
    char destParam3;   /* +0x21 */
    char destParam4;   /* +0x22 */
    int plrlevel;   /* +0x24 */
    int WorldX;   /* +0x28 */
    int WorldY;   /* +0x2C */
    short _px;   /* +0x30 */
    short _py;   /* +0x32 */
    short _pownerx;   /* +0x34 */
    short _pownery;   /* +0x36 */
    short _poldx;   /* +0x38 */
    short _poldy;   /* +0x3A */
    char _pxoff;   /* +0x3C */
    char _pyoff;   /* +0x3D */
    short _pxvel;   /* +0x3E */
    short _pyvel;   /* +0x40 */
    char _pdir;   /* +0x42 */
    char _pgfxnum;   /* +0x43 */
    unsigned char *_pAnimData;   /* +0x44 */
    int _pAnimDelay;   /* +0x48 */
    int _pAnimCnt;   /* +0x4C */
    int _pAnimLen;   /* +0x50 */
    int _pAnimFrame;   /* +0x54 */
    char _pAnimWidth;   /* +0x58 */
    char _pAnimWidth2;   /* +0x59 */
    char DeadLevel;   /* +0x5A */
    char _plid;   /* +0x5B */
    char _pvid;   /* +0x5C */
    char _pSpell;   /* +0x5D */
    char _pSplType;   /* +0x5E */
    char _pSplFrom;   /* +0x5F */
    char _pTSpell;   /* +0x60 */
    char _pTSplType;   /* +0x61 */
    int _pRSpell;   /* +0x64 */
    char _pRSplType;   /* +0x68 */
    int _pSBkSpell;   /* +0x6C */
    char _pSBkSplType;   /* +0x70 */
    char _pSplLvl[64];   /* +0x71 */
    unsigned long long _pMemSpells;   /* +0xB8 */
    unsigned long long _pAblSpells;   /* +0xC0 */
    unsigned long long _pScrlSpells;   /* +0xC8 */
    char _pSpellFlags;   /* +0xD0 */
    char _pwtype;   /* +0xD1 */
    unsigned char _pBlockFlag;   /* +0xD2 */
    unsigned char _pInvincible;   /* +0xD3 */
    char _pLightRad;   /* +0xD4 */
    unsigned char _pLvlChanging;   /* +0xD5 */
    char _pName[32];   /* +0xD6 */
    char _pClass;   /* +0xF6 */
    short _pStrength;   /* +0xF8 */
    short _pBaseStr;   /* +0xFA */
    short _pMagic;   /* +0xFC */
    short _pBaseMag;   /* +0xFE */
    short _pDexterity;   /* +0x100 */
    short _pBaseDex;   /* +0x102 */
    short _pVitality;   /* +0x104 */
    short _pBaseVit;   /* +0x106 */
    int _pStatPts;   /* +0x108 */
    int _pDamageMod;   /* +0x10C */
    int _pBaseToBlk;   /* +0x110 */
    long _pHPBase;   /* +0x114 */
    long _pMaxHPBase;   /* +0x118 */
    long _pHitPoints;   /* +0x11C */
    long _pMaxHP;   /* +0x120 */
    int _pHPPer;   /* +0x124 */
    long _pManaBase;   /* +0x128 */
    long _pMaxManaBase;   /* +0x12C */
    long _pMana;   /* +0x130 */
    long _pMaxMana;   /* +0x134 */
    int _pManaPer;   /* +0x138 */
    char _pLevel;   /* +0x13C */
    char _pMaxLvl;   /* +0x13D */
    long _pExperience;   /* +0x140 */
    long _pMaxExp;   /* +0x144 */
    long _pNextExper;   /* +0x148 */
    char _pArmorClass;   /* +0x14C */
    char _pMagResist;   /* +0x14D */
    char _pFireResist;   /* +0x14E */
    char _pLghtResist;   /* +0x14F */
    long _pGold;   /* +0x150 */
    unsigned char _pInfraFlag;   /* +0x154 */
    short _pVar1;   /* +0x156 */
    short _pVar2;   /* +0x158 */
    short _pVar3;   /* +0x15A */
    short _pVar4;   /* +0x15C */
    short _pVar5;   /* +0x15E */
    short _pVar6;   /* +0x160 */
    short _pVar7;   /* +0x162 */
    short _pVar8;   /* +0x164 */
    unsigned char _pLvlVisited[17];   /* +0x166 */
    unsigned char _pSLvlVisited[10];   /* +0x177 */
    int _pGFXLoad;   /* +0x184 */
    unsigned char peq;   /* +0x188 */
    int _pAFNum;   /* +0x18C */
    int _pNFrames;   /* +0x190 */
    int _pWFrames;   /* +0x194 */
    int _pAFrames;   /* +0x198 */
    int _pSFrames;   /* +0x19C */
    int _pSFNum;   /* +0x1A0 */
    int _pHFrames;   /* +0x1A4 */
    int _pDFrames;   /* +0x1A8 */
    int _pBFrames;   /* +0x1AC */
    struct ItemStruct InvBody[7];   /* +0x1B0 */
    struct ItemStruct InvList[40];   /* +0x4A4 */
    int _pNumInv;   /* +0x1584 */
    char InvGrid[40];   /* +0x1588 */
    struct ItemStruct SpdList[8];   /* +0x15B0 */
    struct ItemStruct HoldItem;   /* +0x1910 */
    int inv_highlight;   /* +0x197C */
    int body_highlight;   /* +0x1980 */
    int holdinv_x;   /* +0x1984 */
    int holdinv_y;   /* +0x1988 */
    int holdbody_loc;   /* +0x198C */
    int _pIMinDam;   /* +0x1990 */
    int _pIMaxDam;   /* +0x1994 */
    int _pIAC;   /* +0x1998 */
    int _pIBonusDam;   /* +0x199C */
    int _pIBonusToHit;   /* +0x19A0 */
    int _pIBonusAC;   /* +0x19A4 */
    int _pIBonusDamMod;   /* +0x19A8 */
    unsigned long long _pISpells;   /* +0x19B0 */
    long _pIFlags;   /* +0x19B8 */
    int _pIGetHit;   /* +0x19BC */
    char _pISplLvlAdd;   /* +0x19C0 */
    char _pISplCost;   /* +0x19C1 */
    int _pISplDur;   /* +0x19C4 */
    int _pIEnAc;   /* +0x19C8 */
    int _pIFMinDam;   /* +0x19CC */
    int _pIFMaxDam;   /* +0x19D0 */
    int _pILMinDam;   /* +0x19D4 */
    int _pILMaxDam;   /* +0x19D8 */
    int _pOilType;   /* +0x19DC */
    unsigned char pTownWarps;   /* +0x19E0 */
    unsigned char pDungMsgs;   /* +0x19E1 */
    unsigned char pLvlLoad;   /* +0x19E2 */
    unsigned long pDiabloKillLevel;   /* +0x19E4 */
};

struct TASK {   /* sizeof 92 */
    struct TASK *Next;   /* +0x0 */
    struct TASK *Prev;   /* +0x4 */
    unsigned long Id;   /* +0x8 */
    unsigned long SleepTime;   /* +0xC */
    unsigned long fToInit : 1;
    unsigned long fToDie : 1;
    unsigned long fKillable : 1;
    unsigned long fActive : 1;
    unsigned long fXtraStack : 1;
    void *Stack;   /* +0x14 */
    unsigned long StackSize;   /* +0x18 */
    void *Data;   /* +0x1C */
    int TskEnv[12];   /* +0x20 */
    void (*Main)();   /* +0x50 */
    long hndTask;   /* +0x54 */
    unsigned short XtraLongs;   /* +0x58 */
    unsigned short MaxStackSizeBytes;   /* +0x5A */
};

struct TSnd;
struct TextDat;

/* BLOCK.H */
class CBlocks {
public:
    static int GetOverlayOtBase() { return 0x1E8; }
};

/* DIALOG.H */
extern unsigned char DialogRed, DialogGreen, DialogBlue;
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;

class Dialog {   /* sizeof 16 */
public:
    int BevelGfx;      /* +0x0 */
    int BorderGfx;     /* +0x4 */
    int BackGfx;       /* +0x8 */
    int DialogOTpos;   /* +0xC */

    Dialog()
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
    ~Dialog() {}
    void SetBorder(int Type) { BorderGfx = Type; }
    void SetBack(int Type) { BackGfx = Type; }
    void SetRGB(unsigned char R, unsigned char G, unsigned char B)
    {
        DialogRed = R;
        DialogGreen = G;
        DialogBlue = B;
    }
    void Back(int DX, int DY, int DW, int DH);
    int SetOTpos(int OT);
};

/* PRINTY.H */
class CFont {   /* sizeof 540 */
public:
    int TextureId;   /* +0x0 */
    unsigned short FontTab[256];   /* +0x4 */
    int PrintyOTpos;   /* +0x204 */
    int MinX;   /* +0x208 */
    int MaxX;   /* +0x20C */
    int Width;   /* +0x210 */
    struct TextDat *ThisDat;   /* +0x214 */
    unsigned char FontHeight;   /* +0x218 */

    int Print(int X, int Y, char *Str, enum TXT_JUST Justify, struct RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
    int GetStrWidth(char *Str);
    int SetOTpos(int OT);
};

/* ---------------------------------------------------------------- externs (SYM EXT, other TUs) */
extern int card_status[2];   /* @0x8011B3DC */
extern int card_usable[2];   /* @0x8011B3E4 */
extern int card_files[2];   /* @0x8011B3EC */
extern int card_changed[2];   /* @0x8011B3F4 */
extern int last_card_status[2];   /* @0x8011B3FC */
extern BOOL CharacterBlockLoaded;   /* @0x8011B240 */
extern int AlertTxt;   /* @0x8011B458 */
extern int StatusTxt;   /* @0x8011B45C */
extern int current_card;   /* @0x8011B460 */
extern char *DiabloOptionFile;   /* @0x8011B414 */
extern char *DiabloCharacterFile;   /* @0x8011B418 */
extern char *DiabloGameFile;   /* @0x8011B410 */
extern BOOL optionsflag;   /* @0x8011B248 */
extern int options_pad;   /* @0x8011B250 */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern unsigned long ghMainWnd;   /* @0x8011B788 */
extern unsigned char gbActivePlayers;   /* @0x8011B9A3 */
extern unsigned char gbRunGame;   /* @0x8011B802 */
extern TASK *DrawOptionsTask;   /* @0x8011B264 */
extern unsigned char FeFlag;   /* @0x8011B374 */
extern unsigned char drawsbarflag;   /* @0x8011C32D */
extern int FePlayerNo;   /* @0x8011B378 */
extern BOOL LoadedChar[2];   /* @0x8011B328 */
extern PlayerStruct plr[2];   /* @0x800DA538 */
extern CFont MediumFont;   /* @0x800B82D8 */
extern const unsigned char WHITER, WHITEG;   /* @0x8011ABD1 */
extern char CharBlockBuf[];   /* @0x801576F0 (overlay buffer, 0x1DE0 bytes, cleared around a character-block load) */

/* ---------------------------------------------------------------- prototypes */
extern "C" {
int ResetCallback();
int EnterCriticalSection();
void ExitCriticalSection();
long OpenEvent(unsigned long desc, long spec, long mode, long (*func)());
long EnableEvent(long event);
long TestEvent(long event);
void InitCARD(long val);
long StartCARD();
void ChangeClearPAD(long val);
void _bu_init();
long _card_info(long chan);
long _card_wait(long chan);
long _card_read(long chan, long block, unsigned char *buf);
int VSync(int mode);
void *memset(void *s, int c, unsigned int n);
TASK *TSK_AddTask(unsigned long Id, void (*Main)(TASK *), int StackSize, int DataSize);
TASK *TSK_Exist(TASK *T, unsigned long Id, unsigned long Mask);
void TSK_Kill(TASK *T);
void TSK_Sleep(int Frames);
}
extern int test_card_format(int card_number);   /* MEMCARD.CPP (FRONTEND overlay) */
extern void read_card_directory(int card_number);
extern void service_card(int card_number);
extern void new_card(int card_number);
extern int GetFileNumber(int side, char *file_name);   /* DLG.CPP */
extern BOOL GetLoadStatusMessage(char *file_name);
extern BOOL GetSaveStatusMessage(int fileblocks, char *file_name);
extern int DoSaveGame();
extern int DoSaveOptions();
extern int PSX_OPT_LoadGame(int card_number, int file, BOOL KillHandler);   /* LOADSAVE.CPP */
extern int PSX_CH_LoadBlock(int card_number, int file);
extern int PSX_GM_LoadGame(unsigned char firstflag, int card_number, int file);
extern void STR_pauseall();
extern void STR_resumeall();
extern void stream_stop();
extern void snd_stop_snd(TSnd *pSnd);
extern void OVR_LoadFrontend();
extern char *GetStr(int StrId);
extern BOOL PA_SetPauseOk(BOOL NewPause);
extern BOOL PaletteFadeOut(int fr);
extern BOOL GetFadeState();
extern unsigned char GRL_PostMessage(unsigned long hWnd, unsigned int Msg, long wParam, unsigned long lParam);
extern void GLUE_ResumeGame();
extern BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);
extern BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag);
extern void GetVolumes();
extern void CalcVolumes();
extern void KeefDaFeef(int PlayerNo);
extern void WinterSales(int PlayerNo);

void init_card(int card_number, BOOL read_dir);
int ping_card(int card_number);
void memcard_event(int evt, int side);
void CardUpdateTask(TASK *T);
void MemcardON();
int test_hw_event();
void ActivateMemcard(int card1, int card2);
void PantsDelay();

/* ---------------------------------------------------------------- data (TU-owned, .sdata/.data, address order) */
BOOL MemCardActive;                    /* @0x8011B160 */
BOOL MemcardOverlay;                   /* @0x8011B164 */
int NewCardFlag;                       /* @0x8011B168 */
int countdownloadcharblock;            /* @0x8011B16C */
static int never_hooked_events = 1;    /* @0x8011B170 */
void (*mem_card_event_handler)();      /* @0x8011B174 */
int saveflag;                          /* @0x8011B178 */
int loadflag;                          /* @0x8011B17C */
int formatflag;                        /* @0x8011B180 */
BOOL DoLoadedGame;                     /* @0x8011B184 */
int card_side_empty[2] = { 655, 665 };    /* @0x8011B188 */
int card_side_read[2] = { 841, 842 };     /* @0x8011B190 */
int card_side_nogame[2] = { 726, 727 };   /* @0x8011B198 */
int card_side_noopt[2] = { 728, 729 };    /* @0x8011B1A0 */
int card_side_nocha[2] = { 724, 725 };    /* @0x8011B1A8 */
int card_side_save[2] = { 711, 712 };     /* @0x8011B1B0 */
int card_side_load[2] = { 708, 709 };     /* @0x8011B1B8 */
int card_side_format[2] = { 358, 359 };   /* @0x8011B1C0 */
unsigned int card_ev0;                 /* @0x8011B1C8 */
unsigned int card_ev1;
unsigned int card_ev2;
unsigned int card_ev3;
unsigned int card_ev10;
unsigned int card_ev11;
unsigned int card_ev12;
unsigned int card_ev13;
int card_dirty[2];                     /* @0x8011B1E8 */
TASK *MemcardTask;                     /* @0x8011B1F0 */
int save_blocks;                       /* @0x8011B1F4 */
int card_event;                        /* @0x8011B1F8 */
int cardondelay;                       /* @0x8011B1FC */
int card_active[2];                    /* @0x8011B200 */
char *Savefilename;                    /* @0x8011B208 */
char *Loadfilename;                    /* @0x8011B20C */
BOOL new_card_flag[2];                 /* @0x8011B210 */
unsigned char block_buf[128];          /* @0x800CC7E8 */

/* ---------------------------------------------------------------- functions */
/* @0x800A5004 */
void init_mem_card(void (*handler)(int, int), unsigned char read_dir)
{
    ResetCallback();
    if (never_hooked_events) {
        EnterCriticalSection();
        card_ev0 = OpenEvent(0xF4000001, 0x0004, 0x2000, 0);
        card_ev1 = OpenEvent(0xF4000001, 0x8000, 0x2000, 0);
        card_ev2 = OpenEvent(0xF4000001, 0x0100, 0x2000, 0);
        card_ev3 = OpenEvent(0xF4000001, 0x2000, 0x2000, 0);
        card_ev10 = OpenEvent(0xF0000011, 0x0004, 0x2000, 0);
        card_ev11 = OpenEvent(0xF0000011, 0x8000, 0x2000, 0);
        card_ev12 = OpenEvent(0xF0000011, 0x0100, 0x2000, 0);
        card_ev13 = OpenEvent(0xF0000011, 0x2000, 0x2000, 0);
        ExitCriticalSection();
        InitCARD(1);
        StartCARD();
        ChangeClearPAD(0);
        never_hooked_events = 0;
    }
    _bu_init();
    EnableEvent(card_ev0);
    EnableEvent(card_ev1);
    EnableEvent(card_ev2);
    EnableEvent(card_ev3);
    EnableEvent(card_ev10);
    EnableEvent(card_ev11);
    EnableEvent(card_ev12);
    EnableEvent(card_ev13);
    card_status[0] = card_status[1] = 3;
    card_usable[0] = card_usable[1] = 0;
    card_files[0] = card_files[1] = 0;
    card_changed[0] = card_changed[1] = 1;
    if (handler)
        handler(7, 0);
    mem_card_event_handler = 0;
    init_card(0, read_dir != 0);
    init_card(1, read_dir != 0);
    mem_card_event_handler = (void (*)())handler;
}

/* @0x800A523C */
void memcard_event(int evt, int side)
{
    card_event = evt;
    switch (evt) {
    case 0:
        break;
    case 1:
    case 7:
        CharacterBlockLoaded = 0;
        break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
        break;
    }
}

/* @0x800A5274 */
void init_card(int card_number, BOOL read_dir)
{
    card_files[card_number] = card_dirty[card_number] = 0;
    card_changed[card_number] = 1;
    card_status[card_number] = ping_card(card_number);
    if (card_status[card_number] == 0) {
        card_usable[card_number] = test_card_format(card_number);
        if (read_dir)
            read_card_directory(card_number);
        else
            card_dirty[card_number] = 1;
    } else
        VSync(120);
}

/* @0x800A5340 */
int ping_card(int card_number)
{
    _card_info(card_number << 4);
    _card_wait(card_number);
    if (TestEvent(card_ev0) == 1)
        return 0;
    if (TestEvent(card_ev1) == 1)
        return 1;
    if (TestEvent(card_ev2) == 1)
        return 2;
    if (TestEvent(card_ev3) == 1)
        return 3;
    return 4;
}

/* @0x800A53D4 */
void DealWithCard(int side)
{
    if (card_active[side]) {
        last_card_status[side] = card_status[side];
        card_status[side] = ping_card(side);
        service_card(side);
        TSK_Sleep(4);
        if (new_card_flag[side] && !AlertTxt) {
            new_card_flag[side] = 0;
            new_card(side);
            card_status[side] = 0;
        }
    }
}

/* @0x800A5498 */
void CardUpdateTask(TASK *T)
{
    int toggle = 0;

    while (1) {
        if (!toggle) {
            toggle = 1;
            DealWithCard(0);
        } else {
            toggle = 0;
            DealWithCard(1);
        }
        TSK_Sleep(1);
    }
}

/* @0x800A54EC */
void MemcardON()
{
    STR_pauseall();
    stream_stop();
    snd_stop_snd(0);
    OVR_LoadFrontend();
    init_mem_card(memcard_event, 1);
    MemcardTask = TSK_AddTask(0x45, CardUpdateTask, 0x2000, 0);
    MemCardActive = 1;
}

/* @0x800A5558 */
void MemcardOFF()
{
    TSK_Kill(MemcardTask);
    card_active[0] = card_active[1] = 0;
    MemCardActive = 0;
    STR_resumeall();
}

/* @0x800A5590 */
void CheckSavedOptions()
{
    int option_file;

    init_mem_card(memcard_event, 1);
    MemcardTask = TSK_AddTask(0x45, CardUpdateTask, 0x2000, 0);
    while (!TSK_Exist(0, 0x45, -1))
        TSK_Sleep(1);
    card_active[0] = 1;
    option_file = GetFileNumber(0, DiabloOptionFile);
    if (option_file != -1)
        PSX_OPT_LoadGame(0, option_file, 1);
    else {
        card_active[1] = 1;
        option_file = GetFileNumber(1, DiabloOptionFile);
        if (option_file != -1)
            PSX_OPT_LoadGame(1, option_file, 1);
    }
    TSK_Kill(MemcardTask);
    while (TSK_Exist(0, 0x45, -1))
        TSK_Sleep(1);
    card_active[0] = card_active[1] = 0;
}

/* @0x800A5690 */
void card_removed(int card_number)
{
    card_status[card_number] = 2;
    card_usable[card_number] = 0;
    card_dirty[card_number] = 1;
}

/* @0x800A56C8 */
int read_card_block(int card_number, int block)
{
    _card_read(card_number << 4, block, block_buf);
    _card_wait(card_number);
    return test_hw_event() == 0;
}

/* @0x800A5710 */
int test_hw_event()
{
    if (TestEvent(card_ev10) == 1)
        return 0;
    if (TestEvent(card_ev11) == 1)
        return 3;
    if (TestEvent(card_ev12) == 1)
        return 1;
    if (TestEvent(card_ev13) == 1)
        return 2;
    return 4;
}

/* @0x800A5790 */
void ActivateMemcard(int card1, int card2)
{
    card_active[0] = card1;
    card_active[1] = card2;
    if (!MemCardActive) {
        MemcardON();
        MemcardOverlay = 1;
    }
}

/* @0x800A57CC */
void ActivateCharacterMemcard(int card1, int card2)
{
    ActivateMemcard(card1, card2);
    if (!CharacterBlockLoaded) {
        int fileno;
        memset(CharBlockBuf, 0, 0x1DE0);
        fileno = GetFileNumber(current_card, DiabloCharacterFile);
        if (fileno != -1) {
            int ok = PSX_CH_LoadBlock(current_card, fileno);
            if (ok)
                memset(CharBlockBuf, 0, 0x1DE0);
        } else
            PantsDelay();
    }
    countdownloadcharblock = 0;
    CharacterBlockLoaded = 1;
}

/* @0x800A5888 */
void ShowCardActionText()
{
    Dialog SBack;
    RECT um;
    int X, Y, W, H;
    int otpos;
    int oldBot, oldTot;
    int lines;
    int yprintpos;

    if (card_active[0] && card_active[1]) {
        if (new_card_flag[0] || card_status[0] == 3)
            StatusTxt = 0x349;
        else if (new_card_flag[1] || card_status[1] == 3)
            StatusTxt = 0x34A;
        else
            StatusTxt = 0;
    } else if (card_status[current_card] == 0) {
        if (!saveflag)
            StatusTxt = 0;
    } else if (!saveflag && card_status[current_card] == 3)
        StatusTxt = card_side_read[current_card];

    Y = 0x4A;
    if (!StatusTxt)
        return;
    X = 0x30;
    W = 0xE0;
    H = 0x3A;
    if (optionsflag == 1)
        Y = 0x5A;
    um.x = X;
    um.y = Y;
    um.w = W;
    um.h = H;
    otpos = CBlocks::GetOverlayOtBase() + 8;
    oldBot = SBack.SetOTpos(otpos);
    oldTot = MediumFont.SetOTpos(otpos);
    SBack.SetBorder(0x12);
    SBack.SetBack(5);
    SBack.SetRGB(0x40, 0x40, 0x40);
    SBack.Back(X, Y, W, H);
    lines = MediumFont.GetStrWidth(GetStr(StatusTxt)) / W + 1;
    yprintpos = (H - lines * 12) / 2 + 3;   /* signed /2 (not >>1): retail frame 120 needs its extra reload slot */
    MediumFont.Print(0, yprintpos, GetStr(StatusTxt), JustCentre, &um, WHITER, WHITEG, WHITEG);
    MediumFont.Print(0, yprintpos + lines * 13, GetStr(0x50E), JustCentre, &um, WHITER, WHITEG, WHITEG);
    SBack.SetOTpos(oldBot);
    MediumFont.SetOTpos(oldTot);
}

/* @0x800A5B6C */
int CountdownLoad(int Counter)
{
    Counter--;
    if (Counter > 0)
        return Counter;
    if (!GetLoadStatusMessage(Loadfilename)) {
        if (Loadfilename == DiabloGameFile)
            AlertTxt = 0x2BE;
        else
            AlertTxt = 0x2C0;
        return 0;
    }
    if (Loadfilename == DiabloGameFile) {
        if (int readstate = PSX_GM_LoadGame(1, current_card, GetFileNumber(current_card, Loadfilename))) {
            if (readstate == -2) {
                AlertTxt = 0x25C;
            } else
                AlertTxt = 0x25D;
        } else {
            MemcardOFF();
            PA_SetPauseOk(0);
            PaletteFadeOut(8);
            while (GetFadeState())
                TSK_Sleep(1);
            gbActivePlayers = 0;
            gbRunGame = 1;
            GRL_PostMessage(ghMainWnd, 0x4B, 0, 0);
            GLUE_ResumeGame();
            GLUE_SetShowPanelFlag(1);
            GLUE_SetHomingScrollFlag(1);
            optionsflag = 0;
            PauseMode = 0;
            options_pad = -1;
            TSK_Kill(DrawOptionsTask);
        }
    } else {
        if (int readstate = PSX_OPT_LoadGame(current_card, GetFileNumber(current_card, DiabloOptionFile), 1)) {
            if (readstate == -2) {
                gbRunGame = 0;
                AlertTxt = 0x25C;
            } else
                AlertTxt = 0x25D;
        } else {
            int dummy;   /* dead local: retail keeps a record-less level on this arm */
            AlertTxt = 0x2F6;
            GetVolumes();
            CalcVolumes();
        }
    }
    return Counter;
}

/* @0x800A5D7C */
int CountdownSave(int Counter)
{
    int cardstate[2];

    Counter++;
    if (Counter > 11) {
        if (GetSaveStatusMessage(save_blocks, Savefilename)) {
            ActivateMemcard(current_card == 0, current_card == 1);
            if (Savefilename != DiabloOptionFile) {
                if (DoSaveGame())
                    AlertTxt = 0x50F;
                else
                    AlertTxt = 0x508;
            } else {
                if (DoSaveOptions())
                    AlertTxt = 0x50F;
                else
                    AlertTxt = 0x2F8;
            }
            StatusTxt = 0;
            cardondelay = 0;
            service_card(current_card);
            ActivateMemcard(1, 1);
        }
        Counter = 0;
    }
    return Counter;
}

/* @0x800A5E5C */
void ShowLoadingBox(int Text)
{
    Dialog SBack;
    RECT um;
    BOOL addwaitmsg = 0;
    int W, H, X, Y;
    int otpos;
    int oldBot, oldTot;
    int lines, topline;
    int yprintpos;

    if (Text == card_side_load[0] || Text == card_side_load[1] || Text == card_side_save[0]
        || Text == card_side_save[1] || Text == card_side_format[0] || Text == card_side_format[1])
        addwaitmsg = 1;
    Y = 0x5B;
    W = 0xE0;
    H = 0x3A;
    X = 0x30;
    if (FeFlag)
        Y = 0x4B;
    um.x = X;
    um.y = Y;
    um.w = W;
    um.h = H;
    otpos = CBlocks::GetOverlayOtBase() + 8;
    oldBot = SBack.SetOTpos(otpos);
    oldTot = MediumFont.SetOTpos(otpos);
    SBack.SetBorder(0x12);
    SBack.SetBack(5);
    SBack.SetRGB(0x50, 0x40, 0x40);
    SBack.Back(X, Y, W, H);
    lines = MediumFont.GetStrWidth(GetStr(Text)) / W;
    topline = lines + 1;
    if (addwaitmsg)
        lines = topline + MediumFont.GetStrWidth(GetStr(0x28A)) / W;
    yprintpos = (H - lines * 12) / 2 + 3;   /* signed /2, see ShowCardActionText */
    MediumFont.Print(0, yprintpos, GetStr(Text), JustCentre, &um, WHITER, WHITEG, WHITEG);
    if (addwaitmsg)
        MediumFont.Print(0, yprintpos + topline * 13, GetStr(0x28A), JustCentre, &um, WHITER, WHITEG, WHITEG);
    SBack.SetOTpos(oldBot);
    MediumFont.SetOTpos(oldTot);
}

/* @0x800A60E8 */
void KillItemDead(int pnum, int InvPos, int Idx)
{
    int ii, iv, i;

    if (InvPos >= 0 && InvPos <= 3 && plr[pnum].InvBody[0]._itype != -1)
        plr[pnum].InvBody[0]._itype = -1;
    if (InvPos == 4 && plr[pnum].InvBody[1]._itype != -1)
        plr[pnum].InvBody[1]._itype = -1;
    if (InvPos == 5 && plr[pnum].InvBody[2]._itype != -1)
        plr[pnum].InvBody[2]._itype = -1;
    if (InvPos == 6 && plr[pnum].InvBody[3]._itype != -1)
        plr[pnum].InvBody[3]._itype = -1;
    if (InvPos >= 7 && InvPos <= 12 && plr[pnum].InvBody[4]._itype != -1)
        plr[pnum].InvBody[4]._itype = -1;
    if (InvPos >= 13 && InvPos <= 18 && plr[pnum].InvBody[5]._itype != -1)
        plr[pnum].InvBody[5]._itype = -1;
    if (InvPos >= 19 && InvPos <= 24 && plr[pnum].InvBody[6]._itype != -1)
        plr[pnum].InvBody[6]._itype = -1;

    if (InvPos >= 25 && InvPos <= 64) {
        ii = InvPos - 25;
        if (plr[pnum].InvGrid[ii] != 0) {
            if (plr[pnum].InvGrid[ii] > 0)
                iv = plr[pnum].InvGrid[ii];
            else
                iv = -plr[pnum].InvGrid[ii];
            for (i = 0; i < 40; i++) {
                if (plr[pnum].InvGrid[i] == iv || plr[pnum].InvGrid[i] == -iv)
                    plr[pnum].InvGrid[i] = 0;
            }
            iv--;
            plr[pnum].HoldItem = plr[pnum].InvList[iv];
            plr[pnum]._pNumInv--;
            if (plr[pnum]._pNumInv > 0 && plr[pnum]._pNumInv != iv) {
                plr[pnum].InvList[iv] = plr[pnum].InvList[plr[pnum]._pNumInv];
                for (i = 0; i < 40; i++) {
                    if (plr[pnum].InvGrid[i] == plr[pnum]._pNumInv + 1)
                        plr[pnum].InvGrid[i] = iv + 1;
                    if (plr[pnum].InvGrid[i] == -(plr[pnum]._pNumInv + 1))
                        plr[pnum].InvGrid[i] = -(iv + 1);
                }
            }
        }
    }
    if (InvPos >= 65) {
        ii = InvPos - 65;
        if (plr[pnum].SpdList[ii]._itype != -1) {
            plr[pnum].HoldItem = plr[pnum].SpdList[ii];
            plr[pnum].SpdList[ii]._itype = -1;
            drawsbarflag = 1;
        }
    }
}

/* @0x800A672C */
void ClearLoadCharItems()
{
    int i;

    if (FePlayerNo == 0)
        KeefDaFeef(0);
    else {
        for (i = 0; i < 2; i++) {
            KeefDaFeef(i);
            if (LoadedChar[0] && LoadedChar[1])
                WinterSales(i);
        }
    }
}

/* @0x800A67B4 */
void PantsDelay()
{
    for (int i = 0; i < 180; i++)
        VSync(0);
}
