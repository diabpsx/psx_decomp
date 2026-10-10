/* FE.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC, FRONTEND overlay).  No PC twin: the
 * PSX front end -- menu tables (FeTable/FeMenuTable) expanded into FeBuffer, pad-driven selection,
 * character-class/name entry, the attract-mode loop (FrontEndTask) and its background draw task.
 * Header inlines (Dialog ctor/dtor, CBlocks::GetOverlayOtBase, CPad::CheckActive) are emitted out of
 * line in this object (-fno-inline). */
#include "psxsrc/fe.h"

extern "C" unsigned char GAL_Free(long Handle);

inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd))
            DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

class CPlayer;
class CPlayer : public TextDat {
public:
    static CPlayer *PActiveArray[2];   /* _7CPlayer.PActiveArray @0x8011AD50, defined by cplayer.cpp */
    unsigned char player_data[144 - 112];

    static CPlayer *GetPlayer(int PNum)
    {
        if (1 < (unsigned int)PNum)
            DBG_Error(NULL, "psxsrc/cplayer.h", 0x41);
        return PActiveArray[PNum];
    }
};

/* Complete retail FE data bank.  Function/menu pointers retain relocations, while
 * FeBuffer and FePlayerName are the original zero-initialized trailing objects. */
FeTable DummyMenu = { 0, 1, 64, 8, InitDummyMenu, NULL, NULL };
FeTable FeMainMenu = { 0, 1, 64, 8, FeInitMainMenu, NULL, NULL };
FeTable FeNewGameMenu = { 0, 1, 64, 8, FeInitNewGameMenu, FeNewGameMenuCtrl, NULL };
FeTable FeNewP1ClassMenu = { 0, 1, 64, 8, FeInitPlayer1ClassMenu, FePlayerClassMenuCtrl, NULL };
FeTable FeNewP1NameMenu = { 0, 1, 8, 8, FeInitNewP1NameMenu, FeNewNameMenuCtrl, NULL };
FeTable FeNewP2ClassMenu = { 0, 1, 64, 8, FeInitPlayer2ClassMenu, FePlayerClassMenuCtrl, NULL };
FeTable FeNewP2NameMenu = { 0, 1, 8, 8, FeInitNewP2NameMenu, FeNewNameMenuCtrl, NULL };
FeTable FeDifficultyMenu = { 0, 1, 64, 8, FeInitDifficultyMenu, FeDifficultyMenuCtrl, NULL };
FeTable FeBackgroundMenu = { 0, 1, 64, 8, FeInitBackgroundMenu, NULL, NULL };
FeTable FeBook1Menu = { 0, 1, 64, 8, FeInitBook1Menu, FeBackBookMenuCtrl, NULL };
FeTable FeBook2Menu = { 0, 1, 64, 8, FeInitBook2Menu, FeBackBookMenuCtrl, NULL };
FeTable FeLoadCharMenu = { 0, 1, 64, 8, FeInitLoadMemcardSelect, McCharCardMenuCtrl, NULL };
FeTable FeLoadChar1Menu = { 0, 1, 64, 8, FeInitLoadChar1Menu, McMainCharKeyCtrl, NULL };
FeTable FeLoadChar2Menu = { 0, 1, 64, 8, FeInitLoadChar2Menu, McMainCharKeyCtrl, NULL };

FeMenuTable FeMainMenuTable[5] = {
    { 0, 0, JustCentre, 0x4FA, NULL, &LargeFont },
    { 0, 22, JustCentre, 0x2B3, &FeNewGameMenu, &LargeFont },
    { 0, 44, JustCentre, 0x25E, &McLoadGameMenu, &LargeFont },
    { 0, 66, JustCentre, 0x2F5, &DummyMenu, &LargeFont },
    { 0, 88, JustCentre, 0x03A, &FeBackgroundMenu, &LargeFont }
};
FeMenuTable FeNewGameMenuTable[3] = {
    { 0, 0, JustCentre, 0x2DC, NULL, &LargeFont },
    { 0, 65, JustCentre, 0x2F0, &FeNewP1ClassMenu, &MediumFont },
    { 0, 78, JustCentre, 0x49C, &FeNewP1ClassMenu, &MediumFont }
};
FeMenuTable FePlayerClassMenuTable[5] = {
    { 0, 0, JustCentre, 0x0B6, NULL, &LargeFont },
    { 0, 65, JustCentre, 0x4BE, NULL, &MediumFont },
    { 0, 78, JustCentre, 0x375, NULL, &MediumFont },
    { 0, 91, JustCentre, 0x3E8, NULL, &MediumFont },
    { 0, 104, JustCentre, 0x25B, &FeLoadCharMenu, &MediumFont }
};
unsigned char FeNameEngMenuTable[40] = {
    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T',
    'U','V','W','X','Y','Z','^','.', '1','2','3','4','5','6','7','8','9','0','{','}'
};
FeMenuTable FeMemcardMenuTable[3] = {
    { 0, 0, JustCentre, 0x3B7, NULL, &LargeFont },
    { 0, 52, JustCentre, 0x288, &FeLoadChar1Menu, &MediumFont },
    { 0, 78, JustCentre, 0x289, &FeLoadChar2Menu, &MediumFont }
};
FeMenuTable FeDifficultyMenuTable[4] = {
    { 0, 0, JustCentre, 0x3B4, NULL, &LargeFont },
    { 0, 65, JustCentre, 0x2BC, &FeDifficultyMenu, &MediumFont },
    { 0, 78, JustCentre, 0x2B6, &FeDifficultyMenu, &MediumFont },
    { 0, 91, JustCentre, 0x1BB, &FeDifficultyMenu, &MediumFont }
};
FeMenuTable FeBackgroundMenuTable[4] = {
    { 0, 13, JustCentre, 0x03A, NULL, &LargeFont },
    { 0, 31, JustCentre, 0x249, &FeBook1Menu, &MediumFont },
    { 0, 61, JustCentre, 0x24A, &FeBook2Menu, &MediumFont },
    { 0, 91, JustCentre, 0x466, &DummyMenu, &MediumFont }
};
FeMenuTable FeBook1MenuTable[5] = {
    { 0, 13, JustCentre, 0x249, NULL, &LargeFont },
    { 0, 46, JustCentre, 0x458, &DummyMenu, &MediumFont },
    { 0, 61, JustCentre, 0x471, &DummyMenu, &MediumFont },
    { 0, 76, JustCentre, 0x44A, &DummyMenu, &MediumFont },
    { 0, 91, JustCentre, 0x43B, &DummyMenu, &MediumFont }
};
FeMenuTable FeBook2MenuTable[6] = {
    { 0, 13, JustCentre, 0x24A, NULL, &LargeFont },
    { 0, 39, JustCentre, 0x45E, &DummyMenu, &MediumFont },
    { 0, 52, JustCentre, 0x438, &DummyMenu, &MediumFont },
    { 0, 65, JustCentre, 0x448, &DummyMenu, &MediumFont },
    { 0, 78, JustCentre, 0x452, &DummyMenu, &MediumFont },
    { 0, 91, JustCentre, 0x46E, &DummyMenu, &MediumFont }
};
FeStruct FeBuffer[80];
char FePlayerName[2][11];

/* ---- TU-owned globals (SYM EXT/STAT; the oracle reaches them via %gp_rel -> defined here) ---- */
int FeBackX = 0;
int FeBackY = 0;
int FeBackW = 0;
int FeBackH = 0;
unsigned char FeFlag = 0;
int FePlayerNo = 0;
static FE_CREATE *CStruct;          /* .sbss */
int FeBufferCount = 0;
int FeMaxBufferCount = 0;
int FeNoOfPlayers = 0;
unsigned char FePadInTab[2] = { 0, 0 };
unsigned char FePadInFlag = 0;
int FeChrClass[2] = { 0, 0 };
FeTable *FeCurMenu = 0;
int FeEnterLang = 0;
unsigned char FePlayerNameFlag[2] = { 0, 0 };
unsigned long FeCount = 0;
int fileselect = 0;
int BookMenu = 0;
int FMVPress = 0;
TextDat *FeTData = 0;
BOOL JustQuitQText = 0;
BOOL LoadedChar[2] = { 0, 0 };
TextDat *FlameTData = 0;
unsigned char FeIsAVirgin = 1;
int FeMenuDelay = 0;
static int fadeval = 0;
static BOOL DrawBackOn = 0;
int FeAttractMode = 1;
int AttractNo = 1;
unsigned long AttractTitleDelay = 0x708;
unsigned long AttractMainDelay = 0x708;
int FMVEndPad = 0x40;
static int JustInCredits = 0;

/* @0x80139C24 FE.CPP:167 */
void FeInitBuffer(void)
{
    for (int Loop = 0; Loop < 80; Loop++)
        FeBuffer[Loop].MenuPtr = NULL;
    FeBufferCount = FeMaxBufferCount = 0;
}

/* @0x80139C50 FE.CPP:178 */
void FeAddEntry(int X, int Y, TXT_JUST Just, unsigned short Str, FeTable *MenuPtr, CFont *Font)
{
    FeBuffer[FeBufferCount].X = X;
    FeBuffer[FeBufferCount].Y = Y;
    FeBuffer[FeBufferCount].Just = Just;
    FeBuffer[FeBufferCount].Str = Str;
    FeBuffer[FeBufferCount].Font = Font;
    FeBuffer[FeBufferCount].MenuPtr = MenuPtr;
    FeBufferCount++;
    FeMaxBufferCount++;
}

/* @0x80139CD4 FE.CPP:190 */
void FeAddTable(FeMenuTable *Table, int Count)
{
    FeInitBuffer();
    for (int Loop = 0; Loop < Count; Loop++) {
        FeAddEntry(Table[Loop].X, Table[Loop].Y, Table[Loop].Just, Table[Loop].Str, Table[Loop].MenuPtr, Table[Loop].Font);
    }
}

/* @0x80139D50 FE.CPP:199 */
void FeAddNameTable(unsigned char *Table, int Count)
{
    FeInitBuffer();
    FeAddEntry(0, 0, JustCentre, 0x131, NULL, &LargeFont);
    for (int YLoop = 0; YLoop < Count / 10; YLoop++) {
        for (int XLoop = 0; XLoop < 10; XLoop++)
            FeAddEntry((XLoop + 1) * 13 + 2, (YLoop * 7 + 35) * 2, JustCentre, Table[YLoop * 10 + XLoop] | 0x1000, NULL, &MediumFont);
    }
}

/* @0x80139E78 FE.CPP:222 */
void FeDrawBuffer(void)
{
    Dialog FeBack;
    RECT FeRect;
    RECT ARect;
    int X;
    int Y;
    TXT_JUST Just;
    TextDat *PanelGfx;
    int SelX;
    int SelY;
    char Text[2];

    if (qtextflag || CDWAIT || !BL_AsyncLoadDone())
        return;
    if (TextPtr == NULL)
        return;
    Text[1] = 0;
    Text[0] = 0;
    PanelGfx = GM_UseTexData(0);
    FeRect.x = FeBackX - 8;
    FeRect.y = FeBackY;
    FeRect.w = FeBackW;
    FeRect.h = FeBackH;
    for (int Loop = 0; Loop < FeBufferCount; Loop++) {
        Y = FeBuffer[Loop].Y;
        X = FeBuffer[Loop].X;
        SelY = Y + FeBackY + 8;
        if (FeBuffer[Loop].Font == &LargeFont)
            SelY = Y + FeBackY + 4;
        Just = FeBuffer[Loop].Just;
        if (Loop == 0 && FeBuffer[0].MenuPtr == NULL) {
            LargeFont.Print(0, 40, GetStr(FeBuffer[0].Str), JustCentre, NULL, BLUER, BLUEG, BLUEB);
        } else if (Loop == FeCurMenu->Sel) {
            if (FeBuffer[Loop].Str < 0x1000) {
                FeBuffer[Loop].Font->Print(X, Y + 8, GetStr(FeBuffer[Loop].Str), Just, &FeRect, GOLDR, GOLDG, GOLDB);
            } else {
                POLY_FT4 *Ft4;
                ARect.w = 14;
                ARect.h = 13;
                ARect.x = FeBackX + X - 8;
                ARect.y = FeBackY + Y;
                Text[0] = FeBuffer[Loop].Str;
                FeBuffer[Loop].Font->Print(0, 8, Text, Just, &ARect, GOLDR, GOLDG, GOLDB);
                Ft4 = PanelGfx->PrintFt4(0x142, FeBackX + X - 6, FeBackY + Y + 7, 0, 0xFD, 0);
                setSemiTrans(Ft4, 1);
                setShadeTex(Ft4, 0);
                Ft4->r0 = GOLDR;
                Ft4->g0 = GOLDG;
                Ft4->b0 = GOLDB;
            }
        } else {
            if (FeBuffer[Loop].Str < 0x1000) {
                FeBuffer[Loop].Font->Print(X, Y + 8, GetStr(FeBuffer[Loop].Str), Just, &FeRect, WHITER, WHITEG, WHITEB);
            } else {
                ARect.w = 14;
                ARect.h = 13;
                ARect.x = FeBackX + X - 8;
                ARect.y = FeBackY + Y;
                Text[0] = FeBuffer[Loop].Str;
                FeBuffer[Loop].Font->Print(0, 8, Text, Just, &ARect, WHITER, WHITEG, WHITEB);
            }
        }
        if (FeCurMenu != &FeNewP1NameMenu && FeCurMenu != &FeNewP2NameMenu && Loop == FeCurMenu->Sel) {
            SelX = FeBuffer[Loop].Font->MinX - 12;
            if (FeBuffer[Loop].Font == &LargeFont)
                DrawFeTwinkle(SelX, SelY + 3);
            else
                DrawFeTwinkle(SelX, SelY);
            SelX = FeBuffer[Loop].Font->MaxX + 4;
            if (FeBuffer[Loop].Font == &LargeFont)
                DrawFeTwinkle(SelX, SelY + 3);
            else
                DrawFeTwinkle(SelX, SelY);
        }
    }
    if (FeCurMenu != &FeMainMenu) {
        if (FeCurMenu == &FeNewP1NameMenu || FeCurMenu == &FeNewP2NameMenu)
            MediumFont.Print(0, 0xD4, GetStr(0x2B2), JustCentre, NULL, WHITER, WHITEG, WHITEB);
        PrintSelectBack(0x4E6);
    } else {
        PrintSelectBack(0x4E5);
    }
    if (FeBufferCount != FeMaxBufferCount) {
        for (int Loop = FeBufferCount; Loop < FeMaxBufferCount; Loop++) {
            X = FeBuffer[Loop].X;
            Y = FeBuffer[Loop].Y;
            Just = FeBuffer[Loop].Just;
            FeBuffer[Loop].Font->Print(X, Y + 8, GetStr(FeBuffer[Loop].Str), Just, &FeRect, WHITER >> 1, WHITEG >> 1, WHITEB >> 1);
        }
    }
}

/* @0x8013A4A4 FE.CPP:340 */
void FeNewMenu(FeTable *Menu)
{
    FeTable *LastMenu;
    void (*FuncPtr)();

    if (Menu != &DummyMenu) {
        LastMenu = FeCurMenu;
        FeCurMenu = Menu;
        if (Menu != &FeMainMenu)
            Menu->PrevMenu = LastMenu;
        FeInitBuffer();
        if (FeCurMenu->Sel == -1)
            FeCurMenu->Sel = 1;
        FuncPtr = FeCurMenu->InitFuncPtr;
        FuncPtr();
        FeMenuDelay = 0;
    }
}

/* @0x8013A524 FE.CPP:357 */
void FePrevMenu(void)
{
    void (*FuncPtr)();

    if (FeCurMenu == &FeNewP2ClassMenu && LoadedChar[0])
        FeNewP2ClassMenu.PrevMenu = &FeNewP1ClassMenu;
    if (FeCurMenu == &FeDifficultyMenu) {
        if (FePlayerNo) {
            if (LoadedChar[1])
                FeDifficultyMenu.PrevMenu = &FeNewP2ClassMenu;
        } else {
            if (LoadedChar[0])
                FeDifficultyMenu.PrevMenu = &FeNewP1ClassMenu;
        }
    }
    if (FeCurMenu == &FeNewP2ClassMenu) {
        FePlayerNo--;
        FeNoOfPlayers++;
    }
    if (FeCurMenu != &FeMainMenu && FeCurMenu->PrevMenu) {
        FeCurMenu = (FeTable *)FeCurMenu->PrevMenu;
        FeInitBuffer();
        if (FeCurMenu->Sel == -1)
            FeCurMenu->Sel = 1;
        FuncPtr = FeCurMenu->InitFuncPtr;
        FuncPtr();
        FeMenuDelay = 0;
        PlaySFX(0x33);
        JustQuitQText = 0;
    }
}

/* @0x8013A66C FE.CPP:420 */
void FeSelUp(int No)
{
    int OldSel = FeCurMenu->Sel;

    FeCurMenu->Sel -= No;
    if (FeCurMenu->Sel < 0)
        FeCurMenu->Sel += FeBufferCount;
    while (FeBuffer[FeCurMenu->Sel].MenuPtr == NULL) {
        FeCurMenu->Sel--;
        if (FeCurMenu->Sel < 0)
            FeCurMenu->Sel += FeBufferCount;
    }
    if (OldSel != FeCurMenu->Sel)
        PlaySFX(0x32);
}

/* @0x8013A754 FE.CPP:436 */
void FeSelDown(int No)
{
    int OldSel = FeCurMenu->Sel;

    FeCurMenu->Sel += No;
    if (FeCurMenu->Sel >= FeBufferCount)
        FeCurMenu->Sel = 0;
    while (FeBuffer[FeCurMenu->Sel].MenuPtr == NULL) {
        FeCurMenu->Sel++;
        if (FeCurMenu->Sel >= FeBufferCount)
            FeCurMenu->Sel -= FeBufferCount;
    }
    if (OldSel != FeCurMenu->Sel)
        PlaySFX(0x32);
}

/* @0x8013A83C FE.CPP:457 */
int FeGetCursor(void)
{
    return FeCurMenu->Sel;
}

/* @0x8013A850 FE.CPP:462 */
void FeSelect(void)
{
    PlaySFX(0x33);
    FeNewMenu(FeBuffer[FeCurMenu->Sel].MenuPtr);
}

/* @0x8013A8A0 FE.CPP:474 */
void FeMainKeyCtrl(CScreen *FeScreen)
{
    if (qtextflag || CDWAIT || PauseMode)
        return;
    if (DavesPad & 1)
        FeSelUp(1);
    if (DavesPad & 2)
        FeSelDown(1);
    if (DavesPad & 0x50) {
        PlaySFX(0x33);
        if (FeCurMenu == &FeBackgroundMenu && FeBackgroundMenu.Sel == 3) {
            InitQTextMsg(0x10A);
        } else if (FeCurMenu == &FeMainMenu && FeMainMenu.Sel == 3) {
            optionsflag = 0;
            FeMenuDelay = 0;
            int Pad = who_pressed(0x50);   /* coalesced into the store: no SYM record, but its level (+0xfc) is retail's */
            options_pad = Pad;
            ToggleOptions();
            while (optionsflag) {
                FeCount = VID_GetTick();
                TSK_Sleep(1);
            }
            FeMenuDelay = 0;
        } else {
            FeNewMenu(FeBuffer[FeCurMenu->Sel].MenuPtr);
        }
    }
    if (DavesPad & 0x100)
        FePrevMenu();
}

/* @0x8013AA68 FE.CPP:531 */
void InitDummyMenu(void)
{
}

/* @0x8013AA70 FE.CPP:538 */
void InitFrontEnd(FE_CREATE *CreateStruct)
{
    CStruct = CreateStruct;
    FeNoOfPlayers = 0;
    FePlayerNo = 0;
    FeEnterLang = LANG_GetLang();
    LoadedChar[0] = LoadedChar[1] = 0;
    currlevel = 0;
    if (FeIsAVirgin) {
        strcpy(FePlayerName[0], GetStr(0x312));
        strcpy(FePlayerName[1], GetStr(0x313));
        FeIsAVirgin = 0;
    }
    FePlayerNameFlag[0] = FePlayerNameFlag[1] = 1;
    FeBackX = 8;
    FeBackY = 0x20;
    FeBackW = 0x140;
    FeBackH = 0x80;
    FeFlag = 1;
    gbMaxPlayers = 0;
    gbActivePlayers = 0;
    plr[0].plractive = 0;
    plr[1].plractive = 0;
    gbRunGame = 0;
    PauseMode = 0;
    qtextflag = 0;
    if (!TSK_AddTask(0, (void (*)())FrontEndTask, 0x1000, 0))
        DBG_Error(NULL, "psxsrc/FE.CPP", 0x241);
    memset(UniqueItemFlag, 0, 0x80);
}

/* @0x8013ABA4 FE.CPP:595 */
void FeInitMainMenu(void)
{
    cardondelay = 5;
    AlertTxt = 0;
    if (MemCardActive == 1)
        MemcardOFF();
    FeAddTable(FeMainMenuTable, 5);
    FeBackX = 8;
    FeBackY = 0x20;
    FeBackW = 0x140;
    FeBackH = 0x80;
    JustQuitQText = 0;
}

/* @0x8013AC20 FE.CPP:625 */
void FeInitNewGameMenu(void)
{
    if (FeEnterLang != LANG_GetLang()) {
        FeEnterLang = LANG_GetLang();
        FePlayerName[0][0] = 0;
        FePlayerName[1][0] = 0;
        FePlayerNameFlag[0] = FePlayerNameFlag[1] = 1;
    }
    FeAddTable(FeNewGameMenuTable, 3);
    FeChrClass[0] = -1;
    FeBackX = 0xC;
    FeBackY = 0x20;
    FeBackW = 0xA0;
    FeBackH = 0x80;
}

/* @0x8013ACB0 FE.CPP:650 */
void FeNewGameMenuCtrl(void)
{
    if (!qtextflag && !CDWAIT && !PauseMode) {
        FePadInTab[0] = PAD_GetPad(0, 0)->CheckActive();
        FePadInTab[1] = PAD_GetPad(1, 0)->CheckActive();
        if (!FePadInTab[0]) {
            FeBufferCount = 1;
            FeCurMenu->Sel = 1;
        } else if (FePadInTab[1]) {
            FeBufferCount = 3;
        } else {
            FeBufferCount = 2;
            FeCurMenu->Sel = 1;
        }
        FeDrawChrClass();
        if (FePadInTab[0]) {
            if (DavesPad & 1)
                FeSelUp(1);
            if (DavesPad & 2)
                FeSelDown(1);
            if (DavesPad & 0x50) {
                if (FeCurMenu->Sel == 1)
                    FeNoOfPlayers = 0;
                else
                    FeNoOfPlayers = 1;
                FePlayerNo = 0;
                PlaySFX(0x33);
                FeNewMenu(FeBuffer[FeCurMenu->Sel].MenuPtr);
            }
            if (DavesPad & 0x100)
                FePrevMenu();
        }
    }
}

/* @0x8013AE64 FE.CPP:731 */
void FeInitPlayer1ClassMenu(void)
{
    LoadedChar[0] = 0;
    if (MemCardActive)
        MemcardOFF();
    FePlayerClassMenuTable[1].MenuPtr = &FeNewP1NameMenu;
    FePlayerClassMenuTable[2].MenuPtr = &FeNewP1NameMenu;
    FePlayerClassMenuTable[3].MenuPtr = &FeNewP1NameMenu;
    FeAddTable(FePlayerClassMenuTable, 5);
    FeBackX = 0xC;
    FeBackY = 0x20;
    FeBackW = 0xA0;
    FeBackH = 0x80;
}

/* @0x8013AEE8 FE.CPP:750 */
void FeInitPlayer2ClassMenu(void)
{
    LoadedChar[1] = 0;
    if (MemCardActive)
        MemcardOFF();
    FePlayerClassMenuTable[1].MenuPtr = &FeNewP2NameMenu;
    FePlayerClassMenuTable[2].MenuPtr = &FeNewP2NameMenu;
    FePlayerClassMenuTable[3].MenuPtr = &FeNewP2NameMenu;
    FeAddTable(FePlayerClassMenuTable, 5);
    FeBackX = 0xC;
    FeBackY = 0x20;
    FeBackW = 0xA0;
    FeBackH = 0x80;
}

/* @0x8013AF6C FE.CPP:770 */
void FePlayerClassMenuCtrl(void)
{
    FeChrClass[FePlayerNo] = FeCurMenu->Sel - 1;
    FeMainKeyCtrl(NULL);
    FeDrawChrClass();
}

/* @0x8013AFB4 FE.CPP:778 */
void FeDrawChrClass(void)
{
    Dialog FeBack;
    RECT FeRect;
    char TempStr[4];

    strcpy(TempStr, " ");   /* builtin strcpy of a constant = the retail 2-byte lhu/sh copy (an initializer would bzero the tail) */

    switch (FeChrClass[FePlayerNo]) {
    case 0:
        FeTData->PrintFt4(0x6E, 0x24, 0x32, 0, 0xFF, 0);
        break;
    case 1:
        FeTData->PrintFt4(0x6C, 0x24, 0x32, 0, 0xFF, 0);
        break;
    case 2:
        FeTData->PrintFt4(0x6D, 0x24, 0x32, 0, 0xFF, 0);
        break;
    default:
        FeTData->PrintFt4(0x6B, 0x24, 0x32, 0, 0xFF, 0);
        break;
    }
    if (FeChrClass[FePlayerNo] != -1 && FeChrClass[FePlayerNo] != 3) {
        setRECT(&FeRect, 0xAC, 0x2B, 0x80, 0x80);
        MediumFont.Print(0, 0x12, FePlayerName[FePlayerNo], JustCentre, &FeRect, GOLDR, GOLDG, GOLDB);
        MediumFont.Print(0, 0x27, GetStr(0x245), JustLeft, &FeRect, WHITER, WHITEG, WHITEG);
        if (FeChrClass[FePlayerNo] != -1)
            sprintf(TempStr, "%i", 1);
        MediumFont.Print(0, 0x27, TempStr, JustRight, &FeRect, WHITER, WHITEG, WHITEG);
        MediumFont.Print(0, 0x34, GetStr(0x419), JustLeft, &FeRect, WHITER, WHITEG, WHITEG);
        if (FeChrClass[FePlayerNo] != -1)
            sprintf(TempStr, "%i", StrengthTbl[FeChrClass[FePlayerNo]]);
        MediumFont.Print(0, 0x34, TempStr, JustRight, &FeRect, WHITER, WHITEG, WHITEG);
        MediumFont.Print(0, 0x41, GetStr(0x26F), JustLeft, &FeRect, WHITER, WHITEG, WHITEG);
        if (FeChrClass[FePlayerNo] != -1)
            sprintf(TempStr, "%i", MagicTbl[FeChrClass[FePlayerNo]]);
        MediumFont.Print(0, 0x41, TempStr, JustRight, &FeRect, WHITER, WHITEG, WHITEG);
        MediumFont.Print(0, 0x4E, GetStr(0xFF), JustLeft, &FeRect, WHITER, WHITEG, WHITEG);
        if (FeChrClass[FePlayerNo] != -1)
            sprintf(TempStr, "%i", DexterityTbl[FeChrClass[FePlayerNo]]);
        MediumFont.Print(0, 0x4E, TempStr, JustRight, &FeRect, WHITER, WHITEG, WHITEG);
        MediumFont.Print(0, 0x5B, GetStr(0x4B7), JustLeft, &FeRect, WHITER, WHITEG, WHITEG);
        if (FeChrClass[FePlayerNo] != -1)
            sprintf(TempStr, "%i", VitalityTbl[FeChrClass[FePlayerNo]]);
        MediumFont.Print(0, 0x5B, TempStr, JustRight, &FeRect, WHITER, WHITEG, WHITEG);
    }
}

/* @0x8013B43C FE.CPP:918 */
void FeInitNewP1NameMenu(void)
{
    FeAddNameTable(FeNameEngMenuTable, 40);
    FeBackX = 0xC;
    FeBackY = 0x20;
    FeBackW = 0xA0;
    FeBackH = 0x80;
    plr[0]._pLevel = 1;
    plr[1]._pLevel = 1;
}

/* @0x8013B498 FE.CPP:932 */
void FeInitNewP2NameMenu(void)
{
    FeAddNameTable(FeNameEngMenuTable, 40);
    FeBackX = 0xC;
    FeBackY = 0x20;
    FeBackW = 0xA0;
    FeBackH = 0x80;
    plr[1]._pLevel = 1;
}

/* @0x8013B4EC FE.CPP:945 */
void FeNewNameMenuCtrl(void)
{
    if (qtextflag || CDWAIT || PauseMode)
        return;
    if (DavesPad & 4) {
        FeCurMenu->Sel--;
        if (FeCurMenu->Sel % 10 == 0)
            FeCurMenu->Sel += 10;
        PlaySFX(0x32);
    }
    if (DavesPad & 8) {
        FeCurMenu->Sel++;
        if (FeCurMenu->Sel % 10 == 1)
            FeCurMenu->Sel -= 10;
        PlaySFX(0x32);
    }
    if (DavesPad & 1) {
        FeCurMenu->Sel -= 10;
        if (FeCurMenu->Sel <= 0)
            FeCurMenu->Sel += 40;
        PlaySFX(0x32);
    }
    if (DavesPad & 2) {
        FeCurMenu->Sel += 10;
        if (FeCurMenu->Sel > 40)
            FeCurMenu->Sel -= 40;
        PlaySFX(0x32);
    }
    if (DavesPad & 0x100) {
        FePrevMenu();
    } else {
        if (DavesPad & 0x10) {
            if (strlen(FePlayerName[FePlayerNo]) == 0) {
                PlaySFX(0x3D3);
            } else {
                PlaySFX(0x33);
                if (FeNoOfPlayers > 0) {
                    FeNoOfPlayers--;
                    FePlayerNo++;
                    FeNewMenu(&FeNewP2ClassMenu);
                } else {
                    FeNewMenu(&FeDifficultyMenu);
                }
            }
        }
        if (DavesPad & 0x40) {
            if (FeBuffer[FeCurMenu->Sel].Str == 0x107B || FeBuffer[FeCurMenu->Sel].Str == 0x107D) {
                if (strlen(FePlayerName[FePlayerNo]) != 0)
                    PlaySFX(0x33);
                else
                    PlaySFX(0x3D3);
            } else {
                if (strlen(FePlayerName[FePlayerNo]) < 10)
                    PlaySFX(0x33);
                else
                    PlaySFX(0x3D3);
            }
            if (FeBuffer[FeCurMenu->Sel].Str == 0x107B) {
                if (FePlayerNameFlag[FePlayerNo]) {
                    FePlayerName[FePlayerNo][0] = 0;
                    FePlayerNameFlag[FePlayerNo] = 0;
                }
                if (strlen(FePlayerName[FePlayerNo]) != 0)
                    FePlayerName[FePlayerNo][strlen(FePlayerName[FePlayerNo]) - 1] = 0;
            } else if (FeBuffer[FeCurMenu->Sel].Str == 0x107D) {
                if (strlen(FePlayerName[FePlayerNo]) != 0) {
                    if (FeNoOfPlayers > 0) {
                        FeNoOfPlayers--;
                        FePlayerNo++;
                        FeNewMenu(&FeNewP2ClassMenu);
                    } else {
                        FeNewMenu(&FeDifficultyMenu);
                    }
                }
            } else {
                if (FePlayerNameFlag[FePlayerNo]) {
                    FePlayerName[FePlayerNo][0] = 0;
                    FePlayerNameFlag[FePlayerNo] = 0;
                }
                if (strlen(FePlayerName[FePlayerNo]) < 10) {
                    if (FeBuffer[FeCurMenu->Sel].Str == 0x105E) {
                        strcat(FePlayerName[FePlayerNo], " ");
                    } else {
                        char asd[2];
                        asd[1] = 0;
                        asd[0] = FeBuffer[FeCurMenu->Sel].Str;
                        strcat(FePlayerName[FePlayerNo], asd);
                        PlaySFX(0x33);
                    }
                } else {
                    PlaySFX(0x3D3);
                }
            }
        }
    }
    FeDrawChrClass();
}

/* @0x8013BAB4 FE.CPP:1081 */
void FeCopyPlayerInfoForReturn(void)
{
    CStruct->NumOfPlayers = FePlayerNo + 1;
    for (int Loop = 0; Loop <= FePlayerNo; Loop++) {
        if (!LoadedChar[Loop]) {
            CStruct->Plrs[Loop].Class = FeChrClass[Loop];
            strcpy(CStruct->Plrs[Loop].Name, FePlayerName[Loop]);
            CPad *Pad = PAD_GetPad(Loop, 0);   /* dead result: no SYM record; the decl keeps retail's zero-length then-block level */
        } else {
            int i;
            for (i = 0; i < 17; i++)
                plr[Loop]._pLvlVisited[i] = 0;
            for (i = 0; i < 10; i++)
                plr[Loop]._pSLvlVisited[i] = 0;
        }
    }
}

/* @0x8013BBC8 FE.CPP:1113 */
void FeEnterGame(void)
{
    FeFlag = 2;
    FeCopyPlayerInfoForReturn();
}

/* @0x8013BBF0 FE.CPP:1134 */
void FeInitLoadMemcardSelect(void)
{
    fileinfoflag = 0;
    if (!MemCardActive)
        cardondelay = 5;
    card_active[0] = card_active[1] = 1;
    FeBackX = 8;
    FeBackY = 0x20;
    FeBackW = 0x140;
    FeBackH = 0xA0;
    FeAddTable(FeMemcardMenuTable, 3);
}

/* @0x8013BC70 FE.CPP:1153 */
void FeInitLoadChar1Menu(void)
{
    FeAddEntry(0, 0, JustCentre, 0x3B2, NULL, &MediumFont);
    current_card = 0;
    ActivateMemcard(1, 0);
    CharacterBlockLoaded = 0;
    fileinfoflag = 1;
    fileselect = 0;
}

/* @0x8013BCD8 FE.CPP:1165 */
void FeInitLoadChar2Menu(void)
{
    FeAddEntry(0, 0, JustCentre, 0x3B2, NULL, &MediumFont);
    current_card = 1;
    ActivateMemcard(0, 1);
    CharacterBlockLoaded = 0;
    fileinfoflag = 1;
    fileselect = 0;
}

/* @0x8013BD48 FE.CPP:1190 */
void FeInitDifficultyMenu(void)
{
    int MaxLevel;

    FeAddTable(FeDifficultyMenuTable, 4);
    MaxLevel = plr[0]._pLevel;
    if (FePlayerNo && plr[1]._pLevel < MaxLevel)
        MaxLevel = plr[1]._pLevel;
    FeCurMenu->Sel = 1;
    if (MaxLevel < 20)
        FeBufferCount = 2;
    else if (MaxLevel < 30)
        FeBufferCount = 3;
    else
        FeBufferCount = 4;
    FeBackX = 0xC;
    FeBackY = 0x20;
    FeBackW = 0xA0;
    FeBackH = 0x80;
}

/* @0x8013BDEC FE.CPP:1218 */
void FeDifficultyMenuCtrl(void)
{
    if (!qtextflag && !CDWAIT && !PauseMode) {
        gnDifficulty = FeCurMenu->Sel - 1;
        if (DavesPad & 1)
            FeSelUp(1);
        if (DavesPad & 2)
            FeSelDown(1);
        if (DavesPad & 0x50) {
            PlaySFX(0x33);
            FeEnterGame();
        } else if (DavesPad & 0x100) {
            FePrevMenu();
        }
        FeDrawChrClass();
    }
}

/* @0x8013BED0 FE.CPP:1277 */
void FeInitBackgroundMenu(void)
{
    FeAddTable(FeBackgroundMenuTable, 4);
    FeBackX = 8;
    FeBackY = 0x20;
    FeBackW = 0x140;
    FeBackH = 0x80;
    BookMenu = 0;
}

/* @0x8013BF1C FE.CPP:1287 */
void FeInitBook1Menu(void)
{
    FeAddTable(FeBook1MenuTable, 5);
    FeBackX = 8;
    FeBackY = 0x20;
    FeBackW = 0x140;
    FeBackH = 0x80;
    BookMenu = 1;
}

/* @0x8013BF6C FE.CPP:1297 */
void FeInitBook2Menu(void)
{
    FeAddTable(FeBook2MenuTable, 6);
    FeBackX = 8;
    FeBackY = 0x20;
    FeBackW = 0x140;
    FeBackH = 0x80;
    BookMenu = 2;
}

/* @0x8013BFBC FE.CPP:1308 */
void FeBackBookMenuCtrl(void)
{
    if (!qtextflag && !CDWAIT && !PauseMode) {
        if (DavesPad & 1)
            FeSelUp(1);
        if (DavesPad & 2)
            FeSelDown(1);
        if (DavesPad & 0x50) {
            PlaySFX(0x33);
            if (BookMenu == 0 && FeCurMenu->Sel == 3)
                InitQTextMsg(0x10A);
            if (BookMenu == 1) {
                if (FeCurMenu->Sel == 1)
                    InitQTextMsg(0x108);
                if (FeCurMenu->Sel == 2)
                    InitQTextMsg(0x10C);
                if (FeCurMenu->Sel == 3)
                    InitQTextMsg(0x106);
                if (FeCurMenu->Sel == 4)
                    InitQTextMsg(0x104);
            }
            if (BookMenu == 2) {
                if (FeCurMenu->Sel == 1)
                    InitQTextMsg(0x109);
                if (FeCurMenu->Sel == 2)
                    InitQTextMsg(0x103);
                if (FeCurMenu->Sel == 3)
                    InitQTextMsg(0x105);
                if (FeCurMenu->Sel == 4)
                    InitQTextMsg(0x107);
                if (FeCurMenu->Sel == 5)
                    InitQTextMsg(0x10B);
            }
        }
        if (DavesPad & 0x100)
            FePrevMenu();
    }
}

/* @0x8013C200 FE.CPP:1355 */
void PlayDemo(void)
{
    PlayDemoFlag = 1;
}

/* @0x8013C214 FE.CPP:1371 */
void FadeFEOut(void)
{
    music_fade();
    if (PaletteFadeOut(8)) {
        for (;;) {
            if (GetFadeState() == 0)
                break;
            if (fadeval) {
                if (FeCurMenu == &FeDifficultyMenu || FeCurMenu == &FeNewP1ClassMenu || FeCurMenu == &FeNewP2ClassMenu)
                    FeDrawChrClass();
                FeDrawBuffer();
            }
            TSK_Sleep(1);
        }
    }
    music_stop();
}

/* @0x8013C2D8 FE.CPP:1420 */
void DrawBackTSK(TASK *T)
{
    DrawBackOn = 1;
    TakeDownCutScreen();
    music_start(5);
    flamecol = 0;
    while (DrawBackOn) {
        if (flamecol < 64)
            flamecol += 2;
        if (!InCredits) {
            if (!JustInCredits)
                DrawFlameLogo();
            CutScr.Display(0x12, 0xB, 0, fadeval);
        }
        if (JustInCredits && !CDWAIT)
            JustInCredits = 0;
        if (InCredits == 1) {
            JustInCredits = 1;
            InCredits = 0;
            CutScr.Unload();
            CDWAIT = 1;
            CutScr.Load(0x12, 0xB, 0);
            CDWAIT = 0;
        }
        TSK_Sleep(1);
        TitleFlag = 0;
    }
    GM_FinishedUsing(FeTData);
    GM_FinishedUsing(FlameTData);
    FeTData = NULL;
    FlameTData = NULL;
    CutScr.Unload();
}

/* @0x8013C460 FE.CPP:1484 */
void FeInitMainStuff(TASK *T2)
{
    PutUpCutScreen(10);
    SPU_Init();
    snd_init(0);
    SND_LoadBank(0x11);
    if (!FlameTData)
        FlameTData = GM_UseTexData(0xCC);
    if (!FeTData)
        FeTData = GM_UseTexData(0xCB);
    if (!T2) {
        FinishProgress();
        TSK_AddTask(0, (void (*)())DrawBackTSK, 0x800, 0);
        TSK_Sleep(1);
    }
}

/* @0x8013C50C FE.CPP:1516 */
void FrontEndTask(TASK *T)
{
    int len;
    int Fefadeval = 0;
    TASK *T2 = NULL;

    fadeval = 0;
    if (FeAttractMode) {
        FinishBootProgress();
        if (ADirtyFlagThatGaryWillLove) {
            if (DirtyVidx || DirtyVidY)
                VID_SetXYOff(DirtyVidx, DirtyVidY);
            ADirtyFlagThatGaryWillLove = 0;
        }
    } else {
        FeInitMainStuff(T2);
        FeAttractMode = 1;
        AttractNo = 6;
    }
    FeCount = VID_GetTick();
    FeNewMenu(&FeMainMenu);
    FeNoOfPlayers = -1;
    while (FeFlag != 2) {
        if (PlayDemoFlag)
            FeFlag = 2;
        ReadPad(-1);
        if (FeAttractMode) {
            if (!PlayDemoFlag) {
                switch (AttractNo) {
                case 0:
                    AttractNo++;
                    FadeFEOut();
                    DrawBackOn = 0;
                    while (GetFadeState())
                        TSK_Sleep(1);
                    fadeval = 0;
                    user_start = 0;
                    Fefadeval = 0;
                    break;
                case 1:
                    if (!user_start)
                        play_movie("EACLOGO.MOV");
                    AttractNo++;
                    break;
                case 2:
                    AttractNo++;
                    break;
                case 3:
                    AttractNo++;
                    break;
                case 4:
                    FeInitMainStuff(T2);
                    FeCount = VID_GetTick();
                    AttractNo++;
                    break;
                case 5:
                    if (!CDWAIT && !IsGameLoading()) {
                        len = MediumFont.GetStrWidth(GetStr(0x32E));
                        MediumFont.Print((256 - len) / 2 + 32, 32, GetStr(0x32E), JustLeft, NULL, WHITER, WHITEG, WHITEB);
                        if (DavesPad)
                            FeCount = VID_GetTick();
                        if (DavesPad & 0x10) {
                            PlaySFX(0x33);
                            Fefadeval = 0;
                            fadeval = 0;
                            AttractNo++;
                        } else if (VID_GetTick() - FeCount > AttractTitleDelay) {
                            FMVEndPad = -1;
                            user_start = 0;
                            AttractNo = 0;
                            AttractTitleDelay = 0x708;
                        }
                    }
                    break;
                case 6:
                    FeAttractMode = 0;
                    AttractNo = 0;
                    FMVEndPad = -1;
                    FeCount = VID_GetTick();
                    break;
                }
            }
        } else {
            if (Fefadeval >= 19) {
                FeDrawBuffer();
                if (FeCurMenu->CtrlFuncPtr == NULL)
                    FeMainKeyCtrl(NULL);
                else
                    FeCurMenu->CtrlFuncPtr();
            }
            if (FeCurMenu == &FeMainMenu) {
                if (DavesPad)
                    FeCount = VID_GetTick();
                else if (VID_GetTick() - FeCount > AttractMainDelay) {
                    AttractNo = 0;
                    FeAttractMode = 1;
                }
            }
            if (fadeval < 15) {
                fadeval++;
                Fefadeval = fadeval;
            } else if (Fefadeval < 31) {
                Fefadeval++;
            }
        }
        TSK_Sleep(1);
    }
    FadeFEOut();
    DrawBackOn = 0;
    TSK_Sleep(1);
    FeFlag = 0;
    if (!PlayDemoFlag) {
        AttractNo = 1;
        FeAttractMode = 0;
    }
}

/* @0x8013C9B8 FE.CPP:1723 */
void DrawFeTwinkle(int TwinkX, int TwinkY)
{
    DrawSpinner(TwinkX, TwinkY, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, 0xFFFF, 1, 0, 8);
    DrawSpinner(TwinkX, TwinkY, 0xA0, 0xA0, 0x40, 0x15, 0x30, 0x28, 1, 0xFFFF, 1, 0, 8);
}
