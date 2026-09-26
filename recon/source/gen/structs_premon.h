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

struct MonsterData {   /* sizeof 60 */
    unsigned short GraphicType;   /* +0x0 */
    unsigned char has_special;   /* +0x2 */
    unsigned short sndfile;   /* +0x4 */
    unsigned char snd_special;   /* +0x6 */
    char TransFile;   /* +0x7 */
    char Frames[6];   /* +0x8 */
    char Rate[6];   /* +0xE */
    int mName;   /* +0x14 */
    char mMinDLvl;   /* +0x18 */
    char mMaxDLvl;   /* +0x19 */
    char mLevel;   /* +0x1A */
    short mMinHP;   /* +0x1C */
    short mMaxHP;   /* +0x1E */
    unsigned char mAi;   /* +0x20 */
    unsigned short mFlags;   /* +0x22 */
    unsigned char mInt;   /* +0x24 */
    unsigned char mHit;   /* +0x25 */
    unsigned char mAFNum;   /* +0x26 */
    unsigned char mMinDamage;   /* +0x27 */
    unsigned char mMaxDamage;   /* +0x28 */
    unsigned char mHit2;   /* +0x29 */
    unsigned char mAFNum2;   /* +0x2A */
    unsigned char mMinDamage2;   /* +0x2B */
    unsigned char mMaxDamage2;   /* +0x2C */
    char mArmorClass;   /* +0x2D */
    char mMonstClass;   /* +0x2E */
    unsigned short mMagicRes;   /* +0x30 */
    unsigned short mMagicRes2;   /* +0x32 */
    unsigned short mTreasure;   /* +0x34 */
    char mSelFlag;   /* +0x36 */
    unsigned short mExp;   /* +0x38 */
};

struct UniqMonstStruct {   /* sizeof 24 */
    char mtype;   /* +0x0 */
    unsigned short mName;   /* +0x2 */
    unsigned char mlevel;   /* +0x4 */
    unsigned short mmaxhp;   /* +0x6 */
    unsigned char mAi;   /* +0x8 */
    unsigned char mint;   /* +0x9 */
    unsigned char mMinDamage;   /* +0xA */
    unsigned char mMaxDamage;   /* +0xB */
    unsigned short mMagicRes;   /* +0xC */
    unsigned short mUnqAttr;   /* +0xE */
    unsigned char mUnqVar1;   /* +0x10 */
    unsigned char mUnqVar2;   /* +0x11 */
    int mtalkmsg;   /* +0x14 */
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

struct TriggerStruct {   /* sizeof 16 */
    int _tx;   /* +0x0 */
    int _ty;   /* +0x4 */
    unsigned int _tmsg;   /* +0x8 */
    int _tlvl;   /* +0xC */
};

struct THEME_LOC {   /* sizeof 20 */
    int x;   /* +0x0 */
    int y;   /* +0x4 */
    int ttval;   /* +0x8 */
    int width;   /* +0xC */
    int height;   /* +0x10 */
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

/* PlayerStruct is huge (sizeof 6632) and only _px/_py (@+0x30/+0x32) are ever
 * touched from PREMON.CPP -- keep exact size/offsets via padding rather than
 * pulling every ItemStruct/PathStruct field this TU never reaches. */
struct PlayerStruct {
    char _pad000[0x30];
    short _px;      /* +0x30 */
    short _py;      /* +0x32 */
    char _pad034[6632 - 0x34];
};
