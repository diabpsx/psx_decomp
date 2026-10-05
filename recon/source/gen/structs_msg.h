struct CMonster;

struct MonsterData;

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

struct MissileStruct {   /* sizeof 76 */
    long _mixvel;   /* +0x0 */
    long _miyvel;   /* +0x4 */
    long _mitxoff;   /* +0x8 */
    long _mityoff;   /* +0xC */
    int _midam;   /* +0x10 */
    int _mirnd;   /* +0x14 */
    unsigned short _mirange;   /* +0x18 */
    unsigned short _micaster;   /* +0x1A */
    short _midist;   /* +0x1C */
    short _miVar1;   /* +0x1E */
    short _miVar2;   /* +0x20 */
    short _miVar3;   /* +0x22 */
    short _miVar4;   /* +0x24 */
    short _miVar5;   /* +0x26 */
    short _miVar6;   /* +0x28 */
    short _miVar7;   /* +0x2A */
    short _miVar8;   /* +0x2C */
    short _misource;   /* +0x2E */
    char _mitype;   /* +0x30 */
    char _mix;   /* +0x31 */
    char _miy;   /* +0x32 */
    char _mixoff;   /* +0x33 */
    char _miyoff;   /* +0x34 */
    char _misx;   /* +0x35 */
    char _misy;   /* +0x36 */
    unsigned char _miAnimType;   /* +0x37 */
    unsigned char _miDelFlag;   /* +0x38 */
    unsigned char _miAnimFlags;   /* +0x39 */
    unsigned char _miDrawFlag;   /* +0x3A */
    unsigned char _miLightFlag;   /* +0x3B */
    unsigned char _miPreFlag;   /* +0x3C */
    unsigned char _miHitFlag;   /* +0x3D */
    char _mlid;   /* +0x3E */
    char _mimfnum;   /* +0x3F */
    char _mispllvl;   /* +0x40 */
    char _miAnimDelay;   /* +0x41 */
    char _miAnimLen;   /* +0x42 */
    char _miAnimWidth;   /* +0x43 */
    char _miAnimWidth2;   /* +0x44 */
    char _miAnimCnt;   /* +0x45 */
    char _miAnimAdd;   /* +0x46 */
    char _miAnimFrame;   /* +0x47 */
    void (*PrintPtr)();   /* +0x48 */
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

struct QuestStruct {   /* sizeof 20 */
    unsigned char _qlevel;   /* +0x0 */
    unsigned char _qtype;   /* +0x1 */
    unsigned char _qactive;   /* +0x2 */
    unsigned char _qlvltype;   /* +0x3 */
    int _qtx;   /* +0x4 */
    int _qty;   /* +0x8 */
    unsigned char _qslvl;   /* +0xC */
    unsigned char _qidx;   /* +0xD */
    unsigned char _qmsg;   /* +0xE */
    unsigned char _qvar1;   /* +0xF */
    unsigned char _qvar2;   /* +0x10 */
    unsigned char _qlog;   /* +0x11 */
    unsigned char pad_for_laz;   /* +0x12 */
};
struct DMonsterStr {   /* sizeof 8 */
    unsigned char _mx;   /* +0x0 */
    unsigned char _my;   /* +0x1 */
    unsigned char _mdir;   /* +0x2 */
    unsigned char _menemy;   /* +0x3 */
    int _mhitpoints;   /* +0x4 */
};

struct DObjectStr {   /* sizeof 1 */
    unsigned char bCmd;   /* +0x0 */
};

struct TCmdPItem {   /* sizeof 24 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char x;   /* +0x1 */
    unsigned char y;   /* +0x2 */
    unsigned char bId;   /* +0x3 */
    unsigned char bDur;   /* +0x4 */
    unsigned char bMDur;   /* +0x5 */
    unsigned char bCh;   /* +0x6 */
    unsigned char bMCh;   /* +0x7 */
    unsigned short wValue;   /* +0x8 */
    unsigned short wIndx;   /* +0xA */
    unsigned short wCI;   /* +0xC */
    unsigned long dwSeed;   /* +0x10 */
    unsigned long dwBuff;   /* +0x14 */
};

struct DLevel {   /* sizeof 4696 */
    struct TCmdPItem item[127];   /* +0x0 */
    struct DObjectStr object[127];   /* +0xBE8 */
    struct DMonsterStr monster[190];   /* +0xC68 */
};

struct TCmdGItem {   /* sizeof 32 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char bMaster;   /* +0x1 */
    unsigned char bPnum;   /* +0x2 */
    unsigned char bCursitem;   /* +0x3 */
    unsigned char bLevel;   /* +0x4 */
    unsigned char x;   /* +0x5 */
    unsigned char y;   /* +0x6 */
    unsigned char bId;   /* +0x7 */
    unsigned char bDur;   /* +0x8 */
    unsigned char bMDur;   /* +0x9 */
    unsigned char bCh;   /* +0xA */
    unsigned char bMCh;   /* +0xB */
    unsigned short wValue;   /* +0xC */
    unsigned short wIndx;   /* +0xE */
    unsigned short wCI;   /* +0x10 */
    unsigned long dwSeed;   /* +0x14 */
    unsigned long dwBuff;   /* +0x18 */
    unsigned long dwTime;   /* +0x1C */
};

struct TCmd {   /* sizeof 1 */
    unsigned char bCmd;   /* +0x0 */
};

struct TCmdLoc {   /* sizeof 3 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char x;   /* +0x1 */
    unsigned char y;   /* +0x2 */
};

struct TCmdLocParam1 {   /* sizeof 6 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char x;   /* +0x1 */
    unsigned char y;   /* +0x2 */
    unsigned short wParam1;   /* +0x4 */
};

struct TCmdLocParam2 {   /* sizeof 8 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char x;   /* +0x1 */
    unsigned char y;   /* +0x2 */
    unsigned short wParam1;   /* +0x4 */
    unsigned short wParam2;   /* +0x6 */
};

struct TCmdLocParam3 {   /* sizeof 10 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char x;   /* +0x1 */
    unsigned char y;   /* +0x2 */
    unsigned short wParam1;   /* +0x4 */
    unsigned short wParam2;   /* +0x6 */
    unsigned short wParam3;   /* +0x8 */
};

struct TCmdParam1 {   /* sizeof 4 */
    unsigned char bCmd;   /* +0x0 */
    unsigned short wParam1;   /* +0x2 */
};

struct TCmdParam2 {   /* sizeof 6 */
    unsigned char bCmd;   /* +0x0 */
    unsigned short wParam1;   /* +0x2 */
    unsigned short wParam2;   /* +0x4 */
};

struct TCmdParam3 {   /* sizeof 8 */
    unsigned char bCmd;   /* +0x0 */
    unsigned short wParam1;   /* +0x2 */
    unsigned short wParam2;   /* +0x4 */
    unsigned short wParam3;   /* +0x6 */
};

struct TCmdGolem {   /* sizeof 8 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char _mx;   /* +0x1 */
    unsigned char _my;   /* +0x2 */
    unsigned char _mdir;   /* +0x3 */
    unsigned char _menemy;   /* +0x4 */
    unsigned char _currlevel;   /* +0x5 */
    short _mhitpoints;   /* +0x6 */
};

struct TCmdQuest {   /* sizeof 5 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char q;   /* +0x1 */
    unsigned char qstate;   /* +0x2 */
    unsigned char qlog;   /* +0x3 */
    unsigned char qvar1;   /* +0x4 */
};

struct TCmdChItem {   /* sizeof 16 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char bLoc;   /* +0x1 */
    unsigned short wIndx;   /* +0x2 */
    unsigned short wCI;   /* +0x4 */
    unsigned long dwSeed;   /* +0x8 */
    unsigned char bId;   /* +0xC */
};

struct TCmdDelItem {   /* sizeof 2 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char bLoc;   /* +0x1 */
};

struct TCmdDamage {   /* sizeof 8 */
    unsigned char bCmd;   /* +0x0 */
    unsigned char bPlr;   /* +0x1 */
    unsigned long dwDam;   /* +0x4 */
};

struct TCmdPlrInfoHdr {   /* sizeof 6 */
    unsigned char bCmd;   /* +0x0 */
    unsigned short wOffset;   /* +0x2 */
    unsigned short wBytes;   /* +0x4 */
};

/* CompClass / NoComp / PakComp / CrunchComp: real polymorphic inheritance (vtable proven by the
 * retail data: D_80116850 is CompClass's OWN vtable with 2 pure-virtual slots -> DoComp/DoDecomp;
 * NoComp/PakComp/CrunchComp each carry a 2-entry vtable of their own DoComp/DoDecomp overrides).
 * DoComp/DoDecomp are declared const to match the mangled "C" (const-method) qualifier. */
class CompClass {
public:
    virtual int DoComp(unsigned char *Dest, const unsigned char *Src, int SrcLen) const = 0;
    virtual void DoDecomp(unsigned char *Dest, const unsigned char *Src, int DstLen, int SrcLen) const = 0;
};

struct CompressedLevs {   /* sizeof 180 */
    unsigned long Version;   /* +0x0 */
    unsigned long Offset[22];   /* +0x4 */
    unsigned long Size[22];   /* +0x5C */

    int GetSize(void) { return Offset[21] + GAL_AlignSizeToType(Size[21], 1); }
};

class NoComp : public CompClass {
public:
    int DoComp(unsigned char *Dest, const unsigned char *Src, int SrcLen) const { memcpy(Dest, Src, SrcLen); return SrcLen; }
    void DoDecomp(unsigned char *Dest, const unsigned char *Src, int DstLen, int SrcLen) const { memcpy(Dest, Src, SrcLen); }
};

class PakComp : public CompClass {
public:
    int DoComp(unsigned char *Dest, const unsigned char *Src, int SrcLen) const { return PAK_DoPak(Dest, Src, SrcLen); }
    void DoDecomp(unsigned char *Dest, const unsigned char *Src, int DstLen, int SrcLen) const { PAK_DoUnpak(Dest, Src); }
};

class CrunchComp : public CompClass {
public:
    int DoComp(unsigned char *Dest, const unsigned char *Src, int SrcLen) const { return crunch(Src, Dest, SrcLen, 0x800); }
    void DoDecomp(unsigned char *Dest, const unsigned char *Src, int DstLen, int SrcLen) const { decrunch(Src, Dest, SrcLen); }
};

struct AMap {   /* sizeof 16 */
    BOOL Compressed;   /* +0x0 */
    long hnd;   /* +0x4 */
    int Size;   /* +0x8 */
    struct DLevel *CurrLevel;   /* +0xC */
};

/* CompLevelMaps itself + GetMap/ReleaseMap/Init/ExportData/ImportData are reconstructed elsewhere
 * (COMPMAP.CPP, a different splat segment) -- only declared here (extern) for the calls this TU
 * makes into it (GetDLevel/ReleaseDLevel) and the GameMaps object THIS TU owns/constructs. */
class CompLevelMaps {
public:
    CompClass *CompObj;         /* +0x0 */
    struct AMap TheMaps[22];    /* +0x4 */
    int LastNumOut;             /* +0x164 */
    struct DLevel *LastMapOut;  /* +0x168 */
    BOOL MapOut;                /* +0x16C */

    CompLevelMaps(const CompClass &NewCompObj);
    ~CompLevelMaps();
    struct DLevel *GetMap(int MapNum);
    void ReleaseMap(struct DLevel *Dl);
    void Init(void);
    int ExportData(unsigned char *U8Dest);
    void ImportData(struct CompressedLevs *Levs);
};

struct LocalLevel {   /* sizeof 200 */
    unsigned char automapsv[5][40];   /* +0x0 */
};

struct DPortal {   /* sizeof 5 */
    unsigned char x;   /* +0x0 */
    unsigned char y;   /* +0x1 */
    unsigned char level;   /* +0x2 */
    unsigned char ltype;   /* +0x3 */
    unsigned char setlvl;   /* +0x4 */
};

struct MultiQuests {   /* sizeof 3 */
    unsigned char qstate;   /* +0x0 */
    unsigned char qlog;   /* +0x1 */
    unsigned char qvar1;   /* +0x2 */
};

struct DJunk {   /* sizeof 32 */
    struct DPortal portal[4];   /* +0x0 */
    struct MultiQuests quests[4];   /* +0x14 */
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
