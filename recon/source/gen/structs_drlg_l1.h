/* DRLG_L1.CPP: struct types this TU references (owned elsewhere; local copies per TU convention). */
struct THEME_LOC {   /* sizeof 20, original SYM; storage owned by DRLG_L1 */
    int x;
    int y;
    int ttval;
    int width;
    int height;
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

struct ShadowStruct {   /* sizeof 7 */
    unsigned char strig;   /* +0x0 */
    unsigned char s1;   /* +0x1 */
    unsigned char s2;   /* +0x2 */
    unsigned char s3;   /* +0x3 */
    unsigned char nv1;   /* +0x4 */
    unsigned char nv2;   /* +0x5 */
    unsigned char nv3;   /* +0x6 */
};
