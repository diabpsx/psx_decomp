/* DAVEL.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: Dave L's PSX spell and
 * particle effects -- the teleport/heal/phase/apocalypse player FX (SpellFXDat[2], driven by
 * DaveLTask every frame), the reflection strips (DoReflection), the particle chain / jump / burst
 * sprites (frames 0xD0..0xD7 of texture set 0) and the resurrect light pillar.  The header inlines
 * (PRIMPOOL.H PRIM_GetPrim<POLY_G4/F4/FT4>, CPLAYER.H GetPlayer/GetLastOtPos, BLOCK.H GetOtPos,
 * GMAN.H GetFr) are emitted out of line in this object (-fno-inline). */
#include "diabpsx_types.h"

/* ---------------------------------------------------------------- PsyQ libgpu ---- */
struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};

struct P_TAG {
    unsigned addr : 24;
    unsigned len : 8;
    unsigned char r0, g0, b0, code;
};

struct POLY_F4 {   /* sizeof 24 */
    unsigned long tag;
    unsigned char r0, g0, b0, code;
    short x0, y0;
    short x1, y1;
    short x2, y2;
    short x3, y3;
};

struct POLY_G4 {   /* sizeof 36 */
    unsigned long tag;
    unsigned char r0, g0, b0, code;
    short x0, y0;
    unsigned char r1, g1, b1, pad1;
    short x1, y1;
    unsigned char r2, g2, b2, pad2;
    short x2, y2;
    unsigned char r3, g3, b3, pad3;
    short x3, y3;
};

struct POLY_FT4 {   /* sizeof 40 */
    unsigned long tag;
    unsigned char r0, g0, b0, code;
    short x0, y0;
    unsigned char u0, v0;
    unsigned short clut;
    short x1, y1;
    unsigned char u1, v1;
    unsigned short tpage;
    short x2, y2;
    unsigned char u2, v2;
    unsigned short pad1;
    short x3, y3;
    unsigned char u3, v3;
    unsigned short pad2;
};

#define setlen(p, _len)   (((P_TAG *)(p))->len = (unsigned char)(_len))
#define setcode(p, _code) (((P_TAG *)(p))->code = (unsigned char)(_code))
#define setPolyF4(p) setlen(p, 5), setcode(p, 0x28)
#define setPolyG4(p) setlen(p, 8), setcode(p, 0x38)
#define setaddr(p, _addr) (((P_TAG *)(p))->addr = (unsigned long)(_addr))
#define getaddr(p) (((P_TAG *)(p))->addr)
#define addPrim(ot, p) setaddr(p, getaddr(ot)), setaddr(ot, p)
#define setSemiTrans(p, abe) ((abe) ? (((P_TAG *)(p))->code |= 0x02) : (((P_TAG *)(p))->code &= ~0x02))
#define setShadeTex(p, tge) ((tge) ? (((P_TAG *)(p))->code |= 0x01) : (((P_TAG *)(p))->code &= ~0x01))
#define setRGB0(p, _r0, _g0, _b0) (p)->r0 = (_r0), (p)->g0 = (_g0), (p)->b0 = (_b0)
#define setRGB1(p, _r1, _g1, _b1) (p)->r1 = (_r1), (p)->g1 = (_g1), (p)->b1 = (_b1)
#define setRGB2(p, _r2, _g2, _b2) (p)->r2 = (_r2), (p)->g2 = (_g2), (p)->b2 = (_b2)
#define setRGB3(p, _r3, _g3, _b3) (p)->r3 = (_r3), (p)->g3 = (_g3), (p)->b3 = (_b3)
#define setXYWH(p, _x0, _y0, _w, _h) (p)->x0 = (_x0), (p)->y0 = (_y0), (p)->x1 = (_x0)+(_w), (p)->y1 = (_y0), (p)->x2 = (_x0), (p)->y2 = (_y0)+(_h), (p)->x3 = (_x0)+(_w), (p)->y3 = (_y0)+(_h)

/* ---------------------------------------------------------------- engine types ---- */
extern "C" void DBG_Error(char *Text, char *File, int Line);
struct TASK {   /* sizeof 92 */
    struct TASK *Next;
    struct TASK *Prev;
    unsigned long Id;
    unsigned long SleepTime;
    unsigned long fToInit : 1;
    unsigned long fToDie : 1;
    unsigned long fKillable : 1;
    unsigned long fActive : 1;
    unsigned long fXtraStack : 1;
    void *Stack;
    unsigned long StackSize;
    void *Data;
    int TskEnv[12];
    void (*Main)();
    long hndTask;
    unsigned short XtraLongs;
    unsigned short MaxStackSizeBytes;
};

struct FRAME_HDR {   /* sizeof 12 */
    unsigned int FrOffset : 32;
    int X : 8;
    int Y : 8;
    unsigned int PalNum : 8;
    unsigned int NotTrans : 1;
    unsigned int Rotated : 1;
    unsigned int InVRAM : 1;
    unsigned int CompType : 2;
    unsigned int Floor : 1;
    unsigned int Cycle : 1;
    unsigned int pad : 1;
    unsigned int W : 9;
    unsigned int H : 9;
    unsigned int PentaGram : 1;
    unsigned int pad2 : 13;
};

/* word 0 of a FRAME_HDR read as its U/V/Tpage bytes (GMAN.H view) */
struct FRAME_TP {
    unsigned U : 8, V : 8, Tpage : 16;
};

struct SPR_HDR;
struct CTextFileInfo;

class TextDat {   /* sizeof 112 */
public:
    BOOL OwnDat;                        /* +0x0 */
    int TexNum;                         /* +0x4 */
    int LastFrame;                      /* +0x8 */
    BOOL DatLoaded;                     /* +0xC */
    long hndDat;                        /* +0x10 */
    long hndHdr;                        /* +0x14 */
    long hndPalOffset;                  /* +0x18 */
    long hndCreatureOffset;             /* +0x1C */
    long hndBlockOffsets;               /* +0x20 */
    FRAME_HDR *Frames;                  /* +0x24 */
    SPR_HDR *Hdr;                       /* +0x28 */
    void *Pals;                         /* +0x2C */
    int *PalOffset;                     /* +0x30 */
    int *CreatureOffset;                /* +0x34 */
    unsigned char *CreatureAnims;       /* +0x38 */
    unsigned char *Blocks;              /* +0x3C */
    BOOL Loaded;                        /* +0x40 */
    int LoadCount;                      /* +0x44 */
    CTextFileInfo *FileInfo;            /* +0x48 */
    long hndDecompBuffer;               /* +0x4C */
    int DecX;                           /* +0x50 */
    int DecY;                           /* +0x54 */
    int PalX;                           /* +0x58 */
    int PalY;                           /* +0x5C */
    int Scr;                            /* +0x60 */
    int NumOfBuffers[2];                /* +0x64 */
    long hndDecompArrays;               /* +0x6C */

    FRAME_HDR *GetFr(int FrNum) { return Frames + (unsigned short)FrNum; }
    inline void DumpDatFile();
    void PrepareFt4(POLY_FT4 *FT4, int Frm, int X, int Y, int XFlip, int YFlip);
    POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
};

/* GMAN.H:290-296 -- defined in the header; never called here, but compiling it is what puts
 * "psxsrc/gman.h" first in this object's .rdata (retail .DAVEL_rdata order: gman.h, cplayer.h, primpool.h) */
extern "C" BOOL GAL_Free(long Hnd);
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

extern int PosAdj;

struct MonstList;
struct LittleGt4;

struct RgbBlockInf {   /* sizeof 24 */
    int FromValR, ToValR, FromValG, ToValG, FromValB, ToValB;
};

class CBlocks : public TextDat {   /* sizeof 264; TextDat base @+0x0 */
public:
    struct TextDat *MonstTexDat;        /* +0x70 */
    struct TextDat *ObjTexDat;          /* +0x74 */
    MonstList *MonsterList;             /* +0x78 */
    int RndX;                           /* +0x7C */
    int RndY;                           /* +0x80 */
    int MonstTexId;                     /* +0x84 */
    long hndBlocks;                     /* +0x88 */
    int ObjTexId;                       /* +0x8C */
    int ItemTexId;                      /* +0x90 */
    struct TextDat *ItemTexDat;         /* +0x94 */
    int BgTexId;                        /* +0x98 */
    struct TextDat *BgTexDat;           /* +0x9C */
    int pOtPos[2];                      /* +0xA0 */
    BOOL IsTown;                        /* +0xA8 */
    int NumOfBlocks;                    /* +0xAC */
    LittleGt4 *Gt4s;                    /* +0xB0 */
    long hndGt4s;                       /* +0xB4 */
    RECT *Rects;                        /* +0xB8 */
    long hndRects;                      /* +0xBC */
    RECT ClipRect;                      /* +0xC0 */
    int StX;                            /* +0xC8 */
    int StY;                            /* +0xCC */
    int Mx;                             /* +0xD0 */
    int My;                             /* +0xD4 */
    int pBlockX[2];                     /* +0xD8 */
    int pBlockY[2];                     /* +0xE0 */
    int CursX;                          /* +0xE8 */
    int CursY;                          /* +0xEC */
    RgbBlockInf GlBlockInf;             /* +0xF0 */

    void GetXY(int *nx, int *ny);
    int WorldToScrX(int x, int y);
    int WorldToScrY(int x, int y);
    void GetScrXY(RECT &R, int x, int y, int sxoff, int syoff);
    int GetOtPos(int LogicalY)
    {
        int OtPos = ClipRect.y + LogicalY + PosAdj;
        if (OtPos < -0x43) OtPos = -0x43;
        if (OtPos > 0x19B) OtPos = 0x19B;
        return OtPos + 0x4D;
    }
};

class CPlayer;
extern CPlayer *_7CPlayer_PActiveArray[2];   /* @0x8011AD50 class-static CPlayer::PActiveArray */

class CPlayer : public TextDat {   /* sizeof 144; TextDat base @+0x0 */
public:
    long hndDatMem;                     /* +0x70 */
    unsigned short NumOfPlayers;        /* +0x74 */
    BOOL InTown;                        /* +0x78 */
    unsigned short PlayerNum;           /* +0x7C */
    unsigned short Tpage;               /* +0x7E */
    int TexId;                          /* +0x80 */
    int LastScrX;                       /* +0x84 */
    int LastScrY;                       /* +0x88 */
    int LastOtPos;                      /* +0x8C */

    int GetLastOtPos() const { return LastOtPos; }
    static CPlayer *GetPlayer(int PNum)
    {
        if (1 < (unsigned int)PNum)
            DBG_Error(NULL, "psxsrc/cplayer.h", 0x41);
        return _7CPlayer_PActiveArray[PNum];
    }
};

struct PlayerStruct {   /* sizeof 6632 -- only the fields read here */
    int _pmode;                         /* +0x0 */
    unsigned char pad0[0x30 - 0x4];
    short _px;                          /* +0x30 */
    short _py;                          /* +0x32 */
    unsigned char pad1[0x3C - 0x34];
    char _pxoff;                        /* +0x3C */
    char _pyoff;                        /* +0x3D */
    unsigned char rest[6632 - 0x3E];
};

struct MonsterStruct {   /* sizeof 104 -- only the fields read here */
    unsigned char pad0[0x34];
    char _mx;                           /* +0x34 */
    char _my;                           /* +0x35 */
    unsigned char pad1[0x3A - 0x36];
    char _mxoff;                        /* +0x3A */
    char _myoff;                        /* +0x3B */
    unsigned char rest[104 - 0x3C];
};

struct MissileStruct {   /* sizeof 76 -- only the fields read here */
    long _mixvel;                       /* +0x0 */
    long _miyvel;                       /* +0x4 */
    unsigned char pad0[0x2E - 0x8];
    short _misource;                    /* +0x2E */
    char _mitype;                       /* +0x30 */
    unsigned char rest[76 - 0x31];
};

struct SPELLFX_DAT {   /* sizeof 72 */
    BOOL apocactive;                    /* +0x0 */
    BOOL healactive;                    /* +0x4 */
    int teleflag;                       /* +0x8 */
    int phaseflag;                      /* +0xC */
    int inviscount;                     /* +0x10 */
    int X;                              /* +0x14 */
    int Y;                              /* +0x18 */
    int sxoff;                          /* +0x1C */
    int syoff;                          /* +0x20 */
    int scrnx;                          /* +0x24 */
    int scrny;                          /* +0x28 */
    int px;                             /* +0x2C */
    int py;                             /* +0x30 */
    int yoffset;                        /* +0x34 */
    int spiny1;                         /* +0x38 */
    int spiny2;                         /* +0x3C */
    int scale;                          /* +0x40 */
    int healtime;                       /* +0x44 */

    void GetPlrPos(PlayerStruct *ptrplr);
    void ApocInit(PlayerStruct *ptrplr);
};

struct Particle {   /* sizeof 36 */
    int partx;                          /* +0x0 */
    int party;                          /* +0x4 */
    int partanim;                       /* +0x8 */
    int jumpflag;                       /* +0xC */
    int jumpcount;                      /* +0x10 */
    int jumpmax;                        /* +0x14 */
    int dx;                             /* +0x18 */
    int scale;                          /* +0x1C */
    int colour;                         /* +0x20 */
};

class CPad;

/* ---------------------------------------------------------------- externals ---- */
extern "C" {
void DBG_SetPollRoutine(void (*Func)());
unsigned long GU_GetRnd(void);
void TSK_Sleep(int Frames);
}
TextDat *GM_UseTexData(int Id);
void GM_FinishedUsing(TextDat *Fin);
CBlocks *BL_GetCurrentBlocks(void);
unsigned long VID_GetTick(void);
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross, BOOL iso, unsigned char SinStep);
void SetLightFX(int x, int y, short s_r, short s_g, short s_b, unsigned char d_r, unsigned char d_g, unsigned char d_b);
CPad *PAD_GetPad(int PadNum, unsigned char both);
BOOL GLUE_Finished(void);

extern POLY_FT4 *ThisPrimAddr;   /* @0x8011AAB8 */
extern POLY_FT4 *AddrToAvoid;    /* @0x8011AABC */
extern unsigned long *ThisOt;    /* @0x8011AAB4 */
extern struct PlayerStruct plr[2];
extern struct MonsterStruct monster[190];
extern BOOL CDWAIT;
extern unsigned char questlog;
extern unsigned char sbookflag;
extern unsigned char chrflag;
extern unsigned char PauseMode;
extern unsigned char invflag;

/* ---------------------------------------------------------------- PRIMPOOL.H ---- */
inline void PRIM_GetPrim(POLY_FT4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_FT4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 0x44);
    *Prim = (POLY_FT4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_FT4 *)ThisPrimAddr + 1);
}
inline void PRIM_GetPrim(POLY_F4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_F4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 0x44);
    *Prim = (POLY_F4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_F4 *)ThisPrimAddr + 1);
}
inline void PRIM_GetPrim(POLY_G4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_G4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 0x44);
    *Prim = (POLY_G4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_G4 *)ThisPrimAddr + 1);
}

/* ---------------------------------------------------------------- TU data ---- */
struct SPELLFX_DAT SpellFXDat[2];               /* @0x800CC6DC: an uninitialized C++ global lands in .data, after the statics */
static struct Particle PartArray[16];           /* @0x8011CE00 bss */
static int partOtPos;                           /* @0x8011C6D8 sbss */
static int partmonst;                           /* @0x8011C6DC sbss */
int SetParticle = 0;                            /* @0x8011B0E4 */
static int p1partexecnum = 1;                   /* @0x8011B0E8 */
static int p2partexecnum = 1;                   /* @0x8011B0EC */
static int JumpArray[8] = { 13, 14, 15, 16, 17, 18, 19, 20 };   /* @0x800CC6BC .data */
static int partjumpflag = 0;                    /* @0x8011B0F0 */
static int partglowflag = 0;                    /* @0x8011B0F4 */
static int partcolour = 0xFF4040;               /* @0x8011B0F8 */
static BOOL anyfuckingmenus = 0;                /* @0x8011B0FC */

extern void Teleportfx(int scrnx, int scrny, int width, int height, int scale, int colmask, int numpart, int OtPos);

/* @0x8009E3F4 DAVEL.CPP:92 */
void DaveLDummyPoll()
{
}

/* @0x8009E3FC DAVEL.CPP:98 */
void DaveL()
{
    DBG_SetPollRoutine(DaveLDummyPoll);
}

/* @0x8009E424 DAVEL.CPP:118
 * OPEN (bytes 28 diffs, all in the prologue block): retail allocates zV0 -> $a0, zV2/zH -> $a1 and
 * schedules the v0/v2 loads before the `count` load; ours swaps a0/a1 (local-alloc gives the tied
 * zV2+zH quantity priority over zV0) and loads count/u0 first.  Every other instruction matches. */
void DoReflection(POLY_FT4 *Ft4, int R, int G, int B)
{
    unsigned char zV0, zV2, zH, dH, zV;
    unsigned char *s, *d, *Ft4m;
    short zX0, zX1;
    static int count = 0;
    int n, xoffset, yoffset;
    short zY;

    Ft4m = (unsigned char *)Ft4;
    zY = Ft4->y0;
    zV0 = Ft4->v0;
    zV2 = Ft4->v2;
    zX0 = Ft4->x0;
    zX1 = Ft4->x1;
    zH = zV0 - zV2;
    zH >>= 3;
    zV = zV0;
    xoffset = (count & 4) >> 2;
    yoffset = (count & 8) >> 3;
    dH = zH - yoffset;
    Ft4->u0 += 0;
    Ft4->v0 += 1;
    Ft4->u1 += -1;
    Ft4->v1 += 1;
    Ft4->u2 += 0;
    Ft4->u3 += -1;
    for (n = 0; n < 7; n++) {
        PRIM_GetPrim(&Ft4);
        for (s = Ft4m, d = (unsigned char *)Ft4; s < Ft4m + sizeof(POLY_FT4);)
            *d++ = *s++;
        Ft4->v0 = zV;
        Ft4->v1 = zV;
        zV -= dH;
        Ft4->y0 = zY;
        Ft4->y1 = zY;
        Ft4->x0 = zX0 + xoffset;
        Ft4->x1 = zX1 + xoffset;
        Ft4->v2 = zV;
        Ft4->v3 = zV;
        xoffset ^= 1;
        zY += dH;
        Ft4->y2 = zY;
        Ft4->y3 = zY;
        Ft4->x2 = zX0 + xoffset;
        Ft4->x3 = zX1 + xoffset;
        setSemiTrans(Ft4, 1);
        setRGB0(Ft4, R, G, B);
        setShadeTex(Ft4, 0);
        addPrim(ThisOt + 2, Ft4);
    }
    Ft4 = (POLY_FT4 *)Ft4m;
    Ft4->v0 = zV;
    Ft4->v1 = zV;
    Ft4->y0 = zY;
    Ft4->y1 = zY;
    Ft4->x0 = zX0 + xoffset;
    Ft4->x1 = zX1 + xoffset;
    xoffset ^= 1;
    Ft4->x2 = zX0 + xoffset;
    Ft4->x3 = zX1 + xoffset;
    setSemiTrans(Ft4, 1);
    setRGB0(Ft4, R, G, B);
    setShadeTex(Ft4, 0);
    addPrim(ThisOt + 2, Ft4);
    if (!anyfuckingmenus)
        count++;
}

/* @0x8009E764 DAVEL.CPP:189 */
void mteleportfx()
{
    int plr, br;

    for (plr = 0; plr < 2; plr++) {
        if (SpellFXDat[plr].teleflag) {
            SpellFXDat[plr].GetPlrPos(&::plr[plr]);
            int OtPos = CPlayer::GetPlayer(plr)->GetLastOtPos();
            if (!anyfuckingmenus) {
                if (SpellFXDat[plr].spiny1 < SpellFXDat[plr].spiny2)
                    SpellFXDat[plr].scale += 0x800;
                if (SpellFXDat[plr].scale > 0x10000)
                    SpellFXDat[plr].scale = 0x10000;
                if (SpellFXDat[plr].spiny1 > SpellFXDat[plr].spiny2) {
                    SpellFXDat[plr].teleflag = 2;
                    SpellFXDat[plr].scale -= 0x800;
                }
                if (SpellFXDat[plr].scale < 0) {
                    SpellFXDat[plr].scale = 0;
                    SpellFXDat[plr].teleflag = 0;
                }
                SpellFXDat[plr].spiny1++;
                SpellFXDat[plr].spiny2--;
            }
            Teleportfx(SpellFXDat[plr].scrnx, SpellFXDat[plr].scrny, 8, 16, SpellFXDat[plr].scale, 0, 8, OtPos);
            br = (SpellFXDat[plr].scale * 160) / 65536;
            DrawSpinner(SpellFXDat[plr].scrnx, SpellFXDat[plr].spiny1, br, br, br, 32, 64, 0, 0, OtPos + 2, 1, 0, 8);
            DrawSpinner(SpellFXDat[plr].scrnx, SpellFXDat[plr].spiny2, br, br, br, 32, 64, 0, 0, OtPos + 2, 1, 0, 8);
        }
    }
}

/* @0x8009EA78 DAVEL.CPP:225 */
void invistimer()
{
    int plr;

    for (plr = 0; plr < 2; plr++) {
        if (SpellFXDat[plr].inviscount && !anyfuckingmenus) {
            SpellFXDat[plr].inviscount--;
            if (SpellFXDat[plr].inviscount == 0) {
                SpellFXDat[plr].phaseflag = 0;
                return;
            }
            if (SpellFXDat[plr].inviscount < 300) {
                SpellFXDat[plr].phaseflag &= 1;
                SpellFXDat[plr].phaseflag |= SpellFXDat[plr].inviscount & 4;
            }
            if (SpellFXDat[plr].inviscount < 60) {
                SpellFXDat[plr].phaseflag &= 1;
                SpellFXDat[plr].phaseflag |= (SpellFXDat[plr].inviscount & 2) << 1;
            }
        }
    }
}

/* @0x8009EB50 DAVEL.CPP:242 */
void setUVparams(POLY_FT4 *Ft4, FRAME_HDR *Fr)
{
    int zU = ((FRAME_TP *)Fr)->U;
    int zV = ((FRAME_TP *)Fr)->V;
    int zW = Fr->W;
    int zH = Fr->H;

    if (!(((unsigned long *)Fr)[1] & 0x2000000)) {
        Ft4->u0 = zU;
        Ft4->v0 = zV;
        Ft4->u1 = zU + zW - 1;
        Ft4->v1 = zV;
        Ft4->u2 = zU;
        Ft4->v2 = zV + zH - 1;
        Ft4->u3 = zU + zW - 1;
        Ft4->v3 = zV + zH - 1;
    } else {
        Ft4->u0 = zU;
        Ft4->v0 = zV + zW - 2;
        Ft4->u2 = zU + zH - 1;
        Ft4->u1 = zU;
        Ft4->v2 = zV + zW - 2;
        Ft4->v1 = zV - 1;
        Ft4->u3 = zU + zH - 1;
        Ft4->v3 = zV - 1;
    }
}

/* @0x8009EBE0 DAVEL.CPP:283 */
void drawparticle(int x, int y, int scale, int anim, int colour, int OtPos)
{
    TextDat *Dat;
    POLY_FT4 *Ft4;
    FRAME_HDR *Fr;
    unsigned char SpR, SpG, SpB;
    int w, h, f;

    f = anim + 0xD0;
    Dat = GM_UseTexData(0);
    Fr = Dat->GetFr(f);
    w = Fr->W;
    h = Fr->H;
    w = (w * scale) / 32768;
    h = (h * scale) / 32768;
    x -= w / 2;
    y -= h / 2;
    SpR = colour >> 16;
    SpG = colour >> 8;
    SpB = colour;
    PRIM_GetPrim(&Ft4);
    Dat->PrepareFt4(Ft4, f, x, y, 0, 0);
    setXYWH(Ft4, x, y, w, h);
    setRGB0(Ft4, SpR, SpG, SpB);
    setSemiTrans(Ft4, 0);
    setShadeTex(Ft4, 0);
    setUVparams(Ft4, Fr);
    addPrim(ThisOt + OtPos, Ft4);
    GM_FinishedUsing(Dat);
}

/* @0x8009EDD8 DAVEL.CPP:320 */
void drawpolyF4(int x, int y, int w, int h, int colour, int OtPos)
{
    POLY_F4 *F4;
    unsigned char SpR, SpG, SpB;

    SpR = colour >> 16;
    SpG = colour >> 8;
    SpB = colour;
    PRIM_GetPrim(&F4);
    setPolyF4(F4);
    setXYWH(F4, x, y, w, h);
    setRGB0(F4, SpR, SpG, SpB);
    setSemiTrans(F4, 1);
    addPrim(ThisOt + OtPos, F4);
}

/* @0x8009EF0C DAVEL.CPP:338 */
void drawpolyG4(int x, int y, int w, int h1, int h2, int colour0, int colour1, int OtPos)
{
    POLY_G4 *G4;
    unsigned char SpR0, SpG0, SpB0;
    unsigned char SpR1, SpG1, SpB1;

    SpR0 = colour0 >> 16;
    SpG0 = colour0 >> 8;
    SpB0 = colour0;
    SpR1 = colour1 >> 16;
    SpG1 = colour1 >> 8;
    SpB1 = colour1;
    PRIM_GetPrim(&G4);
    setPolyG4(G4);
    G4->x0 = x;
    G4->y0 = y;
    G4->x1 = x + w;
    G4->y1 = y;
    G4->x2 = x;
    G4->y2 = y + h1;
    G4->x3 = x + w;
    G4->y3 = y + h2;
    setRGB0(G4, SpR0, SpG0, SpB0);
    setRGB2(G4, SpR0, SpG0, SpB0);
    setRGB1(G4, SpR1, SpG1, SpB1);
    setRGB3(G4, SpR1, SpG1, SpB1);
    setSemiTrans(G4, 1);
    addPrim(ThisOt + OtPos, G4);
}

/* @0x8009F0DC DAVEL.CPP:364 */
void particlejump(int ScrX, int ScrY)
{
    int n;
    int partactive = 0;

    for (n = 0; n < 16; n++) {
        if (PartArray[n].jumpflag) {
            if (PartArray[n].jumpcount > PartArray[n].jumpmax) {
                PartArray[n].jumpflag = 0;
                drawparticle(ScrX + (PartArray[n].partx >> 16), ScrY + PartArray[n].party, PartArray[n].scale, PartArray[n].partanim, partcolour, partOtPos);
            } else {
                if (!anyfuckingmenus) {
                    PartArray[n].partx += PartArray[n].dx;
                    PartArray[n].partanim++;
                    PartArray[n].partanim &= 7;
                    PartArray[n].jumpcount += 2;
                    PartArray[n].party += PartArray[n].jumpcount >> 2;
                }
                partactive = 1;
                drawparticle(ScrX + (PartArray[n].partx >> 16), ScrY + PartArray[n].party, PartArray[n].scale, PartArray[n].partanim, partcolour, partOtPos);
            }
        }
    }
    if (!partactive)
        partjumpflag = 0;
}

/* @0x8009F2AC DAVEL.CPP:412 */
void doparticlejump()
{
    int ScrX, ScrY, ScrXOff, ScrYOff;
    int WorldX, WorldY;
    CBlocks *gblocks;

    gblocks = BL_GetCurrentBlocks();
    gblocks->GetXY(&WorldX, &WorldY);
    ScrXOff = (monster[partmonst]._mxoff * 625) / 1000;
    ScrYOff = (monster[partmonst]._myoff * 625) / 1000;
    int x = monster[partmonst]._mx * 20;
    int y = monster[partmonst]._my * 20;
    ScrX = gblocks->WorldToScrX(x, y) + ScrXOff - gblocks->WorldToScrX(WorldX >> 16, WorldY >> 16) - 100;
    ScrY = gblocks->WorldToScrY(x, y) + ScrYOff - gblocks->WorldToScrY(WorldX >> 16, WorldY >> 16) - 100;
    if (partjumpflag)
        particlejump(ScrX, ScrY);
}

/* @0x8009F440 DAVEL.CPP:436 */
void StartPartJump(int mi, int height, int scale, int colour, int OtPos)
{
    int n;

    if (!(partjumpflag | partglowflag)) {
        partjumpflag = 1;
        partcolour = colour;
        partOtPos = OtPos;
        partmonst = mi;
        for (n = 0; n < 16; n++) {
            PartArray[n].partx = 100 << 16;
            PartArray[n].party = 100;
            PartArray[n].jumpflag = 1;
            PartArray[n].jumpcount = -(JumpArray[GU_GetRnd() & 7] + height);
            PartArray[n].jumpmax = JumpArray[GU_GetRnd() & 7] + height;
            PartArray[n].partanim = n & 7;
            PartArray[n].dx = (GU_GetRnd() & 0x3F) * 0x1000 - 0x20000;
            PartArray[n].scale = scale;
        }
    }
}

/* @0x8009F594 DAVEL.CPP:461 */
void MonstPartJump(int m)
{
    int ScrYOff;
    int WorldX, WorldY;
    CBlocks *gblocks;

    gblocks = BL_GetCurrentBlocks();
    gblocks->GetXY(&WorldX, &WorldY);
    ScrYOff = (monster[m]._myoff * 625) / 1000;
    StartPartJump(m, 0, 0x8000, 0x606060, gblocks->GetOtPos(gblocks->WorldToScrY(monster[m]._mx * 20, monster[m]._my * 20) + ScrYOff - gblocks->WorldToScrY(WorldX >> 16, WorldY >> 16)));
}

/* @0x8009F6B4 DAVEL.CPP:485 */
void doparticlechain(int sx, int sy, int dx, int dy, int count, int scale, int scaledec, int semitrans, int randomize, int colour, int OtPos, int source)
{
    TextDat *Dat;
    POLY_FT4 *Ft4;
    unsigned char SpR, SpG, SpB;
    int x, y, br, w, h, f, c, t, rand, xoffs, yoffs, xf, yf, dxf, dyf, dxabs, dyabs, divisor;
    int *partexecnum;
    FRAME_HDR *Fr;

    dxabs = __builtin_abs(dx >> 16);
    dyabs = __builtin_abs(dy >> 16);
    partexecnum = &p2partexecnum;
    if (!source)
        partexecnum = &p1partexecnum;
    divisor = (dxabs < dyabs ? dyabs : dxabs) / 2;
    if (!divisor)
        divisor = 1;
    dxf = dx / divisor;
    dyf = dy / divisor;
    if (count > *partexecnum)
        count = *partexecnum;
    divisor >>= 1;
    if (!divisor)
        divisor = 1;
    *partexecnum += divisor;
    if (anyfuckingmenus)
        t = 0;
    else
        t = (VID_GetTick() >> 2) & 7;
    if (randomize) {
        rand = GU_GetRnd();
        sx += rand & 3;
        sy += (rand >> 16) & 3;
    }
    xf = sx << 16;
    yf = sy << 16;
    Dat = GM_UseTexData(0);
    for (c = 0; c < count; c++) {
        f = (t - c) & 7;
        f += 0xD0;
        Fr = Dat->GetFr(f);
        w = Fr->W;
        h = Fr->H;
        xoffs = w * scale;
        yoffs = h * scale;
        x = xf >> 16;
        y = yf >> 16;
        xf -= dxf;
        yf -= dyf;
        w = xoffs >> 15;
        x -= xoffs >> 16;
        h = yoffs >> 15;
        y -= yoffs >> 16;
        if (semitrans)
            br = scale >> 10;
        else
            br = scale >> 9;
        SpR = (colour & 0xFF0000) ? colour >> 16 : br;
        SpG = (colour & 0xFF00) ? colour >> 8 : br;
        SpB = (colour & 0xFF) ? colour : br;
        Ft4 = Dat->PrintFt4(f, x, y, 0, OtPos, 0);
        if (semitrans)
            Ft4->tpage |= 0x20;
        setXYWH(Ft4, x, y, w, h);
        setRGB0(Ft4, SpR, SpG, SpB);
        setSemiTrans(Ft4, 1);
        setShadeTex(Ft4, 0);
        if (scale >= 0x800)
            scale -= scaledec;
    }
    GM_FinishedUsing(Dat);
}

/* @0x8009FA04 DAVEL.CPP:570 */
void ParticleMissile(MissileStruct *Ms, int ScrX, int ScrY, int colour, int OtPos)
{
    ScrY -= 16;
    if (SetParticle) {
        SetParticle = 0;
        if (Ms->_misource == 0)
            p1partexecnum = 1;
        if (Ms->_misource == 1)
            p2partexecnum = Ms->_misource;
    }
    if (Ms->_mitype == 1)
        doparticlechain(ScrX, ScrY, Ms->_mixvel, Ms->_miyvel, 8, 0x8000, 0x1000, 1, 0, colour, OtPos, Ms->_misource);
    else
        doparticlechain(ScrX, ScrY, Ms->_mixvel, Ms->_miyvel, 8, 0xF000, 0x2000, 1, 0, colour, OtPos, Ms->_misource);
}

/* @0x8009FAC0 DAVEL.CPP:591 */
void Teleportfx(int scrnx, int scrny, int width, int height, int scale, int colmask, int numpart, int OtPos)
{
    TextDat *Dat;
    POLY_FT4 *Ft4;
    unsigned char SpR, SpG, SpB;
    int w, h, x, y, f, n, randu, randl;
    unsigned char Rmask, Gmask, Bmask;
    int rand[64];
    FRAME_HDR *Fr;

    n = 0;
    Rmask = colmask >> 16;
    Gmask = colmask >> 8;
    Bmask = colmask;
    Dat = GM_UseTexData(0);
    for (n = 0; n < numpart; n++) {
        if (!anyfuckingmenus)
            rand[n] = GU_GetRnd();
        randl = rand[n] & 0xFFFF;
        randu = rand[n] >> 16;
        x = scrnx + randl % width;
        y = scrny + randu % height;
        f = (n & 7) + 0xD0;
        Fr = Dat->GetFr(f);
        w = Fr->W;
        h = Fr->H;
        w = (w * scale) / 32768;
        h = (h * scale) / 32768;
        x -= w / 2;
        y -= h / 2;
        if (Rmask)
            SpR = Rmask;
        else
            SpR = randu;
        if (Gmask)
            SpG = Gmask;
        else
            SpG = randl >> 8;
        if (Bmask)
            SpB = Bmask;
        else
            SpB = randl;
        PRIM_GetPrim(&Ft4);
        Dat->PrepareFt4(Ft4, f, x, y, 0, 0);
        setXYWH(Ft4, x, y, w, h);
        setRGB0(Ft4, SpR, SpG, SpB);
        setSemiTrans(Ft4, 1);
        setShadeTex(Ft4, 0);
        addPrim(ThisOt + OtPos + 2, Ft4);
    }
    GM_FinishedUsing(Dat);
}

/* @0x8009FDC0 DAVEL.CPP:645 */
void ResurrectFX(int x, int height, int scale, int OtPos)
{
    int t = (VID_GetTick() >> 2) & 1;

    Teleportfx(x, height / 2, 8, height, scale, 0, 64, OtPos);
    drawpolyG4(x - 10, 0, 10, (height * 3) / 2 + t, (height * 3) / 2 + 5, 0x202020, 0x808080, OtPos);
    drawpolyG4(x, 0, 8, (height * 3) / 2 + 6, (height * 3) / 2 + 6, 0x808080, 0x808080, OtPos);
    drawpolyG4(x + 8, 0, 10, (height * 3) / 2 + 5 + t, (height * 3) / 2, 0x808080, 0x202020, OtPos);
    drawpolyF4(x - 2, 0, 1, (height * 3) / 2 - 1, 0x606060, OtPos);
    drawpolyF4(x - 1, 0, 1, (height * 3) / 2, 0x808080, OtPos);
    drawpolyF4(x, 0, 2, (height * 3) / 2 + 1, 0x80C0C0, OtPos);
    drawpolyF4(x + 2, 0, 4, (height * 3) / 2 + 2, 0xFFFF, OtPos);
    drawpolyF4(x + 6, 0, 2, (height * 3) / 2 + 1, 0x80C0C0, OtPos);
    drawpolyF4(x + 8, 0, 1, (height * 3) / 2, 0x808080, OtPos);
    drawpolyF4(x + 9, 0, 1, (height * 3) / 2 - 1, 0x606060, OtPos);
}

/* @0x8009FFE8 DAVEL.CPP:665 */
void ParticleExp(MissileStruct *Ms, int ScrX, int ScrY, int colour, int OtPos)
{
    ScrY -= 16;
    if (SetParticle) {
        SetParticle = 0;
        if (Ms->_misource == 0)
            p1partexecnum = 16;
        if (Ms->_misource == 1)
            p2partexecnum = 16;
    }
    doparticlechain(ScrX, ScrY, 0, 0, 16, 0xF000, 0x1000, 1, 0, colour, OtPos, Ms->_misource);
}

/* @0x800A0080 DAVEL.CPP:685 */
void SPELLFX_DAT::GetPlrPos(PlayerStruct *ptrplr)
{
    RECT R;
    CBlocks *gblocks = BL_GetCurrentBlocks();
    int ScrXOff = (ptrplr->_pxoff * 625) / 1000;
    int ScrYOff = (ptrplr->_pyoff * 625) / 1000;
    int x = ptrplr->_px * 20;
    int y = ptrplr->_py * 20;

    px = ptrplr->_px;
    py = ptrplr->_py;
    X = x + 10;
    Y = y + 10;
    sxoff = ScrXOff;
    syoff = ScrYOff;
    gblocks->GetScrXY(R, X, Y, sxoff, syoff);
    scrnx = R.x - 4;
    scrny = R.y - 16;
}

/* @0x800A01A4 DAVEL.CPP:706 */
void healFX()
{
    int plr;

    for (plr = 0; plr < 2; plr++) {
        if (SpellFXDat[plr].healactive) {
            SpellFXDat[plr].GetPlrPos(&::plr[plr]);
            int OtPos = CPlayer::GetPlayer(plr)->GetLastOtPos();
            Teleportfx(SpellFXDat[plr].scrnx - 4, SpellFXDat[plr].scrny, 16, 16, 0x4000, 0x40C0FF, 16, OtPos);
            if (!anyfuckingmenus)
                SpellFXDat[plr].healtime--;
            if (SpellFXDat[plr].healtime == 0)
                SpellFXDat[plr].healactive = 0;
        }
    }
}

/* @0x800A02E0 DAVEL.CPP:726 */
void HealStart(int plr)
{
    SpellFXDat[plr].healactive = 1;
    SpellFXDat[plr].healtime = 20;
}

/* @0x800A0314 DAVEL.CPP:732 */
void HealotherStart(int plr)
{
    plr ^= 1;
    SpellFXDat[plr].healactive = 1;
    SpellFXDat[plr].healtime = 20;
}

/* @0x800A034C DAVEL.CPP:739 */
void TeleStart(int plr)
{
    PlayerStruct *p = &::plr[plr];   /* copy-propagated: no SYM record, but evaluates the player address first */
    SpellFXDat[plr].GetPlrPos(p);
    SpellFXDat[plr].teleflag = 1;
    SpellFXDat[plr].scale = 0;
    SpellFXDat[plr].spiny1 = SpellFXDat[plr].scrny - 32;
    SpellFXDat[plr].spiny2 = SpellFXDat[plr].scrny + 32;
}

/* @0x800A040C DAVEL.CPP:749 */
void TeleStop(int plr)
{
    SpellFXDat[plr].teleflag = 0;
    SpellFXDat[plr].scale = 0;
}

/* @0x800A0438 DAVEL.CPP:755 */
void PhaseStart(int plr)
{
    SpellFXDat[plr].phaseflag = 5;
    SpellFXDat[plr].inviscount = 30;
}

/* @0x800A046C DAVEL.CPP:762 */
void PhaseEnd(int plr)
{
    SpellFXDat[plr].phaseflag = 0;
    SpellFXDat[plr].inviscount = 0;
}

/* @0x800A0498 DAVEL.CPP:770 */
void SPELLFX_DAT::ApocInit(PlayerStruct *ptrplr)
{
    RECT R;
    CBlocks *TheBlocks = BL_GetCurrentBlocks();
    int ScrXOff = (ptrplr->_pxoff * 625) / 1000;
    int x = ptrplr->_px * 20;
    int ScrYOff = (ptrplr->_pyoff * 625) / 1000;
    int y = ptrplr->_py * 20;
    int OtPos = CPlayer::GetPlayer(ptrplr != plr)->GetLastOtPos();
    px = ptrplr->_px;
    py = ptrplr->_py;
    sxoff = ScrXOff;
    X = x + 10;
    Y = y + 10;
    syoff = ScrYOff;
    apocactive = 1;
    TheBlocks->GetScrXY(R, X, Y, sxoff, syoff);
    scrnx = R.x;
    scrny = R.y - 32;
    DrawSpinner(scrnx - 2, scrny + 2, 255, 255, 255, 32, 64, 0, 0, OtPos + 2, 1, 0, 8);
    SetLightFX(px, py, 0xA00, 0xA00, 0xA00, 64, 64, 64);
}

/* @0x800A0680 DAVEL.CPP:798 */
void ApocaStart(int plr)
{
    PlayerStruct *p = &::plr[plr];   /* copy-propagated: no SYM record, but evaluates the player address first */
    SpellFXDat[plr].ApocInit(p);
}

/* @0x800A06E4 DAVEL.CPP:806 */
void DaveLTask(TASK *T)
{
    PAD_GetPad(1, 0);
    do {
        if (!CDWAIT) {
            anyfuckingmenus = (questlog | sbookflag | chrflag | PauseMode | invflag) != 0;
            mteleportfx();
            invistimer();
            healFX();
            if (partjumpflag || partglowflag)
                doparticlejump();
        }
        TSK_Sleep(1);
    } while (GLUE_Finished() == 0);
}
