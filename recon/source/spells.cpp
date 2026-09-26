/* SPELLS.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/spells.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_spells.h"
#include "source/gen/externs_spells.h"
#include "source/gen/protos_spells.h"
#include "source/diablo.h"

/* spell ids (spell_id, retail values) */
#define SPL_FIREBOLT    1
#define SPL_HEAL        2
#define SPL_FIREWALL    6
#define SPL_TOWN        7
#define SPL_RNDTELEPORT 0xA
#define SPL_DISARM      0x1C
#define SPL_CBOLT       0x1E
#define SPL_RESURRECT   0x20
#define SPL_TELEPORT    0x17
#define SPL_HEALOTHER   0x22

/* missile ids (missile_id, retail values) */
#define MIS_ARROW 0
#define MIS_TOWN  0xA
#define MIS_CBOLT 0x34

/* _pRSplType / _pSplType (spell_type) */
#define RSPLTYPE_SKILL   0
#define RSPLTYPE_SPELL   1
#define RSPLTYPE_SCROLL  2
#define RSPLTYPE_CHARGES 3
#define RSPLTYPE_INVALID 4

/* CastSpell caster (missile_target) */
#define TARGET_MONSTERS 0
#define TARGET_PLAYERS  1

#define PC_WARRIOR 0

int GetManaAmount(int id, int sn)
{
    int i;
    int sl, ma, adj;

    adj = 0;
    sl = plr[id]._pSplLvl[sn] + plr[id]._pISplLvlAdd - 1;
    if (sl < 0) sl = 0;
    for (i = sl; i > 0; i--) adj += spelldata[sn].sManaAdj;

    if (sn == SPL_FIREBOLT) adj = adj >> 1;
    if (sn == SPL_RESURRECT && sl > 0) {
        adj = 0;
        for (i = sl; i > 0; i--) adj += spelldata[sn].sManaCost >> 3;
    }

    if (spelldata[sn].sManaCost == 0xFF)
        ma = (((unsigned char)plr[id]._pMaxManaBase) - adj) << 6;
    else
        ma = (spelldata[sn].sManaCost - adj) << 6;

    if (sn == SPL_HEAL) ma = ((plr[id]._pLevel << 1) + spelldata[SPL_HEAL].sManaCost - adj) << 6;
    if (sn == SPL_HEALOTHER) ma = ((plr[id]._pLevel << 1) + spelldata[SPL_HEAL].sManaCost - adj) << 6;
    if (sn == SPL_RESURRECT) {
        adj = 0;
        for (i = sl; i > 0; i--) adj += spelldata[sn].sManaCost;
    }

    if (plr[id]._pClass == PC_ROGUE)
        ma -= (ma >> 2);

    if (spelldata[sn].sMinMana > (ma >> 6)) ma = spelldata[sn].sMinMana << 6;
    ma = (ma * (100 - plr[id]._pISplCost)) / 100;

    return (ma);
}

void UseMana(int id, int sn)
{
    int ma;

    if (id == myplr && (gbMaxPlayers != 2 || (sn != SPL_TELEPORT && sn != SPL_RNDTELEPORT))) {
        switch (plr[id]._pSplType) {
        case RSPLTYPE_SKILL:
        case RSPLTYPE_INVALID:
            break;
        case RSPLTYPE_SCROLL:
            if (ScrollFlag[id] == 0)
                RemoveScroll(id);
            ScrollFlag[id] = 0;
            break;
        case RSPLTYPE_CHARGES:
            UseStaffCharge(&plr[id]);
            break;
        case RSPLTYPE_SPELL:
            ma = GetManaAmount(id, sn);
            plr[id]._pMana -= ma;
            plr[id]._pManaBase -= ma;
            drawmanaflag = 1;
            break;
        }
    }
}

unsigned char CheckSpell(int id, int sn, char st, unsigned char manaonly)
{
    if (st == 0)
        return 1;
    if (GetSpellLevel(id, sn) > 0)
        return GetManaAmount(id, sn) <= plr[id]._pMana;
    return 0;
}

void CastSpell(int id, int spl, int sx, int sy, int dx, int dy, int caster, int spllvl)
{
    int i;
    int dir;

    dir = 0;
    switch (caster) {
    case TARGET_MONSTERS:
        if (gbMaxPlayers == 2) {
            if (spl == SPL_TELEPORT)
                return;
            if (spl == SPL_RNDTELEPORT)
                return;
        }
        dir = GetDirection(sx, sy, dx, dy);
        if (spl == SPL_FIREWALL)
            dir = plr[id]._pVar3;
        ChangeLightColour(plr[id]._plid, 9200);
        break;
    case TARGET_PLAYERS:
        dir = monster[id]._mdir;
        break;
    }

    if (spl == SPL_DISARM && _pcursobj[sel_data] != -1) {
        NetSendCmdLocParam1(1, 0x11, dx, dy, _pcursobj[sel_data] & 0xFFFF);
        return;
    }

    for (i = 0; spelldata[spl].sMissiles[i] != MIS_ARROW && i < 3; i++)
        AddMissile(sx, sy, dx, dy, dir, spelldata[spl].sMissiles[i], caster, id, 0, spllvl);

    if (spelldata[spl].sMissiles[0] == MIS_TOWN)
        UseMana(id, SPL_TOWN);

    if (spelldata[spl].sMissiles[0] == MIS_CBOLT) {
        UseMana(id, SPL_CBOLT);
        for (i = (spllvl >> 1) + 3; i > 0; i--)
            AddMissile(sx, sy, dx, dy, dir, MIS_CBOLT, caster, id, 0, spllvl);
    }
}

/**
 * @param pnum player index
 * @param rid target player index
 */
void DoResurrect(int pnum, int rid)
{
    PlayerStruct *ptrplr;

    ptrplr = &plr[rid];
    NewCursor(1);
    if ((char)rid != -1) {
        if (rid == myplr) {
            deathflag = 0;
            gamemenu_off();
            drawhpflag = 1;
            drawmanaflag = 1;
        }

        light_rad = ptrplr->_pLightRad;
        ClrPlrPath(rid);
        ptrplr->plractive = 1;
        gbActivePlayers = 2;
        PostGamePad(rid + 6, 0, 0, 0);
        ptrplr->destAction = -1;
        ptrplr->_pInvincible = 0;
        SetPlayerHitPoints(rid, 0x280);
        ptrplr->_pMana = 0;
        ptrplr->_pHPBase = ptrplr->_pHitPoints - (ptrplr->_pMaxHP - ptrplr->_pMaxHPBase);
        ptrplr->_pManaBase = -ptrplr->_pMaxMana + ptrplr->_pMaxManaBase;
        CalcPlrInv(rid, 1);
        ptrplr->plrlevel = currlevel;
        StartStand(rid, ptrplr->_pdir);
        PlacePlayer(rid, plr[pnum]._px, plr[pnum]._py, 0);

        if (ptrplr->_plid == -1)
            ptrplr->_plid = AddLight(ptrplr->_px, ptrplr->_py, light_rad + 9200);
        else
            ChangeLightXY(ptrplr->_plid, ptrplr->_px, ptrplr->_py);

        if (ptrplr->_pvid == -1)
            ptrplr->_pvid = AddVision(ptrplr->_px, ptrplr->_py, 10, rid);
        else
            ChangeVisionXY(ptrplr->_pvid, ptrplr->_px, ptrplr->_py);

        AddMissile(ptrplr->_px, ptrplr->_py, ptrplr->_px, ptrplr->_py, 0, 0x3E, 0, pnum, 0, 0);
        _pcursplr[pnum] = -1;
    }
}

void DoHealOther(int pnum, int rid)
{
    int i;
    long l;

    if (pnum == myplr)
        NewCursor(1);

    if ((char)rid != -1 && (plr[rid]._pHitPoints >> 6) > 0) {
        l = (ENG_random(10) + 1) << 6;

        for (i = 0; i < plr[pnum]._pLevel; i++)
            l += (ENG_random(4) + 1) << 6;

        i = 0;
        while (i < GetSpellLevel(pnum, SPL_HEALOTHER)) {
            l += (ENG_random(6) + 1) << 6;
            i++;
        }

        if (plr[pnum]._pClass == PC_WARRIOR)
            l *= 2;
        if (plr[pnum]._pClass == PC_ROGUE)
            l += l >> 1;

        plr[rid]._pHitPoints += l;
        if (plr[rid]._pHitPoints > plr[rid]._pMaxHP)
            plr[rid]._pHitPoints = plr[rid]._pMaxHP;

        plr[rid]._pHPBase += l;
        if (plr[rid]._pHPBase > plr[rid]._pMaxHPBase)
            plr[rid]._pHPBase = plr[rid]._pMaxHPBase;

        drawhpflag = 1;
    }
}
