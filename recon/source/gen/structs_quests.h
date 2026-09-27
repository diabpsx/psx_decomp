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

struct TriggerStruct {   /* sizeof 16 */
    int _tx;    /* +0x0 */
    int _ty;    /* +0x4 */
    unsigned int _tmsg;  /* +0x8 */
    int _tlvl;  /* +0xC */
};

struct RECT {   /* sizeof 8 */
    short x;   /* +0x0 */
    short y;   /* +0x2 */
    short w;   /* +0x4 */
    short h;   /* +0x6 */
};

/* opaque-sized carriers: only used as typed pointers/arrays, field access via raw offsets */
struct PlayerStruct { unsigned char _pad[0x19E8]; };
struct MonsterStruct {   /* sizeof 104 */
    int mtalkmsg;         /* +0x0 */
    int _mgoalvar1, _mgoalvar2, _mgoalvar3;
    int _mhitpoints, _mmaxhp;
    short _mVar1, _mVar2, _mVar3, _mVar4, _mVar5, _mVar6, _mVar7, _mVar8;
    short _mxvel, _myvel;
    unsigned short _mFlags, mExp, mMagicRes;
    char _mMTidx, _mmode, _mx, _my, _mfutx, _mfuty, _moldx, _moldy;
    char _mxoff, _myoff, _mdir;
    unsigned char _menemy;
    char _mAnimDelay, _mAnimCnt, _mAnimLen, _mAnimFrame, _mAFNum, _lastx, _lasty, _udeadval;
    char mWhoHit, mLevel, mArmorClass;
    unsigned char _mgoal, _menemyx, _menemyy, _mAi, _mint, _msquelch, _uniqtype;
    unsigned char mHit, mMinDamage, mMaxDamage, mHit2, mMinDamage2, mMaxDamage2;
    unsigned char leader, leaderflag, packsize, mlid;
    char Action, _mDelFlag;
    int mName;              /* +0x5C -- identity id, not a real pointer on PSX */
    void *MType;            /* +0x60 */
    void *MData;            /* +0x64 */
};

struct CBlocks {
    static int GetOverlayOtBase(void);
};

enum TXT_JUST { JustLeft = 0, JustCentre = 1, JustRight = 2 };

struct CFont {   /* sizeof 540 (printy.h); layout opaque here, size load-bearing: an empty
                    struct is 1 byte -> -G8 small-data SYMBOL_REF_FLAG -> &MediumFont never CSEd */
    unsigned char _opaque[540];
    int Print(int X, int Y, char *Str, TXT_JUST Justify, RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
    int GetStrWidth(char *Str);
};

struct Dialog {   /* sizeof 16 */
    int BevelGfx;    /* +0x0 */
    int BorderGfx;   /* +0x4  (SetBorder) */
    int BackGfx;     /* +0x8  (SetBack) */
    int DialogOTpos; /* +0xC */
    Dialog();
    ~Dialog();
    void SetBack(int Type) { BackGfx = Type; }
    void SetBorder(int Type) { BorderGfx = Type; }
    void SetRGB(unsigned char R, unsigned char G, unsigned char B);
    void Back(int x, int y, int w, int h);
};

struct TASK { char _pad[92]; };
