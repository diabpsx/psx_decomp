struct THEME_LOC {   /* sizeof 20 */
    int x;   /* +0x0 */
    int y;   /* +0x4 */
    int ttval;   /* +0x8 */
    int width;   /* +0xC */
    int height;   /* +0x10 */
};

struct ScrollStruct {   /* sizeof 20, retail SYM */
    int _sxoff;
    int _syoff;
    int _sdx;
    int _sdy;
    int _sdir;
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
