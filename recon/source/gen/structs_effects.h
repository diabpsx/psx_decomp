struct RECT {   /* sizeof 8 */
    short x;   /* +0x0 */
    short y;   /* +0x2 */
    short w;   /* +0x4 */
    short h;   /* +0x6 */
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

/* PSX sound-effect record (4 bytes) -- NOT the PC TSFX (bFlags, a name pointer, a TSnd pointer);
   Channel and pszName are new PSX fields, pszName is really a numeric bank-sound Name id (unsigned
   short), matching the unsigned short Name arg of STR_PlaySound/SND_PlaySnd. */
struct TSFX {   /* sizeof 4 */
    unsigned char Channel;   /* +0x0 */
    unsigned char bFlags;   /* +0x1 */
    unsigned short pszName;   /* +0x2 */
};

struct STRHDR;

struct SFXHDR {   /* sizeof 132 */
    char used;   /* +0x0 */
    char loop;   /* +0x1 */
    char playing;   /* +0x2 */
    char state;   /* +0x3 */
    BOOL TaskAlive;   /* +0x4 */
    struct STRHDR *StreamHND;   /* +0x8 */
    unsigned char type;   /* +0xC */
    unsigned char ChunkGot;   /* +0xD */
    int voice;   /* +0x10 */
    int volume;   /* +0x14 */
    int s_volume;   /* +0x18 */
    int pitch;   /* +0x1C */
    int stream_sec;   /* +0x20 */
    int stream_offs;   /* +0x24 */
    int stream_read;   /* +0x28 */
    int stream_stall;   /* +0x2C */
    int stream_pos;   /* +0x30 */
    int SPU_frame;   /* +0x34 */
    int SPU_sec;   /* +0x38 */
    int SPU_pos;   /* +0x3C */
    int SPUstreamaddr;   /* +0x40 */
    int framecount;   /* +0x44 */
    int lastcount;   /* +0x48 */
    int sec_num;   /* +0x4C */
    int SPU_sec_num;   /* +0x50 */
    int ah;   /* +0x54 */
    int stream_ending;   /* +0x58 */
    int DMA_size;   /* +0x5C */
    int spu_rate;   /* +0x60 */
    int SizeIn;   /* +0x64 */
    unsigned char *mem;   /* +0x68 */
    unsigned long stream_playing;   /* +0x6C */
    int SfxNo;   /* +0x70 */
    char name[14];   /* +0x74 */
};

/* CBlocks -- minimal stub (only the one method effects.cpp calls, matches other TUs' precedent
   e.g. palette.cpp/control.cpp). GetScrXY's SYM mangling is R4RECT (a C++ REFERENCE param) --
   symhdr renders references as pointers (known bug, checkpoint q); declared correctly here. */
class CBlocks {
public:
    void GetScrXY(RECT &R, int x, int y, int sxoff, int syoff);
    char _pad[264];   /* SYM sizeof 264: pointer records carry the pointee size */
};

struct AnimStruct {   /* sizeof 2 */
    char Frames;   /* +0x0 */
    char Rate;   /* +0x1 */
};

struct MonsterData;

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

/* MonsterStruct -- only the fields effects.cpp touches (_mMTidx/_mx/_my); matches
   recon/source/gen/structs_coremon.h's full layout (sizeof 104). */
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

/* PlayerStruct -- opaque except _pClass (+0xF6) and pLvlLoad (+0x19E2), the two fields effects.cpp
   reads (offsets/stride confirmed vs recon/source/gen/structs_{towners,coremon}.h). sizeof 0x19E8
   matches the multiply-by-6632 stride in the SYM oracle (myplr*sizeof(PlayerStruct)). */
struct PlayerStruct {
    unsigned char _pad_00[0x1D];
    unsigned char plractive;   /* +0x1D */
    unsigned char _pad_1E[0xF6 - 0x1E];
    char _pClass;   /* +0xF6 */
    unsigned char _pad1[0x19E2 - 0xF7];
    unsigned char pLvlLoad;   /* +0x19E2 */
    unsigned char _pad2[0x19E8 - 0x19E3];
};
