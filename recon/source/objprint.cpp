/* OBJPRINT.CPP -- Diablo PSX (Climax 1998) reconstruction (SOURCE/OBJPRINT.CPP): per-object draw handlers.
 * PSX-only (no PC twin: the PC build draws objects inside scrollrt).  Bodies from the retail oracle
 * (asm/nonmatchings/objprint) + SYM (scratch/tuinfo.py OBJPRINT.CPP; the SYM also gives every function
 * its STAT/EXT class, so the handlers reached only through ObjPrintFuncs are file statics).
 * Layouts from DIABPSX.SYM (tools/symhdr.py -> gen/structs_objprint.h). */
#include "diabpsx_types.h"
#include "psxsrc/primpool.h"
#include "source/gen/structs_objprint.h"

/* ---- externals ---- */
extern "C" {
unsigned long GU_GetRnd(void);   /* @0x80020CF4 GUTILS.C:76 */
unsigned long TICK_Get(void);    /* @0x80020C1C TICK.C:49 */
}
TextDat *GM_UseTexData(int Id);   /* @0x80093C10 GMAN.CPP:1312 */
void GM_FinishedUsing(TextDat *Fin);   /* @0x80093D80 GMAN.CPP:1349 */
unsigned long VID_GetTick(void);   /* @0x800840F8 VID.CPP:264 */
TextDat *BL_GetCurrentBlocks(void);   /* @0x800919EC BLOCK.CPP:2805 (returns CBlocks *, a TextDat at +0) */
void DrawObjExpl(ObjectStruct *obj, int ScrX, int ScrY, int ot);   /* @0x80054930 OBJECTS.CPP:961 */
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross, BOOL iso, unsigned char SinStep);

extern struct ObjDataStruct AllObjects[99];   /* @0x800D84B0 */
extern struct OBJ_LOAD_INFO ObjMasterLoadList[56];   /* @0x801169F0 */
extern unsigned long *ThisOt;   /* @0x8011AAB4 */
extern unsigned char PauseMode;   /* @0x8011B7A4 */

/* ---- TU data ---- */
static struct CINDER Cinders[16];   /* @0x8012FD20 (bss, SYM STAT) */
static int lasttick = 0;            /* @0x8011BC44 (.sdata, SYM STAT) */
static BOOL FireInit = true;        /* @0x8011BC48 */
static BOOL FirstFire = true;       /* @0x8011BC4C */
struct DoorOff DoorOffsets[4][4] = {   /* @0x800E3B6C */
    { { 0, 0, -6, 0 }, { 0, 0, 7, 0 }, { -1, -3, 0, 0 }, { 0, 0, 0, 0 } },
    { { 0, -4, -10, 0 }, { 0, -4, -8, 0 }, { 0, -4, 0, 0 }, { 0, -4, 0, 0 } },
    { { 0, -5, 11, 0 }, { 0, -5, 1, 0 }, { 0, -5, 2, 0 }, { 0, -5, 0, 0 } },
    { { 0, 0, 0, 0 }, { 0, 0, 0, 0 }, { 0, 0, 0, 0 }, { 0, 0, 0, 0 } },
};
int lox = 0;   /* @0x8011BC50 (.sdata, SYM EXT) */
int loy = 0;   /* @0x8011BC54 */
int lot = 0;   /* @0x8011BC58 */

static void PrintOBJ_FIRE(int, int, int);
void DrawLightSpark(int, int, int);
void PrintTorchStick(int, int, int, int);
POLY_FT4 *PRIM_GetCopy(POLY_FT4 *);
void PRIM_CopyPrim(POLY_FT4 *, POLY_FT4 *);

/* @0x8007D9E8 OBJPRINT.CPP:277 */
static POLY_FT4 *DefaultObjPrint(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos, int XOffSet, int YOffSet)
{
    int AnimFrame;
    POLY_FT4 *Ft4;
    int LoadIndex = AllObjects[OStr->_otype].ofindex;
    int Creature = ObjMasterLoadList[LoadIndex].Creature;

    AnimFrame = OStr->_oAnimFrame - 1;
    if (AnimFrame < ObjDat->GetNumOfFrames(Creature, 0)) {
        int PhysFrame = ObjDat->GetFrNum(Creature, 0, 0, AnimFrame);
        Ft4 = ObjDat->PrintFt4(PhysFrame, ScrX + XOffSet, ScrY + YOffSet, 0, OtPos, 0);
        setShadeTex(Ft4, 0);
        if (((unsigned long *)ObjDat->GetFr(PhysFrame))[1] & 0x1000000) {
            POLY_FT4 *ShadFt4 = PRIM_GetCopy(Ft4);
            CBlocks::ShadScaleSkew(ShadFt4);
            addPrim(ThisOt + OtPos, ShadFt4);
        }
    } else {
        Ft4 = NULL;
    }
    return Ft4;
}

/* @0x8007DB7C OBJPRINT.CPP:312 */
static POLY_FT4 *LightObjPrint(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    POLY_FT4 *Ft4;

    Ft4 = DefaultObjPrint(OStr, ScrX, ScrY, ObjDat, OtPos, 0, 0);
    if (Ft4) {
        if (OStr->_olid != -1) {
            int x = ScrX + 1;
            int y = ScrY - 26;
            DrawSpinner(x, y, 0, 0, 0, 16, 64, 0, false, OtPos, true, false, 8);
        }
    }
    return Ft4;
}

/* @0x8007DC40 OBJPRINT.CPP:335 */
static POLY_FT4 *PrintOBJ_SARC(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    POLY_FT4 *Ft4;
    int AnimFrame;
    int LoadIndex = AllObjects[OStr->_otype].ofindex;
    int Creature = ObjMasterLoadList[LoadIndex].Creature;

    AnimFrame = OStr->_oAnimFrame - 1;
    Ft4 = ObjDat->PrintFt4(ObjDat->GetFrNum(Creature, 0, 0, AnimFrame), ScrX, ScrY, 0, OtPos - 3, 0);
    setShadeTex(Ft4, 0);
    return Ft4;
}

/* @0x8007DD08 OBJPRINT.CPP:384 */
void ResetFlames(void)
{
    if (FireInit) {
        for (int i = 0; i < 16; i++) {
            Cinders[i].x = GU_GetRnd() % 5 + 2;
            Cinders[i].y = (GU_GetRnd() & 0xF) << 8;
            Cinders[i].yinc = (GU_GetRnd() & 0x7F) + 32;
        }
        FireInit = false;
    }
    FirstFire = true;
}

/* @0x8007DDD0 OBJPRINT.CPP:400 */
static void PrintOBJ_FIRE(int ScrX, int ScrY, int OtPos)
{
    POLY_FT4 *Ft4a;
    TextDat *ThisDat;
    int diff;
    CINDER *C;

    ThisDat = GM_UseTexData(0);
    diff = VID_GetTick();
    diff -= lasttick;
    lasttick = VID_GetTick();
    C = Cinders;
    for (int i = 0; i < 16; i++) {
        unsigned short fx = C->x;
        unsigned short fy = C->y;
        unsigned short fyi = C->yinc;
        Ft4a = ThisDat->PrintFt4(0xD9, ScrX + fx, ScrY - (unsigned short)(fy >> 8), 0, OtPos + 1, 0);
        Ft4a->r0 = (16 - (unsigned short)(fy >> 8)) * 8;
        Ft4a->g0 = (16 - (unsigned short)(fy >> 8)) * 5;
        Ft4a->b0 = 16 - (fy >> 8);
        Ft4a->code = (Ft4a->code | 2) & ~1;
        Ft4a->tpage |= 0x20;
        if (!PauseMode && FirstFire) {
            fy += fyi * diff;
            fyi += 16;
            if ((fy >> 8) > 16) {
                fy = 0;
                fx = GU_GetRnd() % 5 + 2;
                fyi = (GU_GetRnd() & 0x7F) + 32;
            }
        }
        C->x = fx;
        C->y = fy;
        C->yinc = fyi;
        C++;
    }
    FirstFire = false;
}

/* @0x8007DF88 OBJPRINT.CPP:496 */
static POLY_FT4 *DoorObjPrint(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    int AnimFrame;
    POLY_FT4 *Ft4;
    TextDat *ThisDat;
    DoorOff *DrOff;
    int LoadIndex;
    int Creature;
    int OpenClosed;
    int Dir;
    int Type;

    ThisDat = GM_UseTexData(0);
    Dir = 0;
    LoadIndex = AllObjects[OStr->_otype].ofindex;
    Creature = ObjMasterLoadList[LoadIndex].Creature;
    AnimFrame = OStr->_oAnimFrame - 1;
    OpenClosed = OStr->_oVar4;
    Type = 0;
    switch (OStr->_otype) {
    case 1:
        break;
    case 2:
        Dir = 1;
        break;
    case 0x2B:
        Dir = 1;
    case 0x2A:
        Type = 1;
        break;
    case 0x4B:
        Dir = 1;
    case 0x4A:
        Type = 2;
        break;
    }
    if (!OpenClosed)
        Dir |= 2;
    DrOff = &DoorOffsets[Type][Dir];
    Ft4 = ObjDat->PrintFt4(ObjDat->GetFrNum(Creature, 0, 0, AnimFrame), ScrX + DrOff->x, ScrY + DrOff->y, 0, OtPos + DrOff->ot, 0);
    if (OStr->_oVar4) {
        switch (OStr->_otype) {
        case 1:
            Ft4->y0 -= 20;
            Ft4->y2 -= 20;
            break;
        case 2:
        case 0x4A:
            Ft4->y0 += 20;
            Ft4->y2 += 20;
            break;
        case 0x4B:
            Ft4->y1 += 20;
            Ft4->y3 += 20;
            break;
        }
    }
    GM_FinishedUsing(ThisDat);
    return Ft4;
}

/* @0x8007E1C4 OBJPRINT.CPP:605 */
void DrawLightSpark(int xo, int yo, int ot)
{
    if (!PauseMode)
        DrawSpinner(xo, yo, 0xFF, 0x80, 0, 48 - ((TICK_Get() & 1) << 4), 40, (TICK_Get() & 1) << 3, false, ot, false, false, 8);
    else
        DrawSpinner(xo, yo, 0xFF, 0x80, 0, 48, 40, 0, false, ot, false, false, 8);
}

/* @0x8007E2A4 OBJPRINT.CPP:624 */
static POLY_FT4 *PrintOBJ_L1LIGHT(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    PrintOBJ_FIRE(ScrX - 2, ScrY - 41, OtPos + 10);
    DrawLightSpark(ScrX - 1, ScrY - 40, OtPos + 12);
    return NULL;
}

/* @0x8007E304 OBJPRINT.CPP:646 */
void PrintTorchStick(int x, int y, int f, int OtPos)
{
    TextDat *ThisDat = BL_GetCurrentBlocks();
    if (ThisDat)
        ThisDat->PrintFt4(ThisDat->GetFrNum(4, 0, 0, f), x, y, 0, OtPos, 0);
}

/* @0x8007E398 OBJPRINT.CPP:661 */
static POLY_FT4 *PrintOBJ_TORCHL(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    POLY_FT4 *Ft4 = NULL;
    Ft4->code = (Ft4->code | 2) & ~1;
    PrintTorchStick(ScrX, ScrY, 3, OtPos);
    PrintOBJ_FIRE(ScrX - 6, ScrY - 34, OtPos);
    DrawLightSpark(ScrX - 5, ScrY - 37, OtPos);
    return NULL;
}

/* @0x8007E41C OBJPRINT.CPP:680 */
static POLY_FT4 *PrintOBJ_TORCHR(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    POLY_FT4 *Ft4 = NULL;
    Ft4->code = (Ft4->code | 2) & ~1;
    PrintTorchStick(ScrX, ScrY, 2, OtPos);
    PrintOBJ_FIRE(ScrX - 1, ScrY - 36, OtPos);
    DrawLightSpark(ScrX, ScrY - 37, OtPos);
    return NULL;
}

/* @0x8007E4A0 OBJPRINT.CPP:699 */
static POLY_FT4 *PrintOBJ_TORCHL2(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    POLY_FT4 *Ft4 = NULL;
    OtPos += 7;
    Ft4->code = (Ft4->code | 2) & ~1;
    PrintTorchStick(ScrX, ScrY, 0, OtPos);
    PrintOBJ_FIRE(ScrX + 8, ScrY - 34, OtPos);
    DrawLightSpark(ScrX + 8, ScrY - 30, OtPos);
    return NULL;
}

/* @0x8007E52C OBJPRINT.CPP:721 */
static POLY_FT4 *PrintOBJ_TORCHR2(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    POLY_FT4 *Ft4 = NULL;
    OtPos += 7;
    Ft4->code = (Ft4->code | 2) & ~1;
    PrintTorchStick(ScrX, ScrY, 1, OtPos);
    PrintOBJ_FIRE(ScrX - 5, ScrY - 34, OtPos);
    DrawLightSpark(ScrX - 5, ScrY - 32, OtPos);
    return NULL;
}

/* @0x8007E5B8 OBJPRINT.CPP:744 */
static POLY_FT4 *PrintOBJ_BARRELEX(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    int AnimFrame;
    POLY_FT4 *Ft4;

    if (OStr->_oAnimFlag)
        DrawObjExpl(OStr, ScrX, ScrY, OtPos);
    AnimFrame = OStr->_oAnimFrame - 2;
    if (AnimFrame <= ObjDat->GetNumOfFrames(9, 0)) {
        int PhysFrame = ObjDat->GetFrNum(9, 0, 0, AnimFrame);
        Ft4 = ObjDat->PrintFt4(PhysFrame, ScrX, ScrY, 0, OtPos, 0);
        setShadeTex(Ft4, 0);
        if (((unsigned long *)ObjDat->GetFr(PhysFrame))[1] & 0x1000000) {
            POLY_FT4 *ShadFt4 = PRIM_GetCopy(Ft4);
            CBlocks::ShadScaleSkew(ShadFt4);
            addPrim(ThisOt + OtPos, ShadFt4);
        }
    } else {
        Ft4 = NULL;
    }
    return Ft4;
}

/* @0x8007E710 OBJPRINT.CPP:780 */
static POLY_FT4 *PrintOBJ_SHRINEL(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    int AnimFrame = OStr->_oAnimFrame - 1;
    if (OStr->_oAnimFlag)
        DrawSpinner(ScrX - 12, ScrY - 28, 0, 0x50, 0xF0, AnimFrame << 3, 0x40, AnimFrame << 2, false, OtPos, true, false, 8);
    return DefaultObjPrint(OStr, ScrX, ScrY, ObjDat, OtPos, 0, 0);
}

/* @0x8007E7E8 OBJPRINT.CPP:797 */
static POLY_FT4 *PrintOBJ_SHRINER(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    int AnimFrame = OStr->_oAnimFrame - 1;
    if (OStr->_oAnimFlag)
        DrawSpinner(ScrX + 8, ScrY - 29, 0, 0x50, 0xF0, AnimFrame << 3, 0x40, AnimFrame << 2, false, OtPos, true, false, 8);
    return DefaultObjPrint(OStr, ScrX, ScrY, ObjDat, OtPos, 0, 0);
}

/* @0x8007E8C0 OBJPRINT.CPP:815 */
static POLY_FT4 *PrintOBJ_BOOKCANDLE(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    return LightObjPrint(OStr, ScrX, ScrY, ObjDat, OtPos);
}

/* @0x8007E8E4 OBJPRINT.CPP:827 */
static POLY_FT4 *PrintOBJ_MCIRCLE1(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    int AnimFrame;
    POLY_FT4 *Ft4;
    int ot;
    int LoadIndex;
    int Creature;
    int PhysFrame;

    AnimFrame = OStr->_oAnimFrame - 1;
    ot = OtPos - 32;
    if (ot < 0)
        ot = 0;
    LoadIndex = AllObjects[OStr->_otype].ofindex;
    Creature = ObjMasterLoadList[LoadIndex].Creature;
    PhysFrame = ObjDat->GetFrNum(Creature, 0, 0, 0);
    Ft4 = ObjDat->PrintFt4(PhysFrame, ScrX, ScrY, 0, ot, 0);
    setShadeTex(Ft4, 0);
    if (AnimFrame == 1 || AnimFrame == 3) {
        Ft4->r0 = 0x80;
        Ft4->g0 = 0;
        Ft4->b0 = 0;
    }
    if (((unsigned long *)ObjDat->GetFr(PhysFrame))[1] & 0x1000000) {
        POLY_FT4 *ShadFt4 = PRIM_GetCopy(Ft4);
        CBlocks::ShadScaleSkew(ShadFt4);
        addPrim(ThisOt + ot, ShadFt4);
    }
    if (AnimFrame == 1 || AnimFrame == 3)
        return NULL;
    return Ft4;
}

/* @0x8007EA80 OBJPRINT.CPP:866 */
static POLY_FT4 *PrintOBJ_STORYBOOK(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    int AnimFrame;
    POLY_FT4 *Ft4;
    int LoadIndex = AllObjects[OStr->_otype].ofindex;
    int Creature = ObjMasterLoadList[LoadIndex].Creature;

    AnimFrame = OStr->_oAnimFrame - 1;
    if (ObjDat->GetNumOfFrames(Creature, 0) < AnimFrame)
        AnimFrame -= ObjDat->GetNumOfFrames(Creature, 0);
    int PhysFrame = ObjDat->GetFrNum(Creature, 0, 0, AnimFrame);
    Ft4 = ObjDat->PrintFt4(PhysFrame, ScrX, ScrY, 0, OtPos, 0);
    setShadeTex(Ft4, 0);
    if (((unsigned long *)ObjDat->GetFr(PhysFrame))[1] & 0x1000000) {
        POLY_FT4 *ShadFt4 = PRIM_GetCopy(Ft4);
        CBlocks::ShadScaleSkew(ShadFt4);
        addPrim(ThisOt + OtPos, ShadFt4);
    }
    return Ft4;
}

/* @0x8007EC08 OBJPRINT.CPP:900 */
static POLY_FT4 *PrintOBJ_STORYCANDLE(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    return LightObjPrint(OStr, ScrX, ScrY, ObjDat, OtPos);
}

/* @0x8007EC2C OBJPRINT.CPP:912 */
static POLY_FT4 *PrintOBJ_CANDLE1(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    return LightObjPrint(OStr, ScrX, ScrY, ObjDat, OtPos);
}

/* @0x8007EC50 OBJPRINT.CPP:923 */
static POLY_FT4 *PrintOBJ_CANDLE2(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    return LightObjPrint(OStr, ScrX, ScrY, ObjDat, OtPos);
}

/* @0x8007EC74 OBJPRINT.CPP:936 */
static POLY_FT4 *PrintOBJ_STAND(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    int ot = OtPos - 1;
    if (ot < 0)
        ot = 0;
    return DefaultObjPrint(OStr, ScrX, ScrY, ObjDat, ot, 0, 0);
}

/* @0x8007ECB0 OBJPRINT.CPP:951 */
static POLY_FT4 *PrintOBJ_SKFIRE(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos)
{
    POLY_FT4 *FT4 = DefaultObjPrint(OStr, ScrX, ScrY, ObjDat, OtPos, 0, 0);
    PrintOBJ_FIRE(ScrX, ScrY, OtPos);
    return FT4;
}

/* ---- PRIMPOOL.H / GMAN.H header copies (out of line here: -fno-inline) ---- */

/* @0x8007ED50 PRIMPOOL.H:75 */
void PRIM_CopyPrim(POLY_FT4 *Dest, POLY_FT4 *Source)
{
    unsigned long *Dest32 = (unsigned long *)Dest;
    unsigned long *Source32 = (unsigned long *)Source;
    for (unsigned int f = 0; f < 10; f++)
        *Dest32++ = *Source32++;
}

/* @0x8007ED14 PRIMPOOL.H:84 */
POLY_FT4 *PRIM_GetCopy(POLY_FT4 *Prim)
{
    POLY_FT4 *RetPrim;
    PRIM_GetPrim(&RetPrim);
    PRIM_CopyPrim(RetPrim, Prim);
    return RetPrim;
}

/* @0x8007EDF4 GMAN.H:253 */
int TextDat::GetNumOfFrames(int Creature, int Action)
{
    return GetCreature(Creature)->GetAction(Action)->NumOfFrames;
}

/* @0x8007EE2C GMAN.H:284 */
struct CCreatureHdr *TextDat::GetCreature(int Creature)
{
    return (struct CCreatureHdr *)(CreatureAnims + CreatureOffset[Creature]);
}

/* @0x8007EE48 GMAN.H:229 */
struct FRAME_HDR *TextDat::GetFr(int FrNum)
{
    return Frames + (unsigned short)FrNum;
}

/* @0x800E39E4 (SYM EXT) -- object type -> draw handler */
typedef POLY_FT4 *(*OBJPRINTFUNC)(ObjectStruct *OStr, int ScrX, int ScrY, TextDat *ObjDat, int OtPos);
OBJPRINTFUNC ObjPrintFuncs[98] = {
    PrintOBJ_L1LIGHT,   /* 0 */
    DoorObjPrint,   /* 1 */
    DoorObjPrint,   /* 2 */
    PrintOBJ_SKFIRE,   /* 3 */
    NULL,   /* 4 */
    NULL,   /* 5 */
    NULL,   /* 6 */
    NULL,   /* 7 */
    PrintOBJ_CANDLE1,   /* 8 */
    PrintOBJ_CANDLE2,   /* 9 */
    NULL,   /* 10 */
    NULL,   /* 11 */
    NULL,   /* 12 */
    NULL,   /* 13 */
    NULL,   /* 14 */
    NULL,   /* 15 */
    NULL,   /* 16 */
    NULL,   /* 17 */
    NULL,   /* 18 */
    NULL,   /* 19 */
    NULL,   /* 20 */
    NULL,   /* 21 */
    NULL,   /* 22 */
    PrintOBJ_STAND,   /* 23 */
    NULL,   /* 24 */
    PrintOBJ_STORYBOOK,   /* 25 */
    NULL,   /* 26 */
    NULL,   /* 27 */
    NULL,   /* 28 */
    NULL,   /* 29 */
    NULL,   /* 30 */
    NULL,   /* 31 */
    NULL,   /* 32 */
    NULL,   /* 33 */
    NULL,   /* 34 */
    NULL,   /* 35 */
    NULL,   /* 36 */
    NULL,   /* 37 */
    NULL,   /* 38 */
    NULL,   /* 39 */
    NULL,   /* 40 */
    PrintOBJ_STORYBOOK,   /* 41 */
    DoorObjPrint,   /* 42 */
    DoorObjPrint,   /* 43 */
    PrintOBJ_TORCHL,   /* 44 */
    PrintOBJ_TORCHR,   /* 45 */
    PrintOBJ_TORCHL2,   /* 46 */
    PrintOBJ_TORCHR2,   /* 47 */
    PrintOBJ_SARC,   /* 48 */
    NULL,   /* 49 */
    NULL,   /* 50 */
    NULL,   /* 51 */
    PrintOBJ_STORYBOOK,   /* 52 */
    NULL,   /* 53 */
    NULL,   /* 54 */
    NULL,   /* 55 */
    NULL,   /* 56 */
    NULL,   /* 57 */
    PrintOBJ_BARRELEX,   /* 58 */
    PrintOBJ_SHRINEL,   /* 59 */
    PrintOBJ_SHRINER,   /* 60 */
    PrintOBJ_STORYBOOK,   /* 61 */
    NULL,   /* 62 */
    NULL,   /* 63 */
    PrintOBJ_STORYBOOK,   /* 64 */
    PrintOBJ_BOOKCANDLE,   /* 65 */
    NULL,   /* 66 */
    NULL,   /* 67 */
    NULL,   /* 68 */
    NULL,   /* 69 */
    NULL,   /* 70 */
    PrintOBJ_STORYBOOK,   /* 71 */
    PrintOBJ_STORYBOOK,   /* 72 */
    NULL,   /* 73 */
    DoorObjPrint,   /* 74 */
    DoorObjPrint,   /* 75 */
    NULL,   /* 76 */
    NULL,   /* 77 */
    NULL,   /* 78 */
    NULL,   /* 79 */
    NULL,   /* 80 */
    NULL,   /* 81 */
    NULL,   /* 82 */
    NULL,   /* 83 */
    PrintOBJ_MCIRCLE1,   /* 84 */
    PrintOBJ_MCIRCLE1,   /* 85 */
    PrintOBJ_STORYBOOK,   /* 86 */
    PrintOBJ_STORYCANDLE,   /* 87 */
    NULL,   /* 88 */
    NULL,   /* 89 */
    NULL,   /* 90 */
    NULL,   /* 91 */
    NULL,   /* 92 */
    NULL,   /* 93 */
    NULL,   /* 94 */
    NULL,   /* 95 */
    NULL,   /* 96 */
    NULL,   /* 97 */
};
