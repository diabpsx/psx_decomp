/* PADFUNCS.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  PSX-only (no PC twin): the pad
 * action handlers bound to the GamePad buttons (attack / action / cast / belt / menus / quick spell &
 * potions), the item-selector overlay (DrawObjTask/DrawObjSelector) and the area search that feeds it
 * (CheckArea/CheckRangeObject/add_area_find_object).
 * Reconstructed from the raw oracle (asm/nonmatchings/padfuncs/*.s) + the SYM (DIABPSX.SYM); drafts from
 * refs/skeleton (TDR Ghidra) as shape hints.  Header inlines (Dialog, SpellTarget::Active, CBlocks,
 * CPad) are emitted out of line in this object (-fno-inline). */
#include "diabpsx_types.h"

/* ---------------------------------------------------------------- types (SYM) */
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

struct MonsterData;

struct AnimStruct {   /* sizeof 2 */
    char Frames;   /* +0x0 */
    char Rate;   /* +0x1 */
};

struct CMonster {   /* sizeof 28 */
    struct MonsterData *MData;   /* +0x0 */
    struct AnimStruct Anims[6];   /* +0x4 */
    unsigned short Snds;   /* +0x10 */
    unsigned char mtype;   /* +0x12 */
    unsigned char mPlaceFlags;   /* +0x13 */
    unsigned char mMinHP;   /* +0x14 */
    unsigned char mMaxHP;   /* +0x15 */
    unsigned char has_special;   /* +0x16 */
    unsigned char mAFNum;   /* +0x17 */
    char mdeadval;   /* +0x18 */
};

struct MonsterStruct {   /* sizeof 104 */
    int mtalkmsg;   /* +0x0 */
    int _mgoalvar1;   /* +0x4 */
    int _mgoalvar2;   /* +0x8 */
    int _mgoalvar3;   /* +0xC */
    int _mhitpoints;   /* +0x10 */
    int _mmaxhp;   /* +0x14 */
    short _mVar1;   /* +0x18 */
    short _mVar2;   /* +0x1A */
    short _mVar3;   /* +0x1C */
    short _mVar4;   /* +0x1E */
    short _mVar5;   /* +0x20 */
    short _mVar6;   /* +0x22 */
    short _mVar7;   /* +0x24 */
    short _mVar8;   /* +0x26 */
    short _mxvel;   /* +0x28 */
    short _myvel;   /* +0x2A */
    unsigned short _mFlags;   /* +0x2C */
    unsigned short mExp;   /* +0x2E */
    unsigned short mMagicRes;   /* +0x30 */
    char _mMTidx;   /* +0x32 */
    char _mmode;   /* +0x33 */
    char _mx;   /* +0x34 */
    char _my;   /* +0x35 */
    char _mfutx;   /* +0x36 */
    char _mfuty;   /* +0x37 */
    char _moldx;   /* +0x38 */
    char _moldy;   /* +0x39 */
    char _mxoff;   /* +0x3A */
    char _myoff;   /* +0x3B */
    char _mdir;   /* +0x3C */
    unsigned char _menemy;   /* +0x3D */
    char _mAnimDelay;   /* +0x3E */
    char _mAnimCnt;   /* +0x3F */
    char _mAnimLen;   /* +0x40 */
    char _mAnimFrame;   /* +0x41 */
    char _mAFNum;   /* +0x42 */
    char _lastx;   /* +0x43 */
    char _lasty;   /* +0x44 */
    char _udeadval;   /* +0x45 */
    char mWhoHit;   /* +0x46 */
    char mLevel;   /* +0x47 */
    char mArmorClass;   /* +0x48 */
    unsigned char _mgoal;   /* +0x49 */
    unsigned char _menemyx;   /* +0x4A */
    unsigned char _menemyy;   /* +0x4B */
    unsigned char _mAi;   /* +0x4C */
    unsigned char _mint;   /* +0x4D */
    unsigned char _msquelch;   /* +0x4E */
    unsigned char _uniqtype;   /* +0x4F */
    unsigned char mHit;   /* +0x50 */
    unsigned char mMinDamage;   /* +0x51 */
    unsigned char mMaxDamage;   /* +0x52 */
    unsigned char mHit2;   /* +0x53 */
    unsigned char mMinDamage2;   /* +0x54 */
    unsigned char mMaxDamage2;   /* +0x55 */
    unsigned char leader;   /* +0x56 */
    unsigned char leaderflag;   /* +0x57 */
    unsigned char packsize;   /* +0x58 */
    unsigned char mlid;   /* +0x59 */
    char Action;   /* +0x5A */
    char _mDelFlag;   /* +0x5B */
    int mName;   /* +0x5C */
    struct CMonster *MType;   /* +0x60 */
    struct MonsterData *MData;   /* +0x64 */
};

struct TNQ {   /* sizeof 3 */
    unsigned char _qsttype;   /* +0x0 */
    unsigned char _qstmsg;   /* +0x1 */
    unsigned char _qstmsgact;   /* +0x2 */
};

struct TownerStruct {   /* sizeof 196 */
    int _tmode;   /* +0x0 */
    int _ttype;   /* +0x4 */
    int _tx;   /* +0x8 */
    int _ty;   /* +0xC */
    long _txoff;   /* +0x10 */
    long _tyoff;   /* +0x14 */
    long _txvel;   /* +0x18 */
    long _tyvel;   /* +0x1C */
    int _tdir;   /* +0x20 */
    int _tAnimDelay;   /* +0x24 */
    int _tAnimCnt;   /* +0x28 */
    int _tAnimLen;   /* +0x2C */
    int _tAnimFrame;   /* +0x30 */
    int _tAnimFrameCnt;   /* +0x34 */
    char _tAnimOrder;   /* +0x38 */
    long _tAnimWidth;   /* +0x3C */
    long _tAnimWidth2;   /* +0x40 */
    int _tTenPer;   /* +0x44 */
    int _teflag;   /* +0x48 */
    int _tbtcnt;   /* +0x4C */
    unsigned char _tSelFlag;   /* +0x50 */
    unsigned char _tMsgSaid;   /* +0x51 */
    struct TNQ qsts[16];   /* +0x52 */
    int _tSeed;   /* +0x84 */
    long _tVar1;   /* +0x88 */
    long _tVar2;   /* +0x8C */
    long _tVar3;   /* +0x90 */
    long _tVar4;   /* +0x94 */
    int _tName;   /* +0x98 */
    unsigned char *_tNAnim[8];   /* +0x9C */
    int _tNFrames;   /* +0xBC */
    unsigned char *_tNData;   /* +0xC0 */
};

struct ObjectStruct {   /* sizeof 44 */
    short _olid;   /* +0x0 */
    int _oRndSeed;   /* +0x4 */
    short _oAnimDelay;   /* +0x8 */
    short _oAnimCnt;   /* +0xA */
    short _oAnimLen;   /* +0xC */
    short _oVar1;   /* +0xE */
    short _oVar2;   /* +0x10 */
    short _oVar3;   /* +0x12 */
    short _oVar4;   /* +0x14 */
    short _oVar5;   /* +0x16 */
    short _oVar6;   /* +0x18 */
    short _oVar7;   /* +0x1A */
    short _oVar8;   /* +0x1C */
    char _otype;   /* +0x1E */
    char _ox;   /* +0x1F */
    char _oy;   /* +0x20 */
    char _oAnimFrame;   /* +0x21 */
    char _oBreak;   /* +0x22 */
    char _oSelFlag;   /* +0x23 */
    unsigned char _oLight;   /* +0x24 */
    unsigned char _oAnimFlag;   /* +0x25 */
    unsigned char _oDelFlag;   /* +0x26 */
    unsigned char _oSolidFlag;   /* +0x27 */
    unsigned char _oMissFlag;   /* +0x28 */
    unsigned char _oPreFlag;   /* +0x29 */
    unsigned char _oTrapFlag;   /* +0x2A */
    unsigned char _oDoorFlag;   /* +0x2B */
};

struct map_info {   /* sizeof 8 */
    short dMonster;   /* +0x0 */
    unsigned char dBits;   /* +0x2 */
    char dObject;   /* +0x3 */
    char dItem;   /* +0x4 */
    char dMissile;   /* +0x5 */
    char dFlags;   /* +0x6 */
    char dTransVal;   /* +0x7 */
};

struct found_objects {   /* sizeof 3 */
    char index;   /* +0x0 */
    char x;   /* +0x1 */
    char y;   /* +0x2 */
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

struct DEF_ARGS {   /* sizeof 16 */
    unsigned long a0;   /* +0x0 */
    unsigned long a1;   /* +0x4 */
    unsigned long a2;   /* +0x8 */
    unsigned long a3;   /* +0xC */
};

struct TextDat;

/* SPLTARGT.H */
class SpellTarget {   /* sizeof 72 */
public:
    unsigned char forcespell;   /* +0x0 */
    BOOL active;   /* +0x4 */
    short _sx;   /* +0x8 */
    short _sy;   /* +0xA */
    short _nsx;   /* +0xC */
    short _nsy;   /* +0xE */
    unsigned char _stx;   /* +0x10 */
    unsigned char _sty;   /* +0x11 */
    BOOL changed;   /* +0x14 */
    struct PlayerStruct *player;   /* +0x18 */
    int pnum;   /* +0x1C */
    int angle;   /* +0x20 */
    int spotid;   /* +0x24 */
    short lastx[8];   /* +0x28 */
    short lasty[8];   /* +0x38 */

    void Init(int plrn);
    void Remove();
    void ForceTarget(int monst, int x, int y);
    BOOL Active() { return active; }
};

/* PADS.H */
class CPad {   /* sizeof 236 */
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

    unsigned short GetCur() const
    {
        if (get_both)
            return both_Cur;
        return Cur;
    }
    unsigned short GetDown() const
    {
        if (get_both)
            return both_Down;
        return Down;
    }
};

struct GamePad {   /* sizeof 212 */
    struct PlayerStruct *player;   /* +0x0 */
    SpellTarget spell;   /* +0x4 */
    char pnum;   /* +0x4C */
    char allow_walking;   /* +0x4D */
    char style;   /* +0x4E */
    int pad_up_button;   /* +0x50 */
    void (*pad_up_action)();   /* +0x54 */
    CPad *Pad;   /* +0x58 */
    int combo_key;   /* +0x5C */
    void (*button_down[14])();   /* +0x60 */
    void (*button_combo[14])();   /* +0x98 */
    unsigned char await_combo;   /* +0xD0 */
    unsigned char combo_menu_active;   /* +0xD1 */
};

struct FRAME_HDR;
struct SPR_HDR;
struct CTextFileInfo;

/* GMAN.H */
class TextDat {   /* sizeof 112 */
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
};

struct MonstList;
struct LittleGt4;

struct RgbBlockInf {   /* sizeof 24 */
    int FromValR;   /* +0x0 */
    int ToValR;   /* +0x4 */
    int FromValG;   /* +0x8 */
    int ToValG;   /* +0xC */
    int FromValB;   /* +0x10 */
    int ToValB;   /* +0x14 */
};

/* BLOCK.H */
class CBlocks {   /* sizeof 264 */
public:
    class TextDat TextDat;   /* +0x0 */
    class TextDat *MonstTexDat;   /* +0x70 */
    class TextDat *ObjTexDat;   /* +0x74 */
    struct MonstList *MonsterList;   /* +0x78 */
    int RndX;   /* +0x7C */
    int RndY;   /* +0x80 */
    int MonstTexId;   /* +0x84 */
    long hndBlocks;   /* +0x88 */
    int ObjTexId;   /* +0x8C */
    int ItemTexId;   /* +0x90 */
    class TextDat *ItemTexDat;   /* +0x94 */
    int BgTexId;   /* +0x98 */
    class TextDat *BgTexDat;   /* +0x9C */
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
    int GetWrap(char *Str, struct RECT *TextWindow);
    int GetWrapWidth(char *Str, struct RECT *TextWindow);
};

/* ---------------------------------------------------------------- externs (SYM EXT) */
extern int sel_data;   /* @0x8011B72C */
extern int myplr;   /* @0x8011BA08 */
extern int cursmx;   /* @0x8011B750 */
extern int cursmy;   /* @0x8011B754 */
extern int _pcurr_inv[2];   /* @0x8011BBD4 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern char stextflag;   /* @0x8011BAE0 */
extern unsigned char qtextflag;   /* @0x8011B960 */
extern struct TASK *_spselflag[2];   /* @0x8011B650 */
extern unsigned char sbookflag;   /* @0x8011B6C6 */
extern unsigned char invflag;   /* @0x8011C32C */
extern unsigned char questlog;   /* @0x8011BA29 */
extern unsigned char chrflag;   /* @0x8011B6C0 */
extern BOOL optionsflag;   /* @0x8011B248 */
extern int options_pad;   /* @0x8011B250 */
extern unsigned char leveltype;   /* @0x8011C10D */
extern struct MonsterStruct monster[190];   /* @0x80105394 */
extern struct TownerStruct towner[16];   /* @0x800CFE80 */
extern struct ObjectStruct object[127];   /* @0x800D8C4C */
extern struct ItemStruct item[128];   /* @0x800D1D54 */
extern int _pcursmonst[2];   /* @0x8011B758 */
extern char _pcursobj[2];   /* @0x8011B760 */
extern char _pcursitem[];   /* @0x8011B764 */
extern char _pcursinvitem[2];   /* @0x8011B768 */
extern char _pcursplr[2];   /* @0x8011B76C */
extern char offset_x[];   /* @0x8011C2A8 */
extern char offset_y[];   /* @0x8011C2B0 */
extern int FePlayerNo;   /* @0x8011B378 */
extern int _pcurs[2];   /* @0x8011B730 */
extern char _pfind_index[2];   /* @0x8011BBDC */
extern struct found_objects _pfind_list[2][10];   /* @0x800E38A8 */
extern unsigned char _SpdBeltSelFlag[2];   /* @0x8011BBC4 */
extern BOOL initchr;   /* @0x8011B66C */
extern unsigned char Qfromoptions;   /* @0x8011B228 */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern unsigned char automapflag;   /* @0x8011C37B */
extern unsigned char automapmoved;   /* @0x8011BBDE */
extern CFont MediumFont;   /* @0x800B82D8 */
extern char _infostr[2][256];   /* @0x800CE810 */
extern char _infoclr[2];   /* @0x8011B6BC */
extern const unsigned char WHITER, WHITEG, WHITEB;   /* @0x8011ABD1 */
extern const unsigned char BLUER, BLUEG, BLUEB;      /* @0x8011ABD4 */
extern const unsigned char REDR, REDG, REDB;         /* @0x8011ABD7 */
extern const unsigned char GOLDR, GOLDG, GOLDB;      /* @0x8011ABDA */
extern const unsigned char BACKR, BACKG, BACKB;      /* @0x8011ABFA */
extern BOOL DoShowPanel;   /* @0x8011B000 */
extern int force_redraw;   /* @0x8011B790 */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */

/* ---------------------------------------------------------------- prototypes (SYM) */
extern SpellTarget *GetSpellTarget(int pnum);
extern unsigned char TryIconCurs();
extern void QuestlogUp();
extern void QuestlogDown();
extern void ToggleOptions();
extern void PlaySFX(int psfx);
extern void NewCursor(int i);
extern int GetDirection(int x1, int y1, int x2, int y2);
extern void NetSendCmdLoc(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y);
extern void NetSendCmdLocParam1(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1);
extern unsigned char CanTalkToMonst(int m);
extern void StartStand(int pnum, int dir);
extern "C" TASK *TSK_Exist(TASK *T, unsigned long Id, unsigned long Mask);
extern "C" TASK *TSK_AddTask(unsigned long Id, void (*Main)(TASK *), int StackSize, int DataSize);
extern "C" void TSK_Sleep(int Frames);
extern void SetItemMinStats(const PlayerStruct *p, ItemStruct *x);
extern void CheckNewPath(int pnum);
extern GamePad *GetGamePad(int pnum);
extern CBlocks *BL_GetCurrentBlocks();
extern CPad *PAD_GetPad(int PadNum, unsigned char both);
extern BOOL TargetActive(int pnum);
extern void CheckPlrSpell();
extern unsigned char UseInvItem(int pnum, int cii);
extern void PostGamePad(int val, int var1, int var2, int var3);
extern void DrawChrTSK(TASK *T);
extern BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);
extern void GLUE_SuspendGame();
extern void DrawSpellBookTSK(TASK *T);
extern void StartQuestlog();
extern void ToggleSpell(int pnum);
extern void DoAutoMap();
extern void CalcPlrScrolls(int p);
extern void GetItemStr(int i);
extern void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross, BOOL iso, unsigned char SinStep);
extern "C" char *strcpy(char *dst, const char *src);
extern "C" int abs(int i);
extern BOOL PA_SetPauseOk(BOOL NewPause);
extern BOOL GLUE_Finished();
extern void ClrCursor(int num);
extern void ClearPanel();
extern void DrawAndBlit();
extern void GLUE_ResumeGame();
extern unsigned char PosOkPlayer(int pnum, int x, int y);
extern BOOL IsTrigger(int x, int y);
extern void WorldToOffset(int pnum, int WorldX, int WorldY);

/* this TU */
void RemoveTargetCursor(int pnum);
unsigned char CheckArea(int xx, int yy, int range, unsigned char allflag, int pnum);
static void DrawObjTask(TASK *T);
void pad_func_Use_Item(int pnum);
void select_belt_item(int pnum);
BOOL SelectorActive();

/* ---------------------------------------------------------------- data (TU-owned, .sdata / .sbss) */
struct CPlayer;
CPlayer *gplayer = 0;                              /* @0x8011B110 */
static char mana_order[4] = { 6, 7, 18, 19 };      /* @0x8011B114 */
static char health_order[5] = { 3, 2, 21, 18, 19 };   /* @0x8011B118 */
unsigned char select_flag = 0;                     /* @0x8011B11D */
char QSpell[2] = { 0, 0 };                         /* @0x8011B120 */
char _spltotype[2] = { 0, 0 };                     /* @0x8011B124 */
static Dialog SelectBack;                          /* @0x8011D040 */
static RECT SelectRect;                            /* @0x8011C6E0 */
static char item_select;                           /* @0x8011C6E8 */

/* ---------------------------------------------------------------- functions */
/* @0x800A09DC */
void SetQSpell(int pnum, int Spell, int type)
{
    QSpell[pnum] = Spell;
    _spltotype[pnum] = type;
}

/* @0x800A09FC */
void release_spell(int pnum)
{
    SpellTarget *spl = GetSpellTarget(sel_data);

    myplr = pnum;
    cursmx = spl->_stx;
    cursmy = spl->_sty;
    TryIconCurs();
    RemoveTargetCursor(pnum);
}

/* @0x800A0A60 */
void select_belt_item(int pnum)
{
}

/* @0x800A0A68 */
unsigned char any_belt_items()
{
    int i;

    for (i = 0; i < 8; i++) {
        if (plr[myplr].SpdList[i]._itype != -1)
            return 1;
    }
    return 0;
}

/* @0x800A0AD0 */
void get_last_inv()
{
    int i;

    for (i = _pcurr_inv[sel_data] - 1; i >= 0; i--) {
        if (plr[myplr].SpdList[i]._itype != -1) {
            _pcurr_inv[sel_data] = i;
            return;
        }
    }
    if (any_belt_items()) {
        _pcurr_inv[sel_data] = 8;
        get_last_inv();
    } else
        _pcurr_inv[sel_data] = -1;
}

/* @0x800A0BFC */
void get_next_inv()
{
    int i;

    for (i = _pcurr_inv[sel_data] + 1; i < 8; i++) {
        if (plr[myplr].SpdList[i]._itype != -1) {
            _pcurr_inv[sel_data] = i;
            return;
        }
    }
    if (any_belt_items()) {
        _pcurr_inv[sel_data] = -1;
        get_next_inv();
    } else
        _pcurr_inv[sel_data] = -1;
}

/* @0x800A0D30 */
void pad_func_up(int pnum)
{
    if (questlog)
        QuestlogUp();
}

/* @0x800A0D5C */
void pad_func_down(int pnum)
{
    if (questlog)
        QuestlogDown();
}

/* @0x800A0D88 */
void pad_func_left(int pnum)
{
}

/* @0x800A0D90 */
void pad_func_right(int pnum)
{
}

/* @0x800A0D98 */
void pad_func_select(int pnum)
{
    if (!(stextflag | qtextflag | (int)_spselflag[0] | (int)_spselflag[1] | sbookflag | invflag | questlog | chrflag)) {
        ToggleOptions();
        if (optionsflag) {
            PlaySFX(0x33);
            options_pad = pnum;
        } else
            options_pad = -1;
    }
}

/* @0x800A0E5C */
static void SetFindMonsterXY(PlayerStruct *p, int i)
{
    if (leveltype) {
        MonsterStruct *m = &monster[i];
        p->_pVar6 = m->_mfutx;
        p->_pVar7 = m->_mfuty;
    } else {
        TownerStruct *t = &towner[i];
        p->_pVar6 = t->_tx;
        p->_pVar7 = t->_ty;
    }
}

/* @0x800A0EEC */
void pad_func_Attack(int pnum)
{
    PlayerStruct *player = &plr[pnum];
    int x = player->_px;
    int y = player->_py;

    if (GetSpellTarget(pnum)->Active()) {
        NewCursor(1);
        RemoveTargetCursor(pnum);
        return;
    }
    if (player->_pmode > PM_WALK3) {
        if (player->_pmode != PM_ATTACK && player->_pmode != PM_RATTACK)
            return;
        if (player->_pAnimFrame < player->_pAFNum)
            return;
    }
    if (!(questlog | stextflag | qtextflag | chrflag | invflag | optionsflag | (int)_spselflag[pnum])) {
        if (leveltype && _pcursmonst[sel_data] == -1 && (_pcursobj[sel_data] == -1 || object[_pcursobj[sel_data]]._oBreak != 1)) {
            int fx, fy;
            fx = player->_pVar6 = x + offset_x[player->_pdir];
            fy = player->_pVar7 = y + offset_y[player->_pdir];
            player->_pdir = GetDirection(x, y, fx, fy);
            NetSendCmdLoc(1, 0x37, fx, fy);
        } else if (_pcursmonst[sel_data] != -1) {
            /* the stand/send tail is written in both the town and the talk arms: CSE then carries
             * pnum ^ 1 and its scaled index (s3/fp) along each path and jump2 cross-jumps the two
             * identical tails back into one, as in retail */
            int fx, fy;
            PlayerStruct *plr2 = &plr[pnum ^ 1];
            SetFindMonsterXY(player, _pcursmonst[sel_data]);
            fx = player->_pVar6;
            fy = player->_pVar7;
            player->_pdir = GetDirection(x, y, fx, fy);
            player->walkpath[0] = -1;
            if (!leveltype) {
                StartStand(pnum, player->_pdir);
                if (plr[pnum ^ 1]._pmode == PM_WALK)
                    StartStand(pnum ^ 1, GetDirection(plr2->_px, plr2->_py, fx, fy));
                NetSendCmdLocParam1(1, 0x1D, fx, fy, _pcursmonst[sel_data]);
            } else if (CanTalkToMonst(_pcursmonst[sel_data])) {
                SetFindMonsterXY(player, _pcursmonst[sel_data]);
                if ((abs(player->_px - fx) < 2 && abs(player->_py - fy) < 2) != 0) {
                    StartStand(pnum, player->_pdir);
                    if (plr[pnum ^ 1]._pmode == PM_WALK)
                        StartStand(pnum ^ 1, GetDirection(plr2->_px, plr2->_py, fx, fy));
                    NetSendCmdLocParam1(1, 0x1D, fx, fy, _pcursmonst[sel_data]);
                }
            } else
                NetSendCmdLoc(1, 0x37, fx, fy);
        } else {
            int oco = _pcursobj[sel_data];
            if (leveltype && oco != -1) {
                {
                    int fx = object[oco]._ox;
                    int fy = object[oco]._oy;
                    player->_pVar6 = fx;
                    player->_pVar7 = fy;
                    player->_pdir = GetDirection(x, y, fx, fy);
                    StartStand(pnum, player->_pdir);
                    NetSendCmdLoc(1, 0x37, fx, fy);
                }
            }
        }
    }
}

/* @0x800A13A0 */
void pad_func_Action(int pnum)
{
    PlayerStruct *player = &plr[pnum];
    int x = player->_px;
    int y = player->_py;
    DEF_ARGS *args;

    if (TSK_Exist((TASK *)DrawObjTask, 0x666, -1))
        return;
    if (!(questlog | stextflag | qtextflag | chrflag | invflag | optionsflag | (int)_spselflag[pnum] | sbookflag)) {
        player->walkpath[0] = -1;
        if (_pcursobj[sel_data] != -1) {
            if (_pcursitem[sel_data] == -1 || (object[_pcursobj[sel_data]]._oDoorFlag && _pcursitem[sel_data] >= 0)) {
                int ox = object[_pcursobj[sel_data]]._ox;
                int oy = object[_pcursobj[sel_data]]._oy;
                if (!GetSpellTarget(pnum)->Active() || (abs(ox - x) < 2 && abs(oy - y) < 2)) {
                    StartStand(pnum, GetDirection(player->_px, player->_py, ox, oy));
                    NetSendCmdLocParam1(1, _pcurs[myplr] == 5 ? 0x11 : 0x10, ox, oy, _pcursobj[sel_data]);
                    CheckNewPath(pnum);
                }
            }
        }
        /* indexed by sel_data (the per-player pcursitem macro form): after the sel_data == pnum test CSE
         * substitutes pnum and keeps &_pcursitem in s1, exactly as retail */
        if (sel_data == pnum && myplr == pnum && _pcursitem[sel_data] != -1) {
            if (_pfind_index[sel_data] == 1) {
                _pcursitem[sel_data] = _pfind_list[sel_data][0].index;
                x = _pfind_list[sel_data][0].x;
                y = _pfind_list[sel_data][0].y;
                SetItemMinStats(player, &item[_pcursitem[sel_data]]);
                NetSendCmdLocParam1(1, 0x2A, x, y, _pcursitem[sel_data]);
            } else {
                args = (DEF_ARGS *)TSK_AddTask(0x666, DrawObjTask, 0x1000, sizeof(DEF_ARGS))->Data;
                args->a0 = pnum;
            }
        }
    }
}

/* @0x800A1758 */
void InitTargetCursor(int pnum)
{
    GetGamePad(pnum)->spell.Init(pnum);
}

/* @0x800A178C */
void RemoveTargetCursor(int pnum)
{
    if (pnum == -1) {
        RemoveTargetCursor(0);
        RemoveTargetCursor(1);
    } else
        GetGamePad(pnum)->spell.Remove();
}

/* @0x800A17D4 */
BOOL TargetingSpell(int sp)
{
    if (sp == 7 || sp == 13 || sp == 23 || sp == 21 || sp == 33 || sp == 8 || sp == 6)
        return 1;
    return 0;
}

/* @0x800A181C */
void pad_func_Cast_Spell(int pnum)
{
    PlayerStruct *player = &plr[pnum];
    int sp = player->_pRSpell;
    CBlocks *gblocks = BL_GetCurrentBlocks();
    int omp;
    unsigned char DoTarget = 0;

    omp = myplr;
    PAD_GetPad(pnum, 0);
    if (!gblocks)
        return;
    if (player->_pmode == PM_SPELL && player->_pVar8 <= player->_pSFNum)
        return;
    myplr = pnum;
    if (!(questlog | stextflag | qtextflag | chrflag | invflag | optionsflag | (int)_spselflag[pnum] | sbookflag)) {
        if (FePlayerNo == 0) {
            if (sp == 0x22 || sp == 0x20) {
                PlaySFX(0x3D3);
                return;
            }
        } else {
            if (sp == 0x17 || sp == 0xA) {
                PlaySFX(0x3D3);
                return;
            }
            if (sp == 0x20 && plr[pnum ^ 1].plractive)
                return;
            if (sp == 0x22 && !plr[pnum ^ 1].plractive)
                return;
        }
        if (TargetActive(pnum)) {
            release_spell(pnum);
            return;
        }
        if (TargetingSpell(sp))
            DoTarget = 1;
        if (DoTarget) {
            if (leveltype == 0) {
                CheckPlrSpell();
                return;
            }
            if (!TargetActive(pnum)) {
                player->_pTSpell = player->_pRSpell;
                player->_pTSplType = player->_pRSplType;
                player->_pSpell = player->_pRSpell;
                player->_pSplType = player->_pRSplType;
                InitTargetCursor(pnum);
            } else {
                release_spell(pnum);
                NewCursor(1);
            }
        } else {
            SpellTarget *spl;
            if (_pcursmonst[sel_data] != -1)
                StartStand(pnum, GetDirection(player->_px, player->_py, monster[_pcursmonst[sel_data]]._mx, monster[_pcursmonst[sel_data]]._my));
            spl = GetSpellTarget(pnum);
            if (sp == 0x22 || sp == 0x20) {
                spl->active = 1;
                spl->_sx = plr[pnum ^ 1]._px;
                spl->_sy = plr[pnum ^ 1]._py;
                _pcursplr[sel_data] = pnum ^ 1;
            } else if (spl->forcespell)
                spl->active = 1;
            CheckPlrSpell();
            if (player->destAction == -1)
                _pcursplr[sel_data] = -1;
            RemoveTargetCursor(pnum);
        }
    }
    myplr = omp;
}

/* @0x800A1C44 */
void pad_func_Use_Item(int pnum)
{
    SpellTarget *spl = GetSpellTarget(pnum);

    if (!(chrflag | stextflag | qtextflag | sbookflag | questlog | optionsflag | spl->Active())) {
        PlayerStruct *player = &plr[pnum];
        if (_pcurr_inv[sel_data] != -1) {
            NewCursor(1);
            if (player->SpdList[_pcurr_inv[sel_data]]._iMiscId != 0x15 || !GetSpellTarget(pnum)->Active()) {
                if (UseInvItem(pnum, _pcurr_inv[sel_data] + 47)) {
                    get_next_inv();
                    _pcursinvitem[sel_data] = -1;
                    if (_SpdBeltSelFlag[pnum]) {
                        _SpdBeltSelFlag[pnum] = 0;
                        PostGamePad(pnum + 6, 0, 0, 0);
                    }
                } else
                    PlaySFX(0x3D3);
                if (!any_belt_items()) {
                    _pcurr_inv[pnum] = -1;
                    _SpdBeltSelFlag[pnum] = 0;
                    PostGamePad(pnum + 6, 0, 0, 0);
                }
            } else
                PlaySFX(0x3D3);
        }
    }
}

/* @0x800A1E78 */
void pad_func_BeltList(int pnum)
{
    if (!any_belt_items() || plr[pnum]._pmode == PM_SPELL)
        PlaySFX(0x3D3);
    else if (_SpdBeltSelFlag[pnum]) {
        PlaySFX(0x33);
        _SpdBeltSelFlag[pnum] = 0;
        PostGamePad(pnum + 6, 0, 0, 0);
    } else if (!(chrflag | stextflag | qtextflag | (int)_spselflag[pnum] | sbookflag | questlog | optionsflag)) {
        PlaySFX(0x33);
        _SpdBeltSelFlag[pnum] = 1;
        PostGamePad(pnum + 3, 0, 0, 0);
        PostGamePad(10, pnum, (int)pad_func_Use_Item, (int)select_belt_item);
    }
}

/* @0x800A1FE0 */
void pad_func_Chr(int pnum)
{
    if (!(invflag | stextflag | qtextflag | (int)_spselflag[0] | (int)_spselflag[1] | sbookflag | questlog | optionsflag | _SpdBeltSelFlag[pnum])) {
        chrflag ^= 1;
        if (chrflag) {
            if (pnum != -1)
                PlaySFX(0x33);
            RemoveTargetCursor(pnum);
            initchr = 1;
            options_pad = pnum;
            PostGamePad(2, 0, 0, 0);
            TSK_AddTask(0, DrawChrTSK, 0x1000, 0);
        } else {
            PlaySFX(0x33);
            PostGamePad(5, 0, 0, 0);
        }
    }
}

/* @0x800A2114 */
void pad_func_Inv(int pnum)
{
    if (!(chrflag | stextflag | qtextflag | (int)_spselflag[0] | (int)_spselflag[1] | sbookflag | questlog | optionsflag | SelectorActive() | _SpdBeltSelFlag[pnum])) {
        if (invflag) {
            PlaySFX(0x33);
            PostGamePad(5, 0, 0, 0);
            options_pad = -1;
        } else {
            invflag = 1;
            PlaySFX(0x33);
            RemoveTargetCursor(pnum);
            options_pad = pnum;
            PostGamePad(2, 0, 0, 0);
            GLUE_SetShowPanelFlag(0);
            GLUE_SuspendGame();
        }
    }
}

/* @0x800A2244 */
void pad_func_SplBook(int pnum)
{
    if (!(chrflag | invflag | stextflag | qtextflag | (int)_spselflag[0] | (int)_spselflag[1] | questlog | optionsflag | SelectorActive() | _SpdBeltSelFlag[pnum])) {
        sbookflag ^= 1;
        if (sbookflag) {
            if (!Qfromoptions)
                PlaySFX(0x33);
            options_pad = pnum;
            PostGamePad(2, 0, 0, 0);
            TSK_AddTask(0, DrawSpellBookTSK, 0x800, 0);
        } else {
            PostGamePad(5, 0, 0, 0);
            if (!Qfromoptions)
                options_pad = -1;
        }
    }
}

/* @0x800A2390 */
void pad_func_QLog(int pnum)
{
    if (!(invflag | chrflag | questlog | stextflag | qtextflag | (int)_spselflag[0] | (int)_spselflag[1] | sbookflag | optionsflag | SelectorActive() | _SpdBeltSelFlag[pnum])) {
        options_pad = pnum;
        StartQuestlog();
        if (questlog && !Qfromoptions)
            PlaySFX(0x33);
    }
}

/* @0x800A2484 */
void pad_func_SpellBook(int pnum)
{
    if (!(stextflag | qtextflag | PauseMode | chrflag | invflag | questlog | optionsflag | sbookflag | GetSpellTarget(pnum)->Active() | _SpdBeltSelFlag[pnum] | SelectorActive())) {
        ToggleSpell(pnum);
        PlaySFX(0x33);
        RemoveTargetCursor(pnum);
    }
}

/* @0x800A255C */
void pad_func_AutoMap(int pnum)
{
    if (!(stextflag | questlog | qtextflag | PauseMode | sbookflag | invflag | chrflag | optionsflag)) {
        if (automapflag) {
            if (automapmoved)
                return;
        } else
            automapmoved = 0;
        DoAutoMap();
    }
}

/* @0x800A2618  bytes: 1 insn differs, inside gcc's own 64-bit lshrdi3 template: the template's `b`
 * is assembled by ASPSX as `bgez $0` (retail) and by GNU as as `beq $0,$0`.  SYM exact. */
void pad_func_Quick_Spell(int pnum)
{
    PlayerStruct *player = &plr[pnum];
    int sp = player->_pRSpell;
    char spt = player->_pRSplType;
    int qps = QSpell[pnum];
    int qst = _spltotype[pnum];

    if (GetSpellTarget(pnum)->Active()) {
        PlaySFX(0x3D3);
        return;
    }
    if (_spltotype[pnum] == 3) {
        if (((player->_pISpells >> (qps - 1)) & 1) == 0) {
            qps = -1;
            qst = 4;
        }
    }
    player->_pRSpell = qps;
    player->_pRSplType = qst;
    SetQSpell(pnum, sp, spt);
    PlaySFX(0x32);
    CalcPlrScrolls(pnum);
}

/* @0x800A278C */
static void check_inv(int pnum, char *ilist, int entries)
{
    int i;
    int ii;
    PlayerStruct *player = &plr[pnum];

    if (stextflag | qtextflag | PauseMode | chrflag | invflag | questlog | optionsflag | sbookflag | _SpdBeltSelFlag[pnum] | GetSpellTarget(pnum)->Active())
        return;
    NewCursor(1);
    {   /* retail's record-less level: `e` is eliminated (the loop runs on the ilist-pointer giv) */
        int e;
        for (e = 0; e < entries; e++) {
            for (i = 0; i < 40; i++) {
                if (player->InvGrid[i] > 0) {
                    ii = player->InvGrid[i] - 1;
                    if (player->InvList[ii]._itype != -1 && player->InvList[ii]._iMiscId == ilist[e]
                        && (player->InvList[ii]._iMiscId != 0x15 || player->InvList[ii]._iSpell == 2)) {
                        if (UseInvItem(pnum, ii + 7))
                            return;
                    }
                }
            }
            for (i = 0; i < 8; i++) {
                if (player->SpdList[i]._itype != -1 && player->SpdList[i]._iMiscId == ilist[e]
                    && (player->SpdList[i]._iMiscId != 0x15 || player->SpdList[i]._iSpell == 2)) {
                    if (UseInvItem(pnum, i + 47)) {
                        if (_pcurr_inv[sel_data] == i)
                            get_next_inv();
                        return;
                    }
                }
            }
        }
    }
}

/* @0x800A2A0C */
void pad_func_Quick_Use_Health(int pnum)
{
    check_inv(pnum, health_order, 5);
}

/* @0x800A2A34 */
void pad_func_Quick_Use_Mana(int pnum)
{
    check_inv(pnum, mana_order, 4);
}

/* @0x800A2A5C */
static BOOL sort_gold(int pnum)
{
    found_objects *fo = &_pfind_list[sel_data][0];
    BOOL ngold = 0;

    for (int i = 0; i < _pfind_index[sel_data]; i++) {
        if (item[fo->index]._itype == 11) {
            ngold = 1;
            NetSendCmdLocParam1(1, 0x2A, fo->x, fo->y, fo->index);
        }
        CheckNewPath(pnum);
        fo++;
    }
    return ngold;
}

/* @0x800A2B64  Centring halves are signed `/ 2` like retail's ny line: combine drops their sign terms (nw = 250 -> srl;
 * spinner centre stays in the item loop at loop.c time) and the orphaned sign temps give retail's frame-280 slots. */
static void DrawObjSelector(int pnum, PlayerStruct *player)
{
    char str[128];
    CPad *Pad = PAD_GetPad(pnum, 0);
    int cp = Pad->GetDown();
    Pad->GetCur();
    int list_size;
    int maxlen;
    found_objects *fo = &_pfind_list[sel_data][0];
    int R, G, B;
    int i;
    int nwrap;
    int add_wrap;
    CheckArea(player->_px, player->_py, 2, 1, pnum);
    maxlen = 250;
    if (!_pfind_index[sel_data]) {
        select_flag = 0;
        return;
    }
    list_size = _pfind_index[sel_data];
    if (cp & 2) {
        PlaySFX(0x32);
        item_select = (char)(item_select + 1) % list_size;
    }
    if (cp & 1) {
        PlaySFX(0x32);
        item_select--;
        if (item_select < 0)
            item_select += list_size;
    }
    _pcursitem[sel_data] = _pfind_list[sel_data][item_select].index;
    if (cp & 0x100) {
        PlaySFX(0x33);
        select_flag = 0;
        return;
    }
    if (cp & 0x40) {
        int fx, fy;
        PlaySFX(0x33);
        fx = _pfind_list[sel_data][item_select].x;
        fy = _pfind_list[sel_data][item_select].y;
        StartStand(pnum, player->_pdir);
        SetItemMinStats(player, &item[_pcursitem[sel_data]]);
        NetSendCmdLocParam1(1, 0x2A, fx, fy, _pcursitem[sel_data]);
        CheckNewPath(pnum);
        list_size--;
        if (item_select >= list_size)
            item_select = list_size - 1;
    }
    if (!list_size) {
        _pfind_index[sel_data] = 0;
        select_flag = 0;
        return;
    }
    SelectBack.SetBack(0x94);
    SelectBack.SetBorder(0x12);
    SelectBack.SetRGB(BACKR, BACKG, BACKB);
    SelectRect.x = 0;
    SelectRect.y = (176 - (list_size * 12 + 12)) / 2 + 32;
    SelectRect.w = maxlen;
    SelectRect.h = list_size * 12 + 12;
    add_wrap = 0;
    for (i = 0; i < list_size; i++) {
        GetItemStr(_pfind_list[sel_data][i].index);
        nwrap = MediumFont.GetWrap(_infostr[sel_data], &SelectRect);
        if (nwrap)
            add_wrap += nwrap * 12;
        else
            add_wrap += 12;
    }
    if (item_select >= list_size)
        item_select = list_size - 1;
    else if (item_select < 0)
        item_select = 0;
    int nx, ny, nw, nh, ypos;
    nh = add_wrap + 12;
    nw = maxlen;
    nx = (256 - nw) / 2 + 32;
    ny = (176 - nh) / 2 + 32;
    SelectRect.x = nx;
    SelectRect.y = ny - 22;
    SelectRect.w = nw;
    SelectRect.h = 16;
    SelectBack.Back(nx, ny - 22, nw, 16);
    MediumFont.Print(0, 12, player->_pName, JustCentre, &SelectRect, WHITER, WHITEG, WHITEG);
    SelectRect.x = nx;
    SelectRect.y = ny;
    SelectRect.w = nw;
    SelectRect.h = nh;
    SelectBack.Back(nx, ny, nw, nh);
    ypos = 16;
    for (i = 0; i < _pfind_index[sel_data]; i++) {
        _infoclr[sel_data] = 0;
        GetItemStr(fo->index);
        strcpy(str, _infostr[sel_data]);
        if (i == item_select) {
            int len = MediumFont.GetStrWidth(str) + 16;
            if (MediumFont.GetWrap(_infostr[sel_data], &SelectRect))
                len = MediumFont.GetWrapWidth(_infostr[sel_data], &SelectRect);
            DrawSpinner(nx + nw / 2 - len / 2 - 11, ypos + ny, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, 0xFFFF, 1, 0, 8);
            DrawSpinner(nx + nw / 2 + len / 2 + 3, ypos + ny, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, 0xFFFF, 1, 0, 8);
        }
        switch (_infoclr[sel_data]) {
        case 0:
            R = WHITER;
            G = WHITEG;
            B = WHITEB;
            break;
        case 2:
            R = REDR;
            G = REDG;
            B = REDB;
            break;
        case 1:
            R = BLUER;
            G = BLUEG;
            B = BLUEB;
            break;
        default:
            R = GOLDR;
            G = GOLDG;
            B = GOLDB;
            break;
        }
        MediumFont.Print(0, ypos, str, JustCentre, &SelectRect, R, G, B);
        fo++;
        ypos += MediumFont.GetWrap(_infostr[sel_data], &SelectRect) * 12;
        nwrap = MediumFont.GetWrap(_infostr[sel_data], &SelectRect);
    }
}

/* @0x800A336C */
BOOL SelectorActive()
{
    return select_flag != 0;
}

/* @0x800A3378 */
static void DrawObjTask(TASK *T)
{
    DEF_ARGS *args = (DEF_ARGS *)T->Data;
    int pnum = args->a0;
    BOOL op;
    BOOL oamap = automapflag;
    PlayerStruct *player = &plr[pnum];
    int oseldata = sel_data;
    int omp = myplr;
    BOOL opan;
    int opause = PauseMode;

    sel_data = pnum;
    myplr = pnum;
    CheckArea(player->_px, player->_py, 2, 1, pnum);
    if (sort_gold(pnum)) {
        sel_data = oseldata;
        myplr = omp;
        return;
    }
    GLUE_SuspendGame();
    select_flag = 1;
    item_select = 0;
    op = PA_SetPauseOk(0);
    if (_pfind_index[pnum] == 1) {
        int x, y;
        _pcursitem[sel_data] = _pfind_list[pnum][0].index;
        x = _pfind_list[pnum][0].x;
        y = _pfind_list[pnum][0].y;
        SetItemMinStats(player, &item[_pcursitem[sel_data]]);
        NetSendCmdLocParam1(1, 0x2A, x, y, _pcursitem[sel_data]);
        select_flag = 0;
    }
    opan = DoShowPanel;
    sel_data = oseldata;
    myplr = omp;
    while (select_flag && !GLUE_Finished()) {
        automapflag = 0;
        GLUE_SetShowPanelFlag(0);
        GLUE_SuspendGame();
        omp = myplr;
        oseldata = sel_data;
        PauseMode = 1;
        TSK_Sleep(1);
        PostGamePad(2, 0, 0, 0);
        sel_data = pnum;
        myplr = pnum;
        DrawObjSelector(pnum, player);
        ClrCursor(0);
        ClrCursor(1);
        ClearPanel();
        force_redraw = 255;
        sel_data = oseldata;
        myplr = omp;
        DrawAndBlit();
    }
    GLUE_SetShowPanelFlag(opan);
    PostGamePad(5, 0, 0, 0);
    PauseMode = opause;
    options_pad = -1;
    sel_data = -1;
    PA_SetPauseOk(op);
    GLUE_ResumeGame();
    automapflag = oamap;
}

/* @0x800A36B4 */
void add_area_find_object(int index, int x, int y)
{
    if (_pfind_index[sel_data] < 10) {
        found_objects *fo = &_pfind_list[sel_data][_pfind_index[sel_data]++];
        fo->x = x;
        fo->y = y;
        fo->index = index;
    }
}

/* @0x800A3724 */
unsigned char CheckRangeObject(int x, int y, int distance)
{
    char co;
    map_info *dm = &dung_map[x][y];
    int nitem = dm->dItem;
    int nmonster = dm->dMonster;
    int nobject = dm->dObject;
    BOOL ok = 0;

    if ((unsigned)x >= 96 || (unsigned)y >= 96)
        return 0;
    if (leveltype) {
        int vis_flag;
        if (myplr != -1)
            vis_flag = 1 << myplr;
        else
            vis_flag = 3;
        if (myplr != -1 && !(dm->dFlags & vis_flag))
            vis_flag = 0;
        if (vis_flag && _pcursmonst[sel_data] == -1 && nmonster > 0 && (monster[nmonster - 1]._mhitpoints >> 6) > 0
            && monster[nmonster - 1].MType->mtype != 0x6D && !(monster[nmonster - 1]._mFlags & 1) && (dm->dFlags & 4)) {
            ok = 1;
            nmonster--;
            /* two stores (jump2 cross-jumps them into one): the extra reference is what gives the
             * &_pcursmonst pseudo priority over nobject/ok (s2/s3/s4 as retail) */
            if (!CanTalkToMonst(nmonster))
                _pcursmonst[sel_data] = nmonster;
            else if (myplr >= 0 && distance)
                _pcursmonst[sel_data] = nmonster;
        }
    } else {
        if (_pcursmonst[sel_data] == -1 && nmonster) {
            ok = 1;
            if (nmonster > 0)
                _pcursmonst[sel_data] = nmonster - 1;
            else
                _pcursmonst[sel_data] = -(nmonster + 1);
        }
    }
    if (myplr != -1) {
        if (_pcursobj[sel_data] == -1 && nobject && distance) {
            co = nobject > 0 ? nobject - 1 : -(nobject + 1);
            if (object[co]._oSelFlag > 0) {
                ok = 1;
                _pcursobj[sel_data] = co;
            }
        }
        if (nitem > 0 && distance) {
            nitem--;
            if (item[nitem]._iSelFlag > 0) {
                ok = 1;
                add_area_find_object(nitem, x, y);
                if (_pcursitem[sel_data] == -1)
                    _pcursitem[sel_data] = nitem;
            }
        }
    }
    return ok;
}

/* @0x800A3A9C  the arms store and fall to the single `return 1` (no per-arm return: an in-arm `v0 = 1`
 * would be hoisted by sched1 and push the store blocks off v0/v1). */
unsigned char CheckArea(int xx, int yy, int range, unsigned char allflag, int pnum)
{
    PlayerStruct *player = &plr[pnum];
    SpellTarget *spl = GetSpellTarget(pnum);
    BOOL is_myplr = myplr != -1;
    int i;
    int dir;
    int cm = -1;
    int ci;
    int x;
    int y;
    char *px = offset_x;   /* constant-equivalent pointers: no hard reg, no SYM record; reload */
    char *py = offset_y;   /* rematerialises lui/addiu into t0 at each use, as retail does */

    if (pnum != -1 && !allflag && leveltype && is_myplr) {
        dir = player->_pdir;
        int dx = px[dir];
        int dy = py[dir];
        x = player->_px + dx;
        y = player->_py + dy;
        for (i = 0; i < 5; i++) {
            if (_pcursmonst[sel_data] != -1)
                break;
            if (CheckRangeObject(x, y, 0) && cm == -1 && _pcursmonst[sel_data] != -1)
                cm = _pcursmonst[sel_data];
            x += dx;
            y += dy;
        }
    }
    if (is_myplr) {
        if (_pcursmonst[sel_data] != -1) {
            MonsterStruct *Monst = &monster[_pcursmonst[sel_data]];
            if (player->_pwtype == 0 && (abs(xx - Monst->_mx) >= 2 || abs(yy - Monst->_my) >= 2)) {
                _pcursmonst[sel_data] = -1;
                cm = -1;
            }
        }
        _pcursobj[sel_data] = _pcursitem[sel_data] = -1;
        _pfind_index[sel_data] = 0;
        dir = player->_pdir;
        ci = dung_map[xx][yy].dItem;
        if (ci) {
            ci--;
            if (item[ci]._iSelFlag > 0) {
                _pcursitem[sel_data] = ci;
                add_area_find_object(ci, xx, yy);
            }
        }
    } else
        dir = 0;
    x = xx;
    y = yy;
    if (!(dir & 1))
        dir++;
    for (i = 1; i < 10; i++) {
        for (int j = 0; j < 2; j++) {
            for (int k = 0; k < i; k++) {
                x += px[dir];
                y += py[dir];
                if (CheckRangeObject(x, y, abs(xx - x) < 2 && abs(yy - y) < 2)) {
                    if (_pcursmonst[sel_data] != -1) {
                        int nm = _pcursmonst[sel_data];
                        if (!is_myplr)
                            return 1;
                        if (cm == -1)
                            cm = nm;
                    }
                }
            }
            dir += 2;
            dir &= 7;
        }
    }
    if (cm != -1) {
        if (leveltype) {
            MonsterStruct *Monst = &monster[cm];
            spl->ForceTarget(cm, Monst->_mx, Monst->_my);
            if (player->_pwtype == 0 && (abs(xx - Monst->_mx) >= 2 || abs(yy - Monst->_my) >= 2))
                _pcursmonst[sel_data] = -1;
            else
                _pcursmonst[sel_data] = cm;
        } else {
            TownerStruct *Twn = &towner[cm];
            if (abs(xx - Twn->_tx) >= 2 || abs(yy - Twn->_ty) >= 2)
                _pcursmonst[sel_data] = -1;
            else
                _pcursmonst[sel_data] = cm;
        }
    } else
        spl->ForceTarget(-1, 0, 0);
    return 1;
}

/* @0x800A4080  px/py: constant-equivalent table pointers (no SYM record); px[i] is a reg+reg address, so
 * loop.c strength-reduces both givs into walking pointers (end pointer spilled at 16(sp)) as retail does. */
void PlacePlayer(int pnum, int x, int y, unsigned char do_current)
{
    char *px = offset_x;
    char *py = offset_y;
    if (plr[pnum]._pmode == PM_DEATH)
        return;
    if (!PosOkPlayer(pnum, x, y) || IsTrigger(x, y)) {
        BOOL done = 0;
        int nx, ny;
        for (int i = 0; i < 8 && !done; i++) {
            nx = x + px[i];
            ny = y + py[i];
            if (PosOkPlayer(pnum, nx, ny) && !IsTrigger(nx, ny)) {
                done = 1;
                x = nx;
                y = ny;
            }
        }
    }
    WorldToOffset(pnum, (x << 3) | 4, (y << 3) | 4);
}
