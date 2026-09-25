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
    /* retail tests the raw flag word (bit 26 of word 1 = InVRAM) with a mask, not a bitfield extract */
    return (((unsigned long *)GetFr(GetFrNum(Creature, Action, Dir, Frame)))[1] & 0x4000000) == 0;
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
    for (f = 0; f < 8; f++) {
        if (Dir2Remap[f]) {
            OrigNum = f;
            for (g = 0; g < 8; g++) {
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

    strcpy(TheName, FileInfo->GetName());
    strcat(TheName, ".tp");
    TpW = Hdr->TWidth;
    TpXDest = (Hdr->DestTPage & 0xf) << 6;
    TpH = Hdr->THeight;
    TpYDest = (Hdr->DestTPage >> 4) << 8;
    SYSI_GetFs()->StreamFile(TheName, 0x8000, TpLoadCallBack, 0, -1);
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
