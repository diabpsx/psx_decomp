/* DLG.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC, FRONTEND overlay).  The memory-card
 * load/save dialogs (game file, character slots, alert box, slot-name builders) and the PSX flavour of
 * PC PACKPLR.CPP (PkPlayerStruct/PkItemStruct pack/unpack, VerifyGoldSeeds).  Header inlines (CPad
 * getters/setters, Dialog ctor/dtor/SetRGB/SetBack/SetBorder, CBlocks::GetOverlayOtBase) are emitted
 * out of line in this object (-fno-inline).
 * The oracle's two splat "functions" dlg/func_80143604 and dlg_1/func_801436A0 are this TU's rodata
 * (the three BISLPS file-name literals; the Classes[] initialiser template + sprintf formats), not code. */
#include "psxsrc/dlg.h"

/* ---- TU-owned globals (SYM EXT; %gp_rel in this oracle -> defined here) ---- */
extern int AlertTxt, StatusTxt, current_card, LoadType, McMenuPos;
extern FeTable *McCurMenu;
char *DiabloGameFile = "BISLPS-01416-DIAB-01";
char *DiabloOptionFile = "BISLPS-01416-DIAB-69";
char *DiabloCharacterFile = "BISLPS-01416-DIAB-88";
char *McState[2] = { "", "" };
BOOL fileinfoflag = 0;

/* @0x80159590 DLG.CPP:188 */
int GetFileNumber(int side, char *file_name)
{
    int i;

    if (!card_usable[side])
        return -1;
    for (i = 0; i < card_files[side]; i++) {
        if (!strcmp(card_dir[side][i].name, file_name))
            return i;
    }
    return -1;
}

/* @0x80159650 DLG.CPP:206 */
int DoSaveOptions(void)
{
    return PSX_OPT_SaveGame(current_card, DiabloOptionFile);
}

/* @0x80159678 DLG.CPP:214 */
int DoSaveGame(void)
{
    char temp_name[32];
    char *Classes[3] = { "WAR", "ROG", "SOR" };

    if (!FePlayerNo)
        sprintf(temp_name, "%s-1%s %s%2d %s %s", GetDiabloStr(), GetStr(0x292), GetStr(0x290), plr[0]._pLevel, Classes[plr[0]._pClass], plr[0]._pName);
    else
        sprintf(temp_name, "%s-2%s %s%2d %s-%s%2d %s", GetDiabloStr(), GetStr(0x292), GetStr(0x290), plr[0]._pLevel, Classes[plr[0]._pClass], GetStr(0x290), plr[1]._pLevel, Classes[plr[1]._pClass]);
    return PSX_GM_SaveGame(current_card, DiabloGameFile, temp_name);
}

/* @0x801597F0 DLG.CPP:258 */
void DoLoadGame(void)
{
    DoLoadedGame = 0;
    if (GetLoadStatusMessage(DiabloGameFile)) {
        if (int result = PSX_GM_LoadGame(1, current_card, GetFileNumber(current_card, DiabloGameFile))) {
            if (result == -2)
                AlertTxt = 0x25C;
            else
                AlertTxt = 0x25D;
            DoLoadedGame = 0;
        } else {
            AlertTxt = 0;
            MemcardOFF();
            DoLoadedGame = 1;
            FeFlag = 2;
        }
    }
}

/* @0x80159894 DLG.CPP:286 */
int DoFrontEndLoadCharacter(int slot)
{
    int result = -1;

    if (BOOL ok = GetLoadStatusMessage(DiabloCharacterFile)) {
        PSX_CH_LoadGame(slot);
        result = 0;
    }
    MemcardOFF();
    return result;
}

/* @0x801598EC DLG.CPP:303 */
void McInitLoadCard1Menu(void)
{
    current_card = 0;
    if (LoadType == 1) {
        loadflag = 4;
    } else {
        DoLoadedChar = 1;
        FeFlag = 2;
    }
}

/* @0x8015992C DLG.CPP:318 */
void McInitLoadCard2Menu(void)
{
    current_card = 1;
    if (LoadType == 1) {
        loadflag = 4;
    } else {
        DoLoadedChar = 1;
        FeFlag = 2;
    }
}

/* @0x8015996C DLG.CPP:333 */
void ChooseCardLoad(void)
{
    fileinfoflag = 1;
    FeAddEntry(0, 0, JustCentre, 0x3B7, NULL, &LargeFont);
    FeAddEntry(0, 0xC, JustCentre, 0x288, &McLoadCard1Menu, &MediumFont);
    FeAddEntry(0, 0x30, JustCentre, 0x289, &McLoadCard2Menu, &MediumFont);
}

/* @0x80159A08 DLG.CPP:344 */
void McInitLoadGameMenu(void)
{
    FeBackX = 0x20;
    FeBackY = 0x40;
    FeBackW = 0x100;
    FeBackH = 0x70;
    fileinfoflag = 0;
    loadflag = 0;
    LoadType = 1;
    ChooseCardLoad();
}

/* @0x80159A6C DLG.CPP:366 */
void McMainKeyCtrl(void)
{
    RECT um;

    um.w = 0x140;
    um.h = 0xA0;
    um.x = -8;
    um.y = 0x20;
    if (cardondelay > 0) {
        cardondelay--;
        ShowLoadingBox(0x348);
        if (cardondelay)
            return;
        ActivateMemcard(1, 1);
    }
    if (loadflag) {
        loadflag--;
        if (!loadflag) {
            DoLoadGame();
            if (AlertTxt)
                FePrevMenu();
        } else {
            ShowLoadingBox(card_side_load[current_card]);
        }
        return;
    }
    if (AlertTxt) {
        ShowAlertBox();
        if (DavesPad & 0x40) {
            PlaySFX(0x33);
            AlertTxt = 0;
        }
        return;
    }
    ShowCardActionText();
    if (fileinfoflag)
        ShowGameFiles(DiabloGameFile, 0, 0x12, um, 0xC);
    if (DavesPad & 1)
        FeSelUp(1);
    if (DavesPad & 2)
        FeSelDown(1);
    if (DavesPad & 0x40) {
        McMenuPos = FeGetCursor() - 1;
        if (card_status[McMenuPos] == 2) {
            AlertTxt = card_side_empty[McMenuPos];
            PlaySFX(0x3D3);
            return;
        }
        if (!card_usable[McMenuPos]) {
            AlertTxt = 0x509;
            PlaySFX(0x3D3);
            return;
        }
        if (GetFileNumber(McMenuPos, DiabloGameFile) == -1) {
            AlertTxt = card_side_nogame[McMenuPos];
            PlaySFX(0x3D3);
            return;
        }
        FeSelect();
    }
    if (DavesPad & 0x100)
        FePrevMenu();
}

/* @0x80159D08 DLG.CPP:490 */
void McCharCardMenuCtrl(void)
{
    CPad *P = PAD_GetPad(FePlayerNo, 0);

    if (cardondelay > 0) {
        cardondelay--;
        ShowLoadingBox(0x348);
        if (cardondelay)
            return;
        ActivateMemcard(1, 1);
    }
    if (AlertTxt) {
        ShowAlertBox();
        if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
            PlaySFX(0x33);
            AlertTxt = 0;
        }
        return;
    }
    ShowCardActionText();
    P->SetPadTick(0xC);
    P->SetPadTickMask(3);
    if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
        if (card_status[FeGetCursor() - 1] == 2) {
            PlaySFX(0x3D3);
            AlertTxt = card_side_empty[FeGetCursor() - 1];
            return;
        }
        if (!card_usable[FeGetCursor() - 1]) {
            PlaySFX(0x3D3);
            AlertTxt = 0x509;
            return;
        }
        countdownloadcharblock = 1;
        cardondelay = 5;
        FeSelect();
    } else if (P->GetTick() & 1) {
        FeSelUp(1);
    } else if (P->GetTick() & 2) {
        FeSelDown(1);
    } else if (P->GetDown() & 0x100) {
        FePrevMenu();
    }
}

/* @0x80159F50 DLG.CPP:550 */
void McMainCharKeyCtrl(void)
{
    int Spacing;
    int yoff;
    int SelX;
    int len;
    RECT um;
    CPad *P;

    um.w = 0x140;
    um.h = 0xA0;
    um.x = 0;
    um.y = 0x20;
    P = PAD_GetPad(FePlayerNo, 0);
    P->SetPadTick(0xC);
    P->SetPadTickMask(3);
    Spacing = 0x11;
    yoff = 0x4A;
    if (cardondelay > 0) {
        cardondelay--;
        if (countdownloadcharblock)
            ShowLoadingBox(card_side_read[current_card]);
        else
            ShowLoadingBox(0x348);
        return;
    }
    if (countdownloadcharblock)
        ActivateCharacterMemcard(current_card == 0, current_card == 1);
    if (card_status[current_card] == 2)
        AlertTxt = card_side_empty[current_card];
    if (AlertTxt) {
        ShowAlertBox();
        if (P->GetDown() & 0x40) {
            AlertTxt = 0;
            FePrevMenu();
        }
        return;
    }
    ShowCardActionText();
    if (fileinfoflag && !card_status[current_card]) {
        ShowCharacterFiles(fileselect, Spacing, um, yoff);
        len = GetSpinnerWidth(fileselect);
        SelX = 0xA0 - len / 2;
        DrawFeTwinkle(SelX - 14, fileselect * Spacing + yoff);
        DrawFeTwinkle(SelX + 6 + len, fileselect * Spacing + yoff);
    }
    if (P->GetTick() & 1) {
        fileselect--;
        if (fileselect == -1)
            fileselect = 5;
        PlaySFX(0x32);
    }
    if (P->GetTick() & 2) {
        fileselect++;
        if (fileselect >= 6)
            fileselect = 0;
        PlaySFX(0x32);
    }
    if ((P->GetDown() & 0x40) || (P->GetDown() & 0x10)) {
        if (card_status[current_card] == 2 || !CharacterBlockLoaded || !CharDataStruct.CharSlots[fileselect].pName[0]) {
            PlaySFX(0x3D3);
            return;
        }
        PlaySFX(0x33);
        if (GetLoadStatusMessage(DiabloCharacterFile)) {
            if (DoFrontEndLoadCharacter(fileselect)) {
                AlertTxt = 0x25D;
            } else {
                DoLoadedChar = 1;
                LoadedChar[FePlayerNo] = 1;
                if (FeNoOfPlayers > 0) {
                    FePlayerNo++;
                    FeNoOfPlayers--;
                    FeNewMenu(&FeNewP2ClassMenu);
                } else {
                    FeNewMenu(&FeDifficultyMenu);
                }
            }
        }
    }
    if (P->GetDown() & 0x100) {
        CharacterBlockLoaded = 0;
        FePrevMenu();
    }
}

/* @0x8015A3BC DLG.CPP:706 */
void ShowAlertBox(void)
{
    Dialog SBack;
    RECT um;
    int W = 0xE4;
    int H = 0x3A;
    int X = 0x2E;
    int Y = 0x5B;
    int otpos;
    int oldBot;
    int oldTot;
    int lines;
    int yprintpos;

    setRECT(&um, X, Y, W, H);
    otpos = CBlocks::GetOverlayOtBase() + 8;
    oldBot = SBack.SetOTpos(otpos);
    oldTot = MediumFont.SetOTpos(otpos);
    SBack.SetOTpos(otpos);
    MediumFont.SetOTpos(otpos);
    SBack.SetBorder(0x12);
    SBack.SetBack(5);
    SBack.SetRGB(0x50, 0x40, 0x40);
    SBack.Back(X, Y, W, H);
    if (AlertTxt != 0x50C)
        strcpy(AlertStr, GetStr(AlertTxt));
    lines = MediumFont.GetStrWidth(AlertStr) / W + 1;
    yprintpos = (H - lines * 12) / 2 + 3;
    MediumFont.Print(0, yprintpos, AlertStr, JustCentre, &um, WHITER, WHITEG, WHITEG);
    MediumFont.Print(0, yprintpos + lines * 13, GetStr(0x330), JustCentre, &um, WHITER, WHITEG, WHITEG);
    SBack.SetOTpos(oldBot);
    MediumFont.SetOTpos(oldTot);
}

/* @0x8015A5C8 DLG.CPP:751 */
BOOL GetLoadStatusMessage(char *file_name)
{
    if (card_status[current_card] == 2 || card_dirty[current_card]) {
        AlertTxt = card_side_empty[current_card];
        return false;
    }
    if (!card_usable[current_card]) {
        AlertTxt = 0x509;
        return false;
    }
    if (GetFileNumber(current_card, file_name) == -1) {
        AlertTxt = 0x2BE;
        return false;
    }
    AlertTxt = 0;
    return true;
}

/* @0x8015A67C DLG.CPP:773 */
BOOL GetSaveStatusMessage(int fileblocks, char *file_name)
{
    int i;
    int blocks = 0;

    if (card_status[current_card] == 2) {
        AlertTxt = card_side_empty[current_card];
        return false;
    }
    if (!card_usable[current_card])
        return true;
    for (i = 0; i < card_files[current_card]; i++)
        blocks += card_header[current_card][i].blockentry;
    if (15 - blocks < fileblocks) {
        if (GetFileNumber(current_card, file_name) == -1) {
            AlertTxt = 0x50C;
            sprintf(AlertStr, GetStr(0x50C), fileblocks, 15 - blocks);
            return false;
        }
    }
    return true;
}

/* @0x8015A79C DLG.CPP:808 */
void ShowGameFiles(char *filename, int saveflag, int Spacing, RECT ORect, int yoff)
{
    if (saveflag || StatusTxt)
        return;
    for (int i = 0; i < 2; i++) {
        int FileNo = GetFileNumber(i, filename);
        if (card_status[i] == 2 || card_dirty[i])
            McState[i] = GetStr(0x50D);
        else if (FileNo != -1)
            McState[i] = ReconstructSlotName(i, FileNo);
        else if (card_usable[i])
            McState[i] = GetStr(0x12C);
        else
            McState[i] = GetStr(0x509);
        MediumFont.Print(0, (i * 2 + 3) * Spacing + yoff, McState[i], JustCentre, &ORect, 0xA4, 0x70, 0x70);
    }
}

/* @0x8015A90C DLG.CPP:835 */
void ShowCharacterFiles(int cs, int Spacing, RECT ORect, int yoff)
{
    int sn;

    if (card_status[current_card] == 3)
        return;
    sn = 0x289;
    if (!current_card)
        sn = 0x288;
    MediumFont.Print(0, yoff - Spacing, GetStr(sn), JustCentre, NULL, GOLDR, GOLDG, GOLDB);
    for (int j = 0; j < 6; j++) {
        int fileno = GetFileNumber(current_card, DiabloCharacterFile);
        int r;
        int g;
        int b;
        char TempStr[64];
        if (j == cs) {
            r = GOLDR;
            g = GOLDG;
            b = GOLDB;
        } else if (fileno != -1) {
            r = WHITER;
            g = WHITEG;
            b = WHITEB;
        } else {
            r = (unsigned char)(WHITER >> 1);
            g = (unsigned char)(WHITEG >> 1);
            b = (unsigned char)(WHITEB >> 1);
        }
        ConstructSlotName(TempStr, j);
        MediumFont.Print(0, yoff + j * Spacing, TempStr, JustCentre, NULL, r, g, b);
    }
}

/* @0x8015AAEC DLG.CPP:897 */
static void PackItem(PkItemStruct *id, const ItemStruct *is)
{
    if (is->_itype == -1) {
        id->idx = 0xFFFF;
    } else {
        id->idx = is->IDidx;
        id->iSeed = is->_iSeed;
        id->iCreateInfo = is->_iCreateInfo;
        id->bId = is->_iIdentified + (is->_iMagical << 1);
        id->bDur = is->_iDurability;
        id->bMDur = is->_iMaxDur;
        id->bCh = is->_iCharges;
        id->bMCh = is->_iMaxCharges;
        id->dwBuff = is->_PlrCreate;
        if (is->IDidx == 0)
            id->wValue = is->_ivalue;
        else
            id->wValue = is->_iMaxDam | (is->_iAC << 8);
    }
}

/* @0x8015AB98 DLG.CPP:929 */
void PackPlayer(PkPlayerStruct *pPack, int pnum)
{
    int i;
    PkItemStruct *pki;
    const ItemStruct *pi;
    const PlayerStruct *pPlayer = &plr[pnum];

    memset(pPack, 0, sizeof(*pPack));
    pPack->destAction = pPlayer->destAction;
    pPack->destParam1 = pPlayer->destParam1;
    pPack->destParam2 = pPlayer->destParam2;
    pPack->plrlevel = pPlayer->plrlevel;
    strcpy(pPack->pName, pPlayer->_pName);
    pPack->pClass = pPlayer->_pClass;
    pPack->pBaseStr = pPlayer->_pBaseStr;
    pPack->pBaseMag = pPlayer->_pBaseMag;
    pPack->pBaseDex = pPlayer->_pBaseDex;
    pPack->pBaseVit = pPlayer->_pBaseVit;
    pPack->pLevel = pPlayer->_pLevel;
    pPack->pStatPts = pPlayer->_pStatPts;
    pPack->DeadLevel = pPlayer->DeadLevel;
    pPack->pExperience = pPlayer->_pExperience;
    pPack->pHPBase = pPlayer->_pHPBase;
    pPack->pMaxHPBase = pPlayer->_pMaxHPBase;
    pPack->pManaBase = pPlayer->_pManaBase;
    pPack->pMaxManaBase = pPlayer->_pMaxManaBase;
    pPack->pMemSpells = pPlayer->_pMemSpells;
    pPack->pRSpell = pPlayer->_pRSpell;
    pPack->pRSplType = pPlayer->_pRSplType;
    for (i = 0; i < 37; i++)
        pPack->pSplLvl[i] = pPlayer->_pSplLvl[i];
    pki = &pPack->InvBody[0];
    pi = &pPlayer->InvBody[0];
    for (i = 7; i--; pki++, pi++)
        PackItem(pki, pi);
    pki = &pPack->InvList[0];
    pi = &pPlayer->InvList[0];
    for (i = 40; i--; pki++, pi++)
        PackItem(pki, pi);
    for (i = 0; i < 40; i++)
        pPack->InvGrid[i] = pPlayer->InvGrid[i];
    pPack->_pNumInv = pPlayer->_pNumInv;
    pki = &pPack->SpdList[0];
    pi = &pPlayer->SpdList[0];
    for (i = 8; i--; pki++, pi++)
        PackItem(pki, pi);
}

/* @0x8015ADAC DLG.CPP:996 */
static void UnPackItem(const PkItemStruct *is, ItemStruct *id)
{
    char AC;

    if (is->idx == 0xFFFF) {
        id->_itype = -1;
    } else {
        RecreateItem(0x7F, is->idx, is->iCreateInfo, is->iSeed, is->wValue, is->dwBuff);
        item[0x7F]._iMagical = is->bId >> 1;
        item[0x7F]._iIdentified = is->bId & 1;
        item[0x7F]._iDurability = is->bDur;
        item[0x7F]._iMaxDur = is->bMDur;
        item[0x7F]._iCharges = is->bCh;
        item[0x7F]._iMaxCharges = is->bMCh;
        if (is->idx) {
            AC = is->wValue >> 8;
            item[0x7F]._iAC = AC;
            item[0x7F]._iMaxDam = is->wValue % 256;
        }
        *id = item[0x7F];
    }
}

/* @0x8015AEE0 DLG.CPP:1035 */
void VerifyGoldSeeds(PlayerStruct *pPlayer)
{
    int i, j;

    for (i = 0; i < pPlayer->_pNumInv; i++) {
        if (pPlayer->InvList[i].IDidx == 0) {
            for (j = 0; j < pPlayer->_pNumInv; j++) {
                if (i != j && pPlayer->InvList[j].IDidx == 0 && pPlayer->InvList[i]._iSeed == pPlayer->InvList[j]._iSeed) {
                    pPlayer->InvList[i]._iSeed = GetRndSeed();
                    j = -1;
                }
            }
        }
    }
}

/* @0x8015AFB8 DLG.CPP:1057 */
void UnPackPlayer(const PkPlayerStruct *pPack, int pnum, unsigned char killok)
{
    ItemStruct *pi;
    const PkItemStruct *pki;
    PlayerStruct *pPlayer = &plr[pnum];
    int i;

    pPlayer->plrlevel = pPack->plrlevel;
    ClrPlrPath(pnum);
    pPlayer->destAction = -1;
    strcpy(pPlayer->_pName, pPack->pName);
    pPlayer->_pClass = pPack->pClass;
    InitPlayer(pnum, 1);
    pPlayer->_pBaseStr = pPack->pBaseStr;
    pPlayer->_pStrength = pPack->pBaseStr;
    pPlayer->_pBaseMag = pPack->pBaseMag;
    pPlayer->_pMagic = pPack->pBaseMag;
    pPlayer->_pBaseDex = pPack->pBaseDex;
    pPlayer->_pDexterity = pPack->pBaseDex;
    pPlayer->_pBaseVit = pPack->pBaseVit;
    pPlayer->_pVitality = pPack->pBaseVit;
    pPlayer->_pLevel = pPack->pLevel;
    pPlayer->_pStatPts = pPack->pStatPts;
    pPlayer->DeadLevel = pPack->DeadLevel;
    pPlayer->_pExperience = pPack->pExperience;
    pPlayer->_pNextExper = ExpLvlsTbl[pPlayer->_pLevel];
    pPlayer->_pMaxHPBase = pPack->pMaxHPBase;
    pPlayer->_pHPBase = pPack->pHPBase;
    if (!killok && (pPack->pHPBase >> 6) < 1)
        pPlayer->_pHPBase = 1 << 6;
    pPlayer->_pMaxManaBase = pPack->pMaxManaBase;
    pPlayer->_pManaBase = pPack->pManaBase;
    pPlayer->_pMemSpells = pPack->pMemSpells;
    pPlayer->_pRSpell = pPack->pRSpell;
    pPlayer->_pRSplType = pPack->pRSplType;
    for (i = 0; i < 37; i++)
        pPlayer->_pSplLvl[i] = pPack->pSplLvl[i];
    pki = &pPack->InvBody[0];
    pi = &pPlayer->InvBody[0];
    for (i = 7; i--; pki++, pi++)
        UnPackItem(pki, pi);
    pki = &pPack->InvList[0];
    pi = &pPlayer->InvList[0];
    for (i = 40; i--; pki++, pi++)
        UnPackItem(pki, pi);
    for (i = 0; i < 40; i++)
        pPlayer->InvGrid[i] = pPack->InvGrid[i];
    pPlayer->_pNumInv = pPack->_pNumInv;
    VerifyGoldSeeds(pPlayer);
    pki = &pPack->SpdList[0];
    pi = &pPlayer->SpdList[0];
    for (i = 8; i--; pki++, pi++)
        UnPackItem(pki, pi);
    if (pnum == myplr) {
        for (i = 0; i < 20; i++)
            _witchitem[StorePlrNo][i]._itype = -1;
    }
    CalcPlrInv(pnum, 0);
    pPlayer->pTownWarps = 0;
    pPlayer->pDungMsgs = 0;
    pPlayer->pLvlLoad = 0;
}

/* @0x8015B284 DLG.CPP:1148 */
void ConstructSlotName(char *TempStr, int slot)
{
    if (!CharDataStruct.CharSlots[slot].pName[0])
        sprintf(TempStr, "%d. %s", slot + 1, GetStr(0x12C));
    else
        sprintf(TempStr, "%d. %s %s %d %s", slot + 1, CharDataStruct.CharSlots[slot].pName, GetStr(0x245), CharDataStruct.CharSlots[slot].pLevel, GetStr(ClassStrTbl[CharDataStruct.CharSlots[slot].pClass]));
}

/* @0x8015B37C DLG.CPP:1159 */
int GetSpinnerWidth(int j)
{
    char TempStr[64];
    int len;

    if (card_status[current_card] == 2)
        return 0x200;
    if (CharDataStruct.CharSlots[j].pName[0]) {
        ConstructSlotName(TempStr, j);
        len = MediumFont.GetStrWidth(TempStr);
    } else {
        len = MediumFont.GetStrWidth(GetStr(0x12C));
    }
    return len + 8;
}

/* @0x8015B420 DLG.CPP:1190 */
char *ReconstructSlotName(int side, int file)
{
    for (int i = 0; i < 64; i++)
        TempStr[i] = 0;
    if (card_header[side][file].title[6] == '1') {
        strcpy(TempStr, "1");
        strcat(TempStr, GetStr(0x292));
        strcat(TempStr, " ");
        strcat(TempStr, GetStr(0x290));
        strncat(TempStr, (char *)&card_header[side][file].title[10], 2);
        strcat(TempStr, " ");
        switch (card_header[side][file].title[13]) {
        case 'W':
            strcat(TempStr, GetStr(0x4BE));
            break;
        case 'S':
            strcat(TempStr, GetStr(0x3E8));
            break;
        case 'R':
            strcat(TempStr, GetStr(0x375));
            break;
        default:
            strcat(TempStr, "BUGGER!");
            break;
        }
        strcat(TempStr, (char *)&card_header[side][file].title[16]);
    } else if (card_header[side][file].title[6] == '2') {
        strcpy(TempStr, "2");
        strcat(TempStr, GetStr(0x292));
        strcat(TempStr, " ");
        strcat(TempStr, GetStr(0x290));
        strncat(TempStr, (char *)&card_header[side][file].title[10], 2);
        strcat(TempStr, " ");
        switch (card_header[side][file].title[13]) {
        case 'W':
            strcat(TempStr, GetStr(0x4BE));
            break;
        case 'S':
            strcat(TempStr, GetStr(0x3E8));
            break;
        case 'R':
            strcat(TempStr, GetStr(0x375));
            break;
        default:
            strcat(TempStr, "BUGGER!");
            break;
        }
        strcat(TempStr, "-");
        strcat(TempStr, GetStr(0x290));
        strncat(TempStr, (char *)&card_header[side][file].title[18], 2);
        strcat(TempStr, " ");
        switch (card_header[side][file].title[21]) {
        case 'W':
            strcat(TempStr, GetStr(0x4BE));
            break;
        case 'S':
            strcat(TempStr, GetStr(0x3E8));
            break;
        case 'R':
            strcat(TempStr, GetStr(0x375));
            break;
        default:
            strcat(TempStr, "BUGGER!");
            break;
        }
    } else {
        strcpy(TempStr, GetStr(0x291));
    }
    return TempStr;
}

/* Keep initialized scalar globals after the TU's small literals, as in retail. */
int AlertTxt = 0;
int StatusTxt = 0;
int current_card = 0;
int LoadType = 0;
int McMenuPos = 0;
FeTable *McCurMenu = 0;
