struct QuestData {   /* sizeof 16 */
    unsigned char _qdlvl;   /* +0x0 */
    char _qdmultlvl;   /* +0x1 */
    unsigned char _qlvlt;   /* +0x2 */
    unsigned char _qdtype;   /* +0x3 */
    unsigned char _qdrnd;   /* +0x4 */
    unsigned char _qslvl;   /* +0x5 */
    unsigned char _qflags;   /* +0x6 */
    int _qdmsg;   /* +0x8 */
    int _qlstr;   /* +0xC */
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

struct ItemStruct {   /* sizeof 108 -- only the members prequest.cpp touches are load-bearing here */
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
