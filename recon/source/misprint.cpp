/* MISPRINT.CPP -- Diablo PSX (Climax 1998) reconstruction: per-missile draw handlers.
 * PSX-only (no PC twin: the PC build draws missiles inside scrollrt).  Bodies derived from the retail
 * oracle (asm/nonmatchings/misprint) + SYM (scratch/tuinfo.py MISPRINT.CPP) + refs/skeleton drafts.
 * Layouts / externs / prototypes from DIABPSX.SYM (tools/symhdr.py -> gen/*_misprint.h).
 * Every Func<MIS> has the signature (MissileStruct *Ms, int ScrX, int ScrY, int OtPos).
 * TempPrintMissile(ScrX, ScrY, OtPos, spell, aframe, direction, anim, sfx, xflip, yflip, r, g, b, semi). */
#include "diabpsx_types.h"
#include "psxsrc/textfileinfo_header.h"   /* GMAN.H inlines: the ".tp"/".dat" literal pool heads this TU's .sdata */
#include "source/gen/structs_misprint.h"
#include "source/gen/externs_misprint.h"
#include "source/gen/protos_misprint.h"

extern "C" void DBG_Error(char *Text, char *File, int Line);

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "source/MISPRINT.cpp", line)   /* retail line literals */

/* @0x8011BC28 (.sdata; only this TU reaches it gp-relative -> owned here) */
TextDat *MissDat;

extern "C" unsigned char GAL_Free(long Handle);

/* Original unused GMAN.H inline (line 290): its "psxsrc/gman.h" literal heads this TU's .rdata. */
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd))
            DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

inline CPlayer *CPlayer::GetPlayer(int PNum)
{
    if (1 < (unsigned int)PNum)
        DBG_Error(NULL, "psxsrc/cplayer.h", 0x41);
    return PActiveArray[PNum];
}

/* PRIMPOOL.H: declared here, its body is parsed after FuncFLASH (see there). */
#include "psxsrc/psyq.h"
extern POLY_FT4 *ThisPrimAddr;   /* @0x8011AAB8 */
extern POLY_FT4 *AddrToAvoid;    /* @0x8011AABC */
inline void PRIM_GetPrim(POLY_FT4 **Prim);

/* @0x8007B8C4 MISPRINT.CPP:85 */
void DoPortalFX(POLY_FT4 *Ft4, int R, int G, int B, int OtPos)
{
    unsigned char zU;
    unsigned char *s;
    unsigned char *d;
    unsigned char *Ft4m;
    short zX0;
    short zX1;
    short zY;
    int n;
    static int xoffset[56] = {   /* @0x800E38E4 */
        0, 12, 5, 15, 8, 10, 7, 16, 1, 13, 4, 17, 6, 11, 1, 14,
        0, 12, 5, 15, 8, 10, 7, 16, 1, 13, 4, 17, 6, 11, 1, 14,
        0, 12, 5, 15, 8, 10, 7, 16, 1, 13, 4, 17, 6, 11, 1, 14,
        0, 12, 5, 15, 8, 10, 7, 16,
    };

    Ft4m = (unsigned char *)Ft4;
    zU = Ft4->u0;
    zX0 = Ft4->x0;
    zX1 = Ft4->x1;
    zY = Ft4->y0;
    for (n = 0; n < 54; n++) {
        PRIM_GetPrim(&Ft4);
        for (s = Ft4m, d = (unsigned char *)Ft4; s < Ft4m + sizeof(POLY_FT4); s++, d++)
            *d = *s;
        Ft4->u0 = zU;
        Ft4->u1 = zU;
        Ft4->y0 = zY;
        Ft4->y1 = zY;
        Ft4->x0 = zX0 + xoffset[n];
        Ft4->x1 = zX1 - xoffset[n];
        zU++;
        Ft4->u2 = zU;
        Ft4->u3 = zU;
        zY++;
        Ft4->y2 = zY;
        Ft4->y3 = zY;
        Ft4->x2 = zX0 + xoffset[n];
        Ft4->x3 = zX1 - xoffset[n];
        if (!PauseMode) {
            if (xoffset[n] < 18)
                xoffset[n]++;
            else
                xoffset[n] = 0;
        }
        setSemiTrans(Ft4, 0);
        Ft4->r0 = R;
        Ft4->g0 = G;
        Ft4->b0 = B;
        setShadeTex(Ft4, 0);
        addPrim(ThisOt + OtPos, Ft4);
    }
    Ft4 = (POLY_FT4 *)Ft4m;
    Ft4->u0 = zU;
    Ft4->u1 = zU;
    Ft4->y0 = zY;
    Ft4->y1 = zY;
    Ft4->x0 = zX0 + xoffset[n];
    Ft4->x1 = zX1 - xoffset[n];
    Ft4->x2 = zX0 + xoffset[n];
    Ft4->x3 = zX1 - xoffset[n];
    if (!PauseMode) {
        if (xoffset[n] < 18)
            xoffset[n]++;
        else
            xoffset[n] = 0;
    }
    setSemiTrans(Ft4, 0);
    Ft4->r0 = R;
    Ft4->g0 = G;
    Ft4->b0 = B;
    setShadeTex(Ft4, 0);
    addPrim(ThisOt + OtPos, Ft4);
}

/* @0x8007BC34 MISPRINT.CPP:156 */
POLY_FT4 *TempPrintMissile(int ScrX, int ScrY, int OtPos, int spell, int aframe, int direction, int anim, int sfx,
                           char xflip, char yflip, unsigned char red, unsigned char grn, unsigned char blu, char semi)
{
    POLY_FT4 *FT4;
    TextDat *missdat;
    int frame;
    int tv1;
    int dw;
    int dh;

    missdat = MissDat;
    frame = missdat->GetFrNum(spell, anim, direction, aframe) & 0xffff;
    missdat->GetFr(frame);
    if (frame >= 0 && frame < missdat->GetNumOfFrames()) {
        PRIM_GetPrim(&FT4);
        missdat->PrepareFt4(FT4, frame, ScrX, ScrY, xflip, yflip);
        if (sfx >= 2 && sfx < 18) {
            tv1 = 17 - sfx;
            FT4->x0 += tv1;
            FT4->x2 += tv1;
            FT4->x1 -= tv1;
            FT4->x3 -= tv1;
        }
        if (sfx >= 19 && sfx < 28) {
            grn = (sfx - 19) << 5;
            FT4->tpage |= 0x20;
            red = grn;
            blu = grn;
        }
        if (sfx == 18) {
            FT4->x1 = (FT4->x0 + FT4->x1) / 2;
            FT4->x3 = (FT4->x2 + FT4->x3) / 2;
            FT4->y0 = (FT4->y0 + FT4->y2) / 2;
            FT4->y1 = (FT4->y1 + FT4->y3) / 2;
        }
        if (sfx == 1) {
            FT4->y0 += ((FT4->y2 - FT4->y0) * (10 - aframe)) / 10;
            FT4->y1 += ((FT4->y3 - FT4->y1) * (10 - aframe)) / 10;
        }
        if (currlevel && spell == 2) {
            OtPos += 2;
            dw = (FT4->x1 - FT4->x0) / 2;
            FT4->x1 += dw;
            FT4->x3 += dw;
            dh = (FT4->y2 - FT4->y0) / 2;
            FT4->y0 -= dh;
            FT4->y1 -= dh;
        }
        FT4->r0 = red;
        FT4->g0 = grn;
        FT4->b0 = blu;
        setSemiTrans(FT4, semi);
        setShadeTex(FT4, 0);
        addPrim(ThisOt + OtPos, FT4);
        return FT4;
    }
    return NULL;
}

/* @0x8007C01C MISPRINT.CPP:225 */
void FuncTOWN(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    int anim;
    POLY_FT4 *FT4;
    TextDat *missdat;
    int frame;

    missdat = MissDat;
    if (Ms->_mimfnum > 0)
        anim = 17;
    else
        anim = Ms->_miAnimFrame;
    if (currlevel) {
        frame = missdat->GetFrNum(9, 0, 0, 0) & 0xffff;
        PRIM_GetPrim(&FT4);
        missdat->PrepareFt4(FT4, frame, ScrX, ScrY, 0, 0);
        if (anim >= 16)
            DoPortalFX(FT4, 0, 0, 0xFF, OtPos);
        TempPrintMissile(ScrX, ScrY, OtPos, 9, 0, 0, 0, anim, 0, 0, 0, 0, 0xC0, 0);
    } else {
        frame = missdat->GetFrNum(2, 0, 0, 0) & 0xffff;
        PRIM_GetPrim(&FT4);
        missdat->PrepareFt4(FT4, frame, ScrX, ScrY, 0, 0);
        if (anim >= 16)
            DoPortalFX(FT4, 0, 0, 0xFF, OtPos);
        TempPrintMissile(ScrX, ScrY, OtPos, 2, 0, 0, 0, anim, 0, 0, 0, 0, 0xC0, 0);
    }
}

/* @0x8007C1BC MISPRINT.CPP:258 */
void FuncRPORTAL(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    int anim;
    POLY_FT4 *FT4;
    TextDat *missdat;
    int frame;

    missdat = MissDat;
    frame = missdat->GetFrNum(9, 0, 0, 0) & 0xffff;
    if (Ms->_mimfnum > 0)
        anim = 17;
    else
        anim = Ms->_miAnimFrame;
    PRIM_GetPrim(&FT4);
    missdat->PrepareFt4(FT4, frame, ScrX, ScrY, 0, 0);
    if (anim >= 16)
        DoPortalFX(FT4, 0xFF, 0, 0, OtPos);
    TempPrintMissile(ScrX, ScrY, OtPos, 9, 0, 0, 0, anim, 0, 0, 0xF0, 0, 0, 0);
}

/* @0x8007C2D8 MISPRINT.CPP:277 */
void FuncFIREBOLT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    if (Ms->_miAnimType == 0x13) {
        DrawExpl(ScrX, ScrY, Ms->_miAnimFrame / 2, OtPos, 0x100, 0, 0x20, 0x60);
    } else {
        char xflip = 0;
        char yflip = 0;
        int frame = Ms->_mimfnum;
        if (frame >= 5) {
            xflip = 1;
            frame = (frame - 1) ^ 7;
        }
        if (frame >= 3) {
            yflip = 1;
            frame &= 1;
        }
        ParticleMissile(Ms, ScrX, ScrY, 0xFF0000, OtPos);
    }
}

/* @0x8007C380 MISPRINT.CPP:300 */
void FuncHBOLT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    if (Ms->_miAnimType == 0x1C) {
        TempPrintMissile(ScrX, ScrY, OtPos, 0xC, Ms->_miAnimFrame, 0, 0, 0, 0, 0, 0x80, 0xE0, 0xF0, 1);
    } else {
        char xflip = 0;
        char yflip = 0;
        int frame = Ms->_mimfnum;
        if (frame >= 5) {
            xflip = 1;
            frame = (frame - 1) ^ 7;
        }
        if (frame >= 3) {
            yflip = 1;
            frame &= 1;
        }
        ParticleMissile(Ms, ScrX, ScrY, 0xFF, OtPos);
    }
}

/* @0x8007C438 MISPRINT.CPP:323 */
void FuncLIGHTNING(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    TempPrintMissile(ScrX + Ms->_miVar6, ScrY + Ms->_miVar7, OtPos, 8, Ms->_miAnimFrame, Ms->_mimfnum, 0, 0, 0, 0,
                     0x80, 0x80, 0x80, 0);
}

/* @0x8007C4A0 MISPRINT.CPP:330 */
void FuncGUARDIAN(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    if (Ms->_mimfnum == 0 && Ms->_miAnimFrame == 15)
        Ms->_miAnimFrame = 14;
    if (Ms->_miAnimFrame == 2 && Ms->_mimfnum == 0)
        DrawSpinner(ScrX - 2, ScrY + 2, 0xF0, 0xF0, 0xF0, 0x18, 0xC0, 0x10, 1, OtPos, 1, 0, 8);
    TempPrintMissile(ScrX, ScrY, OtPos, 3, Ms->_miAnimFrame, 0, Ms->_mimfnum, 0, 0, 0, 0x80, 0x80, 0x80, 0);
}

/* @0x8007C5C4 MISPRINT.CPP:337 */
void FuncFIREWALL(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    int frame = (Ms->_miAnimFrame * 10) / 11;
    TempPrintMissile(ScrX, ScrY, OtPos, 2, frame, 0, 0, (char)(Ms->_mimfnum ^ 1), 0, 0, 0x80, 0x80, 0x80, 1);
}

/* @0x8007C65C MISPRINT.CPP:343 */
void FuncFIREMOVE(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    int frame = (Ms->_miAnimFrame * 10) / 11;
    TempPrintMissile(ScrX, ScrY, OtPos, 2, frame, 0, 0, (char)(Ms->_mimfnum ^ 1), 0, 0, 0x80, 0x80, 0x80, 1);
}

/* @0x8007C6F4 MISPRINT.CPP:349 */
void FuncFLAME(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    TempPrintMissile(ScrX + Ms->_miVar6, ScrY + Ms->_miVar7, OtPos, 7, Ms->_miAnimFrame, Ms->_mimfnum, 0, 0, 0, 0,
                     0x80, 0x80, 0x80, 1);
}

/* @0x8007C760 MISPRINT.CPP:356 */
void FuncARROW(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    char xflip = 0;
    char yflip = 0;
    int frame;

    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    frame = (Ms->_miAnimFrame - 1) % 16;
    if (frame >= 9)
        xflip = 1;
    if (frame >= 5 && frame <= 11)
        yflip = 1;
    TempPrintMissile(ScrX, ScrY, OtPos, 4, frame, Ms->_mimfnum, 0, 0, xflip, yflip, 0x80, 0x80, 0x80, 0);
}

/* @0x8007C810 MISPRINT.CPP:372 */
void FuncFARROW(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    if (Ms->_miAnimType == 5) {
        TempPrintMissile(ScrX, ScrY, OtPos, 0xC, Ms->_miAnimFrame, 0, 0, 0, 0, 0, 0xF0, 0x80, 0x80, 1);
    } else {
        char xflip = 0;
        char yflip = 0;
        int frame;
        int nframe;

        nframe = Ms->_mimfnum;
        frame = nframe;
        if (frame >= 9) {
            xflip = 1;
            nframe -= 8;
        }
        if (frame >= 5 && frame <= 11)
            yflip = 1;
        if (nframe >= 5)
            nframe = 8 - nframe;
        TempPrintMissile(ScrX, ScrY, OtPos, 6, Ms->_miAnimFrame & 1, 0, nframe, 0, xflip, yflip, 0x80, 0x80, 0x80, 0);
    }
}

/* @0x8007C908 MISPRINT.CPP:400 */
void FuncLARROW(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    if (Ms->_miAnimType == 0x1A) {
        TempPrintMissile(ScrX, ScrY, OtPos, 8, Ms->_miAnimFrame, 0, 0, 0, 0, 0, 0x80, 0x80, 0x80, 0);
    } else {
        char xflip = 0;
        char yflip = 0;
        int frame;
        int nframe;

        nframe = Ms->_mimfnum;
        frame = nframe;
        if (frame >= 9) {
            xflip = 1;
            nframe -= 8;
        }
        if (frame >= 5 && frame <= 11)
            yflip = 1;
        if (nframe >= 5)
            nframe = 8 - nframe;
        TempPrintMissile(ScrX, ScrY, OtPos, 5, Ms->_miAnimFrame & 1, 0, nframe, 0, xflip, yflip, 0x80, 0x80, 0x80, 0);
    }
}

/* @0x8007C9F8 MISPRINT.CPP:430 */
void FuncMAGMABALL(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    char xflip = 0;
    char yflip = 0;
    int frame = Ms->_mimfnum;

    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    if (frame >= 5) {
        xflip = 1;
        frame = (frame - 1) ^ 7;
    }
    if (frame >= 3) {
        yflip = 1;
        frame &= 1;
    }
    TempPrintMissile(ScrX, ScrY, OtPos, 0xB, Ms->_miAnimFrame, 0, frame, 0, xflip, yflip, 0x80, 0x80, 0x80, 0);
}

/* @0x8007CA94 MISPRINT.CPP:448 */
void FuncBONESPIRIT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    char xflip = 0;
    char yflip = 0;
    int frame = Ms->_mimfnum;
    int sfx = 0;

    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    if (frame == 8)
        sfx = Ms->_mirange + 19;
    if (frame >= 5) {
        xflip = 1;
        frame = (frame - 1) ^ 7;
    }
    if (frame >= 3) {
        yflip = 1;
        frame &= 1;
    }
    ParticleMissile(Ms, ScrX, ScrY - 8, 0x402020, OtPos - 2);
    TempPrintMissile(ScrX, ScrY, OtPos, 0x10, Ms->_miAnimFrame, 0, frame, sfx, xflip, yflip, 0x80, 0x80, 0x80, 1);
}

/* @0x8007CBB8 MISPRINT.CPP:468 */
void FuncACID(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    char xflip = 0;
    char yflip = 0;
    int frame = Ms->_mimfnum;

    if ((unsigned)frame < 7) {
        if (frame >= 5) {
            xflip = 1;
            frame = (frame - 1) ^ 7;
        }
        if (frame >= 3) {
            yflip = 1;
            frame &= 1;
        }
        TempPrintMissile(ScrX, ScrY, OtPos, 0, Ms->_miAnimFrame, 0, frame, 0, xflip, yflip, 0xE0, 0xE0, 0x80, 1);
    }
}

/* @0x8007CC60 MISPRINT.CPP:493 */
void FuncACIDSPLAT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    TempPrintMissile(ScrX, ScrY, OtPos, 0xE, Ms->_miAnimFrame, Ms->_mimfnum, 0, 0, 0, 0, 0x80, 0x80, 0x80, 1);
}

/* @0x8007CCC8 MISPRINT.CPP:498 */
void FuncACIDPUD(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    TempPrintMissile(ScrX, ScrY, OtPos, 0xF, Ms->_miAnimFrame, Ms->_mimfnum, 0, 0, 0, 0, 0x80, 0x80, 0x80, 1);
}

/* @0x8007CD30 MISPRINT.CPP:503 */
void FuncFLARE(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    unsigned char red = 0;
    unsigned char grn = 0;
    unsigned char blu = 0;
    POLY_FT4 *FT4;

    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    switch (Ms->_miAnimType) {
    case 0x16:
    case 0x2C:
        red = 0xF0;
        grn = 0;
        blu = 0;
        break;
    case 0x28:
        red = 0;
        grn = 0;
        blu = 0xF0;
        break;
    case 0x2A:
        red = 0xF0;
        grn = 0xF0;
        blu = 0;
        break;
    default:
        ASSERT(!"wtf? never heard of this missile", 512);
    }
    FT4 = GM_UseTexData(0)->PrintFt4(0xD9, ScrX + 3, ScrY - 16, 0, OtPos, 0);
    FT4->r0 = 0xA0;
    FT4->g0 = 0xA0;
    FT4->b0 = 0xA0;
    setSemiTrans(FT4, 1);
    setShadeTex(FT4, 0);
    DrawSpinner(ScrX, ScrY - 12, red, grn, blu, 0x18, 0x48, Ms->_miAnimFrame * 3, 0, OtPos, 0, 0, 8);
}

/* @0x8007CEBC MISPRINT.CPP:528 */
void FuncFLAREXP(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    unsigned char red = 0;
    unsigned char grn = 0;
    unsigned char blu = 0;
    unsigned long bright;

    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    switch (Ms->_miAnimType) {
    case 0x17:
    case 0x2D:
        red = 0xF0;
        grn = 0;
        blu = 0;
        break;
    case 0x29:
        red = 0;
        grn = 0;
        blu = 0xF0;
        break;
    case 0x2B:
        red = 0xF0;
        grn = 0xF0;
        blu = 0;
        break;
    default:
        ASSERT(!"wtf? never heard of this missile", 537);
    }
    bright = 0x61 - ((unsigned long)(Ms->_miAnimFrame * (0x8000 / Ms->_miAnimLen)) >> 8);
    DrawSpinner(ScrX, ScrY - 12, red, grn, blu, Ms->_miAnimFrame * 4 + 24, bright,
                Ms->_miAnimFrame * 3, 0, OtPos - 1, 1, 0, 8);
}

/* @0x8007D038 MISPRINT.CPP:547 */
void FuncCBOLT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    TempPrintMissile(ScrX + Ms->_miVar6, ScrY + Ms->_miVar7, OtPos, 8, Ms->_miAnimFrame, Ms->_mimfnum, 0, 0x12, 0, 0,
                     0x80, 0x80, 0x80, 0);
}

/* @0x8007D0A4 MISPRINT.CPP:554 */
void FuncBOOM(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    DrawExpl(ScrX + Ms->_miVar6, ScrY + Ms->_miVar7, Ms->_miAnimFrame / 2, OtPos, 0x200, 0, 0x20, 0x60);
}

/* @0x8007D104 MISPRINT.CPP:561 */
void FuncELEMENT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    if (Ms->_miAnimType == 0x13) {
        DrawExpl(ScrX, ScrY, Ms->_miAnimFrame / 2, OtPos, 0x200, 0, 0, 0x60);
    } else {
        char xflip = 0;
        int frame = Ms->_mimfnum;
        if (frame >= 5) {
            xflip = 1;
            frame = 8 - frame;
        }
        TempPrintMissile(ScrX, ScrY, OtPos, 0xA, Ms->_miAnimFrame, 0, frame, 0, xflip, 0, 0x80, 0x80, 0x80, 1);
    }
}

/* @0x8007D1D8 MISPRINT.CPP:578 */
void FuncMISEXP(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    TempPrintMissile(ScrX + Ms->_miVar6, ScrY + Ms->_miVar7, OtPos, 0xC, Ms->_miAnimFrame, 0, 0, 0, 0, 0,
                     0xF0, 0x80, 0x80, 1);
}

/* @0x8007D244 MISPRINT.CPP:585 */
void FuncRHINO(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
}

/* @0x8007D24C MISPRINT.CPP:589 */
void FuncFLASH(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    int size;

    if (Ms->_micaster == 0) {
        static const int xoffset[3][8] = {   /* @0x80118CF4 */
            { -2, -1, 4, 6, 9, 10, 6, 2 },
            { 3, 2, 2, 4, 5, 6, 6, 4 },
            { 1, -1, -2, 0, 3, 5, 5, 4 },
        };
        int id = Ms->_misource;
        CPlayer *test = CPlayer::GetPlayer(id);
        PlayerStruct *player = &plr[id];
        ScrX = test->GetLastScrX() + xoffset[player->_pClass][player->_pdir] - 6;
        ScrY = test->GetLastScrY() + 2;
    }
    size = Ms->_miAnimFrame << 4;
    if (size >= 39)
        size = 76 - size;
    if (size > 0)
        DrawSpinner(ScrX, ScrY - 36, 0xA0, 0xA0, 0xFF, size + 24, 0x80 - Ms->_miAnimFrame * 4, Ms->_miAnimFrame * 3, 0,
                    OtPos + 1, 1, 1, 8);
}

/* PRIMPOOL.H inline (header copy, lines 65-71), parsed here: cc1plus emits an inline's literal where its body
 * is parsed, and retail .rdata has "psxsrc/primpool.h" after FuncFLASH's xoffset table; defined last among the
 * inlines, it leads the reverse-order out-of-line tail. */
inline void PRIM_GetPrim(POLY_FT4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_FT4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 68);
    *Prim = (POLY_FT4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_FT4 *)ThisPrimAddr + 1);
}

/* @0x8007D3AC MISPRINT.CPP:610 */
void FuncMANASHIELD(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    TempPrintMissile(ScrX + Ms->_miVar6, ScrY + 16, OtPos, 0xD, 0, 0, 0, 0, 0, 0, 0x40, 0x40, 0x80, 0);
}

/* @0x8007D40C MISPRINT.CPP:616 */
void FuncFLASH2(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
}

/* @0x8007D414 MISPRINT.CPP:620 */
void FuncRESURRECTBEAM(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    ResurrectFX(ScrX - 4, ScrY / 2 + 24, 0x4000, OtPos);
}

/* @0x8007D448 MISPRINT.CPP:625 */
void FuncWEAPEXP(MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
    ScrX += Ms->_miVar6;
    ScrY += Ms->_miVar7;
    if (Ms->_miVar2 == 1)
        ParticleExp(Ms, ScrX, ScrY, 0xFF0000, OtPos + 2);
    else
        TempPrintMissile(ScrX, ScrY, OtPos + 2, 8, Ms->_miAnimFrame, Ms->_mimfnum, 0, 0x12, 0, 0, 0x80, 0x80, 0x80, 0);
}
