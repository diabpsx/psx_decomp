/* GMAN.CPP — Climax PSX layer, texture/graphics manager (C:\diabpsx\PSXSRC\GMAN.CPP).
 * MAP: .GMAN_text 0x80091E54-0x800953F7, .GMAN_data 0x800B8B94.  Lane: CC1PLPSX 2.7.2 (C++). */
#include "psxsrc/gman.h"

/* GMAN.CPP-owned globals (.sdata @0x8011AD1C..; SYM class EXT INT).  Tentative definitions in the
 * OWNER TU make them gp-relative (`lw $v,%gp_rel(TpW)($gp)`) exactly like retail; `extern` would
 * materialize absolute lui/lw (methodology 3.12 #6). */
int TpW;
int TpH;
int TpXDest;
int TpYDest;
TextDat DatPool[20];            /* @0x800B8B94 -- first object with a ctor => names _GLOBAL_.I.DatPool */
TextDat *AllDats[372];          /* @0x800B9454 */

/* line 123 @0x80091E54 */
TextDat::TextDat()
{
    OnceOnlyInit();
    InitData();
}

/* line 129 @0x80091E88 */
void TextDat::OnceOnlyInit()
{
    DecX = -1;
    DecY = -1;
    PalX = -1;
    PalY = -1;
    OwnDat = 1;
}

/* line 1231 @0x80093A54 */
void TextDat::InitData()
{
    hndDecompArrays = -1;
    hndDat = -1;
    hndHdr = -1;
    hndPalOffset = -1;
    hndCreatureOffset = -1;
    hndDecompBuffer = -1;
    hndBlockOffsets = -1;
    DatLoaded = 0;
    LoadCount = 0;
    Loaded = 0;
}

/* line 144 @0x80091EA8 — gcc-2.7 deleting-dtor shape (__in_chrg + __builtin_delete) */
TextDat::~TextDat()
{
    DumpData();
}

/* line 263 @0x80092170 — stream-load callback: blits each 64x256 chunk into VRAM */
BOOL TpLoadCallBack(unsigned char *Mem, int ReadSoFar, int Size, BOOL LastChunk)
{
    static int TpX;
    static int TpY;
    RECT R;
    int Dx;
    int Dy;

    if (ReadSoFar == 0) {
        TpX = 0;
        TpY = 0;
    }
    R.w = 64;
    R.h = 256;
    Dx = TpX * 64 + TpXDest;
    R.x = Dx;
    Dy = TpY * 256 + TpYDest;
    R.y = Dy;
    LoadImage(&R, (u_long *)Mem);
    TpX++;
    TpX %= TpW;
    if (TpX == 0)
        TpY++;
    DrawSync(0);
    return true;
}

/* line 1252 @0x80093A84 */
void TextDat::DumpData()
{
    DumpHdr();
    DumpDatFile();
    if (hndPalOffset != -1)
        if (!GAL_Free(hndPalOffset)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1262);
    if (hndCreatureOffset != -1)
        if (!GAL_Free(hndCreatureOffset)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1268);
    if (hndBlockOffsets != -1)
        if (!GAL_Free(hndBlockOffsets)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1274);
    if (hndDecompBuffer != -1)
        GPUQ_DiscardHandle(hndDecompBuffer);
    if (hndDecompArrays != -1)
        if (!GAL_Free(hndDecompArrays)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1285);
    InitData();
}


/* line 155 @0x80091EF0 */
void TextDat::ReloadTP()
{
    if (FileInfo->HasTp())
        StreamLoadTP();
}

/* line 1337 @0x80093D44 */
void GM_ForceTpLoad(int Id)
{
    if (AllDats[Id])
        AllDats[Id]->ReloadTP();
}

/* line 1534 @0x80094190 */
int CCreatureAction::GetSize() const
{
    return GU_AlignVal(12 + NumOfFrames, 4);
}

/* line 1539 @0x800941B8 */
int CCreatureAction::GetFrNum(int Direction, int Frame) const
{
    int LocFrame;

    LocFrame = (DirRemap[Direction] >> 4) * NumOfPhysFrames + AnimRemap[Frame];
    return LocFrame + BaseFrame;
}

/* line 1583 @0x800942A8 */
int CCreatureHdr::GetFrNum(int Action, int Direction, int Frame) const
{
    return GetAction(Action)->GetFrNum(Direction, Frame);
}

/* line 1891 @0x80094BA4 */
void CScreen::Unload()
{
    LoadedId = -1;
    DumpData();
}


/* line 1799 @0x8009485C */
CScreen::CScreen()
{
    LoadedId = -1;
}

/* line 1292 @0x80093BAC */
void TextDat::DumpHdr()
{
    if (hndHdr != -1) {
        if (!GAL_Free(hndHdr)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1298);
        hndHdr = -1;
    }
}

/* line 481 @0x800925E0 */
BOOL TextDat::IsCompressed(int Creature, int Action, int Dir, int Frame)
{
    /* raw flag word (bit 26 of word 1), if/return shape: and + sltiu like retail */
    if (((unsigned long *)GetFr(GetFrNum(Creature, Action, Dir, Frame)))[1] & 0x4000000)
        return false;
    return true;
}

/* line 343 @0x80092368 */
void TextDat::MakeBlockOffsetTab()
{
    if (Hdr->ComponentOffset) {
        CBlockHdr *BlockHdr = (CBlockHdr *)Blocks;
        hndBlockOffsets = BlockHdr->MakeOffsetTab();
    }
}

/* line 1526 @0x80094140 */
CTextFileInfo *TextDat::GetFileInfo(int Id)
{
    if ((unsigned int)Id > 0x173) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1527);
    return TX_DatTab[Id];
}

/* line 1349 @0x80093D80 */
void GM_FinishedUsing(TextDat *Fin)
{
    Fin->FinishedUsing();
    if (!Fin->IsLoaded())
        AllDats[Fin->GetTexNum()] = NULL;
}

/* line 1413 @0x80093E98 */
int TextDat::GetFrNum(int Creature, int Action, int Direction, int Frame)
{
    return ((CCreatureHdr *)GetCreature(Creature))->GetFrNum(Action, Direction, Frame);
}

/* line 1418 @0x80093EEC */
BOOL TextDat::IsDirAliased(int Creature, int Action, int Direction)
{
    return (((CCreatureHdr *)GetCreature(Creature))->GetAction(Action)->DirRemap[Direction] & 0xf) != Direction;
}

/* line 1661 @0x8009458C */
long CTextFileInfo::LoadDat() const
{
    if (HasDat() == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1662);
    return GetFile(".dat", 1);
}

/* line 1616 @0x800943EC */
int CCreatureHdr::GetSize() const
{
    int Size;
    CCreatureAction *CAct;

    Size = sizeof(NumOfActions);
    CAct = (CCreatureAction *)&Cr;
    for (int f = 0; f < NumOfActions; f++) {
        int ThisSize;
        ThisSize = CAct->GetSize();
        CAct = (CCreatureAction *)((char *)CAct + ThisSize);
        Size += ThisSize;
    }
    return Size;
}

/* line 1603 @0x8009437C */
void CCreatureHdr::InitActionDirRemaps()
{
    CCreatureAction *CAct;

    CAct = &Cr;
    for (int f = 0; f < NumOfActions; f++) {
        CAct->InitDirRemap();
        CAct = (CCreatureAction *)((char *)CAct + CAct->GetSize());
    }
}

/* line 1591 @0x800942EC */
CCreatureAction *CCreatureHdr::GetAction(int ActNum) const
{
    CCreatureAction *CAct;

    if (ActNum < 0 || ActNum > NumOfActions) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1592);
    CAct = (CCreatureAction *)&Cr;
    for (int f = 0; f < ActNum; f++)
        CAct = (CCreatureAction *)((char *)CAct + CAct->GetSize());
    return CAct;
}

/* line 1551 @0x800941E8 */
void CCreatureAction::InitDirRemap()
{
    BOOL Dir2Remap[8];
    int f;
    int RemapNum;

    for (f = 7; f >= 0; f--)
        Dir2Remap[f] = 0;
    for (f = 0; f < 8; f++)
        Dir2Remap[DirRemap[f]] = 1;
    RemapNum = 0;
    for (f = 0; f < 8; f++) {
        if (Dir2Remap[f]) {
            int OrigNum = f;                 /* SYM: nested-block locals (block line 19/20) -- the block */
            for (int g = 0; g < 8; g++) {    /* scoping is what keeps the outer loop UN-rotated */
                if ((DirRemap[g] & 0xf) == OrigNum)
                    DirRemap[g] |= RemapNum << 4;
            }
            RemapNum++;
        }
    }
}

/* line 1696 @0x800946F4 */
BOOL CTextFileInfo::HasFile(char *Ext) const
{
    char FName[13];
    FileIO *MyFileIO;
    int Len;

    MyFileIO = SYSI_GetFs();
    strcpy(FName, FileName);
    strcat(FName, Ext);
    if (FileSYS == 2) {
        if (!BL_FileExists(FName, 1))
            return false;
    }
    Len = MyFileIO->FileLen(FName);
    return Len != 0 && Len != -1;
}

/* line 1678 @0x80094654 */
long CTextFileInfo::GetFile(char *Ext, unsigned long RamId) const
{
    char FName[13];
    long hnd;

    if (strlen(FileName) > 8) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1681);
    MakeFname(FName, Ext);
    hnd = SYSI_GetFs()->Read(FName, RamId);
    GAL_SetMemName(hnd, FName);
    return hnd;
}

/* line 292 @0x80092218 */
void TextDat::StreamLoadTP()
{
    char TheName[20];
    FileIO *Fs;

    strcpy(TheName, FileInfo->GetName());
    strcat(TheName, ".tp");
    Fs = SYSI_GetFs();
    TpW = Hdr->TWidth;
    TpH = Hdr->THeight;
    TpXDest = (Hdr->DestTPage & 0xf) << 6;
    TpYDest = (Hdr->DestTPage >> 4) << 8;
    Fs->StreamFile(TheName, 0x8000, TpLoadCallBack, 0, -1);
}

/* line 316 @0x800922D0 */
void TextDat::FinishedUsing()
{
    if (--LoadCount == 0) {
        if (FileInfo->HasDat() && Hdr->DecompOffset) {
            DEC_RemoveAsDecRequestor(this);
            DoDecompRequests();
            DoDecompRequests();
        }
        DumpData();
    }
    if (LoadCount < 0)
        LoadCount = 0;
}

/* line 1672 @0x8009460C */
void CTextFileInfo::MakeFname(char *Dest, const char *Ext) const
{
    strcpy(Dest, FileName);
    strcat(Dest, Ext);
}

/* line 375 @0x800923B4 */
long CBlockHdr::MakeOffsetTab() const
{
    CBlock *MyBlock = (CBlock *)Blocks;     /* initializer: retail forms this+4 in the prologue */
    long hndRet;
    int *Tab;

    if (NumOfBlocks == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 381);
    hndRet = GAL_Alloc(NumOfBlocks * sizeof(int), 0x8001, "GMAN");
    if (hndRet == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 384);
    Tab = (int *)GAL_Lock(hndRet);
    if (Tab == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 387);
    for (unsigned int f = 0; f < NumOfBlocks; f++) {
        Tab[f] = (unsigned char *)MyBlock - (unsigned char *)this;
        MyBlock = (CBlock *)((unsigned char *)MyBlock + MyBlock->GetSize());
    }
    if (GAL_Unlock(hndRet) == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 396);
    return hndRet;
}

/* line 1934 @0x80094EA8 */
void CPart::SetRect(TextDat &TDat, RECT &R)
{
    FRAME_HDR *Fr;

    Fr = TDat.GetFr(Piece);
    R.x = X;
    R.y = -Y;
    R.w = Fr->W;
    R.h = Fr->H;
}

/* line 1946 @0x80094F24 */
void CBlock::GetBoundingBox(TextDat &TDat, RECT &R)
{
    int left, right, top, bottom;

    if (NumOfParts) {
        RECT Pr;
        Parts[0].SetRect(TDat, Pr);
        left = Pr.x;
        top = Pr.y;
        right = Pr.x + Pr.w;
        bottom = Pr.y + Pr.h;
        for (unsigned int f = 0; f < NumOfParts; f++) {
            Parts[f].SetRect(TDat, Pr);
            if (Pr.x + Pr.w > right)
                right = Pr.x + Pr.w;
            if (Pr.y + Pr.h > bottom)
                bottom = Pr.y + Pr.h;
            if (Pr.x < left)
                left = Pr.x;
            if (Pr.y < top)
                top = Pr.y;
        }
    } else {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
    }
    R.x = left;
    R.y = top;
    R.w = right - left;
    R.h = bottom - top;
}

/* line 885 @0x800931CC */
void TextDat::SetUVTpGT3(FRAME_HDR *Fr, POLY_GT3 *GT3)
{
    int Rotated;
    int Tpage;
    int U;
    int V;
    int W;
    int H;

    Rotated = Fr->Rotated;
    Tpage = ((FRAME_TP *)Fr)->Tpage;
    U = ((FRAME_TP *)Fr)->U;
    V = ((FRAME_TP *)Fr)->V;
    W = Fr->W;
    H = Fr->H;
    if (!Rotated) {
        GT3->u0 = U;
        GT3->u1 = U + W;
        GT3->u2 = U;
        GT3->v0 = V;
        GT3->v1 = V;
        GT3->v2 = V + H;
    } else {
        GT3->v0 = V + W - 1;
        GT3->v2 = V + W - 1;
        GT3->v1 = V - 1;
        GT3->u0 = U;
        GT3->u1 = U;
        GT3->u2 = U + H;
    }
    GT3->tpage = Tpage;
}

/* line 408 @0x800924E0 */
void TextDat::SetUVTp(FRAME_HDR *Fr, POLY_FT4 *FT4, int XFlip, int YFlip)
{
    int Rotated;
    int Tpage;
    int U;
    int V;
    int W;
    int H;

    Rotated = Fr->Rotated;
    Tpage = ((FRAME_TP *)Fr)->Tpage;
    U = ((FRAME_TP *)Fr)->U;
    V = ((FRAME_TP *)Fr)->V;
    W = Fr->W;
    H = Fr->H;
    if (!Rotated) {
        if (XFlip) {
            FT4->u0 = U + W - 1;
            FT4->u1 = U - 1;
            FT4->u2 = U + W - 1;
            FT4->u3 = U - 1;
        } else {
            FT4->u0 = U;
            FT4->u1 = U + W;
            FT4->u2 = U;
            FT4->u3 = U + W;
        }
        if (YFlip) {
            FT4->v0 = V + H - 1;
            FT4->v1 = V + H - 1;
            FT4->v2 = V - 1;
            FT4->v3 = V - 1;
        } else {
            FT4->v0 = V;
            FT4->v1 = V;
            FT4->v2 = V + H;
            FT4->v3 = V + H;
        }
    } else {
        if (XFlip) {
            FT4->v0 = V;
            FT4->v2 = V;
            FT4->v1 = V + W;
            FT4->v3 = V + W;
        } else {
            FT4->v0 = V + W - 1;
            FT4->v2 = V + W - 1;
            FT4->v1 = V - 1;
            FT4->v3 = V - 1;
        }
        if (YFlip) {
            FT4->u0 = U + H - 1;
            FT4->u1 = U + H - 1;
            FT4->u2 = U - 1;
            FT4->u3 = U - 1;
        } else {
            FT4->u0 = U;
            FT4->u1 = U;
            FT4->u2 = U + H;
            FT4->u3 = U + H;
        }
    }
    FT4->tpage = Tpage;
}

/* line 745 @0x80092E74 */
void TextDat::SetUVTpGT4(FRAME_HDR *Fr, POLY_GT4 *FT4, int XFlip, int YFlip)
{
    int Rotated;
    int Tpage;
    int U;
    int V;
    int W;
    int H;

    Rotated = Fr->Rotated;
    Tpage = ((FRAME_TP *)Fr)->Tpage;
    U = ((FRAME_TP *)Fr)->U;
    V = ((FRAME_TP *)Fr)->V;
    W = Fr->W;
    H = Fr->H;
    if (!Rotated) {
        if (XFlip) {
            FT4->u0 = U + W - 1;
            FT4->u1 = U - 1;
            FT4->u2 = U + W - 1;
            FT4->u3 = U - 1;
        } else {
            FT4->u0 = U;
            FT4->u1 = U + W;
            FT4->u2 = U;
            FT4->u3 = U + W;
        }
        if (YFlip) {
            FT4->v0 = V + H - 1;
            FT4->v1 = V + H - 1;
            FT4->v2 = V - 1;
            FT4->v3 = V - 1;
        } else {
            FT4->v0 = V;
            FT4->v1 = V;
            FT4->v2 = V + H;
            FT4->v3 = V + H;
        }
    } else {
        if (XFlip) {
            FT4->v0 = V;
            FT4->v2 = V;
            FT4->v1 = V + W;
            FT4->v3 = V + W;
        } else {
            FT4->v0 = V + W - 1;
            FT4->v2 = V + W - 1;
            FT4->v1 = V - 1;
            FT4->v3 = V - 1;
        }
        if (YFlip) {
            FT4->u0 = U + H - 1;
            FT4->u1 = U + H - 1;
            FT4->u2 = U - 1;
            FT4->u3 = U - 1;
        } else {
            FT4->u0 = U;
            FT4->u1 = U;
            FT4->u2 = U + H;
            FT4->u3 = U + H;
        }
    }
    FT4->tpage = Tpage;
}

/* line 630 @0x80092A80 */
void TextDat::PrepareFt4(POLY_FT4 *FT4, int Frm, int X, int Y, int XFlip, int YFlip)
{
    FRAME_HDR *Fr;
    int W;
    int H;

    Fr = GetFr(Frm);
    W = Fr->W;
    H = Fr->H;
    setlen(FT4, 9);
    setcode(FT4, 0x2D);
    if (XFlip) {
        X -= Fr->X;
        X -= W;
    } else {
        X += Fr->X;
    }
    Y += Fr->Y;
    FT4->x0 = X;
    FT4->x1 = X + W;
    FT4->x2 = X;
    FT4->x3 = X + W;
    FT4->y0 = Y;
    FT4->y1 = Y;
    FT4->y2 = Y + H;
    FT4->y3 = Y + H;
    SetPal(Fr, FT4);
    if (Fr->InVRAM) {
        SetUVTp(Fr, FT4, XFlip, YFlip);
    } else {
        if (CanXferFrame()) {
            if (LastFrame != Frm) {
                RECT R;
                DecompFrame(Fr);
                R.x = DecX;
                R.y = DecY;
                R.w = GU_AlignVal(W, 2) >> 1;
                R.h = H;
                GPUQ_LoadImage(&R, hndDecompBuffer, 0);
            }
            FT4->u0 = (DecX & 63) * 2;
            FT4->v0 = DecY;
            FT4->u1 = (DecX & 63) * 2 + W;
            FT4->v1 = DecY;
            FT4->u2 = (DecX & 63) * 2;
            FT4->v2 = DecY + H;
            FT4->u3 = (DecX & 63) * 2 + W;
            FT4->v3 = DecY + H;
            FT4->tpage = GetTPage(1, 0, DecX, DecY);
            if (YFlip) {
                unsigned char sw;
                sw = FT4->v0;
                FT4->v0 = FT4->v2;
                FT4->v2 = sw;
                sw = FT4->v1;
                FT4->v1 = FT4->v3;
                FT4->v3 = sw;
            }
        } else {
            DBG_Error(NULL, "psxsrc/GMAN.CPP", 695);
        }
    }
    LastFrame = Frm;
}

/* line 917 @0x80093250 */
void TextDat::PrepareGt3(POLY_GT3 *GT3, int Frm, int X, int Y)
{
    FRAME_HDR *Fr;
    int W;
    int H;
    PAL *Pal;

    Fr = GetFr(Frm & 0xffff);
    W = Fr->W;
    H = Fr->H;
    setlen(GT3, 9);
    setcode(GT3, 0x35);
    X += Fr->X;
    Y += Fr->Y;
    GT3->x0 = X;
    GT3->y0 = Y;
    GT3->x1 = X + W;
    GT3->y1 = Y;
    GT3->x2 = X;
    GT3->y2 = Y + H;
    Pal = GetPal(Fr->PalNum);
    if (Pal->InVram) {
        unsigned short *Clut = (unsigned short *)Pal;
        GT3->clut = Clut[1];
    } else {
        RECT R;
        GT3->clut = GetClut(0x140, 0x100);
        R.x = 0x140;
        R.y = 0x100;
        R.w = 64;
        R.h = 1;
        LoadImage(&R, (u_long *)Pal->Cols);
    }
    if (Fr->InVRAM) {
        SetUVTpGT3(Fr, GT3);
    } else {
        int DecX = 0x141;
        int DecY = 0x101;
        RECT R;
        DecompFrame(Fr);
        R.x = DecX;
        R.y = DecY;
        R.w = GU_AlignVal(W, 2) >> 1;
        R.h = H;
        GPUQ_LoadImage(&R, hndDecompBuffer, 0);
        GT3->u0 = 1;
        GT3->v0 = 1;
        GT3->u1 = W + 1;
        GT3->v1 = 1;
        GT3->u2 = 1;
        GT3->v2 = H + 1;
        GT3->tpage = GetTPage(1, 0, DecX, DecY);
    }
}

/* line 807 @0x80092F74 */
void TextDat::PrepareGt4(POLY_GT4 *GT4, int Frm, int X, int Y, int XFlip, int YFlip)
{
    FRAME_HDR *Fr;
    int W;
    int H;
    unsigned char sw;

    Fr = GetFr(Frm & 0xffff);
    W = Fr->W;
    H = Fr->H;
    setlen(GT4, 12);
    setcode(GT4, 0x3D);
    if (XFlip) {
        X -= Fr->X;
        X -= W;
    } else {
        X += Fr->X;
    }
    if (YFlip) {
        Y -= Fr->Y;
        Y -= H;
    } else {
        Y += Fr->Y;
    }
    GT4->x0 = X;
    GT4->y0 = Y;
    GT4->x1 = X + W;
    GT4->y1 = Y;
    GT4->x2 = X;
    GT4->y2 = Y + H;
    GT4->x3 = X + W;
    GT4->y3 = Y + H;
    PAL *Pal = GetPal(Fr->PalNum);      /* mid-block declaration: SYM level opens here (+0xbc) */
    if (Pal->InVram) {
        unsigned short *Clut = (unsigned short *)Pal;
        GT4->clut = Clut[1];
    } else {
        RECT R;
        GT4->clut = GetClut(0x140, 0x100);
        R.x = 0x140;
        R.y = 0x100;
        R.w = 64;
        R.h = 1;
        LoadImage(&R, (u_long *)Pal->Cols);
    }
    if (Fr->InVRAM) {
        SetUVTpGT4(Fr, GT4, XFlip, YFlip);
    } else {
        int DecX = 0x141;
        int DecY = 0x101;
        RECT R;
        DecompFrame(Fr);
        R.x = DecX;
        R.y = DecY;
        R.w = GU_AlignVal(W, 2) >> 1;
        R.h = H;
        GPUQ_LoadImage(&R, hndDecompBuffer, 0);
        GT4->u0 = 1;
        GT4->v0 = 1;
        GT4->u1 = W + 1;
        GT4->v1 = 1;
        GT4->u2 = 1;
        GT4->v2 = H + 1;
        GT4->u3 = W + 1;
        GT4->v3 = H + 1;
        GT4->tpage = GetTPage(1, 0, DecX, DecY);
        if (YFlip) {
            sw = GT4->v0;
            GT4->v0 = GT4->v2;
            GT4->v2 = sw;
            sw = GT4->v1;
            GT4->v1 = GT4->v3;
            GT4->v3 = sw;
        }
    }
}

/* line 989 @0x80093418 */
POLY_FT4 *TextDat::PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip)
{
    POLY_FT4 *FT4;

    if (Frm >= 0 && Frm < GetNumOfFrames()) {
        PRIM_GetPrim(&FT4);
        PrepareFt4(FT4, Frm, X, Y, XFlip, YFlip);
        if (YFlip)
            addPrim(&ThisOt[2], FT4);
        else
            addPrim(&ThisOt[OtPos], FT4);
        return FT4;
    }
    return &MyFT4;
}

/* line 1012 @0x8009356C */
POLY_GT4 *TextDat::PrintGt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip)
{
    POLY_GT4 *GT4;

    Frm &= 0xffff;
    if (Frm >= 0 && Frm < GetNumOfFrames()) {
        PRIM_GetPrim(&GT4);
        PrepareGt4(GT4, Frm, X, Y, XFlip, YFlip);
        if (YFlip)
            addPrim(&ThisOt[2], GT4);
        else
            addPrim(&ThisOt[OtPos], GT4);
        return GT4;
    } else {
        return &MyGT4;
    }
}

/* line 1058 @0x800936C0 */
void TextDat::DecompFrame(FRAME_HDR *Fr)
{
    unsigned char *CompFrAddr;
    int DecompSize;
    unsigned char *Dest;

    CompFrAddr = (unsigned char *)GAL_Lock(hndDat);
    if (CompFrAddr == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1064);
    CompFrAddr += Fr->FrOffset;
    DecompSize = GU_AlignVal(Fr->W, 2) * Fr->H;
    Dest = (unsigned char *)GAL_Lock(hndDecompBuffer);
    if (Dest == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1075);
    switch (Fr->CompType) {
    case 1:
        Un64(CompFrAddr, Dest, DecompSize);
        break;
    case 2:
        LZNP_Decode(CompFrAddr, Dest);
        break;
    case 0:
    default:
        if (!(!"Wanker!")) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1089);
        break;
    }
    GAL_Unlock(hndDecompBuffer);
    GAL_Unlock(hndDat);
}

/* line 170 @0x80091F30 */
void TextDat::Use(long NewHndDat, BOOL DatLoaded, int size)
{
    if (!Loaded) {
        char NameBuff[40];

        LastFrame = -1;
        hndHdr = FileInfo->LoadHdr();
        Hdr = (SPR_HDR *)GAL_Lock(hndHdr);
        if (Hdr == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 181);
        if (FileInfo->HasTp()) StreamLoadTP();
        Frames = (FRAME_HDR *)((unsigned char *)Hdr + Hdr->FrameOffset);
        CreatureAnims = (unsigned char *)Hdr + Hdr->CreatureOffset;
        Pals = (unsigned char *)Hdr + Hdr->PalOffset;
        Blocks = (unsigned char *)Hdr + Hdr->ComponentOffset;
        MakePalOffsetTab();
        MakeCreatureOffsetTab();
        MakeBlockOffsetTab();
        Loaded = true;
        if (FileInfo->HasDat()) {
            if (Hdr->DecompOffset) {
                hndDecompArrays = GAL_Alloc(320, 0x8001, "DECB");
                if (hndDecompArrays == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 204);
                Scr = 0;
                NumOfBuffers[0] = 0;
                NumOfBuffers[1] = 0;
                DEC_AddAsDecRequestor(this);
            } else {
                RECT R;
                int DecompSize;
                hndDecompBuffer = -1;
                FindDecompArea(R);
                DecompSize = R.w * R.h;
                hndDecompBuffer = GAL_Alloc(DecompSize, 0x8001, FileInfo->GetName());
                if (hndDecompBuffer == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 225);
            }
            if (NewHndDat == -1) {
                NewHndDat = FileInfo->LoadDat();
            } else {
                if (!DatLoaded) {
                    FileInfo->LoadDat(NewHndDat, size);
                    OwnDat = false;
                } else {
                    OwnDat = true;
                }
            }
            hndDat = NewHndDat;
        }
    }
    LoadCount++;
}

/* line 495 @0x8009262C */
void TextDat::PrintMonster(int Creature, int Action, int Dir, int Frame, int x, int y, int OtPos)
{
    int PhysFrame;

    PhysFrame = GetFrNum(Creature, Action, Dir, Frame);
    PrintMonsterA(PhysFrame, x, y, IsDirAliased(Creature, Action, Dir), OtPos);
}

/* line 508 @0x800926D8 */
POLY_FT4 *TextDat::PrintMonsterA(int Frm, int X, int Y, BOOL XFlip, int OtPos)
{
    if (Frm >= 0 && Frm < GetNumOfFrames()) {
        POLY_FT4 *FT4;
        FRAME_HDR *Fr;
        int W;
        int H;

        PRIM_GetPrim(&FT4);
        Fr = GetFr(Frm);
        W = Fr->W;
        H = Fr->H;
        setlen(FT4, 9);
        setcode(FT4, 0x2C);
        setShadeTex(FT4, 0);
        if (XFlip) {
            X -= Fr->X;
            X -= W;
        } else {
            X += Fr->X;
        }
        Y += Fr->Y;
        FT4->x0 = X;
        FT4->y0 = Y;
        FT4->x1 = X + W;
        FT4->y1 = Y;
        FT4->x2 = X;
        FT4->y2 = Y + H;
        FT4->x3 = X + W;
        FT4->y3 = Y + H;
        SetPal(Fr, FT4);
        if (Fr->InVRAM) {
            SetUVTp(Fr, FT4, XFlip, 0);
            addPrim(&ThisOt[OtPos], FT4);
        } else {
            unsigned char *Dest;
            int DecompSize;
            unsigned char *CompFrAddr;
            DR_LOAD2 *DrPtr;
            unsigned long NumOfPrims;
            int VH;
            int TpX;
            int TpY;

            CompFrAddr = (unsigned char *)GAL_Lock(hndDat) + Fr->FrOffset;
            DecompSize = *CompFrAddr++;
            DecompSize |= *CompFrAddr++ << 8;
            Dest = GetDecompBufffer(DecompSize);
            LZNP_Decode(CompFrAddr, Dest);
            DrPtr = (DR_LOAD2 *)(Dest + 4);
            NumOfPrims = *(unsigned long *)Dest;
            TpX = DrPtr->rect.x;
            TpY = DrPtr->rect.y;
            VH = getTPage(0, 0, TpX, TpY);
            FT4->tpage = VH;
            /* mid-block declarations: SYM level opens here (+0x240) and runs to the end of the else */
            int U = (TpX << 2) & 0xff;
            int V = TpY & 0xff;
            int W = Fr->W;
            int H = Fr->H;
            int u0, u1, u2, u3;
            if (XFlip) {
                u0 = U + W - 1;
                u1 = U - 1;
                u2 = u0;
                u3 = u1;
            } else {
                u0 = U;
                u1 = U + W;
                u2 = u0;
                u3 = u1;
            }
            FT4->v0 = V;
            FT4->v1 = V;
            FT4->v2 = V + H;
            FT4->v3 = V + H;
            FT4->u0 = u0;
            FT4->u1 = u1;
            FT4->u2 = u2;
            FT4->u3 = u3;
            addPrim(&ThisOt[OtPos], FT4);
            for (unsigned int f = 0; f < NumOfPrims; f++) {
                RECT mrect = DrPtr->rect;
                int Len = getlen(DrPtr);
                SetDrawLoad((DR_LOAD *)DrPtr, &mrect);
                addPrim(&ThisOt[OtPos], DrPtr);
                DrPtr = (DR_LOAD2 *)((unsigned char *)DrPtr + Len * 4);
            }
        }
        return FT4;
    }
    return &MyFT4;
}

/* line 1804 @0x80094890 */
void CScreen::Load(int Id, int tpx, int tpy)
{
    unsigned char r, g, b;

    if (Id != LoadedId) {
        FRAME_HDR *Fr;
        RECT R;
        PAL *Pal;
        unsigned short MyPal[256];

        if (Id != -1) DumpData();
        if (FeFlag) CDWAIT = 1;
        SetFileInfo(TX_DatTab[Id], -1);
        Use(-1, true, 0);
        Fr = GetFr(0);
        if (Fr->InVRAM) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1819);
        DecompFrame(Fr);
        if (tpx == 11) {
            setRECT(&R, 0x2C0, tpy, 0xA0, 0xF0);
            GPUQ_LoadImage(&R, hndDecompBuffer, 0);
        } else {
            setRECT(&R, tpx * 64, tpy, 0x80, 0xF0);
            GPUQ_LoadImage(&R, hndDecompBuffer, 0);
        }
        GPUQ_FlushQ();
        Pal = GetPal(0);
        R.x = 0;
        R.y = 0xF0;
        R.w = 0x100;
        R.h = 1;
        LoadImage(&R, (u_long *)Pal->Cols);
        if (Pal->InVram) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1840);
        for (int i = 0; i < 256; i++)
            MyPal[i] = Pal->Cols[i];
        for (int i = 0; i < 16; i++) {
            int nocols = Pal->NumOfCols;
            for (int v = 0; v < nocols; v++) {
                unsigned short c = MyPal[v];
                r = c & 0x1f;
                g = (c >> 5) & 0x1f;
                b = (c >> 10) & 0x1f;
                if (r) r--;
                if (g) g--;
                if (b) b--;
                MyPal[v] = r | (g << 5) | (b << 10);
            }
            R.x = 0;
            R.y = 0xF0 + i;
            R.w = 0x100;
            R.h = 1;
            LoadImage(&R, (u_long *)MyPal);
        }
        {
            int NewId = Id;
            CDWAIT = 0;
            LoadedId = NewId;
            if (hndDat != -1) {
                if (!GAL_Free(hndDat)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1873);
                hndDat = -1;
            }
            if (hndDecompBuffer != -1) {
                if (!GAL_Free(hndDecompBuffer)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1880);
                hndDecompBuffer = -1;
            }
        }
    }
}

/* line 1897 @0x80094BC8 -- NOT MATCHED YET (77 diffs): retail keeps QI 240 / fadeval+240 / addPrim masks
 * in s-regs across the tpx==11 block but re-materialises 9/0x2C/11/HI 240; ternary width shape still open. */
void CScreen::Display(int Id, int tpx, int tpy, int fadeval)
{
    POLY_FT4 *FT4;
    if (Id != LoadedId) Load(Id, tpx, tpy);
    PRIM_GetPrim(&FT4);
    setlen(FT4, 9);
    setcode(FT4, 0x2C);
    setSemiTrans(FT4, 0);
    setShadeTex(FT4, 1);
    if (tpx == 11)
        setXYWH(FT4, 0, 0, 256, 240);
    else
        setXYWH(FT4, 0, 0, 320, 240);
    setUVWH(FT4, 0, 0, 255, 240);
    FT4->tpage = GetTPage(1, 0, tpx * 64, tpy);
    FT4->clut = GetClut(0, fadeval + 240);
    addPrim(ThisOt, FT4);
    if (tpx == 11) {
        PRIM_GetPrim(&FT4);
        setlen(FT4, 9);
        setcode(FT4, 0x2C);
        setSemiTrans(FT4, 0);
        setShadeTex(FT4, 1);
        setXYWH(FT4, 255, 0, 65, 240);
        setUVWH(FT4, 0, 0, 64, 240);
        FT4->tpage = GetTPage(1, 0, 0x340, tpy);
        FT4->clut = GetClut(0, fadeval + 240);
        addPrim(ThisOt, FT4);
    }
}

/* line 1358 @0x80093DD4 */
void TextDat::SetPal(FRAME_HDR *Fr, POLY_FT4 *FT4)
{
    PAL *Pal;

    Pal = GetPal(Fr->PalNum);
    if (Pal->InVram) {
        unsigned short *Clut = (unsigned short *)Pal;
        FT4->clut = Clut[1];
    } else {
        RECT R;
        if (CanXferPal() == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1382);
        FT4->clut = GetClut(PalX, PalY);
        R.x = PalX;
        R.y = PalY;
        R.w = 64;
        R.h = 1;
        LoadImage(&R, (u_long *)Pal->Cols);
    }
}

/* line 706 @0x80092D14 */
unsigned char *TextDat::GetDecompBufffer(int Size)
{
    long *DecArray;
    int DecIndex;
    long hnd;
    unsigned char *RetAddr;

    DecIndex = NumOfBuffers[Scr];
    if (DecIndex == 40) DBG_Error(NULL, "psxsrc/GMAN.CPP", 718);
    DecArray = (long *)GAL_Lock(hndDecompArrays);
    if (DecArray == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 721);
    DecArray += Scr * 40;
    hnd = GAL_Alloc(Size, 1, "DECB");
    if (hnd == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 726);
    RetAddr = (unsigned char *)GAL_Lock(hnd);
    if (RetAddr == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 729);
    DecArray[DecIndex] = hnd;
    if (GAL_Unlock(hndDecompArrays) == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 734);
    DecIndex++;
    NumOfBuffers[Scr] = DecIndex;
    return RetAddr;
}

/* line 1145 @0x80093958 */
void TextDat::MakePalOffsetTab()
{
    PAL *ThisPal;

    hndPalOffset = GAL_Alloc(Hdr->NumOfPals * sizeof(int), 0x8001, "GMAN");
    if (hndPalOffset == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1149);
    PalOffset = (int *)GAL_Lock(hndPalOffset);
    if (PalOffset == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1152);
    ThisPal = (PAL *)Pals;
    for (unsigned int f = 0; f < Hdr->NumOfPals; f++) {
        PalOffset[f] = (unsigned char *)ThisPal - (unsigned char *)Pals;
        if (ThisPal->InVram)
            ThisPal = (PAL *)((unsigned char *)ThisPal + 4);
        else
            ThisPal = (PAL *)((unsigned char *)ThisPal + ThisPal->NumOfCols * 2 + 4);
    }
}

/* line 1105 @0x80093818 */
void TextDat::MakeCreatureOffsetTab()
{
    int NumOfCreatures;

    if (Hdr->NumOfCreatures) {
        unsigned char *ThisAddr;
        hndCreatureOffset = GAL_Alloc(Hdr->NumOfCreatures * sizeof(int), 0x8001, "GMAN");
        if (hndCreatureOffset == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1109);
        CreatureOffset = (int *)GAL_Lock(hndCreatureOffset);
        if (CreatureOffset == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1112);
        ThisAddr = CreatureAnims;
        for (unsigned int f = 0; f < Hdr->NumOfCreatures; f++) {
            CreatureOffset[f] = ThisAddr - CreatureAnims;
            ThisAddr += ((CCreatureHdr *)ThisAddr)->GetSize();
        }
    } else {
        CreatureOffset = NULL;
        hndCreatureOffset = -1;
    }
    NumOfCreatures = GetNumOfCreatures();
    for (int f = 0; f < NumOfCreatures; f++) {
        CCreatureHdr *Cr = (CCreatureHdr *)GetCreature(f);
        Cr->InitActionDirRemaps();
    }
}

/* line 1428 @0x80093F44 */
void TextDat::DoDecompRequests()
{
    long *DecArray;

    if (Scr == 0)
        Scr = 1;
    else
        Scr = 0;
    DecArray = (long *)GAL_Lock(hndDecompArrays);
    if (DecArray == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1440);
    DecArray += Scr * 40;
    for (int f = 0; f < NumOfBuffers[Scr]; f++) {
        long hnd = DecArray[f];           /* block-local (SYM block line 20; record omitted) */
        if (GAL_Free(hnd) == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1452);
    }
    NumOfBuffers[Scr] = 0;
    if (GAL_Unlock(hndDecompArrays) == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1458);
}

/* line 1496 @0x80094068 */
void TextDat::FindDecompArea(RECT &R)
{
    int NumOfFrames;
    int Widest;
    int Tallest;

    if (Loaded == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1499);
    NumOfFrames = GetNumOfFrames();
    Widest = 0;
    Tallest = 0;
    for (int f = 0; f < NumOfFrames; f++) {
        int w;
        int h;
        w = Frames[f].W;
        h = Frames[f].H;
        if (w > Widest) Widest = w;
        if (h > Tallest) Tallest = h;
    }
    Widest = GU_AlignVal(Widest, 2);
    R.w = Widest;
    R.h = Tallest;
}

/* line 1312 @0x80093C10 */
TextDat *GM_UseTexData(int Id)
{
    if ((unsigned int)Id > 0x173) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1313);
    if (AllDats[Id] == NULL) {
        TextDat *Dat2Use = NULL;
        CTextFileInfo **Tab = TX_DatTab;
        for (int f = 0; f < 20 && Dat2Use == NULL; f++) {
            if (!DatPool[f].IsLoaded())
                Dat2Use = &DatPool[f];
        }
        if (Dat2Use == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1326);
        Dat2Use->SetFileInfo(Tab[Id], Id);
        Dat2Use->OnceOnlyInit();
        AllDats[Id] = Dat2Use;
    }
    AllDats[Id]->Use(-1, true, 0);
    return AllDats[Id];
}

/* line 1635 @0x80094458 */
void CTextFileInfo::LoadDat(long hnd, int size) const
{
    char FName[13];
    unsigned char *Dest;
    FileIO *MyFileIO;

    if (HasDat() == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1641);
    if (strlen(FileName) > 8) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1642);
    MakeFname(FName, ".dat");
    MyFileIO = SYSI_GetFs();
    if (MyFileIO->FileLen(FName) > size) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1650);
    Dest = (unsigned char *)GAL_Lock(hnd);
    if (Dest == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1653);
    MyFileIO->ReadAtAddr(FName, Dest, -1);
    if (GAL_Unlock(hnd) == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1656);
}

/* line 1743 @0x80094788 -- run-length decoder */
void Un64(unsigned char *Src, unsigned char *Dest, long SizeBytes)
{
    unsigned char *EndDest;
    unsigned long *BigDest;
    unsigned long Code;
    unsigned long Run;
    unsigned long BigCode;

    EndDest = Dest + SizeBytes;
    while (Dest < EndDest) {
        Code = *Src;
        Run = Code >> 6;
        Src++;
        if (Run) {
            Code &= 0x3f;
        } else {
            Run = *Src;
            Src++;
        }
        if (Run > 7) {
            BigDest = (unsigned long *)(((unsigned long)Dest + 3) & ~3);
            while (Dest < (unsigned char *)BigDest) {
                *Dest++ = Code;
                Run--;
            }
            BigCode = Code | (Code << 8) | (Code << 16) | (Code << 24);
            while (Run > 3) {
                *BigDest++ = BigCode;
                Run -= 4;
            }
            Dest = (unsigned char *)BigDest;
        }
        while (Run != 0) {
            *Dest++ = Code;
            Run--;
        }
    }
}
