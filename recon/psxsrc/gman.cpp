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
    if (Hdr->ComponentOffset)
        hndBlockOffsets = ((CBlockHdr *)Blocks)->MakeOffsetTab();
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
    int f;

    Size = sizeof(NumOfActions);
    CAct = (CCreatureAction *)&Cr;
    for (f = 0; f < NumOfActions; f++) {
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
    int f;

    CAct = &Cr;
    for (f = 0; f < NumOfActions; f++) {
        CAct->InitDirRemap();
        CAct = (CCreatureAction *)((char *)CAct + CAct->GetSize());
    }
}

/* line 1591 @0x800942EC */
CCreatureAction *CCreatureHdr::GetAction(int ActNum) const
{
    CCreatureAction *CAct;
    int f;

    if (ActNum < 0 || ActNum > NumOfActions) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1592);
    CAct = (CCreatureAction *)&Cr;
    for (f = 0; f < ActNum; f++)
        CAct = (CCreatureAction *)((char *)CAct + CAct->GetSize());
    return CAct;
}

/* line 1551 @0x800941E8 */
void CCreatureAction::InitDirRemap()
{
    BOOL Dir2Remap[8];
    int f;
    int RemapNum;
    int OrigNum;
    int g;

    for (f = 7; f >= 0; f--)
        Dir2Remap[f] = 0;
    for (f = 0; f < 8; f++)
        Dir2Remap[DirRemap[f]] = 1;
    RemapNum = 0;
    f = 0;
    while (f < 8) {
        if (Dir2Remap[f]) {
            OrigNum = f;
            for (g = 0; g < 8; g++) {
                if ((DirRemap[g] & 0xf) == OrigNum)
                    DirRemap[g] |= RemapNum << 4;
            }
            RemapNum++;
        }
        f++;
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
    CBlock *MyBlock;
    long hndRet;
    int *Tab;
    unsigned int f;

    if (NumOfBlocks == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 381);
    hndRet = GAL_Alloc(NumOfBlocks * sizeof(int), 0x8001, "GMAN");
    if (hndRet == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 384);
    Tab = (int *)GAL_Lock(hndRet);
    if (Tab == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 387);
    MyBlock = (CBlock *)Blocks;
    for (f = 0; f < NumOfBlocks; f++) {
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
    Tpage = *(unsigned short *)((unsigned char *)&Fr->FrOffset + 2);
    U = ((unsigned char *)&Fr->FrOffset)[0];
    V = ((unsigned char *)&Fr->FrOffset)[1];
    W = Fr->W;
    H = Fr->H;
    if (!Rotated) {
        GT3->u0 = U;
        GT3->v0 = V;
        GT3->u1 = U + W;
        GT3->v1 = V;
        GT3->u2 = U;
        GT3->v2 = V + H;
    } else {
        GT3->u0 = U;
        GT3->v0 = V + W - 1;
        GT3->u1 = U;
        GT3->v1 = V - 1;
        GT3->u2 = U + H;
        GT3->v2 = V + W - 1;
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
    Tpage = *(unsigned short *)((unsigned char *)&Fr->FrOffset + 2);
    U = ((unsigned char *)&Fr->FrOffset)[0];
    V = ((unsigned char *)&Fr->FrOffset)[1];
    W = Fr->W;
    H = Fr->H;
    if (!Rotated) {
        if (!XFlip) {
            FT4->u0 = U;
            FT4->u1 = U + W;
            FT4->u2 = U;
            FT4->u3 = U + W;
        } else {
            FT4->u0 = U + W - 1;
            FT4->u1 = U - 1;
            FT4->u2 = U + W - 1;
            FT4->u3 = U - 1;
        }
        if (!YFlip) {
            FT4->v0 = V;
            FT4->v1 = V;
            FT4->v2 = V + H;
            FT4->v3 = V + H;
        } else {
            FT4->v0 = V + H - 1;
            FT4->v1 = V + H - 1;
            FT4->v2 = V - 1;
            FT4->v3 = V - 1;
        }
    } else {
        if (!XFlip) {
            FT4->v0 = V + W - 1;
            FT4->v2 = V + W - 1;
            FT4->v1 = V - 1;
            FT4->v3 = V - 1;
        } else {
            FT4->v0 = V;
            FT4->v2 = V;
            FT4->v1 = V + W;
            FT4->v3 = V + W;
        }
        if (!YFlip) {
            FT4->u0 = U;
            FT4->u1 = U;
            FT4->u2 = U + H;
            FT4->u3 = U + H;
        } else {
            FT4->u0 = U + H - 1;
            FT4->u1 = U + H - 1;
            FT4->u2 = U - 1;
            FT4->u3 = U - 1;
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
    Tpage = *(unsigned short *)((unsigned char *)&Fr->FrOffset + 2);
    U = ((unsigned char *)&Fr->FrOffset)[0];
    V = ((unsigned char *)&Fr->FrOffset)[1];
    W = Fr->W;
    H = Fr->H;
    if (!Rotated) {
        if (!XFlip) {
            FT4->u0 = U;
            FT4->u1 = U + W;
            FT4->u2 = U;
            FT4->u3 = U + W;
        } else {
            FT4->u0 = U + W - 1;
            FT4->u1 = U - 1;
            FT4->u2 = U + W - 1;
            FT4->u3 = U - 1;
        }
        if (!YFlip) {
            FT4->v0 = V;
            FT4->v1 = V;
            FT4->v2 = V + H;
            FT4->v3 = V + H;
        } else {
            FT4->v0 = V + H - 1;
            FT4->v1 = V + H - 1;
            FT4->v2 = V - 1;
            FT4->v3 = V - 1;
        }
    } else {
        if (!XFlip) {
            FT4->v0 = V + W - 1;
            FT4->v2 = V + W - 1;
            FT4->v1 = V - 1;
            FT4->v3 = V - 1;
        } else {
            FT4->v0 = V;
            FT4->v2 = V;
            FT4->v1 = V + W;
            FT4->v3 = V + W;
        }
        if (!YFlip) {
            FT4->u0 = U;
            FT4->u1 = U;
            FT4->u2 = U + H;
            FT4->u3 = U + H;
        } else {
            FT4->u0 = U + H - 1;
            FT4->u1 = U + H - 1;
            FT4->u2 = U - 1;
            FT4->u3 = U - 1;
        }
    }
    FT4->tpage = Tpage;
}

/* line 1358 @0x80093DD4 */
void TextDat::SetPal(FRAME_HDR *Fr, POLY_FT4 *FT4)
{
    PAL *Pal;

    Pal = GetPal(Fr->PalNum);
    if (Pal->InVram) {
        FT4->clut = ((unsigned short *)Pal)[1];
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
    hnd = GAL_Alloc(Size, 1, "DECB");
    if (hnd == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 726);
    RetAddr = (unsigned char *)GAL_Lock(hnd);
    if (RetAddr == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 729);
    DecArray[Scr * 40 + DecIndex] = hnd;
    if (GAL_Unlock(hndDecompArrays) == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 734);
    NumOfBuffers[Scr] = DecIndex + 1;
    return RetAddr;
}

/* line 1145 @0x80093958 */
void TextDat::MakePalOffsetTab()
{
    PAL *ThisPal;
    unsigned int f;

    hndPalOffset = GAL_Alloc(Hdr->NumOfPals * sizeof(int), 0x8001, "GMAN");
    if (hndPalOffset == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1149);
    PalOffset = (int *)GAL_Lock(hndPalOffset);
    if (PalOffset == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1152);
    ThisPal = (PAL *)Pals;
    for (f = 0; f < Hdr->NumOfPals; f++) {
        PalOffset[f] = (unsigned char *)ThisPal - (unsigned char *)Pals;
        if (!ThisPal->InVram)
            ThisPal = (PAL *)((unsigned char *)ThisPal + ThisPal->NumOfCols * 2);
        ThisPal = (PAL *)((unsigned char *)ThisPal + 4);
    }
}

/* line 1105 @0x80093818 */
void TextDat::MakeCreatureOffsetTab()
{
    int NumOfCreatures;
    unsigned char *ThisAddr;
    unsigned int f;

    NumOfCreatures = Hdr->NumOfCreatures;
    if (NumOfCreatures == 0) {
        CreatureOffset = NULL;
        hndCreatureOffset = -1;
    } else {
        hndCreatureOffset = GAL_Alloc(NumOfCreatures * sizeof(int), 0x8001, "GMAN");
        if (hndCreatureOffset == -1) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1109);
        CreatureOffset = (int *)GAL_Lock(hndCreatureOffset);
        if (CreatureOffset == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1112);
        ThisAddr = CreatureAnims;
        for (f = 0; f < Hdr->NumOfCreatures; f++) {
            CreatureOffset[f] = ThisAddr - CreatureAnims;
            ThisAddr += ((CCreatureHdr *)ThisAddr)->GetSize();
        }
    }
    {
        int f;
        NumOfCreatures = GetNumOfCreatures();
        for (f = 0; f < NumOfCreatures; f++)
            ((CCreatureHdr *)GetCreature(f))->InitActionDirRemaps();
    }
}

/* line 1428 @0x80093F44 */
void TextDat::DoDecompRequests()
{
    long *DecArray;
    int f;

    if (Scr == 0)
        Scr = 1;
    else
        Scr = 0;
    DecArray = (long *)GAL_Lock(hndDecompArrays);
    if (DecArray == NULL) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1440);
    DecArray += Scr * 40;
    for (f = 0; f < NumOfBuffers[Scr]; f++) {
        if (GAL_Free(DecArray[f]) == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1452);
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
    int f;

    if (Loaded == 0) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1499);
    NumOfFrames = GetNumOfFrames();
    Widest = 0;
    Tallest = 0;
    for (f = 0; f < NumOfFrames; f++) {
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
    TextDat *Dat2Use;
    CTextFileInfo **Tab;
    int f;

    if ((unsigned int)Id > 0x173) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1313);
    if (AllDats[Id] == NULL) {
        Tab = TX_DatTab;
        Dat2Use = NULL;
        for (f = 0; f < 20 && Dat2Use == NULL; f++) {
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
