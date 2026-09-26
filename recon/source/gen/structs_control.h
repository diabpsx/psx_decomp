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

struct SpellData {   /* sizeof 52 */
    unsigned char sName;   /* +0x0 */
    unsigned char sManaCost;   /* +0x1 */
    unsigned char sType;   /* +0x2 */
    int sNameText;   /* +0x4 */
    int sSkillText;   /* +0x8 */
    int sBookLvl;   /* +0xC */
    int sStaffLvl;   /* +0x10 */
    unsigned char sTargeted;   /* +0x14 */
    unsigned char sTownSpell;   /* +0x15 */
    int sMinInt;   /* +0x18 */
    unsigned char sSFX;   /* +0x1C */
    unsigned char sMissiles[3];   /* +0x1D */
    unsigned char sManaAdj;   /* +0x20 */
    unsigned char sMinMana;   /* +0x21 */
    int sStaffMin;   /* +0x24 */
    int sStaffMax;   /* +0x28 */
    int sBookCost;   /* +0x2C */
    int sStaffCost;   /* +0x30 */
};

struct PAL {   /* sizeof 8 */
    unsigned int InVram : 1;
    unsigned int NumOfCols : 31;
    unsigned short Cols[1];   /* +0x4 */
};
/* Generated from DIABPSX.SYM via tools/symhdr.py struct CPad Dialog CBlocks TextDat RECT POLY_FT4
 * POLY_GT4 TASK, then hand-converted to real classes for the 4 header-inline methods this TU
 * compiles out-of-line (-fno-inline): CPad::GetDown/GetTick/SetPadTick*, Dialog ctor/dtor/Set*,
 * TextDat::GetFr/GetPal (bodies identical to recon/psxsrc/gman.h's), CBlocks::GetOverlayOtBase/
 * GetMaxOtPos.  Non-virtual, no vptr -- matches retail's plain STAT-method dtor shape. */
class CPad {
public:
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

    unsigned short GetDown() { return get_both ? both_Down : Down; }
    unsigned short GetTick() { return get_both ? both_Tick : Tick; }
    void SetPadTickMask(unsigned short m) { PADTICKMASK = m; }
    void SetPadTick(unsigned short t) { PADTICK = t; }
};

class Dialog {
public:
    int BevelGfx;   /* +0x0 */
    int BorderGfx;   /* +0x4 */
    int BackGfx;   /* +0x8 */
    int DialogOTpos;   /* +0xC */

    Dialog();
    ~Dialog();
    void SetBorder(int v) { BorderGfx = v; }
    void SetBack(int v) { BackGfx = v; }
    void SetRGB(unsigned char R, unsigned char G, unsigned char B);
};

struct FRAME_HDR {   /* sizeof 12 */
    unsigned int FrOffset : 32;
    int X : 8;
    int Y : 8;
    unsigned int PalNum : 8;
    unsigned int NotTrans : 1;
    unsigned int Rotated : 1;
    unsigned int InVRAM : 1;
    unsigned int CompType : 2;
    unsigned int Floor : 1;
    unsigned int Cycle : 1;
    unsigned int pad : 1;
    unsigned int W : 9;
    unsigned int H : 9;
    unsigned int PentaGram : 1;
    unsigned int pad2 : 13;
};

struct SPR_HDR;

struct CTextFileInfo;

class TextDat {
public:
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

    struct FRAME_HDR *GetFr(int FrNum) { return Frames + (unsigned short)FrNum; }
    struct PAL *GetPal(int PalNum) { return (struct PAL *)((unsigned char *)Pals + PalOffset[PalNum]); }
    struct POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
};

struct MonstList;

struct LittleGt4;

struct RECT {   /* sizeof 8 */
    short x;   /* +0x0 */
    short y;   /* +0x2 */
    short w;   /* +0x4 */
    short h;   /* +0x6 */
};

struct RgbBlockInf {   /* sizeof 24 */
    int FromValR;   /* +0x0 */
    int ToValR;   /* +0x4 */
    int FromValG;   /* +0x8 */
    int ToValG;   /* +0xC */
    int FromValB;   /* +0x10 */
    int ToValB;   /* +0x14 */
};

class CBlocks {
public:
    struct TextDat TextDat;   /* +0x0 */
    struct TextDat *MonstTexDat;   /* +0x70 */
    struct TextDat *ObjTexDat;   /* +0x74 */
    struct MonstList *MonsterList;   /* +0x78 */
    int RndX;   /* +0x7C */
    int RndY;   /* +0x80 */
    int MonstTexId;   /* +0x84 */
    long hndBlocks;   /* +0x88 */
    int ObjTexId;   /* +0x8C */
    int ItemTexId;   /* +0x90 */
    struct TextDat *ItemTexDat;   /* +0x94 */
    int BgTexId;   /* +0x98 */
    struct TextDat *BgTexDat;   /* +0x9C */
    int pOtPos[2];   /* +0xA0 */
    BOOL IsTown;   /* +0xA8 */
    int NumOfBlocks;   /* +0xAC */
    struct LittleGt4 *Gt4s;   /* +0xB0 */
    long hndGt4s;   /* +0xB4 */
    struct RECT *Rects;   /* +0xB8 */
    long hndRects;   /* +0xBC */
    struct RECT ClipRect;   /* +0xC0 */
    int StX;   /* +0xC8 */
    int StY;   /* +0xCC */
    int Mx;   /* +0xD0 */
    int My;   /* +0xD4 */
    int pBlockX[2];   /* +0xD8 */
    int pBlockY[2];   /* +0xE0 */
    int CursX;   /* +0xE8 */
    int CursY;   /* +0xEC */
    struct RgbBlockInf GlBlockInf;   /* +0xF0 */

    static int GetOverlayOtBase() { return 0x1E8; }
    static int GetMaxOtPos() { return 0x1FF; }
};

struct POLY_FT4 {   /* sizeof 40 */
    unsigned long tag;   /* +0x0 */
    unsigned char r0;   /* +0x4 */
    unsigned char g0;   /* +0x5 */
    unsigned char b0;   /* +0x6 */
    unsigned char code;   /* +0x7 */
    short x0;   /* +0x8 */
    short y0;   /* +0xA */
    unsigned char u0;   /* +0xC */
    unsigned char v0;   /* +0xD */
    unsigned short clut;   /* +0xE */
    short x1;   /* +0x10 */
    short y1;   /* +0x12 */
    unsigned char u1;   /* +0x14 */
    unsigned char v1;   /* +0x15 */
    unsigned short tpage;   /* +0x16 */
    short x2;   /* +0x18 */
    short y2;   /* +0x1A */
    unsigned char u2;   /* +0x1C */
    unsigned char v2;   /* +0x1D */
    unsigned short pad1;   /* +0x1E */
    short x3;   /* +0x20 */
    short y3;   /* +0x22 */
    unsigned char u3;   /* +0x24 */
    unsigned char v3;   /* +0x25 */
    unsigned short pad2;   /* +0x26 */
};

struct POLY_GT4 {   /* sizeof 52 */
    unsigned long tag;   /* +0x0 */
    unsigned char r0;   /* +0x4 */
    unsigned char g0;   /* +0x5 */
    unsigned char b0;   /* +0x6 */
    unsigned char code;   /* +0x7 */
    short x0;   /* +0x8 */
    short y0;   /* +0xA */
    unsigned char u0;   /* +0xC */
    unsigned char v0;   /* +0xD */
    unsigned short clut;   /* +0xE */
    unsigned char r1;   /* +0x10 */
    unsigned char g1;   /* +0x11 */
    unsigned char b1;   /* +0x12 */
    unsigned char p1;   /* +0x13 */
    short x1;   /* +0x14 */
    short y1;   /* +0x16 */
    unsigned char u1;   /* +0x18 */
    unsigned char v1;   /* +0x19 */
    unsigned short tpage;   /* +0x1A */
    unsigned char r2;   /* +0x1C */
    unsigned char g2;   /* +0x1D */
    unsigned char b2;   /* +0x1E */
    unsigned char p2;   /* +0x1F */
    short x2;   /* +0x20 */
    short y2;   /* +0x22 */
    unsigned char u2;   /* +0x24 */
    unsigned char v2;   /* +0x25 */
    unsigned short pad2;   /* +0x26 */
    unsigned char r3;   /* +0x28 */
    unsigned char g3;   /* +0x29 */
    unsigned char b3;   /* +0x2A */
    unsigned char p3;   /* +0x2B */
    short x3;   /* +0x2C */
    short y3;   /* +0x2E */
    unsigned char u3;   /* +0x30 */
    unsigned char v3;   /* +0x31 */
    unsigned short pad3;   /* +0x32 */
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
