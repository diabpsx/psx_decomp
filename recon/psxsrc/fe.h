#ifndef PSXSRC_FE_H
#define PSXSRC_FE_H
/* FE.CPP -- Climax PSX front end (C:\diabpsx\PSXSRC\FE.CPP, FRONTEND overlay).  PSX-only, no PC twin.
 * Declarations local to this TU: layouts from DIABPSX.SYM (tools/symhdr.py), prototypes spelled from
 * the retail mangled names. */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"

enum TXT_JUST { JustRight = 2, JustCentre = 1, JustLeft = 0 };
enum LANG_TYPE { LANG_NONE = 5, LANG_JAP = 4, LANG_SWEDISH = 3, LANG_GERMAN = 2, LANG_FRENCH = 1, LANG_ENGLISH = 0 };

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
struct FRAME_HDR;
struct SPR_HDR;
struct CTextFileInfo;

struct TextDat {   /* sizeof 112 */
    BOOL OwnDat;   /* +0x0 */
    int TexNum;   /* +0x4 */
    int LastFrame;   /* +0x8 */
    BOOL DatLoaded;   /* +0xC */
    long hndDat;   /* +0x10 */
    long hndHdr;   /* +0x14 */
    long hndPalOffset;   /* +0x18 */
    long hndCreatureOffset;   /* +0x1C */
    long hndBlockOffsets;   /* +0x20 */
    struct FRAME_HDR *Frames;   /* +0x24 */
    struct SPR_HDR *Hdr;   /* +0x28 */
    void *Pals;   /* +0x2C */
    int *PalOffset;   /* +0x30 */
    int *CreatureOffset;   /* +0x34 */
    unsigned char *CreatureAnims;   /* +0x38 */
    unsigned char *Blocks;   /* +0x3C */
    BOOL Loaded;   /* +0x40 */
    int LoadCount;   /* +0x44 */
    struct CTextFileInfo *FileInfo;   /* +0x48 */
    long hndDecompBuffer;   /* +0x4C */
    int DecX;   /* +0x50 */
    int DecY;   /* +0x54 */
    int PalX;   /* +0x58 */
    int PalY;   /* +0x5C */
    int Scr;   /* +0x60 */
    int NumOfBuffers[2];   /* +0x64 */
    long hndDecompArrays;   /* +0x6C */

    void DumpDatFile();
    POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
};

struct CScreen : TextDat {   /* sizeof 124 */
    int LoadedId;   /* +0x70 */
    int TpX;   /* +0x74 */
    int TpY;   /* +0x78 */

    void Load(int Id, int tpx, int tpy);
    void Unload(void);
    void Display(int Id, int tpx, int tpy, int fadeval);
};

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

    unsigned char CheckActive() { return active; }
};

extern unsigned char DialogRed, DialogGreen, DialogBlue;
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;

class CBlocks {
public:
    static int GetOverlayOtBase() { return 0x1E8; }
};

struct Dialog {   /* sizeof 16 */
    int BevelGfx;   /* +0x0 */
    int BorderGfx;   /* +0x4 */
    int BackGfx;   /* +0x8 */
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
};

struct FeTable {   /* sizeof 28 */
    int Title;   /* +0x0 */
    int Sel;   /* +0x4 */
    int SelW;   /* +0x8 */
    int SelH;   /* +0xC */
    void (*InitFuncPtr)();   /* +0x10 */
    void (*CtrlFuncPtr)();   /* +0x14 */
    void *PrevMenu;   /* +0x18 */
};

struct FeMenuTable {   /* sizeof 24 */
    int X;   /* +0x0 */
    int Y;   /* +0x4 */
    enum TXT_JUST Just;   /* +0x8 */
    unsigned short Str;   /* +0xC */
    struct FeTable *MenuPtr;   /* +0x10 */
    struct CFont *Font;   /* +0x14 */
};

struct FeStruct {   /* sizeof 24 */
    int X;   /* +0x0 */
    int Y;   /* +0x4 */
    enum TXT_JUST Just;   /* +0x8 */
    int Str;   /* +0xC */
    struct CFont *Font;   /* +0x10 */
    struct FeTable *MenuPtr;   /* +0x14 */
};

struct FE_PLR {   /* sizeof 16 */
    char Name[10];   /* +0x0 */
    int Class;   /* +0xC */
};

struct FE_CREATE {   /* sizeof 36 */
    int NumOfPlayers;   /* +0x0 */
    struct FE_PLR Plrs[2];   /* +0x4 */
};

enum PLR_MODE {
    PM_QUIT = 11,
    PM_NEWLVL = 10,
    PM_SPELL = 9,
    PM_DEATH = 8,
    PM_GOTHIT = 7,
    PM_BLOCK = 6,
    PM_RATTACK = 5,
    PM_ATTACK = 4,
    PM_WALK3 = 3,
    PM_WALK2 = 2,
    PM_WALK = 1,
    PM_STAND = 0
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
    unsigned long long _pMemSpells;   /* +0xB8 (SYM says ULONG; 8 bytes) */
    unsigned long long _pAblSpells;   /* +0xC0 (SYM says ULONG; 8 bytes) */
    unsigned long long _pScrlSpells;   /* +0xC8 (SYM says ULONG; 8 bytes) */
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
    unsigned long long _pISpells;   /* +0x19B0 (SYM says ULONG; 8 bytes) */
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

extern "C" {
void *memset(void *s, int c, unsigned long n);
int sprintf(char *buf, const char *fmt, ...);
char *strcpy(char *dst, const char *src);
char *strcat(char *dst, const char *src);
unsigned long strlen(const char *s);
TASK *TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);   /* TASKER.C:141 */
void TSK_Sleep(int Frames);   /* TASKER.C:287 */
void DBG_Error(char *Text, char *File, int Line);   /* GDEBUG.C:146 */
void play_movie(char *pszMovie);   /* COREFMV.CPP:197 (unmangled in the oracle) */
}

void ActivateMemcard(int card1, int card2);   /* CARDCORE.CPP:492 */
BOOL BL_AsyncLoadDone(void);   /* BIGLUMP.CPP:614 */
void DrawFlameLogo(void);   /* TITLESCR.CPP:65 */
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross, BOOL iso, unsigned char SinStep);   /* OPTIONS.CPP:898 */
void FinishBootProgress(void);   /* LOADING.CPP:407 */
void FinishProgress(void);   /* LOADING.CPP:438 */
void GM_FinishedUsing(TextDat *Fin);   /* GMAN.CPP:1349 */
TextDat *GM_UseTexData(int Id);   /* GMAN.CPP:1312 */
BOOL GetFadeState(void);   /* PALETTE.CPP:179 */
char *GetStr(int StrId);   /* LANG.CPP:171 */
void InitQTextMsg(int m);   /* MINITEXT.CPP:296 */
BOOL IsGameLoading(void);   /* LOADING.CPP:212 */
enum LANG_TYPE LANG_GetLang(void);   /* LANG.CPP:84 */
void MemcardOFF(void);   /* CARDCORE.CPP:396 */
CPad *PAD_GetPad(int PadNum, unsigned char both);   /* PADS.CPP:251 */
BOOL PaletteFadeOut(int fr);   /* PALETTE.CPP:403 */
void PlaySFX(int psfx);   /* EFFECTS.CPP:520 */
void PrintSelectBack(unsigned short Str);   /* OPTIONS.CPP:817 */
void PutUpCutScreen(int lev);   /* LOADING.CPP:315 */
void ReadPad(int NoDeb);   /* DAVEO.CPP:74 */
void SND_LoadBank(int lvlnum);   /* SNDBANK.CPP:296 */
void SPU_Init(void);   /* SNDBANK.CPP:175 */
void TakeDownCutScreen(void);   /* LOADING.CPP:374 */
void ToggleOptions(void);   /* OPTIONS.CPP:3174 */
unsigned long VID_GetTick(void);   /* VID.CPP:264 */
void VID_SetXYOff(int x, int y);   /* VID.CPP:287 */
void music_fade(void);   /* SOUND.CPP:245 */
void music_start(int nTrack);   /* SOUND.CPP:261 */
void music_stop(void);   /* SOUND.CPP:227 */
void snd_init(unsigned long hWnd);   /* SOUND.CPP:209 */
int who_pressed(int pval);   /* OPTIONS.CPP:1498 */

/* this TU */
void FeInitBuffer(void);
void FeAddEntry(int X, int Y, TXT_JUST Just, unsigned short Str, FeTable *MenuPtr, CFont *Font);
void FeAddTable(FeMenuTable *Table, int Count);
void FeAddNameTable(unsigned char *Table, int Count);
void FeDrawBuffer(void);
void FeNewMenu(FeTable *Menu);
void FePrevMenu(void);
void FeSelUp(int No);
void FeSelDown(int No);
int FeGetCursor(void);
void FeSelect(void);
void FeMainKeyCtrl(CScreen *FeScreen);
void InitDummyMenu(void);
void InitFrontEnd(FE_CREATE *CreateStruct);
void FeInitMainMenu(void);
void FeInitNewGameMenu(void);
void FeNewGameMenuCtrl(void);
void FeInitPlayer1ClassMenu(void);
void FeInitPlayer2ClassMenu(void);
void FePlayerClassMenuCtrl(void);
void FeDrawChrClass(void);
void FeInitNewP1NameMenu(void);
void FeInitNewP2NameMenu(void);
void FeNewNameMenuCtrl(void);
void FeCopyPlayerInfoForReturn(void);
void FeEnterGame(void);
void FeInitLoadMemcardSelect(void);
void FeInitLoadChar1Menu(void);
void FeInitLoadChar2Menu(void);
void FeInitDifficultyMenu(void);
void FeDifficultyMenuCtrl(void);
void FeInitBackgroundMenu(void);
void FeInitBook1Menu(void);
void FeInitBook2Menu(void);
void FeBackBookMenuCtrl(void);
void PlayDemo(void);
void FadeFEOut(void);
void DrawBackTSK(TASK *T);
void FeInitMainStuff(TASK *T2);
void FrontEndTask(TASK *T);
void DrawFeTwinkle(int TwinkX, int TwinkY);

/* externals (other TUs; %hi-addressed in this oracle) */
extern BOOL CDWAIT;
extern short DavesPad;
extern unsigned char qtextflag;
extern unsigned char PauseMode;
extern struct PlayerStruct plr[2];
extern const unsigned char WHITER, WHITEG, WHITEB;
extern const unsigned char GOLDR, GOLDG, GOLDB;
extern const unsigned char BLUER, BLUEG, BLUEB;
extern CFont MediumFont;
extern CFont LargeFont;
extern unsigned char PlayDemoFlag;
extern BOOL MemCardActive;
extern BOOL user_start;
extern BOOL optionsflag;
extern int flamecol;
extern BOOL fileinfoflag;
extern int InCredits;
extern CScreen CutScr;
extern int current_card;
extern int cardondelay;
extern int card_active[2];
extern int DirtyVidY;
extern int DirtyVidx;
extern BOOL CharacterBlockLoaded;
extern unsigned char ADirtyFlagThatGaryWillLove;
extern int options_pad;
extern int gnDifficulty;
extern unsigned char gbRunGame;
extern unsigned char gbMaxPlayers;
extern unsigned char gbActivePlayers;
extern unsigned char currlevel;
extern int StrengthTbl[3];
extern int MagicTbl[3];
extern int DexterityTbl[3];
extern int VitalityTbl[3];
extern unsigned char UniqueItemFlag[128];
extern BOOL TitleFlag;
extern char **TextPtr;
extern int AlertTxt;

/* FE-owned initialised .data tables (%hi-addressed; bytes live in the retail .data image) */
extern struct FeStruct FeBuffer[80];
extern char FePlayerName[2][11];
extern struct FeTable DummyMenu;
extern struct FeTable FeMainMenu;
extern struct FeTable FeNewGameMenu;
extern struct FeTable FeNewP1ClassMenu;
extern struct FeTable FeNewP1NameMenu;
extern struct FeTable FeNewP2ClassMenu;
extern struct FeTable FeNewP2NameMenu;
extern struct FeTable FeDifficultyMenu;
extern struct FeTable FeBackgroundMenu;
extern struct FeTable FeBook1Menu;
extern struct FeTable FeBook2Menu;
extern struct FeTable FeLoadCharMenu;
extern struct FeTable FeLoadChar1Menu;
extern struct FeTable FeLoadChar2Menu;
extern struct FeTable McLoadGameMenu;
void McCharCardMenuCtrl(void);
void McMainCharKeyCtrl(void);
extern struct FeMenuTable FeMainMenuTable[5];
extern struct FeMenuTable FeNewGameMenuTable[3];
extern struct FeMenuTable FePlayerClassMenuTable[5];
extern unsigned char FeNameEngMenuTable[40];
extern struct FeMenuTable FeMemcardMenuTable[3];
extern struct FeMenuTable FeDifficultyMenuTable[4];
extern struct FeMenuTable FeBackgroundMenuTable[4];
extern struct FeMenuTable FeBook1MenuTable[5];
extern struct FeMenuTable FeBook2MenuTable[6];

#endif
