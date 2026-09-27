/* MEMCARD.CPP layouts (tools/symhdr.py struct DIRENTRY file_header sjis) */
struct DIRENTRY {   /* sizeof 40 */
    char name[20];   /* +0x0 */
    long attr;   /* +0x14 */
    long size;   /* +0x18 */
    struct DIRENTRY *next;   /* +0x1C */
    long head;   /* +0x20 */
    char system[4];   /* +0x24 */
};

struct file_header {   /* sizeof 512 */
    char magic[2];   /* +0x0 */
    char type;   /* +0x2 */
    char blockentry;   /* +0x3 */
    unsigned char title[64];   /* +0x4 */
    char reserved[28];   /* +0x44 */
    char clut[32];   /* +0x60 */
    char icon[1][128];   /* +0x80 */
    int chksum;   /* +0x100 */
    int size;   /* +0x104 */
    int id;   /* +0x108 */
    char icon2[1][116];   /* +0x10C */
    char icon3[1][128];   /* +0x180 */
};

struct sjis {   /* sizeof 4 */
    char ascii;   /* +0x0 */
    unsigned char num;   /* +0x1 */
    unsigned short sjis;   /* +0x2 */
};
