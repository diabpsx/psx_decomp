struct ThemeStruct {   /* sizeof 8 */
    char ttype;   /* +0x0 */
    int ttval;   /* +0x4 */
};

struct THEME_LOC {   /* sizeof 20 */
    int x;   /* +0x0 */
    int y;   /* +0x4 */
    int ttval;   /* +0x8 */
    int width;   /* +0xC */
    int height;   /* +0x10 */
};

struct TriggerStruct {   /* sizeof 16 */
    int _tx;   /* +0x0 */
    int _ty;   /* +0x4 */
    unsigned int _tmsg;   /* +0x8 */
    int _tlvl;   /* +0xC */
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
