/* SOURCE/MSG.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/msg.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 *
 * PSX deltas vs devilution (confirmed from the raw oracle, function by function):
 *  - No Storm networking: NetSendLoPri feeds ParseCmd directly for myplr (see multi.cpp); NetSendCmd*
 *    never branches on bHiPri (bHiPri is REGPARM but never read) and always calls NetSendLoPri.
 *  - delta_* functions have NO "if (gbMaxPlayers==1) return;" early-out (confirmed absent from the
 *    raw for delta_kill_monster/delta_monster_hp/delta_leave_sync/delta_sync_object/delta_get_item/
 *    delta_put_item/DeltaAddItem/DeltaSaveLevel) -- the delta-tracking arrays are always maintained.
 *  - sgLevels[NUMLEVELS] (a static array on PC) is replaced by an on-demand DECOMPRESSION CACHE:
 *    GetDLevel(lvl,setlevel)/ReleaseDLevel(Dl) wrap CompLevelMaps::GetMap/ReleaseMap (COMPMAP.CPP,
 *    a separate TU) -- PSX RAM can't hold all levels' delta state at once, so it's kept compressed
 *    on the CD/RAM cache and only decompressed while a delta_* function touches it.
 *  - i_own_level always returns TRUE and check_update_plr is an empty stub (no multi-owner tracking).
 *  - ParseCmd has none of devilution's per-command bLen/plr[pnum].plractive validation -- it is a
 *    bare switch(pCmd->bCmd) to the On_* handler and always returns 0; an out-of-range bCmd asserts
 *    ("Shouldn't get here") via DBG_Error.  The CMD_* dispatch order below is read directly off the
 *    retail jump table (jtbl_80116868), NOT devilutionx's later-evolved enum ordering (which added/
 *    reordered members) -- CMD_STAND=0/CMD_WALKXY=1/CMD_ACK_PLRINFO=2 do still match devilution
 *    exactly (confirmed in delta_get_item's literal compares), but the dispatched command IDs 3..59
 *    are this retail build's own ordering.
 */
#include "diabpsx_types.h"
#include "source/gen/structs_msg.h"
#include "source/gen/externs_msg.h"
#include "source/gen/protos_msg.h"
#include "source/diablo.h"

/* hand-asm lib routines (lib segment, a different TU) -- 4/3-arg forms confirmed from the raw
 * (asm/nonmatchings/lib/crunch.s, decrunch.s): crunch(src,dst,srclen,windowsize), decrunch(src,dst,srclen). */
extern "C" int crunch(const unsigned char *Src, unsigned char *Dest, int SrcLen, int WindowSize);
extern "C" void decrunch(const unsigned char *Src, unsigned char *Dest, int SrcLen);

/* explicit initializer (not a tentative def), declared as EARLY as possible in the TU -- gcc-2.7
 * names the _GLOBAL_.I/.D static-init thunk after the FIRST global with an explicit `=` initializer
 * in declaration order (proved in QUESTS.CPP); this must be that first initialized global, ahead of
 * the CompClass objects further down. */
unsigned char deltaload = 0;
unsigned char gbBufferMsgs = 0;   /* @0x8011B97E -- .sdata right after deltaload; msg is the only %gp_rel user (TU-owned) */
static DJunk sgJunk;
static unsigned char sgbDeltaChanged;   /* D_8011C835 -- gp-rel small BSS, TU-owned tentative def */

/* --- delta item/object marker values (confirmed via delta_get_item's literal compares) --- */
#define MAXITEMS 127

#define CMD_STAND        0
#define CMD_WALKXY       1
#define CMD_ACK_PLRINFO  2

/* --- CMD_* dispatch ids -- these are the REAL jump-table indices read off jtbl_80116868 in
 * asm/data/rodata_msg.rodata.s (90 .word entries, default target 0x80052858 at the "hole" indices:
 * 1,11,12,18,19,20,31-34,53,57-75,77 -- table INDEX, i.e. wire bCmd minus 1, see below).
 * verify_asm.py does NOT check jump-table data, so a sequential/positional guess here silently
 * passes the byte gate while dispatching the WRONG handler for a given wire bCmd -- these are the
 * corrected, per-slot values (cross-checked against each jal target in ParseCmd's own body).
 * ParseCmd's raw computes `a1 = bCmd - 1` BEFORE indexing the table (`sltiu v0,a1,0x5A` then
 * `jtbl[a1]`), so every CMD_* value below is (table index + 1) -- the WIRE bCmd, which is what the
 * switch(pCmd->bCmd) case labels must use. CMD_ON_WALKXY is renamed from CMD_WALKXY specifically to
 * avoid colliding with the unrelated delta-record marker CMD_WALKXY(=1) above; the real dispatch
 * slot for On_WALKXY is jtbl index 0 -> wire bCmd 1. */
#define CMD_ON_WALKXY        1
#define CMD_ADDSTR           3
#define CMD_ADDDEX           5
#define CMD_ADDMAG           4
#define CMD_ADDVIT           6
#define CMD_SBSPELL          7
#define CMD_GOTOGETITEM      41
#define CMD_REQUESTGITEM     39
#define CMD_GETITEM          8
#define CMD_GOTOAGETITEM     42
#define CMD_REQUESTAGITEM    40
#define CMD_AGETITEM         9
#define CMD_ITEMEXTRA        85
#define CMD_PUTITEM          10
#define CMD_SYNCPUTITEM      86
#define CMD_RESPAWNITEM      11
#define CMD_SATTACKXY        55
#define CMD_SPELLXYD         84
#define CMD_SPELLXY          14
#define CMD_TSPELLXY         15
#define CMD_OPOBJXY          16
#define CMD_DISARMXY         17
#define CMD_OPOBJT           27
#define CMD_ATTACKID         18
#define CMD_SPELLID          22
#define CMD_SPELLPID         23
#define CMD_TSPELLID         24
#define CMD_TSPELLPID        25
#define CMD_KNOCKBACK        28
#define CMD_RESURRECT        26
#define CMD_HEALOTHER        77
#define CMD_TALKXY           29
#define CMD_NEWLVL           30
#define CMD_WARP             31
#define CMD_MONSTDEATH       36
#define CMD_KILLGOLEM        87
#define CMD_AWAKEGOLEM       90
#define CMD_MONSTDAMAGE      37
#define CMD_PLRDEAD          38
#define CMD_PLRDAMAGE        50
#define CMD_OPENDOOR         43
#define CMD_CLOSEDOOR        44
#define CMD_OPERATEOBJ       45
#define CMD_PLROPOBJ         46
#define CMD_BREAKOBJ         47
#define CMD_CHANGEPLRITEMS   48
#define CMD_DELPLRITEMS      49
#define CMD_PLRLEVEL         51
#define CMD_DROPITEM         52
#define CMD_PLAYER_JOINLEVEL 53
#define CMD_ACTIVATEPORTAL   56
#define CMD_DEACTIVATEPORTAL 57
#define CMD_RETOWN           83
#define CMD_SETSTR           79
#define CMD_SETMAG           80
#define CMD_SETDEX           81
#define CMD_SETVIT           82
#define CMD_SYNCQUEST        88
#define CMD_ENDSHIELD        89

/* destAction values (plr[].destAction, offsets from the raw: +0x1E/+0x1F/+0x20/+0x21) */
#define ACTION_WALK      15  /* 0xF  -- GOTOGETITEM */
#define ACTION_PICKUPITEM 16 /* 0x10 -- GOTOAGETITEM */
#define ACTION_TALK      17  /* 0x11 -- TALKXY */
#define ACTION_OPERATE   18  /* 0x12 -- OPOBJT */

/* ============================================================================================= */
/* Compression strategy classes (real polymorphic inheritance -- see structs_msg.h for the class
 * declarations; the vtables match retail's D_80116808/D_80116820/D_80116838 exactly for this shape). */

int NoComp::DoComp(unsigned char *Dest, const unsigned char *Src, int SrcLen) const
{
    memcpy(Dest, Src, SrcLen);
    return SrcLen;
}

void NoComp::DoDecomp(unsigned char *Dest, const unsigned char *Src, int DstLen, int SrcLen) const
{
    memcpy(Dest, Src, SrcLen);
}

int PakComp::DoComp(unsigned char *Dest, const unsigned char *Src, int SrcLen) const
{
    return PAK_DoPak(Dest, Src, SrcLen);
}

void PakComp::DoDecomp(unsigned char *Dest, const unsigned char *Src, int DstLen, int SrcLen) const
{
    PAK_DoUnpak(Dest, Src);
}

int CrunchComp::DoComp(unsigned char *Dest, const unsigned char *Src, int SrcLen) const
{
    return crunch(Src, Dest, SrcLen, 0x800);
}

void CrunchComp::DoDecomp(unsigned char *Dest, const unsigned char *Src, int DstLen, int SrcLen) const
{
    decrunch(Src, Dest, SrcLen);
}

/* @0x80052A54 COMPMAP.H:60 -- inline header method, ends up compiled into this TU because it's
 * the only TU that calls it (DeltaExportData/DeltaImportData below).  Offset[21]+aligned(Size[21])
 * = the end of the last (21st) level's compressed data = the file's total compressed size. */
int CompressedLevs::GetSize(void)
{
    return this->Offset[21] + GAL_AlignSizeToType(this->Size[21], 1);
}

/* the three compressor strategy objects + the level-map cache, default strategy = Pak (matches the
 * retail _GLOBAL_.I.deltaload ctor thunk: NoComp, PakComp, CrunchComp, then GameMaps(CompPakComp)). */
static NoComp CompNoComp;
static PakComp CompPakComp;
static CrunchComp CompCrunchComp;
struct CompLevelMaps GameMaps(CompPakComp);

/* ============================================================================================= */

/* @0x8004EA9C MSG.CPP:266 */
void delta_init(void)
{
    sgbDeltaChanged = 0;
    memset(&sgJunk, 0xFF, sizeof(sgJunk));
    GameMaps.Init();
    memset(sgLocals, 0, sizeof(sgLocals));
    deltaload = 0;
}

/* @0x8004EAF4 MSG.CPP:284 */
void delta_kill_monster(int mi, unsigned char x, unsigned char y, unsigned char bLevel)
{
    DMonsterStr *p;
    DLevel *Dl;
    sgbDeltaChanged = 1;
    Dl = GetDLevel(bLevel, setlevel);
    p = &Dl->monster[mi];
    p->_mx = x;
    p->_my = y;
    p->_mdir = monster[mi]._mdir;
    p->_mhitpoints = 0;
    ReleaseDLevel(Dl);
}

/* @0x8004EB90 MSG.CPP:312 */
void delta_monster_hp(int mi, long hp, unsigned char bLevel)
{
    DMonsterStr *p;
    DLevel *Dl;
    sgbDeltaChanged = 1;
    Dl = GetDLevel(bLevel, setlevel);
    p = &Dl->monster[mi];
    if (p->_mhitpoints > hp)
        p->_mhitpoints = hp;
    ReleaseDLevel(Dl);
}

/* @0x8004EC0C MSG.CPP:369 */
void delta_leave_sync(unsigned char bLevel)
{
    if (currlevel == 0)
        glSeedTbl[0] = GetRndSeed();
    if (currlevel == 0)
        return;
    DLevel *Dl = GetDLevel(bLevel, setlevel);
    for (int i = 0; i < nummonsters; i++) {
        int ii = monstactive[i];
        DMonsterStr *pD;
        if (monster[ii]._mhitpoints != 0) {
            pD = &Dl->monster[ii];
            sgbDeltaChanged = 1;
            pD->_mx = monster[ii]._mx;
            pD->_my = monster[ii]._my;
            pD->_mdir = monster[ii]._mdir;
            pD->_menemy = encode_enemy(ii);
            pD->_mhitpoints = monster[ii]._mhitpoints;
        }
    }
    ReleaseDLevel(Dl);
    if (!setlevel)
        memcpy(&sgLocals[bLevel].automapsv, automapview, sizeof(automapview));
    else
        memcpy(&sgLocals[setlvlnum + 16].automapsv, automapview, sizeof(automapview));
}

/* @0x8004EF38 MSG.CPP:416 */
void delta_sync_object(int oi, unsigned char bCmd, unsigned char bLevel)
{
    sgbDeltaChanged = 1;
    DLevel *Dl = GetDLevel(bLevel, setlevel);
    DObjectStr *p = &Dl->object[oi];
    p->bCmd = bCmd;
    ReleaseDLevel(Dl);
}

/* @0x8004EF98 MSG.CPP:439 */
BOOL delta_get_item(const TCmdGItem *pI, unsigned char bLevel)
{
    DLevel *Dl;
    Dl = GetDLevel(bLevel, setlevel);
    {
        TCmdPItem *pD = Dl->item;
        unsigned char bc;
        for (int i = 0; i < MAXITEMS; i++, pD++) {
            bc = pD->bCmd;
            if (bc == 0xFF || pD->wIndx != pI->wIndx || pD->wCI != pI->wCI || pD->dwSeed != pI->dwSeed)
                continue;

            if (bc == CMD_WALKXY)
                goto ret1;
            if (bc == CMD_STAND) {
                sgbDeltaChanged = 1;
                pD->bCmd = CMD_WALKXY;
                goto ret1;
            }
            if (bc == CMD_ACK_PLRINFO) {
                sgbDeltaChanged = 1;
                pD->bCmd = 0xFF;
                goto ret1;
            }
            break;
        }
    }
    ReleaseDLevel(Dl);

    if (!(pI->wCI & 0x8000))
        return 1;

    Dl = GetDLevel(bLevel, setlevel);
    {
    TCmdPItem *pD = Dl->item;
    for (int i = 0; i < MAXITEMS; i++, pD++) {
        if (pD->bCmd == 0xFF) {
            sgbDeltaChanged = 1;
            pD->bCmd = CMD_WALKXY;
            pD->x = pI->x;
            pD->y = pI->y;
            pD->wIndx = pI->wIndx;
            pD->wCI = pI->wCI;
            pD->dwSeed = pI->dwSeed;
            pD->bId = pI->bId;
            pD->bDur = pI->bDur;
            pD->bMDur = pI->bMDur;
            pD->bCh = pI->bCh;
            pD->bMCh = pI->bMCh;
            pD->wValue = pI->wValue;
            pD->dwBuff = pI->dwBuff;
            break;
        }
    }
    }
ret1:
    ReleaseDLevel(Dl);
    return 1;
}

/* @0x8004F164 MSG.CPP:568 -- re-derived from the raw: the first loop only early-returns when a
 * matching record's bCmd is EXACTLY CMD_ACK_PLRINFO(2) -- a match with any other live bCmd just
 * keeps scanning (not an early-out) -- and a SEPARATE GetDLevel/ReleaseDLevel pair brackets each of
 * the two loops (not one shared acquisition). The free-slot write is a raw struct copy (*pD = *pI)
 * with bCmd/x/y overwritten afterward from the CALLER's own x/y (not pI's). */
void delta_put_item(const TCmdPItem *pI, int x, int y, unsigned char bLevel)
{
    DLevel *Dl = GetDLevel(bLevel, setlevel);
    TCmdPItem *pD = Dl->item;
    int i;
    unsigned char bc;
    for (i = 0; i < MAXITEMS; i++, pD++) {
        bc = pD->bCmd;
        if (bc == CMD_WALKXY || bc == 0xFF)
            continue;
        if (pD->wIndx != pI->wIndx)
            continue;
        if (pD->wCI != pI->wCI)
            continue;
        if (pD->dwSeed != pI->dwSeed)
            continue;
        if (bc == CMD_ACK_PLRINFO) {
            ReleaseDLevel(Dl);
            return;
        }
    }
    ReleaseDLevel(Dl);

    Dl = GetDLevel(bLevel, setlevel);
    pD = Dl->item;
    for (i = 0; i < MAXITEMS; i++, pD++) {
        if (pD->bCmd == 0xFF) {
            sgbDeltaChanged = 1;
            *pD = *pI;
            pD->bCmd = CMD_ACK_PLRINFO;
            pD->x = x;
            pD->y = y;
            ReleaseDLevel(Dl);
            return;
        }
    }
    ReleaseDLevel(Dl);
}

/* @0x8004F2F0 MSG.CPP:636 */
BOOL delta_portal_inited(int i)
{
    return sgJunk.portal[i].x == 0xFF;
}

/* @0x8004F314 MSG.CPP:645 */
BOOL delta_quest_inited(int i)
{
    return sgJunk.quests[i].qstate != 0xFF;
}

/* @0x8004F338 MSG.CPP:655 -- re-derived from the raw: the free-slot write's dwBuff source is
 * item[ii]._PlrCreate (offset 0x65, sign-extended byte) -- NOT _iMagical (that mapping is specific
 * to the NetSendCmdGItem/network-record family; this local delta-record uses a different field). */
void DeltaAddItem(int ii)
{
    DLevel *Dl;
    TCmdPItem *pD, *OpD;
    Dl = GetDLevel(currlevel, setlevel);
    OpD = pD = Dl->item;
    {
        unsigned char bc;
        for (int i = 0; i < MAXITEMS; i++, pD++) {
            bc = pD->bCmd;
            if (bc == 0xFF)
                continue;
            if (pD->wIndx != item[ii].IDidx)
                continue;
            if (pD->wCI != item[ii]._iCreateInfo)
                continue;
            if (pD->dwSeed != item[ii]._iSeed)
                continue;
            if (bc < 2) {
                ReleaseDLevel(Dl);
                return;
            }
        }
    }

    {
    for (int i = 0; i < MAXITEMS; i++, OpD++) {
        if (OpD->bCmd == 0xFF) {
            sgbDeltaChanged = 1;
            OpD->bCmd = 0;
            OpD->x = item[ii]._ix;
            OpD->y = item[ii]._iy;
            OpD->wIndx = item[ii].IDidx;
            OpD->wCI = item[ii]._iCreateInfo;
            OpD->dwSeed = item[ii]._iSeed;
            OpD->bId = item[ii]._iIdentified;
            OpD->bDur = (unsigned char)item[ii]._iDurability;
            OpD->bMDur = (unsigned char)item[ii]._iMaxDur;
            OpD->bCh = item[ii]._iCharges;
            OpD->bMCh = item[ii]._iMaxCharges;
            OpD->wValue = (unsigned short)item[ii]._ivalue;
            OpD->dwBuff = item[ii]._PlrCreate;
            break;
        }
    }
    }
    ReleaseDLevel(Dl);
}

/* @0x8004F560 MSG.CPP:731 */
void DeltaExportData(char *Dst)
{
    GameMaps.ExportData((unsigned char *)Dst);
}

/* @0x8004F58C MSG.CPP:754 -- single-arg (char *Src is reinterpreted straight as CompressedLevs*);
 * returns the pre-import compressed size (GetSize() called on Src BEFORE ImportData consumes it). */
int DeltaImportData(char *Src)
{
    int osize = ((CompressedLevs *)Src)->GetSize();
    GameMaps.ImportData((CompressedLevs *)Src);
    return osize;
}

/* @0x8004F5D4 MSG.CPP:780 */
void DeltaSaveLevel(void)
{
    for (int i = 0; i < 2; i++) {
        if (i != myplr)
            plr[i]._pGFXLoad = 0;
    }
    if (!setlevel)
        plr[myplr]._pLvlVisited[currlevel] = 1;
    else
        plr[myplr]._pSLvlVisited[setlvlnum] = 1;
    delta_leave_sync(currlevel);
}

/* @0x8004F6D0 MSG.CPP:870 */
void NetSendCmd(unsigned char bHiPri, unsigned char bCmd)
{
    TCmd cmd;
    cmd.bCmd = bCmd;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F6F8 MSG.CPP:880 */
void NetSendCmdGolem(unsigned char mx, unsigned char my, unsigned char dir, unsigned char menemy, long hp, unsigned char cl)
{
    TCmdGolem cmd;
    cmd.bCmd = 90; /* confirmed literal, NOT the ParseCmd-position-derived value */
    cmd._mx = mx;
    cmd._my = my;
    cmd._mdir = dir;
    cmd._menemy = menemy;
    cmd._mhitpoints = (short)hp;
    cmd._currlevel = (unsigned char)cl;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F744 MSG.CPP:900 */
void NetSendCmdLoc(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y)
{
    TCmdLoc cmd;
    cmd.bCmd = bCmd;
    cmd.x = x;
    cmd.y = y;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F774 MSG.CPP:916 */
void NetSendCmdLocParam1(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1)
{
    TCmdLocParam1 cmd;
    cmd.bCmd = bCmd;
    cmd.x = x;
    cmd.y = y;
    cmd.wParam1 = wParam1;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F7AC MSG.CPP:931 */
void NetSendCmdLocParam2(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1, unsigned short wParam2)
{
    TCmdLocParam2 cmd;
    cmd.bCmd = bCmd;
    cmd.x = x;
    cmd.y = y;
    cmd.wParam1 = wParam1;
    cmd.wParam2 = wParam2;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F7EC MSG.CPP:947 */
void NetSendCmdLocParam3(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y, unsigned short wParam1, unsigned short wParam2, unsigned short wParam3)
{
    TCmdLocParam3 cmd;
    cmd.bCmd = bCmd;
    cmd.x = x;
    cmd.y = y;
    cmd.wParam1 = wParam1;
    cmd.wParam2 = wParam2;
    cmd.wParam3 = wParam3;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F834 MSG.CPP:964 */
void NetSendCmdParam1(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1)
{
    TCmdParam1 cmd;
    cmd.bCmd = bCmd;
    cmd.wParam1 = wParam1;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F860 MSG.CPP:975 */
void NetSendCmdParam2(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1, unsigned short wParam2)
{
    TCmdParam2 cmd;
    cmd.bCmd = bCmd;
    cmd.wParam1 = wParam1;
    cmd.wParam2 = wParam2;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F890 MSG.CPP:986 */
void NetSendCmdParam3(unsigned char bHiPri, unsigned char bCmd, unsigned short wParam1, unsigned short wParam2, unsigned short wParam3)
{
    TCmdParam3 cmd;
    cmd.bCmd = bCmd;
    cmd.wParam1 = wParam1;
    cmd.wParam2 = wParam2;
    cmd.wParam3 = wParam3;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F8C8 MSG.CPP:998 */
void NetSendCmdQuest(unsigned char bHiPri, unsigned char q)
{
    TCmdQuest cmd;
    cmd.bCmd = 0x58; /* confirmed literal, NOT the ParseCmd-position-derived CMD_SYNCQUEST */
    cmd.q = q;
    cmd.qstate = quests[q]._qactive;
    cmd.qlog = quests[q]._qlog;
    cmd.qvar1 = quests[q]._qvar1;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004F93C MSG.CPP:1011 */
void NetSendCmdGItem(unsigned char bHiPri, unsigned char bCmd, unsigned char mast, unsigned char pnum, unsigned char ii)
{
    TCmdGItem cmd;
    cmd.bCmd = bCmd;
    cmd.bPnum = pnum;
    cmd.bMaster = mast;
    cmd.dwTime = 0;
    cmd.bCursitem = ii;
    cmd.bLevel = currlevel;
    cmd.x = item[ii]._ix;
    cmd.y = item[ii]._iy;
    cmd.wIndx = item[ii].IDidx;
    cmd.wCI = item[ii]._iCreateInfo;
    cmd.dwSeed = item[ii]._iSeed;
    cmd.bId = item[ii]._iIdentified;
    cmd.bDur = (unsigned char)item[ii]._iDurability;
    cmd.bMDur = (unsigned char)item[ii]._iMaxDur;
    cmd.bCh = item[ii]._iCharges;
    cmd.bMCh = item[ii]._iMaxCharges;
    cmd.wValue = (unsigned short)item[ii]._ivalue;
    /* dwBuff is really (long)(signed char)_iMagical, NOT _iFlags -- confirmed via the raw's `lb`
     * (signed byte load) + `sw` (sign-extended to a full word) sequence. */
    cmd.dwBuff = (signed char)item[ii]._iMagical;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004FA84 MSG.CPP:1069 */
void NetSendCmdGItem2(unsigned char usonly, unsigned char bCmd, unsigned char mast, unsigned char pnum, const TCmdGItem *p)
{
    TCmdGItem cmd = *p;
    cmd.bCmd = bCmd;
    cmd.bPnum = pnum;
    cmd.bMaster = mast;
    if (!usonly) {
        cmd.dwTime = 0;
        NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
    }
}

/* @0x8004FB08 MSG.CPP:1100 */
/* builds a local copy but never actually SENDS it (no NetSendLoPri call) -- dead-looking but that is
 * exactly what the raw does; always returns 1. */
unsigned char NetSendCmdReq2(unsigned char bCmd, unsigned char mast, unsigned char pnum, const TCmdGItem *p)
{
    TCmdGItem cmd = *p;
    cmd.bCmd = bCmd;
    cmd.bPnum = pnum;
    cmd.bMaster = mast;
    return 1;
}

/* @0x8004FB68 MSG.CPP:1126 */
void NetSendCmdExtra(const TCmdGItem *p)
{
    TCmdGItem cmd = *p;
    cmd.bCmd = 0x55; /* confirmed literal (not CMD_ITEMEXTRA's ParseCmd-position value) */
    cmd.dwTime = 0;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004FBD8 MSG.CPP:1138 -- reads plr[myplr].HoldItem (the currently-held/dragged item), NOT
 * item[_pcursitem] -- confirmed by the raw's plr+0x1910-relative offsets. */
void NetSendCmdPItem(unsigned char bHiPri, unsigned char bCmd, unsigned char x, unsigned char y)
{
    TCmdPItem cmd;
    cmd.bCmd = bCmd;
    cmd.x = x;
    cmd.y = y;
    cmd.wIndx = plr[myplr].HoldItem.IDidx;
    cmd.wCI = plr[myplr].HoldItem._iCreateInfo;
    cmd.dwSeed = plr[myplr].HoldItem._iSeed;
    cmd.bId = plr[myplr].HoldItem._iIdentified;
    cmd.bDur = plr[myplr].HoldItem._iDurability;
    cmd.bMDur = plr[myplr].HoldItem._iMaxDur;
    cmd.bCh = plr[myplr].HoldItem._iCharges;
    cmd.bMCh = plr[myplr].HoldItem._iMaxCharges;
    cmd.wValue = plr[myplr].HoldItem._ivalue;
    cmd.dwBuff = (signed char)plr[myplr].HoldItem._iMagical;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004FCF4 MSG.CPP:1192 -- bCmd param is UNUSED; the command byte is hardcoded 0x30 (CMD_CHANGEINVITEMS). */
void NetSendCmdChItem(unsigned char bHiPri, unsigned char bLoc)
{
    TCmdChItem cmd;
    cmd.bCmd = 0x30;
    cmd.bLoc = bLoc;
    cmd.wIndx = plr[myplr].HoldItem.IDidx;
    cmd.wCI = plr[myplr].HoldItem._iCreateInfo;
    cmd.dwSeed = plr[myplr].HoldItem._iSeed;
    cmd.bId = plr[myplr].HoldItem._iIdentified;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004FD98 MSG.CPP:1212 */
void NetSendCmdDelItem(unsigned char bHiPri, unsigned char bLoc)
{
    TCmdDelItem cmd;
    cmd.bCmd = 0x31; /* confirmed literal, bHiPri param unused */
    cmd.bLoc = bLoc;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004FDC8 MSG.CPP:1223 */
void NetSendCmdDItem(unsigned char bHiPri, int ii)
{
    TCmdPItem cmd;
    cmd.bCmd = 0x34; /* confirmed literal, bHiPri param unused */
    cmd.x = item[ii]._ix;
    cmd.y = item[ii]._iy;
    cmd.wIndx = item[ii].IDidx;
    cmd.wCI = item[ii]._iCreateInfo;
    cmd.dwSeed = item[ii]._iSeed;
    cmd.bId = item[ii]._iIdentified;
    cmd.bDur = item[ii]._iDurability;
    cmd.bMDur = item[ii]._iMaxDur;
    cmd.bCh = item[ii]._iCharges;
    cmd.bMCh = item[ii]._iMaxCharges;
    cmd.wValue = item[ii]._ivalue;
    cmd.dwBuff = (signed char)item[ii]._iMagical;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004FEF0 MSG.CPP:1274 */
BOOL i_own_level(int nReqLevel)
{
    return 1;
}

/* @0x8004FEF8 MSG.CPP:1296 */
void NetSendCmdDamage(unsigned char bHiPri, unsigned char bPlr, unsigned long dwDam)
{
    TCmdDamage cmd;
    cmd.bCmd = 0x32; /* confirmed literal, NOT the ParseCmd-position-derived CMD_PLRDAMAGE */
    cmd.bPlr = bPlr;
    cmd.dwDam = dwDam;
    NetSendLoPri((const unsigned char *)&cmd, sizeof(cmd));
}

/* @0x8004FF2C MSG.CPP:1339 */
void delta_close_portal(int pnum)
{
    memset(&sgJunk.portal[pnum], 0xFF, sizeof(sgJunk.portal[pnum]));
    sgbDeltaChanged = 1;
}

/* @0x8004FF6C MSG.CPP:1348 */
void check_update_plr(int pnum)
{
}

/* ============================================================================================= */
/* On_* command handlers. */

/* @0x8004FF74 MSG.CPP:1368 */
void On_WALKXY(const TCmd *pCmd, int pnum)
{
    const TCmdLoc *p = (const TCmdLoc *)pCmd;
    ClrPlrPath(pnum);
    MakePlrPath(pnum, p->x, p->y, 1);
    plr[pnum].destAction = -1;
}

/* @0x8004FFF4 MSG.CPP:1384 */
void On_ADDSTR(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    if (p->wParam1 <= 256)
        ModifyPlrStr(pnum, p->wParam1);
}

/* @0x80050024 MSG.CPP:1403 */
void On_ADDMAG(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    if (p->wParam1 <= 256)
        ModifyPlrMag(pnum, p->wParam1);
}

/* @0x80050054 MSG.CPP:1416 */
void On_ADDDEX(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    if (p->wParam1 <= 256)
        ModifyPlrDex(pnum, p->wParam1);
}

/* @0x80050084 MSG.CPP:1435 */
void On_ADDVIT(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    if (p->wParam1 <= 256)
        ModifyPlrVit(pnum, p->wParam1);
}

/* @0x800500B4 MSG.CPP:1454 -- sets a spellbook-cast destAction (0xC) using the spell id/type
 * (cmd->wParam1) and the PLAYER's own currently-set splType (plr[pnum]._pSplType), not the cmd's. */
void On_SBSPELL(const TCmd *pCmd, int pnum)
{
    plr[pnum]._pSplFrom = 1;
    plr[pnum].destAction = 0xC;
    plr[pnum]._pSpell = (char)((const TCmdParam1 *)pCmd)->wParam1;
    plr[pnum]._pSplType = plr[pnum]._pRSplType;
}

/* @0x80050128 MSG.CPP:1469 */
void On_GOTOGETITEM(const TCmd *pCmd, int pnum)
{
    const TCmdLocParam1 *p = (const TCmdLocParam1 *)pCmd;
    MakePlrPath(pnum, p->x, p->y, 0);
    plr[pnum].destAction = ACTION_WALK;
    plr[pnum].destParam1 = (char)p->wParam1;
}

/* @0x800504C4 MSG.CPP:1589 */
void On_GOTOAGETITEM(const TCmd *pCmd, int pnum)
{
    const TCmdLocParam1 *p = (const TCmdLocParam1 *)pCmd;
    MakePlrPath(pnum, p->x, p->y, 0);
    plr[pnum].destAction = ACTION_PICKUPITEM;
    plr[pnum].destParam1 = (char)p->wParam1;
}

/* @0x800501B0 MSG.CPP:1482 */
void On_REQUESTGITEM(const TCmd *pCmd, int pnum)
{
    const TCmdGItem *p = (const TCmdGItem *)pCmd;
    unsigned char own = i_own_level(plr[pnum].plrlevel);
    if (own) {
        int ii = FindGetItem(p->wIndx, p->wCI, p->dwSeed);
        if (ii != -1) {
            NetSendCmdGItem2(0, 8, myplr, p->bPnum, p);
            if (p->bPnum != myplr)
                SyncGetItem(p->x, p->y, p->wIndx, p->wCI, p->dwSeed);
            else
                InvGetItem(p->bPnum, ii);
        } else {
            if (!NetSendCmdReq2(0x27, myplr, p->bPnum, p))
                NetSendCmdExtra(p);
        }
    }
}

/* @0x800502F0 MSG.CPP:1532 -- re-derived instruction-by-instruction from the raw (the deepest branch
 * tree in the TU): the "currlevel==bLevel" skip and the "bMaster==myplr => do nothing" gate are BOTH
 * real, and the not-mine SyncGetItem echo re-reads wIndx from a register that survived from the
 * bPnum check (not the bLevel-equal arm at all) -- goto/labels used to guarantee the exact retail
 * block layout rather than risk the compiler re-threading an equivalent if/else differently. */
void On_GETITEM(const TCmd *pCmd, int pnum)
{
    const TCmdGItem *p = (const TCmdGItem *)pCmd;
    int nIndex = FindGetItem(p->wIndx, p->wCI, p->dwSeed);
    unsigned char ok = delta_get_item(p, p->bLevel);
    if (ok) {
        if (currlevel == p->bLevel || p->bPnum == myplr) {
            if (p->bMaster == myplr) {
                /* item already picked up -- nothing to do */
            } else if (p->bPnum == myplr) {
                if (currlevel != p->bLevel) {
                    int hitem = SyncPutItem(p->bPnum, plr[p->bPnum]._px, plr[p->bPnum]._py, p->wIndx, p->wCI,
                                             p->dwSeed, p->bId, p->bDur, p->bMDur, p->bCh, p->bMCh, p->wValue,
                                             p->dwBuff);
                    if (hitem != -1)
                        InvGetItem(myplr, hitem);
                } else {
                    InvGetItem(myplr, nIndex);
                }
            } else {
                SyncGetItem(p->x, p->y, p->wIndx, p->wCI, p->dwSeed);
            }
        }
    } else {
        NetSendCmdGItem2(1, 8, p->bMaster, p->bPnum, p);
    }
}

/* @0x8005054C MSG.CPP:1603 -- twin of On_REQUESTGITEM for the auto-pickup path (bCmd 9/0x27 reused). */
void On_REQUESTAGITEM(const TCmd *pCmd, int pnum)
{
    const TCmdGItem *p = (const TCmdGItem *)pCmd;
    unsigned char own = i_own_level(plr[pnum].plrlevel);
    if (own) {
        int ii = FindGetItem(p->wIndx, p->wCI, p->dwSeed);
        if (ii != -1) {
            NetSendCmdGItem2(0, 9, myplr, p->bPnum, p);
            if (p->bPnum != myplr)
                SyncGetItem(p->x, p->y, p->wIndx, p->wCI, p->dwSeed);
            else
                AutoGetItem(p->bPnum, p->bCursitem);
        } else {
            if (!NetSendCmdReq2(0x28, myplr, p->bPnum, p))
                NetSendCmdExtra(p);
        }
    }
}

/* @0x80050680 MSG.CPP:1654 -- re-derived instruction-by-instruction like On_GETITEM: same branch
 * skeleton (delta_get_item gate / currlevel-vs-bLevel / bMaster==myplr no-op / bPnum-not-mine echo),
 * but the currlevel==bLevel direct-pickup arm calls AutoGetItem(bPnum,bCursitem) -- NOT ii -- while
 * the SyncPutItem fallback arm still calls AutoGetItem(myplr,result) same as On_GETITEM's InvGetItem. */
void On_AGETITEM(const TCmd *pCmd, int pnum)
{
    const TCmdGItem *p = (const TCmdGItem *)pCmd;
    FindGetItem(p->wIndx, p->wCI, p->dwSeed);
    unsigned char ok = delta_get_item(p, p->bLevel);
    if (ok) {
        if (currlevel == p->bLevel || p->bPnum == myplr) {
            if (p->bMaster == myplr) {
                /* item already picked up -- nothing to do */
            } else if (p->bPnum == myplr) {
                if (currlevel != p->bLevel) {
                    int hitem = SyncPutItem(p->bPnum, plr[p->bPnum]._px, plr[p->bPnum]._py, p->wIndx, p->wCI,
                                             p->dwSeed, p->bId, p->bDur, p->bMDur, p->bCh, p->bMCh, p->wValue,
                                             p->dwBuff);
                    if (hitem != -1)
                        AutoGetItem(myplr, hitem);
                } else {
                    AutoGetItem(myplr, p->bCursitem);
                }
            } else {
                SyncGetItem(p->x, p->y, p->wIndx, p->wCI, p->dwSeed);
            }
        }
    } else {
        NetSendCmdGItem2(1, 9, p->bMaster, p->bPnum, p);
    }
}

/* @0x8005084C MSG.CPP:1717 */
void On_ITEMEXTRA(const TCmd *pCmd, int pnum)
{
    const TCmdGItem *p = (const TCmdGItem *)pCmd;
    delta_get_item(p, p->bLevel);
    SyncGetItem(p->x, p->y, p->wIndx, p->wCI, p->dwSeed);
}

/* @0x80051080 MSG.CPP:1971 */
void On_OPOBJT(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    plr[pnum].destAction = ACTION_OPERATE;
    plr[pnum].destParam1 = (char)p->wParam1;
}

/* local cmd shapes for the spell-cast family (not separately SYM-named; read straight off the byte
 * offsets in the raw -- XY-targeted casts carry x/y bytes + 3 u16 params, ID-targeted casts carry
 * only a target-id u16 + 2 more u16 params, both padded to 2-byte alignment after bCmd). */
struct TCmdSpellXY { unsigned char bCmd, x, y, _pad; unsigned short wParam1, wParam2, wParam3; };
struct TCmdSpellID { unsigned char bCmd, _pad; unsigned short wParam1, wParam2, wParam3; };

/* @0x80050B98 MSG.CPP:1851 */
void On_SATTACKXY(const TCmd *pCmd, int pnum)
{
    const TCmdLoc *p = (const TCmdLoc *)pCmd;
    ClrPlrPath(pnum);
    plr[pnum].destAction = 9;
    plr[pnum].destParam1 = (char)p->x;
    plr[pnum].destParam2 = (char)p->y;
}

/* @0x80050C24 MSG.CPP:1866 */
void On_SPELLXYD(const TCmd *pCmd, int pnum)
{
    const int spell = ((const TCmdSpellXY *)pCmd)->wParam1;
    ClrPlrPath(pnum);
    plr[pnum].destAction = 0x1A;
    plr[pnum]._pSplFrom = 0;
    plr[pnum].destParam1 = (char)((const TCmdSpellXY *)pCmd)->x;
    plr[pnum].destParam2 = (char)((const TCmdSpellXY *)pCmd)->y;
    plr[pnum].destParam3 = (char)((const TCmdSpellXY *)pCmd)->wParam2;
    plr[pnum].destParam4 = (char)((const TCmdSpellXY *)pCmd)->wParam3;
    plr[pnum]._pSpell = (char)spell;
    plr[pnum]._pSplType = plr[pnum]._pRSplType;
}

/* @0x80050D0C MSG.CPP:1890 */
void On_SPELLXY(const TCmd *pCmd, int pnum)
{
    const TCmdSpellXY *const p = (const TCmdSpellXY *)pCmd;
    const int spell = p->wParam1;
    ClrPlrPath(pnum);
    plr[pnum].destAction = 0xC;
    plr[pnum]._pSplFrom = 0;
    plr[pnum].destParam1 = (char)p->x;
    plr[pnum].destParam2 = (char)p->y;
    plr[pnum].destParam3 = (char)p->wParam2;
    plr[pnum]._pSpell = (char)spell;
    plr[pnum]._pSplType = plr[pnum]._pRSplType;
}

/* @0x80050DE4 MSG.CPP:1912 */
void On_TSPELLXY(const TCmd *pCmd, int pnum)
{
    const TCmdSpellXY *const p = (const TCmdSpellXY *)pCmd;
    const int spell = p->wParam1;
    ClrPlrPath(pnum);
    plr[pnum].destAction = 0xC;
    plr[pnum]._pSplFrom = 2;
    plr[pnum].destParam1 = (char)p->x;
    plr[pnum].destParam2 = (char)p->y;
    plr[pnum].destParam3 = (char)p->wParam2;
    plr[pnum]._pSpell = (char)spell;
    plr[pnum]._pSplType = plr[pnum]._pTSplType;
}

/* @0x80051208 MSG.CPP:2003 */
void On_SPELLID(const TCmd *pCmd, int pnum)
{
    const TCmdSpellID *const p = (const TCmdSpellID *)pCmd;
    const int spell = p->wParam2;
    ClrPlrPath(pnum);
    plr[pnum].destAction = 0x18;
    plr[pnum]._pSplFrom = 0;
    plr[pnum].destParam1 = (char)p->wParam1;
    plr[pnum].destParam2 = (char)p->wParam3;
    plr[pnum]._pSpell = (char)spell;
    plr[pnum]._pSplType = plr[pnum]._pRSplType;
}

/* @0x800512D0 MSG.CPP:2024 */
void On_SPELLPID(const TCmd *pCmd, int pnum)
{
    const TCmdSpellID *p = (const TCmdSpellID *)pCmd;
    ClrPlrPath(pnum);
    plr[pnum].destAction = 0x19;
    plr[pnum]._pSplFrom = 0;
    plr[pnum].destParam1 = (char)p->wParam1;
    plr[pnum].destParam2 = (char)p->wParam3;
    plr[pnum]._pSpell = (char)p->wParam2;
    plr[pnum]._pSplType = plr[pnum]._pRSplType;
}

/* @0x80051390 MSG.CPP:2043 */
void On_TSPELLID(const TCmd *pCmd, int pnum)
{
    const TCmdSpellID *p = (const TCmdSpellID *)pCmd;
    ClrPlrPath(pnum);
    plr[pnum].destAction = 0x18;
    plr[pnum]._pSplFrom = 2;
    plr[pnum].destParam1 = (char)p->wParam1;
    plr[pnum].destParam2 = (char)p->wParam3;
    plr[pnum]._pSpell = (char)p->wParam2;
    plr[pnum]._pSplType = plr[pnum]._pTSplType;
}

/* @0x80051454 MSG.CPP:2060 */
void On_TSPELLPID(const TCmd *pCmd, int pnum)
{
    const TCmdSpellID *p = (const TCmdSpellID *)pCmd;
    ClrPlrPath(pnum);
    plr[pnum].destAction = 0x19;
    plr[pnum]._pSplFrom = 2;
    plr[pnum].destParam1 = (char)p->wParam1;
    plr[pnum].destParam2 = (char)p->wParam3;
    plr[pnum]._pSpell = (char)p->wParam2;
    plr[pnum]._pSplType = plr[pnum]._pTSplType;
}

/* @0x800515D4 MSG.CPP:2091 */
void On_RESURRECT(const TCmd *pCmd, int pnum)
{
    DoResurrect(pnum, ((const TCmdParam1 *)pCmd)->wParam1);
    check_update_plr(pnum);
}

/* @0x8005160C MSG.CPP:2101 */
void On_HEALOTHER(const TCmd *pCmd, int pnum)
{
    DoHealOther(pnum, ((const TCmdParam1 *)pCmd)->wParam1);
}

/* @0x80051634 MSG.CPP:2112 */
void On_TALKXY(const TCmd *pCmd, int pnum)
{
    const TCmdLocParam1 *p = (const TCmdLocParam1 *)pCmd;
    MakePlrPath(pnum, p->x, p->y, 0);
    plr[pnum].destAction = 0x11;
    plr[pnum].destParam1 = (char)p->wParam1;
}

/* @0x800516BC MSG.CPP:2127 */
void On_NEWLVL(const TCmd *pCmd, int pnum)
{
    const TCmdParam2 *p = (const TCmdParam2 *)pCmd;
    StartNewLvl(pnum, p->wParam1, p->wParam2);
}

/* @0x800516EC MSG.CPP:2138 -- the item-recovery tail only runs for pnum==myplr (the raw skips the
 * whole rest of the fn when pnum!=myplr) AND only when the cursor is holding an item
 * (_pcurs[pnum] >= 12); item[127] is the reconstructed "held item" spare slot (the memcpy of
 * plr[myplr].HoldItem @+0x1910, sizeof(ItemStruct)=0x64, into item + 0x64*127 = item+0x3194...
 * matches the observed +0x3594 dest only if ItemStruct is 0x6C; kept as item[127] via HoldItem
 * assignment, which is codegen-equivalent to the raw block-copy loop for a POD struct). */
void On_WARP(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    InitGamePadVars();
    PA_SetPauseOk(0);
    FadeGameOut();
    StartWarpLvl(pnum, p->wParam1);
    TeleStop(pnum);
    if (pnum == myplr && _pcurs[pnum] >= 12) {
        item[127] = plr[myplr].HoldItem;
        AutoGetItem(myplr, 127);
    }
}

/* @0x80051800 MSG.CPP:2161 */
void On_MONSTDEATH(const TCmd *pCmd, int pnum)
{
    const TCmdLocParam1 *p = (const TCmdLocParam1 *)pCmd;
    if (pnum != myplr) {
        int dummy1;
        if (currlevel == plr[pnum].plrlevel)
            M_SyncStartKill(p->wParam1, p->x, p->y, pnum);
        delta_kill_monster(p->wParam1, p->x, p->y, plr[pnum].plrlevel);
    }
}

/* @0x800518B4 MSG.CPP:2174 -- golem monster index == owning player index (golem slots 0..1). */
void On_KILLGOLEM(const TCmd *pCmd, int pnum)
{
    const TCmdLoc *p = (const TCmdLoc *)pCmd;
    if (pnum != myplr) {
        unsigned char bLevel = plr[pnum].plrlevel;
        delta_kill_monster(pnum, p->x, p->y, bLevel);
    }
}

/* @0x80051920 MSG.CPP:2187 -- spawn/refresh the awakened golem missile unless one already targets
 * this player's golem (the loop over missileactive[] guards against a duplicate MIS_GOLEM(0x21)). */
void On_AWAKEGOLEM(const TCmd *pCmd, int pnum)
{
    {
    if (pnum != myplr) {
        unsigned char addok = 1;
        for (int i = 0; i < nummissiles; i++) {
            int mi = missileactive[i];
            if (missile[mi]._mitype == 0x21 && missile[mi]._misource == pnum)
                addok = 0;
        }
        if (addok)
            AddMissile(plr[pnum]._px, plr[pnum]._py, ((const TCmdGolem *)pCmd)->_mx, ((const TCmdGolem *)pCmd)->_my, ((const TCmdGolem *)pCmd)->_mdir, 0x21, 0, pnum, 0, 1);
    }
    }
}

/* @0x80051A40 MSG.CPP:2216 */
void On_MONSTDAMAGE(const TCmd *pCmd, int pnum)
{
    if (pnum != myplr) {
        int dummy1;
        monster[((const TCmdParam2 *)pCmd)->wParam1].mWhoHit |= (1 << pnum);
        if (monster[((const TCmdParam2 *)pCmd)->wParam1]._mhitpoints != 0) {
            monster[((const TCmdParam2 *)pCmd)->wParam1]._mhitpoints -= ((const TCmdParam2 *)pCmd)->wParam2;
            if ((monster[((const TCmdParam2 *)pCmd)->wParam1]._mhitpoints >> 6) <= 0)
                monster[((const TCmdParam2 *)pCmd)->wParam1]._mhitpoints = 0x40;
            delta_monster_hp(((const TCmdParam2 *)pCmd)->wParam1,
                              monster[((const TCmdParam2 *)pCmd)->wParam1]._mhitpoints, plr[pnum].plrlevel);
        }
    }
}

/* @0x80051B30 MSG.CPP:2246 */
void On_PLRDEAD(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    if (pnum != myplr) {
        unsigned short rid = p->wParam1;
        SyncPlrKill(pnum, rid);
    } else {
        check_update_plr(pnum);
    }
}

/* @0x80051B78 MSG.CPP:2260 -- damage-over-time application to another player, clamped against a
 * received-vs-buffered ordering check (gbBufferMsgs) and a 0x2EE00 (fixed-point) sanity bound. */
void On_PLRDAMAGE(const TCmd *pCmd, int pnum)
{
    /* the delta is applied to plr[pCmd->bPlr] (the player index embedded in the COMMAND), but the
     * kill-check right below is against plr[pnum] (ParseCmd's own index) -- confirmed asymmetry,
     * both read straight off the raw. retail's SYM has exactly one named local ('player'); no
     * separate TCmdDamage* pointer -- every command field is an inline pCmd cast. */
    PlayerStruct *player = &plr[((const TCmdDamage *)pCmd)->bPlr];
    if (currlevel != 0 && gbBufferMsgs != 1 && currlevel == player->plrlevel &&
        ((const TCmdDamage *)pCmd)->dwDam <= 0x2EE00) {
        if ((player->_pHitPoints >> 6) > 0) {
            player->_pHitPoints -= ((const TCmdDamage *)pCmd)->dwDam;
            player->_pHPBase -= ((const TCmdDamage *)pCmd)->dwDam;
            if (player->_pHitPoints > player->_pMaxHP) {
                player->_pHitPoints = player->_pMaxHP;
                player->_pHPBase = player->_pMaxHPBase;
            }
            if ((plr[pnum]._pHitPoints >> 6) <= 0)
                StartPlrKill(&plr[pnum], 1);
        }
    }
}

/* @0x80050EC0 MSG.CPP:1934 */
void On_OPOBJXY(const TCmd *pCmd, int pnum)
{
    const TCmdLocParam1 *p = (const TCmdLocParam1 *)pCmd;
    if (object[p->wParam1]._oSolidFlag == 0 && object[p->wParam1]._oDoorFlag == 0)
        MakePlrPath(pnum, p->x, p->y, 1);
    else
        MakePlrPath(pnum, p->x, p->y, 0);
    plr[pnum].destAction = 0xD;
    plr[pnum].destParam1 = (char)p->wParam1;
}

/* @0x80050FA0 MSG.CPP:1952 */
void On_DISARMXY(const TCmd *pCmd, int pnum)
{
    const TCmdLocParam1 *p = (const TCmdLocParam1 *)pCmd;
    if (object[p->wParam1]._oSolidFlag == 0 && object[p->wParam1]._oDoorFlag == 0)
        MakePlrPath(pnum, p->x, p->y, 1);
    else
        MakePlrPath(pnum, p->x, p->y, 0);
    plr[pnum].destAction = 0xE;
    plr[pnum].destParam1 = (char)p->wParam1;
}

/* @0x800510CC MSG.CPP:1984 */
void On_ATTACKID(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    int dx = abs(plr[pnum]._px - monster[p->wParam1]._mfutx);
    int dy = abs(plr[pnum]._py - monster[p->wParam1]._mfuty);
    if (dx >= 2 || dy >= 2)
        MakePlrPath(pnum, monster[p->wParam1]._mfutx, monster[p->wParam1]._mfuty, 0);
    plr[pnum].destAction = 0x14;
    plr[pnum].destParam1 = (char)p->wParam1;
}

/* @0x80051518 MSG.CPP:2078 */
void On_KNOCKBACK(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    int dir = GetDirection(plr[pnum]._px, plr[pnum]._py, monster[p->wParam1]._mx, monster[p->wParam1]._my);
    M_GetKnockback(p->wParam1, dir);
    M_StartHit(p->wParam1, pnum, 0);
}

/* @0x80051C8C MSG.CPP:2323 -- the literal 0x2B passed to SyncOpObject/delta_sync_object is NOT this
 * command's own ParseCmd dispatch id (41) -- it is a distinct object-action constant (OPENDOOR=0x2B,
 * CLOSEDOOR=0x2C, OPERATEOBJ=0x2D, PLROPOBJ=0x2E, BREAKOBJ=0x2F below), read straight off the raw
 * immediates since it doesn't correlate with the CMD_* dispatch numbering above. */
void On_OPENDOOR(const TCmd *pCmd, int pnum)
{
    SyncOpObject(pnum, 0x2B, ((const TCmdParam1 *)pCmd)->wParam1);
    delta_sync_object(((const TCmdParam1 *)pCmd)->wParam1, 0x2B, plr[pnum].plrlevel);
}

/* @0x80051D08 MSG.CPP:2336 */
void On_CLOSEDOOR(const TCmd *pCmd, int pnum)
{
    SyncOpObject(pnum, 0x2C, ((const TCmdParam1 *)pCmd)->wParam1);
    delta_sync_object(((const TCmdParam1 *)pCmd)->wParam1, 0x2C, plr[pnum].plrlevel);
}

/* @0x80051D84 MSG.CPP:2349 */
void On_OPERATEOBJ(const TCmd *pCmd, int pnum)
{
    SyncOpObject(pnum, 0x2D, ((const TCmdParam1 *)pCmd)->wParam1);
    delta_sync_object(((const TCmdParam1 *)pCmd)->wParam1, 0x2D, plr[pnum].plrlevel);
}

/* @0x80051E00 MSG.CPP:2362 -- TCmdParam2 shape (wParam1@+2 = the acting player index embedded in
 * the command, wParam2@+4 = oi); SyncOpObject's pnum arg comes from the COMMAND, not ParseCmd's pnum. */
void On_PLROPOBJ(const TCmd *pCmd, int pnum)
{
    const TCmdParam2 *p = (const TCmdParam2 *)pCmd;
    SyncOpObject(p->wParam1, 0x2E, p->wParam2);
    delta_sync_object(p->wParam2, 0x2E, plr[pnum].plrlevel);
}

/* @0x80051E7C MSG.CPP:2374 -- both SyncBreakObj args come from the command (TCmdParam2 shape:
 * wParam1@+2, wParam2@+4), NOT from the ParseCmd pnum -- the raw never reads pnum before the call. */
void On_BREAKOBJ(const TCmd *pCmd, int pnum)
{
    const TCmdParam2 *p = (const TCmdParam2 *)pCmd;
    SyncBreakObj(p->wParam1, p->wParam2);
    delta_sync_object(p->wParam2, 0x2F, plr[pnum].plrlevel);
}

/* @0x80050898 MSG.CPP:1741 */
void On_PUTITEM(const TCmd *pCmd, int pnum)
{
    const TCmdPItem *p = (const TCmdPItem *)pCmd;
    if (numitems >= 0x7A) {
        PlaySFX(0x3D3);
        return;
    }
    int ii = InvPutItem(pnum, p->x, p->y);
    if (ii != -1) {
        delta_put_item(p, item[ii]._ix, item[ii]._iy, plr[pnum].plrlevel);
        check_update_plr(pnum);
    }
    check_update_plr(pnum);
}

/* @0x80050978 MSG.CPP:1795 -- re-derived from the raw: check_update_plr(pnum) is ALWAYS called after
 * a successful SyncPutItem (was previously missing), same "delta_put_item echoes the placed item's
 * own _ix/_iy" pattern as On_PUTITEM. */
void On_SYNCPUTITEM(const TCmd *pCmd, int pnum)
{
    const TCmdPItem *p = (const TCmdPItem *)pCmd;
    int ii = SyncPutItem(pnum, p->x, p->y, p->wIndx, p->wCI, p->dwSeed, p->bId, p->bDur, p->bMDur, p->bCh, p->bMCh, p->wValue, p->dwBuff);
    if (ii != -1) {
        delta_put_item(p, item[ii]._ix, item[ii]._iy, plr[pnum].plrlevel);
        check_update_plr(pnum);
    }
}

/* @0x80050A7C MSG.CPP:1794 -- re-derived from the raw: a plrlevel==currlevel gate wraps the
 * SyncPutItem echo (previously missing), and delta_put_item is ALWAYS called afterward regardless
 * of that gate, with the target player's (unsigned char)plrlevel as the bLevel arg. */
void On_RESPAWNITEM(const TCmd *pCmd, int pnum)
{
    const TCmdPItem *p = (const TCmdPItem *)pCmd;
    if (currlevel == plr[pnum].plrlevel) {
        if (pnum != myplr)
            SyncPutItem(pnum, p->x, p->y, p->wIndx, p->wCI, p->dwSeed, p->bId, p->bDur, p->bMDur, p->bCh, p->bMCh,
                        p->wValue, p->dwBuff);
    }
    delta_put_item(p, p->x, p->y, (unsigned char)plr[pnum].plrlevel);
}

/* @0x80051F64 MSG.CPP:2428 -- UNVERIFIED (fsize 32, non-trivial fn not individually re-derived);
 * best-effort from devilution's On_PLAYER_JOINLEVEL (a remote player's PlayerStruct sync marker --
 * marks them active on our copy of their slot and re-syncs their local-visibility state). */
void On_PLAYER_JOINLEVEL(const TCmd *pCmd, int pnum)
{
    plr[pnum]._pLvlChanging = 0;
    if (plr[pnum].plractive && pnum) {
        const TCmdLocParam1 *p = (const TCmdLocParam1 *)pCmd;
        plr[pnum]._pGFXLoad = 0;
        plr[pnum]._px = p->x;
        plr[pnum]._py = p->y;
        plr[pnum].plrlevel = p->wParam1;
        SyncInitPlr(pnum);
        if ((plr[pnum]._pHitPoints >> 6) > 0) {
            StartStand(pnum, 0);
        } else {
            plr[pnum]._pgfxnum = 0;
            plr[pnum]._pmode = (enum PLR_MODE)8;
            NewPlrAnim(pnum, 1, plr[pnum]._pDFrames, 1);
            plr[pnum]._pAnimFrame = plr[pnum]._pAnimLen - 1;
            plr[pnum]._pVar8 = plr[pnum]._pAnimLen * 2;
        }
        if (plr[pnum]._pvid == -1)
            plr[pnum]._pvid = (char)AddVision(plr[pnum]._px, plr[pnum]._py, 10, pnum);
        gbActivePlayers = 0;
        if (plr[0].plractive)
            gbActivePlayers = 1;
        if (plr[1].plractive)
            gbActivePlayers = gbActivePlayers + 1;
    }
}

/* @0x8005216C MSG.CPP:2487 -- UNVERIFIED. */
void On_ACTIVATEPORTAL(const TCmd *pCmd, int pnum)
{
    const TCmdLocParam3 *p = (const TCmdLocParam3 *)pCmd;
    ActivatePortal(pnum, p->x, p->y, p->wParam1, p->wParam2, (unsigned char)p->wParam3);
}

/* @0x800521B0 MSG.CPP:2526 -- UNVERIFIED. */
/* @0x800521B0 MSG.CPP:2494 -- re-derived: pnum is unused for anything BUT reused in place as the
 * 0..1 portal-index loop counter (SYM lists it at s0, matching the raw's loop register). */
void On_DEACTIVATEPORTAL(const TCmd *pCmd, int pnum)
{
    for (pnum = 0; pnum < 2; pnum++) {
        if (PortalOnLevel(pnum))
            RemovePortalMissile(pnum);
        DeactivatePortal(pnum);
        delta_close_portal(pnum);
    }
}

/* @0x80052210 MSG.CPP:2542 -- UNVERIFIED. */
void On_RETOWN(const TCmd *pCmd, int pnum)
{
    if (pnum == myplr)
        deathflag = 0;
    RestartTownLvl(pnum);
}

/* @0x80052390 MSG.CPP:2624 -- UNVERIFIED (fsize 40, not individually re-derived). */
void On_ENDSHIELD(const TCmd *pCmd, int pnum)
{
    if (pnum != myplr) {
        for (int i = 0; i < nummissiles; i++) {
            int mi = missileactive[i];
            if (missile[mi]._mitype == 0xD && missile[mi]._misource == pnum) {
                ClearMissileSpot(mi);
                DeleteMissile(mi, i);
            }
        }
    }
}

/* @0x80051EF4 MSG.CPP:2385 -- no-op: PSX has no cross-player inventory transfer command. */
void On_CHANGEPLRITEMS(const TCmd *pCmd, int pnum)
{
}

/* @0x80051EFC MSG.CPP:2398 -- no-op. */
void On_DELPLRITEMS(const TCmd *pCmd, int pnum)
{
}

/* @0x80051F04 MSG.CPP:2406 -- no-op. */
void On_PLRLEVEL(const TCmd *pCmd, int pnum)
{
}

/* @0x80051F0C MSG.CPP:2417 */
void On_DROPITEM(const TCmd *pCmd, int pnum)
{
    const TCmdPItem *p = (const TCmdPItem *)pCmd;
    delta_put_item(p, p->x, p->y, plr[pnum].plrlevel);
}

/* @0x80052248 MSG.CPP:2555 */
void On_SETSTR(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    if (p->wParam1 < 0x2EF && pnum != myplr)
        SetPlrStr(pnum, p->wParam1);
}

/* @0x80052288 MSG.CPP:2568 */
void On_SETDEX(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    if (p->wParam1 < 0x2EF && pnum != myplr)
        SetPlrDex(pnum, p->wParam1);
}

/* @0x800522C8 MSG.CPP:2582 */
void On_SETMAG(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    if (p->wParam1 < 0x2EF && pnum != myplr)
        SetPlrMag(pnum, p->wParam1);
}

/* @0x80052308 MSG.CPP:2596 */
void On_SETVIT(const TCmd *pCmd, int pnum)
{
    const TCmdParam1 *p = (const TCmdParam1 *)pCmd;
    if (p->wParam1 < 0x2EF && pnum != myplr)
        SetPlrVit(pnum, p->wParam1);
}

/* @0x80052348 MSG.CPP:2610 */
void On_SYNCQUEST(const TCmd *pCmd, int pnum)
{
    const TCmdQuest *p = (const TCmdQuest *)pCmd;
    if (pnum != myplr) {
        int dummy1;
        SetMultiQuest(p->q, p->qstate, p->qlog, p->qvar1);
    }
    sgbDeltaChanged = 1;
}

/* @0x80052468 MSG.CPP:2676 -- bare switch(pCmd->bCmd) dispatch; no bLen/plractive validation.
 * Case order and CMD_ values are read directly from jtbl_80116868 (see the #defines above). */
int ParseCmd(int pnum, const TCmd *pCmd)
{
    static unsigned char sbLastCmd;
    sbLastCmd = pCmd->bCmd;
    switch (pCmd->bCmd) {
    case CMD_ON_WALKXY:        On_WALKXY(pCmd, pnum); break;
    case CMD_ADDSTR:           On_ADDSTR(pCmd, pnum); break;
    case CMD_ADDDEX:           On_ADDDEX(pCmd, pnum); break;
    case CMD_ADDMAG:           On_ADDMAG(pCmd, pnum); break;
    case CMD_ADDVIT:           On_ADDVIT(pCmd, pnum); break;
    case CMD_SBSPELL:          On_SBSPELL(pCmd, pnum); break;
    case CMD_GOTOGETITEM:      On_GOTOGETITEM(pCmd, pnum); break;
    case CMD_REQUESTGITEM:     On_REQUESTGITEM(pCmd, pnum); break;
    case CMD_GETITEM:          On_GETITEM(pCmd, pnum); break;
    case CMD_GOTOAGETITEM:     On_GOTOAGETITEM(pCmd, pnum); break;
    case CMD_REQUESTAGITEM:    On_REQUESTAGITEM(pCmd, pnum); break;
    case CMD_AGETITEM:         On_AGETITEM(pCmd, pnum); break;
    case CMD_ITEMEXTRA:        On_ITEMEXTRA(pCmd, pnum); break;
    case CMD_PUTITEM:          On_PUTITEM(pCmd, pnum); break;
    case CMD_SYNCPUTITEM:      On_SYNCPUTITEM(pCmd, pnum); break;
    case CMD_RESPAWNITEM:      On_RESPAWNITEM(pCmd, pnum); break;
    case CMD_SATTACKXY:        On_SATTACKXY(pCmd, pnum); break;
    case CMD_SPELLXYD:         On_SPELLXYD(pCmd, pnum); break;
    case CMD_SPELLXY:          On_SPELLXY(pCmd, pnum); break;
    case CMD_TSPELLXY:         On_TSPELLXY(pCmd, pnum); break;
    case CMD_OPOBJXY:          On_OPOBJXY(pCmd, pnum); break;
    case CMD_DISARMXY:         On_DISARMXY(pCmd, pnum); break;
    case CMD_OPOBJT:           On_OPOBJT(pCmd, pnum); break;
    case CMD_ATTACKID:         On_ATTACKID(pCmd, pnum); break;
    case CMD_SPELLID:          On_SPELLID(pCmd, pnum); break;
    case CMD_SPELLPID:         On_SPELLPID(pCmd, pnum); break;
    case CMD_TSPELLID:         On_TSPELLID(pCmd, pnum); break;
    case CMD_TSPELLPID:        On_TSPELLPID(pCmd, pnum); break;
    case CMD_KNOCKBACK:        On_KNOCKBACK(pCmd, pnum); break;
    case CMD_RESURRECT:        On_RESURRECT(pCmd, pnum); break;
    case CMD_HEALOTHER:        On_HEALOTHER(pCmd, pnum); break;
    case CMD_TALKXY:           On_TALKXY(pCmd, pnum); break;
    case CMD_NEWLVL:           On_NEWLVL(pCmd, pnum); break;
    case CMD_WARP:             On_WARP(pCmd, pnum); break;
    case CMD_MONSTDEATH:       On_MONSTDEATH(pCmd, pnum); break;
    case CMD_KILLGOLEM:        On_KILLGOLEM(pCmd, pnum); break;
    case CMD_AWAKEGOLEM:       On_AWAKEGOLEM(pCmd, pnum); break;
    case CMD_MONSTDAMAGE:      On_MONSTDAMAGE(pCmd, pnum); break;
    case CMD_PLRDEAD:          On_PLRDEAD(pCmd, pnum); break;
    case CMD_PLRDAMAGE:        On_PLRDAMAGE(pCmd, pnum); break;
    case CMD_OPENDOOR:         On_OPENDOOR(pCmd, pnum); break;
    case CMD_CLOSEDOOR:        On_CLOSEDOOR(pCmd, pnum); break;
    case CMD_OPERATEOBJ:       On_OPERATEOBJ(pCmd, pnum); break;
    case CMD_PLROPOBJ:         On_PLROPOBJ(pCmd, pnum); break;
    case CMD_BREAKOBJ:         On_BREAKOBJ(pCmd, pnum); break;
    case CMD_CHANGEPLRITEMS:   On_CHANGEPLRITEMS(pCmd, pnum); break;
    case CMD_DELPLRITEMS:      On_DELPLRITEMS(pCmd, pnum); break;
    case CMD_PLRLEVEL:         On_PLRLEVEL(pCmd, pnum); break;
    case CMD_DROPITEM:         On_DROPITEM(pCmd, pnum); break;
    case CMD_PLAYER_JOINLEVEL: On_PLAYER_JOINLEVEL(pCmd, pnum); break;
    case CMD_ACTIVATEPORTAL:   On_ACTIVATEPORTAL(pCmd, pnum); break;
    case CMD_DEACTIVATEPORTAL: On_DEACTIVATEPORTAL(pCmd, pnum); break;
    case CMD_RETOWN:           On_RETOWN(pCmd, pnum); break;
    case CMD_SETSTR:           On_SETSTR(pCmd, pnum); break;
    case CMD_SETMAG:           On_SETMAG(pCmd, pnum); break;
    case CMD_SETDEX:           On_SETDEX(pCmd, pnum); break;
    case CMD_SETVIT:           On_SETVIT(pCmd, pnum); break;
    case CMD_SYNCQUEST:        On_SYNCQUEST(pCmd, pnum); break;
    case CMD_ENDSHIELD:        On_ENDSHIELD(pCmd, pnum); break;
    /* the retail jump table (jtbl_80116868) has 90 entries (bCmd 0..89) and every "hole" (indices
     * with no named handler here) targets the SAME default-fallthrough label 0x80052858 in the raw
     * table -- these are exactly those hole indices (cross-checked word-for-word against the table,
     * see the CMD_* block comment above), needed so gcc emits the SAME dense 90-entry table
     * (`sltiu v0,a1,90`) with every slot landing on the right body instead of a sequential guess. */
    case 2: case 12: case 13: case 19: case 20: case 21: case 32: case 33: case 34: case 35:
    case 54: case 58: case 59: case 60: case 61: case 62: case 63: case 64: case 65: case 66:
    case 67: case 68: case 69: case 70: case 71: case 72: case 73: case 74: case 75: case 76:
    case 78:
    default:
        if ("Shouldn't get here")
            DBG_Error(NULL, "source/MSG.cpp", 0xACE);
        break;
    }
    return 0;
}

/* @0x80052888 MSG.CPP:2790 */
DLevel *GetDLevel(int LevNum, BOOL SetLevel)
{
    if (setlevel)
        LevNum = setlvlnum + 16;
    return GameMaps.GetMap(LevNum);
}

/* @0x800528D0 MSG.CPP:2807 */
void ReleaseDLevel(DLevel *Dl)
{
    GameMaps.ReleaseMap(Dl);
}

/* @0x800528FC MSG.CPP:2821 */
void MSG_ClearOutCompMap(void)
{
    GameMaps.Init();
}
