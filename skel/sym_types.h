/* skel/sym_types.h — every struct/union/enum/typedef recorded in DIABPSX.SYM (tools/symtypes.py rendering).
 * Reading reference: names repeat across TUs (e.g. BOOL is UCHAR in GLIB C, bool in the C++ TUs). */

typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;
typedef unsigned short ushort;
struct _physadr {   /* size 4 */
    int r[1];   /* +0x0 size 4 */
};   /* sizeof 4 */

typedef struct _physadr _physadr;
typedef struct _physadr *physadr;
struct label_t {   /* size 48 */
    int val[12];   /* +0x0 size 48 */
};   /* sizeof 48 */

typedef struct label_t label_t;
struct _quad {   /* size 8 */
    long val[2];   /* +0x0 size 8 */
};   /* sizeof 8 */

typedef struct _quad _quad;
typedef struct _quad quad;
typedef long daddr_t;
typedef char *caddr_t;
typedef long *qaddr_t;
typedef unsigned long ino_t;
typedef long swblk_t;
typedef unsigned int size_t;
typedef long time_t;
typedef short dev_t;
typedef long off_t;
typedef unsigned short uid_t;
typedef unsigned short gid_t;
typedef char s8;
typedef short s16;
typedef long s32;
typedef long s64;
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;
typedef unsigned long u64;
typedef unsigned int uint;
typedef unsigned char uchar;
typedef unsigned long ulong;
typedef unsigned char UBYTE;
typedef unsigned short UWORD;
typedef unsigned int UINT;
typedef unsigned char UCHAR;
typedef unsigned short USHORT;
typedef unsigned long ULONG;
typedef unsigned char BOOL;
typedef char S8;
typedef short S16;
typedef long S32;
typedef unsigned char U8;
typedef unsigned short U16;
typedef unsigned long U32;
typedef char int8;
typedef unsigned char uint8;
typedef unsigned char byte;
typedef short int16;
typedef unsigned short uint16;
typedef unsigned short word;
typedef long int32;
typedef unsigned long uint32;
typedef unsigned long dword;
typedef long S64;
typedef unsigned long U64;
typedef long int64;
typedef unsigned long uint64;
typedef unsigned long qword;
struct MonstList {   /* size 16 */
    unsigned short NumOfMonsters;   /* +0x0 size 0 */
    unsigned short TexNum;   /* +0x2 size 0 */
    unsigned char *TheList;   /* +0x4 size 0 */
    char *ListName;   /* +0x8 size 0 */
    unsigned long QuestBits;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct MonstList MonstList;
struct MonstLevel {   /* size 8 */
    int NumOfLists;   /* +0x0 size 0 */
    struct MonstList *TheLists;   /* +0x4 size 16 */
};   /* sizeof 8 */

typedef struct MonstLevel MonstLevel;
enum .0fake {
    MQ_BLOOD = 4096,
    MQ_PWATER = 2048,
    MQ_ANVIL = 1024,
    MQ_SCHAMB = 512,
    MQ_BETRAYER = 256,
    MQ_DIABLO = 128,
    MQ_SKELKING = 64,
    MQ_WARLORD = 32,
    MQ_VEIL = 16,
    MQ_LTBANNER = 8,
    MQ_ZHAR = 4,
    MQ_GARBUD = 2,
    MQ_BUTCHER = 1,
};

typedef unsigned char wchar_t;
typedef void *va_list;
struct ToT {   /* size 8 */
    unsigned long *head;   /* +0x0 size 0 */
    long size;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct ToT ToT;
struct TCBH {   /* size 8 */
    struct TCB *entry;   /* +0x0 size 0 */
    long flag;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct TCBH TCBH;
struct TCB {   /* size 192 */
    long status;   /* +0x0 size 0 */
    long mode;   /* +0x4 size 0 */
    unsigned long reg[40];   /* +0x8 size 160 */
    long system[6];   /* +0xA8 size 24 */
};   /* sizeof 192 */

typedef struct TCB TCB;
struct EvCB {   /* size 28 */
    unsigned long desc;   /* +0x0 size 0 */
    long status;   /* +0x4 size 0 */
    long spec;   /* +0x8 size 0 */
    long mode;   /* +0xC size 0 */
    long (*FHandler)();   /* +0x10 size 0 */
    long system[2];   /* +0x14 size 8 */
};   /* sizeof 28 */

typedef struct EvCB EvCB;
struct EXEC {   /* size 60 */
    unsigned long pc0;   /* +0x0 size 0 */
    unsigned long gp0;   /* +0x4 size 0 */
    unsigned long t_addr;   /* +0x8 size 0 */
    unsigned long t_size;   /* +0xC size 0 */
    unsigned long d_addr;   /* +0x10 size 0 */
    unsigned long d_size;   /* +0x14 size 0 */
    unsigned long b_addr;   /* +0x18 size 0 */
    unsigned long b_size;   /* +0x1C size 0 */
    unsigned long s_addr;   /* +0x20 size 0 */
    unsigned long s_size;   /* +0x24 size 0 */
    unsigned long sp;   /* +0x28 size 0 */
    unsigned long fp;   /* +0x2C size 0 */
    unsigned long gp;   /* +0x30 size 0 */
    unsigned long ret;   /* +0x34 size 0 */
    unsigned long base;   /* +0x38 size 0 */
};   /* sizeof 60 */

typedef struct EXEC EXEC;
struct XF_HDR {   /* size 136 */
    char key[8];   /* +0x0 size 8 */
    unsigned long text;   /* +0x8 size 0 */
    unsigned long data;   /* +0xC size 0 */
    struct EXEC exec;   /* +0x10 size 60 */
    char title[60];   /* +0x4C size 60 */
};   /* sizeof 136 */

typedef struct XF_HDR XF_HDR;
struct DIRENTRY {   /* size 40 */
    char name[20];   /* +0x0 size 20 */
    long attr;   /* +0x14 size 0 */
    long size;   /* +0x18 size 0 */
    struct DIRENTRY *next;   /* +0x1C size 40 */
    long head;   /* +0x20 size 0 */
    char system[4];   /* +0x24 size 4 */
};   /* sizeof 40 */

typedef struct DIRENTRY DIRENTRY;
struct MATRIX {   /* size 32 */
    short m[3][3];   /* +0x0 size 18 */
    long t[3];   /* +0x14 size 12 */
};   /* sizeof 32 */

typedef struct MATRIX MATRIX;
struct VECTOR {   /* size 16 */
    long vx;   /* +0x0 size 0 */
    long vy;   /* +0x4 size 0 */
    long vz;   /* +0x8 size 0 */
    long pad;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct VECTOR VECTOR;
struct SVECTOR {   /* size 8 */
    short vx;   /* +0x0 size 0 */
    short vy;   /* +0x2 size 0 */
    short vz;   /* +0x4 size 0 */
    short pad;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct SVECTOR SVECTOR;
struct CVECTOR {   /* size 4 */
    unsigned char r;   /* +0x0 size 0 */
    unsigned char g;   /* +0x1 size 0 */
    unsigned char b;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
};   /* sizeof 4 */

typedef struct CVECTOR CVECTOR;
struct DVECTOR {   /* size 4 */
    short vx;   /* +0x0 size 0 */
    short vy;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct DVECTOR DVECTOR;
struct EVECTOR {   /* size 44 */
    struct SVECTOR v;   /* +0x0 size 8 */
    struct VECTOR sxyz;   /* +0x8 size 16 */
    struct DVECTOR sxy;   /* +0x18 size 4 */
    struct CVECTOR rgb;   /* +0x1C size 4 */
    short txuv;   /* +0x20 size 0 */
    short pad;   /* +0x22 size 0 */
    long chx;   /* +0x24 size 0 */
    long chy;   /* +0x28 size 0 */
};   /* sizeof 44 */

typedef struct EVECTOR EVECTOR;
struct RVECTOR {   /* size 24 */
    struct SVECTOR v;   /* +0x0 size 8 */
    unsigned char uv[2];   /* +0x8 size 2 */
    unsigned short pad;   /* +0xA size 0 */
    struct CVECTOR c;   /* +0xC size 4 */
    struct DVECTOR sxy;   /* +0x10 size 4 */
    unsigned long sz;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct RVECTOR RVECTOR;
struct CRVECTOR3 {   /* size 88 */
    struct RVECTOR r01;   /* +0x0 size 24 */
    struct RVECTOR r12;   /* +0x18 size 24 */
    struct RVECTOR r20;   /* +0x30 size 24 */
    struct RVECTOR *r0;   /* +0x48 size 24 */
    struct RVECTOR *r1;   /* +0x4C size 24 */
    struct RVECTOR *r2;   /* +0x50 size 24 */
    unsigned long *rtn;   /* +0x54 size 0 */
};   /* sizeof 88 */

typedef struct CRVECTOR3 CRVECTOR3;
struct DIVPOLYGON3 {   /* size 536 */
    unsigned long ndiv;   /* +0x0 size 0 */
    unsigned long pih;   /* +0x4 size 0 */
    unsigned long piv;   /* +0x8 size 0 */
    unsigned short clut;   /* +0xC size 0 */
    unsigned short tpage;   /* +0xE size 0 */
    struct CVECTOR rgbc;   /* +0x10 size 4 */
    unsigned long *ot;   /* +0x14 size 0 */
    struct RVECTOR r0;   /* +0x18 size 24 */
    struct RVECTOR r1;   /* +0x30 size 24 */
    struct RVECTOR r2;   /* +0x48 size 24 */
    struct CRVECTOR3 cr[5];   /* +0x60 size 440 */
};   /* sizeof 536 */

typedef struct DIVPOLYGON3 DIVPOLYGON3;
struct CRVECTOR4 {   /* size 140 */
    struct RVECTOR r01;   /* +0x0 size 24 */
    struct RVECTOR r02;   /* +0x18 size 24 */
    struct RVECTOR r31;   /* +0x30 size 24 */
    struct RVECTOR r32;   /* +0x48 size 24 */
    struct RVECTOR rc;   /* +0x60 size 24 */
    struct RVECTOR *r0;   /* +0x78 size 24 */
    struct RVECTOR *r1;   /* +0x7C size 24 */
    struct RVECTOR *r2;   /* +0x80 size 24 */
    struct RVECTOR *r3;   /* +0x84 size 24 */
    unsigned long *rtn;   /* +0x88 size 0 */
};   /* sizeof 140 */

typedef struct CRVECTOR4 CRVECTOR4;
struct DIVPOLYGON4 {   /* size 820 */
    unsigned long ndiv;   /* +0x0 size 0 */
    unsigned long pih;   /* +0x4 size 0 */
    unsigned long piv;   /* +0x8 size 0 */
    unsigned short clut;   /* +0xC size 0 */
    unsigned short tpage;   /* +0xE size 0 */
    struct CVECTOR rgbc;   /* +0x10 size 4 */
    unsigned long *ot;   /* +0x14 size 0 */
    struct RVECTOR r0;   /* +0x18 size 24 */
    struct RVECTOR r1;   /* +0x30 size 24 */
    struct RVECTOR r2;   /* +0x48 size 24 */
    struct RVECTOR r3;   /* +0x60 size 24 */
    struct CRVECTOR4 cr[5];   /* +0x78 size 700 */
};   /* sizeof 820 */

typedef struct DIVPOLYGON4 DIVPOLYGON4;
struct SPOL {   /* size 16 */
    short xy[3];   /* +0x0 size 6 */
    short uv[2];   /* +0x6 size 4 */
    short rgb[3];   /* +0xA size 6 */
};   /* sizeof 16 */

typedef struct SPOL SPOL;
struct POL4 {   /* size 74 */
    short sxy[4][2];   /* +0x0 size 16 */
    short sz[4][2];   /* +0x10 size 16 */
    short uv[4][2];   /* +0x20 size 16 */
    short rgb[4][3];   /* +0x30 size 24 */
    short code;   /* +0x48 size 0 */
};   /* sizeof 74 */

typedef struct POL4 POL4;
struct POL3 {   /* size 56 */
    short sxy[3][2];   /* +0x0 size 12 */
    short sz[3][2];   /* +0xC size 12 */
    short uv[3][2];   /* +0x18 size 12 */
    short rgb[3][3];   /* +0x24 size 18 */
    short code;   /* +0x36 size 0 */
};   /* sizeof 56 */

typedef struct POL3 POL3;
struct TMESH {   /* size 20 */
    struct SVECTOR *v;   /* +0x0 size 8 */
    struct SVECTOR *n;   /* +0x4 size 8 */
    struct SVECTOR *u;   /* +0x8 size 8 */
    struct CVECTOR *c;   /* +0xC size 4 */
    unsigned long len;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct TMESH TMESH;
struct QMESH {   /* size 24 */
    struct SVECTOR *v;   /* +0x0 size 8 */
    struct SVECTOR *n;   /* +0x4 size 8 */
    struct SVECTOR *u;   /* +0x8 size 8 */
    struct CVECTOR *c;   /* +0xC size 4 */
    unsigned long lenv;   /* +0x10 size 0 */
    unsigned long lenh;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct QMESH QMESH;
struct RECT {   /* size 8 */
    short x;   /* +0x0 size 0 */
    short y;   /* +0x2 size 0 */
    short w;   /* +0x4 size 0 */
    short h;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct RECT RECT;
struct RECT32 {   /* size 16 */
    int x;   /* +0x0 size 0 */
    int y;   /* +0x4 size 0 */
    int w;   /* +0x8 size 0 */
    int h;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct RECT32 RECT32;
struct DR_ENV {   /* size 64 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned long code[15];   /* +0x4 size 60 */
};   /* sizeof 64 */

typedef struct DR_ENV DR_ENV;
struct DRAWENV {   /* size 92 */
    struct RECT clip;   /* +0x0 size 8 */
    short ofs[2];   /* +0x8 size 4 */
    struct RECT tw;   /* +0xC size 8 */
    unsigned short tpage;   /* +0x14 size 0 */
    unsigned char dtd;   /* +0x16 size 0 */
    unsigned char dfe;   /* +0x17 size 0 */
    unsigned char isbg;   /* +0x18 size 0 */
    unsigned char r0;   /* +0x19 size 0 */
    unsigned char g0;   /* +0x1A size 0 */
    unsigned char b0;   /* +0x1B size 0 */
    struct DR_ENV dr_env;   /* +0x1C size 64 */
};   /* sizeof 92 */

typedef struct DRAWENV DRAWENV;
struct DISPENV {   /* size 20 */
    struct RECT disp;   /* +0x0 size 8 */
    struct RECT screen;   /* +0x8 size 8 */
    unsigned char isinter;   /* +0x10 size 0 */
    unsigned char isrgb24;   /* +0x11 size 0 */
    unsigned char pad0;   /* +0x12 size 0 */
    unsigned char pad1;   /* +0x13 size 0 */
};   /* sizeof 20 */

typedef struct DISPENV DISPENV;
struct P_TAG {   /* size 8 */
    unsigned int addr : 24;   /* bit 0 */
    unsigned int len : 8;   /* bit 24 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
};   /* sizeof 8 */

typedef struct P_TAG P_TAG;
struct P_CODE {   /* size 4 */
    unsigned char r0;   /* +0x0 size 0 */
    unsigned char g0;   /* +0x1 size 0 */
    unsigned char b0;   /* +0x2 size 0 */
    unsigned char code;   /* +0x3 size 0 */
};   /* sizeof 4 */

typedef struct P_CODE P_CODE;
struct POLY_F3 {   /* size 20 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    short x1;   /* +0xC size 0 */
    short y1;   /* +0xE size 0 */
    short x2;   /* +0x10 size 0 */
    short y2;   /* +0x12 size 0 */
};   /* sizeof 20 */

typedef struct POLY_F3 POLY_F3;
struct POLY_F4 {   /* size 24 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    short x1;   /* +0xC size 0 */
    short y1;   /* +0xE size 0 */
    short x2;   /* +0x10 size 0 */
    short y2;   /* +0x12 size 0 */
    short x3;   /* +0x14 size 0 */
    short y3;   /* +0x16 size 0 */
};   /* sizeof 24 */

typedef struct POLY_F4 POLY_F4;
struct POLY_FT3 {   /* size 32 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char u0;   /* +0xC size 0 */
    unsigned char v0;   /* +0xD size 0 */
    unsigned short clut;   /* +0xE size 0 */
    short x1;   /* +0x10 size 0 */
    short y1;   /* +0x12 size 0 */
    unsigned char u1;   /* +0x14 size 0 */
    unsigned char v1;   /* +0x15 size 0 */
    unsigned short tpage;   /* +0x16 size 0 */
    short x2;   /* +0x18 size 0 */
    short y2;   /* +0x1A size 0 */
    unsigned char u2;   /* +0x1C size 0 */
    unsigned char v2;   /* +0x1D size 0 */
    unsigned short pad1;   /* +0x1E size 0 */
};   /* sizeof 32 */

typedef struct POLY_FT3 POLY_FT3;
struct POLY_FT4 {   /* size 40 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char u0;   /* +0xC size 0 */
    unsigned char v0;   /* +0xD size 0 */
    unsigned short clut;   /* +0xE size 0 */
    short x1;   /* +0x10 size 0 */
    short y1;   /* +0x12 size 0 */
    unsigned char u1;   /* +0x14 size 0 */
    unsigned char v1;   /* +0x15 size 0 */
    unsigned short tpage;   /* +0x16 size 0 */
    short x2;   /* +0x18 size 0 */
    short y2;   /* +0x1A size 0 */
    unsigned char u2;   /* +0x1C size 0 */
    unsigned char v2;   /* +0x1D size 0 */
    unsigned short pad1;   /* +0x1E size 0 */
    short x3;   /* +0x20 size 0 */
    short y3;   /* +0x22 size 0 */
    unsigned char u3;   /* +0x24 size 0 */
    unsigned char v3;   /* +0x25 size 0 */
    unsigned short pad2;   /* +0x26 size 0 */
};   /* sizeof 40 */

typedef struct POLY_FT4 POLY_FT4;
struct POLY_G3 {   /* size 28 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char r1;   /* +0xC size 0 */
    unsigned char g1;   /* +0xD size 0 */
    unsigned char b1;   /* +0xE size 0 */
    unsigned char pad1;   /* +0xF size 0 */
    short x1;   /* +0x10 size 0 */
    short y1;   /* +0x12 size 0 */
    unsigned char r2;   /* +0x14 size 0 */
    unsigned char g2;   /* +0x15 size 0 */
    unsigned char b2;   /* +0x16 size 0 */
    unsigned char pad2;   /* +0x17 size 0 */
    short x2;   /* +0x18 size 0 */
    short y2;   /* +0x1A size 0 */
};   /* sizeof 28 */

typedef struct POLY_G3 POLY_G3;
struct POLY_G4 {   /* size 36 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char r1;   /* +0xC size 0 */
    unsigned char g1;   /* +0xD size 0 */
    unsigned char b1;   /* +0xE size 0 */
    unsigned char pad1;   /* +0xF size 0 */
    short x1;   /* +0x10 size 0 */
    short y1;   /* +0x12 size 0 */
    unsigned char r2;   /* +0x14 size 0 */
    unsigned char g2;   /* +0x15 size 0 */
    unsigned char b2;   /* +0x16 size 0 */
    unsigned char pad2;   /* +0x17 size 0 */
    short x2;   /* +0x18 size 0 */
    short y2;   /* +0x1A size 0 */
    unsigned char r3;   /* +0x1C size 0 */
    unsigned char g3;   /* +0x1D size 0 */
    unsigned char b3;   /* +0x1E size 0 */
    unsigned char pad3;   /* +0x1F size 0 */
    short x3;   /* +0x20 size 0 */
    short y3;   /* +0x22 size 0 */
};   /* sizeof 36 */

typedef struct POLY_G4 POLY_G4;
struct POLY_GT3 {   /* size 40 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char u0;   /* +0xC size 0 */
    unsigned char v0;   /* +0xD size 0 */
    unsigned short clut;   /* +0xE size 0 */
    unsigned char r1;   /* +0x10 size 0 */
    unsigned char g1;   /* +0x11 size 0 */
    unsigned char b1;   /* +0x12 size 0 */
    unsigned char p1;   /* +0x13 size 0 */
    short x1;   /* +0x14 size 0 */
    short y1;   /* +0x16 size 0 */
    unsigned char u1;   /* +0x18 size 0 */
    unsigned char v1;   /* +0x19 size 0 */
    unsigned short tpage;   /* +0x1A size 0 */
    unsigned char r2;   /* +0x1C size 0 */
    unsigned char g2;   /* +0x1D size 0 */
    unsigned char b2;   /* +0x1E size 0 */
    unsigned char p2;   /* +0x1F size 0 */
    short x2;   /* +0x20 size 0 */
    short y2;   /* +0x22 size 0 */
    unsigned char u2;   /* +0x24 size 0 */
    unsigned char v2;   /* +0x25 size 0 */
    unsigned short pad2;   /* +0x26 size 0 */
};   /* sizeof 40 */

typedef struct POLY_GT3 POLY_GT3;
struct POLY_GT4 {   /* size 52 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char u0;   /* +0xC size 0 */
    unsigned char v0;   /* +0xD size 0 */
    unsigned short clut;   /* +0xE size 0 */
    unsigned char r1;   /* +0x10 size 0 */
    unsigned char g1;   /* +0x11 size 0 */
    unsigned char b1;   /* +0x12 size 0 */
    unsigned char p1;   /* +0x13 size 0 */
    short x1;   /* +0x14 size 0 */
    short y1;   /* +0x16 size 0 */
    unsigned char u1;   /* +0x18 size 0 */
    unsigned char v1;   /* +0x19 size 0 */
    unsigned short tpage;   /* +0x1A size 0 */
    unsigned char r2;   /* +0x1C size 0 */
    unsigned char g2;   /* +0x1D size 0 */
    unsigned char b2;   /* +0x1E size 0 */
    unsigned char p2;   /* +0x1F size 0 */
    short x2;   /* +0x20 size 0 */
    short y2;   /* +0x22 size 0 */
    unsigned char u2;   /* +0x24 size 0 */
    unsigned char v2;   /* +0x25 size 0 */
    unsigned short pad2;   /* +0x26 size 0 */
    unsigned char r3;   /* +0x28 size 0 */
    unsigned char g3;   /* +0x29 size 0 */
    unsigned char b3;   /* +0x2A size 0 */
    unsigned char p3;   /* +0x2B size 0 */
    short x3;   /* +0x2C size 0 */
    short y3;   /* +0x2E size 0 */
    unsigned char u3;   /* +0x30 size 0 */
    unsigned char v3;   /* +0x31 size 0 */
    unsigned short pad3;   /* +0x32 size 0 */
};   /* sizeof 52 */

typedef struct POLY_GT4 POLY_GT4;
struct LINE_F2 {   /* size 16 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    short x1;   /* +0xC size 0 */
    short y1;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct LINE_F2 LINE_F2;
struct LINE_G2 {   /* size 20 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char r1;   /* +0xC size 0 */
    unsigned char g1;   /* +0xD size 0 */
    unsigned char b1;   /* +0xE size 0 */
    unsigned char p1;   /* +0xF size 0 */
    short x1;   /* +0x10 size 0 */
    short y1;   /* +0x12 size 0 */
};   /* sizeof 20 */

typedef struct LINE_G2 LINE_G2;
struct LINE_F3 {   /* size 24 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    short x1;   /* +0xC size 0 */
    short y1;   /* +0xE size 0 */
    short x2;   /* +0x10 size 0 */
    short y2;   /* +0x12 size 0 */
    unsigned long pad;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct LINE_F3 LINE_F3;
struct LINE_G3 {   /* size 32 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char r1;   /* +0xC size 0 */
    unsigned char g1;   /* +0xD size 0 */
    unsigned char b1;   /* +0xE size 0 */
    unsigned char p1;   /* +0xF size 0 */
    short x1;   /* +0x10 size 0 */
    short y1;   /* +0x12 size 0 */
    unsigned char r2;   /* +0x14 size 0 */
    unsigned char g2;   /* +0x15 size 0 */
    unsigned char b2;   /* +0x16 size 0 */
    unsigned char p2;   /* +0x17 size 0 */
    short x2;   /* +0x18 size 0 */
    short y2;   /* +0x1A size 0 */
    unsigned long pad;   /* +0x1C size 0 */
};   /* sizeof 32 */

typedef struct LINE_G3 LINE_G3;
struct LINE_F4 {   /* size 28 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    short x1;   /* +0xC size 0 */
    short y1;   /* +0xE size 0 */
    short x2;   /* +0x10 size 0 */
    short y2;   /* +0x12 size 0 */
    short x3;   /* +0x14 size 0 */
    short y3;   /* +0x16 size 0 */
    unsigned long pad;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct LINE_F4 LINE_F4;
struct LINE_G4 {   /* size 40 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char r1;   /* +0xC size 0 */
    unsigned char g1;   /* +0xD size 0 */
    unsigned char b1;   /* +0xE size 0 */
    unsigned char p1;   /* +0xF size 0 */
    short x1;   /* +0x10 size 0 */
    short y1;   /* +0x12 size 0 */
    unsigned char r2;   /* +0x14 size 0 */
    unsigned char g2;   /* +0x15 size 0 */
    unsigned char b2;   /* +0x16 size 0 */
    unsigned char p2;   /* +0x17 size 0 */
    short x2;   /* +0x18 size 0 */
    short y2;   /* +0x1A size 0 */
    unsigned char r3;   /* +0x1C size 0 */
    unsigned char g3;   /* +0x1D size 0 */
    unsigned char b3;   /* +0x1E size 0 */
    unsigned char p3;   /* +0x1F size 0 */
    short x3;   /* +0x20 size 0 */
    short y3;   /* +0x22 size 0 */
    unsigned long pad;   /* +0x24 size 0 */
};   /* sizeof 40 */

typedef struct LINE_G4 LINE_G4;
struct SPRT {   /* size 20 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char u0;   /* +0xC size 0 */
    unsigned char v0;   /* +0xD size 0 */
    unsigned short clut;   /* +0xE size 0 */
    short w;   /* +0x10 size 0 */
    short h;   /* +0x12 size 0 */
};   /* sizeof 20 */

typedef struct SPRT SPRT;
struct SPRT_16 {   /* size 16 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    unsigned char u0;   /* +0xC size 0 */
    unsigned char v0;   /* +0xD size 0 */
    unsigned short clut;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct SPRT_16 SPRT_16;
typedef struct SPRT_16 SPRT_8;
struct TILE {   /* size 16 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
    short w;   /* +0xC size 0 */
    short h;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct TILE TILE;
struct TILE_16 {   /* size 12 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    short x0;   /* +0x8 size 0 */
    short y0;   /* +0xA size 0 */
};   /* sizeof 12 */

typedef struct TILE_16 TILE_16;
typedef struct TILE_16 TILE_8;
typedef struct TILE_16 TILE_1;
struct DR_MODE {   /* size 12 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned long code[2];   /* +0x4 size 8 */
};   /* sizeof 12 */

typedef struct DR_MODE DR_MODE;
typedef struct DR_MODE DR_TWIN;
typedef struct DR_MODE DR_AREA;
typedef struct DR_MODE DR_OFFSET;
struct DR_MOVE {   /* size 24 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned long code[5];   /* +0x4 size 20 */
};   /* sizeof 24 */

typedef struct DR_MOVE DR_MOVE;
struct DR_LOAD {   /* size 68 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned long code[3];   /* +0x4 size 12 */
    unsigned long p[13];   /* +0x10 size 52 */
};   /* sizeof 68 */

typedef struct DR_LOAD DR_LOAD;
struct DR_TPAGE {   /* size 8 */
    unsigned long tag;   /* +0x0 size 0 */
    unsigned long code[1];   /* +0x4 size 4 */
};   /* sizeof 8 */

typedef struct DR_TPAGE DR_TPAGE;
typedef struct DR_MODE DR_STP;
struct TMD_PRIM {   /* size 120 */
    unsigned long id;   /* +0x0 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char p0;   /* +0x7 size 0 */
    unsigned char r1;   /* +0x8 size 0 */
    unsigned char g1;   /* +0x9 size 0 */
    unsigned char b1;   /* +0xA size 0 */
    unsigned char p1;   /* +0xB size 0 */
    unsigned char r2;   /* +0xC size 0 */
    unsigned char g2;   /* +0xD size 0 */
    unsigned char b2;   /* +0xE size 0 */
    unsigned char p2;   /* +0xF size 0 */
    unsigned char r3;   /* +0x10 size 0 */
    unsigned char g3;   /* +0x11 size 0 */
    unsigned char b3;   /* +0x12 size 0 */
    unsigned char p3;   /* +0x13 size 0 */
    unsigned short tpage;   /* +0x14 size 0 */
    unsigned short clut;   /* +0x16 size 0 */
    unsigned char u0;   /* +0x18 size 0 */
    unsigned char v0;   /* +0x19 size 0 */
    unsigned char u1;   /* +0x1A size 0 */
    unsigned char v1;   /* +0x1B size 0 */
    unsigned char u2;   /* +0x1C size 0 */
    unsigned char v2;   /* +0x1D size 0 */
    unsigned char u3;   /* +0x1E size 0 */
    unsigned char v3;   /* +0x1F size 0 */
    struct SVECTOR x0;   /* +0x20 size 8 */
    struct SVECTOR x1;   /* +0x28 size 8 */
    struct SVECTOR x2;   /* +0x30 size 8 */
    struct SVECTOR x3;   /* +0x38 size 8 */
    struct SVECTOR n0;   /* +0x40 size 8 */
    struct SVECTOR n1;   /* +0x48 size 8 */
    struct SVECTOR n2;   /* +0x50 size 8 */
    struct SVECTOR n3;   /* +0x58 size 8 */
    struct SVECTOR *v_ofs;   /* +0x60 size 8 */
    struct SVECTOR *n_ofs;   /* +0x64 size 8 */
    unsigned short vert0;   /* +0x68 size 0 */
    unsigned short vert1;   /* +0x6A size 0 */
    unsigned short vert2;   /* +0x6C size 0 */
    unsigned short vert3;   /* +0x6E size 0 */
    unsigned short norm0;   /* +0x70 size 0 */
    unsigned short norm1;   /* +0x72 size 0 */
    unsigned short norm2;   /* +0x74 size 0 */
    unsigned short norm3;   /* +0x76 size 0 */
};   /* sizeof 120 */

typedef struct TMD_PRIM TMD_PRIM;
struct TIM_IMAGE {   /* size 20 */
    unsigned long mode;   /* +0x0 size 0 */
    struct RECT *crect;   /* +0x4 size 8 */
    unsigned long *caddr;   /* +0x8 size 0 */
    struct RECT *prect;   /* +0xC size 8 */
    unsigned long *paddr;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct TIM_IMAGE TIM_IMAGE;
typedef char CHAR;
typedef int CLSID;
typedef int SIZEL;
typedef int POINTL;
typedef unsigned long *FARPROC;
typedef unsigned long FOURCC;
typedef unsigned char *LPDRAWITEMSTRUCT;
typedef unsigned long *LPSECURITY_ATTRIBUTES;
typedef void *DLGPROC;
typedef unsigned long COLORREF;
typedef unsigned short *LPINT;
typedef unsigned long HCURSOR;
typedef unsigned long TIMERPROC;
typedef unsigned long HFONT;
typedef unsigned long CRITICAL_SECTION;
typedef unsigned long *LPCRITICAL_SECTION;
typedef long *LPTOP_LEVEL_EXCEPTION_FILTER;
typedef unsigned long REGSAM;
typedef unsigned long ATOM;
typedef unsigned long HMENU;
typedef unsigned long *PUINT;
typedef void VOID;
typedef unsigned long __int64;
typedef unsigned long DWORD;
typedef unsigned long *LPDWORD;
typedef unsigned short WORD;
typedef short SHORT;
typedef unsigned char BYTE;
typedef char *HKEY;
typedef char **PHKEY;
typedef char TCHAR;
typedef void *LPVOID;
typedef void *LPCVOID;
typedef void *LPOVERLAPPED;
typedef char *LPSTR;
typedef char *LPCSTR;
typedef char *LPTSTR;
typedef char *LPCTSTR;
typedef unsigned char *LPBYTE;
typedef long WPARAM;
typedef unsigned long LPARAM;
typedef unsigned long HWND;
typedef unsigned long HINSTANCE;
typedef unsigned long LRESULT;
typedef unsigned long HRESULT;
typedef unsigned long HANDLE;
typedef unsigned long HPALETTE;
typedef unsigned long HDC;
typedef long LONG;
typedef long *LPLONG;
typedef long *PLONG;
typedef unsigned long LCID;
typedef unsigned long HMODULE;
typedef unsigned long *LPSIZE;
typedef struct RECT HRGN;
typedef struct RECT LPCDLGTEMPLATE;
typedef struct RECT *LPCRECT;
typedef unsigned long (*WNDPROC)();
typedef unsigned long HICON;
typedef unsigned long HBRUSH;
typedef void *HTRANS;
enum .48fake {
    VK_SHIFT = 25,
    VK_TAB = 24,
    VK_NEXT = 23,
    VK_PRIOR = 22,
    VK_PAUSE = 21,
    VK_F12 = 20,
    VK_F11 = 19,
    VK_F10 = 18,
    VK_F9 = 17,
    VK_F8 = 16,
    VK_F7 = 15,
    VK_F6 = 14,
    VK_F5 = 13,
    VK_F4 = 12,
    VK_F3 = 11,
    VK_F2 = 10,
    VK_F1 = 9,
    VK_SNAPSHOT = 8,
    VK_RIGHT = 7,
    VK_LEFT = 6,
    VK_UP = 5,
    VK_DOWN = 4,
    VK_BACK = 3,
    VK_RETURN = 2,
    VK_ESCAPE = 1,
    VK_SPACE = 0,
};

struct POINT {   /* size 8 */
    long x;   /* +0x0 size 0 */
    long y;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct POINT POINT;
struct MSG {   /* size 28 */
    unsigned long hwnd;   /* +0x0 size 0 */
    unsigned int message;   /* +0x4 size 0 */
    long wParam;   /* +0x8 size 0 */
    unsigned long lParam;   /* +0xC size 0 */
    unsigned long time;   /* +0x10 size 0 */
    struct POINT pt;   /* +0x14 size 8 */
};   /* sizeof 28 */

typedef struct MSG MSG;
typedef struct MSG *LPMSG;
struct FILETIME {   /* size 8 */
    unsigned long dwLowDateTime;   /* +0x0 size 0 */
    unsigned long dwHighDateTime;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct FILETIME FILETIME;
typedef struct FILETIME *PFILETIME;
typedef struct FILETIME *LPFILETIME;
struct _WIN32_FIND_DATA {   /* size 316 */
    unsigned long dwFileAttributes;   /* +0x0 size 0 */
    struct FILETIME ftCreationTime;   /* +0x4 size 8 */
    struct FILETIME ftLastAccessTime;   /* +0xC size 8 */
    struct FILETIME ftLastWriteTime;   /* +0x14 size 8 */
    unsigned long nFileSizeHigh;   /* +0x1C size 0 */
    unsigned long nFileSizeLow;   /* +0x20 size 0 */
    unsigned long dwReserved0;   /* +0x24 size 0 */
    unsigned long dwReserved1;   /* +0x28 size 0 */
    char cFileName[256];   /* +0x2C size 256 */
    char cAlternateFileName[14];   /* +0x12C size 14 */
};   /* sizeof 316 */

typedef struct _WIN32_FIND_DATA _WIN32_FIND_DATA;
typedef struct _WIN32_FIND_DATA WIN32_FIND_DATA;
typedef struct _WIN32_FIND_DATA *LPWIN32_FIND_DATA;
struct PALETTEENTRY {   /* size 4 */
    unsigned char peRed;   /* +0x0 size 0 */
    unsigned char peGreen;   /* +0x1 size 0 */
    unsigned char peBlue;   /* +0x2 size 0 */
    unsigned char peFlags;   /* +0x3 size 0 */
};   /* sizeof 4 */

typedef struct PALETTEENTRY PALETTEENTRY;
typedef struct PALETTEENTRY *LPPALETTEENTRY;
struct PAINTSTRUCT {   /* size 32 */
    unsigned long hdc;   /* +0x0 size 0 */
    unsigned char fErase;   /* +0x4 size 0 */
    struct RECT rcPaint;   /* +0x6 size 8 */
    unsigned char fRestore;   /* +0xE size 0 */
    unsigned char fIncUpdate;   /* +0xF size 0 */
    unsigned char rgbReserved[16];   /* +0x10 size 16 */
};   /* sizeof 32 */

typedef struct PAINTSTRUCT PAINTSTRUCT;
typedef struct PAINTSTRUCT *LPPAINTSTRUCT;
struct LARGE_INTEGER {   /* size 8 */
    unsigned long LowPart;   /* +0x0 size 0 */
    unsigned long HighPart;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct LARGE_INTEGER LARGE_INTEGER;
struct GUID {   /* size 16 */
    unsigned long Data1;   /* +0x0 size 0 */
    unsigned short Data2;   /* +0x4 size 0 */
    unsigned short Data3;   /* +0x6 size 0 */
    unsigned char Data4[8];   /* +0x8 size 8 */
};   /* sizeof 16 */

typedef struct GUID GUID;
struct WAVEFORMATEX {   /* size 20 */
    unsigned short wFormatTag;   /* +0x0 size 0 */
    unsigned short nChannels;   /* +0x2 size 0 */
    unsigned long nSamplesPerSec;   /* +0x4 size 0 */
    unsigned long nAvgBytesPerSec;   /* +0x8 size 0 */
    unsigned short nBlockAlign;   /* +0xC size 0 */
    unsigned short wBitsPerSample;   /* +0xE size 0 */
    unsigned short cbSize;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct WAVEFORMATEX WAVEFORMATEX;
struct MMCKINFO {   /* size 20 */
    unsigned long ckid;   /* +0x0 size 0 */
    unsigned long cksize;   /* +0x4 size 0 */
    unsigned long fccType;   /* +0x8 size 0 */
    unsigned long dwDataOffset;   /* +0xC size 0 */
    unsigned long dwFlags;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct MMCKINFO MMCKINFO;
struct WAVEFORMAT {   /* size 16 */
    unsigned short wFormatTag;   /* +0x0 size 0 */
    unsigned short nChannels;   /* +0x2 size 0 */
    unsigned long nSamplesPerSec;   /* +0x4 size 0 */
    unsigned long nAvgBytesPerSec;   /* +0x8 size 0 */
    unsigned short nBlockAlign;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct WAVEFORMAT WAVEFORMAT;
struct PCMWAVEFORMAT {   /* size 20 */
    struct WAVEFORMAT wf;   /* +0x0 size 16 */
    unsigned short wBitsPerSample;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct PCMWAVEFORMAT PCMWAVEFORMAT;
struct VS_FIXEDFILEINFO {   /* size 52 */
    unsigned long dwSignature;   /* +0x0 size 0 */
    unsigned long dwStrucVersion;   /* +0x4 size 0 */
    unsigned long dwFileVersionMS;   /* +0x8 size 0 */
    unsigned long dwFileVersionLS;   /* +0xC size 0 */
    unsigned long dwProductVersionMS;   /* +0x10 size 0 */
    unsigned long dwProductVersionLS;   /* +0x14 size 0 */
    unsigned long dwFileFlagsMask;   /* +0x18 size 0 */
    unsigned long dwFileFlags;   /* +0x1C size 0 */
    unsigned long dwFileOS;   /* +0x20 size 0 */
    unsigned long dwFileType;   /* +0x24 size 0 */
    unsigned long dwFileSubtype;   /* +0x28 size 0 */
    unsigned long dwFileDateMS;   /* +0x2C size 0 */
    unsigned long dwFileDateLS;   /* +0x30 size 0 */
};   /* sizeof 52 */

typedef struct VS_FIXEDFILEINFO VS_FIXEDFILEINFO;
struct WNDCLASSEX {   /* size 48 */
    unsigned int cbSize;   /* +0x0 size 0 */
    unsigned int style;   /* +0x4 size 0 */
    unsigned long (*lpfnWndProc)();   /* +0x8 size 0 */
    int cbClsExtra;   /* +0xC size 0 */
    int cbWndExtra;   /* +0x10 size 0 */
    unsigned long hInstance;   /* +0x14 size 0 */
    unsigned long hIcon;   /* +0x18 size 0 */
    unsigned long hCursor;   /* +0x1C size 0 */
    unsigned long hbrBackground;   /* +0x20 size 0 */
    char *lpszMenuName;   /* +0x24 size 0 */
    char *lpszClassName;   /* +0x28 size 0 */
    unsigned long hIconSm;   /* +0x2C size 0 */
};   /* sizeof 48 */

typedef struct WNDCLASSEX WNDCLASSEX;
struct SHITEMID {   /* size 4 */
    unsigned short cb;   /* +0x0 size 0 */
    unsigned char abID[1];   /* +0x2 size 1 */
};   /* sizeof 4 */

typedef struct SHITEMID SHITEMID;
struct _ITEMIDLIST {   /* size 4 */
    struct SHITEMID mkid;   /* +0x0 size 4 */
};   /* sizeof 4 */

typedef struct _ITEMIDLIST _ITEMIDLIST;
typedef struct _ITEMIDLIST ITEMIDLIST;
typedef struct _ITEMIDLIST *LPITEMIDLIST;
typedef struct _ITEMIDLIST *LPCITEMIDLIST;
struct _HSTRANS {   /* size 4 */
    int unused;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct _HSTRANS _HSTRANS;
typedef struct _HSTRANS *HSTRANS;
struct SIZE {   /* size 8 */
    int cx;   /* +0x0 size 0 */
    int cy;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct SIZE SIZE;
struct TBMP {   /* size 272 */
    unsigned char *data;   /* +0x0 size 0 */
    struct SIZE datasize;   /* +0x4 size 8 */
    long userdata;   /* +0xC size 0 */
    char text[256];   /* +0x10 size 256 */
};   /* sizeof 272 */

typedef struct TBMP TBMP;
typedef struct TBMP *TPBMP;
struct UIRECT {   /* size 16 */
    long left;   /* +0x0 size 0 */
    long top;   /* +0x4 size 0 */
    long right;   /* +0x8 size 0 */
    long bottom;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct UIRECT UIRECT;
typedef struct UIRECT *LPUIRECT;
struct MSFX {   /* size 2 */
    unsigned short pszName;   /* +0x0 size 0 */
};   /* sizeof 2 */

typedef struct MSFX MSFX;
struct CKINFO {   /* size 8 */
    unsigned long dwSize;   /* +0x0 size 0 */
    unsigned long dwOffset;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct CKINFO CKINFO;
struct TSnd {   /* size 1 */
};   /* sizeof 1 */

typedef struct TSnd TSnd;
struct TSFX {   /* size 4 */
    unsigned char Channel;   /* +0x0 size 0 */
    unsigned char bFlags;   /* +0x1 size 0 */
    unsigned short pszName;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct TSFX TSFX;
enum .65fake {
    NUM_MUSIC = 6,
    TMUSIC_INTRO = 5,
    TMUSIC_L4 = 4,
    TMUSIC_L3 = 3,
    TMUSIC_L2 = 2,
    TMUSIC_L1 = 1,
    TMUSIC_TOWN = 0,
};

enum .66fake {
    TRN_MAGE_CNSELBK = 66,
    TRN_MAGE_CNSELGD = 65,
    TRN_MAGE_CNSELG = 64,
    TRN_SUCC_SUCCBW = 63,
    TRN_SUCC_SUCCRW = 62,
    TRN_SUCC_SUCCB = 61,
    TRN_BLACK_BLKKNTBE = 60,
    TRN_BLACK_BLKKNTBT = 59,
    TRN_BLACK_BLKKNTRT = 58,
    TRN_SNAKE_SNAKB = 57,
    TRN_SNAKE_SNAKG = 56,
    TRN_SNAKE_SNAKR = 55,
    TRN_MEGA_BALR = 54,
    TRN_MEGA_VTEXL = 53,
    TRN_MEGA_GUARD = 52,
    TRN_GARGOYLE_GARGB = 51,
    TRN_GARGOYLE_GARGBR = 50,
    TRN_GARGOYLE_GARE = 49,
    TRN_THIN_THINV1 = 48,
    TRN_THIN_THINV2 = 47,
    TRN_THIN_THINV3 = 46,
    TRN_RHINO_RHINOB = 45,
    TRN_RHINO_BLUE = 44,
    TRN_RHINO_ORANGE = 43,
    TRN_MAGMA_WIERD = 42,
    TRN_MAGMA_BLUE = 41,
    TRN_MAGMA_YELLOW = 40,
    TRN_FAT_FATF = 39,
    TRN_FAT_FATB = 38,
    TRN_FAT_BLUE = 37,
    TRN_ACID_ACIDR = 36,
    TRN_ACID_ACIDB = 35,
    TRN_ACID_ACIDBLK = 34,
    TRN_GOATBOW_GRAY = 33,
    TRN_GOATBOW_RED = 32,
    TRN_GOATBOW_BEIGE = 31,
    TRN_BAT_ORANGE = 30,
    TRN_BAT_GREY = 29,
    TRN_BAT_RED = 28,
    TRN_GOATMACE_GRAY = 27,
    TRN_GOATMACE_RED = 26,
    TRN_GOATMACE_BEIGE = 25,
    TRN_SNEAK_SNEAKV1 = 24,
    TRN_SNEAK_SNEAKV3 = 23,
    TRN_SNEAK_SNEAKV2 = 22,
    TRN_SKELSD_BLACK = 21,
    TRN_SKELSD_SKELT = 20,
    TRN_SKELSD_WHITE = 19,
    TRN_SKELBOW_BLACK = 18,
    TRN_SKELBOW_SKELT = 17,
    TRN_SKELBOW_WHITE = 16,
    TRN_SCAV_SCAVW = 15,
    TRN_SCAV_SCAVBE = 14,
    TRN_SCAV_SCAVBR = 13,
    TRN_FALSWORD_BLUE = 12,
    TRN_FALSWORD_DARK = 11,
    TRN_FALSWORD_FALLENT = 10,
    TRN_SKELAXE_BLACK = 9,
    TRN_SKELAXE_SKELT = 8,
    TRN_SKELAXE_WHITE = 7,
    TRN_FALSPEAR_BLUE = 6,
    TRN_FALSPEAR_DARK = 5,
    TRN_FALSPEAR_FALLENT = 4,
    TRN_ZOMBIE_YELLOW = 3,
    TRN_ZOMBIE_GREY = 2,
    TRN_ZOMBIE_BLUERED = 1,
    TRN_PAL_NULL = 0,
};

struct AnimStruct {   /* size 2 */
    char Frames;   /* +0x0 size 0 */
    char Rate;   /* +0x1 size 0 */
};   /* sizeof 2 */

typedef struct AnimStruct AnimStruct;
struct MonsterData {   /* size 60 */
    unsigned short GraphicType;   /* +0x0 size 0 */
    unsigned char has_special;   /* +0x2 size 0 */
    unsigned short sndfile;   /* +0x4 size 0 */
    unsigned char snd_special;   /* +0x6 size 0 */
    char TransFile;   /* +0x7 size 0 */
    char Frames[6];   /* +0x8 size 6 */
    char Rate[6];   /* +0xE size 6 */
    int mName;   /* +0x14 size 0 */
    char mMinDLvl;   /* +0x18 size 0 */
    char mMaxDLvl;   /* +0x19 size 0 */
    char mLevel;   /* +0x1A size 0 */
    short mMinHP;   /* +0x1C size 0 */
    short mMaxHP;   /* +0x1E size 0 */
    unsigned char mAi;   /* +0x20 size 0 */
    unsigned short mFlags;   /* +0x22 size 0 */
    unsigned char mInt;   /* +0x24 size 0 */
    unsigned char mHit;   /* +0x25 size 0 */
    unsigned char mAFNum;   /* +0x26 size 0 */
    unsigned char mMinDamage;   /* +0x27 size 0 */
    unsigned char mMaxDamage;   /* +0x28 size 0 */
    unsigned char mHit2;   /* +0x29 size 0 */
    unsigned char mAFNum2;   /* +0x2A size 0 */
    unsigned char mMinDamage2;   /* +0x2B size 0 */
    unsigned char mMaxDamage2;   /* +0x2C size 0 */
    char mArmorClass;   /* +0x2D size 0 */
    char mMonstClass;   /* +0x2E size 0 */
    unsigned short mMagicRes;   /* +0x30 size 0 */
    unsigned short mMagicRes2;   /* +0x32 size 0 */
    unsigned short mTreasure;   /* +0x34 size 0 */
    char mSelFlag;   /* +0x36 size 0 */
    unsigned short mExp;   /* +0x38 size 0 */
};   /* sizeof 60 */

typedef struct MonsterData MonsterData;
struct CMonster {   /* size 28 */
    struct MonsterData *MData;   /* +0x0 size 60 */
    struct AnimStruct Anims[6];   /* +0x4 size 12 */
    unsigned short Snds;   /* +0x10 size 0 */
    unsigned char mtype;   /* +0x12 size 0 */
    unsigned char mPlaceFlags;   /* +0x13 size 0 */
    unsigned char mMinHP;   /* +0x14 size 0 */
    unsigned char mMaxHP;   /* +0x15 size 0 */
    unsigned char has_special;   /* +0x16 size 0 */
    unsigned char mAFNum;   /* +0x17 size 0 */
    char mdeadval;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct CMonster CMonster;
struct MonsterStruct {   /* size 104 */
    int mtalkmsg;   /* +0x0 size 0 */
    int _mgoalvar1;   /* +0x4 size 0 */
    int _mgoalvar2;   /* +0x8 size 0 */
    int _mgoalvar3;   /* +0xC size 0 */
    int _mhitpoints;   /* +0x10 size 0 */
    int _mmaxhp;   /* +0x14 size 0 */
    short _mVar1;   /* +0x18 size 0 */
    short _mVar2;   /* +0x1A size 0 */
    short _mVar3;   /* +0x1C size 0 */
    short _mVar4;   /* +0x1E size 0 */
    short _mVar5;   /* +0x20 size 0 */
    short _mVar6;   /* +0x22 size 0 */
    short _mVar7;   /* +0x24 size 0 */
    short _mVar8;   /* +0x26 size 0 */
    short _mxvel;   /* +0x28 size 0 */
    short _myvel;   /* +0x2A size 0 */
    unsigned short _mFlags;   /* +0x2C size 0 */
    unsigned short mExp;   /* +0x2E size 0 */
    unsigned short mMagicRes;   /* +0x30 size 0 */
    char _mMTidx;   /* +0x32 size 0 */
    char _mmode;   /* +0x33 size 0 */
    char _mx;   /* +0x34 size 0 */
    char _my;   /* +0x35 size 0 */
    char _mfutx;   /* +0x36 size 0 */
    char _mfuty;   /* +0x37 size 0 */
    char _moldx;   /* +0x38 size 0 */
    char _moldy;   /* +0x39 size 0 */
    char _mxoff;   /* +0x3A size 0 */
    char _myoff;   /* +0x3B size 0 */
    char _mdir;   /* +0x3C size 0 */
    unsigned char _menemy;   /* +0x3D size 0 */
    char _mAnimDelay;   /* +0x3E size 0 */
    char _mAnimCnt;   /* +0x3F size 0 */
    char _mAnimLen;   /* +0x40 size 0 */
    char _mAnimFrame;   /* +0x41 size 0 */
    char _mAFNum;   /* +0x42 size 0 */
    char _lastx;   /* +0x43 size 0 */
    char _lasty;   /* +0x44 size 0 */
    char _udeadval;   /* +0x45 size 0 */
    char mWhoHit;   /* +0x46 size 0 */
    char mLevel;   /* +0x47 size 0 */
    char mArmorClass;   /* +0x48 size 0 */
    unsigned char _mgoal;   /* +0x49 size 0 */
    unsigned char _menemyx;   /* +0x4A size 0 */
    unsigned char _menemyy;   /* +0x4B size 0 */
    unsigned char _mAi;   /* +0x4C size 0 */
    unsigned char _mint;   /* +0x4D size 0 */
    unsigned char _msquelch;   /* +0x4E size 0 */
    unsigned char _uniqtype;   /* +0x4F size 0 */
    unsigned char mHit;   /* +0x50 size 0 */
    unsigned char mMinDamage;   /* +0x51 size 0 */
    unsigned char mMaxDamage;   /* +0x52 size 0 */
    unsigned char mHit2;   /* +0x53 size 0 */
    unsigned char mMinDamage2;   /* +0x54 size 0 */
    unsigned char mMaxDamage2;   /* +0x55 size 0 */
    unsigned char leader;   /* +0x56 size 0 */
    unsigned char leaderflag;   /* +0x57 size 0 */
    unsigned char packsize;   /* +0x58 size 0 */
    unsigned char mlid;   /* +0x59 size 0 */
    char Action;   /* +0x5A size 0 */
    char _mDelFlag;   /* +0x5B size 0 */
    int mName;   /* +0x5C size 0 */
    struct CMonster *MType;   /* +0x60 size 28 */
    struct MonsterData *MData;   /* +0x64 size 60 */
};   /* sizeof 104 */

typedef struct MonsterStruct MonsterStruct;
struct UniqMonstStruct {   /* size 24 */
    char mtype;   /* +0x0 size 0 */
    unsigned short mName;   /* +0x2 size 0 */
    unsigned char mlevel;   /* +0x4 size 0 */
    unsigned short mmaxhp;   /* +0x6 size 0 */
    unsigned char mAi;   /* +0x8 size 0 */
    unsigned char mint;   /* +0x9 size 0 */
    unsigned char mMinDamage;   /* +0xA size 0 */
    unsigned char mMaxDamage;   /* +0xB size 0 */
    unsigned short mMagicRes;   /* +0xC size 0 */
    unsigned short mUnqAttr;   /* +0xE size 0 */
    unsigned char mUnqVar1;   /* +0x10 size 0 */
    unsigned char mUnqVar2;   /* +0x11 size 0 */
    int mtalkmsg;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct UniqMonstStruct UniqMonstStruct;
enum .72fake {
    MG_FIREMAN = 33,
    MG_UNRAV = 32,
    MG_MEGA = 31,
    MG_THIN = 30,
    MG_DIABLO = 29,
    MG_SKELBOW = 28,
    MG_RHINO = 27,
    MG_GOATLORD = 26,
    MG_WORM = 25,
    MG_ZOMBIE = 24,
    MG_TSNEAK = 23,
    MG_SUCC = 22,
    MG_SNEAK = 21,
    MG_SNAKE = 20,
    MG_SKING = 19,
    MG_SKELSD = 18,
    MG_SKELAXE = 17,
    MG_SCAV = 16,
    MG_MAGMA = 15,
    MG_MAGE = 14,
    MG_GOLEM = 13,
    MG_GOATMACE = 12,
    MG_GOATBOW = 11,
    MG_GARGOYLE = 10,
    MG_FATC = 9,
    MG_FAT = 8,
    MG_FALSWORD = 7,
    MG_FALSPEAR = 6,
    MG_DEMSKEL = 5,
    MG_DARKMAGE = 4,
    MG_BLACK = 3,
    MG_BIGFALL = 2,
    MG_BAT = 1,
    MG_ACID = 0,
};

struct STONEPAL {   /* size 8 */
    unsigned char NoStonePals;   /* +0x0 size 0 */
    int StonePal;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct STONEPAL STONEPAL;
enum .73fake {
    SYS_PLAYER_LOAD = 32770,
    SYS_GAMEOVER = 32769,
    SYS_TASK = 32768,
    TSK_CUTSCREEN = 16387,
    TSK_MONSTER_CHOOSE = 16386,
    TSK_BACKGROUND = 16385,
    TSK_GAMETASK = 16384,
    TSK_NOENUM = 0,
};

enum MEM_TYPES {
    MT_POST_QUIT = 5,
    MT_IN_GAME = 4,
    MT_POST_EXIT = 3,
    MT_DEMO = 2,
    MT_FRONTEND = 1,
    MT_NONE = 0,
};

typedef enum MEM_TYPES MEM_TYPES;
struct DEF_ARGS {   /* size 16 */
    unsigned long a0;   /* +0x0 size 0 */
    unsigned long a1;   /* +0x4 size 0 */
    unsigned long a2;   /* +0x8 size 0 */
    unsigned long a3;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct DEF_ARGS DEF_ARGS;
typedef int jmp_buf[12];
typedef long MHANDLE;
typedef int MTYPE;
typedef void (*GAL_FILTER)();
enum .74fake {
    GAL_FLAGS = 32768,
    GAL_HIGH = 32768,
    GAL_FIRST_FREE_MEM_TYPE = 1,
    GAL_PHANTOM_MEM = 0,
};

enum GAL_ERROR_CODE {
    NUM_OF_ERROR_MESSAGES = 10,
    ERR_GAL_NO_MEM_MOVE = 9,
    ERR_GAL_MEM_AREA_NOT_COVERED = 8,
    ERR_GAL_MEM_BLOCK_COLLISION = 7,
    ERR_GAL_MEM_ALREADY_UNLOCKED = 6,
    ERR_GAL_INVALID_MEM_HANDLE = 5,
    ERR_GAL_INVALID_MEM_TYPE = 4,
    ERR_GAL_MEM_TYPE_OVERLAP = 3,
    ERR_GAL_MEM_TYPE_EXISTS = 2,
    ERR_RUN_OUT_OF_MEM_HDRS = 1,
    ERR_GAL_NO_ERROR = 0,
};

typedef enum GAL_ERROR_CODE GAL_ERROR_CODE;
enum GAL_VERB_LEV {
    GAL_NOISY = 2,
    GAL_AVERAGE = 1,
    GAL_SILENT = 0,
};

typedef enum GAL_VERB_LEV GAL_VERB_LEV;
struct MEM_INIT_INFO {   /* size 40 */
    void *Mem;   /* +0x0 size 0 */
    unsigned long Size;   /* +0x4 size 0 */
    unsigned long Type;   /* +0x8 size 0 */
    char *TypeString;   /* +0xC size 0 */
    unsigned short Alignment;   /* +0x10 size 0 */
    void (*MemMove)();   /* +0x14 size 0 */
    struct MEM_INIT_INFO *NextInitBlock;   /* +0x18 size 40 */
    unsigned short Flags;   /* +0x1C size 0 */
    struct MEM_HDR *Empty;   /* +0x20 size 0 */
    struct MEM_HDR *Used;   /* +0x24 size 0 */
};   /* sizeof 40 */

typedef struct MEM_INIT_INFO MEM_INIT_INFO;
struct GAL_STRUCT {   /* size 8 */
    int OriginalSize;   /* +0x0 size 0 */
    unsigned int Offset;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct GAL_STRUCT GAL_STRUCT;
struct TASK {   /* size 92 */
    struct TASK *Next;   /* +0x0 size 92 */
    struct TASK *Prev;   /* +0x4 size 92 */
    unsigned long Id;   /* +0x8 size 0 */
    unsigned long SleepTime;   /* +0xC size 0 */
    unsigned long fToInit : 1;   /* bit 128 */
    unsigned long fToDie : 1;   /* bit 129 */
    unsigned long fKillable : 1;   /* bit 130 */
    unsigned long fActive : 1;   /* bit 131 */
    unsigned long fXtraStack : 1;   /* bit 132 */
    void *Stack;   /* +0x14 size 0 */
    unsigned long StackSize;   /* +0x18 size 0 */
    void *Data;   /* +0x1C size 0 */
    int TskEnv[12];   /* +0x20 size 48 */
    void (*Main)();   /* +0x50 size 0 */
    long hndTask;   /* +0x54 size 0 */
    unsigned short XtraLongs;   /* +0x58 size 0 */
    unsigned short MaxStackSizeBytes;   /* +0x5A size 0 */
};   /* sizeof 92 */

typedef struct TASK TASK;
typedef void (*TSK_CBACK)();
typedef void (*DOTSK_CBACK)();
enum LANG_TYPE {
    LANG_NONE = 5,
    LANG_JAP = 4,
    LANG_SWEDISH = 3,
    LANG_GERMAN = 2,
    LANG_FRENCH = 1,
    LANG_ENGLISH = 0,
};

typedef enum LANG_TYPE LANG_TYPE;
enum LANG_DB_NO {
    LANG_DB_CREDITS = 3,
    LANG_DB_BACK = 2,
    LANG_DB_QUEST = 1,
    LANG_DB_MAIN = 0,
};

typedef enum LANG_DB_NO LANG_DB_NO;
enum GM_SPEEDS {
    GM_FAST = 1,
    GM_SLOW = 0,
};

typedef enum GM_SPEEDS GM_SPEEDS;
struct tab_entry {   /* size 2 */
    unsigned char a;   /* +0x0 size 0 */
    unsigned char b;   /* +0x1 size 0 */
};   /* sizeof 2 */

typedef struct tab_entry tab_entry;
enum _item_indexes {
    IDI_RESURRECT = 34,
    IDI_LAZSTAFF = 33,
    IDI_LGTFORGE = 32,
    IDI_GRISWOLD = 31,
    IDI_FULLMANA = 30,
    IDI_FULLHEAL = 29,
    IDI_ARMOFVAL = 28,
    IDI_PORTAL = 27,
    IDI_IDENTIFY = 26,
    IDI_MANA = 25,
    IDI_HEAL = 24,
    IDI_EAR = 23,
    IDI_LASTQUEST = 22,
    IDI_MAPOFDOOM = 22,
    IDI_BLDSTONE = 21,
    IDI_SPECELIX = 20,
    IDI_FUNGALTM = 19,
    IDI_BRAIN = 18,
    IDI_MUSHROOM = 17,
    IDI_ANVIL = 16,
    IDI_GLDNELIX = 15,
    IDI_STEELVEIL = 14,
    IDI_HARCREST = 13,
    IDI_BANNER = 12,
    IDI_TRING = 11,
    IDI_OPTAMULET = 10,
    IDI_ROCK = 9,
    IDI_INFRARING = 8,
    IDI_SKCROWN = 7,
    IDI_CLEAVER = 6,
    IDI_FIRSTQUEST = 6,
    IDI_SORCEROR = 5,
    IDI_ROGUE = 4,
    IDI_WARRCLUB = 3,
    IDI_WARRSHLD = 2,
    IDI_WARRIOR = 1,
    IDI_GOLD = 0,
};

typedef enum _item_indexes _item_indexes;
struct PLStruct {   /* size 40 */
    int PLName;   /* +0x0 size 0 */
    int PLPower;   /* +0x4 size 0 */
    int PLParam1;   /* +0x8 size 0 */
    int PLParam2;   /* +0xC size 0 */
    char PLMinLvl;   /* +0x10 size 0 */
    long PLIType;   /* +0x14 size 0 */
    unsigned char PLGOE;   /* +0x18 size 0 */
    unsigned char PLDouble;   /* +0x19 size 0 */
    unsigned char PLOk;   /* +0x1A size 0 */
    int PLMinVal;   /* +0x1C size 0 */
    int PLMaxVal;   /* +0x20 size 0 */
    int PLMultVal;   /* +0x24 size 0 */
};   /* sizeof 40 */

typedef struct PLStruct PLStruct;
struct UItemStruct {   /* size 84 */
    int UIName;   /* +0x0 size 0 */
    char UIItemId;   /* +0x4 size 0 */
    char UIMinLvl;   /* +0x5 size 0 */
    char UINumPL;   /* +0x6 size 0 */
    int UIValue;   /* +0x8 size 0 */
    char UIPower1;   /* +0xC size 0 */
    int UIParam1;   /* +0x10 size 0 */
    int UIParam2;   /* +0x14 size 0 */
    char UIPower2;   /* +0x18 size 0 */
    int UIParam3;   /* +0x1C size 0 */
    int UIParam4;   /* +0x20 size 0 */
    char UIPower3;   /* +0x24 size 0 */
    int UIParam5;   /* +0x28 size 0 */
    int UIParam6;   /* +0x2C size 0 */
    char UIPower4;   /* +0x30 size 0 */
    int UIParam7;   /* +0x34 size 0 */
    int UIParam8;   /* +0x38 size 0 */
    char UIPower5;   /* +0x3C size 0 */
    int UIParam9;   /* +0x40 size 0 */
    int UIParam10;   /* +0x44 size 0 */
    char UIPower6;   /* +0x48 size 0 */
    int UIParam11;   /* +0x4C size 0 */
    int UIParam12;   /* +0x50 size 0 */
};   /* sizeof 84 */

typedef struct UItemStruct UItemStruct;
struct ItemDataStruct {   /* size 32 */
    unsigned char iRnd;   /* +0x0 size 0 */
    char iClass;   /* +0x1 size 0 */
    char iLoc;   /* +0x2 size 0 */
    unsigned char iCurs;   /* +0x3 size 0 */
    char itype;   /* +0x4 size 0 */
    char iItemId;   /* +0x5 size 0 */
    unsigned short iName;   /* +0x6 size 0 */
    unsigned short iSName;   /* +0x8 size 0 */
    char iMinMLvl;   /* +0xA size 0 */
    unsigned char iDurability;   /* +0xB size 0 */
    unsigned char iMinDam;   /* +0xC size 0 */
    unsigned char iMaxDam;   /* +0xD size 0 */
    unsigned char iMinAC;   /* +0xE size 0 */
    unsigned char iMaxAC;   /* +0xF size 0 */
    char iMinStr;   /* +0x10 size 0 */
    char iMinMag;   /* +0x11 size 0 */
    char iMinDex;   /* +0x12 size 0 */
    long iFlags;   /* +0x14 size 0 */
    unsigned char iMiscId;   /* +0x18 size 0 */
    unsigned char iSpell;   /* +0x19 size 0 */
    unsigned char iUsable;   /* +0x1A size 0 */
    unsigned short iValue;   /* +0x1C size 0 */
    unsigned short iMaxValue;   /* +0x1E size 0 */
};   /* sizeof 32 */

typedef struct ItemDataStruct ItemDataStruct;
struct ItemGetRecordStruct {   /* size 16 */
    int nSeed;   /* +0x0 size 0 */
    unsigned short wCI;   /* +0x4 size 0 */
    int nIndex;   /* +0x8 size 0 */
    unsigned long dwTimestamp;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct ItemGetRecordStruct ItemGetRecordStruct;
struct ItemStruct {   /* size 108 */
    int _iVAdd1;   /* +0x0 size 0 */
    int _iVMult1;   /* +0x4 size 0 */
    int _iVAdd2;   /* +0x8 size 0 */
    int _iVMult2;   /* +0xC size 0 */
    int _iSeed;   /* +0x10 size 0 */
    int _ivalue;   /* +0x14 size 0 */
    int _iIvalue;   /* +0x18 size 0 */
    long _iFlags;   /* +0x1C size 0 */
    int _iPLAC;   /* +0x20 size 0 */
    unsigned short _iCreateInfo;   /* +0x24 size 0 */
    unsigned short _iName;   /* +0x26 size 0 */
    unsigned short _iIName;   /* +0x28 size 0 */
    unsigned short ItemFrame;   /* +0x2A size 0 */
    short _itype;   /* +0x2C size 0 */
    short IDidx;   /* +0x2E size 0 */
    short _iPLMana;   /* +0x30 size 0 */
    short _iPLHP;   /* +0x32 size 0 */
    char _iUid;   /* +0x34 size 0 */
    short _iPLToHit;   /* +0x36 size 0 */
    short _iPLDam;   /* +0x38 size 0 */
    char _iPLDamMod;   /* +0x3A size 0 */
    char _iMinDam;   /* +0x3B size 0 */
    char _iMaxDam;   /* +0x3C size 0 */
    char _iSpell;   /* +0x3D size 0 */
    short _iDurability;   /* +0x3E size 0 */
    short _iMaxDur;   /* +0x40 size 0 */
    char _iPLGetHit;   /* +0x42 size 0 */
    char _iPLLight;   /* +0x43 size 0 */
    char _iFMinDam;   /* +0x44 size 0 */
    char _iFMaxDam;   /* +0x45 size 0 */
    char _iLMinDam;   /* +0x46 size 0 */
    char _iLMaxDam;   /* +0x47 size 0 */
    char _iPLEnAc;   /* +0x48 size 0 */
    unsigned char _iCharges;   /* +0x49 size 0 */
    char _iAC;   /* +0x4A size 0 */
    unsigned char _iMaxCharges;   /* +0x4B size 0 */
    unsigned char _iCurs;   /* +0x4C size 0 */
    unsigned char _iMiscId;   /* +0x4D size 0 */
    char _iAnimLen;   /* +0x4E size 0 */
    char _iAnimFrame;   /* +0x4F size 0 */
    char _iSelFlag;   /* +0x50 size 0 */
    char _iMagical;   /* +0x51 size 0 */
    char _ix;   /* +0x52 size 0 */
    char _iy;   /* +0x53 size 0 */
    char _iLoc;   /* +0x54 size 0 */
    char _iClass;   /* +0x55 size 0 */
    char _iPLStr;   /* +0x56 size 0 */
    char _iPLMag;   /* +0x57 size 0 */
    char _iPLDex;   /* +0x58 size 0 */
    char _iPLVit;   /* +0x59 size 0 */
    char _iPLFR;   /* +0x5A size 0 */
    char _iPLLR;   /* +0x5B size 0 */
    char _iPLMR;   /* +0x5C size 0 */
    char _iSplLvlAdd;   /* +0x5D size 0 */
    char _iRequest;   /* +0x5E size 0 */
    char _iPrePower;   /* +0x5F size 0 */
    char _iSufPower;   /* +0x60 size 0 */
    unsigned char _iMinStr;   /* +0x61 size 0 */
    unsigned char _iMinDex;   /* +0x62 size 0 */
    char _oldlight;   /* +0x63 size 0 */
    unsigned char _iMinMag;   /* +0x64 size 0 */
    char _PlrCreate;   /* +0x65 size 0 */
    char _iStatFlag;   /* +0x66 size 0 */
    char _iPostDraw;   /* +0x67 size 0 */
    char _iAnimFlag;   /* +0x68 size 0 */
    char _iIdentified;   /* +0x69 size 0 */
};   /* sizeof 108 */

typedef struct ItemStruct ItemStruct;
enum B_PER_PIX {
    BITS_8 = 2,
    BITS_5 = 1,
    BITS_4 = 0,
};

typedef enum B_PER_PIX B_PER_PIX;
struct FRAME_HDR {   /* size 12 */
    unsigned int FrOffset : 32;   /* bit 0 */
    int X : 8;   /* bit 32 */
    int Y : 8;   /* bit 40 */
    unsigned int PalNum : 8;   /* bit 48 */
    unsigned int NotTrans : 1;   /* bit 56 */
    unsigned int Rotated : 1;   /* bit 57 */
    unsigned int InVRAM : 1;   /* bit 58 */
    unsigned int CompType : 2;   /* bit 59 */
    unsigned int Floor : 1;   /* bit 61 */
    unsigned int Cycle : 1;   /* bit 62 */
    unsigned int pad : 1;   /* bit 63 */
    unsigned int W : 9;   /* bit 64 */
    unsigned int H : 9;   /* bit 73 */
    unsigned int PentaGram : 1;   /* bit 82 */
    unsigned int pad2 : 13;   /* bit 83 */
};   /* sizeof 12 */

typedef struct FRAME_HDR FRAME_HDR;
struct SysObj {   /* size 4 */
    long MemHnd;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct SysObj SysObj;
typedef BOOL (*STR_CB_PTR)();
struct FileIO {   /* size 20 */
    struct SysObj SysObj;   /* +0x0 size 4 */
    unsigned long MemId;   /* +0x4 size 0 */
    long hndPath;   /* +0x8 size 0 */
    char *SearchPath;   /* +0xC size 0 */
    struct __vtbl_ptr_type (*.vf)[7];   /* +0x10 size 4 */
};   /* sizeof 20 */

typedef struct FileIO FileIO;
enum .80fake {
    FAST_RAM = 2,
    WORK_RAM = 1,
};

struct CPart {   /* size 8 */
    unsigned long Piece;   /* +0x0 size 0 */
    short X;   /* +0x4 size 0 */
    short Y;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct CPart CPart;
struct CBlock {   /* size 12 */
    unsigned long NumOfParts;   /* +0x0 size 0 */
    struct CPart Parts[1];   /* +0x4 size 8 */
};   /* sizeof 12 */

typedef struct CBlock CBlock;
struct CBlockHdr {   /* size 16 */
    unsigned long NumOfBlocks;   /* +0x0 size 0 */
    struct CBlock Blocks[1];   /* +0x4 size 12 */
};   /* sizeof 16 */

typedef struct CBlockHdr CBlockHdr;
struct PAL {   /* size 8 */
    unsigned int InVram : 1;   /* bit 0 */
    unsigned int NumOfCols : 31;   /* bit 1 */
    unsigned short Cols[1];   /* +0x4 size 2 */
};   /* sizeof 8 */

typedef struct PAL PAL;
struct PAL_INVRAM {   /* size 4 */
    unsigned int InVram : 1;   /* bit 0 */
    unsigned int Pad : 15;   /* bit 1 */
    unsigned int clut : 16;   /* bit 16 */
};   /* sizeof 4 */

typedef struct PAL_INVRAM PAL_INVRAM;
struct DECOMP_BUFFER {   /* size 8 */
    unsigned long TpX;   /* +0x0 size 0 */
    unsigned long TpY;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct DECOMP_BUFFER DECOMP_BUFFER;
struct ALL_DECOMP_BUFFERS {   /* size 12 */
    unsigned long NumOfBuffers;   /* +0x0 size 0 */
    struct DECOMP_BUFFER TheBuffers[1];   /* +0x4 size 8 */
};   /* sizeof 12 */

typedef struct ALL_DECOMP_BUFFERS ALL_DECOMP_BUFFERS;
struct SPR_HDR {   /* size 40 */
    unsigned int DecompOffset : 32;   /* bit 0 */
    unsigned int CreatureOffset : 32;   /* bit 32 */
    unsigned int PalOffset : 32;   /* bit 64 */
    unsigned int FrameOffset : 32;   /* bit 96 */
    unsigned int BaseFrame : 32;   /* bit 128 */
    unsigned int DestTPage : 32;   /* bit 160 */
    unsigned int ComponentOffset : 32;   /* bit 192 */
    unsigned int NumOfCreatures : 32;   /* bit 224 */
    unsigned int NumOfFrames : 16;   /* bit 256 */
    unsigned int NumOfPals : 16;   /* bit 272 */
    unsigned int TWidth : 8;   /* bit 288 */
    unsigned int THeight : 8;   /* bit 296 */
    unsigned int IsTiles : 8;   /* bit 304 */
    unsigned int Spare : 8;   /* bit 312 */
};   /* sizeof 40 */

typedef struct SPR_HDR SPR_HDR;
struct TP_LOAD_HDR {   /* size 4 */
    unsigned int U : 8;   /* bit 0 */
    unsigned int V : 8;   /* bit 8 */
    unsigned int tpage : 16;   /* bit 16 */
};   /* sizeof 4 */

typedef struct TP_LOAD_HDR TP_LOAD_HDR;
struct CTextFileInfo {   /* size 4 */
    char *FileName;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct CTextFileInfo CTextFileInfo;
struct CCreatureAction {   /* size 14 */
    unsigned short BaseFrame;   /* +0x0 size 0 */
    unsigned char NumOfFrames;   /* +0x2 size 0 */
    unsigned char NumOfPhysFrames;   /* +0x3 size 0 */
    unsigned char DirRemap[8];   /* +0x4 size 8 */
    unsigned char AnimRemap[1];   /* +0xC size 1 */
};   /* sizeof 14 */

typedef struct CCreatureAction CCreatureAction;
struct CCreatureHdr {   /* size 20 */
    long NumOfActions;   /* +0x0 size 0 */
    struct CCreatureAction Cr;   /* +0x4 size 14 */
};   /* sizeof 20 */

typedef struct CCreatureHdr CCreatureHdr;
struct TextDat {   /* size 112 */
    BOOL OwnDat;   /* +0x0 size 0 */
    int TexNum;   /* +0x4 size 0 */
    int LastFrame;   /* +0x8 size 0 */
    BOOL DatLoaded;   /* +0xC size 0 */
    long hndDat;   /* +0x10 size 0 */
    long hndHdr;   /* +0x14 size 0 */
    long hndPalOffset;   /* +0x18 size 0 */
    long hndCreatureOffset;   /* +0x1C size 0 */
    long hndBlockOffsets;   /* +0x20 size 0 */
    struct FRAME_HDR *Frames;   /* +0x24 size 12 */
    struct SPR_HDR *Hdr;   /* +0x28 size 40 */
    void *Pals;   /* +0x2C size 0 */
    int *PalOffset;   /* +0x30 size 0 */
    int *CreatureOffset;   /* +0x34 size 0 */
    unsigned char *CreatureAnims;   /* +0x38 size 0 */
    unsigned char *Blocks;   /* +0x3C size 0 */
    BOOL Loaded;   /* +0x40 size 0 */
    int LoadCount;   /* +0x44 size 0 */
    struct CTextFileInfo *FileInfo;   /* +0x48 size 4 */
    long hndDecompBuffer;   /* +0x4C size 0 */
    int DecX;   /* +0x50 size 0 */
    int DecY;   /* +0x54 size 0 */
    int PalX;   /* +0x58 size 0 */
    int PalY;   /* +0x5C size 0 */
    int Scr;   /* +0x60 size 0 */
    int NumOfBuffers[2];   /* +0x64 size 8 */
    long hndDecompArrays;   /* +0x6C size 0 */
};   /* sizeof 112 */

typedef struct TextDat TextDat;
struct CScreen {   /* size 124 */
    struct TextDat TextDat;   /* +0x0 size 112 */
    int LoadedId;   /* +0x70 size 0 */
    int TpX;   /* +0x74 size 0 */
    int TpY;   /* +0x78 size 0 */
};   /* sizeof 124 */

typedef struct CScreen CScreen;
struct OBJ_LOAD_INFO {   /* size 4 */
    short Creature;   /* +0x0 size 0 */
    unsigned short TexDat;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct OBJ_LOAD_INFO OBJ_LOAD_INFO;
struct ObjDataStruct {   /* size 18 */
    char oload;   /* +0x0 size 0 */
    char ofindex;   /* +0x1 size 0 */
    char ominlvl;   /* +0x2 size 0 */
    char omaxlvl;   /* +0x3 size 0 */
    char olvltype;   /* +0x4 size 0 */
    char otheme;   /* +0x5 size 0 */
    char oquest;   /* +0x6 size 0 */
    unsigned char oAnimFlag;   /* +0x7 size 0 */
    short oAnimDelay;   /* +0x8 size 0 */
    short oAnimLen;   /* +0xA size 0 */
    unsigned char oSolidFlag;   /* +0xC size 0 */
    unsigned char oMissFlag;   /* +0xD size 0 */
    unsigned char oLightFlag;   /* +0xE size 0 */
    char oBreak;   /* +0xF size 0 */
    char oSelFlag;   /* +0x10 size 0 */
    unsigned char oTrapFlag;   /* +0x11 size 0 */
};   /* sizeof 18 */

typedef struct ObjDataStruct ObjDataStruct;
struct ObjectStruct {   /* size 44 */
    short _olid;   /* +0x0 size 0 */
    int _oRndSeed;   /* +0x4 size 0 */
    short _oAnimDelay;   /* +0x8 size 0 */
    short _oAnimCnt;   /* +0xA size 0 */
    short _oAnimLen;   /* +0xC size 0 */
    short _oVar1;   /* +0xE size 0 */
    short _oVar2;   /* +0x10 size 0 */
    short _oVar3;   /* +0x12 size 0 */
    short _oVar4;   /* +0x14 size 0 */
    short _oVar5;   /* +0x16 size 0 */
    short _oVar6;   /* +0x18 size 0 */
    short _oVar7;   /* +0x1A size 0 */
    short _oVar8;   /* +0x1C size 0 */
    char _otype;   /* +0x1E size 0 */
    char _ox;   /* +0x1F size 0 */
    char _oy;   /* +0x20 size 0 */
    char _oAnimFrame;   /* +0x21 size 0 */
    char _oBreak;   /* +0x22 size 0 */
    char _oSelFlag;   /* +0x23 size 0 */
    unsigned char _oLight;   /* +0x24 size 0 */
    unsigned char _oAnimFlag;   /* +0x25 size 0 */
    unsigned char _oDelFlag;   /* +0x26 size 0 */
    unsigned char _oSolidFlag;   /* +0x27 size 0 */
    unsigned char _oMissFlag;   /* +0x28 size 0 */
    unsigned char _oPreFlag;   /* +0x29 size 0 */
    unsigned char _oTrapFlag;   /* +0x2A size 0 */
    unsigned char _oDoorFlag;   /* +0x2B size 0 */
};   /* sizeof 44 */

typedef struct ObjectStruct ObjectStruct;
struct ShadowStruct {   /* size 7 */
    unsigned char strig;   /* +0x0 size 0 */
    unsigned char s1;   /* +0x1 size 0 */
    unsigned char s2;   /* +0x2 size 0 */
    unsigned char s3;   /* +0x3 size 0 */
    unsigned char nv1;   /* +0x4 size 0 */
    unsigned char nv2;   /* +0x5 size 0 */
    unsigned char nv3;   /* +0x6 size 0 */
};   /* sizeof 7 */

typedef struct ShadowStruct ShadowStruct;
struct ScrollStruct {   /* size 20 */
    int _sxoff;   /* +0x0 size 0 */
    int _syoff;   /* +0x4 size 0 */
    int _sdx;   /* +0x8 size 0 */
    int _sdy;   /* +0xC size 0 */
    int _sdir;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct ScrollStruct ScrollStruct;
struct THEME_LOC {   /* size 20 */
    int x;   /* +0x0 size 0 */
    int y;   /* +0x4 size 0 */
    int ttval;   /* +0x8 size 0 */
    int width;   /* +0xC size 0 */
    int height;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct THEME_LOC THEME_LOC;
struct MINIXY {   /* size 10 */
    char stairsupx;   /* +0x0 size 0 */
    char stairsupy;   /* +0x1 size 0 */
    char stairsdownx;   /* +0x2 size 0 */
    char stairsdowny;   /* +0x3 size 0 */
    char townwarpx;   /* +0x4 size 0 */
    char townwarpy;   /* +0x5 size 0 */
    char pentax;   /* +0x6 size 0 */
    char pentay;   /* +0x7 size 0 */
    char pwaterx;   /* +0x8 size 0 */
    char pwatery;   /* +0x9 size 0 */
};   /* sizeof 10 */

typedef struct MINIXY MINIXY;
struct MICROS {   /* size 32 */
    unsigned short mt[16];   /* +0x0 size 32 */
};   /* sizeof 32 */

typedef struct MICROS MICROS;
struct map_info {   /* size 8 */
    short dMonster;   /* +0x0 size 0 */
    unsigned char dBits;   /* +0x2 size 0 */
    char dObject;   /* +0x3 size 0 */
    char dItem;   /* +0x4 size 0 */
    char dMissile;   /* +0x5 size 0 */
    char dFlags;   /* +0x6 size 0 */
    char dTransVal;   /* +0x7 size 0 */
};   /* sizeof 8 */

typedef struct map_info map_info;
struct PortalStruct {   /* size 12 */
    int ltype;   /* +0x0 size 0 */
    char x;   /* +0x4 size 0 */
    char y;   /* +0x5 size 0 */
    char level;   /* +0x6 size 0 */
    char setlvlnum;   /* +0x7 size 0 */
    unsigned char open;   /* +0x8 size 0 */
    unsigned char setlvl;   /* +0x9 size 0 */
};   /* sizeof 12 */

typedef struct PortalStruct PortalStruct;
enum .89fake {
    QS_BRAINGIVEN = 7,
    QS_BRAINSPAWNED = 6,
    QS_MUSHGIVEN = 5,
    QS_MUSHPICKED = 4,
    QS_MUSHSPAWNED = 3,
    QS_TOMEGIVEN = 2,
    QS_TOMESPAWNED = 1,
    QS_INIT = 0,
};

struct QuestStruct {   /* size 20 */
    unsigned char _qlevel;   /* +0x0 size 0 */
    unsigned char _qtype;   /* +0x1 size 0 */
    unsigned char _qactive;   /* +0x2 size 0 */
    unsigned char _qlvltype;   /* +0x3 size 0 */
    int _qtx;   /* +0x4 size 0 */
    int _qty;   /* +0x8 size 0 */
    unsigned char _qslvl;   /* +0xC size 0 */
    unsigned char _qidx;   /* +0xD size 0 */
    unsigned char _qmsg;   /* +0xE size 0 */
    unsigned char _qvar1;   /* +0xF size 0 */
    unsigned char _qvar2;   /* +0x10 size 0 */
    unsigned char _qlog;   /* +0x11 size 0 */
    unsigned char pad_for_laz;   /* +0x12 size 0 */
};   /* sizeof 20 */

typedef struct QuestStruct QuestStruct;
struct QuestData {   /* size 16 */
    unsigned char _qdlvl;   /* +0x0 size 0 */
    char _qdmultlvl;   /* +0x1 size 0 */
    unsigned char _qlvlt;   /* +0x2 size 0 */
    unsigned char _qdtype;   /* +0x3 size 0 */
    unsigned char _qdrnd;   /* +0x4 size 0 */
    unsigned char _qslvl;   /* +0x5 size 0 */
    unsigned char _qflags;   /* +0x6 size 0 */
    int _qdmsg;   /* +0x8 size 0 */
    int _qlstr;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct QuestData QuestData;
enum _setlevels {
    SL_VILEBETRAYER = 5,
    SL_POISONWATER = 4,
    SL_MAZE = 3,
    SL_BONECHAMB = 2,
    SL_SKELKING = 1,
};

typedef enum _setlevels _setlevels;
enum .92fake {
    NUM_CMDS = 93,
    FAKE_CMD_DROPID = 92,
    FAKE_CMD_SETID = 91,
    CMD_AWAKEGOLEM = 90,
    CMD_ENDSHIELD = 89,
    CMD_SYNCQUEST = 88,
    CMD_KILLGOLEM = 87,
    CMD_SYNCPUTITEM = 86,
    CMD_ITEMEXTRA = 85,
    CMD_SPELLXYD = 84,
    CMD_RETOWN = 83,
    CMD_SETVIT = 82,
    CMD_SETDEX = 81,
    CMD_SETMAG = 80,
    CMD_SETSTR = 79,
    CMD_STRING = 78,
    CMD_HEALOTHER = 77,
    CMD_DLEVEL_END = 76,
    CMD_DLEVEL_JUNK = 75,
    CMD_DLEVEL_16 = 74,
    CMD_DLEVEL_15 = 73,
    CMD_DLEVEL_14 = 72,
    CMD_DLEVEL_13 = 71,
    CMD_DLEVEL_12 = 70,
    CMD_DLEVEL_11 = 69,
    CMD_DLEVEL_10 = 68,
    CMD_DLEVEL_9 = 67,
    CMD_DLEVEL_8 = 66,
    CMD_DLEVEL_7 = 65,
    CMD_DLEVEL_6 = 64,
    CMD_DLEVEL_5 = 63,
    CMD_DLEVEL_4 = 62,
    CMD_DLEVEL_3 = 61,
    CMD_DLEVEL_2 = 60,
    CMD_DLEVEL_1 = 59,
    CMD_DLEVEL_0 = 58,
    CMD_DEACTIVATEPORTAL = 57,
    CMD_ACTIVATEPORTAL = 56,
    CMD_SATTACKXY = 55,
    CMD_SEND_PLRINFO = 54,
    CMD_PLAYER_JOINLEVEL = 53,
    CMD_DROPITEM = 52,
    CMD_PLRLEVEL = 51,
    CMD_PLRDAMAGE = 50,
    CMD_DELPLRITEMS = 49,
    CMD_CHANGEPLRITEMS = 48,
    CMD_BREAKOBJ = 47,
    CMD_PLROPOBJ = 46,
    CMD_OPERATEOBJ = 45,
    CMD_CLOSEDOOR = 44,
    CMD_OPENDOOR = 43,
    CMD_GOTOAGETITEM = 42,
    CMD_GOTOGETITEM = 41,
    CMD_REQUESTAGITEM = 40,
    CMD_REQUESTGITEM = 39,
    CMD_PLRDEAD = 38,
    CMD_MONSTDAMAGE = 37,
    CMD_MONSTDEATH = 36,
    CMD_SYNCDATA = 35,
    CMD_DEBUG = 34,
    CMD_CHEAT_SPELL_LEVEL = 33,
    CMD_CHEAT_EXPERIENCE = 32,
    CMD_WARP = 31,
    CMD_NEWLVL = 30,
    CMD_TALKXY = 29,
    CMD_KNOCKBACK = 28,
    CMD_OPOBJT = 27,
    CMD_RESURRECT = 26,
    CMD_TSPELLPID = 25,
    CMD_TSPELLID = 24,
    CMD_SPELLPID = 23,
    CMD_SPELLID = 22,
    CMD_RATTACKPID = 21,
    CMD_RATTACKID = 20,
    CMD_ATTACKPID = 19,
    CMD_ATTACKID = 18,
    CMD_DISARMXY = 17,
    CMD_OPOBJXY = 16,
    CMD_TSPELLXY = 15,
    CMD_SPELLXY = 14,
    CMD_RATTACKXY = 13,
    CMD_ATTACKXY = 12,
    CMD_RESPAWNITEM = 11,
    CMD_PUTITEM = 10,
    CMD_AGETITEM = 9,
    CMD_GETITEM = 8,
    CMD_SBSPELL = 7,
    CMD_ADDVIT = 6,
    CMD_ADDDEX = 5,
    CMD_ADDMAG = 4,
    CMD_ADDSTR = 3,
    CMD_ACK_PLRINFO = 2,
    CMD_WALKXY = 1,
    CMD_STAND = 0,
};

struct TCmd {   /* size 1 */
    unsigned char bCmd;   /* +0x0 size 0 */
};   /* sizeof 1 */

typedef struct TCmd TCmd;
struct TCmdLoc {   /* size 3 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char x;   /* +0x1 size 0 */
    unsigned char y;   /* +0x2 size 0 */
};   /* sizeof 3 */

typedef struct TCmdLoc TCmdLoc;
struct TCmdLocParam1 {   /* size 6 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char x;   /* +0x1 size 0 */
    unsigned char y;   /* +0x2 size 0 */
    unsigned short wParam1;   /* +0x4 size 0 */
};   /* sizeof 6 */

typedef struct TCmdLocParam1 TCmdLocParam1;
struct TCmdLocParam2 {   /* size 8 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char x;   /* +0x1 size 0 */
    unsigned char y;   /* +0x2 size 0 */
    unsigned short wParam1;   /* +0x4 size 0 */
    unsigned short wParam2;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct TCmdLocParam2 TCmdLocParam2;
struct TCmdLocParam3 {   /* size 10 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char x;   /* +0x1 size 0 */
    unsigned char y;   /* +0x2 size 0 */
    unsigned short wParam1;   /* +0x4 size 0 */
    unsigned short wParam2;   /* +0x6 size 0 */
    unsigned short wParam3;   /* +0x8 size 0 */
};   /* sizeof 10 */

typedef struct TCmdLocParam3 TCmdLocParam3;
struct TCmdParam1 {   /* size 4 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned short wParam1;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct TCmdParam1 TCmdParam1;
struct TCmdParam2 {   /* size 6 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned short wParam1;   /* +0x2 size 0 */
    unsigned short wParam2;   /* +0x4 size 0 */
};   /* sizeof 6 */

typedef struct TCmdParam2 TCmdParam2;
struct TCmdParam3 {   /* size 8 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned short wParam1;   /* +0x2 size 0 */
    unsigned short wParam2;   /* +0x4 size 0 */
    unsigned short wParam3;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct TCmdParam3 TCmdParam3;
struct TCmdGolem {   /* size 8 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char _mx;   /* +0x1 size 0 */
    unsigned char _my;   /* +0x2 size 0 */
    unsigned char _mdir;   /* +0x3 size 0 */
    unsigned char _menemy;   /* +0x4 size 0 */
    unsigned char _currlevel;   /* +0x5 size 0 */
    short _mhitpoints;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct TCmdGolem TCmdGolem;
struct TCmdQuest {   /* size 5 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char q;   /* +0x1 size 0 */
    unsigned char qstate;   /* +0x2 size 0 */
    unsigned char qlog;   /* +0x3 size 0 */
    unsigned char qvar1;   /* +0x4 size 0 */
};   /* sizeof 5 */

typedef struct TCmdQuest TCmdQuest;
struct TCmdGItem {   /* size 32 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char bMaster;   /* +0x1 size 0 */
    unsigned char bPnum;   /* +0x2 size 0 */
    unsigned char bCursitem;   /* +0x3 size 0 */
    unsigned char bLevel;   /* +0x4 size 0 */
    unsigned char x;   /* +0x5 size 0 */
    unsigned char y;   /* +0x6 size 0 */
    unsigned char bId;   /* +0x7 size 0 */
    unsigned char bDur;   /* +0x8 size 0 */
    unsigned char bMDur;   /* +0x9 size 0 */
    unsigned char bCh;   /* +0xA size 0 */
    unsigned char bMCh;   /* +0xB size 0 */
    unsigned short wValue;   /* +0xC size 0 */
    unsigned short wIndx;   /* +0xE size 0 */
    unsigned short wCI;   /* +0x10 size 0 */
    unsigned long dwSeed;   /* +0x14 size 0 */
    unsigned long dwBuff;   /* +0x18 size 0 */
    unsigned long dwTime;   /* +0x1C size 0 */
};   /* sizeof 32 */

typedef struct TCmdGItem TCmdGItem;
struct TCmdPItem {   /* size 24 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char x;   /* +0x1 size 0 */
    unsigned char y;   /* +0x2 size 0 */
    unsigned char bId;   /* +0x3 size 0 */
    unsigned char bDur;   /* +0x4 size 0 */
    unsigned char bMDur;   /* +0x5 size 0 */
    unsigned char bCh;   /* +0x6 size 0 */
    unsigned char bMCh;   /* +0x7 size 0 */
    unsigned short wValue;   /* +0x8 size 0 */
    unsigned short wIndx;   /* +0xA size 0 */
    unsigned short wCI;   /* +0xC size 0 */
    unsigned long dwSeed;   /* +0x10 size 0 */
    unsigned long dwBuff;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct TCmdPItem TCmdPItem;
struct TCmdChItem {   /* size 16 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char bLoc;   /* +0x1 size 0 */
    unsigned short wIndx;   /* +0x2 size 0 */
    unsigned short wCI;   /* +0x4 size 0 */
    unsigned long dwSeed;   /* +0x8 size 0 */
    unsigned char bId;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct TCmdChItem TCmdChItem;
struct TCmdDelItem {   /* size 2 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char bLoc;   /* +0x1 size 0 */
};   /* sizeof 2 */

typedef struct TCmdDelItem TCmdDelItem;
struct TCmdDamage {   /* size 8 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char bPlr;   /* +0x1 size 0 */
    unsigned long dwDam;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct TCmdDamage TCmdDamage;
struct TCmdPlrInfoHdr {   /* size 6 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned short wOffset;   /* +0x2 size 0 */
    unsigned short wBytes;   /* +0x4 size 0 */
};   /* sizeof 6 */

typedef struct TCmdPlrInfoHdr TCmdPlrInfoHdr;
struct TCmdString {   /* size 81 */
    unsigned char bCmd;   /* +0x0 size 0 */
    char str[80];   /* +0x1 size 80 */
};   /* sizeof 81 */

typedef struct TCmdString TCmdString;
struct TFakeCmdPlr {   /* size 2 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char bPlr;   /* +0x1 size 0 */
};   /* sizeof 2 */

typedef struct TFakeCmdPlr TFakeCmdPlr;
struct TFakeDropPlr {   /* size 8 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char bPlr;   /* +0x1 size 0 */
    unsigned long dwReason;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct TFakeDropPlr TFakeDropPlr;
struct TSyncHeader {   /* size 48 */
    unsigned char bCmd;   /* +0x0 size 0 */
    unsigned char bLevel;   /* +0x1 size 0 */
    unsigned short wLen;   /* +0x2 size 0 */
    unsigned char bObjId;   /* +0x4 size 0 */
    unsigned char bObjCmd;   /* +0x5 size 0 */
    unsigned char bItemI;   /* +0x6 size 0 */
    unsigned char bItemX;   /* +0x7 size 0 */
    unsigned char bItemY;   /* +0x8 size 0 */
    unsigned short wItemIndx;   /* +0xA size 0 */
    unsigned short wItemCI;   /* +0xC size 0 */
    int dwItemSeed;   /* +0x10 size 0 */
    unsigned char bItemId;   /* +0x14 size 0 */
    unsigned char bItemDur;   /* +0x15 size 0 */
    unsigned char bItemMDur;   /* +0x16 size 0 */
    unsigned char bItemCh;   /* +0x17 size 0 */
    unsigned char bItemMCh;   /* +0x18 size 0 */
    unsigned short wItemVal;   /* +0x1A size 0 */
    unsigned long dwItemBuff;   /* +0x1C size 0 */
    unsigned char bPInvLoc;   /* +0x20 size 0 */
    unsigned short wPInvIndx;   /* +0x22 size 0 */
    unsigned short wPInvCI;   /* +0x24 size 0 */
    int dwPInvSeed;   /* +0x28 size 0 */
    unsigned char bPInvId;   /* +0x2C size 0 */
};   /* sizeof 48 */

typedef struct TSyncHeader TSyncHeader;
struct TSyncMonster {   /* size 5 */
    unsigned char _mndx;   /* +0x0 size 0 */
    unsigned char _mx;   /* +0x1 size 0 */
    unsigned char _my;   /* +0x2 size 0 */
    unsigned char _menemy;   /* +0x3 size 0 */
    unsigned char _mdelta;   /* +0x4 size 0 */
};   /* sizeof 5 */

typedef struct TSyncMonster TSyncMonster;
struct TPktHdr {   /* size 20 */
    unsigned char px;   /* +0x0 size 0 */
    unsigned char py;   /* +0x1 size 0 */
    unsigned char targx;   /* +0x2 size 0 */
    unsigned char targy;   /* +0x3 size 0 */
    unsigned long php;   /* +0x4 size 0 */
    unsigned long pmhp;   /* +0x8 size 0 */
    unsigned char bstr;   /* +0xC size 0 */
    unsigned char bmag;   /* +0xD size 0 */
    unsigned char bdex;   /* +0xE size 0 */
    unsigned short wCheck;   /* +0x10 size 0 */
    unsigned short wLen;   /* +0x12 size 0 */
};   /* sizeof 20 */

typedef struct TPktHdr TPktHdr;
struct TPkt {   /* size 512 */
    struct TPktHdr hdr;   /* +0x0 size 20 */
    unsigned char body[492];   /* +0x14 size 492 */
};   /* sizeof 512 */

typedef struct TPkt TPkt;
struct DMonsterStr {   /* size 8 */
    unsigned char _mx;   /* +0x0 size 0 */
    unsigned char _my;   /* +0x1 size 0 */
    unsigned char _mdir;   /* +0x2 size 0 */
    unsigned char _menemy;   /* +0x3 size 0 */
    int _mhitpoints;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct DMonsterStr DMonsterStr;
struct DObjectStr {   /* size 1 */
    unsigned char bCmd;   /* +0x0 size 0 */
};   /* sizeof 1 */

typedef struct DObjectStr DObjectStr;
struct DLevel {   /* size 4696 */
    struct TCmdPItem item[127];   /* +0x0 size 3048 */
    struct DObjectStr object[127];   /* +0xBE8 size 127 */
    struct DMonsterStr monster[190];   /* +0xC68 size 1520 */
};   /* sizeof 4696 */

typedef struct DLevel DLevel;
struct LocalLevel {   /* size 200 */
    unsigned char automapsv[5][40];   /* +0x0 size 200 */
};   /* sizeof 200 */

typedef struct LocalLevel LocalLevel;
struct DPortal {   /* size 5 */
    unsigned char x;   /* +0x0 size 0 */
    unsigned char y;   /* +0x1 size 0 */
    unsigned char level;   /* +0x2 size 0 */
    unsigned char ltype;   /* +0x3 size 0 */
    unsigned char setlvl;   /* +0x4 size 0 */
};   /* sizeof 5 */

typedef struct DPortal DPortal;
struct MultiQuests {   /* size 3 */
    unsigned char qstate;   /* +0x0 size 0 */
    unsigned char qlog;   /* +0x1 size 0 */
    unsigned char qvar1;   /* +0x2 size 0 */
};   /* sizeof 3 */

typedef struct MultiQuests MultiQuests;
struct DJunk {   /* size 32 */
    struct DPortal portal[4];   /* +0x0 size 20 */
    struct MultiQuests quests[4];   /* +0x14 size 12 */
};   /* sizeof 32 */

typedef struct DJunk DJunk;
struct OBJ_TYPE_INFO {   /* size 32 */
    void (*Constructor)();   /* +0x0 size 0 */
    void (*Destructor)();   /* +0x4 size 0 */
    void (*Printer)();   /* +0x8 size 0 */
    int (*GetWidth)();   /* +0xC size 0 */
    int (*GetHeight)();   /* +0x10 size 0 */
    int (*GetXOff)();   /* +0x14 size 0 */
    int (*GetYOff)();   /* +0x18 size 0 */
    int (*GetPal)();   /* +0x1C size 0 */
};   /* sizeof 32 */

typedef struct OBJ_TYPE_INFO OBJ_TYPE_INFO;
struct OBJ_LIST {   /* size 40 */
    unsigned long PrintDepth;   /* +0x0 size 0 */
    unsigned char Visible;   /* +0x4 size 0 */
    unsigned char Killable;   /* +0x5 size 0 */
    char *ListName;   /* +0x8 size 0 */
    struct OBJ_LIST *Prev;   /* +0xC size 40 */
    struct OBJ_LIST *Next;   /* +0x10 size 40 */
    long X;   /* +0x14 size 0 */
    long Y;   /* +0x18 size 0 */
    long Z;   /* +0x1C size 0 */
    struct OBJ_STRUCT *Head;   /* +0x20 size 0 */
    unsigned char (*SortCompare)();   /* +0x24 size 0 */
};   /* sizeof 40 */

typedef struct OBJ_LIST OBJ_LIST;
struct OBJ_STRUCT {   /* size 52 */
    struct OBJ_STRUCT *Next;   /* +0x0 size 52 */
    struct OBJ_STRUCT *Prev;   /* +0x4 size 52 */
    unsigned long ID;   /* +0x8 size 0 */
    long XPos;   /* +0xC size 0 */
    long YPos;   /* +0x10 size 0 */
    long ZPos;   /* +0x14 size 0 */
    long XVel;   /* +0x18 size 0 */
    long YVel;   /* +0x1C size 0 */
    long ZVel;   /* +0x20 size 0 */
    struct OBJ_TYPE_INFO *OTI;   /* +0x24 size 32 */
    struct OBJ_LIST *OL;   /* +0x28 size 40 */
    void *Data;   /* +0x2C size 0 */
    long MemHandle;   /* +0x30 size 0 */
};   /* sizeof 52 */

typedef struct OBJ_STRUCT OBJ_STRUCT;
enum .93fake {
    PAD_ALL_DIRS = 15,
    PAD_BUTTONS = 16320,
    PAD_R2 = 8192,
    PAD_R1 = 4096,
    PAD_L2 = 2048,
    PAD_L1 = 1024,
    PAD_TRIANGLE = 512,
    PAD_CIRCLE = 256,
    PAD_SQUARE = 128,
    PAD_CROSS = 64,
    PAD_SELECT = 32,
    PAD_START = 16,
    PAD_RIGHT = 8,
    PAD_LEFT = 4,
    PAD_DOWN = 2,
    PAD_UP = 1,
};

struct CPad {   /* size 236 */
    unsigned char get_both;   /* +0x0 size 0 */
    unsigned char active;   /* +0x1 size 0 */
    unsigned char PadType;   /* +0x2 size 0 */
    unsigned char PADTICK;   /* +0x3 size 0 */
    unsigned short PADTICKMASK;   /* +0x4 size 0 */
    unsigned short PadNum;   /* +0x6 size 0 */
    unsigned short Cur;   /* +0x8 size 0 */
    unsigned short Up;   /* +0xA size 0 */
    unsigned short Down;   /* +0xC size 0 */
    unsigned short Tick;   /* +0xE size 0 */
    unsigned short Old;   /* +0x10 size 0 */
    unsigned short both_Cur;   /* +0x12 size 0 */
    unsigned short both_Up;   /* +0x14 size 0 */
    unsigned short both_Down;   /* +0x16 size 0 */
    unsigned short both_Tick;   /* +0x18 size 0 */
    unsigned short both_Old;   /* +0x1A size 0 */
    BOOL TickDown[16];   /* +0x1C size 64 */
    BOOL TickBoth[16];   /* +0x5C size 64 */
    unsigned char TickCount[16];   /* +0x9C size 16 */
    unsigned short BothTickCount[16];   /* +0xAC size 32 */
    unsigned short GazTickCount[16];   /* +0xCC size 32 */
};   /* sizeof 236 */

typedef struct CPad CPad;
enum TXT_JUST {
    JustRight = 2,
    JustCentre = 1,
    JustLeft = 0,
};

typedef enum TXT_JUST TXT_JUST;
struct CFont {   /* size 540 */
    int TextureId;   /* +0x0 size 0 */
    unsigned short FontTab[256];   /* +0x4 size 512 */
    int PrintyOTpos;   /* +0x204 size 0 */
    int MinX;   /* +0x208 size 0 */
    int MaxX;   /* +0x20C size 0 */
    int Width;   /* +0x210 size 0 */
    struct TextDat *ThisDat;   /* +0x214 size 112 */
    unsigned char FontHeight;   /* +0x218 size 0 */
};   /* sizeof 540 */

typedef struct CFont CFont;
struct SCREEN_ENV {   /* size 112 */
    struct DRAWENV drawenv;   /* +0x0 size 92 */
    struct DISPENV dispenv;   /* +0x5C size 20 */
};   /* sizeof 112 */

typedef struct SCREEN_ENV SCREEN_ENV;
enum .94fake {
    FLG_WATER = 16,
    FLG_PENTAGRAM = 8,
    FLG_CYCLE = 4,
    FLG_NOTRANS = 2,
    FLG_FLOOR = 1,
};

struct LittleGt4 {   /* size 16 */
    unsigned char u0;   /* +0x0 size 0 */
    unsigned char v0;   /* +0x1 size 0 */
    unsigned short clut;   /* +0x2 size 0 */
    unsigned char u1;   /* +0x4 size 0 */
    unsigned char v1;   /* +0x5 size 0 */
    unsigned short tpage;   /* +0x6 size 0 */
    unsigned char u2;   /* +0x8 size 0 */
    unsigned char v2;   /* +0x9 size 0 */
    unsigned char u3;   /* +0xA size 0 */
    unsigned char v3;   /* +0xB size 0 */
    unsigned char w;   /* +0xC size 0 */
    unsigned char h;   /* +0xD size 0 */
    unsigned char code;   /* +0xE size 0 */
    unsigned char Flags;   /* +0xF size 0 */
};   /* sizeof 16 */

typedef struct LittleGt4 LittleGt4;
struct RGBPOLY {   /* size 48 */
    int r1;   /* +0x0 size 0 */
    int g1;   /* +0x4 size 0 */
    int b1;   /* +0x8 size 0 */
    int r2;   /* +0xC size 0 */
    int g2;   /* +0x10 size 0 */
    int b2;   /* +0x14 size 0 */
    int r3;   /* +0x18 size 0 */
    int g3;   /* +0x1C size 0 */
    int b3;   /* +0x20 size 0 */
    int r4;   /* +0x24 size 0 */
    int g4;   /* +0x28 size 0 */
    int b4;   /* +0x2C size 0 */
};   /* sizeof 48 */

typedef struct RGBPOLY RGBPOLY;
struct glRGBPOLY {   /* size 16 */
    unsigned char r1;   /* +0x0 size 0 */
    unsigned char g1;   /* +0x1 size 0 */
    unsigned char b1;   /* +0x2 size 0 */
    unsigned char code1;   /* +0x3 size 0 */
    unsigned char r2;   /* +0x4 size 0 */
    unsigned char g2;   /* +0x5 size 0 */
    unsigned char b2;   /* +0x6 size 0 */
    unsigned char code2;   /* +0x7 size 0 */
    unsigned char r3;   /* +0x8 size 0 */
    unsigned char g3;   /* +0x9 size 0 */
    unsigned char b3;   /* +0xA size 0 */
    unsigned char code3;   /* +0xB size 0 */
    unsigned char r4;   /* +0xC size 0 */
    unsigned char g4;   /* +0xD size 0 */
    unsigned char b4;   /* +0xE size 0 */
    unsigned char code4;   /* +0xF size 0 */
};   /* sizeof 16 */

typedef struct glRGBPOLY glRGBPOLY;
struct RgbBlockInf {   /* size 24 */
    int FromValR;   /* +0x0 size 0 */
    int ToValR;   /* +0x4 size 0 */
    int FromValG;   /* +0x8 size 0 */
    int ToValG;   /* +0xC size 0 */
    int FromValB;   /* +0x10 size 0 */
    int ToValB;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct RgbBlockInf RgbBlockInf;
struct RGBPOINT {   /* size 12 */
    int r;   /* +0x0 size 0 */
    int g;   /* +0x4 size 0 */
    int b;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct RGBPOINT RGBPOINT;
struct RGBData {   /* size 40 */
    struct glRGBPOLY rgbb;   /* +0x0 size 16 */
    struct RGBPOINT rgb_ity1;   /* +0x10 size 12 */
    struct RGBPOINT rgb_ity2;   /* +0x1C size 12 */
};   /* sizeof 40 */

typedef struct RGBData RGBData;
typedef int (*MAPITFUNC)();
struct CBlocks {   /* size 264 */
    struct TextDat TextDat;   /* +0x0 size 112 */
    struct TextDat *MonstTexDat;   /* +0x70 size 112 */
    struct TextDat *ObjTexDat;   /* +0x74 size 112 */
    struct MonstList *MonsterList;   /* +0x78 size 16 */
    int RndX;   /* +0x7C size 0 */
    int RndY;   /* +0x80 size 0 */
    int MonstTexId;   /* +0x84 size 0 */
    long hndBlocks;   /* +0x88 size 0 */
    int ObjTexId;   /* +0x8C size 0 */
    int ItemTexId;   /* +0x90 size 0 */
    struct TextDat *ItemTexDat;   /* +0x94 size 112 */
    int BgTexId;   /* +0x98 size 0 */
    struct TextDat *BgTexDat;   /* +0x9C size 112 */
    int pOtPos[2];   /* +0xA0 size 8 */
    BOOL IsTown;   /* +0xA8 size 0 */
    int NumOfBlocks;   /* +0xAC size 0 */
    struct LittleGt4 *Gt4s;   /* +0xB0 size 16 */
    long hndGt4s;   /* +0xB4 size 0 */
    struct RECT *Rects;   /* +0xB8 size 8 */
    long hndRects;   /* +0xBC size 0 */
    struct RECT ClipRect;   /* +0xC0 size 8 */
    int StX;   /* +0xC8 size 0 */
    int StY;   /* +0xCC size 0 */
    int Mx;   /* +0xD0 size 0 */
    int My;   /* +0xD4 size 0 */
    int pBlockX[2];   /* +0xD8 size 8 */
    int pBlockY[2];   /* +0xE0 size 8 */
    int CursX;   /* +0xE8 size 0 */
    int CursY;   /* +0xEC size 0 */
    struct RgbBlockInf GlBlockInf;   /* +0xF0 size 24 */
};   /* sizeof 264 */

typedef struct CBlocks CBlocks;
struct Dialog {   /* size 16 */
    int BevelGfx;   /* +0x0 size 0 */
    int BorderGfx;   /* +0x4 size 0 */
    int BackGfx;   /* +0x8 size 0 */
    int DialogOTpos;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct Dialog Dialog;
struct DB {   /* size 112 */
    struct DRAWENV draw;   /* +0x0 size 92 */
    struct DISPENV disp;   /* +0x5C size 20 */
};   /* sizeof 112 */

typedef struct DB DB;
enum PLR_MODE {
    PM_QUIT = 11,
    PM_NEWLVL = 10,
    PM_SPELL = 9,
    PM_DEATH = 8,
    PM_GOTHIT = 7,
    PM_BLOCK = 6,
    PM_RATTACK = 5,
    PM_ATTACK = 4,
    PM_WALK3 = 3,
    PM_WALK2 = 2,
    PM_WALK = 1,
    PM_STAND = 0,
};

typedef enum PLR_MODE PLR_MODE;
struct PlayerStruct {   /* size 6632 */
    enum PLR_MODE _pmode;   /* +0x0 size 4 */
    char walkpath[25];   /* +0x4 size 25 */
    unsigned char plractive;   /* +0x1D size 0 */
    char destAction;   /* +0x1E size 0 */
    char destParam1;   /* +0x1F size 0 */
    char destParam2;   /* +0x20 size 0 */
    char destParam3;   /* +0x21 size 0 */
    char destParam4;   /* +0x22 size 0 */
    int plrlevel;   /* +0x24 size 0 */
    int WorldX;   /* +0x28 size 0 */
    int WorldY;   /* +0x2C size 0 */
    short _px;   /* +0x30 size 0 */
    short _py;   /* +0x32 size 0 */
    short _pownerx;   /* +0x34 size 0 */
    short _pownery;   /* +0x36 size 0 */
    short _poldx;   /* +0x38 size 0 */
    short _poldy;   /* +0x3A size 0 */
    char _pxoff;   /* +0x3C size 0 */
    char _pyoff;   /* +0x3D size 0 */
    short _pxvel;   /* +0x3E size 0 */
    short _pyvel;   /* +0x40 size 0 */
    char _pdir;   /* +0x42 size 0 */
    char _pgfxnum;   /* +0x43 size 0 */
    unsigned char *_pAnimData;   /* +0x44 size 0 */
    int _pAnimDelay;   /* +0x48 size 0 */
    int _pAnimCnt;   /* +0x4C size 0 */
    int _pAnimLen;   /* +0x50 size 0 */
    int _pAnimFrame;   /* +0x54 size 0 */
    char _pAnimWidth;   /* +0x58 size 0 */
    char _pAnimWidth2;   /* +0x59 size 0 */
    char DeadLevel;   /* +0x5A size 0 */
    char _plid;   /* +0x5B size 0 */
    char _pvid;   /* +0x5C size 0 */
    char _pSpell;   /* +0x5D size 0 */
    char _pSplType;   /* +0x5E size 0 */
    char _pSplFrom;   /* +0x5F size 0 */
    char _pTSpell;   /* +0x60 size 0 */
    char _pTSplType;   /* +0x61 size 0 */
    int _pRSpell;   /* +0x64 size 0 */
    char _pRSplType;   /* +0x68 size 0 */
    int _pSBkSpell;   /* +0x6C size 0 */
    char _pSBkSplType;   /* +0x70 size 0 */
    char _pSplLvl[64];   /* +0x71 size 64 */
    unsigned long _pMemSpells;   /* +0xB8 size 0 */
    unsigned long _pAblSpells;   /* +0xC0 size 0 */
    unsigned long _pScrlSpells;   /* +0xC8 size 0 */
    char _pSpellFlags;   /* +0xD0 size 0 */
    char _pwtype;   /* +0xD1 size 0 */
    unsigned char _pBlockFlag;   /* +0xD2 size 0 */
    unsigned char _pInvincible;   /* +0xD3 size 0 */
    char _pLightRad;   /* +0xD4 size 0 */
    unsigned char _pLvlChanging;   /* +0xD5 size 0 */
    char _pName[32];   /* +0xD6 size 32 */
    char _pClass;   /* +0xF6 size 0 */
    short _pStrength;   /* +0xF8 size 0 */
    short _pBaseStr;   /* +0xFA size 0 */
    short _pMagic;   /* +0xFC size 0 */
    short _pBaseMag;   /* +0xFE size 0 */
    short _pDexterity;   /* +0x100 size 0 */
    short _pBaseDex;   /* +0x102 size 0 */
    short _pVitality;   /* +0x104 size 0 */
    short _pBaseVit;   /* +0x106 size 0 */
    int _pStatPts;   /* +0x108 size 0 */
    int _pDamageMod;   /* +0x10C size 0 */
    int _pBaseToBlk;   /* +0x110 size 0 */
    long _pHPBase;   /* +0x114 size 0 */
    long _pMaxHPBase;   /* +0x118 size 0 */
    long _pHitPoints;   /* +0x11C size 0 */
    long _pMaxHP;   /* +0x120 size 0 */
    int _pHPPer;   /* +0x124 size 0 */
    long _pManaBase;   /* +0x128 size 0 */
    long _pMaxManaBase;   /* +0x12C size 0 */
    long _pMana;   /* +0x130 size 0 */
    long _pMaxMana;   /* +0x134 size 0 */
    int _pManaPer;   /* +0x138 size 0 */
    char _pLevel;   /* +0x13C size 0 */
    char _pMaxLvl;   /* +0x13D size 0 */
    long _pExperience;   /* +0x140 size 0 */
    long _pMaxExp;   /* +0x144 size 0 */
    long _pNextExper;   /* +0x148 size 0 */
    char _pArmorClass;   /* +0x14C size 0 */
    char _pMagResist;   /* +0x14D size 0 */
    char _pFireResist;   /* +0x14E size 0 */
    char _pLghtResist;   /* +0x14F size 0 */
    long _pGold;   /* +0x150 size 0 */
    unsigned char _pInfraFlag;   /* +0x154 size 0 */
    short _pVar1;   /* +0x156 size 0 */
    short _pVar2;   /* +0x158 size 0 */
    short _pVar3;   /* +0x15A size 0 */
    short _pVar4;   /* +0x15C size 0 */
    short _pVar5;   /* +0x15E size 0 */
    short _pVar6;   /* +0x160 size 0 */
    short _pVar7;   /* +0x162 size 0 */
    short _pVar8;   /* +0x164 size 0 */
    unsigned char _pLvlVisited[17];   /* +0x166 size 17 */
    unsigned char _pSLvlVisited[10];   /* +0x177 size 10 */
    int _pGFXLoad;   /* +0x184 size 0 */
    unsigned char peq;   /* +0x188 size 0 */
    int _pAFNum;   /* +0x18C size 0 */
    int _pNFrames;   /* +0x190 size 0 */
    int _pWFrames;   /* +0x194 size 0 */
    int _pAFrames;   /* +0x198 size 0 */
    int _pSFrames;   /* +0x19C size 0 */
    int _pSFNum;   /* +0x1A0 size 0 */
    int _pHFrames;   /* +0x1A4 size 0 */
    int _pDFrames;   /* +0x1A8 size 0 */
    int _pBFrames;   /* +0x1AC size 0 */
    struct ItemStruct InvBody[7];   /* +0x1B0 size 756 */
    struct ItemStruct InvList[40];   /* +0x4A4 size 4320 */
    int _pNumInv;   /* +0x1584 size 0 */
    char InvGrid[40];   /* +0x1588 size 40 */
    struct ItemStruct SpdList[8];   /* +0x15B0 size 864 */
    struct ItemStruct HoldItem;   /* +0x1910 size 108 */
    int inv_highlight;   /* +0x197C size 0 */
    int body_highlight;   /* +0x1980 size 0 */
    int holdinv_x;   /* +0x1984 size 0 */
    int holdinv_y;   /* +0x1988 size 0 */
    int holdbody_loc;   /* +0x198C size 0 */
    int _pIMinDam;   /* +0x1990 size 0 */
    int _pIMaxDam;   /* +0x1994 size 0 */
    int _pIAC;   /* +0x1998 size 0 */
    int _pIBonusDam;   /* +0x199C size 0 */
    int _pIBonusToHit;   /* +0x19A0 size 0 */
    int _pIBonusAC;   /* +0x19A4 size 0 */
    int _pIBonusDamMod;   /* +0x19A8 size 0 */
    unsigned long _pISpells;   /* +0x19B0 size 0 */
    long _pIFlags;   /* +0x19B8 size 0 */
    int _pIGetHit;   /* +0x19BC size 0 */
    char _pISplLvlAdd;   /* +0x19C0 size 0 */
    char _pISplCost;   /* +0x19C1 size 0 */
    int _pISplDur;   /* +0x19C4 size 0 */
    int _pIEnAc;   /* +0x19C8 size 0 */
    int _pIFMinDam;   /* +0x19CC size 0 */
    int _pIFMaxDam;   /* +0x19D0 size 0 */
    int _pILMinDam;   /* +0x19D4 size 0 */
    int _pILMaxDam;   /* +0x19D8 size 0 */
    int _pOilType;   /* +0x19DC size 0 */
    unsigned char pTownWarps;   /* +0x19E0 size 0 */
    unsigned char pDungMsgs;   /* +0x19E1 size 0 */
    unsigned char pLvlLoad;   /* +0x19E2 size 0 */
    unsigned long pDiabloKillLevel;   /* +0x19E4 size 0 */
};   /* sizeof 6632 */

typedef struct PlayerStruct PlayerStruct;
enum .96fake {
    PEQ_pWAnim = 8,
    PEQ_pHAnim = 7,
    PEQ_pTAnim = 6,
    PEQ_pLAnim = 5,
    PEQ_pFAnim = 4,
    PEQ_pBAnim = 3,
    PEQ_pAAnim = 2,
    PEQ_pDAnim = 1,
    PEQ_pNAnim = 0,
};

struct controller_pos {   /* size 64 */
    int rx;   /* +0x0 size 0 */
    int ry;   /* +0x4 size 0 */
    int rz;   /* +0x8 size 0 */
    int tx;   /* +0xC size 0 */
    int ty;   /* +0x10 size 0 */
    int tz;   /* +0x14 size 0 */
    int px;   /* +0x18 size 0 */
    int py;   /* +0x1C size 0 */
    int srx;   /* +0x20 size 0 */
    int sry;   /* +0x24 size 0 */
    int srz;   /* +0x28 size 0 */
    int stx;   /* +0x2C size 0 */
    int sty;   /* +0x30 size 0 */
    int stz;   /* +0x34 size 0 */
    int spx;   /* +0x38 size 0 */
    int spy;   /* +0x3C size 0 */
};   /* sizeof 64 */

typedef struct controller_pos controller_pos;
struct pad_assigns {   /* size 12 */
    char *txt;   /* +0x0 size 0 */
    int pnum;   /* +0x4 size 0 */
    char font_num;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct pad_assigns pad_assigns;
struct KEY_ASSIGNS {   /* size 16 */
    int txt;   /* +0x0 size 0 */
    int pad_val;   /* +0x4 size 0 */
    void (*func)();   /* +0x8 size 0 */
    int combo_val;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct KEY_ASSIGNS KEY_ASSIGNS;
typedef struct KEY_ASSIGNS key_assigns;
enum CTRL_SET {
    CTRL_ADVANCED = 1,
    CTRL_BEGINNER = 0,
};

typedef enum CTRL_SET CTRL_SET;
enum PACTION {
    PL_FMAGIC = 11,
    PL_QMAGIC = 10,
    PL_LMAGIC = 9,
    PL_TSTAND = 8,
    PL_TWALK = 7,
    PL_DEATH = 6,
    PL_BLOCK = 5,
    PL_HIT = 4,
    PL_ATTACK = 3,
    PL_STAND = 2,
    PL_WALK = 1,
    PL_NOACTION = 0,
};

typedef enum PACTION PACTION;
struct CPlayer {   /* size 144 */
    struct TextDat TextDat;   /* +0x0 size 112 */
    long hndDatMem;   /* +0x70 size 0 */
    unsigned short NumOfPlayers;   /* +0x74 size 0 */
    BOOL InTown;   /* +0x78 size 0 */
    unsigned short PlayerNum;   /* +0x7C size 0 */
    unsigned short Tpage;   /* +0x7E size 0 */
    int TexId;   /* +0x80 size 0 */
    int LastScrX;   /* +0x84 size 0 */
    int LastScrY;   /* +0x88 size 0 */
    int LastOtPos;   /* +0x8C size 0 */
};   /* sizeof 144 */

typedef struct CPlayer CPlayer;
struct SpellTarget {   /* size 72 */
    unsigned char forcespell;   /* +0x0 size 0 */
    BOOL active;   /* +0x4 size 0 */
    short _sx;   /* +0x8 size 0 */
    short _sy;   /* +0xA size 0 */
    short _nsx;   /* +0xC size 0 */
    short _nsy;   /* +0xE size 0 */
    unsigned char _stx;   /* +0x10 size 0 */
    unsigned char _sty;   /* +0x11 size 0 */
    BOOL changed;   /* +0x14 size 0 */
    struct PlayerStruct *player;   /* +0x18 size 6632 */
    int pnum;   /* +0x1C size 0 */
    int angle;   /* +0x20 size 0 */
    int spotid;   /* +0x24 size 0 */
    short lastx[8];   /* +0x28 size 16 */
    short lasty[8];   /* +0x38 size 16 */
};   /* sizeof 72 */

typedef struct SpellTarget SpellTarget;
enum TARGET {
    T_MISSILE = 2,
    T_MONSTER = 1,
    T_PLAYER = 0,
};

typedef enum TARGET TARGET;
enum .99fake {
    PAD_UP_IS_UP = 1,
    PAD_UP_IS_UPRIGHT = 0,
};

enum .100fake {
    GAMEPAD_GETWALK = 12,
    GAMEPAD_GETALL_FUNCTIONS = 11,
    GAMEPAD_SET_UPFUNCTION = 10,
    GAMEPAD_SETALL_FUNCTIONS = 9,
    GAMEPAD_SET_FUNCTION = 8,
    GAMEPAD_START_PLAYER2 = 7,
    GAMEPAD_START_PLAYER1 = 6,
    GAMEPAD_START_PLAYERS = 5,
    GAMEPAD_STOP_PLAYER2 = 4,
    GAMEPAD_STOP_PLAYER1 = 3,
    GAMEPAD_STOP_PLAYERS = 2,
    GAMEPAD_TOGGLEPAUSE = 1,
    GAMEPAD_RUNNING = 0,
};

struct GamePad {   /* size 212 */
    struct PlayerStruct *player;   /* +0x0 size 6632 */
    struct SpellTarget spell;   /* +0x4 size 72 */
    char pnum;   /* +0x4C size 0 */
    char allow_walking;   /* +0x4D size 0 */
    char style;   /* +0x4E size 0 */
    int pad_up_button;   /* +0x50 size 0 */
    void (*pad_up_action)();   /* +0x54 size 0 */
    struct CPad *Pad;   /* +0x58 size 236 */
    int combo_key;   /* +0x5C size 0 */
    void (*button_down[14])();   /* +0x60 size 56 */
    void (*button_combo[14])();   /* +0x98 size 56 */
    unsigned char await_combo;   /* +0xD0 size 0 */
    unsigned char combo_menu_active;   /* +0xD1 size 0 */
};   /* sizeof 212 */

typedef struct GamePad GamePad;
struct found_objects {   /* size 3 */
    char index;   /* +0x0 size 0 */
    char x;   /* +0x1 size 0 */
    char y;   /* +0x2 size 0 */
};   /* sizeof 3 */

typedef struct found_objects found_objects;
typedef void (*CdlCB)();
struct CdlLOC {   /* size 4 */
    unsigned char minute;   /* +0x0 size 0 */
    unsigned char second;   /* +0x1 size 0 */
    unsigned char sector;   /* +0x2 size 0 */
    unsigned char track;   /* +0x3 size 0 */
};   /* sizeof 4 */

typedef struct CdlLOC CdlLOC;
struct CdlFILTER {   /* size 4 */
    unsigned char file;   /* +0x0 size 0 */
    unsigned char chan;   /* +0x1 size 0 */
    unsigned short pad;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct CdlFILTER CdlFILTER;
struct CdlATV {   /* size 4 */
    unsigned char val0;   /* +0x0 size 0 */
    unsigned char val1;   /* +0x1 size 0 */
    unsigned char val2;   /* +0x2 size 0 */
    unsigned char val3;   /* +0x3 size 0 */
};   /* sizeof 4 */

typedef struct CdlATV CdlATV;
struct CdlFILE {   /* size 24 */
    struct CdlLOC pos;   /* +0x0 size 4 */
    unsigned long size;   /* +0x4 size 0 */
    char name[16];   /* +0x8 size 16 */
};   /* sizeof 24 */

typedef struct CdlFILE CdlFILE;
struct StHEADER {   /* size 32 */
    unsigned short id;   /* +0x0 size 0 */
    unsigned short type;   /* +0x2 size 0 */
    unsigned short secCount;   /* +0x4 size 0 */
    unsigned short nSectors;   /* +0x6 size 0 */
    unsigned long frameCount;   /* +0x8 size 0 */
    unsigned long frameSize;   /* +0xC size 0 */
    unsigned short width;   /* +0x10 size 0 */
    unsigned short height;   /* +0x12 size 0 */
    unsigned long dummy1;   /* +0x14 size 0 */
    unsigned long dummy2;   /* +0x18 size 0 */
    struct CdlLOC loc;   /* +0x1C size 4 */
};   /* sizeof 32 */

typedef struct StHEADER StHEADER;
struct PCIO {   /* size 20 */
    struct FileIO FileIO;   /* +0x0 size 20 */
};   /* sizeof 20 */

typedef struct PCIO PCIO;
struct CdIO {   /* size 20 */
    struct FileIO FileIO;   /* +0x0 size 20 */
};   /* sizeof 20 */

typedef struct CdIO CdIO;
struct DList {   /* size 176 */
    struct SysObj SysObj;   /* +0x0 size 4 */
    int XRot;   /* +0x4 size 0 */
    int YRot;   /* +0x8 size 0 */
    int ZRot;   /* +0xC size 0 */
    struct MATRIX MyRotMatrix;   /* +0x10 size 32 */
    struct MATRIX MyTransMatrix;   /* +0x30 size 32 */
    struct VECTOR Out[4];   /* +0x50 size 64 */
    struct SVECTOR In[4];   /* +0x90 size 32 */
};   /* sizeof 176 */

typedef struct DList DList;
typedef char *MEMBLOCK;
struct ARGB {   /* size 4 */
    unsigned char b;   /* +0x0 size 0 */
    unsigned char g;   /* +0x1 size 0 */
    unsigned char r;   /* +0x2 size 0 */
    unsigned char a;   /* +0x3 size 0 */
};   /* sizeof 4 */

typedef struct ARGB ARGB;
struct shapetbl {   /* size 20 */
    unsigned int type : 8;   /* bit 0 */
    int next : 24;   /* bit 8 */
    short width;   /* +0x4 size 0 */
    short height;   /* +0x6 size 0 */
    short centerx;   /* +0x8 size 0 */
    short centery;   /* +0xA size 0 */
    int shapex : 12;   /* bit 96 */
    int reserved : 2;   /* bit 108 */
    int transposed : 1;   /* bit 110 */
    int rotated : 1;   /* bit 111 */
    int shapey : 12;   /* bit 112 */
    int mipmaps : 4;   /* bit 124 */
    char data;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct shapetbl shapetbl;
typedef struct shapetbl SHAPE;
struct windowtbl {   /* size 156 */
    long id;   /* +0x0 size 0 */
    int x;   /* +0x4 size 0 */
    int y;   /* +0x8 size 0 */
    int width;   /* +0xC size 0 */
    int height;   /* +0x10 size 0 */
    unsigned char bpp;   /* +0x14 size 0 */
    unsigned char type;   /* +0x15 size 0 */
    unsigned char ram;   /* +0x16 size 0 */
    unsigned char unused;   /* +0x17 size 0 */
    int minx;   /* +0x18 size 0 */
    int miny;   /* +0x1C size 0 */
    int maxx;   /* +0x20 size 0 */
    int maxy;   /* +0x24 size 0 */
    struct shapetbl *shape;   /* +0x28 size 20 */
    struct DISPENV dispenv;   /* +0x2C size 20 */
    struct DRAWENV drawenv;   /* +0x40 size 92 */
};   /* sizeof 156 */

typedef struct windowtbl windowtbl;
typedef struct windowtbl WINDOW;
struct coorddef {   /* size 12 */
    int x;   /* +0x0 size 0 */
    int y;   /* +0x4 size 0 */
    int z;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct coorddef coorddef;
typedef struct coorddef LIBCOORD;
struct scoorddef {   /* size 8 */
    int x;   /* +0x0 size 0 */
    int y;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct scoorddef scoorddef;
typedef struct scoorddef SCOORD;
struct matrixtdef {   /* size 36 */
    int m[9];   /* +0x0 size 36 */
};   /* sizeof 36 */

typedef struct matrixtdef matrixtdef;
typedef struct matrixtdef MATRIX3DT;
typedef void (*VOIDFN)();
struct TSPRT {   /* size 24 */
    unsigned char a0;   /* +0x0 size 0 */
    unsigned char a1;   /* +0x1 size 0 */
    unsigned char a2;   /* +0x2 size 0 */
    unsigned char len;   /* +0x3 size 0 */
    unsigned long tpage;   /* +0x4 size 0 */
    unsigned char r;   /* +0x8 size 0 */
    unsigned char g;   /* +0x9 size 0 */
    unsigned char b;   /* +0xA size 0 */
    unsigned char code;   /* +0xB size 0 */
    unsigned long xy;   /* +0xC size 0 */
    unsigned char u;   /* +0x10 size 0 */
    unsigned char v;   /* +0x11 size 0 */
    unsigned short clut;   /* +0x12 size 0 */
    unsigned long wh;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct TSPRT TSPRT;
typedef int INTFN();
struct memclassstruct {   /* size 24 */
    char **bottomblock;   /* +0x0 size 0 */
    char **topblock;   /* +0x4 size 0 */
    int pad;   /* +0x8 size 0 */
    int align;   /* +0xC size 0 */
    int cache;   /* +0x10 size 0 */
    int sentinel;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct memclassstruct memclassstruct;
typedef struct memclassstruct MEMORYCLASS;
struct FONTFILE {   /* size 32 */
    unsigned long type;   /* +0x0 size 0 */
    unsigned char first;   /* +0x4 size 0 */
    unsigned char last;   /* +0x5 size 0 */
    unsigned char maxwidth;   /* +0x6 size 0 */
    unsigned char maxheight;   /* +0x7 size 0 */
    unsigned char space;   /* +0x8 size 0 */
    unsigned char yinc;   /* +0x9 size 0 */
    unsigned char baseline;   /* +0xA size 0 */
    char pad1;   /* +0xB size 0 */
    char filesize[4];   /* +0xC size 4 */
    int palette : 16;   /* bit 128 */
    int width : 16;   /* bit 144 */
    int height : 16;   /* bit 160 */
    int xinc : 16;   /* bit 176 */
    int xoffset : 16;   /* bit 192 */
    int yoffset : 16;   /* bit 208 */
    long shape;   /* +0x1C size 0 */
};   /* sizeof 32 */

typedef struct FONTFILE FONTFILE;
struct coordsdef {   /* size 488 */
    int frames;   /* +0x0 size 0 */
    int coords;   /* +0x4 size 0 */
    struct coorddef point[40];   /* +0x8 size 480 */
};   /* sizeof 488 */

typedef struct coordsdef coordsdef;
typedef struct coordsdef COORDS;
struct linedef {   /* size 16 */
    int start;   /* +0x0 size 0 */
    int end;   /* +0x4 size 0 */
    int colour;   /* +0x8 size 0 */
    int thickness;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct linedef linedef;
typedef struct linedef LINE;
struct linesdef {   /* size 656 */
    int lines;   /* +0x0 size 0 */
    int basex;   /* +0x4 size 0 */
    int basey;   /* +0x8 size 0 */
    int basez;   /* +0xC size 0 */
    struct linedef line[40];   /* +0x10 size 640 */
};   /* sizeof 656 */

typedef struct linesdef linesdef;
typedef struct linesdef LINES;
struct dirangledef {   /* size 12 */
    int heading;   /* +0x0 size 0 */
    int pitch;   /* +0x4 size 0 */
    int roll;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct dirangledef dirangledef;
typedef struct dirangledef DIRANGLES;
struct arcangledef {   /* size 28 */
    int orientation;   /* +0x0 size 0 */
    int heading;   /* +0x4 size 0 */
    int pitch;   /* +0x8 size 0 */
    int roll;   /* +0xC size 0 */
    int vheading;   /* +0x10 size 0 */
    int vpitch;   /* +0x14 size 0 */
    int vroll;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct arcangledef arcangledef;
typedef struct arcangledef ARCANGLES;
struct SHAPETABLEENTRY {   /* size 8 */
    char id[4];   /* +0x0 size 4 */
    long offset;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct SHAPETABLEENTRY SHAPETABLEENTRY;
struct SHAPEFILE {   /* size 24 */
    char type[4];   /* +0x0 size 4 */
    long len;   /* +0x4 size 0 */
    long num;   /* +0x8 size 0 */
    char creator[4];   /* +0xC size 4 */
    struct SHAPETABLEENTRY tbl[1];   /* +0x10 size 8 */
};   /* sizeof 24 */

typedef struct SHAPEFILE SHAPEFILE;
struct radialsymdef {   /* size 20 */
    int maxindex;   /* +0x0 size 0 */
    int shiftcount;   /* +0x4 size 0 */
    int delta;   /* +0x8 size 0 */
    int scalefactor;   /* +0xC size 0 */
    struct shapetbl **shapes;   /* +0x10 size 20 */
};   /* sizeof 20 */

typedef struct radialsymdef radialsymdef;
typedef struct radialsymdef RADIALSYM;
struct graphicsmodeinfostruct {   /* size 20 */
    int width;   /* +0x0 size 0 */
    int height;   /* +0x4 size 0 */
    int bpp;   /* +0x8 size 0 */
    int shapetype;   /* +0xC size 0 */
    int banked : 1;   /* bit 128 */
    int pagedbanks : 1;   /* bit 129 */
    int modex : 1;   /* bit 130 */
    int pageflip : 1;   /* bit 131 */
    int zbuffer : 1;   /* bit 132 */
    int hwdram : 1;   /* bit 133 */
    int hwblit : 1;   /* bit 134 */
    int hwfill : 1;   /* bit 135 */
    int hwscale : 1;   /* bit 136 */
    int hwtmask : 1;   /* bit 137 */
    int hwtexture : 1;   /* bit 138 */
    int hwvbl : 1;   /* bit 139 */
};   /* sizeof 20 */

typedef struct graphicsmodeinfostruct graphicsmodeinfostruct;
typedef struct graphicsmodeinfostruct GRAPHICSMODEINFO;
typedef void MVI;
typedef int EACHOOKCALLBACKFUNC();
typedef int arg_t;
struct chunkhdrstruct {   /* size 8 */
    int type;   /* +0x0 size 0 */
    int size;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct chunkhdrstruct chunkhdrstruct;
typedef struct chunkhdrstruct CHUNKHDR;
struct chunkhdrchkstruct {   /* size 12 */
    int type;   /* +0x0 size 0 */
    int size;   /* +0x4 size 0 */
    int crc;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct chunkhdrchkstruct chunkhdrchkstruct;
typedef struct chunkhdrchkstruct CHUNKHDRCHK;
typedef void THREADPROC();
typedef int SYSTEMTASK();
struct UNIQUEID {   /* size 16 */
    unsigned long a;   /* +0x0 size 0 */
    unsigned short b;   /* +0x4 size 0 */
    unsigned short c;   /* +0x6 size 0 */
    unsigned char d[8];   /* +0x8 size 8 */
};   /* sizeof 16 */

typedef struct UNIQUEID UNIQUEID;
struct threadstruct {   /* size 16 */
    int item;   /* +0x0 size 0 */
    int stacksize;   /* +0x4 size 0 */
    int priority;   /* +0x8 size 0 */
    int processor;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct threadstruct threadstruct;
typedef struct threadstruct THREAD;
struct cdstreamstruct {   /* size 152 */
    long id;   /* +0x0 size 0 */
    char *start;   /* +0x4 size 0 */
    char *end;   /* +0x8 size 0 */
    char *write;   /* +0xC size 0 */
    char *header;   /* +0x10 size 0 */
    char *get;   /* +0x14 size 0 */
    char *release;   /* +0x18 size 0 */
    int handle;   /* +0x1C size 0 */
    int state;   /* +0x20 size 0 */
    int control;   /* +0x24 size 0 */
    int status;   /* +0x28 size 0 */
    int abort;   /* +0x2C size 0 */
    int datahascrc;   /* +0x30 size 0 */
    int crcerrors;   /* +0x34 size 0 */
    int crcretries;   /* +0x38 size 0 */
    int buffersize;   /* +0x3C size 0 */
    long blocksize;   /* +0x40 size 0 */
    int readsize;   /* +0x44 size 0 */
    int chunksize;   /* +0x48 size 0 */
    int relocationsize;   /* +0x4C size 0 */
    long fileoffset;   /* +0x50 size 0 */
    int fileend;   /* +0x54 size 0 */
    long filesize;   /* +0x58 size 0 */
    int dataoffset;   /* +0x5C size 0 */
    int seekposition;   /* +0x60 size 0 */
    int seekoffset;   /* +0x64 size 0 */
    int idtype;   /* +0x68 size 0 */
    int idmask;   /* +0x6C size 0 */
    struct cdstreamstruct *nextstream;   /* +0x70 size 152 */
    void *emptyblock;   /* +0x74 size 0 */
    void *head;   /* +0x78 size 0 */
    void *tail;   /* +0x7C size 0 */
    void *block;   /* +0x80 size 0 */
    int timer;   /* +0x84 size 0 */
    int blocktime;   /* +0x88 size 0 */
    int streamfull;   /* +0x8C size 0 */
    int getable;   /* +0x90 size 0 */
    int releaseable;   /* +0x94 size 0 */
};   /* sizeof 152 */

typedef struct cdstreamstruct cdstreamstruct;
typedef struct cdstreamstruct CDSTREAM;
struct STREAM {   /* size 20 */
    unsigned long Offset;   /* +0x0 size 0 */
    unsigned long Size;   /* +0x4 size 0 */
    unsigned char Name[12];   /* +0x8 size 12 */
};   /* sizeof 20 */

typedef struct STREAM STREAM;
struct STRHDR {   /* size 20 */
    unsigned char Name[12];   /* +0x0 size 12 */
    unsigned long Offset;   /* +0xC size 0 */
    int Size;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct STRHDR STRHDR;
struct SFXHDR {   /* size 132 */
    char used;   /* +0x0 size 0 */
    char loop;   /* +0x1 size 0 */
    char playing;   /* +0x2 size 0 */
    char state;   /* +0x3 size 0 */
    BOOL TaskAlive;   /* +0x4 size 0 */
    struct STRHDR *StreamHND;   /* +0x8 size 20 */
    unsigned char type;   /* +0xC size 0 */
    unsigned char ChunkGot;   /* +0xD size 0 */
    int voice;   /* +0x10 size 0 */
    int volume;   /* +0x14 size 0 */
    int s_volume;   /* +0x18 size 0 */
    int pitch;   /* +0x1C size 0 */
    int stream_sec;   /* +0x20 size 0 */
    int stream_offs;   /* +0x24 size 0 */
    int stream_read;   /* +0x28 size 0 */
    int stream_stall;   /* +0x2C size 0 */
    int stream_pos;   /* +0x30 size 0 */
    int SPU_frame;   /* +0x34 size 0 */
    int SPU_sec;   /* +0x38 size 0 */
    int SPU_pos;   /* +0x3C size 0 */
    int SPUstreamaddr;   /* +0x40 size 0 */
    int framecount;   /* +0x44 size 0 */
    int lastcount;   /* +0x48 size 0 */
    int sec_num;   /* +0x4C size 0 */
    int SPU_sec_num;   /* +0x50 size 0 */
    int ah;   /* +0x54 size 0 */
    int stream_ending;   /* +0x58 size 0 */
    int DMA_size;   /* +0x5C size 0 */
    int spu_rate;   /* +0x60 size 0 */
    int SizeIn;   /* +0x64 size 0 */
    unsigned char *mem;   /* +0x68 size 0 */
    unsigned long stream_playing;   /* +0x6C size 0 */
    int SfxNo;   /* +0x70 size 0 */
    char name[14];   /* +0x74 size 14 */
};   /* sizeof 132 */

typedef struct SFXHDR SFXHDR;
enum OVER_TYPE {
    OVR_FMV = 4,
    OVR_FRONTEND = 3,
    OVR_GAME = 2,
    OVR_PREGAME = 1,
    OVR_NONE = 0,
};

typedef enum OVER_TYPE OVER_TYPE;
typedef unsigned short DECDCTTAB[34816];
struct DECDCTENV {   /* size 256 */
    unsigned char iq_y[64];   /* +0x0 size 64 */
    unsigned char iq_c[64];   /* +0x40 size 64 */
    short dct[64];   /* +0x80 size 128 */
};   /* sizeof 256 */

typedef struct DECDCTENV DECDCTENV;
struct ENCSPUENV {   /* size 24 */
    short *src;   /* +0x0 size 0 */
    short *dest;   /* +0x4 size 0 */
    short *work;   /* +0x8 size 0 */
    long size;   /* +0xC size 0 */
    long loop_start;   /* +0x10 size 0 */
    char loop;   /* +0x14 size 0 */
    char byte_swap;   /* +0x15 size 0 */
    char proceed;   /* +0x16 size 0 */
    char pad4;   /* +0x17 size 0 */
};   /* sizeof 24 */

typedef struct ENCSPUENV ENCSPUENV;
struct SpuVolume {   /* size 4 */
    short left;   /* +0x0 size 0 */
    short right;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct SpuVolume SpuVolume;
struct SpuVoiceAttr {   /* size 64 */
    unsigned long voice;   /* +0x0 size 0 */
    unsigned long mask;   /* +0x4 size 0 */
    struct SpuVolume volume;   /* +0x8 size 4 */
    struct SpuVolume volmode;   /* +0xC size 4 */
    struct SpuVolume volumex;   /* +0x10 size 4 */
    unsigned short pitch;   /* +0x14 size 0 */
    unsigned short note;   /* +0x16 size 0 */
    unsigned short sample_note;   /* +0x18 size 0 */
    short envx;   /* +0x1A size 0 */
    unsigned long addr;   /* +0x1C size 0 */
    unsigned long loop_addr;   /* +0x20 size 0 */
    long a_mode;   /* +0x24 size 0 */
    long s_mode;   /* +0x28 size 0 */
    long r_mode;   /* +0x2C size 0 */
    unsigned short ar;   /* +0x30 size 0 */
    unsigned short dr;   /* +0x32 size 0 */
    unsigned short sr;   /* +0x34 size 0 */
    unsigned short rr;   /* +0x36 size 0 */
    unsigned short sl;   /* +0x38 size 0 */
    unsigned short adsr1;   /* +0x3A size 0 */
    unsigned short adsr2;   /* +0x3C size 0 */
};   /* sizeof 64 */

typedef struct SpuVoiceAttr SpuVoiceAttr;
struct SpuReverbAttr {   /* size 20 */
    unsigned long mask;   /* +0x0 size 0 */
    long mode;   /* +0x4 size 0 */
    struct SpuVolume depth;   /* +0x8 size 4 */
    long delay;   /* +0xC size 0 */
    long feedback;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct SpuReverbAttr SpuReverbAttr;
struct SpuDecodedData {   /* size 4096 */
    short cd_left[512];   /* +0x0 size 1024 */
    short cd_right[512];   /* +0x400 size 1024 */
    short voice1[512];   /* +0x800 size 1024 */
    short voice3[512];   /* +0xC00 size 1024 */
};   /* sizeof 4096 */

typedef struct SpuDecodedData SpuDecodedData;
typedef struct SpuDecodedData SpuDecodeData;
struct SpuExtAttr {   /* size 12 */
    struct SpuVolume volume;   /* +0x0 size 4 */
    long reverb;   /* +0x4 size 0 */
    long mix;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct SpuExtAttr SpuExtAttr;
struct SpuCommonAttr {   /* size 40 */
    unsigned long mask;   /* +0x0 size 0 */
    struct SpuVolume mvol;   /* +0x4 size 4 */
    struct SpuVolume mvolmode;   /* +0x8 size 4 */
    struct SpuVolume mvolx;   /* +0xC size 4 */
    struct SpuExtAttr cd;   /* +0x10 size 12 */
    struct SpuExtAttr ext;   /* +0x1C size 12 */
};   /* sizeof 40 */

typedef struct SpuCommonAttr SpuCommonAttr;
typedef void (*SpuIRQCallbackProc)();
typedef void (*SpuTransferCallbackProc)();
struct SpuEnv {   /* size 8 */
    unsigned long mask;   /* +0x0 size 0 */
    unsigned long queueing;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct SpuEnv SpuEnv;
struct SpuStVoiceAttr {   /* size 16 */
    char status;   /* +0x0 size 0 */
    char pad1;   /* +0x1 size 0 */
    char pad2;   /* +0x2 size 0 */
    char pad3;   /* +0x3 size 0 */
    long last_size;   /* +0x4 size 0 */
    unsigned long buf_addr;   /* +0x8 size 0 */
    unsigned long data_addr;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct SpuStVoiceAttr SpuStVoiceAttr;
struct SpuStEnv {   /* size 392 */
    long size;   /* +0x0 size 0 */
    long low_priority;   /* +0x4 size 0 */
    struct SpuStVoiceAttr voice[24];   /* +0x8 size 384 */
};   /* sizeof 392 */

typedef struct SpuStEnv SpuStEnv;
typedef void (*SpuStCallbackProc)();
struct VabHdr {   /* size 32 */
    long form;   /* +0x0 size 0 */
    long ver;   /* +0x4 size 0 */
    long id;   /* +0x8 size 0 */
    unsigned long fsize;   /* +0xC size 0 */
    unsigned short reserved0;   /* +0x10 size 0 */
    unsigned short ps;   /* +0x12 size 0 */
    unsigned short ts;   /* +0x14 size 0 */
    unsigned short vs;   /* +0x16 size 0 */
    unsigned char mvol;   /* +0x18 size 0 */
    unsigned char pan;   /* +0x19 size 0 */
    unsigned char attr1;   /* +0x1A size 0 */
    unsigned char attr2;   /* +0x1B size 0 */
    unsigned long reserved1;   /* +0x1C size 0 */
};   /* sizeof 32 */

typedef struct VabHdr VabHdr;
struct ProgAtr {   /* size 16 */
    unsigned char tones;   /* +0x0 size 0 */
    unsigned char mvol;   /* +0x1 size 0 */
    unsigned char prior;   /* +0x2 size 0 */
    unsigned char mode;   /* +0x3 size 0 */
    unsigned char mpan;   /* +0x4 size 0 */
    char reserved0;   /* +0x5 size 0 */
    short attr;   /* +0x6 size 0 */
    unsigned long reserved1;   /* +0x8 size 0 */
    unsigned long reserved2;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct ProgAtr ProgAtr;
struct VagAtr {   /* size 32 */
    unsigned char prior;   /* +0x0 size 0 */
    unsigned char mode;   /* +0x1 size 0 */
    unsigned char vol;   /* +0x2 size 0 */
    unsigned char pan;   /* +0x3 size 0 */
    unsigned char center;   /* +0x4 size 0 */
    unsigned char shift;   /* +0x5 size 0 */
    unsigned char min;   /* +0x6 size 0 */
    unsigned char max;   /* +0x7 size 0 */
    unsigned char vibW;   /* +0x8 size 0 */
    unsigned char vibT;   /* +0x9 size 0 */
    unsigned char porW;   /* +0xA size 0 */
    unsigned char porT;   /* +0xB size 0 */
    unsigned char pbmin;   /* +0xC size 0 */
    unsigned char pbmax;   /* +0xD size 0 */
    unsigned char reserved1;   /* +0xE size 0 */
    unsigned char reserved2;   /* +0xF size 0 */
    unsigned short adsr1;   /* +0x10 size 0 */
    unsigned short adsr2;   /* +0x12 size 0 */
    short prog;   /* +0x14 size 0 */
    short vag;   /* +0x16 size 0 */
    short reserved[4];   /* +0x18 size 8 */
};   /* sizeof 32 */

typedef struct VagAtr VagAtr;
struct SndVolume {   /* size 4 */
    unsigned short left;   /* +0x0 size 0 */
    unsigned short right;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct SndVolume SndVolume;
struct SndVolume2 {   /* size 4 */
    short left;   /* +0x0 size 0 */
    short right;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct SndVolume2 SndVolume2;
struct SndRegisterAttr {   /* size 14 */
    struct SndVolume2 volume;   /* +0x0 size 4 */
    short pitch;   /* +0x4 size 0 */
    short mask;   /* +0x6 size 0 */
    short addr;   /* +0x8 size 0 */
    short adsr1;   /* +0xA size 0 */
    short adsr2;   /* +0xC size 0 */
};   /* sizeof 14 */

typedef struct SndRegisterAttr SndRegisterAttr;
struct SndVoiceStats {   /* size 18 */
    short vagId;   /* +0x0 size 0 */
    short vabId;   /* +0x2 size 0 */
    unsigned short pitch;   /* +0x4 size 0 */
    short note;   /* +0x6 size 0 */
    short tone;   /* +0x8 size 0 */
    short prog_num;   /* +0xA size 0 */
    short prog_actual;   /* +0xC size 0 */
    short vol;   /* +0xE size 0 */
    short pan;   /* +0x10 size 0 */
};   /* sizeof 18 */

typedef struct SndVoiceStats SndVoiceStats;
typedef void (*SsMarkCallbackProc)();
struct _SsFCALL {   /* size 148 */
    void (*noteon)();   /* +0x0 size 0 */
    void (*programchange)();   /* +0x4 size 0 */
    void (*pitchbend)();   /* +0x8 size 0 */
    void (*metaevent)();   /* +0xC size 0 */
    void (*control[13])();   /* +0x10 size 52 */
    void (*ccentry[20])();   /* +0x44 size 80 */
};   /* sizeof 148 */

typedef struct _SsFCALL _SsFCALL;
typedef void (*MissPrintPtr)();
struct MissileStruct {   /* size 76 */
    long _mixvel;   /* +0x0 size 0 */
    long _miyvel;   /* +0x4 size 0 */
    long _mitxoff;   /* +0x8 size 0 */
    long _mityoff;   /* +0xC size 0 */
    int _midam;   /* +0x10 size 0 */
    int _mirnd;   /* +0x14 size 0 */
    unsigned short _mirange;   /* +0x18 size 0 */
    unsigned short _micaster;   /* +0x1A size 0 */
    short _midist;   /* +0x1C size 0 */
    short _miVar1;   /* +0x1E size 0 */
    short _miVar2;   /* +0x20 size 0 */
    short _miVar3;   /* +0x22 size 0 */
    short _miVar4;   /* +0x24 size 0 */
    short _miVar5;   /* +0x26 size 0 */
    short _miVar6;   /* +0x28 size 0 */
    short _miVar7;   /* +0x2A size 0 */
    short _miVar8;   /* +0x2C size 0 */
    short _misource;   /* +0x2E size 0 */
    char _mitype;   /* +0x30 size 0 */
    char _mix;   /* +0x31 size 0 */
    char _miy;   /* +0x32 size 0 */
    char _mixoff;   /* +0x33 size 0 */
    char _miyoff;   /* +0x34 size 0 */
    char _misx;   /* +0x35 size 0 */
    char _misy;   /* +0x36 size 0 */
    unsigned char _miAnimType;   /* +0x37 size 0 */
    unsigned char _miDelFlag;   /* +0x38 size 0 */
    unsigned char _miAnimFlags;   /* +0x39 size 0 */
    unsigned char _miDrawFlag;   /* +0x3A size 0 */
    unsigned char _miLightFlag;   /* +0x3B size 0 */
    unsigned char _miPreFlag;   /* +0x3C size 0 */
    unsigned char _miHitFlag;   /* +0x3D size 0 */
    char _mlid;   /* +0x3E size 0 */
    char _mimfnum;   /* +0x3F size 0 */
    char _mispllvl;   /* +0x40 size 0 */
    char _miAnimDelay;   /* +0x41 size 0 */
    char _miAnimLen;   /* +0x42 size 0 */
    char _miAnimWidth;   /* +0x43 size 0 */
    char _miAnimWidth2;   /* +0x44 size 0 */
    char _miAnimCnt;   /* +0x45 size 0 */
    char _miAnimAdd;   /* +0x46 size 0 */
    char _miAnimFrame;   /* +0x47 size 0 */
    void (*PrintPtr)();   /* +0x48 size 0 */
};   /* sizeof 76 */

typedef struct MissileStruct MissileStruct;
struct SPELLFX_DAT {   /* size 72 */
    BOOL apocactive;   /* +0x0 size 0 */
    BOOL healactive;   /* +0x4 size 0 */
    int teleflag;   /* +0x8 size 0 */
    int phaseflag;   /* +0xC size 0 */
    int inviscount;   /* +0x10 size 0 */
    int X;   /* +0x14 size 0 */
    int Y;   /* +0x18 size 0 */
    int sxoff;   /* +0x1C size 0 */
    int syoff;   /* +0x20 size 0 */
    int scrnx;   /* +0x24 size 0 */
    int scrny;   /* +0x28 size 0 */
    int px;   /* +0x2C size 0 */
    int py;   /* +0x30 size 0 */
    int yoffset;   /* +0x34 size 0 */
    int spiny1;   /* +0x38 size 0 */
    int spiny2;   /* +0x3C size 0 */
    int scale;   /* +0x40 size 0 */
    int healtime;   /* +0x44 size 0 */
};   /* sizeof 72 */

typedef struct SPELLFX_DAT SPELLFX_DAT;
struct Particle {   /* size 36 */
    int partx;   /* +0x0 size 0 */
    int party;   /* +0x4 size 0 */
    int partanim;   /* +0x8 size 0 */
    int jumpflag;   /* +0xC size 0 */
    int jumpcount;   /* +0x10 size 0 */
    int jumpmax;   /* +0x14 size 0 */
    int dx;   /* +0x18 size 0 */
    int scale;   /* +0x1C size 0 */
    int colour;   /* +0x20 size 0 */
};   /* sizeof 36 */

typedef struct Particle Particle;
struct strheader {   /* size 32 */
    short id;   /* +0x0 size 0 */
    short type;   /* +0x2 size 0 */
    short seccount;   /* +0x4 size 0 */
    short nsectors;   /* +0x6 size 0 */
    int framecount;   /* +0x8 size 0 */
    int framesize;   /* +0xC size 0 */
    short width;   /* +0x10 size 0 */
    short height;   /* +0x12 size 0 */
    int res[3];   /* +0x14 size 12 */
};   /* sizeof 32 */

typedef struct strheader strheader;
typedef int strdata[504];
struct strsec {   /* size 2048 */
    short id;   /* +0x0 size 0 */
    short type;   /* +0x2 size 0 */
    short seccount;   /* +0x4 size 0 */
    short nsectors;   /* +0x6 size 0 */
    int framecount;   /* +0x8 size 0 */
    int framesize;   /* +0xC size 0 */
    short width;   /* +0x10 size 0 */
    short height;   /* +0x12 size 0 */
    int res[3];   /* +0x14 size 12 */
    int data[504];   /* +0x20 size 2016 */
};   /* sizeof 2048 */

typedef struct strsec strsec;
struct mdc_header {   /* size 20 */
    char id[4];   /* +0x0 size 4 */
    int frames;   /* +0x4 size 0 */
    int framesize;   /* +0x8 size 0 */
    int width;   /* +0xC size 0 */
    int height;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct mdc_header mdc_header;
enum ping_status {
    ping_silence = 4,
    ping_new = 3,
    ping_empty = 2,
    ping_error = 1,
    ping_ok = 0,
};

typedef enum ping_status ping_status;
struct file_header {   /* size 512 */
    char magic[2];   /* +0x0 size 2 */
    char type;   /* +0x2 size 0 */
    char blockentry;   /* +0x3 size 0 */
    unsigned char title[64];   /* +0x4 size 64 */
    char reserved[28];   /* +0x44 size 28 */
    char clut[32];   /* +0x60 size 32 */
    char icon[1][128];   /* +0x80 size 128 */
    int chksum;   /* +0x100 size 0 */
    int size;   /* +0x104 size 0 */
    int id;   /* +0x108 size 0 */
    char icon2[1][116];   /* +0x10C size 116 */
    char icon3[1][128];   /* +0x180 size 128 */
};   /* sizeof 512 */

typedef struct file_header file_header;
enum write_ret {
    write_no_card = 3,
    write_no_space = 2,
    write_error = 1,
    write_ok = 0,
};

typedef enum write_ret write_ret;
enum read_ret {
    read_no_card = 3,
    read_invalid = 2,
    read_error = 1,
    read_ok = 0,
};

typedef enum read_ret read_ret;
enum card_events {
    cardevent_removed = 8,
    cardevent_initialise = 7,
    cardevent_error = 6,
    cardevent_deleting = 5,
    cardevent_formatting = 4,
    cardevent_loading = 3,
    cardevent_saving = 2,
    cardevent_inserted = 1,
    cardevent_directory = 0,
};

typedef enum card_events card_events;
enum hw_event {
    hw_silence = 4,
    hw_error = 3,
    hw_new = 2,
    hw_empty = 1,
    hw_end = 0,
};

typedef enum hw_event hw_event;
enum .130fake {
    CUTLOAD_SCREEN = 11,
    CUTBEGIN_SCREEN = 10,
    PANDB_SCREEN = 9,
    CUTGATE_SCREEN = 8,
    CUTSTART_SCREEN = 7,
    CUTPORTR_SCREEN = 6,
    CUTPORTL_SCREEN = 5,
    CUT4_SCREEN = 4,
    CUT3_SCREEN = 3,
    CUT2_SCREEN = 2,
    CUTL1D_SCREEN = 1,
    CUTTT_SCREEN = 0,
};

typedef void (*FeFuncPtr)();
struct FeTable {   /* size 28 */
    int Title;   /* +0x0 size 0 */
    int Sel;   /* +0x4 size 0 */
    int SelW;   /* +0x8 size 0 */
    int SelH;   /* +0xC size 0 */
    void (*InitFuncPtr)();   /* +0x10 size 0 */
    void (*CtrlFuncPtr)();   /* +0x14 size 0 */
    void *PrevMenu;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct FeTable FeTable;
struct FeStruct {   /* size 24 */
    int X;   /* +0x0 size 0 */
    int Y;   /* +0x4 size 0 */
    enum TXT_JUST Just;   /* +0x8 size 4 */
    int Str;   /* +0xC size 0 */
    struct CFont *Font;   /* +0x10 size 540 */
    struct FeTable *MenuPtr;   /* +0x14 size 28 */
};   /* sizeof 24 */

typedef struct FeStruct FeStruct;
struct FE_PLR {   /* size 16 */
    char Name[10];   /* +0x0 size 10 */
    int Class;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct FE_PLR FE_PLR;
struct FE_CREATE {   /* size 36 */
    int NumOfPlayers;   /* +0x0 size 0 */
    struct FE_PLR Plrs[2];   /* +0x4 size 32 */
};   /* sizeof 36 */

typedef struct FE_CREATE FE_CREATE;
struct OrigPkItemStruct {   /* size 20 */
    int iSeed;   /* +0x0 size 0 */
    unsigned short iCreateInfo;   /* +0x4 size 0 */
    unsigned short idx;   /* +0x6 size 0 */
    unsigned char bId;   /* +0x8 size 0 */
    unsigned char bDur;   /* +0x9 size 0 */
    unsigned char bMDur;   /* +0xA size 0 */
    unsigned char bCh;   /* +0xB size 0 */
    unsigned char bMCh;   /* +0xC size 0 */
    unsigned short wValue;   /* +0xE size 0 */
    unsigned long dwBuff;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct OrigPkItemStruct OrigPkItemStruct;
struct PcPkItemStruct {   /* size 19 */
    unsigned char Shite[19];   /* +0x0 size 19 */
};   /* sizeof 19 */

typedef struct PcPkItemStruct PcPkItemStruct;
struct PcPkPlayerStruct {   /* size 1240 */
    struct FILETIME archiveTime;   /* +0x0 size 8 */
    unsigned char destAction;   /* +0x8 size 0 */
    unsigned char destParam1;   /* +0x9 size 0 */
    unsigned char destParam2;   /* +0xA size 0 */
    unsigned char plrlevel;   /* +0xB size 0 */
    unsigned char px;   /* +0xC size 0 */
    unsigned char py;   /* +0xD size 0 */
    char pName[32];   /* +0xE size 32 */
    unsigned char pClass;   /* +0x2E size 0 */
    unsigned char pBaseStr;   /* +0x2F size 0 */
    unsigned char pBaseMag;   /* +0x30 size 0 */
    unsigned char pBaseDex;   /* +0x31 size 0 */
    unsigned char pBaseVit;   /* +0x32 size 0 */
    unsigned char pLevel;   /* +0x33 size 0 */
    unsigned char pStatPts;   /* +0x34 size 0 */
    int pExperience : 32;   /* bit 424 */
    int pGold : 32;   /* bit 456 */
    int pHPBase : 32;   /* bit 488 */
    int pMaxHPBase : 32;   /* bit 520 */
    int pManaBase : 32;   /* bit 552 */
    int pMaxManaBase : 32;   /* bit 584 */
    unsigned char pSplLvl[37];   /* +0x4D size 37 */
    int pMemSpells : 32;   /* bit 912 */
    int pMemSpells2 : 32;   /* bit 944 */
    struct PcPkItemStruct InvBody[7];   /* +0x7A size 133 */
    struct PcPkItemStruct InvList[40];   /* +0xFF size 760 */
    char InvGrid[40];   /* +0x3F7 size 40 */
    unsigned char _pNumInv;   /* +0x41F size 0 */
    struct PcPkItemStruct SpdList[8];   /* +0x420 size 152 */
    unsigned char Pad[24];   /* +0x4B8 size 24 */
    int pDiabloKillLevel : 32;   /* bit 9856 */
    char DeadLevel;   /* +0x4D4 size 0 */
};   /* sizeof 1240 */

typedef struct PcPkPlayerStruct PcPkPlayerStruct;
struct PkItemStruct {   /* size 20 */
    unsigned int dwBuff : 32;   /* bit 0 */
    int iSeed : 32;   /* bit 32 */
    unsigned int iCreateInfo : 16;   /* bit 64 */
    unsigned int idx : 16;   /* bit 80 */
    unsigned int wValue : 16;   /* bit 96 */
    unsigned int bId : 8;   /* bit 112 */
    unsigned int bDur : 8;   /* bit 120 */
    unsigned int bMDur : 8;   /* bit 128 */
    unsigned int bCh : 8;   /* bit 136 */
    unsigned int bMCh : 8;   /* bit 144 */
};   /* sizeof 20 */

typedef struct PkItemStruct PkItemStruct;
struct PkPlayerStruct {   /* size 1272 */
    struct PkItemStruct SpdList[8];   /* +0x0 size 160 */
    struct PkItemStruct InvBody[7];   /* +0xA0 size 140 */
    struct PkItemStruct InvList[40];   /* +0x12C size 800 */
    unsigned long pMemSpells;   /* +0x450 size 0 */
    struct FILETIME archiveTime;   /* +0x458 size 8 */
    long pExperience;   /* +0x460 size 0 */
    long pHPBase;   /* +0x464 size 0 */
    long pMaxHPBase;   /* +0x468 size 0 */
    long pManaBase;   /* +0x46C size 0 */
    long pMaxManaBase;   /* +0x470 size 0 */
    int pRSpell;   /* +0x474 size 0 */
    char pName[32];   /* +0x478 size 32 */
    char InvGrid[40];   /* +0x498 size 40 */
    unsigned char pSplLvl[37];   /* +0x4C0 size 37 */
    unsigned char destAction;   /* +0x4E5 size 0 */
    unsigned char destParam1;   /* +0x4E6 size 0 */
    unsigned char destParam2;   /* +0x4E7 size 0 */
    unsigned char plrlevel;   /* +0x4E8 size 0 */
    unsigned char pClass;   /* +0x4E9 size 0 */
    unsigned char pBaseStr;   /* +0x4EA size 0 */
    unsigned char pBaseMag;   /* +0x4EB size 0 */
    unsigned char pBaseDex;   /* +0x4EC size 0 */
    unsigned char pBaseVit;   /* +0x4ED size 0 */
    unsigned char pLevel;   /* +0x4EE size 0 */
    unsigned char pStatPts;   /* +0x4EF size 0 */
    char DeadLevel;   /* +0x4F0 size 0 */
    unsigned char _pNumInv;   /* +0x4F1 size 0 */
    char pRSplType;   /* +0x4F2 size 0 */
};   /* sizeof 1272 */

typedef struct PkPlayerStruct PkPlayerStruct;
struct CharDataStructDef {   /* size 7648 */
    struct PkPlayerStruct CharSlots[6];   /* +0x0 size 7632 */
    char ToggleSave[6];   /* +0x1DD0 size 6 */
    char spltypesave[6];   /* +0x1DD6 size 6 */
};   /* sizeof 7648 */

typedef struct CharDataStructDef CharDataStructDef;
enum KANJI_FRMS {
    KANJI_MAIN = 1,
    KANJI_QUEST = 0,
};

typedef enum KANJI_FRMS KANJI_FRMS;
struct LOAD_IMAGE_ARGS {   /* size 28 */
    struct RECT Rect;   /* +0x0 size 8 */
    unsigned int UseAddr : 1;   /* bit 64 */
    unsigned int DiscardAfterDump : 1;   /* bit 65 */
    unsigned int IsMove : 1;   /* bit 66 */
    int Offset;   /* +0xC size 0 */
    long ImgHandle;   /* +0x10 size 0 */
    void *Addr;   /* +0x14 size 0 */
    unsigned short DestX;   /* +0x18 size 0 */
    unsigned short DestY;   /* +0x1A size 0 */
};   /* sizeof 28 */

typedef struct LOAD_IMAGE_ARGS LOAD_IMAGE_ARGS;
struct PRIM_BUFFER {   /* size 28 */
    struct POLY_FT4 *Prims;   /* +0x0 size 40 */
    struct POLY_FT4 *EndAddr;   /* +0x4 size 40 */
    unsigned long *OtList;   /* +0x8 size 0 */
    unsigned char Drawing;   /* +0xC size 0 */
    int OtSize;   /* +0x10 size 0 */
    long hndOtList;   /* +0x14 size 0 */
    long hndPrims;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct PRIM_BUFFER PRIM_BUFFER;
enum TPAGE_TYPES {
    TPAGE_16BIT = 2,
    TPAGE_8BIT = 1,
    TPAGE_4BIT = 0,
};

typedef enum TPAGE_TYPES TPAGE_TYPES;
struct TP_LINK {   /* size 8 */
    struct TPAGE_DEF *Next;   /* +0x0 size 0 */
    struct TPAGE_DEF *Prev;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct TP_LINK TP_LINK;
union .131fake {   /* size 8 */
    struct TP_LINK TpLink;   /* +0x0 size 8 */
    struct DR_TPAGE DrTpage;   /* +0x0 size 8 */
};   /* sizeof 8 */

struct TPAGE_DEF {   /* size 16 */
    union .131fake LPage;   /* +0x0 size 8 */
    unsigned char TpageMode;   /* +0x8 size 0 */
    unsigned char Offset;   /* +0x9 size 0 */
    unsigned char Height;   /* +0xA size 0 */
    unsigned char Indent;   /* +0xB size 0 */
    unsigned char Width;   /* +0xC size 0 */
    unsigned char Num;   /* +0xD size 0 */
};   /* sizeof 16 */

typedef struct TPAGE_DEF TPAGE_DEF;
struct MEM_INFO {   /* size 8 */
    void *Addr;   /* +0x0 size 0 */
    unsigned long Size;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct MEM_INFO MEM_INFO;
enum FILE_SYSTEM {
    FS_CD = 1,
    FS_PC = 0,
};

typedef enum FILE_SYSTEM FILE_SYSTEM;
enum DEV_KIT {
    DK_CLIMAX = 2,
    DK_SONY_PCI = 1,
    DK_SONY_ISA = 0,
};

typedef enum DEV_KIT DEV_KIT;
struct LNK_OPTS {   /* size 32 */
    unsigned long RamSize;   /* +0x0 size 0 */
    unsigned long StackSize;   /* +0x4 size 0 */
    void *OrgAddress;   /* +0x8 size 0 */
    void *FreeMemAddress;   /* +0xC size 0 */
    unsigned long FreeMemSize;   /* +0x10 size 0 */
    enum FILE_SYSTEM FileSystem;   /* +0x14 size 4 */
    enum DEV_KIT DevKit;   /* +0x18 size 4 */
    unsigned long NoQuests;   /* +0x1C size 0 */
};   /* sizeof 32 */

typedef struct LNK_OPTS LNK_OPTS;
struct DatIO {   /* size 20 */
    struct FileIO FileIO;   /* +0x0 size 20 */
};   /* sizeof 20 */

typedef struct DatIO DatIO;
struct bank_entry {   /* size 12 */
    unsigned short Name;   /* +0x0 size 0 */
    unsigned long offset;   /* +0x4 size 0 */
    unsigned short len;   /* +0x8 size 0 */
    unsigned short pitch;   /* +0xA size 0 */
};   /* sizeof 12 */

typedef struct bank_entry bank_entry;
struct PanelXY {   /* size 88 */
    int MainX;   /* +0x0 size 0 */
    int MainY;   /* +0x4 size 0 */
    int FlaskFlip;   /* +0x8 size 0 */
    int SpeedBarXOfs;   /* +0xC size 0 */
    int SpeedBarYOfs;   /* +0x10 size 0 */
    int SpellXOfs;   /* +0x14 size 0 */
    int SpellYOfs;   /* +0x18 size 0 */
    int LevelUpXOfs;   /* +0x1C size 0 */
    int LevelUpYOfs;   /* +0x20 size 0 */
    int MsgX;   /* +0x24 size 0 */
    int MsgY;   /* +0x28 size 0 */
    int MsgW;   /* +0x2C size 0 */
    int MsgH;   /* +0x30 size 0 */
    int HeadDurX;   /* +0x34 size 0 */
    int HeadDurY;   /* +0x38 size 0 */
    int BodyDurX;   /* +0x3C size 0 */
    int BodyDurY;   /* +0x40 size 0 */
    int Hand0DurX;   /* +0x44 size 0 */
    int Hand0DurY;   /* +0x48 size 0 */
    int Hand1DurX;   /* +0x4C size 0 */
    int Hand1DurY;   /* +0x50 size 0 */
    unsigned char WhichPlayerDoesThisPanelReallyBelongToThen;   /* +0x54 size 0 */
};   /* sizeof 88 */

typedef struct PanelXY PanelXY;
struct GPanel {   /* size 28 */
    int HealthAnimCount;   /* +0x0 size 0 */
    int ManaAnimCount;   /* +0x4 size 0 */
    int GlobeAnimCount;   /* +0x8 size 0 */
    struct RECT MsgRect;   /* +0xC size 8 */
    struct TextDat *PanelTData;   /* +0x14 size 112 */
    int GPanelOt;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct GPanel GPanel;
struct RgbTest {   /* size 28 */
    unsigned long Scale;   /* +0x0 size 0 */
    unsigned long IR0;   /* +0x4 size 0 */
    unsigned long IR1;   /* +0x8 size 0 */
    unsigned long IR2;   /* +0xC size 0 */
    unsigned char r0;   /* +0x10 size 0 */
    unsigned char g0;   /* +0x11 size 0 */
    unsigned char b0;   /* +0x12 size 0 */
    unsigned char pad0;   /* +0x13 size 0 */
    unsigned char r1;   /* +0x14 size 0 */
    unsigned char g1;   /* +0x15 size 0 */
    unsigned char b1;   /* +0x16 size 0 */
    unsigned char pad1;   /* +0x17 size 0 */
    unsigned char res_r;   /* +0x18 size 0 */
    unsigned char res_g;   /* +0x19 size 0 */
    unsigned char res_b;   /* +0x1A size 0 */
    unsigned char pad2;   /* +0x1B size 0 */
};   /* sizeof 28 */

typedef struct RgbTest RgbTest;
struct DPatsStruct {   /* size 20 */
    int qpat;   /* +0x0 size 0 */
    int d1;   /* +0x4 size 0 */
    int d2;   /* +0x8 size 0 */
    int d3;   /* +0xC size 0 */
    int d4;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct DPatsStruct DPatsStruct;
struct NODE {   /* size 24 */
    int nHallx1;   /* +0x0 size 0 */
    int nHally1;   /* +0x4 size 0 */
    int nHallx2;   /* +0x8 size 0 */
    int nHally2;   /* +0xC size 0 */
    int nHalldir;   /* +0x10 size 0 */
    struct NODE *pNext;   /* +0x14 size 24 */
};   /* sizeof 24 */

typedef struct NODE NODE;
typedef struct NODE HALLNODE;
struct ROOMNODE {   /* size 20 */
    int nRoomx1;   /* +0x0 size 0 */
    int nRoomy1;   /* +0x4 size 0 */
    int nRoomx2;   /* +0x8 size 0 */
    int nRoomy2;   /* +0xC size 0 */
    int nRoomDest;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct ROOMNODE ROOMNODE;
struct STextStruct {   /* size 140 */
    char _sx;   /* +0x0 size 0 */
    char _syoff;   /* +0x1 size 0 */
    char _sstr[128];   /* +0x2 size 128 */
    unsigned char _sjust;   /* +0x82 size 0 */
    char _sclr;   /* +0x83 size 0 */
    unsigned char _sline;   /* +0x84 size 0 */
    unsigned char _ssel;   /* +0x85 size 0 */
    int _sval;   /* +0x88 size 0 */
};   /* sizeof 140 */

typedef struct STextStruct STextStruct;
enum .135fake {
    IS_LEVELUP = 991,
    IS_PICKUP = 990,
    PS_NAR19 = 989,
    PS_NAR18 = 988,
    PS_NAR17 = 987,
    PS_NAR16 = 986,
    PS_NAR15 = 985,
    PS_NAR14 = 984,
    PS_NAR13 = 983,
    PS_NAR12 = 982,
    PS_NAR11 = 981,
    PS_NAR10 = 980,
    IS_TITERR = 979,
    MUSIC_INTRO = 978,
    MUSIC_L4 = 977,
    MUSIC_L3 = 976,
    MUSIC_L2 = 975,
    MUSIC_L1 = 974,
    MUSIC_TOWN = 973,
    MSFX_DMAGS = 972,
    MSFX_DMAGD = 971,
    MSFX_DMAGH = 970,
    MSFX_DMAGA = 969,
    MSFX_DIABLOS = 968,
    MSFX_DIABLOD = 967,
    MSFX_DIABLOH = 966,
    MSFX_DIABLOA = 965,
    MSFX_GOLMS = 964,
    MSFX_GOLMD = 963,
    MSFX_GOLMH = 962,
    MSFX_GOLMA = 961,
    MSFX_MAGES = 960,
    MSFX_MAGED = 959,
    MSFX_MAGEH = 958,
    MSFX_MAGEA = 957,
    MSFX_SCBSS = 956,
    MSFX_SCBSD = 955,
    MSFX_SCBSH = 954,
    MSFX_SCBSA = 953,
    MSFX_BLACKS = 952,
    MSFX_BLACKD = 951,
    MSFX_BLACKH = 950,
    MSFX_BLACKA = 949,
    MSFX_SNAKES = 948,
    MSFX_SNAKED = 947,
    MSFX_SNAKEH = 946,
    MSFX_SNAKEA = 945,
    MSFX_MEGAS = 944,
    MSFX_MEGAD = 943,
    MSFX_MEGAH = 942,
    MSFX_MEGAA = 941,
    MSFX_GARGOS = 940,
    MSFX_GARGOD = 939,
    MSFX_GARGOH = 938,
    MSFX_GARGOA = 937,
    MSFX_BFALS = 936,
    MSFX_BFALD = 935,
    MSFX_BFALH = 934,
    MSFX_BFALA = 933,
    MSFX_THINS = 932,
    MSFX_THIND = 931,
    MSFX_THINH = 930,
    MSFX_THINA = 929,
    MSFX_RHINOS = 928,
    MSFX_RHINOD = 927,
    MSFX_RHINOH = 926,
    MSFX_RHINOA = 925,
    MSFX_MAGMAS = 924,
    MSFX_MAGMAD = 923,
    MSFX_MAGMAH = 922,
    MSFX_MAGMAA = 921,
    MSFX_FATS = 920,
    MSFX_FATD = 919,
    MSFX_FATH = 918,
    MSFX_FATA = 917,
    MSFX_FATCS = 916,
    MSFX_FATCD = 915,
    MSFX_FATCH = 914,
    MSFX_FATCA = 913,
    MSFX_SKINGS = 912,
    MSFX_SKINGD = 911,
    MSFX_SKINGH = 910,
    MSFX_SKINGA = 909,
    MSFX_ACIDS = 908,
    MSFX_ACIDD = 907,
    MSFX_ACIDH = 906,
    MSFX_ACIDA = 905,
    MSFX_GOATBS = 904,
    MSFX_GOATBD = 903,
    MSFX_GOATBH = 902,
    MSFX_GOATBA = 901,
    MSFX_BATS = 900,
    MSFX_BATD = 899,
    MSFX_BATH = 898,
    MSFX_BATA = 897,
    MSFX_GOATS = 896,
    MSFX_GOATD = 895,
    MSFX_GOATH = 894,
    MSFX_GOATA = 893,
    MSFX_GOATLS = 892,
    MSFX_GOATLD = 891,
    MSFX_GOATLH = 890,
    MSFX_GOATLA = 889,
    MSFX_SNEAKS = 888,
    MSFX_SNEAKD = 887,
    MSFX_SNEAKH = 886,
    MSFX_SNEAKA = 885,
    MSFX_SNEAKLS = 884,
    MSFX_SNEAKLD = 883,
    MSFX_SNEAKLH = 882,
    MSFX_SNEAKLA = 881,
    MSFX_SKLBWS = 880,
    MSFX_SKLBWD = 879,
    MSFX_SKLBWH = 878,
    MSFX_SKLBWA = 877,
    MSFX_SCAVS = 876,
    MSFX_SCAVD = 875,
    MSFX_SCAVH = 874,
    MSFX_SCAVA = 873,
    MSFX_SKLAXS = 872,
    MSFX_SKLAXD = 871,
    MSFX_SKLAXH = 870,
    MSFX_SKLAXA = 869,
    MSFX_PHALLS = 868,
    MSFX_PHALLD = 867,
    MSFX_PHALLH = 866,
    MSFX_PHALLA = 865,
    MSFX_ZOMBIES = 864,
    MSFX_ZOMBIED = 863,
    MSFX_ZOMBIEH = 862,
    MSFX_ZOMBIEA = 861,
    USFX_DIABLOD = 860,
    USFX_ZHAR2 = 859,
    USFX_ZHAR1 = 858,
    USFX_WLOCK1 = 857,
    USFX_WARLRD1 = 856,
    USFX_SNOT3 = 855,
    USFX_SNOT2 = 854,
    USFX_SNOT1 = 853,
    USFX_SKING1 = 852,
    USFX_LAZ2 = 851,
    USFX_LAZ1 = 850,
    USFX_LACH3 = 849,
    USFX_LACH2 = 848,
    USFX_LACH1 = 847,
    USFX_IZUAL1 = 846,
    USFX_GARBUD4 = 845,
    USFX_GARBUD3 = 844,
    USFX_GARBUD2 = 843,
    USFX_GARBUD1 = 842,
    USFX_CLEAVER = 841,
    PS_DIABLVLINT = 840,
    PS_NAR9 = 839,
    PS_NAR8 = 838,
    PS_NAR7 = 837,
    PS_NAR6 = 836,
    PS_NAR5 = 835,
    PS_NAR4 = 834,
    PS_NAR3 = 833,
    PS_NAR2 = 832,
    PS_NAR1 = 831,
    PS_WDEATH = 830,
    PS_WARR102 = 829,
    PS_WARR101 = 828,
    PS_WARR100 = 827,
    PS_WARR99 = 826,
    PS_WARR98 = 825,
    PS_WARR97 = 824,
    PS_WARR96B = 823,
    PS_WARR95F = 822,
    PS_WARR95E = 821,
    PS_WARR95D = 820,
    PS_WARR95C = 819,
    PS_WARR95B = 818,
    PS_WARR95 = 817,
    PS_WARR94 = 816,
    PS_WARR93 = 815,
    PS_WARR92 = 814,
    PS_WARR91 = 813,
    PS_WARR90 = 812,
    PS_WARR89 = 811,
    PS_WARR88 = 810,
    PS_WARR87 = 809,
    PS_WARR86 = 808,
    PS_WARR85 = 807,
    PS_WARR84 = 806,
    PS_WARR83 = 805,
    PS_WARR82 = 804,
    PS_WARR81 = 803,
    PS_WARR80 = 802,
    PS_WARR79 = 801,
    PS_WARR78 = 800,
    PS_WARR77 = 799,
    PS_WARR76 = 798,
    PS_WARR75 = 797,
    PS_WARR74 = 796,
    PS_WARR73 = 795,
    PS_WARR72 = 794,
    PS_WARR71 = 793,
    PS_WARR70 = 792,
    PS_WARR69B = 791,
    PS_WARR69 = 790,
    PS_WARR68 = 789,
    PS_WARR67 = 788,
    PS_WARR66 = 787,
    PS_WARR65 = 786,
    PS_WARR64 = 785,
    PS_WARR63 = 784,
    PS_WARR62 = 783,
    PS_WARR61 = 782,
    PS_WARR60 = 781,
    PS_WARR59 = 780,
    PS_WARR58 = 779,
    PS_WARR57 = 778,
    PS_WARR56 = 777,
    PS_WARR55 = 776,
    PS_WARR54 = 775,
    PS_WARR53 = 774,
    PS_WARR52 = 773,
    PS_WARR51 = 772,
    PS_WARR50 = 771,
    PS_WARR49 = 770,
    PS_WARR48 = 769,
    PS_WARR47 = 768,
    PS_WARR46 = 767,
    PS_WARR45 = 766,
    PS_WARR44 = 765,
    PS_WARR43 = 764,
    PS_WARR42 = 763,
    PS_WARR41 = 762,
    PS_WARR40 = 761,
    PS_WARR39 = 760,
    PS_WARR38 = 759,
    PS_WARR37 = 758,
    PS_WARR36 = 757,
    PS_WARR35 = 756,
    PS_WARR34 = 755,
    PS_WARR33 = 754,
    PS_WARR32 = 753,
    PS_WARR31 = 752,
    PS_WARR30 = 751,
    PS_WARR29 = 750,
    PS_WARR28 = 749,
    PS_WARR27 = 748,
    PS_WARR26 = 747,
    PS_WARR25 = 746,
    PS_WARR24 = 745,
    PS_WARR23 = 744,
    PS_WARR22 = 743,
    PS_WARR21 = 742,
    PS_WARR20 = 741,
    PS_WARR19 = 740,
    PS_WARR18 = 739,
    PS_WARR17 = 738,
    PS_WARR16C = 737,
    PS_WARR16B = 736,
    PS_WARR16 = 735,
    PS_WARR15C = 734,
    PS_WARR15B = 733,
    PS_WARR15 = 732,
    PS_WARR14C = 731,
    PS_WARR14B = 730,
    PS_WARR14 = 729,
    PS_WARR13 = 728,
    PS_WARR12 = 727,
    PS_WARR11 = 726,
    PS_WARR10 = 725,
    PS_WARR9 = 724,
    PS_WARR8 = 723,
    PS_WARR7 = 722,
    PS_WARR6 = 721,
    PS_WARR5 = 720,
    PS_WARR4 = 719,
    PS_WARR3 = 718,
    PS_WARR2 = 717,
    PS_WARR1 = 716,
    PS_RDEATH = 715,
    PS_ROGUE102 = 714,
    PS_ROGUE101 = 713,
    PS_ROGUE100 = 712,
    PS_ROGUE99 = 711,
    PS_ROGUE98 = 710,
    PS_ROGUE97 = 709,
    PS_ROGUE96 = 708,
    PS_ROGUE95 = 707,
    PS_ROGUE94 = 706,
    PS_ROGUE93 = 705,
    PS_ROGUE92 = 704,
    PS_ROGUE91 = 703,
    PS_ROGUE90 = 702,
    PS_ROGUE89 = 701,
    PS_ROGUE88 = 700,
    PS_ROGUE87 = 699,
    PS_ROGUE86 = 698,
    PS_ROGUE85 = 697,
    PS_ROGUE84 = 696,
    PS_ROGUE83 = 695,
    PS_ROGUE82 = 694,
    PS_ROGUE81 = 693,
    PS_ROGUE80 = 692,
    PS_ROGUE79 = 691,
    PS_ROGUE78 = 690,
    PS_ROGUE77 = 689,
    PS_ROGUE76 = 688,
    PS_ROGUE75 = 687,
    PS_ROGUE74 = 686,
    PS_ROGUE73 = 685,
    PS_ROGUE72 = 684,
    PS_ROGUE71 = 683,
    PS_ROGUE70 = 682,
    PS_ROGUE69B = 681,
    PS_ROGUE69 = 680,
    PS_ROGUE68 = 679,
    PS_ROGUE67 = 678,
    PS_ROGUE66 = 677,
    PS_ROGUE65 = 676,
    PS_ROGUE64 = 675,
    PS_ROGUE63 = 674,
    PS_ROGUE62 = 673,
    PS_ROGUE61 = 672,
    PS_ROGUE60 = 671,
    PS_ROGUE59 = 670,
    PS_ROGUE58 = 669,
    PS_ROGUE57 = 668,
    PS_ROGUE56 = 667,
    PS_ROGUE55 = 666,
    PS_ROGUE54 = 665,
    PS_ROGUE53 = 664,
    PS_ROGUE52 = 663,
    PS_ROGUE51 = 662,
    PS_ROGUE50 = 661,
    PS_ROGUE49 = 660,
    PS_ROGUE48 = 659,
    PS_ROGUE47 = 658,
    PS_ROGUE46 = 657,
    PS_ROGUE45 = 656,
    PS_ROGUE44 = 655,
    PS_ROGUE43 = 654,
    PS_ROGUE42 = 653,
    PS_ROGUE41 = 652,
    PS_ROGUE40 = 651,
    PS_ROGUE39 = 650,
    PS_ROGUE38 = 649,
    PS_ROGUE37 = 648,
    PS_ROGUE36 = 647,
    PS_ROGUE35 = 646,
    PS_ROGUE34 = 645,
    PS_ROGUE33 = 644,
    PS_ROGUE32 = 643,
    PS_ROGUE31 = 642,
    PS_ROGUE30 = 641,
    PS_ROGUE29 = 640,
    PS_ROGUE28 = 639,
    PS_ROGUE27 = 638,
    PS_ROGUE26 = 637,
    PS_ROGUE25 = 636,
    PS_ROGUE24 = 635,
    PS_ROGUE23 = 634,
    PS_ROGUE22 = 633,
    PS_ROGUE21 = 632,
    PS_ROGUE20 = 631,
    PS_ROGUE19 = 630,
    PS_ROGUE18 = 629,
    PS_ROGUE17 = 628,
    PS_ROGUE16 = 627,
    PS_ROGUE15 = 626,
    PS_ROGUE14 = 625,
    PS_ROGUE13 = 624,
    PS_ROGUE12 = 623,
    PS_ROGUE11 = 622,
    PS_ROGUE10 = 621,
    PS_ROGUE9 = 620,
    PS_ROGUE8 = 619,
    PS_ROGUE7 = 618,
    PS_ROGUE6 = 617,
    PS_ROGUE5 = 616,
    PS_ROGUE4 = 615,
    PS_ROGUE3 = 614,
    PS_ROGUE2 = 613,
    PS_ROGUE1 = 612,
    PS_SDEATH = 611,
    PS_MAGE102 = 610,
    PS_MAGE101 = 609,
    PS_MAGE100 = 608,
    PS_MAGE99 = 607,
    PS_MAGE98 = 606,
    PS_MAGE97 = 605,
    PS_MAGE96 = 604,
    PS_MAGE95 = 603,
    PS_MAGE94 = 602,
    PS_MAGE93 = 601,
    PS_MAGE92 = 600,
    PS_MAGE91 = 599,
    PS_MAGE90 = 598,
    PS_MAGE89 = 597,
    PS_MAGE88 = 596,
    PS_MAGE87 = 595,
    PS_MAGE86 = 594,
    PS_MAGE85 = 593,
    PS_MAGE84 = 592,
    PS_MAGE83 = 591,
    PS_MAGE82 = 590,
    PS_MAGE81 = 589,
    PS_MAGE80 = 588,
    PS_MAGE79 = 587,
    PS_MAGE78 = 586,
    PS_MAGE77 = 585,
    PS_MAGE76 = 584,
    PS_MAGE75 = 583,
    PS_MAGE74 = 582,
    PS_MAGE73 = 581,
    PS_MAGE72 = 580,
    PS_MAGE71 = 579,
    PS_MAGE70 = 578,
    PS_MAGE69B = 577,
    PS_MAGE69 = 576,
    PS_MAGE68 = 575,
    PS_MAGE67 = 574,
    PS_MAGE66 = 573,
    PS_MAGE65 = 572,
    PS_MAGE64 = 571,
    PS_MAGE63 = 570,
    PS_MAGE62 = 569,
    PS_MAGE61 = 568,
    PS_MAGE60 = 567,
    PS_MAGE59 = 566,
    PS_MAGE58 = 565,
    PS_MAGE57 = 564,
    PS_MAGE56 = 563,
    PS_MAGE55 = 562,
    PS_MAGE54 = 561,
    PS_MAGE53 = 560,
    PS_MAGE52 = 559,
    PS_MAGE51 = 558,
    PS_MAGE50 = 557,
    PS_MAGE49 = 556,
    PS_MAGE48 = 555,
    PS_MAGE47 = 554,
    PS_MAGE46 = 553,
    PS_MAGE45 = 552,
    PS_MAGE44 = 551,
    PS_MAGE43 = 550,
    PS_MAGE42 = 549,
    PS_MAGE41 = 548,
    PS_MAGE40 = 547,
    PS_MAGE39 = 546,
    PS_MAGE38 = 545,
    PS_MAGE37 = 544,
    PS_MAGE36 = 543,
    PS_MAGE35 = 542,
    PS_MAGE34 = 541,
    PS_MAGE33 = 540,
    PS_MAGE32 = 539,
    PS_MAGE31 = 538,
    PS_MAGE30 = 537,
    PS_MAGE29 = 536,
    PS_MAGE28 = 535,
    PS_MAGE27 = 534,
    PS_MAGE26 = 533,
    PS_MAGE25 = 532,
    PS_MAGE24 = 531,
    PS_MAGE23 = 530,
    PS_MAGE22 = 529,
    PS_MAGE21 = 528,
    PS_MAGE20 = 527,
    PS_MAGE19 = 526,
    PS_MAGE18 = 525,
    PS_MAGE17 = 524,
    PS_MAGE16 = 523,
    PS_MAGE15 = 522,
    PS_MAGE14 = 521,
    PS_MAGE13 = 520,
    PS_MAGE12 = 519,
    PS_MAGE11 = 518,
    PS_MAGE10 = 517,
    PS_MAGE9 = 516,
    PS_MAGE8 = 515,
    PS_MAGE7 = 514,
    PS_MAGE6 = 513,
    PS_MAGE5 = 512,
    PS_MAGE4 = 511,
    PS_MAGE3 = 510,
    PS_MAGE2 = 509,
    PS_MAGE1 = 508,
    TSFX_WOUND = 507,
    TSFX_WITCH50 = 506,
    TSFX_WITCH49 = 505,
    TSFX_WITCH48 = 504,
    TSFX_WITCH47 = 503,
    TSFX_WITCH46 = 502,
    TSFX_WITCH45 = 501,
    TSFX_WITCH44 = 500,
    TSFX_WITCH43 = 499,
    TSFX_WITCH42 = 498,
    TSFX_WITCH41 = 497,
    TSFX_WITCH40 = 496,
    TSFX_WITCH39 = 495,
    TSFX_WITCH38 = 494,
    TSFX_WITCH37 = 493,
    TSFX_WITCH36 = 492,
    TSFX_WITCH35 = 491,
    TSFX_WITCH34 = 490,
    TSFX_WITCH33 = 489,
    TSFX_WITCH32 = 488,
    TSFX_WITCH31 = 487,
    TSFX_WITCH30 = 486,
    TSFX_WITCH29 = 485,
    TSFX_WITCH28 = 484,
    TSFX_WITCH27 = 483,
    TSFX_WITCH26 = 482,
    TSFX_WITCH25 = 481,
    TSFX_WITCH24 = 480,
    TSFX_WITCH23 = 479,
    TSFX_WITCH22 = 478,
    TSFX_WITCH21 = 477,
    TSFX_WITCH20 = 476,
    TSFX_WITCH19 = 475,
    TSFX_WITCH18 = 474,
    TSFX_WITCH17 = 473,
    TSFX_WITCH16 = 472,
    TSFX_WITCH15 = 471,
    TSFX_WITCH14 = 470,
    TSFX_WITCH13 = 469,
    TSFX_WITCH12 = 468,
    TSFX_WITCH11 = 467,
    TSFX_WITCH10 = 466,
    TSFX_WITCH9 = 465,
    TSFX_WITCH8 = 464,
    TSFX_WITCH7 = 463,
    TSFX_WITCH6 = 462,
    TSFX_WITCH5 = 461,
    TSFX_WITCH4 = 460,
    TSFX_WITCH3 = 459,
    TSFX_WITCH2 = 458,
    TSFX_WITCH1 = 457,
    TSFX_TAVERN45 = 456,
    TSFX_TAVERN44 = 455,
    TSFX_TAVERN43 = 454,
    TSFX_TAVERN42 = 453,
    TSFX_TAVERN41 = 452,
    TSFX_TAVERN40 = 451,
    TSFX_TAVERN39 = 450,
    TSFX_TAVERN38 = 449,
    TSFX_TAVERN37 = 448,
    TSFX_TAVERN36 = 447,
    TSFX_TAVERN35 = 446,
    TSFX_TAVERN34 = 445,
    TSFX_TAVERN33 = 444,
    TSFX_TAVERN32 = 443,
    TSFX_TAVERN31 = 442,
    TSFX_TAVERN30 = 441,
    TSFX_TAVERN29 = 440,
    TSFX_TAVERN28 = 439,
    TSFX_TAVERN27 = 438,
    TSFX_TAVERN26 = 437,
    TSFX_TAVERN25 = 436,
    TSFX_TAVERN24 = 435,
    TSFX_TAVERN23 = 434,
    TSFX_TAVERN22 = 433,
    TSFX_TAVERN21 = 432,
    TSFX_TAVERN20 = 431,
    TSFX_TAVERN19 = 430,
    TSFX_TAVERN18 = 429,
    TSFX_TAVERN17 = 428,
    TSFX_TAVERN16 = 427,
    TSFX_TAVERN15 = 426,
    TSFX_TAVERN14 = 425,
    TSFX_TAVERN13 = 424,
    TSFX_TAVERN12 = 423,
    TSFX_TAVERN11 = 422,
    TSFX_TAVERN10 = 421,
    TSFX_TAVERN9 = 420,
    TSFX_TAVERN8 = 419,
    TSFX_TAVERN7 = 418,
    TSFX_TAVERN6 = 417,
    TSFX_TAVERN5 = 416,
    TSFX_TAVERN4 = 415,
    TSFX_TAVERN3 = 414,
    TSFX_TAVERN2 = 413,
    TSFX_TAVERN1 = 412,
    TSFX_TAVERN0 = 411,
    TSFX_STORY38 = 410,
    TSFX_STORY37 = 409,
    TSFX_STORY36 = 408,
    TSFX_STORY35 = 407,
    TSFX_STORY34 = 406,
    TSFX_STORY33 = 405,
    TSFX_STORY32 = 404,
    TSFX_STORY31 = 403,
    TSFX_STORY30 = 402,
    TSFX_STORY29 = 401,
    TSFX_STORY28 = 400,
    TSFX_STORY27 = 399,
    TSFX_STORY26 = 398,
    TSFX_STORY25 = 397,
    TSFX_STORY24 = 396,
    TSFX_STORY23 = 395,
    TSFX_STORY22 = 394,
    TSFX_STORY21 = 393,
    TSFX_STORY20 = 392,
    TSFX_STORY19 = 391,
    TSFX_STORY18 = 390,
    TSFX_STORY17 = 389,
    TSFX_STORY16 = 388,
    TSFX_STORY15 = 387,
    TSFX_STORY14 = 386,
    TSFX_STORY13 = 385,
    TSFX_STORY12 = 384,
    TSFX_STORY11 = 383,
    TSFX_STORY10 = 382,
    TSFX_STORY9 = 381,
    TSFX_STORY8 = 380,
    TSFX_STORY7 = 379,
    TSFX_STORY6 = 378,
    TSFX_STORY5 = 377,
    TSFX_STORY4 = 376,
    TSFX_STORY3 = 375,
    TSFX_STORY2 = 374,
    TSFX_STORY1 = 373,
    TSFX_STORY0 = 372,
    TSFX_PRIEST7 = 371,
    TSFX_PRIEST6 = 370,
    TSFX_PRIEST5 = 369,
    TSFX_PRIEST4 = 368,
    TSFX_PRIEST3 = 367,
    TSFX_PRIEST2 = 366,
    TSFX_PRIEST1 = 365,
    TSFX_PRIEST0 = 364,
    TSFX_PEGBOY43 = 363,
    TSFX_PEGBOY42 = 362,
    TSFX_PEGBOY41 = 361,
    TSFX_PEGBOY40 = 360,
    TSFX_PEGBOY39 = 359,
    TSFX_PEGBOY38 = 358,
    TSFX_PEGBOY37 = 357,
    TSFX_PEGBOY36 = 356,
    TSFX_PEGBOY35 = 355,
    TSFX_PEGBOY34 = 354,
    TSFX_PEGBOY33 = 353,
    TSFX_PEGBOY32 = 352,
    TSFX_PEGBOY31 = 351,
    TSFX_PEGBOY30 = 350,
    TSFX_PEGBOY29 = 349,
    TSFX_PEGBOY28 = 348,
    TSFX_PEGBOY27 = 347,
    TSFX_PEGBOY26 = 346,
    TSFX_PEGBOY25 = 345,
    TSFX_PEGBOY24 = 344,
    TSFX_PEGBOY23 = 343,
    TSFX_PEGBOY22 = 342,
    TSFX_PEGBOY21 = 341,
    TSFX_PEGBOY20 = 340,
    TSFX_PEGBOY19 = 339,
    TSFX_PEGBOY18 = 338,
    TSFX_PEGBOY17 = 337,
    TSFX_PEGBOY16 = 336,
    TSFX_PEGBOY15 = 335,
    TSFX_PEGBOY14 = 334,
    TSFX_PEGBOY13 = 333,
    TSFX_PEGBOY12 = 332,
    TSFX_PEGBOY11 = 331,
    TSFX_PEGBOY10 = 330,
    TSFX_PEGBOY9 = 329,
    TSFX_PEGBOY8 = 328,
    TSFX_PEGBOY7 = 327,
    TSFX_PEGBOY6 = 326,
    TSFX_PEGBOY5 = 325,
    TSFX_PEGBOY4 = 324,
    TSFX_PEGBOY3 = 323,
    TSFX_PEGBOY2 = 322,
    TSFX_PEGBOY1 = 321,
    TSFX_HEALER47 = 320,
    TSFX_HEALER46 = 319,
    TSFX_HEALER45 = 318,
    TSFX_HEALER44 = 317,
    TSFX_HEALER43 = 316,
    TSFX_HEALER42 = 315,
    TSFX_HEALER41 = 314,
    TSFX_HEALER40 = 313,
    TSFX_HEALER39 = 312,
    TSFX_HEALER38 = 311,
    TSFX_HEALER37 = 310,
    TSFX_HEALER36 = 309,
    TSFX_HEALER35 = 308,
    TSFX_HEALER34 = 307,
    TSFX_HEALER33 = 306,
    TSFX_HEALER32 = 305,
    TSFX_HEALER31 = 304,
    TSFX_HEALER30 = 303,
    TSFX_HEALER29 = 302,
    TSFX_HEALER28 = 301,
    TSFX_HEALER27 = 300,
    TSFX_HEALER26 = 299,
    TSFX_HEALER25 = 298,
    TSFX_HEALER24 = 297,
    TSFX_HEALER23 = 296,
    TSFX_HEALER22 = 295,
    TSFX_HEALER21 = 294,
    TSFX_HEALER20 = 293,
    TSFX_HEALER19 = 292,
    TSFX_HEALER18 = 291,
    TSFX_HEALER17 = 290,
    TSFX_HEALER16 = 289,
    TSFX_HEALER15 = 288,
    TSFX_HEALER14 = 287,
    TSFX_HEALER13 = 286,
    TSFX_HEALER12 = 285,
    TSFX_HEALER11 = 284,
    TSFX_HEALER10 = 283,
    TSFX_HEALER9 = 282,
    TSFX_HEALER8 = 281,
    TSFX_HEALER7 = 280,
    TSFX_HEALER6 = 279,
    TSFX_HEALER5 = 278,
    TSFX_HEALER4 = 277,
    TSFX_HEALER3 = 276,
    TSFX_HEALER2 = 275,
    TSFX_HEALER1 = 274,
    TSFX_DRUNK35 = 273,
    TSFX_DRUNK34 = 272,
    TSFX_DRUNK33 = 271,
    TSFX_DRUNK32 = 270,
    TSFX_DRUNK31 = 269,
    TSFX_DRUNK30 = 268,
    TSFX_DRUNK29 = 267,
    TSFX_DRUNK28 = 266,
    TSFX_DRUNK27 = 265,
    TSFX_DRUNK26 = 264,
    TSFX_DRUNK25 = 263,
    TSFX_DRUNK24 = 262,
    TSFX_DRUNK23 = 261,
    TSFX_DRUNK22 = 260,
    TSFX_DRUNK21 = 259,
    TSFX_DRUNK20 = 258,
    TSFX_DRUNK19 = 257,
    TSFX_DRUNK18 = 256,
    TSFX_DRUNK17 = 255,
    TSFX_DRUNK16 = 254,
    TSFX_DRUNK15 = 253,
    TSFX_DRUNK14 = 252,
    TSFX_DRUNK13 = 251,
    TSFX_DRUNK12 = 250,
    TSFX_DRUNK11 = 249,
    TSFX_DRUNK10 = 248,
    TSFX_DRUNK9 = 247,
    TSFX_DRUNK8 = 246,
    TSFX_DRUNK7 = 245,
    TSFX_DRUNK6 = 244,
    TSFX_DRUNK5 = 243,
    TSFX_DRUNK4 = 242,
    TSFX_DRUNK3 = 241,
    TSFX_DRUNK2 = 240,
    TSFX_DRUNK1 = 239,
    TSFX_DEADGUY = 238,
    TSFX_COW8 = 237,
    TSFX_COW7 = 236,
    TSFX_COW6 = 235,
    TSFX_COW5 = 234,
    TSFX_COW4 = 233,
    TSFX_COW3 = 232,
    TSFX_WINDBLOW = 231,
    TSFX_TREEBLOW = 230,
    TSFX_TAVERN = 229,
    TSFX_STREAM = 228,
    TSFX_OWLECHO = 227,
    TSFX_MICE = 226,
    TSFX_CRICKET2 = 225,
    TSFX_CRICKET1 = 224,
    TSFX_BIRDS2 = 223,
    TSFX_BIRDS1 = 222,
    TSFX_BIRDCHR2 = 221,
    TSFX_BIRDCHR1 = 220,
    TSFX_BATS = 219,
    TSFX_COW2 = 218,
    TSFX_COW1 = 217,
    TSFX_SMITH56 = 216,
    TSFX_SMITH55 = 215,
    TSFX_SMITH54 = 214,
    TSFX_SMITH53 = 213,
    TSFX_SMITH52 = 212,
    TSFX_SMITH51 = 211,
    TSFX_SMITH50 = 210,
    TSFX_SMITH49 = 209,
    TSFX_SMITH48 = 208,
    TSFX_SMITH47 = 207,
    TSFX_SMITH46 = 206,
    TSFX_SMITH45 = 205,
    TSFX_SMITH44 = 204,
    TSFX_SMITH43 = 203,
    TSFX_SMITH42 = 202,
    TSFX_SMITH41 = 201,
    TSFX_SMITH40 = 200,
    TSFX_SMITH39 = 199,
    TSFX_SMITH38 = 198,
    TSFX_SMITH37 = 197,
    TSFX_SMITH36 = 196,
    TSFX_SMITH35 = 195,
    TSFX_SMITH34 = 194,
    TSFX_SMITH33 = 193,
    TSFX_SMITH32 = 192,
    TSFX_SMITH31 = 191,
    TSFX_SMITH30 = 190,
    TSFX_SMITH29 = 189,
    TSFX_SMITH28 = 188,
    TSFX_SMITH27 = 187,
    TSFX_SMITH26 = 186,
    TSFX_SMITH25 = 185,
    TSFX_SMITH24 = 184,
    TSFX_SMITH23 = 183,
    TSFX_SMITH22 = 182,
    TSFX_SMITH21 = 181,
    TSFX_SMITH20 = 180,
    TSFX_SMITH19 = 179,
    TSFX_SMITH18 = 178,
    TSFX_SMITH17 = 177,
    TSFX_SMITH16 = 176,
    TSFX_SMITH15 = 175,
    TSFX_SMITH14 = 174,
    TSFX_SMITH13 = 173,
    TSFX_SMITH12 = 172,
    TSFX_SMITH11 = 171,
    TSFX_SMITH10 = 170,
    TSFX_SMITH9 = 169,
    TSFX_SMITH8 = 168,
    TSFX_SMITH7 = 167,
    TSFX_SMITH6 = 166,
    TSFX_SMITH5 = 165,
    TSFX_SMITH4 = 164,
    TSFX_SMITH3 = 163,
    TSFX_SMITH2 = 162,
    TSFX_SMITH1 = 161,
    TSFX_BMAID40 = 160,
    TSFX_BMAID39 = 159,
    TSFX_BMAID38 = 158,
    TSFX_BMAID37 = 157,
    TSFX_BMAID36 = 156,
    TSFX_BMAID35 = 155,
    TSFX_BMAID34 = 154,
    TSFX_BMAID33 = 153,
    TSFX_BMAID32 = 152,
    TSFX_BMAID31 = 151,
    TSFX_BMAID30 = 150,
    TSFX_BMAID29 = 149,
    TSFX_BMAID28 = 148,
    TSFX_BMAID27 = 147,
    TSFX_BMAID26 = 146,
    TSFX_BMAID25 = 145,
    TSFX_BMAID24 = 144,
    TSFX_BMAID23 = 143,
    TSFX_BMAID22 = 142,
    TSFX_BMAID21 = 141,
    TSFX_BMAID20 = 140,
    TSFX_BMAID19 = 139,
    TSFX_BMAID18 = 138,
    TSFX_BMAID17 = 137,
    TSFX_BMAID16 = 136,
    TSFX_BMAID15 = 135,
    TSFX_BMAID14 = 134,
    TSFX_BMAID13 = 133,
    TSFX_BMAID12 = 132,
    TSFX_BMAID11 = 131,
    TSFX_BMAID10 = 130,
    TSFX_BMAID9 = 129,
    TSFX_BMAID8 = 128,
    TSFX_BMAID7 = 127,
    TSFX_BMAID6 = 126,
    TSFX_BMAID5 = 125,
    TSFX_BMAID4 = 124,
    TSFX_BMAID3 = 123,
    TSFX_BMAID2 = 122,
    TSFX_BMAID1 = 121,
    LS_WALLSTRT = 120,
    LS_WALLLOOP = 119,
    LS_VTHEFT = 118,
    LS_TELEPORT = 117,
    LS_TRAPDIS = 116,
    LS_STORM = 115,
    LS_SPOUTSTR = 114,
    LS_SPOUTLOP = 113,
    LS_SOULFIRE = 112,
    LS_SHATTER = 111,
    LS_SENTINEL = 110,
    LS_SCURIMP = 109,
    LS_SCURSE = 108,
    LS_RESUR = 107,
    LS_PUDDLE = 106,
    LS_PORTAL = 105,
    LS_NOVA = 104,
    LS_MSHIELD = 103,
    LS_LTNING = 102,
    LS_LNING1 = 101,
    LS_INVPOT = 100,
    LS_INVISIBL = 99,
    LS_INFRAVIS = 98,
    LS_HYPER = 97,
    LS_HOLYBOLT = 96,
    LS_GUARDLAN = 95,
    LS_GUARD = 94,
    LS_GSHRINE = 93,
    LS_GOLUMDED = 92,
    LS_GOLUM = 91,
    LS_FOUNTAIN = 90,
    LS_FLASH = 89,
    LS_FLAMWAVE = 88,
    LS_FIRIMP2 = 87,
    LS_FIRIMP1 = 86,
    LS_FBOLT2 = 85,
    LS_FBOLT1 = 84,
    LS_FBALL = 83,
    LS_ETHEREAL = 82,
    LS_ELEMENTL = 81,
    LS_ELECIMP1 = 80,
    LS_DSERP = 79,
    LS_CHLTNING = 78,
    LS_CBOLT = 77,
    LS_CALDRON = 76,
    LS_BSIMPCT = 75,
    LS_BONESP = 74,
    LS_BLSIMPT = 73,
    LS_BLODSTAR = 72,
    LS_BLODBOIL = 71,
    LS_ARROWALL = 70,
    LS_APOC = 69,
    LS_ACIDS = 68,
    LS_ACID = 67,
    IS_REPAIR = 66,
    LS_HEALING = 65,
    IS_CAST9 = 64,
    IS_CAST8 = 63,
    IS_CAST7 = 62,
    IS_CAST6 = 61,
    IS_CAST5 = 60,
    IS_CAST4 = 59,
    IS_CAST3 = 58,
    IS_CAST2 = 57,
    IS_CAST12 = 56,
    IS_CAST10 = 55,
    IS_CAST1 = 54,
    IS_TRAP = 53,
    SFX_SILENCE = 52,
    IS_TITLSLCT = 51,
    IS_TITLEMOV = 50,
    IS_SWRDFKD = 49,
    IS_SHLDFKD = 48,
    IS_SARC = 47,
    IS_RBOOK = 46,
    IS_MAGIC1 = 45,
    IS_MAGIC = 44,
    IS_LEVER = 43,
    IS_ISWORD = 42,
    IS_ISTAF = 41,
    IS_ISIGN = 40,
    IS_ISHIEL = 39,
    IS_ISCROL = 38,
    IS_IROCK = 37,
    IS_IRING = 36,
    IS_IPOT = 35,
    IS_IMUSH = 34,
    IS_ILARM = 33,
    IS_IHARM = 32,
    IS_IGRAB = 31,
    IS_ICAP = 30,
    IS_IBOW = 29,
    IS_IBOOK = 28,
    IS_IBODY = 27,
    IS_IBLST = 26,
    IS_IAXE = 25,
    IS_IANVL = 24,
    IS_HLMTFKD = 23,
    IS_GOLD = 22,
    IS_FLIP = 21,
    IS_DOOROPEN = 20,
    IS_DOORCLOS = 19,
    IS_CHEST = 18,
    IS_BHIT1 = 17,
    IS_BHIT = 16,
    IS_BARREL = 15,
    IS_BARLFIRE = 14,
    IS_ARMRFKD = 13,
    IS_QUESTDN = 12,
    PS_DEAD = 11,
    PS_SWING2 = 10,
    PS_SWING = 9,
    PS_LGHIT1 = 8,
    PS_LGHIT = 7,
    PS_TMAG = 6,
    PS_FMAG = 5,
    PS_BFIRE = 4,
    PS_WALK4 = 3,
    PS_WALK3 = 2,
    PS_WALK2 = 1,
    PS_WALK1 = 0,
};

struct SNDPLAYOPTS {   /* size 16 */
    int patnum;   /* +0x0 size 0 */
    char bhandle;   /* +0x4 size 0 */
    char keynum;   /* +0x5 size 0 */
    char velocity;   /* +0x6 size 0 */
    char pan;   /* +0x7 size 0 */
    char vol;   /* +0x8 size 0 */
    char bend;   /* +0x9 size 0 */
    char fxlevel0;   /* +0xA size 0 */
    char use3dpos;   /* +0xB size 0 */
    unsigned short azimuth;   /* +0xC size 0 */
    short elevation;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct SNDPLAYOPTS SNDPLAYOPTS;
struct SNDLIMITS {   /* size 16 */
    int dmabuflen;   /* +0x0 size 0 */
    unsigned char numdmabufs;   /* +0x4 size 0 */
    unsigned char numdmamsgs;   /* +0x5 size 0 */
    unsigned char nummicrotalkinstances;   /* +0x6 size 0 */
    unsigned char microtalkinstanceabort;   /* +0x7 size 0 */
    short numrspcmds;   /* +0x8 size 0 */
    short pad2;   /* +0xA size 0 */
    int audiostreambufsize;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct SNDLIMITS SNDLIMITS;
struct SNDUSAGE {   /* size 8 */
    unsigned char numdmabufs;   /* +0x0 size 0 */
    unsigned char numvoices;   /* +0x1 size 0 */
    short numrspcmds;   /* +0x2 size 0 */
    int heapused;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct SNDUSAGE SNDUSAGE;
struct LightListStruct {   /* size 14 */
    char _lx;   /* +0x0 size 0 */
    char _ly;   /* +0x1 size 0 */
    unsigned short _lradius;   /* +0x2 size 0 */
    char _lid;   /* +0x4 size 0 */
    unsigned char _ldel;   /* +0x5 size 0 */
    unsigned char _lunflag;   /* +0x6 size 0 */
    char _lunx;   /* +0x7 size 0 */
    char _luny;   /* +0x8 size 0 */
    char _lunr;   /* +0x9 size 0 */
    char _xoff;   /* +0xA size 0 */
    char _yoff;   /* +0xB size 0 */
    unsigned char _lflags;   /* +0xC size 0 */
};   /* sizeof 14 */

typedef struct LightListStruct LightListStruct;
struct LightListStruct2 {   /* size 8 */
    char _lx;   /* +0x0 size 0 */
    char _ly;   /* +0x1 size 0 */
    unsigned short _lradius;   /* +0x2 size 0 */
    char _lid;   /* +0x4 size 0 */
    unsigned char _ldel;   /* +0x5 size 0 */
    char _xoff;   /* +0x6 size 0 */
    char _yoff;   /* +0x7 size 0 */
};   /* sizeof 8 */

typedef struct LightListStruct2 LightListStruct2;
struct TriggerStruct {   /* size 16 */
    int _tx;   /* +0x0 size 0 */
    int _ty;   /* +0x4 size 0 */
    unsigned int _tmsg;   /* +0x8 size 0 */
    int _tlvl;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct TriggerStruct TriggerStruct;
struct BLOCK {   /* size 4 */
    unsigned char x;   /* +0x0 size 0 */
    unsigned char y;   /* +0x1 size 0 */
    unsigned short block;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct BLOCK BLOCK;
struct MEMSTRUCT {   /* size 8 */
    long Handle;   /* +0x0 size 0 */
    void *MemPtr;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct MEMSTRUCT MEMSTRUCT;
struct TextDataStruct {   /* size 12 */
    int txtstr;   /* +0x0 size 0 */
    unsigned char scrlltxt;   /* +0x4 size 0 */
    unsigned char txtspd;   /* +0x5 size 0 */
    int sfxnr;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct TextDataStruct TextDataStruct;
struct CPauseMessages {   /* size 8 */
    int PadNum;   /* +0x0 size 0 */
    struct __vtbl_ptr_type (*.vf)[11];   /* +0x4 size 4 */
};   /* sizeof 8 */

typedef struct CPauseMessages CPauseMessages;
struct CTempPauseMessage {   /* size 12 */
    struct CPauseMessages CPauseMessages;   /* +0x0 size 8 */
    struct TextDat *TData;   /* +0x8 size 112 */
};   /* sizeof 12 */

typedef struct CTempPauseMessage CTempPauseMessage;
struct FontItem {   /* size 4 */
    unsigned char ch;   /* +0x0 size 0 */
    unsigned short Offset;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct FontItem FontItem;
struct FontTab {   /* size 16 */
    struct CFont *Fnt;   /* +0x0 size 540 */
    struct FontItem *Items;   /* +0x4 size 4 */
    int NumOfItems;   /* +0x8 size 0 */
    int FrameBase;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct FontTab FontTab;
struct TNQ {   /* size 3 */
    unsigned char _qsttype;   /* +0x0 size 0 */
    unsigned char _qstmsg;   /* +0x1 size 0 */
    unsigned char _qstmsgact;   /* +0x2 size 0 */
};   /* sizeof 3 */

typedef struct TNQ TNQ;
struct TownerStruct {   /* size 196 */
    int _tmode;   /* +0x0 size 0 */
    int _ttype;   /* +0x4 size 0 */
    int _tx;   /* +0x8 size 0 */
    int _ty;   /* +0xC size 0 */
    long _txoff;   /* +0x10 size 0 */
    long _tyoff;   /* +0x14 size 0 */
    long _txvel;   /* +0x18 size 0 */
    long _tyvel;   /* +0x1C size 0 */
    int _tdir;   /* +0x20 size 0 */
    int _tAnimDelay;   /* +0x24 size 0 */
    int _tAnimCnt;   /* +0x28 size 0 */
    int _tAnimLen;   /* +0x2C size 0 */
    int _tAnimFrame;   /* +0x30 size 0 */
    int _tAnimFrameCnt;   /* +0x34 size 0 */
    char _tAnimOrder;   /* +0x38 size 0 */
    long _tAnimWidth;   /* +0x3C size 0 */
    long _tAnimWidth2;   /* +0x40 size 0 */
    int _tTenPer;   /* +0x44 size 0 */
    int _teflag;   /* +0x48 size 0 */
    int _tbtcnt;   /* +0x4C size 0 */
    unsigned char _tSelFlag;   /* +0x50 size 0 */
    unsigned char _tMsgSaid;   /* +0x51 size 0 */
    struct TNQ qsts[16];   /* +0x52 size 48 */
    int _tSeed;   /* +0x84 size 0 */
    long _tVar1;   /* +0x88 size 0 */
    long _tVar2;   /* +0x8C size 0 */
    long _tVar3;   /* +0x90 size 0 */
    long _tVar4;   /* +0x94 size 0 */
    int _tName;   /* +0x98 size 0 */
    unsigned char *_tNAnim[8];   /* +0x9C size 32 */
    int _tNFrames;   /* +0xBC size 0 */
    unsigned char *_tNData;   /* +0xC0 size 0 */
};   /* sizeof 196 */

typedef struct TownerStruct TownerStruct;
struct QuestTalkData {   /* size 64 */
    int _qinfra;   /* +0x0 size 0 */
    int _qblkm;   /* +0x4 size 0 */
    int _qgarb;   /* +0x8 size 0 */
    int _qzhar;   /* +0xC size 0 */
    int _qveil;   /* +0x10 size 0 */
    int _qmod;   /* +0x14 size 0 */
    int _qbutch;   /* +0x18 size 0 */
    int _qbol;   /* +0x1C size 0 */
    int _qblind;   /* +0x20 size 0 */
    int _qblood;   /* +0x24 size 0 */
    int _qanvil;   /* +0x28 size 0 */
    int _qwarlrd;   /* +0x2C size 0 */
    int _qking;   /* +0x30 size 0 */
    int _qpw;   /* +0x34 size 0 */
    int _qbone;   /* +0x38 size 0 */
    int _qvb;   /* +0x3C size 0 */
};   /* sizeof 64 */

typedef struct QuestTalkData QuestTalkData;
enum .146fake {
    BUFFER_PROCESS = 2,
    BUFFER_ON = 1,
    BUFFER_OFF = 0,
};

typedef struct POLY_FT4 *(*OBJ_PFUNC)();
struct DeadStruct {   /* size 12 */
    int _deadtype;   /* +0x0 size 0 */
    int _deadFrame;   /* +0x4 size 0 */
    char _deadtrans;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct DeadStruct DeadStruct;
struct MStr {   /* size 4 */
    unsigned int Index : 8;   /* bit 0 */
    unsigned int MyMonst : 24;   /* bit 8 */
};   /* sizeof 4 */

typedef struct MStr MStr;
struct IStr {   /* size 4 */
    unsigned int Index : 8;   /* bit 0 */
    unsigned int MyItem : 24;   /* bit 8 */
};   /* sizeof 4 */

typedef struct IStr IStr;
struct MissStr {   /* size 4 */
    unsigned int Index : 8;   /* bit 0 */
    unsigned int MyMiss : 24;   /* bit 8 */
};   /* sizeof 4 */

typedef struct MissStr MissStr;
struct OStr {   /* size 4 */
    unsigned int Index : 8;   /* bit 0 */
    unsigned int MyObject : 24;   /* bit 8 */
};   /* sizeof 4 */

typedef struct OStr OStr;
struct DStr {   /* size 3 */
    unsigned char Index;   /* +0x0 size 0 */
    unsigned char x;   /* +0x1 size 0 */
    unsigned char y;   /* +0x2 size 0 */
};   /* sizeof 3 */

typedef struct DStr DStr;
union .148fake {   /* size 4 */
    struct MissStr uMissStr;   /* +0x0 size 4 */
    struct MStr uMStr;   /* +0x0 size 4 */
    struct OStr uOStr;   /* +0x0 size 4 */
    struct IStr uIStr;   /* +0x0 size 4 */
    struct DStr uDStr;   /* +0x0 size 3 */
};   /* sizeof 4 */

struct CacheInfo {   /* size 4 */
};   /* sizeof 4 */

typedef struct CacheInfo CacheInfo;
struct CachedInfoList {   /* size 8 */
    int NumOfItems;   /* +0x0 size 0 */
    struct CacheInfo Items[1];   /* +0x4 size 4 */
};   /* sizeof 8 */

typedef struct CachedInfoList CachedInfoList;
struct TownToCreature {   /* size 2 */
    unsigned char GameEqu;   /* +0x0 size 0 */
    unsigned char CreatureEquate;   /* +0x1 size 0 */
};   /* sizeof 2 */

typedef struct TownToCreature TownToCreature;
struct DR_LOAD2 {   /* size 68 */
    unsigned int addr : 24;   /* bit 0 */
    unsigned int len : 8;   /* bit 24 */
    unsigned long code[1];   /* +0x4 size 4 */
    struct RECT rect;   /* +0x8 size 8 */
    unsigned long p[13];   /* +0x10 size 52 */
};   /* sizeof 68 */

typedef struct DR_LOAD2 DR_LOAD2;
struct Overlay {   /* size 16 */
    unsigned char *Addr;   /* +0x0 size 0 */
    int Size;   /* +0x4 size 0 */
    char *FileName;   /* +0x8 size 0 */
    enum OVER_TYPE Over;   /* +0xC size 4 */
};   /* sizeof 16 */

typedef struct Overlay Overlay;
struct PlayerParam {   /* size 8 */
    struct CPlayer *ThePlayer;   /* +0x0 size 144 */
    int Id;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct PlayerParam PlayerParam;
typedef void (*TMenuFcn)();
struct TMenuItem {   /* size 12 */
    unsigned long dwFlags;   /* +0x0 size 0 */
    int pszStr;   /* +0x4 size 0 */
    void (*fnMenu)();   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct TMenuItem TMenuItem;
typedef void (*TMenuUpdateFcn)();
struct SpellData {   /* size 52 */
    unsigned char sName;   /* +0x0 size 0 */
    unsigned char sManaCost;   /* +0x1 size 0 */
    unsigned char sType;   /* +0x2 size 0 */
    int sNameText;   /* +0x4 size 0 */
    int sSkillText;   /* +0x8 size 0 */
    int sBookLvl;   /* +0xC size 0 */
    int sStaffLvl;   /* +0x10 size 0 */
    unsigned char sTargeted;   /* +0x14 size 0 */
    unsigned char sTownSpell;   /* +0x15 size 0 */
    int sMinInt;   /* +0x18 size 0 */
    unsigned char sSFX;   /* +0x1C size 0 */
    unsigned char sMissiles[3];   /* +0x1D size 3 */
    unsigned char sManaAdj;   /* +0x20 size 0 */
    unsigned char sMinMana;   /* +0x21 size 0 */
    int sStaffMin;   /* +0x24 size 0 */
    int sStaffMax;   /* +0x28 size 0 */
    int sBookCost;   /* +0x2C size 0 */
    int sStaffCost;   /* +0x30 size 0 */
};   /* sizeof 52 */

typedef struct SpellData SpellData;
typedef unsigned char PACKET;
struct GsCOORD2PARAM {   /* size 40 */
    struct VECTOR scale;   /* +0x0 size 16 */
    struct SVECTOR rotate;   /* +0x10 size 8 */
    struct VECTOR trans;   /* +0x18 size 16 */
};   /* sizeof 40 */

typedef struct GsCOORD2PARAM GsCOORD2PARAM;
struct _GsCOORDINATE2 {   /* size 80 */
    unsigned long flg;   /* +0x0 size 0 */
    struct MATRIX coord;   /* +0x4 size 32 */
    struct MATRIX workm;   /* +0x24 size 32 */
    struct GsCOORD2PARAM *param;   /* +0x44 size 40 */
    struct _GsCOORDINATE2 *super;   /* +0x48 size 80 */
    struct _GsCOORDINATE2 *sub;   /* +0x4C size 80 */
};   /* sizeof 80 */

typedef struct _GsCOORDINATE2 _GsCOORDINATE2;
typedef struct _GsCOORDINATE2 GsCOORDINATE2;
struct GsVIEW2 {   /* size 36 */
    struct MATRIX view;   /* +0x0 size 32 */
    struct _GsCOORDINATE2 *super;   /* +0x20 size 80 */
};   /* sizeof 36 */

typedef struct GsVIEW2 GsVIEW2;
struct GsRVIEW2 {   /* size 32 */
    long vpx;   /* +0x0 size 0 */
    long vpy;   /* +0x4 size 0 */
    long vpz;   /* +0x8 size 0 */
    long vrx;   /* +0xC size 0 */
    long vry;   /* +0x10 size 0 */
    long vrz;   /* +0x14 size 0 */
    long rz;   /* +0x18 size 0 */
    struct _GsCOORDINATE2 *super;   /* +0x1C size 80 */
};   /* sizeof 32 */

typedef struct GsRVIEW2 GsRVIEW2;
struct GsF_LIGHT {   /* size 16 */
    int vx;   /* +0x0 size 0 */
    int vy;   /* +0x4 size 0 */
    int vz;   /* +0x8 size 0 */
    unsigned char r;   /* +0xC size 0 */
    unsigned char g;   /* +0xD size 0 */
    unsigned char b;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct GsF_LIGHT GsF_LIGHT;
struct GsOT_TAG {   /* size 4 */
    unsigned int p : 24;   /* bit 0 */
    unsigned char num : 8;   /* bit 24 */
};   /* sizeof 4 */

typedef struct GsOT_TAG GsOT_TAG;
struct GsOT {   /* size 20 */
    unsigned long length;   /* +0x0 size 0 */
    struct GsOT_TAG *org;   /* +0x4 size 4 */
    unsigned long offset;   /* +0x8 size 0 */
    unsigned long point;   /* +0xC size 0 */
    struct GsOT_TAG *tag;   /* +0x10 size 4 */
};   /* sizeof 20 */

typedef struct GsOT GsOT;
struct GsDOBJ2 {   /* size 16 */
    unsigned long attribute;   /* +0x0 size 0 */
    struct _GsCOORDINATE2 *coord2;   /* +0x4 size 80 */
    unsigned long *tmd;   /* +0x8 size 0 */
    unsigned long id;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct GsDOBJ2 GsDOBJ2;
struct GsDOBJ3 {   /* size 24 */
    unsigned long attribute;   /* +0x0 size 0 */
    struct _GsCOORDINATE2 *coord2;   /* +0x4 size 80 */
    unsigned long *pmd;   /* +0x8 size 0 */
    unsigned long *base;   /* +0xC size 0 */
    unsigned long *sv;   /* +0x10 size 0 */
    unsigned long id;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct GsDOBJ3 GsDOBJ3;
typedef struct GsDOBJ2 GsDOBJ4;
struct GsDOBJ5 {   /* size 20 */
    unsigned long attribute;   /* +0x0 size 0 */
    struct _GsCOORDINATE2 *coord2;   /* +0x4 size 80 */
    unsigned long *tmd;   /* +0x8 size 0 */
    unsigned long *packet;   /* +0xC size 0 */
    unsigned long id;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct GsDOBJ5 GsDOBJ5;
struct GsSPRITE {   /* size 36 */
    unsigned long attribute;   /* +0x0 size 0 */
    short x;   /* +0x4 size 0 */
    short y;   /* +0x6 size 0 */
    unsigned short w;   /* +0x8 size 0 */
    unsigned short h;   /* +0xA size 0 */
    unsigned short tpage;   /* +0xC size 0 */
    unsigned char u;   /* +0xE size 0 */
    unsigned char v;   /* +0xF size 0 */
    short cx;   /* +0x10 size 0 */
    short cy;   /* +0x12 size 0 */
    unsigned char r;   /* +0x14 size 0 */
    unsigned char g;   /* +0x15 size 0 */
    unsigned char b;   /* +0x16 size 0 */
    short mx;   /* +0x18 size 0 */
    short my;   /* +0x1A size 0 */
    short scalex;   /* +0x1C size 0 */
    short scaley;   /* +0x1E size 0 */
    long rotate;   /* +0x20 size 0 */
};   /* sizeof 36 */

typedef struct GsSPRITE GsSPRITE;
struct GsSPARRAY {   /* size 72 */
    unsigned long attribute;   /* +0x0 size 0 */
    short x;   /* +0x4 size 0 */
    short y;   /* +0x6 size 0 */
    struct DR_MODE mode[2];   /* +0x8 size 24 */
    struct SPRT packet[2];   /* +0x20 size 40 */
};   /* sizeof 72 */

typedef struct GsSPARRAY GsSPARRAY;
struct GsCELL {   /* size 8 */
    unsigned char u;   /* +0x0 size 0 */
    unsigned char v;   /* +0x1 size 0 */
    unsigned short cba;   /* +0x2 size 0 */
    unsigned short flag;   /* +0x4 size 0 */
    unsigned short tpage;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct GsCELL GsCELL;
struct GsMAP {   /* size 16 */
    unsigned char cellw;   /* +0x0 size 0 */
    unsigned char cellh;   /* +0x1 size 0 */
    unsigned short ncellw;   /* +0x2 size 0 */
    unsigned short ncellh;   /* +0x4 size 0 */
    struct GsCELL *base;   /* +0x8 size 8 */
    unsigned short *index;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct GsMAP GsMAP;
struct GsBG {   /* size 36 */
    unsigned long attribute;   /* +0x0 size 0 */
    short x;   /* +0x4 size 0 */
    short y;   /* +0x6 size 0 */
    short w;   /* +0x8 size 0 */
    short h;   /* +0xA size 0 */
    short scrollx;   /* +0xC size 0 */
    short scrolly;   /* +0xE size 0 */
    unsigned char r;   /* +0x10 size 0 */
    unsigned char g;   /* +0x11 size 0 */
    unsigned char b;   /* +0x12 size 0 */
    struct GsMAP *map;   /* +0x14 size 16 */
    short mx;   /* +0x18 size 0 */
    short my;   /* +0x1A size 0 */
    short scalex;   /* +0x1C size 0 */
    short scaley;   /* +0x1E size 0 */
    long rotate;   /* +0x20 size 0 */
};   /* sizeof 36 */

typedef struct GsBG GsBG;
struct GsLINE {   /* size 16 */
    unsigned long attribute;   /* +0x0 size 0 */
    short x0;   /* +0x4 size 0 */
    short y0;   /* +0x6 size 0 */
    short x1;   /* +0x8 size 0 */
    short y1;   /* +0xA size 0 */
    unsigned char r;   /* +0xC size 0 */
    unsigned char g;   /* +0xD size 0 */
    unsigned char b;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct GsLINE GsLINE;
struct GsGLINE {   /* size 20 */
    unsigned long attribute;   /* +0x0 size 0 */
    short x0;   /* +0x4 size 0 */
    short y0;   /* +0x6 size 0 */
    short x1;   /* +0x8 size 0 */
    short y1;   /* +0xA size 0 */
    unsigned char r0;   /* +0xC size 0 */
    unsigned char g0;   /* +0xD size 0 */
    unsigned char b0;   /* +0xE size 0 */
    unsigned char r1;   /* +0xF size 0 */
    unsigned char g1;   /* +0x10 size 0 */
    unsigned char b1;   /* +0x11 size 0 */
};   /* sizeof 20 */

typedef struct GsGLINE GsGLINE;
struct GsBOXF {   /* size 16 */
    unsigned long attribute;   /* +0x0 size 0 */
    short x;   /* +0x4 size 0 */
    short y;   /* +0x6 size 0 */
    unsigned short w;   /* +0x8 size 0 */
    unsigned short h;   /* +0xA size 0 */
    unsigned char r;   /* +0xC size 0 */
    unsigned char g;   /* +0xD size 0 */
    unsigned char b;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct GsBOXF GsBOXF;
struct GsFOGPARAM {   /* size 12 */
    short dqa;   /* +0x0 size 0 */
    long dqb;   /* +0x4 size 0 */
    unsigned char rfc;   /* +0x8 size 0 */
    unsigned char gfc;   /* +0x9 size 0 */
    unsigned char bfc;   /* +0xA size 0 */
};   /* sizeof 12 */

typedef struct GsFOGPARAM GsFOGPARAM;
struct GsIMAGE {   /* size 28 */
    unsigned long pmode;   /* +0x0 size 0 */
    short px;   /* +0x4 size 0 */
    short py;   /* +0x6 size 0 */
    unsigned short pw;   /* +0x8 size 0 */
    unsigned short ph;   /* +0xA size 0 */
    unsigned long *pixel;   /* +0xC size 0 */
    short cx;   /* +0x10 size 0 */
    short cy;   /* +0x12 size 0 */
    unsigned short cw;   /* +0x14 size 0 */
    unsigned short ch;   /* +0x16 size 0 */
    unsigned long *clut;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct GsIMAGE GsIMAGE;
struct _GsPOSITION {   /* size 4 */
    short offx;   /* +0x0 size 0 */
    short offy;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct _GsPOSITION _GsPOSITION;
struct GsOBJTABLE2 {   /* size 12 */
    struct GsDOBJ2 *top;   /* +0x0 size 16 */
    int nobj;   /* +0x4 size 0 */
    int maxobj;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct GsOBJTABLE2 GsOBJTABLE2;
struct _GsFCALL {   /* size 304 */
    unsigned char *(*f3[2][3])();   /* +0x0 size 24 */
    unsigned char *(*nf3[2])();   /* +0x18 size 8 */
    unsigned char *(*g3[2][3])();   /* +0x20 size 24 */
    unsigned char *(*ng3[2])();   /* +0x38 size 8 */
    unsigned char *(*tf3[2][3])();   /* +0x40 size 24 */
    unsigned char *(*ntf3[2])();   /* +0x58 size 8 */
    unsigned char *(*tg3[2][3])();   /* +0x60 size 24 */
    unsigned char *(*ntg3[2])();   /* +0x78 size 8 */
    unsigned char *(*f4[2][3])();   /* +0x80 size 24 */
    unsigned char *(*nf4[2])();   /* +0x98 size 8 */
    unsigned char *(*g4[2][3])();   /* +0xA0 size 24 */
    unsigned char *(*ng4[2])();   /* +0xB8 size 8 */
    unsigned char *(*tf4[2][3])();   /* +0xC0 size 24 */
    unsigned char *(*ntf4[2])();   /* +0xD8 size 8 */
    unsigned char *(*tg4[2][3])();   /* +0xE0 size 24 */
    unsigned char *(*ntg4[2])();   /* +0xF8 size 8 */
    unsigned char *(*f3g[3])();   /* +0x100 size 12 */
    unsigned char *(*g3g[3])();   /* +0x10C size 12 */
    unsigned char *(*f4g[3])();   /* +0x118 size 12 */
    unsigned char *(*g4g[3])();   /* +0x124 size 12 */
};   /* sizeof 304 */

typedef struct _GsFCALL _GsFCALL;
struct TMD_P_F3 {   /* size 16 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned short n0;   /* +0x8 size 0 */
    unsigned short v0;   /* +0xA size 0 */
    unsigned short v1;   /* +0xC size 0 */
    unsigned short v2;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct TMD_P_F3 TMD_P_F3;
struct TMD_P_G3 {   /* size 20 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned short n0;   /* +0x8 size 0 */
    unsigned short v0;   /* +0xA size 0 */
    unsigned short n1;   /* +0xC size 0 */
    unsigned short v1;   /* +0xE size 0 */
    unsigned short n2;   /* +0x10 size 0 */
    unsigned short v2;   /* +0x12 size 0 */
};   /* sizeof 20 */

typedef struct TMD_P_G3 TMD_P_G3;
struct TMD_P_F3G {   /* size 24 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned char r1;   /* +0x8 size 0 */
    unsigned char g1;   /* +0x9 size 0 */
    unsigned char b1;   /* +0xA size 0 */
    unsigned char dummy1;   /* +0xB size 0 */
    unsigned char r2;   /* +0xC size 0 */
    unsigned char g2;   /* +0xD size 0 */
    unsigned char b2;   /* +0xE size 0 */
    unsigned char dummy2;   /* +0xF size 0 */
    unsigned short n0;   /* +0x10 size 0 */
    unsigned short v0;   /* +0x12 size 0 */
    unsigned short v1;   /* +0x14 size 0 */
    unsigned short v2;   /* +0x16 size 0 */
};   /* sizeof 24 */

typedef struct TMD_P_F3G TMD_P_F3G;
struct TMD_P_G3G {   /* size 28 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned char r1;   /* +0x8 size 0 */
    unsigned char g1;   /* +0x9 size 0 */
    unsigned char b1;   /* +0xA size 0 */
    unsigned char dummy1;   /* +0xB size 0 */
    unsigned char r2;   /* +0xC size 0 */
    unsigned char g2;   /* +0xD size 0 */
    unsigned char b2;   /* +0xE size 0 */
    unsigned char dummy2;   /* +0xF size 0 */
    unsigned short n0;   /* +0x10 size 0 */
    unsigned short v0;   /* +0x12 size 0 */
    unsigned short n1;   /* +0x14 size 0 */
    unsigned short v1;   /* +0x16 size 0 */
    unsigned short n2;   /* +0x18 size 0 */
    unsigned short v2;   /* +0x1A size 0 */
};   /* sizeof 28 */

typedef struct TMD_P_G3G TMD_P_G3G;
struct TMD_P_NF3 {   /* size 16 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned short v0;   /* +0x8 size 0 */
    unsigned short v1;   /* +0xA size 0 */
    unsigned short v2;   /* +0xC size 0 */
    unsigned short p;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct TMD_P_NF3 TMD_P_NF3;
struct TMD_P_NG3 {   /* size 24 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned char r1;   /* +0x8 size 0 */
    unsigned char g1;   /* +0x9 size 0 */
    unsigned char b1;   /* +0xA size 0 */
    unsigned char p1;   /* +0xB size 0 */
    unsigned char r2;   /* +0xC size 0 */
    unsigned char g2;   /* +0xD size 0 */
    unsigned char b2;   /* +0xE size 0 */
    unsigned char p2;   /* +0xF size 0 */
    unsigned short v0;   /* +0x10 size 0 */
    unsigned short v1;   /* +0x12 size 0 */
    unsigned short v2;   /* +0x14 size 0 */
    unsigned short p;   /* +0x16 size 0 */
};   /* sizeof 24 */

typedef struct TMD_P_NG3 TMD_P_NG3;
struct TMD_P_F4 {   /* size 20 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned short n0;   /* +0x8 size 0 */
    unsigned short v0;   /* +0xA size 0 */
    unsigned short v1;   /* +0xC size 0 */
    unsigned short v2;   /* +0xE size 0 */
    unsigned short v3;   /* +0x10 size 0 */
    unsigned short p;   /* +0x12 size 0 */
};   /* sizeof 20 */

typedef struct TMD_P_F4 TMD_P_F4;
struct TMD_P_G4 {   /* size 24 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned short n0;   /* +0x8 size 0 */
    unsigned short v0;   /* +0xA size 0 */
    unsigned short n1;   /* +0xC size 0 */
    unsigned short v1;   /* +0xE size 0 */
    unsigned short n2;   /* +0x10 size 0 */
    unsigned short v2;   /* +0x12 size 0 */
    unsigned short n3;   /* +0x14 size 0 */
    unsigned short v3;   /* +0x16 size 0 */
};   /* sizeof 24 */

typedef struct TMD_P_G4 TMD_P_G4;
struct TMD_P_F4G {   /* size 32 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned char r1;   /* +0x8 size 0 */
    unsigned char g1;   /* +0x9 size 0 */
    unsigned char b1;   /* +0xA size 0 */
    unsigned char dummy1;   /* +0xB size 0 */
    unsigned char r2;   /* +0xC size 0 */
    unsigned char g2;   /* +0xD size 0 */
    unsigned char b2;   /* +0xE size 0 */
    unsigned char dummy2;   /* +0xF size 0 */
    unsigned char r3;   /* +0x10 size 0 */
    unsigned char g3;   /* +0x11 size 0 */
    unsigned char b3;   /* +0x12 size 0 */
    unsigned char dummy3;   /* +0x13 size 0 */
    unsigned short n0;   /* +0x14 size 0 */
    unsigned short v0;   /* +0x16 size 0 */
    unsigned short v1;   /* +0x18 size 0 */
    unsigned short v2;   /* +0x1A size 0 */
    unsigned short v3;   /* +0x1C size 0 */
    unsigned short dummy4;   /* +0x1E size 0 */
};   /* sizeof 32 */

typedef struct TMD_P_F4G TMD_P_F4G;
struct TMD_P_G4G {   /* size 36 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned char r1;   /* +0x8 size 0 */
    unsigned char g1;   /* +0x9 size 0 */
    unsigned char b1;   /* +0xA size 0 */
    unsigned char dummy1;   /* +0xB size 0 */
    unsigned char r2;   /* +0xC size 0 */
    unsigned char g2;   /* +0xD size 0 */
    unsigned char b2;   /* +0xE size 0 */
    unsigned char dummy2;   /* +0xF size 0 */
    unsigned char r3;   /* +0x10 size 0 */
    unsigned char g3;   /* +0x11 size 0 */
    unsigned char b3;   /* +0x12 size 0 */
    unsigned char dummy3;   /* +0x13 size 0 */
    unsigned short n0;   /* +0x14 size 0 */
    unsigned short v0;   /* +0x16 size 0 */
    unsigned short n1;   /* +0x18 size 0 */
    unsigned short v1;   /* +0x1A size 0 */
    unsigned short n2;   /* +0x1C size 0 */
    unsigned short v2;   /* +0x1E size 0 */
    unsigned short n3;   /* +0x20 size 0 */
    unsigned short v3;   /* +0x22 size 0 */
};   /* sizeof 36 */

typedef struct TMD_P_G4G TMD_P_G4G;
struct TMD_P_NF4 {   /* size 16 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned short v0;   /* +0x8 size 0 */
    unsigned short v1;   /* +0xA size 0 */
    unsigned short v2;   /* +0xC size 0 */
    unsigned short v3;   /* +0xE size 0 */
};   /* sizeof 16 */

typedef struct TMD_P_NF4 TMD_P_NF4;
struct TMD_P_NG4 {   /* size 28 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char r0;   /* +0x4 size 0 */
    unsigned char g0;   /* +0x5 size 0 */
    unsigned char b0;   /* +0x6 size 0 */
    unsigned char code;   /* +0x7 size 0 */
    unsigned char r1;   /* +0x8 size 0 */
    unsigned char g1;   /* +0x9 size 0 */
    unsigned char b1;   /* +0xA size 0 */
    unsigned char p1;   /* +0xB size 0 */
    unsigned char r2;   /* +0xC size 0 */
    unsigned char g2;   /* +0xD size 0 */
    unsigned char b2;   /* +0xE size 0 */
    unsigned char p2;   /* +0xF size 0 */
    unsigned char r3;   /* +0x10 size 0 */
    unsigned char g3;   /* +0x11 size 0 */
    unsigned char b3;   /* +0x12 size 0 */
    unsigned char p3;   /* +0x13 size 0 */
    unsigned short v0;   /* +0x14 size 0 */
    unsigned short v1;   /* +0x16 size 0 */
    unsigned short v2;   /* +0x18 size 0 */
    unsigned short v3;   /* +0x1A size 0 */
};   /* sizeof 28 */

typedef struct TMD_P_NG4 TMD_P_NG4;
struct TMD_P_TF3 {   /* size 24 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char tu0;   /* +0x4 size 0 */
    unsigned char tv0;   /* +0x5 size 0 */
    unsigned short clut;   /* +0x6 size 0 */
    unsigned char tu1;   /* +0x8 size 0 */
    unsigned char tv1;   /* +0x9 size 0 */
    unsigned short tpage;   /* +0xA size 0 */
    unsigned char tu2;   /* +0xC size 0 */
    unsigned char tv2;   /* +0xD size 0 */
    unsigned short p;   /* +0xE size 0 */
    unsigned short n0;   /* +0x10 size 0 */
    unsigned short v0;   /* +0x12 size 0 */
    unsigned short v1;   /* +0x14 size 0 */
    unsigned short v2;   /* +0x16 size 0 */
};   /* sizeof 24 */

typedef struct TMD_P_TF3 TMD_P_TF3;
struct TMD_P_TG3 {   /* size 28 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char tu0;   /* +0x4 size 0 */
    unsigned char tv0;   /* +0x5 size 0 */
    unsigned short clut;   /* +0x6 size 0 */
    unsigned char tu1;   /* +0x8 size 0 */
    unsigned char tv1;   /* +0x9 size 0 */
    unsigned short tpage;   /* +0xA size 0 */
    unsigned char tu2;   /* +0xC size 0 */
    unsigned char tv2;   /* +0xD size 0 */
    unsigned short p;   /* +0xE size 0 */
    unsigned short n0;   /* +0x10 size 0 */
    unsigned short v0;   /* +0x12 size 0 */
    unsigned short n1;   /* +0x14 size 0 */
    unsigned short v1;   /* +0x16 size 0 */
    unsigned short n2;   /* +0x18 size 0 */
    unsigned short v2;   /* +0x1A size 0 */
};   /* sizeof 28 */

typedef struct TMD_P_TG3 TMD_P_TG3;
struct TMD_P_TNF3 {   /* size 28 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char tu0;   /* +0x4 size 0 */
    unsigned char tv0;   /* +0x5 size 0 */
    unsigned short clut;   /* +0x6 size 0 */
    unsigned char tu1;   /* +0x8 size 0 */
    unsigned char tv1;   /* +0x9 size 0 */
    unsigned short tpage;   /* +0xA size 0 */
    unsigned char tu2;   /* +0xC size 0 */
    unsigned char tv2;   /* +0xD size 0 */
    unsigned short p0;   /* +0xE size 0 */
    unsigned char r0;   /* +0x10 size 0 */
    unsigned char g0;   /* +0x11 size 0 */
    unsigned char b0;   /* +0x12 size 0 */
    unsigned char p1;   /* +0x13 size 0 */
    unsigned short v0;   /* +0x14 size 0 */
    unsigned short v1;   /* +0x16 size 0 */
    unsigned short v2;   /* +0x18 size 0 */
    unsigned short p2;   /* +0x1A size 0 */
};   /* sizeof 28 */

typedef struct TMD_P_TNF3 TMD_P_TNF3;
struct TMD_P_TNG3 {   /* size 36 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char tu0;   /* +0x4 size 0 */
    unsigned char tv0;   /* +0x5 size 0 */
    unsigned short clut;   /* +0x6 size 0 */
    unsigned char tu1;   /* +0x8 size 0 */
    unsigned char tv1;   /* +0x9 size 0 */
    unsigned short tpage;   /* +0xA size 0 */
    unsigned char tu2;   /* +0xC size 0 */
    unsigned char tv2;   /* +0xD size 0 */
    unsigned short p0;   /* +0xE size 0 */
    unsigned char r0;   /* +0x10 size 0 */
    unsigned char g0;   /* +0x11 size 0 */
    unsigned char b0;   /* +0x12 size 0 */
    unsigned char p1;   /* +0x13 size 0 */
    unsigned char r1;   /* +0x14 size 0 */
    unsigned char g1;   /* +0x15 size 0 */
    unsigned char b1;   /* +0x16 size 0 */
    unsigned char p2;   /* +0x17 size 0 */
    unsigned char r2;   /* +0x18 size 0 */
    unsigned char g2;   /* +0x19 size 0 */
    unsigned char b2;   /* +0x1A size 0 */
    unsigned char p3;   /* +0x1B size 0 */
    unsigned short v0;   /* +0x1C size 0 */
    unsigned short v1;   /* +0x1E size 0 */
    unsigned short v2;   /* +0x20 size 0 */
    unsigned short p4;   /* +0x22 size 0 */
};   /* sizeof 36 */

typedef struct TMD_P_TNG3 TMD_P_TNG3;
struct TMD_P_TF4 {   /* size 32 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char tu0;   /* +0x4 size 0 */
    unsigned char tv0;   /* +0x5 size 0 */
    unsigned short clut;   /* +0x6 size 0 */
    unsigned char tu1;   /* +0x8 size 0 */
    unsigned char tv1;   /* +0x9 size 0 */
    unsigned short tpage;   /* +0xA size 0 */
    unsigned char tu2;   /* +0xC size 0 */
    unsigned char tv2;   /* +0xD size 0 */
    unsigned short p0;   /* +0xE size 0 */
    unsigned char tu3;   /* +0x10 size 0 */
    unsigned char tv3;   /* +0x11 size 0 */
    unsigned short p1;   /* +0x12 size 0 */
    unsigned short n0;   /* +0x14 size 0 */
    unsigned short v0;   /* +0x16 size 0 */
    unsigned short v1;   /* +0x18 size 0 */
    unsigned short v2;   /* +0x1A size 0 */
    unsigned short v3;   /* +0x1C size 0 */
    unsigned short p2;   /* +0x1E size 0 */
};   /* sizeof 32 */

typedef struct TMD_P_TF4 TMD_P_TF4;
struct TMD_P_TG4 {   /* size 36 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char tu0;   /* +0x4 size 0 */
    unsigned char tv0;   /* +0x5 size 0 */
    unsigned short clut;   /* +0x6 size 0 */
    unsigned char tu1;   /* +0x8 size 0 */
    unsigned char tv1;   /* +0x9 size 0 */
    unsigned short tpage;   /* +0xA size 0 */
    unsigned char tu2;   /* +0xC size 0 */
    unsigned char tv2;   /* +0xD size 0 */
    unsigned short p0;   /* +0xE size 0 */
    unsigned char tu3;   /* +0x10 size 0 */
    unsigned char tv3;   /* +0x11 size 0 */
    unsigned short p1;   /* +0x12 size 0 */
    unsigned short n0;   /* +0x14 size 0 */
    unsigned short v0;   /* +0x16 size 0 */
    unsigned short n1;   /* +0x18 size 0 */
    unsigned short v1;   /* +0x1A size 0 */
    unsigned short n2;   /* +0x1C size 0 */
    unsigned short v2;   /* +0x1E size 0 */
    unsigned short n3;   /* +0x20 size 0 */
    unsigned short v3;   /* +0x22 size 0 */
};   /* sizeof 36 */

typedef struct TMD_P_TG4 TMD_P_TG4;
struct TMD_P_TNF4 {   /* size 32 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char tu0;   /* +0x4 size 0 */
    unsigned char tv0;   /* +0x5 size 0 */
    unsigned short clut;   /* +0x6 size 0 */
    unsigned char tu1;   /* +0x8 size 0 */
    unsigned char tv1;   /* +0x9 size 0 */
    unsigned short tpage;   /* +0xA size 0 */
    unsigned char tu2;   /* +0xC size 0 */
    unsigned char tv2;   /* +0xD size 0 */
    unsigned short p0;   /* +0xE size 0 */
    unsigned char tu3;   /* +0x10 size 0 */
    unsigned char tv3;   /* +0x11 size 0 */
    unsigned short p1;   /* +0x12 size 0 */
    unsigned char r0;   /* +0x14 size 0 */
    unsigned char g0;   /* +0x15 size 0 */
    unsigned char b0;   /* +0x16 size 0 */
    unsigned char p2;   /* +0x17 size 0 */
    unsigned short v0;   /* +0x18 size 0 */
    unsigned short v1;   /* +0x1A size 0 */
    unsigned short v2;   /* +0x1C size 0 */
    unsigned short v3;   /* +0x1E size 0 */
};   /* sizeof 32 */

typedef struct TMD_P_TNF4 TMD_P_TNF4;
struct TMD_P_TNG4 {   /* size 44 */
    unsigned char out;   /* +0x0 size 0 */
    unsigned char in;   /* +0x1 size 0 */
    unsigned char dummy;   /* +0x2 size 0 */
    unsigned char cd;   /* +0x3 size 0 */
    unsigned char tu0;   /* +0x4 size 0 */
    unsigned char tv0;   /* +0x5 size 0 */
    unsigned short clut;   /* +0x6 size 0 */
    unsigned char tu1;   /* +0x8 size 0 */
    unsigned char tv1;   /* +0x9 size 0 */
    unsigned short tpage;   /* +0xA size 0 */
    unsigned char tu2;   /* +0xC size 0 */
    unsigned char tv2;   /* +0xD size 0 */
    unsigned short p0;   /* +0xE size 0 */
    unsigned char tu3;   /* +0x10 size 0 */
    unsigned char tv3;   /* +0x11 size 0 */
    unsigned short p1;   /* +0x12 size 0 */
    unsigned char r0;   /* +0x14 size 0 */
    unsigned char g0;   /* +0x15 size 0 */
    unsigned char b0;   /* +0x16 size 0 */
    unsigned char p2;   /* +0x17 size 0 */
    unsigned char r1;   /* +0x18 size 0 */
    unsigned char g1;   /* +0x19 size 0 */
    unsigned char b1;   /* +0x1A size 0 */
    unsigned char p3;   /* +0x1B size 0 */
    unsigned char r2;   /* +0x1C size 0 */
    unsigned char g2;   /* +0x1D size 0 */
    unsigned char b2;   /* +0x1E size 0 */
    unsigned char p4;   /* +0x1F size 0 */
    unsigned char r3;   /* +0x20 size 0 */
    unsigned char g3;   /* +0x21 size 0 */
    unsigned char b3;   /* +0x22 size 0 */
    unsigned char p5;   /* +0x23 size 0 */
    unsigned short v0;   /* +0x24 size 0 */
    unsigned short v1;   /* +0x26 size 0 */
    unsigned short v2;   /* +0x28 size 0 */
    unsigned short v3;   /* +0x2A size 0 */
};   /* sizeof 44 */

typedef struct TMD_P_TNG4 TMD_P_TNG4;
struct TMD_STRUCT {   /* size 28 */
    unsigned long *vertop;   /* +0x0 size 0 */
    unsigned long vern;   /* +0x4 size 0 */
    unsigned long *nortop;   /* +0x8 size 0 */
    unsigned long norn;   /* +0xC size 0 */
    unsigned long *primtop;   /* +0x10 size 0 */
    unsigned long primn;   /* +0x14 size 0 */
    unsigned long scale;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct TMD_STRUCT TMD_STRUCT;
struct VERT {   /* size 8 */
    short vx;   /* +0x0 size 0 */
    short vy;   /* +0x2 size 0 */
    short vz;   /* +0x4 size 0 */
    unsigned char tu;   /* +0x6 size 0 */
    unsigned char tv;   /* +0x7 size 0 */
};   /* sizeof 8 */

typedef struct VERT VERT;
struct VERTC {   /* size 12 */
    short vx;   /* +0x0 size 0 */
    short vy;   /* +0x2 size 0 */
    short vz;   /* +0x4 size 0 */
    unsigned char tu;   /* +0x6 size 0 */
    unsigned char tv;   /* +0x7 size 0 */
    struct CVECTOR col;   /* +0x8 size 4 */
};   /* sizeof 12 */

typedef struct VERTC VERTC;
struct GsADIV_FT4 {   /* size 100 */
    unsigned long limit;   /* +0x0 size 0 */
    long hwd;   /* +0x4 size 0 */
    long vwd;   /* +0x8 size 0 */
    int shift;   /* +0xC size 0 */
    unsigned long *org;   /* +0x10 size 0 */
    unsigned long *pk;   /* +0x14 size 0 */
    long otz;   /* +0x18 size 0 */
    long adivz;   /* +0x1C size 0 */
    short adivw;   /* +0x20 size 0 */
    short adivh;   /* +0x22 size 0 */
    long flg0;   /* +0x24 size 0 */
    long flg;   /* +0x28 size 0 */
    short minx;   /* +0x2C size 0 */
    short miny;   /* +0x2E size 0 */
    short maxx;   /* +0x30 size 0 */
    short maxy;   /* +0x32 size 0 */
    short hwd0;   /* +0x34 size 0 */
    short vwd0;   /* +0x36 size 0 */
    unsigned long *tag;   /* +0x38 size 0 */
    struct POLY_FT4 si;   /* +0x3C size 40 */
};   /* sizeof 100 */

typedef struct GsADIV_FT4 GsADIV_FT4;
struct GsADIV_P_FT4 {   /* size 32 */
    struct VERT vt[4];   /* +0x0 size 32 */
};   /* sizeof 32 */

typedef struct GsADIV_P_FT4 GsADIV_P_FT4;
struct GsADIV_GT4 {   /* size 112 */
    unsigned long limit;   /* +0x0 size 0 */
    long hwd;   /* +0x4 size 0 */
    long vwd;   /* +0x8 size 0 */
    int shift;   /* +0xC size 0 */
    unsigned long *org;   /* +0x10 size 0 */
    unsigned long *pk;   /* +0x14 size 0 */
    long otz;   /* +0x18 size 0 */
    long adivz;   /* +0x1C size 0 */
    short adivw;   /* +0x20 size 0 */
    short adivh;   /* +0x22 size 0 */
    long flg0;   /* +0x24 size 0 */
    long flg;   /* +0x28 size 0 */
    short minx;   /* +0x2C size 0 */
    short miny;   /* +0x2E size 0 */
    short maxx;   /* +0x30 size 0 */
    short maxy;   /* +0x32 size 0 */
    short hwd0;   /* +0x34 size 0 */
    short vwd0;   /* +0x36 size 0 */
    unsigned long *tag;   /* +0x38 size 0 */
    struct POLY_GT4 si;   /* +0x3C size 52 */
};   /* sizeof 112 */

typedef struct GsADIV_GT4 GsADIV_GT4;
struct GsADIV_P_GT4 {   /* size 48 */
    struct VERTC vt[4];   /* +0x0 size 48 */
};   /* sizeof 48 */

typedef struct GsADIV_P_GT4 GsADIV_P_GT4;
struct GsADIV_G4 {   /* size 96 */
    unsigned long limit;   /* +0x0 size 0 */
    long hwd;   /* +0x4 size 0 */
    long vwd;   /* +0x8 size 0 */
    int shift;   /* +0xC size 0 */
    unsigned long *org;   /* +0x10 size 0 */
    unsigned long *pk;   /* +0x14 size 0 */
    long otz;   /* +0x18 size 0 */
    long adivz;   /* +0x1C size 0 */
    short adivw;   /* +0x20 size 0 */
    short adivh;   /* +0x22 size 0 */
    long flg0;   /* +0x24 size 0 */
    long flg;   /* +0x28 size 0 */
    short minx;   /* +0x2C size 0 */
    short miny;   /* +0x2E size 0 */
    short maxx;   /* +0x30 size 0 */
    short maxy;   /* +0x32 size 0 */
    short hwd0;   /* +0x34 size 0 */
    short vwd0;   /* +0x36 size 0 */
    unsigned long *tag;   /* +0x38 size 0 */
    struct POLY_G4 si;   /* +0x3C size 36 */
};   /* sizeof 96 */

typedef struct GsADIV_G4 GsADIV_G4;
typedef struct GsADIV_P_GT4 GsADIV_P_G4;
struct GsADIV_F4 {   /* size 84 */
    unsigned long limit;   /* +0x0 size 0 */
    long hwd;   /* +0x4 size 0 */
    long vwd;   /* +0x8 size 0 */
    int shift;   /* +0xC size 0 */
    unsigned long *org;   /* +0x10 size 0 */
    unsigned long *pk;   /* +0x14 size 0 */
    long otz;   /* +0x18 size 0 */
    long adivz;   /* +0x1C size 0 */
    short adivw;   /* +0x20 size 0 */
    short adivh;   /* +0x22 size 0 */
    long flg0;   /* +0x24 size 0 */
    long flg;   /* +0x28 size 0 */
    short minx;   /* +0x2C size 0 */
    short miny;   /* +0x2E size 0 */
    short maxx;   /* +0x30 size 0 */
    short maxy;   /* +0x32 size 0 */
    short hwd0;   /* +0x34 size 0 */
    short vwd0;   /* +0x36 size 0 */
    unsigned long *tag;   /* +0x38 size 0 */
    struct POLY_F4 si;   /* +0x3C size 24 */
};   /* sizeof 84 */

typedef struct GsADIV_F4 GsADIV_F4;
typedef struct GsADIV_P_FT4 GsADIV_P_F4;
struct GsADIV_FT3 {   /* size 88 */
    unsigned long limit;   /* +0x0 size 0 */
    long hwd;   /* +0x4 size 0 */
    long vwd;   /* +0x8 size 0 */
    int shift;   /* +0xC size 0 */
    unsigned long *org;   /* +0x10 size 0 */
    unsigned long *pk;   /* +0x14 size 0 */
    long otz;   /* +0x18 size 0 */
    long adivz;   /* +0x1C size 0 */
    short adivw;   /* +0x20 size 0 */
    short adivh;   /* +0x22 size 0 */
    long flg;   /* +0x24 size 0 */
    short minx;   /* +0x28 size 0 */
    short miny;   /* +0x2A size 0 */
    short maxx;   /* +0x2C size 0 */
    short maxy;   /* +0x2E size 0 */
    short hwd0;   /* +0x30 size 0 */
    short vwd0;   /* +0x32 size 0 */
    unsigned long *tag;   /* +0x34 size 0 */
    struct POLY_FT3 si;   /* +0x38 size 32 */
};   /* sizeof 88 */

typedef struct GsADIV_FT3 GsADIV_FT3;
struct GsADIV_P_FT3 {   /* size 24 */
    struct VERT vt[3];   /* +0x0 size 24 */
};   /* sizeof 24 */

typedef struct GsADIV_P_FT3 GsADIV_P_FT3;
struct GsADIV_GT3 {   /* size 96 */
    unsigned long limit;   /* +0x0 size 0 */
    long hwd;   /* +0x4 size 0 */
    long vwd;   /* +0x8 size 0 */
    int shift;   /* +0xC size 0 */
    unsigned long *org;   /* +0x10 size 0 */
    unsigned long *pk;   /* +0x14 size 0 */
    long otz;   /* +0x18 size 0 */
    long adivz;   /* +0x1C size 0 */
    short adivw;   /* +0x20 size 0 */
    short adivh;   /* +0x22 size 0 */
    long flg;   /* +0x24 size 0 */
    short minx;   /* +0x28 size 0 */
    short miny;   /* +0x2A size 0 */
    short maxx;   /* +0x2C size 0 */
    short maxy;   /* +0x2E size 0 */
    short hwd0;   /* +0x30 size 0 */
    short vwd0;   /* +0x32 size 0 */
    unsigned long *tag;   /* +0x34 size 0 */
    struct POLY_GT3 si;   /* +0x38 size 40 */
};   /* sizeof 96 */

typedef struct GsADIV_GT3 GsADIV_GT3;
struct GsADIV_P_GT3 {   /* size 36 */
    struct VERTC vt[3];   /* +0x0 size 36 */
};   /* sizeof 36 */

typedef struct GsADIV_P_GT3 GsADIV_P_GT3;
struct GsADIV_G3 {   /* size 84 */
    unsigned long limit;   /* +0x0 size 0 */
    long hwd;   /* +0x4 size 0 */
    long vwd;   /* +0x8 size 0 */
    int shift;   /* +0xC size 0 */
    unsigned long *org;   /* +0x10 size 0 */
    unsigned long *pk;   /* +0x14 size 0 */
    long otz;   /* +0x18 size 0 */
    long adivz;   /* +0x1C size 0 */
    short adivw;   /* +0x20 size 0 */
    short adivh;   /* +0x22 size 0 */
    long flg;   /* +0x24 size 0 */
    short minx;   /* +0x28 size 0 */
    short miny;   /* +0x2A size 0 */
    short maxx;   /* +0x2C size 0 */
    short maxy;   /* +0x2E size 0 */
    short hwd0;   /* +0x30 size 0 */
    short vwd0;   /* +0x32 size 0 */
    unsigned long *tag;   /* +0x34 size 0 */
    struct POLY_G3 si;   /* +0x38 size 28 */
};   /* sizeof 84 */

typedef struct GsADIV_G3 GsADIV_G3;
typedef struct GsADIV_P_GT3 GsADIV_P_G3;
struct GsADIV_F3 {   /* size 76 */
    unsigned long limit;   /* +0x0 size 0 */
    long hwd;   /* +0x4 size 0 */
    long vwd;   /* +0x8 size 0 */
    int shift;   /* +0xC size 0 */
    unsigned long *org;   /* +0x10 size 0 */
    unsigned long *pk;   /* +0x14 size 0 */
    long otz;   /* +0x18 size 0 */
    long adivz;   /* +0x1C size 0 */
    short adivw;   /* +0x20 size 0 */
    short adivh;   /* +0x22 size 0 */
    long flg;   /* +0x24 size 0 */
    short minx;   /* +0x28 size 0 */
    short miny;   /* +0x2A size 0 */
    short maxx;   /* +0x2C size 0 */
    short maxy;   /* +0x2E size 0 */
    short hwd0;   /* +0x30 size 0 */
    short vwd0;   /* +0x32 size 0 */
    unsigned long *tag;   /* +0x34 size 0 */
    struct POLY_F3 si;   /* +0x38 size 20 */
};   /* sizeof 76 */

typedef struct GsADIV_F3 GsADIV_F3;
typedef struct GsADIV_P_FT3 GsADIV_P_F3;
struct _GsCOORDUNIT {   /* size 80 */
    unsigned long flg;   /* +0x0 size 0 */
    struct MATRIX matrix;   /* +0x4 size 32 */
    struct MATRIX workm;   /* +0x24 size 32 */
    struct SVECTOR rot;   /* +0x44 size 8 */
    struct _GsCOORDUNIT *super;   /* +0x4C size 80 */
};   /* sizeof 80 */

typedef struct _GsCOORDUNIT _GsCOORDUNIT;
typedef struct _GsCOORDUNIT GsCOORDUNIT;
struct GsVIEWUNIT {   /* size 36 */
    struct MATRIX view;   /* +0x0 size 32 */
    struct _GsCOORDUNIT *super;   /* +0x20 size 80 */
};   /* sizeof 36 */

typedef struct GsVIEWUNIT GsVIEWUNIT;
struct GsRVIEWUNIT {   /* size 32 */
    long vpx;   /* +0x0 size 0 */
    long vpy;   /* +0x4 size 0 */
    long vpz;   /* +0x8 size 0 */
    long vrx;   /* +0xC size 0 */
    long vry;   /* +0x10 size 0 */
    long vrz;   /* +0x14 size 0 */
    long rz;   /* +0x18 size 0 */
    struct _GsCOORDUNIT *super;   /* +0x1C size 80 */
};   /* sizeof 32 */

typedef struct GsRVIEWUNIT GsRVIEWUNIT;
struct GsUNIT {   /* size 8 */
    struct _GsCOORDUNIT *coord;   /* +0x0 size 80 */
    unsigned long *primtop;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct GsUNIT GsUNIT;
struct GsTYPEUNIT {   /* size 8 */
    unsigned long type;   /* +0x0 size 0 */
    unsigned long *ptr;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct GsTYPEUNIT GsTYPEUNIT;
struct GsARGUNIT {   /* size 20 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct GsARGUNIT GsARGUNIT;
struct GsWORKUNIT {   /* size 8 */
    struct DVECTOR vec;   /* +0x0 size 4 */
    short otz;   /* +0x4 size 0 */
    short p;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct GsWORKUNIT GsWORKUNIT;
struct GsARGUNIT_NORMAL {   /* size 32 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    unsigned long *primtop;   /* +0x14 size 0 */
    struct SVECTOR *vertop;   /* +0x18 size 8 */
    struct SVECTOR *nortop;   /* +0x1C size 8 */
};   /* sizeof 32 */

typedef struct GsARGUNIT_NORMAL GsARGUNIT_NORMAL;
struct GsARGUNIT_SHARED {   /* size 40 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    unsigned long *primtop;   /* +0x14 size 0 */
    struct SVECTOR *vertop;   /* +0x18 size 8 */
    struct GsWORKUNIT *vertop2;   /* +0x1C size 8 */
    struct SVECTOR *nortop;   /* +0x20 size 8 */
    struct SVECTOR *nortop2;   /* +0x24 size 8 */
};   /* sizeof 40 */

typedef struct GsARGUNIT_SHARED GsARGUNIT_SHARED;
struct GsARGUNIT_IMAGE {   /* size 28 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    unsigned long *imagetop;   /* +0x14 size 0 */
    unsigned long *cluttop;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct GsARGUNIT_IMAGE GsARGUNIT_IMAGE;
struct GsARGUNIT_GND {   /* size 36 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    unsigned long *polytop;   /* +0x14 size 0 */
    unsigned long *boxtop;   /* +0x18 size 0 */
    unsigned long *pointtop;   /* +0x1C size 0 */
    struct SVECTOR *nortop;   /* +0x20 size 8 */
};   /* sizeof 36 */

typedef struct GsARGUNIT_GND GsARGUNIT_GND;
struct GsARGUNIT_GNDT {   /* size 40 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    unsigned long *polytop;   /* +0x14 size 0 */
    unsigned long *boxtop;   /* +0x18 size 0 */
    unsigned long *pointtop;   /* +0x1C size 0 */
    struct SVECTOR *nortop;   /* +0x20 size 8 */
    unsigned long *uvtop;   /* +0x24 size 0 */
};   /* sizeof 40 */

typedef struct GsARGUNIT_GNDT GsARGUNIT_GNDT;
struct GsARGUNIT_JntMIMe {   /* size 40 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    unsigned long *coord_sect;   /* +0x14 size 0 */
    long *mimepr;   /* +0x18 size 0 */
    unsigned long mimenum;   /* +0x1C size 0 */
    unsigned short mimeid;   /* +0x20 size 0 */
    unsigned short reserved;   /* +0x22 size 0 */
    unsigned long *mime_diff_sect;   /* +0x24 size 0 */
};   /* sizeof 40 */

typedef struct GsARGUNIT_JntMIMe GsARGUNIT_JntMIMe;
struct GsARGUNIT_RstJntMIMe {   /* size 32 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    unsigned long *coord_sect;   /* +0x14 size 0 */
    unsigned short mimeid;   /* +0x18 size 0 */
    unsigned short reserved;   /* +0x1A size 0 */
    unsigned long *mime_diff_sect;   /* +0x1C size 0 */
};   /* sizeof 32 */

typedef struct GsARGUNIT_RstJntMIMe GsARGUNIT_RstJntMIMe;
struct GsARGUNIT_VNMIMe {   /* size 48 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    long *mimepr;   /* +0x14 size 0 */
    unsigned long mimenum;   /* +0x18 size 0 */
    unsigned short mimeid;   /* +0x1C size 0 */
    unsigned short reserved;   /* +0x1E size 0 */
    unsigned long *mime_diff_sect;   /* +0x20 size 0 */
    struct SVECTOR *orgs_vn_sect;   /* +0x24 size 8 */
    struct SVECTOR *vert_sect;   /* +0x28 size 8 */
    struct SVECTOR *norm_sect;   /* +0x2C size 8 */
};   /* sizeof 48 */

typedef struct GsARGUNIT_VNMIMe GsARGUNIT_VNMIMe;
struct GsARGUNIT_RstVNMIMe {   /* size 40 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    unsigned short mimeid;   /* +0x14 size 0 */
    unsigned short reserved;   /* +0x16 size 0 */
    unsigned long *mime_diff_sect;   /* +0x18 size 0 */
    struct SVECTOR *orgs_vn_sect;   /* +0x1C size 8 */
    struct SVECTOR *vert_sect;   /* +0x20 size 8 */
    struct SVECTOR *norm_sect;   /* +0x24 size 8 */
};   /* sizeof 40 */

typedef struct GsARGUNIT_RstVNMIMe GsARGUNIT_RstVNMIMe;
struct GsARGUNIT_ANIM {   /* size 36 */
    unsigned long *primp;   /* +0x0 size 0 */
    struct GsOT *tagp;   /* +0x4 size 20 */
    int shift;   /* +0x8 size 0 */
    int offset;   /* +0xC size 0 */
    unsigned char *out_packetp;   /* +0x10 size 0 */
    long header_size;   /* +0x14 size 0 */
    unsigned long *htop;   /* +0x18 size 0 */
    unsigned long *ctop;   /* +0x1C size 0 */
    unsigned long *ptop;   /* +0x20 size 0 */
};   /* sizeof 36 */

typedef struct GsARGUNIT_ANIM GsARGUNIT_ANIM;
struct GsSEH {   /* size 4 */
    short idx;   /* +0x0 size 0 */
    unsigned char sid;   /* +0x2 size 0 */
    unsigned char pad;   /* +0x3 size 0 */
};   /* sizeof 4 */

typedef struct GsSEH GsSEH;
struct GsSEQ {   /* size 28 */
    unsigned long rewrite_idx;   /* +0x0 size 0 */
    unsigned short size;   /* +0x4 size 0 */
    unsigned short num;   /* +0x6 size 0 */
    unsigned short ii;   /* +0x8 size 0 */
    unsigned short aframe;   /* +0xA size 0 */
    unsigned char sid;   /* +0xC size 0 */
    char speed;   /* +0xD size 0 */
    unsigned short srcii;   /* +0xE size 0 */
    short rframe;   /* +0x10 size 0 */
    unsigned short tframe;   /* +0x12 size 0 */
    unsigned short ci;   /* +0x14 size 0 */
    unsigned short ti;   /* +0x16 size 0 */
    unsigned short start;   /* +0x18 size 0 */
    unsigned char start_sid;   /* +0x1A size 0 */
    unsigned char traveling;   /* +0x1B size 0 */
};   /* sizeof 28 */

typedef struct GsSEQ GsSEQ;
struct InitPos {   /* size 4 */
    unsigned short x;   /* +0x0 size 0 */
    unsigned short y;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct InitPos InitPos;
struct t11TLinkedList1Z8PalEntry {   /* size 8 */
    struct PalEntry *Next;   /* +0x0 size 0 */
    struct PalEntry *Prev;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct t11TLinkedList1Z8PalEntry t11TLinkedList1Z8PalEntry;
struct PalEntry {   /* size 24 */
    struct t11TLinkedList1Z8PalEntry t11TLinkedList1Z8PalEntry;   /* +0x0 size 8 */
    unsigned short PixVal;   /* +0x8 size 0 */
    unsigned short MyX;   /* +0xA size 0 */
    unsigned short MyY;   /* +0xC size 0 */
    unsigned short Clut;   /* +0xE size 0 */
    unsigned short SourceClut;   /* +0x10 size 0 */
    unsigned short NumOfCols;   /* +0x12 size 0 */
    unsigned short JustUsed;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct PalEntry PalEntry;
struct t10Collection2Z8PalEntryi20 {   /* size 492 */
    int ObjsUsed;   /* +0x0 size 0 */
    struct PalEntry Objects[20];   /* +0x4 size 480 */
    struct PalEntry *Used;   /* +0x1E4 size 24 */
    struct PalEntry *Unused;   /* +0x1E8 size 24 */
};   /* sizeof 492 */

typedef struct t10Collection2Z8PalEntryi20 t10Collection2Z8PalEntryi20;
struct PalCollection {   /* size 492 */
    struct t10Collection2Z8PalEntryi20 t10Collection2Z8PalEntryi20;   /* +0x0 size 492 */
};   /* sizeof 492 */

typedef struct PalCollection PalCollection;
enum .224fake {
    BIRD_HOP = 4,
    BIRD_LANDING = 3,
    BIRD_SCATTER = 2,
    BIRD_FLY = 1,
    BIRD_PERCH = 0,
};

struct BIRDSTRUCT {   /* size 24 */
    struct BIRDSTRUCT *leader;   /* +0x0 size 24 */
    short WorldX;   /* +0x4 size 0 */
    short WorldY;   /* +0x6 size 0 */
    char _bx;   /* +0x8 size 0 */
    char _by;   /* +0x9 size 0 */
    char _bxoff;   /* +0xA size 0 */
    char _byoff;   /* +0xB size 0 */
    char dir;   /* +0xC size 0 */
    char newdir;   /* +0xD size 0 */
    char rnddir;   /* +0xE size 0 */
    char flytime;   /* +0xF size 0 */
    char flyvar;   /* +0x10 size 0 */
    char animcount;   /* +0x11 size 0 */
    char mode;   /* +0x12 size 0 */
    char height;   /* +0x13 size 0 */
    unsigned char leadflag;   /* +0x14 size 0 */
    unsigned char visible;   /* +0x15 size 0 */
};   /* sizeof 24 */

typedef struct BIRDSTRUCT BIRDSTRUCT;
typedef struct BIRDSTRUCT Bird;
struct Perch {   /* size 2 */
    char x;   /* +0x0 size 0 */
    char y;   /* +0x1 size 0 */
};   /* sizeof 2 */

typedef struct Perch Perch;
struct PInf {   /* size 12 */
    char *Tx;   /* +0x0 size 0 */
    unsigned short GameTex;   /* +0x4 size 0 */
    unsigned short TownTex;   /* +0x6 size 0 */
    unsigned short TwoPlayerTex;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct PInf PInf;
struct bird {   /* size 52 */
    int townbirddir;   /* +0x0 size 0 */
    int townx;   /* +0x4 size 0 */
    int towny;   /* +0x8 size 0 */
    int motionx;   /* +0xC size 0 */
    int motiony;   /* +0x10 size 0 */
    int offx;   /* +0x14 size 0 */
    int offy;   /* +0x18 size 0 */
    int velx;   /* +0x1C size 0 */
    int vely;   /* +0x20 size 0 */
    int newvelx;   /* +0x24 size 0 */
    int newvely;   /* +0x28 size 0 */
    char sw;   /* +0x2C size 0 */
    char fl;   /* +0x2D size 0 */
    char fl_delay;   /* +0x2E size 0 */
    char sw_delay;   /* +0x2F size 0 */
    char perch;   /* +0x30 size 0 */
    char bird_vis;   /* +0x31 size 0 */
};   /* sizeof 52 */

typedef struct bird bird;
struct _HSCODESTREAM {   /* size 4 */
    int unused;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct _HSCODESTREAM _HSCODESTREAM;
typedef struct _HSCODESTREAM *HSCODESTREAM;
struct _SCODEEXECUTEDATA {   /* size 64 */
    unsigned long size;   /* +0x0 size 0 */
    unsigned long flags;   /* +0x4 size 0 */
    int xiterations;   /* +0x8 size 0 */
    int yiterations;   /* +0xC size 0 */
    int adjustdest;   /* +0x10 size 0 */
    int adjustsource;   /* +0x14 size 0 */
    void *dest;   /* +0x18 size 0 */
    void *source;   /* +0x1C size 0 */
    void *table;   /* +0x20 size 0 */
    unsigned long a;   /* +0x24 size 0 */
    unsigned long b;   /* +0x28 size 0 */
    unsigned long c;   /* +0x2C size 0 */
    int adjustdestalt;   /* +0x30 size 0 */
    int adjustsourcealt;   /* +0x34 size 0 */
    unsigned long reserved[2];   /* +0x38 size 8 */
};   /* sizeof 64 */

typedef struct _SCODEEXECUTEDATA _SCODEEXECUTEDATA;
typedef struct _SCODEEXECUTEDATA SCODEEXECUTEDATA;
typedef struct _SCODEEXECUTEDATA *SCODEEXECUTEDATAPTR;
typedef void (*SEVTHANDLER)();
struct _HSARCHIVE {   /* size 4 */
    int unused;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct _HSARCHIVE _HSARCHIVE;
typedef struct _HSARCHIVE *HSARCHIVE;
struct _HSFILE {   /* size 4 */
    int unused;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct _HSFILE _HSFILE;
typedef struct _HSFILE *HSFILE;
struct _HSFINDFILE {   /* size 4 */
    int unused;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct _HSFINDFILE _HSFINDFILE;
typedef struct _HSFINDFILE *HSFINDFILE;
struct _HSGDIOBJ {   /* size 4 */
    int unused;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct _HSGDIOBJ _HSGDIOBJ;
typedef struct _HSGDIOBJ *HSGDIOBJ;
struct _HSGDIFONT {   /* size 8 */
    struct _HSGDIOBJ _HSGDIOBJ;   /* +0x0 size 4 */
    int unused;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct _HSGDIFONT _HSGDIFONT;
typedef struct _HSGDIFONT *HSGDIFONT;
struct _PARAMS {   /* size 32 */
    unsigned long window;   /* +0x0 size 0 */
    unsigned int message;   /* +0x4 size 0 */
    long wparam;   /* +0x8 size 0 */
    unsigned long lparam;   /* +0xC size 0 */
    unsigned int notifycode;   /* +0x10 size 0 */
    void *extra;   /* +0x14 size 0 */
    unsigned char useresult;   /* +0x18 size 0 */
    unsigned long result;   /* +0x1C size 0 */
};   /* sizeof 32 */

typedef struct _PARAMS _PARAMS;
typedef struct _PARAMS PARAMS;
typedef struct _PARAMS *PARAMSPTR;
typedef struct _PARAMS *LPPARAMS;
typedef unsigned char (*SMSGIDLEPROC)();
typedef void (*SMSGHANDLER)();
struct _SNETCAPS {   /* size 36 */
    unsigned long size;   /* +0x0 size 0 */
    unsigned long flags;   /* +0x4 size 0 */
    unsigned long maxmessagesize;   /* +0x8 size 0 */
    unsigned long maxqueuesize;   /* +0xC size 0 */
    unsigned long maxplayers;   /* +0x10 size 0 */
    unsigned long bytessec;   /* +0x14 size 0 */
    unsigned long latencyms;   /* +0x18 size 0 */
    unsigned long defaultturnssec;   /* +0x1C size 0 */
    unsigned long defaultturnsintransit;   /* +0x20 size 0 */
};   /* sizeof 36 */

typedef struct _SNETCAPS _SNETCAPS;
typedef struct _SNETCAPS SNETCAPS;
typedef struct _SNETCAPS *SNETCAPSPTR;
struct _SNETCREATEDATA {   /* size 16 */
    unsigned long size;   /* +0x0 size 0 */
    unsigned long providerid;   /* +0x4 size 0 */
    unsigned long maxplayers;   /* +0x8 size 0 */
    unsigned long createflags;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct _SNETCREATEDATA _SNETCREATEDATA;
typedef struct _SNETCREATEDATA SNETCREATEDATA;
typedef struct _SNETCREATEDATA *SNETCREATEDATAPTR;
struct _SNET_DATA_SYSCOLORTABLE {   /* size 8 */
    unsigned long syscolor;   /* +0x0 size 0 */
    unsigned long rgb;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct _SNET_DATA_SYSCOLORTABLE _SNET_DATA_SYSCOLORTABLE;
typedef struct _SNET_DATA_SYSCOLORTABLE SNET_DATA_SYSCOLORTABLE;
typedef struct _SNET_DATA_SYSCOLORTABLE *SNET_DATA_SYSCOLORTABLEPTR;
struct _SNETEVENT {   /* size 16 */
    unsigned long eventid;   /* +0x0 size 0 */
    unsigned long playerid;   /* +0x4 size 0 */
    void *data;   /* +0x8 size 0 */
    unsigned long databytes;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct _SNETEVENT _SNETEVENT;
typedef struct _SNETEVENT SNETEVENT;
typedef struct _SNETEVENT *SNETEVENTPTR;
typedef unsigned char (*SNETABORTPROC)();
typedef unsigned char (*SNETCATEGORYPROC)();
typedef unsigned char (*SNETCHECKAUTHPROC)();
typedef unsigned char (*SNETCREATEPROC)();
typedef unsigned char (*SNETDRAWDESCPROC)();
typedef unsigned char (*SNETENUMDEVICESPROC)();
typedef unsigned char (*SNETENUMGAMESPROC)();
typedef unsigned char (*SNETENUMPROVIDERSPROC)();
typedef void (*SNETEVENTPROC)();
typedef unsigned char (*SNETGETARTPROC)();
typedef unsigned char (*SNETGETDATAPROC)();
typedef int (*SNETMESSAGEBOXPROC)();
typedef unsigned char (*SNETPLAYSOUNDPROC)();
typedef unsigned char (*SNETSELECTEDPROC)();
typedef unsigned char (*SNETSTATUSPROC)();
struct _SNETPLAYERDATA {   /* size 12 */
    unsigned long size;   /* +0x0 size 0 */
    char *playername;   /* +0x4 size 0 */
    char *playerdescription;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct _SNETPLAYERDATA _SNETPLAYERDATA;
typedef struct _SNETPLAYERDATA SNETPLAYERDATA;
typedef struct _SNETPLAYERDATA *SNETPLAYERDATAPTR;
struct _SNETPROGRAMDATA {   /* size 44 */
    unsigned long size;   /* +0x0 size 0 */
    char *programname;   /* +0x4 size 0 */
    char *programdescription;   /* +0x8 size 0 */
    unsigned long programid;   /* +0xC size 0 */
    unsigned long versionid;   /* +0x10 size 0 */
    unsigned long reserved1;   /* +0x14 size 0 */
    unsigned long maxplayers;   /* +0x18 size 0 */
    void *initdata;   /* +0x1C size 0 */
    unsigned long initdatabytes;   /* +0x20 size 0 */
    void *reserved2;   /* +0x24 size 0 */
    unsigned long optcategorybits;   /* +0x28 size 0 */
};   /* sizeof 44 */

typedef struct _SNETPROGRAMDATA _SNETPROGRAMDATA;
typedef struct _SNETPROGRAMDATA SNETPROGRAMDATA;
typedef struct _SNETPROGRAMDATA *SNETPROGRAMDATAPTR;
struct _SNETUIDATA {   /* size 52 */
    unsigned long size;   /* +0x0 size 0 */
    unsigned long uiflags;   /* +0x4 size 0 */
    unsigned long parentwindow;   /* +0x8 size 0 */
    unsigned char (*artcallback)();   /* +0xC size 0 */
    unsigned char (*authcallback)();   /* +0x10 size 0 */
    unsigned char (*createcallback)();   /* +0x14 size 0 */
    unsigned char (*drawdesccallback)();   /* +0x18 size 0 */
    unsigned char (*selectedcallback)();   /* +0x1C size 0 */
    int (*messageboxcallback)();   /* +0x20 size 0 */
    unsigned char (*soundcallback)();   /* +0x24 size 0 */
    unsigned char (*statuscallback)();   /* +0x28 size 0 */
    unsigned char (*getdatacallback)();   /* +0x2C size 0 */
    unsigned char (*categorycallback)();   /* +0x30 size 0 */
};   /* sizeof 52 */

typedef struct _SNETUIDATA _SNETUIDATA;
typedef struct _SNETUIDATA SNETUIDATA;
typedef struct _SNETUIDATA *SNETUIDATAPTR;
struct _SNETVERSIONDATA {   /* size 20 */
    unsigned long size;   /* +0x0 size 0 */
    char *versionstring;   /* +0x4 size 0 */
    char *executablefile;   /* +0x8 size 0 */
    char *originalarchivefile;   /* +0xC size 0 */
    char *patcharchivefile;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct _SNETVERSIONDATA _SNETVERSIONDATA;
typedef struct _SNETVERSIONDATA SNETVERSIONDATA;
typedef struct _SNETVERSIONDATA *SNETVERSIONDATAPTR;
struct _SNETADDR {   /* size 16 */
    unsigned char address[16];   /* +0x0 size 16 */
};   /* sizeof 16 */

typedef struct _SNETADDR _SNETADDR;
typedef struct _SNETADDR SNETADDR;
typedef struct _SNETADDR *SNETADDRPTR;
struct _SNETSPI_DEVICELIST {   /* size 304 */
    unsigned long deviceid;   /* +0x0 size 0 */
    struct _SNETCAPS devicecaps;   /* +0x4 size 36 */
    char devicename[128];   /* +0x28 size 128 */
    char devicedescription[128];   /* +0xA8 size 128 */
    unsigned long reserved;   /* +0x128 size 0 */
    struct _SNETSPI_DEVICELIST *next;   /* +0x12C size 304 */
};   /* sizeof 304 */

typedef struct _SNETSPI_DEVICELIST _SNETSPI_DEVICELIST;
typedef struct _SNETSPI_DEVICELIST SNETSPI_DEVICELIST;
typedef struct _SNETSPI_DEVICELIST *SNETSPI_DEVICELISTPTR;
struct _SNETSPI_GAMELIST {   /* size 300 */
    unsigned long gameid;   /* +0x0 size 0 */
    unsigned long gamemode;   /* +0x4 size 0 */
    unsigned long creationtime;   /* +0x8 size 0 */
    struct _SNETADDR owner;   /* +0xC size 16 */
    unsigned long ownerlatency;   /* +0x1C size 0 */
    unsigned long ownerlasttime;   /* +0x20 size 0 */
    unsigned long gamecategorybits;   /* +0x24 size 0 */
    char gamename[128];   /* +0x28 size 128 */
    char gamedescription[128];   /* +0xA8 size 128 */
    struct _SNETSPI_GAMELIST *next;   /* +0x128 size 300 */
};   /* sizeof 300 */

typedef struct _SNETSPI_GAMELIST _SNETSPI_GAMELIST;
typedef struct _SNETSPI_GAMELIST SNETSPI_GAMELIST;
typedef struct _SNETSPI_GAMELIST *SNETSPI_GAMELISTPTR;
struct _SNETSPI {   /* size 80 */
    unsigned long size;   /* +0x0 size 0 */
    unsigned char (*CompareNetAddresses)();   /* +0x4 size 0 */
    unsigned char (*Destroy)();   /* +0x8 size 0 */
    unsigned char (*Free)();   /* +0xC size 0 */
    unsigned char (*FreeExternalMessage)();   /* +0x10 size 0 */
    unsigned char (*GetGameInfo)();   /* +0x14 size 0 */
    unsigned char (*GetPerformanceData)();   /* +0x18 size 0 */
    unsigned char (*Initialize)();   /* +0x1C size 0 */
    unsigned char (*InitializeDevice)();   /* +0x20 size 0 */
    unsigned char (*LockDeviceList)();   /* +0x24 size 0 */
    unsigned char (*LockGameList)();   /* +0x28 size 0 */
    unsigned char (*Receive)();   /* +0x2C size 0 */
    unsigned char (*ReceiveExternalMessage)();   /* +0x30 size 0 */
    unsigned char (*SelectGame)();   /* +0x34 size 0 */
    unsigned char (*Send)();   /* +0x38 size 0 */
    unsigned char (*SendExternalMessage)();   /* +0x3C size 0 */
    unsigned char (*StartAdvertisingGame)();   /* +0x40 size 0 */
    unsigned char (*StopAdvertisingGame)();   /* +0x44 size 0 */
    unsigned char (*UnlockDeviceList)();   /* +0x48 size 0 */
    unsigned char (*UnlockGameList)();   /* +0x4C size 0 */
};   /* sizeof 80 */

typedef struct _SNETSPI _SNETSPI;
typedef struct _SNETSPI SNETSPI;
typedef struct _SNETSPI *SNETSPIPTR;
typedef unsigned char (*SNETSPIBIND)();
typedef unsigned char (*SNETSPIQUERY)();
struct _HSVIDEO {   /* size 4 */
    int unused;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct _HSVIDEO _HSVIDEO;
typedef struct _HSVIDEO *HSVIDEO;
struct _SVIDPALETTEUSE {   /* size 12 */
    unsigned long size;   /* +0x0 size 0 */
    unsigned long firstentry;   /* +0x4 size 0 */
    unsigned long numentries;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct _SVIDPALETTEUSE _SVIDPALETTEUSE;
typedef struct _SVIDPALETTEUSE SVIDPALETTEUSE;
typedef struct _SVIDPALETTEUSE *SVIDPALETTEUSEPTR;
struct CCritSect {   /* size 4 */
    unsigned long m_critsect;   /* +0x0 size 0 */
};   /* sizeof 4 */

typedef struct CCritSect CCritSect;
struct CLock {   /* size 12 */
    unsigned long m_mutexevent;   /* +0x0 size 0 */
    unsigned long m_readerevent;   /* +0x4 size 0 */
    long m_readercount;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct CLock CLock;
enum _ui_classes {
    UI_NUM_CLASSES = 3,
    UI_SORCERER = 2,
    UI_ROGUE = 1,
    UI_WARRIOR = 0,
};

typedef enum _ui_classes _ui_classes;
enum _copyprot_results {
    COPYPROT_CANCEL = 2,
    COPYPROT_OK = 1,
};

typedef enum _copyprot_results _copyprot_results;
typedef void (*PLAYSND)();
enum _mainmenu_selections {
    MAINMENU_ATTRACT_MODE = 6,
    MAINMENU_EXIT_DIABLO = 5,
    MAINMENU_SHOW_CREDITS = 4,
    MAINMENU_REPLAY_INTRO = 3,
    MAINMENU_MULTIPLAYER = 2,
    MAINMENU_SINGLE_PLAYER = 1,
};

typedef enum _mainmenu_selections _mainmenu_selections;
enum _difficulty {
    NUM_DIFFICULTIES = 3,
    DIFF_HELL = 2,
    DIFF_NIGHTMARE = 1,
    DIFF_NORMAL = 0,
};

typedef enum _difficulty _difficulty;
typedef struct _gamedata TGAMEDATA;
struct _gamedata {   /* size 8 */
    unsigned long dwSeed;   /* +0x0 size 0 */
    unsigned char bDiff;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct _gamedata _gamedata;
typedef struct _uiheroinfo TUIHEROINFO;
typedef struct _uiheroinfo *TPUIHEROINFO;
struct _uidefaultstats {   /* size 8 */
    unsigned short strength;   /* +0x0 size 0 */
    unsigned short magic;   /* +0x2 size 0 */
    unsigned short dexterity;   /* +0x4 size 0 */
    unsigned short vitality;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct _uidefaultstats _uidefaultstats;
typedef struct _uidefaultstats TUIDEFSTATS;
typedef struct _uidefaultstats *TPUIDEFSTATS;
struct _uiheroinfo {   /* size 40 */
    struct _uiheroinfo *next;   /* +0x0 size 40 */
    char name[16];   /* +0x4 size 16 */
    unsigned short level;   /* +0x14 size 0 */
    unsigned char heroclass;   /* +0x16 size 0 */
    unsigned char herorank;   /* +0x17 size 0 */
    unsigned short strength;   /* +0x18 size 0 */
    unsigned short magic;   /* +0x1A size 0 */
    unsigned short dexterity;   /* +0x1C size 0 */
    unsigned short vitality;   /* +0x1E size 0 */
    unsigned long gold;   /* +0x20 size 0 */
    unsigned char hassaved;   /* +0x24 size 0 */
    unsigned char spawned;   /* +0x25 size 0 */
};   /* sizeof 40 */

typedef struct _uiheroinfo _uiheroinfo;
typedef unsigned char (*ENUMHEROPROC)();
typedef unsigned char (*ENUMHEROS)();
typedef unsigned char (*CREATEHERO)();
typedef unsigned char (*DELETEHERO)();
typedef unsigned char (*GETDEFHERO)();
enum _selhero_selections {
    SELHERO_PREVIOUS = 4,
    SELHERO_CONNECT = 3,
    SELHERO_CONTINUE = 2,
    SELHERO_NEW_DUNGEON = 1,
};

typedef enum _selhero_selections _selhero_selections;
typedef int (*PROGRESSFCN)();
enum _dialmodes {
    MODE_DIALNEW = 5,
    MODE_DIALOLD = 4,
    MODE_ANSWER = 3,
};

typedef enum _dialmodes _dialmodes;
typedef struct _modeminfo TMODEM;
typedef struct _modeminfo *TPMODEM;
struct _modeminfo {   /* size 264 */
    struct _modeminfo *next;   /* +0x0 size 264 */
    unsigned long deviceid;   /* +0x4 size 0 */
    char devicename[128];   /* +0x8 size 128 */
    char devicedesc[128];   /* +0x88 size 128 */
};   /* sizeof 264 */

typedef struct _modeminfo _modeminfo;
enum .227fake {
    HELP_MAINHEADER = 4,
    HELP_HEADER = 3,
    HELP_TXT = 2,
    HELP_CONTROLS = 1,
    HELP_TITLE = 0,
};

struct HelpStruct {   /* size 12 */
    char DisplayType;   /* +0x0 size 0 */
    int HelpTxt;   /* +0x4 size 0 */
    int subtxt;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct HelpStruct HelpStruct;
struct OMENUITEM {   /* size 24 */
    unsigned char y;   /* +0x0 size 0 */
    int Text;   /* +0x4 size 0 */
    enum TXT_JUST Just;   /* +0x8 size 4 */
    int len;   /* +0xC size 0 */
    unsigned long *var;   /* +0x10 size 0 */
    int Link;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct OMENUITEM OMENUITEM;
struct OMENULIST {   /* size 8 */
    unsigned short w;   /* +0x0 size 0 */
    unsigned char h;   /* +0x2 size 0 */
    unsigned char NoEntries;   /* +0x3 size 0 */
    struct OMENUITEM *Item;   /* +0x4 size 24 */
};   /* sizeof 8 */

typedef struct OMENULIST OMENULIST;
struct FMVDAT {   /* size 8 */
    char *Name;   /* +0x0 size 0 */
    unsigned short Width;   /* +0x4 size 0 */
    unsigned short Height;   /* +0x6 size 0 */
};   /* sizeof 8 */

typedef struct FMVDAT FMVDAT;
struct vbuffS {   /* size 4 */
    short kan;   /* +0x0 size 0 */
    unsigned char count;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct vbuffS vbuffS;
struct block {   /* size 532 */
    int data[128];   /* +0x0 size 512 */
    unsigned char blockrep;   /* +0x200 size 0 */
    int blocksize;   /* +0x204 size 0 */
    int blockoffset;   /* +0x208 size 0 */
    unsigned char *Dest;   /* +0x20C size 0 */
    int outsize;   /* +0x210 size 0 */
};   /* sizeof 532 */

typedef struct block block;
struct FeMenuTable {   /* size 24 */
    int X;   /* +0x0 size 0 */
    int Y;   /* +0x4 size 0 */
    enum TXT_JUST Just;   /* +0x8 size 4 */
    unsigned short Str;   /* +0xC size 0 */
    struct FeTable *MenuPtr;   /* +0x10 size 28 */
    struct CFont *Font;   /* +0x14 size 540 */
};   /* sizeof 24 */

typedef struct FeMenuTable FeMenuTable;
struct Creds {   /* size 12 */
    int Title;   /* +0x0 size 0 */
    int SubTitle;   /* +0x4 size 0 */
    int Text;   /* +0x8 size 0 */
};   /* sizeof 12 */

typedef struct Creds Creds;
struct sjis {   /* size 4 */
    char ascii;   /* +0x0 size 0 */
    unsigned char num;   /* +0x1 size 0 */
    unsigned short sjis;   /* +0x2 size 0 */
};   /* sizeof 4 */

typedef struct sjis sjis;
struct _mdecanim {   /* size 20 */
    char *filename;   /* +0x0 size 0 */
    int speed;   /* +0x4 size 0 */
    int start;   /* +0x8 size 0 */
    int end;   /* +0xC size 0 */
    int streaming;   /* +0x10 size 0 */
};   /* sizeof 20 */

typedef struct _mdecanim _mdecanim;
typedef struct _mdecanim mdecanim;
struct asec {   /* size 8 */
    int id;   /* +0x0 size 0 */
    int size;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct asec asec;
typedef unsigned long REG_OFF;
struct CSDATA {   /* size 40 */
    int x;   /* +0x0 size 0 */
    int y;   /* +0x4 size 0 */
    int w;   /* +0x8 size 0 */
    int Text1;   /* +0xC size 0 */
    int Text2;   /* +0x10 size 0 */
    int Text3;   /* +0x14 size 0 */
    char String[15];   /* +0x18 size 15 */
    char col;   /* +0x27 size 0 */
};   /* sizeof 40 */

typedef struct CSDATA CSDATA;
typedef void (*MIADDPRC)();
typedef void (*MIPROC)();
struct MissileData {   /* size 24 */
    unsigned char mName;   /* +0x0 size 0 */
    void (*mAddProc)();   /* +0x4 size 0 */
    void (*mProc)();   /* +0x8 size 0 */
    unsigned char mDraw;   /* +0xC size 0 */
    unsigned char mType;   /* +0xD size 0 */
    unsigned char mResist;   /* +0xE size 0 */
    unsigned char mFileNum;   /* +0xF size 0 */
    int mlSFX;   /* +0x10 size 0 */
    int miSFX;   /* +0x14 size 0 */
};   /* sizeof 24 */

typedef struct MissileData MissileData;
struct MisFileData {   /* size 5 */
    unsigned char mAnimName;   /* +0x0 size 0 */
    unsigned char mAnimFAmt;   /* +0x1 size 0 */
    unsigned char mFlags;   /* +0x2 size 0 */
    unsigned char mAnimDelay;   /* +0x3 size 0 */
    unsigned char mAnimLen;   /* +0x4 size 0 */
};   /* sizeof 5 */

typedef struct MisFileData MisFileData;
struct ThemeStruct {   /* size 8 */
    char ttype;   /* +0x0 size 0 */
    int ttval;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct ThemeStruct ThemeStruct;
struct _FILEHEADER {   /* size 32 */
    unsigned long signature;   /* +0x0 size 0 */
    unsigned long headersize;   /* +0x4 size 0 */
    unsigned long filesize;   /* +0x8 size 0 */
    unsigned short version;   /* +0xC size 0 */
    unsigned short sectorsizeid;   /* +0xE size 0 */
    unsigned long hashoffset;   /* +0x10 size 0 */
    unsigned long blockoffset;   /* +0x14 size 0 */
    unsigned long hashcount;   /* +0x18 size 0 */
    unsigned long blockcount;   /* +0x1C size 0 */
};   /* sizeof 32 */

typedef struct _FILEHEADER _FILEHEADER;
typedef struct _FILEHEADER FILEHEADER;
typedef struct _FILEHEADER *FILEHEADERPTR;
struct _HASHENTRY {   /* size 16 */
    unsigned long hashcheck[2];   /* +0x0 size 8 */
    unsigned long lcid;   /* +0x8 size 0 */
    unsigned long block;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct _HASHENTRY _HASHENTRY;
typedef struct _HASHENTRY HASHENTRY;
typedef struct _HASHENTRY *HASHENTRYPTR;
struct _BLOCKENTRY {   /* size 16 */
    unsigned long offset;   /* +0x0 size 0 */
    unsigned long sizealloc;   /* +0x4 size 0 */
    unsigned long sizefile;   /* +0x8 size 0 */
    unsigned long flags;   /* +0xC size 0 */
};   /* sizeof 16 */

typedef struct _BLOCKENTRY _BLOCKENTRY;
typedef struct _BLOCKENTRY BLOCKENTRY;
typedef struct _BLOCKENTRY *BLOCKENTRYPTR;
typedef unsigned char (*TGetNameFcn)();
struct _SHAREDDATA {   /* size 8 */
    long status;   /* +0x0 size 0 */
    unsigned long processid;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct _SHAREDDATA _SHAREDDATA;
typedef struct _SHAREDDATA SHAREDDATA;
typedef struct _SHAREDDATA *SHAREDDATAPTR;
typedef void (*TCrypt)();
struct CompClass {   /* size 4 */
    struct __vtbl_ptr_type (*.vf)[3];   /* +0x0 size 4 */
};   /* sizeof 4 */

typedef struct CompClass CompClass;
struct CompressedLevs {   /* size 180 */
    unsigned long Version;   /* +0x0 size 0 */
    unsigned long Offset[22];   /* +0x4 size 88 */
    unsigned long Size[22];   /* +0x5C size 88 */
};   /* sizeof 180 */

typedef struct CompressedLevs CompressedLevs;
struct AMap {   /* size 16 */
    BOOL Compressed;   /* +0x0 size 0 */
    long hnd;   /* +0x4 size 0 */
    int Size;   /* +0x8 size 0 */
    struct DLevel *CurrLevel;   /* +0xC size 4696 */
};   /* sizeof 16 */

typedef struct AMap AMap;
struct CompLevelMaps {   /* size 368 */
    struct CompClass *CompObj;   /* +0x0 size 4 */
    struct AMap TheMaps[22];   /* +0x4 size 352 */
    int LastNumOut;   /* +0x164 size 0 */
    struct DLevel *LastMapOut;   /* +0x168 size 4696 */
    BOOL MapOut;   /* +0x16C size 0 */
};   /* sizeof 368 */

typedef struct CompLevelMaps CompLevelMaps;
struct NoComp {   /* size 4 */
    struct CompClass CompClass;   /* +0x0 size 4 */
};   /* sizeof 4 */

typedef struct NoComp NoComp;
struct PakComp {   /* size 4 */
    struct CompClass CompClass;   /* +0x0 size 4 */
};   /* sizeof 4 */

typedef struct PakComp PakComp;
struct CrunchComp {   /* size 4 */
    struct CompClass CompClass;   /* +0x0 size 4 */
};   /* sizeof 4 */

typedef struct CrunchComp CrunchComp;
struct TMegaPkt {   /* size 32008 */
    struct TMegaPkt *pNext;   /* +0x0 size 32008 */
    unsigned long dwSpaceLeft;   /* +0x4 size 0 */
    unsigned char data[32000];   /* +0x8 size 32000 */
};   /* sizeof 32008 */

typedef struct TMegaPkt TMegaPkt;
struct TBuffer {   /* size 4100 */
    unsigned long dwNextWriteOffset;   /* +0x0 size 0 */
    unsigned char bData[4096];   /* +0x4 size 4096 */
};   /* sizeof 4100 */

typedef struct TBuffer TBuffer;
struct tagPATHNODE {   /* size 52 */
    char f;   /* +0x0 size 0 */
    char h;   /* +0x1 size 0 */
    char g;   /* +0x2 size 0 */
    int x;   /* +0x4 size 0 */
    int y;   /* +0x8 size 0 */
    struct tagPATHNODE *Parent;   /* +0xC size 52 */
    struct tagPATHNODE *Child[8];   /* +0x10 size 32 */
    struct tagPATHNODE *NextNode;   /* +0x30 size 52 */
};   /* sizeof 52 */

typedef struct tagPATHNODE tagPATHNODE;
typedef struct tagPATHNODE PATHNODE;
typedef unsigned char (*CHECKFUNC1)();
enum .234fake {
    PART_TRANS_RIGHT = 2,
    PART_TRANS_LEFT = 1,
    PART_TRANS_NONE = 0,
};

typedef int DIRECTION;
enum .235fake {
    PLAYER_RIGHT_SIDE = 2,
    PLAYER_LEFT_SIDE = 1,
};

struct MESSAGE_STR {   /* size 8 */
    int Msg;   /* +0x0 size 0 */
    char *Text;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct MESSAGE_STR MESSAGE_STR;
struct CINDER {   /* size 6 */
    unsigned short x;   /* +0x0 size 0 */
    unsigned short y;   /* +0x2 size 0 */
    unsigned short yinc;   /* +0x4 size 0 */
};   /* sizeof 6 */

typedef struct CINDER CINDER;
struct DoorOff {   /* size 4 */
    char x;   /* +0x0 size 0 */
    char y;   /* +0x1 size 0 */
    char ot;   /* +0x2 size 0 */
    char pad;   /* +0x3 size 0 */
};   /* sizeof 4 */

typedef struct DoorOff DoorOff;
struct MONTH_DAYS {   /* size 8 */
    char *Month;   /* +0x0 size 0 */
    int Days;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct MONTH_DAYS MONTH_DAYS;
typedef unsigned char (*CHECKFUNC)();
struct InvXY {   /* size 8 */
    int X;   /* +0x0 size 0 */
    int Y;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct InvXY InvXY;
enum .236fake {
    GAL_PHANTOM_MEM = 0,
    GAL_FIRST_FREE_MEM_TYPE = 1,
    GAL_HIGH = 32768,
    GAL_FLAGS = 32768,
};

struct MEM_HDR {   /* size 28 */
    struct MEM_HDR *Prev;   /* +0x0 size 28 */
    struct MEM_HDR *Next;   /* +0x4 size 28 */
    void *Mem;   /* +0x8 size 0 */
    unsigned long Size;   /* +0xC size 0 */
    unsigned short TimeStamp;   /* +0x10 size 0 */
    unsigned short Type;   /* +0x12 size 0 */
    unsigned short Owners;   /* +0x14 size 0 */
    unsigned short Handle;   /* +0x16 size 0 */
    unsigned char Name[4];   /* +0x18 size 4 */
};   /* sizeof 28 */

typedef struct MEM_HDR MEM_HDR;
struct MEM_REG {   /* size 8 */
    void *Mem;   /* +0x0 size 0 */
    int Size;   /* +0x4 size 0 */
};   /* sizeof 8 */

typedef struct MEM_REG MEM_REG;
typedef struct MEM_HDR *(*FIND_ROUTINE)();
struct FILE {   /* size 28 */
    int _cnt;   /* +0x0 size 0 */
    char *_ptr;   /* +0x4 size 0 */
    char *_base;   /* +0x8 size 0 */
    int _bufsiz;   /* +0xC size 0 */
    int _flag;   /* +0x10 size 0 */
    int _file;   /* +0x14 size 0 */
    char *_name_to_remove;   /* +0x18 size 0 */
};   /* sizeof 28 */

typedef struct FILE FILE;
