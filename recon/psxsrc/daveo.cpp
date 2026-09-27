/* DAVEO.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: Dave Owens's PSX glue --
 * the front-end/menu pad reader (ReadPad: DavesPad/DavesPadDeb debounce), the centre-cursor dots,
 * and the two-player WinterSales / KeefDaFeef inventory clean-ups that sell duplicated or
 * player-specific unique items back as gold (PlaceStoreGold2 = STORES.CPP PlaceStoreGold for any
 * player).  The CPAD.H inlines GetCur/CheckActive are emitted out of line here (-fno-inline). */
#include "diabpsx_types.h"

/* ---- SYM layouts (copied from recon/source/gen/structs_player.h) ---- */
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
    PM_STAND = 0
};

struct ItemStruct {   /* sizeof 108 */
    int _iVAdd1;   /* +0x0 */
    int _iVMult1;   /* +0x4 */
    int _iVAdd2;   /* +0x8 */
    int _iVMult2;   /* +0xC */
    int _iSeed;   /* +0x10 */
    int _ivalue;   /* +0x14 */
    int _iIvalue;   /* +0x18 */
    long _iFlags;   /* +0x1C */
    int _iPLAC;   /* +0x20 */
    unsigned short _iCreateInfo;   /* +0x24 */
    unsigned short _iName;   /* +0x26 */
    unsigned short _iIName;   /* +0x28 */
    unsigned short ItemFrame;   /* +0x2A */
    short _itype;   /* +0x2C */
    short IDidx;   /* +0x2E */
    short _iPLMana;   /* +0x30 */
    short _iPLHP;   /* +0x32 */
    char _iUid;   /* +0x34 */
    short _iPLToHit;   /* +0x36 */
    short _iPLDam;   /* +0x38 */
    char _iPLDamMod;   /* +0x3A */
    char _iMinDam;   /* +0x3B */
    char _iMaxDam;   /* +0x3C */
    char _iSpell;   /* +0x3D */
    short _iDurability;   /* +0x3E */
    short _iMaxDur;   /* +0x40 */
    char _iPLGetHit;   /* +0x42 */
    char _iPLLight;   /* +0x43 */
    char _iFMinDam;   /* +0x44 */
    char _iFMaxDam;   /* +0x45 */
    char _iLMinDam;   /* +0x46 */
    char _iLMaxDam;   /* +0x47 */
    char _iPLEnAc;   /* +0x48 */
    unsigned char _iCharges;   /* +0x49 */
    char _iAC;   /* +0x4A */
    unsigned char _iMaxCharges;   /* +0x4B */
    unsigned char _iCurs;   /* +0x4C */
    unsigned char _iMiscId;   /* +0x4D */
    char _iAnimLen;   /* +0x4E */
    char _iAnimFrame;   /* +0x4F */
    char _iSelFlag;   /* +0x50 */
    char _iMagical;   /* +0x51 */
    char _ix;   /* +0x52 */
    char _iy;   /* +0x53 */
    char _iLoc;   /* +0x54 */
    char _iClass;   /* +0x55 */
    char _iPLStr;   /* +0x56 */
    char _iPLMag;   /* +0x57 */
    char _iPLDex;   /* +0x58 */
    char _iPLVit;   /* +0x59 */
    char _iPLFR;   /* +0x5A */
    char _iPLLR;   /* +0x5B */
    char _iPLMR;   /* +0x5C */
    char _iSplLvlAdd;   /* +0x5D */
    char _iRequest;   /* +0x5E */
    char _iPrePower;   /* +0x5F */
    char _iSufPower;   /* +0x60 */
    unsigned char _iMinStr;   /* +0x61 */
    unsigned char _iMinDex;   /* +0x62 */
    char _oldlight;   /* +0x63 */
    unsigned char _iMinMag;   /* +0x64 */
    char _PlrCreate;   /* +0x65 */
    char _iStatFlag;   /* +0x66 */
    char _iPostDraw;   /* +0x67 */
    char _iAnimFlag;   /* +0x68 */
    char _iIdentified;   /* +0x69 */
};

struct PlayerStruct {   /* sizeof 6632 */
    enum PLR_MODE _pmode;   /* +0x0 */
    char walkpath[25];   /* +0x4 */
    unsigned char plractive;   /* +0x1D */
    char destAction;   /* +0x1E */
    char destParam1;   /* +0x1F */
    char destParam2;   /* +0x20 */
    char destParam3;   /* +0x21 */
    char destParam4;   /* +0x22 */
    int plrlevel;   /* +0x24 */
    int WorldX;   /* +0x28 */
    int WorldY;   /* +0x2C */
    short _px;   /* +0x30 */
    short _py;   /* +0x32 */
    short _pownerx;   /* +0x34 */
    short _pownery;   /* +0x36 */
    short _poldx;   /* +0x38 */
    short _poldy;   /* +0x3A */
    char _pxoff;   /* +0x3C */
    char _pyoff;   /* +0x3D */
    short _pxvel;   /* +0x3E */
    short _pyvel;   /* +0x40 */
    char _pdir;   /* +0x42 */
    char _pgfxnum;   /* +0x43 */
    unsigned char *_pAnimData;   /* +0x44 */
    int _pAnimDelay;   /* +0x48 */
    int _pAnimCnt;   /* +0x4C */
    int _pAnimLen;   /* +0x50 */
    int _pAnimFrame;   /* +0x54 */
    char _pAnimWidth;   /* +0x58 */
    char _pAnimWidth2;   /* +0x59 */
    char DeadLevel;   /* +0x5A */
    char _plid;   /* +0x5B */
    char _pvid;   /* +0x5C */
    char _pSpell;   /* +0x5D */
    char _pSplType;   /* +0x5E */
    char _pSplFrom;   /* +0x5F */
    char _pTSpell;   /* +0x60 */
    char _pTSplType;   /* +0x61 */
    int _pRSpell;   /* +0x64 */
    char _pRSplType;   /* +0x68 */
    int _pSBkSpell;   /* +0x6C */
    char _pSBkSplType;   /* +0x70 */
    char _pSplLvl[64];   /* +0x71 */
    unsigned long long _pMemSpells;   /* +0xB8 (SYM says ULONG; 8 bytes) */
    unsigned long long _pAblSpells;   /* +0xC0 (SYM says ULONG; 8 bytes) */
    unsigned long long _pScrlSpells;   /* +0xC8 (SYM says ULONG; 8 bytes) */
    char _pSpellFlags;   /* +0xD0 */
    char _pwtype;   /* +0xD1 */
    unsigned char _pBlockFlag;   /* +0xD2 */
    unsigned char _pInvincible;   /* +0xD3 */
    char _pLightRad;   /* +0xD4 */
    unsigned char _pLvlChanging;   /* +0xD5 */
    char _pName[32];   /* +0xD6 */
    char _pClass;   /* +0xF6 */
    short _pStrength;   /* +0xF8 */
    short _pBaseStr;   /* +0xFA */
    short _pMagic;   /* +0xFC */
    short _pBaseMag;   /* +0xFE */
    short _pDexterity;   /* +0x100 */
    short _pBaseDex;   /* +0x102 */
    short _pVitality;   /* +0x104 */
    short _pBaseVit;   /* +0x106 */
    int _pStatPts;   /* +0x108 */
    int _pDamageMod;   /* +0x10C */
    int _pBaseToBlk;   /* +0x110 */
    long _pHPBase;   /* +0x114 */
    long _pMaxHPBase;   /* +0x118 */
    long _pHitPoints;   /* +0x11C */
    long _pMaxHP;   /* +0x120 */
    int _pHPPer;   /* +0x124 */
    long _pManaBase;   /* +0x128 */
    long _pMaxManaBase;   /* +0x12C */
    long _pMana;   /* +0x130 */
    long _pMaxMana;   /* +0x134 */
    int _pManaPer;   /* +0x138 */
    char _pLevel;   /* +0x13C */
    char _pMaxLvl;   /* +0x13D */
    long _pExperience;   /* +0x140 */
    long _pMaxExp;   /* +0x144 */
    long _pNextExper;   /* +0x148 */
    char _pArmorClass;   /* +0x14C */
    char _pMagResist;   /* +0x14D */
    char _pFireResist;   /* +0x14E */
    char _pLghtResist;   /* +0x14F */
    long _pGold;   /* +0x150 */
    unsigned char _pInfraFlag;   /* +0x154 */
    short _pVar1;   /* +0x156 */
    short _pVar2;   /* +0x158 */
    short _pVar3;   /* +0x15A */
    short _pVar4;   /* +0x15C */
    short _pVar5;   /* +0x15E */
    short _pVar6;   /* +0x160 */
    short _pVar7;   /* +0x162 */
    short _pVar8;   /* +0x164 */
    unsigned char _pLvlVisited[17];   /* +0x166 */
    unsigned char _pSLvlVisited[10];   /* +0x177 */
    int _pGFXLoad;   /* +0x184 */
    unsigned char peq;   /* +0x188 */
    int _pAFNum;   /* +0x18C */
    int _pNFrames;   /* +0x190 */
    int _pWFrames;   /* +0x194 */
    int _pAFrames;   /* +0x198 */
    int _pSFrames;   /* +0x19C */
    int _pSFNum;   /* +0x1A0 */
    int _pHFrames;   /* +0x1A4 */
    int _pDFrames;   /* +0x1A8 */
    int _pBFrames;   /* +0x1AC */
    struct ItemStruct InvBody[7];   /* +0x1B0 */
    struct ItemStruct InvList[40];   /* +0x4A4 */
    int _pNumInv;   /* +0x1584 */
    char InvGrid[40];   /* +0x1588 */
    struct ItemStruct SpdList[8];   /* +0x15B0 */
    struct ItemStruct HoldItem;   /* +0x1910 */
    int inv_highlight;   /* +0x197C */
    int body_highlight;   /* +0x1980 */
    int holdinv_x;   /* +0x1984 */
    int holdinv_y;   /* +0x1988 */
    int holdbody_loc;   /* +0x198C */
    int _pIMinDam;   /* +0x1990 */
    int _pIMaxDam;   /* +0x1994 */
    int _pIAC;   /* +0x1998 */
    int _pIBonusDam;   /* +0x199C */
    int _pIBonusToHit;   /* +0x19A0 */
    int _pIBonusAC;   /* +0x19A4 */
    int _pIBonusDamMod;   /* +0x19A8 */
    unsigned long long _pISpells;   /* +0x19B0 (SYM says ULONG; 8 bytes) */
    long _pIFlags;   /* +0x19B8 */
    int _pIGetHit;   /* +0x19BC */
    char _pISplLvlAdd;   /* +0x19C0 */
    char _pISplCost;   /* +0x19C1 */
    int _pISplDur;   /* +0x19C4 */
    int _pIEnAc;   /* +0x19C8 */
    int _pIFMinDam;   /* +0x19CC */
    int _pIFMaxDam;   /* +0x19D0 */
    int _pILMinDam;   /* +0x19D4 */
    int _pILMaxDam;   /* +0x19D8 */
    int _pOilType;   /* +0x19DC */
    unsigned char pTownWarps;   /* +0x19E0 */
    unsigned char pDungMsgs;   /* +0x19E1 */
    unsigned char pLvlLoad;   /* +0x19E2 */
    unsigned long pDiabloKillLevel;   /* +0x19E4 */
};


struct RECT;
enum TXT_JUST { JustLeft = 0, JustCentre = 1, JustRight = 2 };

class CFont {
public:
    unsigned char data[540];
    int Print(int X, int Y, char *Str, enum TXT_JUST Justify, struct RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
    void SetChar(int ch, unsigned short Frm);
};

class CPad {   /* sizeof 236 */
public:
    unsigned char get_both;       /* +0x0 */
    unsigned char active;         /* +0x1 */
    unsigned char PadType;        /* +0x2 */
    unsigned char PADTICK;        /* +0x3 */
    unsigned short PADTICKMASK;   /* +0x4 */
    unsigned short PadNum;        /* +0x6 */
    unsigned short Cur;           /* +0x8 */
    unsigned short Up;            /* +0xA */
    unsigned short Down;          /* +0xC */
    unsigned short Tick;          /* +0xE */
    unsigned short Old;           /* +0x10 */
    unsigned short both_Cur;      /* +0x12 */
    unsigned short both_Up;       /* +0x14 */
    unsigned short both_Down;     /* +0x16 */
    unsigned short both_Tick;     /* +0x18 */
    unsigned short both_Old;      /* +0x1A */
    unsigned char rest[236 - 0x1C];

    unsigned char CheckActive() { return active; }
    unsigned short GetCur() const
    {
        if (get_both)
            return both_Cur;
        return Cur;
    }
    void Flush();
};

struct FeTable;

/* GMAN.H (included by the original): its header-defined TextDat::DumpDatFile is never called here,
 * but compiling it emits "psxsrc/gman.h" -- the only string in retail .DAVEO_rdata (0xE bytes). */
extern "C" BOOL GAL_Free(long Hnd);
extern "C" void DBG_Error(char *Text, char *File, int Line);
class TextDat {   /* sizeof 112 -- only the fields DumpDatFile touches */
public:
    BOOL OwnDat;                   /* +0x0 */
    int pad0[3];
    long hndDat;                   /* +0x10 */
    unsigned char rest[112 - 0x14];
    inline void DumpDatFile();
};
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

/* ---- externals ---- */
CPad *PAD_GetPad(int PadNum, unsigned char both);
void GetGoldSeed(int pnum, ItemStruct *h);
void SetGoldCurs(int pnum, int i);
void CalcPlrInv(int p, unsigned char Loadgfx);
void SpawnStoreGold(void);

extern BOOL CDWAIT;
extern struct FeTable *FeCurMenu;
extern struct FeTable FeNewP1NameMenu;
extern struct FeTable FeNewP1ClassMenu;
extern struct FeTable FeNewP2NameMenu;
extern struct FeTable FeNewP2ClassMenu;
extern struct FeTable FeDifficultyMenu;
extern int FePlayerNo;
extern unsigned char FeFlag;
extern int options_pad;
extern CFont MediumFont;
extern const unsigned char WHITER, WHITEG;
extern struct PlayerStruct plr[2];
extern struct ItemStruct _golditem[2];
extern int StorePlrNo;
extern char itemavail[127];
extern unsigned char UniqueItemFlag[128];

/* ---- TU data (.sdata: DaveDebCount is explicitly initialized, the rest are emitted at the end) ---- */
int DaveDebCount = 0;   /* @0x8011AB0C */
short DavesPad;         /* @0x8011AB12 */
short DavesPadDeb;      /* @0x8011AB14 */
long PDosh[2];          /* @0x8011AB18 */

/* @0x8008463C DAVEO.CPP:74 */
void ReadPad(int NoDeb)
{
    CPad *DPad;
    int New;
    int cmem = (int)FeCurMenu;
    int p1mema = (int)&FeNewP1NameMenu;
    int p1memb = (int)&FeNewP1ClassMenu;
    int p2mema = (int)&FeNewP2NameMenu;
    int p2memb = (int)&FeNewP2ClassMenu;
    int diffm = (int)&FeDifficultyMenu;

    if (DaveDebCount++ > 15) {
        DaveDebCount = 0;
        DavesPadDeb &= 0xFFF0;
    }
    if (CDWAIT)
        return;
    if (FeFlag) {
        if (cmem == p1mema || cmem == p1memb) {
            DPad = PAD_GetPad(0, 0);
            if (!DPad->CheckActive()) {
                DavesPad = 0;
                DavesPadDeb = 0;
                DPad->Flush();
                return;
            }
        } else if (cmem == p2mema || cmem == p2memb) {
            DPad = PAD_GetPad(1, 0);
            if (!DPad->CheckActive()) {
                DavesPad = 0;
                DavesPadDeb = 0;
                DPad->Flush();
                return;
            }
        } else if (cmem == diffm && FePlayerNo == 0)
            DPad = PAD_GetPad(0, 0);
        else
            DPad = PAD_GetPad(0, 1);
    } else
        DPad = PAD_GetPad(options_pad, 0);
    New = DPad->GetCur();
    DavesPad = New & ~DavesPadDeb;
    DavesPadDeb = New & NoDeb;
    if (!New)
        DaveDebCount = 0;
}

/* @0x800847C4 DAVEO.CPP:300 */
void DummyPoll()
{
}

/* @0x800847CC DAVEO.CPP:306 */
void DaveOwens()
{
}

/* @0x800847D4 DAVEO.CPP:319 */
void DaveCentreStuff()
{
    char TempStr[40];

    MediumFont.SetChar('.', 0x7F);
    MediumFont.Print(0x9B, 0x69, ".", JustLeft, NULL, WHITER, WHITEG, WHITEG);
    MediumFont.SetChar('.', 0x80);
    MediumFont.Print(0x9B, 0x8E, ".", JustLeft, NULL, WHITER, WHITEG, WHITEG);
    MediumFont.SetChar('.', 0x81);
    MediumFont.Print(0x8B, 0x7E, ".", JustLeft, NULL, WHITER, WHITEG, WHITEG);
    MediumFont.SetChar('.', 0x82);
    MediumFont.Print(0xB0, 0x7D, ".", JustLeft, NULL, WHITER, WHITEG, WHITEG);
    MediumFont.SetChar('.', 0x6D);
}

/* @0x8008491C DAVEO.CPP:379 -- STORES.CPP PlaceStoreGold with the player as a parameter */
void PlaceStoreGold2(int myplr, long v)
{
    int i, ii, xx, yy;
    unsigned char done;

    done = 0;
    for (ii = 0;; ii++) {
        if (!(ii < 40 && !done))
            break;
        yy = (ii / 10) * 10;
        xx = ii % 10;
        if (plr[myplr].InvGrid[xx + yy] == 0) {
            i = plr[myplr]._pNumInv;
            // drb.patch1 (hellfire STORES.CPP keeps this block-scope prototype; it opens the SYM level)
            void GetGoldSeed(int pnum, ItemStruct *h);
            GetGoldSeed(myplr, &_golditem[StorePlrNo]);
            plr[myplr].InvList[i] = _golditem[StorePlrNo];
            plr[myplr]._pNumInv++;
            plr[myplr].InvGrid[xx + yy] = plr[myplr]._pNumInv;
            plr[myplr].InvList[i]._ivalue = v;
            SetGoldCurs(myplr, i);
            done = 1;
        }
    }
}

/* @0x80084B44 DAVEO.CPP:408 -- STORES.CPP StoreSellItem's gold placement */
void GivePlayerDosh(int PlayerNo, long cost)
{
    int i;

    plr[PlayerNo]._pGold += cost;
    for (i = 0; i < plr[PlayerNo]._pNumInv && cost > 0; i++) {
        if (plr[PlayerNo].InvList[i]._itype == 11 && plr[PlayerNo].InvList[i]._ivalue != 5000) {
            if (cost + plr[PlayerNo].InvList[i]._ivalue <= 5000) {
                plr[PlayerNo].InvList[i]._ivalue += cost;
                SetGoldCurs(PlayerNo, i);
                cost = 0;
            } else {
                cost -= 5000 - plr[PlayerNo].InvList[i]._ivalue;
                plr[PlayerNo].InvList[i]._ivalue = 5000;
                SetGoldCurs(PlayerNo, i);
            }
        }
    }
    if (cost > 0) {
        while (cost > 5000) {
            PlaceStoreGold2(PlayerNo, 5000);
            cost -= 5000;
        }
        PlaceStoreGold2(PlayerNo, cost);
    }
}

/* @0x80084CF8 DAVEO.CPP:444 */
int CalcItemVal(ItemStruct *Item)
{
    int cost;

    if (Item->_itype == 11)
        return 0;
    if (Item->_iMagical && Item->_iIdentified)
        cost = Item->_iIvalue >> 2;
    else
        cost = Item->_ivalue >> 2;
    if (cost <= 0)
        cost = 1;
    return cost;
}

/* @0x80084D54 DAVEO.CPP:457 -- INV.CPP RemoveInvItem without the cursor/graphics update */
void RemoveDupInvItem(int pnum, int iv)
{
    int i;

    iv++;
    for (i = 0; i < 40; i++) {
        if (plr[pnum].InvGrid[i] == iv || plr[pnum].InvGrid[i] == -iv)
            plr[pnum].InvGrid[i] = 0;
    }
    iv--;
    if (plr[pnum]._pNumInv) {
        plr[pnum]._pNumInv--;
        if (plr[pnum]._pNumInv > 0 && plr[pnum]._pNumInv != iv) {
            plr[pnum].InvList[iv] = plr[pnum].InvList[plr[pnum]._pNumInv];
            for (i = 0; i < 40; i++) {
                if (plr[pnum].InvGrid[i] == plr[pnum]._pNumInv + 1)
                    plr[pnum].InvGrid[i] = iv + 1;
                if (plr[pnum].InvGrid[i] == -(plr[pnum]._pNumInv + 1))
                    plr[pnum].InvGrid[i] = -(iv + 1);
            }
        }
    }
}

/* @0x80084F44 DAVEO.CPP:494 */
long DetectDup(ItemStruct *Item, int PlayerNo)
{
    long Value;
    ItemStruct *pi;
    int i, InvItem;
    long DupSell;
    unsigned char Flag;

    Value = CalcItemVal(Item);
    DupSell = 0;
    pi = plr[PlayerNo].InvBody;
    for (i = 6; i != -1; i--, pi++) {
        if (pi->_itype != -1 && Item->_iCreateInfo == pi->_iCreateInfo && Item->_iSeed == pi->_iSeed) {
            DupSell += Value;
            pi->_itype = -1;
        }
    }
    do {
        Flag = 1;
        InvItem = 0;
        pi = plr[PlayerNo].InvList;
        i = plr[PlayerNo]._pNumInv;
        for (i--; i != -1; i--, pi++) {
            if (!Flag)
                break;
            if (pi->_itype != -1 && pi->_itype != 11 && Item->_iCreateInfo == pi->_iCreateInfo && Item->_iSeed == pi->_iSeed) {
                Flag = 0;
                DupSell += Value;
                RemoveDupInvItem(PlayerNo, InvItem);
            }
            InvItem++;
        }
    } while (!Flag);
    pi = plr[PlayerNo].SpdList;
    for (i = 7; i != -1; i--, pi++) {
        if (pi->_itype != -1 && Item->_iCreateInfo == pi->_iCreateInfo && Item->_iSeed == pi->_iSeed) {
            DupSell += Value;
            pi->_itype = -1;
        }
    }
    if (DupSell) {
        PDosh[PlayerNo] += DupSell;
        return Value;
    }
    return 0;
}

/* @0x800851C0 DAVEO.CPP:565 */
void WinterSales(int PlayerNo)
{
    int Value, i, InvItem;
    ItemStruct *pi;
    unsigned char Flag;

    if (PlayerNo) {
        CalcPlrInv(0, 1);
        CalcPlrInv(1, 1);
        PlayerNo = 0;
        PDosh[1] = 0;
        PDosh[PlayerNo] = 0;
        pi = plr[PlayerNo].InvBody;
        for (i = 6; i != -1; pi++, i--) {
            if (pi->_itype != -1 && (Value = DetectDup(pi, 1)) != 0) {
                pi->_itype = -1;
                PDosh[PlayerNo] += Value;
            }
        }
        do {
            Flag = 1;
            InvItem = 0;
            pi = plr[PlayerNo].InvList;
            i = plr[PlayerNo]._pNumInv;
            for (i--; i != -1; i--, pi++) {
                if (!Flag)
                    break;
                if (pi->_itype != -1 && pi->_itype != 11 && (Value = DetectDup(pi, 1)) != 0) {
                    RemoveDupInvItem(PlayerNo, InvItem);
                    Flag = 0;
                    PDosh[PlayerNo] += Value;
                }
                InvItem++;
            }
        } while (!Flag);
        pi = plr[PlayerNo].SpdList;
        for (i = 7; i != -1; pi++, i--) {
            if (pi->_itype != -1 && (Value = DetectDup(pi, 1)) != 0) {
                pi->_itype = -1;
                PDosh[PlayerNo] += Value;
            }
        }
        CalcPlrInv(0, 1);
        CalcPlrInv(1, 1);
        SpawnStoreGold();
        GivePlayerDosh(0, PDosh[0]);
        GivePlayerDosh(1, PDosh[1]);
    }
}

/* @0x800853FC DAVEO.CPP:646 */
int SpecUn(ItemStruct *pi)
{
    int MrHappy = (unsigned short)pi->IDidx >= 6 && (unsigned short)pi->IDidx <= 22;

    switch (pi->IDidx) {
    case 28:
    case 31:
    case 32:
    case 33:
        MrHappy = 1;
    }
    if ((unsigned)(pi->_iMiscId - 21) < 2) {
        if (((pi->_iSpell == 32 || pi->_iSpell == 34) && FePlayerNo == 0)
            || (pi->_iSpell == 23 && FePlayerNo == 1)
            || (pi->_iSpell == 10 && FePlayerNo == 1))
            MrHappy = 1;
    }
    return MrHappy;
}

/* @0x800854D0 DAVEO.CPP:685 */
void EnableQuestItemsPleeeeeeeeeeeeeeeeeez()
{
    int Uid;

    for (Uid = 6; Uid < 22; Uid++)
        UniqueItemFlag[Uid - 6] = 0;
    UniqueItemFlag[27] = 0;
    UniqueItemFlag[22] = 0;
    UniqueItemFlag[25] = 0;
    UniqueItemFlag[26] = 0;
}

/* @0x80085518 DAVEO.CPP:699 */
void KeefDaFeef(int PlayerNo)
{
    int i, InvItem;
    ItemStruct *pi;
    unsigned char Flag;

    CalcPlrInv(0, 1);
    CalcPlrInv(1, 1);
    PDosh[1] = 0;
    PDosh[PlayerNo] = 0;
    pi = plr[PlayerNo].InvBody;
    for (i = 6; i != -1; pi++, i--) {
        if (pi->_itype != -1 && SpecUn(pi)) {
            PDosh[PlayerNo] += CalcItemVal(pi);
            pi->_itype = -1;
            UniqueItemFlag[pi->_iUid] = 0;
        }
    }
    do {
        Flag = 1;
        InvItem = 0;
        pi = plr[PlayerNo].InvList;
        i = plr[PlayerNo]._pNumInv;
        for (i--; i != -1; pi++, i--) {
            if (!Flag)
                break;
            if (pi->_itype != -1 && SpecUn(pi)) {
                PDosh[PlayerNo] += CalcItemVal(pi);
                RemoveDupInvItem(PlayerNo, InvItem);
                Flag = 0;
                UniqueItemFlag[pi->_iUid] = 0;
            }
            InvItem++;
        }
    } while (!Flag);
    pi = plr[PlayerNo].SpdList;
    for (i = 7; i != -1; pi++, i--) {
        if (pi->_itype != -1 && SpecUn(pi)) {
            PDosh[PlayerNo] += CalcItemVal(pi);
            pi->_itype = -1;
        }
    }
    CalcPlrInv(PlayerNo, 1);
    SpawnStoreGold();
    GivePlayerDosh(PlayerNo, PDosh[PlayerNo]);
    EnableQuestItemsPleeeeeeeeeeeeeeeeeez();
}

/* @0x800857F8 DAVEO.CPP:781 */
void ClearQuestFlags()
{
    EnableQuestItemsPleeeeeeeeeeeeeeeeeez();
}
