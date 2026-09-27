struct TASK;

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
