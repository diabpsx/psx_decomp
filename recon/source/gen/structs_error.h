struct RECT {   /* sizeof 8 */
    short x;   /* +0x0 */
    short y;   /* +0x2 */
    short w;   /* +0x4 */
    short h;   /* +0x6 */
};

enum TXT_JUST {
    JustRight = 2,
    JustCentre = 1,
    JustLeft = 0
};

struct TextDat;

struct CFont {   /* sizeof 540 */
    int TextureId;   /* +0x0 */
    unsigned short FontTab[256];   /* +0x4 */
    int PrintyOTpos;   /* +0x204 */
    int MinX;   /* +0x208 */
    int MaxX;   /* +0x20C */
    int Width;   /* +0x210 */
    struct TextDat *ThisDat;   /* +0x214 */
    unsigned char FontHeight;   /* +0x218 */

    int Print(int X, int Y, char *Str, enum TXT_JUST Justify, struct RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);   /* @0x8008A090 PRINTY.CPP:746 */
};
