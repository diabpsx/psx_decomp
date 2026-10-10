#ifndef PSXSRC_DLG_H
#define PSXSRC_DLG_H
/* DLG.CPP -- Climax PSX memory-card load/save dialogs + character pack/unpack (C:\diabpsx\PSXSRC\DLG.CPP,
 * FRONTEND overlay).  PSX-only screens; Pack/UnPack follow the PC PACKPLR.CPP shape with the PSX
 * PkPlayerStruct layout.  Declarations local to this TU: layouts from DIABPSX.SYM (tools/symhdr.py),
 * prototypes spelled from the retail mangled names. */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"

enum TXT_JUST { JustRight = 2, JustCentre = 1, JustLeft = 0 };

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
    int SetOTpos(int OT);
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

    unsigned short GetTick() const;
    unsigned short GetDown() const;
    void SetPadTickMask(unsigned short mask);
    void SetPadTick(unsigned short tick);
};

extern unsigned char DialogRed, DialogGreen, DialogBlue;
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;

class CBlocks {
public:
    static int GetOverlayOtBase();
};

struct Dialog {   /* sizeof 16 */
    int BevelGfx;   /* +0x0 */
    int BorderGfx;   /* +0x4 */
    int BackGfx;   /* +0x8 */
    int DialogOTpos;   /* +0xC */

    Dialog();
    ~Dialog();
    void SetRGB(unsigned char R, unsigned char G, unsigned char B);
    void SetBack(int Type);
    void SetBorder(int Type);
    int SetOTpos(int OT);
    void Back(int DX, int DY, int DW, int DH);
};

inline int CBlocks::GetOverlayOtBase()
{
    return 0x1E8;
}

inline Dialog::Dialog()
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

inline Dialog::~Dialog()
{
}

inline void Dialog::SetBorder(int Type)
{
    BorderGfx = Type;
}

inline void Dialog::SetBack(int Type)
{
    BackGfx = Type;
}

inline void Dialog::SetRGB(unsigned char R, unsigned char G, unsigned char B)
{
    DialogRed = R;
    DialogGreen = G;
    DialogBlue = B;
}

inline void CPad::SetPadTick(unsigned short tick)
{
    PADTICK = tick;
}

inline void CPad::SetPadTickMask(unsigned short mask)
{
    PADTICKMASK = mask;
}

inline unsigned short CPad::GetDown() const
{
    if (get_both)
        return both_Down;
    return Down;
}

inline unsigned short CPad::GetTick() const
{
    if (get_both)
        return both_Tick;
    return Tick;
}

struct FeTable {   /* sizeof 28 */
    int Title;   /* +0x0 */
    int Sel;   /* +0x4 */
    int SelW;   /* +0x8 */
    int SelH;   /* +0xC */
    void (*InitFuncPtr)();   /* +0x10 */
    void (*CtrlFuncPtr)();   /* +0x14 */
    void *PrevMenu;   /* +0x18 */
};

struct PkItemStruct {   /* sizeof 20 */
    unsigned int dwBuff : 32;
    int iSeed : 32;
    unsigned int iCreateInfo : 16;
    unsigned int idx : 16;
    unsigned int wValue : 16;
    unsigned int bId : 8;
    unsigned int bDur : 8;
    unsigned int bMDur : 8;
    unsigned int bCh : 8;
    unsigned int bMCh : 8;
};

struct FILETIME {   /* sizeof 8 */
    unsigned long dwLowDateTime;   /* +0x0 */
    unsigned long dwHighDateTime;   /* +0x4 */
};

struct PkPlayerStruct {   /* sizeof 1272 */
    struct PkItemStruct SpdList[8];   /* +0x0 */
    struct PkItemStruct InvBody[7];   /* +0xA0 */
    struct PkItemStruct InvList[40];   /* +0x12C */
    unsigned long long pMemSpells;   /* +0x450 */
    struct FILETIME archiveTime;   /* +0x458 */
    long pExperience;   /* +0x460 */
    long pHPBase;   /* +0x464 */
    long pMaxHPBase;   /* +0x468 */
    long pManaBase;   /* +0x46C */
    long pMaxManaBase;   /* +0x470 */
    int pRSpell;   /* +0x474 */
    char pName[32];   /* +0x478 */
    char InvGrid[40];   /* +0x498 */
    unsigned char pSplLvl[37];   /* +0x4C0 */
    unsigned char destAction;   /* +0x4E5 */
    unsigned char destParam1;   /* +0x4E6 */
    unsigned char destParam2;   /* +0x4E7 */
    unsigned char plrlevel;   /* +0x4E8 */
    unsigned char pClass;   /* +0x4E9 */
    unsigned char pBaseStr;   /* +0x4EA */
    unsigned char pBaseMag;   /* +0x4EB */
    unsigned char pBaseDex;   /* +0x4EC */
    unsigned char pBaseVit;   /* +0x4ED */
    unsigned char pLevel;   /* +0x4EE */
    unsigned char pStatPts;   /* +0x4EF */
    char DeadLevel;   /* +0x4F0 */
    unsigned char _pNumInv;   /* +0x4F1 */
    char pRSplType;   /* +0x4F2 */
};

struct CharDataStructDef {   /* sizeof 7648 */
    struct PkPlayerStruct CharSlots[6];   /* +0x0 */
    char ToggleSave[6];   /* +0x1DD0 */
    char spltypesave[6];   /* +0x1DD6 */
};

struct file_header {   /* sizeof 512 */
    char magic[2];   /* +0x0 */
    char type;   /* +0x2 */
    char blockentry;   /* +0x3 */
    unsigned char title[64];   /* +0x4 */
    char reserved[28];   /* +0x44 */
    char clut[32];   /* +0x60 */
    char icon[1][128];   /* +0x80 */
    int chksum;   /* +0x100 */
    int size;   /* +0x104 */
    int id;   /* +0x108 */
    char icon2[1][116];   /* +0x10C */
    char icon3[1][128];   /* +0x180 */
};

struct DIRENTRY {   /* sizeof 40 */
    char name[20];   /* +0x0 */
    long attr;   /* +0x14 */
    long size;   /* +0x18 */
    struct DIRENTRY *next;   /* +0x1C */
    long head;   /* +0x20 */
    char system[4];   /* +0x24 */
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
char *strncat(char *dst, const char *src, unsigned long n);
int strcmp(const char *a, const char *b);
}

struct CPad *PAD_GetPad(int PadNum, unsigned char both);   /* PADS.CPP:251 */
char *GetStr(int StrId);   /* LANG.CPP:171 */
void PlaySFX(int psfx);   /* EFFECTS.CPP:520 */
void ActivateMemcard(int card1, int card2);   /* CARDCORE.CPP:492 */
void ActivateCharacterMemcard(int card1, int card2);   /* CARDCORE.CPP:504 */
void MemcardOFF(void);   /* CARDCORE.CPP:396 */
void ShowCardActionText(void);   /* CARDCORE.CPP:535 */
void ShowLoadingBox(int Text);   /* CARDCORE.CPP:742 */
void CalcPlrInv(int p, unsigned char Loadgfx);   /* ITEMS.CPP:1114 */
void RecreateItem(int ii, int idx, unsigned short icreateinfo, int iseed, int ivalue, int PlrCreate);   /* ITEMS.CPP:6127 */
void ClrPlrPath(int pnum);   /* PLAYER.CPP:4704 */
void InitPlayer(int pnum, unsigned char FirstTime);   /* PLAYER.CPP:4695 */
long GetRndSeed(void);   /* ENGINE.CPP:102 */
char *GetDiabloStr(void);   /* LOADSAVE.CPP:145 */
void PSX_CH_LoadGame(int slot);   /* LOADSAVE.CPP:1124 */
int PSX_GM_LoadGame(unsigned char firstflag, int card_number, int file);   /* LOADSAVE.CPP:1043 */
int PSX_GM_SaveGame(int card_number, char *name, char *title);   /* LOADSAVE.CPP:880 */
int PSX_OPT_SaveGame(int card_number, char *filename);   /* LOADSAVE.CPP:1261 */
void FeAddEntry(int X, int Y, TXT_JUST Just, unsigned short Str, FeTable *MenuPtr, CFont *Font);   /* FE.CPP:178 */
void FeNewMenu(FeTable *Menu);   /* FE.CPP:340 */
void FePrevMenu(void);   /* FE.CPP:357 */
void FeSelUp(int No);   /* FE.CPP:420 */
void FeSelDown(int No);   /* FE.CPP:436 */
int FeGetCursor(void);   /* FE.CPP:457 */
void FeSelect(void);   /* FE.CPP:462 */
void DrawFeTwinkle(int TwinkX, int TwinkY);   /* FE.CPP:1723 */

/* this TU */
int GetFileNumber(int side, char *file_name);
int DoSaveOptions(void);
int DoSaveGame(void);
void DoLoadGame(void);
int DoFrontEndLoadCharacter(int slot);
void McInitLoadCard1Menu(void);
void McInitLoadCard2Menu(void);
void ChooseCardLoad(void);
void McInitLoadGameMenu(void);
void McMainKeyCtrl(void);
void McCharCardMenuCtrl(void);
void McMainCharKeyCtrl(void);
void ShowAlertBox(void);
BOOL GetLoadStatusMessage(char *file_name);
BOOL GetSaveStatusMessage(int fileblocks, char *file_name);
void ShowGameFiles(char *filename, int saveflag, int Spacing, RECT ORect, int yoff);
void ShowCharacterFiles(int cs, int Spacing, RECT ORect, int yoff);
static void PackItem(PkItemStruct *id, const ItemStruct *is);
void PackPlayer(PkPlayerStruct *pPack, int pnum);
static void UnPackItem(const PkItemStruct *is, ItemStruct *id);
void VerifyGoldSeeds(PlayerStruct *pPlayer);
void UnPackPlayer(const PkPlayerStruct *pPack, int pnum, unsigned char killok);
void ConstructSlotName(char *TempStr, int slot);
int GetSpinnerWidth(int j);
char *ReconstructSlotName(int side, int file);

/* externals (%hi-addressed in this oracle) */
extern short DavesPad;
extern CFont MediumFont;
extern CFont LargeFont;
extern const unsigned char WHITER, WHITEG, WHITEB;
extern const unsigned char GOLDR, GOLDG, GOLDB;
extern struct PlayerStruct plr[2];
extern struct ItemStruct item[128];
extern struct ItemStruct _witchitem[2][20];
extern int myplr;
extern int StorePlrNo;
extern long ExpLvlsTbl[51];
extern int card_status[2];
extern int card_usable[2];
extern int card_files[2];
extern int card_dirty[2];
extern int card_side_empty[2];
extern int card_side_read[2];
extern int card_side_nogame[2];
extern int card_side_load[2];
extern struct DIRENTRY card_dir[2][16];
extern struct file_header card_header[2][16];
extern int countdownloadcharblock;
extern int cardondelay;
extern int loadflag;
extern BOOL DoLoadedGame;
extern BOOL DoLoadedChar;
extern BOOL CharacterBlockLoaded;
extern int fileselect;
extern int FePlayerNo;
extern int FeNoOfPlayers;
extern BOOL LoadedChar[2];
extern unsigned char FeFlag;
extern int FeBackX, FeBackY, FeBackW, FeBackH;
extern struct FeTable FeNewP2ClassMenu;
extern struct FeTable FeDifficultyMenu;

/* DLG-owned initialised data in the overlay (%hi-addressed) */
/* DLG.CPP's uninitialised data, declared in retail order: cc1plus emits them at the end of the TU in
 * first-declaration order (0x801436EC save_buffer, 0x801576F0 CharDataStruct, 0x801594D0 TempStr,
 * 0x80159510 AlertStr). */
extern unsigned char save_buffer[81920];
extern struct CharDataStructDef CharDataStruct;
extern char TempStr[64];
extern char AlertStr[128];
extern const struct FeTable McLoadGameMenu;   /* .rdata table */
extern const struct FeTable McLoadCard1Menu;   /* .rdata table */
extern const struct FeTable McLoadCard2Menu;   /* .rdata table */
extern const int ClassStrTbl[3];

#endif
