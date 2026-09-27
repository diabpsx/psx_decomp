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

struct PlayerStruct {
    char _pad000[0x1D];
    unsigned char plractive;   /* +0x1D */
    char _pad01e[0x28 - 0x1E];
    int WorldX;        /* +0x28 */
    int WorldY;        /* +0x2C */
    short _px;         /* +0x30 */
    short _py;         /* +0x32 */
    short _pownerx;    /* +0x34 */
    short _pownery;    /* +0x36 */
    short _poldx;      /* +0x38 */
    short _poldy;      /* +0x3A */
    char _pxoff;       /* +0x3C */
    char _pyoff;       /* +0x3D */
    char _pad03e[0x11C - 0x3E];
    long _pHitPoints;  /* +0x11C */
    char _pad120[6632 - 0x120];
};

struct TextDat;

struct CFont {   /* sizeof 540 */
    int TextureId;
    unsigned short FontTab[256];
    int PrintyOTpos;
    int MinX;
    int MaxX;
    int Width;
    struct TextDat *ThisDat;
    unsigned char FontHeight;
};

struct SpellTarget {   /* sizeof 72 */
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

    BOOL Active() { return active; }
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

    unsigned short GetCur() { return get_both ? both_Cur : Cur; }
    unsigned short GetUp() { return get_both ? both_Up : Up; }
    unsigned short GetDown() { return get_both ? both_Down : Down; }
};

struct CBlocks {   /* sizeof 264 */
    char _pad000[0xC8];
    int StX;   /* +0xC8 */
    int StY;   /* +0xCC */
    int Mx;    /* +0xD0 */
    int My;    /* +0xD4 */
    char _pad0d8[264 - 0xD8];

    void MoveToScrollTarget() { Mx = StX; My = StY; }
};

struct CPad;

struct GamePad {   /* sizeof 212 */
    struct PlayerStruct *player;   /* +0x0 */
    struct SpellTarget spell;   /* +0x4 */
    char pnum;   /* +0x4C */
    char allow_walking;   /* +0x4D */
    char style;   /* +0x4E */
    int pad_up_button;   /* +0x50 */
    void (*pad_up_action)(int);   /* +0x54 */
    struct CPad *Pad;   /* +0x58 */
    int combo_key;   /* +0x5C */
    void (*button_down[14])(int);   /* +0x60 */
    void (*button_combo[14])(int);   /* +0x98 */
    unsigned char await_combo;   /* +0xD0 */
    unsigned char combo_menu_active;   /* +0xD1 */

    void SetMoveStyle(char style_num);
    int GetActionButton(void (*func)(int));
    void SetAllButtons(struct KEY_ASSIGNS *actions);
    void GetAllButtons(struct KEY_ASSIGNS *actions);
    void SetUpAction(void (*func)(int), void (*upfunc)(int));
    void SetDownButton(int pad_val, void (*func)(int));
    void SetComboDownButton(int pad_val, void (*func)(int));
    int CheckDirs(int dir, int wx, int wy);
    int CheckDirs(int dir);
    int CheckSide(int dir);
    void RunFunc(int key);

    GamePad() {}
    GamePad(int pnum);
    unsigned char CheckCentre(int dir);
    unsigned char newDirOk(int dir);
    void TestButtons(void);
    void ButtonDown(int button);
};

struct KEY_ASSIGNS {   /* sizeof 16 */
    int txt;   /* +0x0 */
    int pad_val;   /* +0x4 */
    void (*func)(int);   /* +0x8 */
    int combo_val;   /* +0xC */
};

struct pad_assigns {   /* sizeof 12 */
    char *txt;   /* +0x0 */
    int pnum;   /* +0x4 */
    char font_num;   /* +0x8 */
};
