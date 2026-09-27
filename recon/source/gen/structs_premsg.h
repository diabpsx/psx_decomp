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

struct CMonster {   /* sizeof 28 */
    struct MonsterData *MData;   /* +0x0 */
    char Anims[12];   /* +0x4 (6 x AnimStruct, 2 bytes each; opaque here) */
    unsigned short Snds;   /* +0x10 */
    unsigned char mtype;   /* +0x12 */
    unsigned char mPlaceFlags;   /* +0x13 */
    unsigned char mMinHP;   /* +0x14 */
    unsigned char mMaxHP;   /* +0x15 */
    unsigned char has_special;   /* +0x16 */
    unsigned char mAFNum;   /* +0x17 */
    char mdeadval;   /* +0x18 */
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

struct ObjectStruct {
    char _opad0[30];   /* opaque here */
    char _otype;   /* +0x1E */
    char _opad1[13];
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

struct DObjectStr {   /* sizeof 1 */
    unsigned char bCmd;   /* +0x0 */
};

struct DMonsterStr {   /* sizeof 8 */
    unsigned char _mx;   /* +0x0 */
    unsigned char _my;   /* +0x1 */
    unsigned char _mdir;   /* +0x2 */
    unsigned char _menemy;   /* +0x3 */
    int _mhitpoints;   /* +0x4 */
};

struct DLevel {   /* sizeof 4696 */
    struct TCmdPItem item[127];   /* +0x0 */
    struct DObjectStr object[127];   /* +0xBE8 */
    struct DMonsterStr monster[190];   /* +0xC68 */
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

struct map_info {   /* sizeof 8 */
    short dMonster;   /* +0x0 */
    unsigned char dBits;   /* +0x2 */
    char dObject;   /* +0x3 */
    char dItem;   /* +0x4 */
    char dMissile;   /* +0x5 */
    char dFlags;   /* +0x6 */
    char dTransVal;   /* +0x7 */
};

struct LocalLevel {   /* sizeof 200 */
    unsigned char automapsv[5][40];   /* +0x0 */
};
