/* PORTAL.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/PORTAL.CPP.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: dMissile/dFlags live in dung_map[x][y]; AddWarpMissile keeps the PC bug that gives
 * the light to missile[i] (not missile[mi]) and uses radius 330; SyncPortals clears the town
 * dMissile/BFLAG_MISSILE grid (112x112) before placing the town warps and tests setlvl == setlevel
 * instead of branching on setlevel; ActivatePortal stores currlevel/setlvlnum (the lvl argument
 * only gates the update); DelMis is PORTAL's own copy of the missile-list removal;
 * RemovePortalMissile sets _miDelFlag; GetPortalLevel always deactivates the portal it used. */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"
#include "source/gen/structs_portal.h"
#include "source/gen/externs_portal.h"
#include "source/gen/protos_portal.h"
#include "source/diablo.h"

#define MAXPORTAL 4
#define MAXMISSILES 125
#define MIT_TOWN 10
#define MI_ENEMYMONST 0
#define LS_SENTINEL 110
#define BFLAG_MISSILE 0x40
#define CMD_DEACTIVATEPORTAL 0x39

struct PortalStruct portal[MAXPORTAL];

static int WarpDropX[MAXPORTAL] = { 57, 59, 61, 63 };
static int WarpDropY[MAXPORTAL] = { 40, 40, 40, 40 };

static int portalindex;

/* @0x80080EF8 PORTAL.CPP:151 */
void AddWarpMissile(int i, int x, int y)
{
    int mi;

    missiledata[MIT_TOWN].mlSFX = -1;
    dung_map[x][y].dMissile = 0;
    mi = AddMissile(0, 0, x, y, 0, MIT_TOWN, MI_ENEMYMONST, i, 0, 0);
    if (mi == -1)
        return;
    SetMissDir(mi, 1);
    missile[i]._mlid = AddLight(missile[i]._mix, missile[i]._miy, 330);
    missiledata[MIT_TOWN].mlSFX = LS_SENTINEL;
}

/* @0x80080FE8 PORTAL.CPP:189 */
void SyncPortals(void)
{
    for (int i = 0; i < MAXPORTAL; i++) {
        if (portal[i].open) {
            if (currlevel == 0) {
                for (int x = 0; x < 112; x++) {
                    for (int y = 0; y < 112; y++) {
                        dung_map[x][y].dMissile = 0;
                        dung_map[x][y].dFlags &= ~BFLAG_MISSILE;
                    }
                }
                AddWarpMissile(i, WarpDropX[i], WarpDropY[i]);
            } else {
                if (portal[i].setlvl == setlevel && portal[i].level == currlevel)
                    AddWarpMissile(i, portal[i].x, portal[i].y);
            }
        }
    }
}

/* @0x8008113C PORTAL.CPP:236 */
void ActivatePortal(int i, int x, int y, int lvl, int lvltype, unsigned char sp)
{
    portal[i].open = 1;
    if (lvl != 0) {
        portal[i].x = x;
        portal[i].y = y;
        portal[i].level = currlevel;
        portal[i].setlvl = sp;
        portal[i].ltype = lvltype;
        portal[i].setlvlnum = setlvlnum;
    }
}

/* @0x800811C8 PORTAL.CPP:253 */
void DeactivatePortal(int i)
{
    portal[i].open = 0;
}

/* @0x800811E8 PORTAL.CPP:262 */
unsigned char PortalOnLevel(int i)
{
    if (portal[i].level == currlevel)
        return 1;
    if (currlevel == 0)
        return 1;
    else
        return 0;
}

/* @0x80081220 PORTAL.CPP:272 */
void DelMis(int mi, int i)
{
    missileavail[MAXMISSILES - nummissiles] = mi;
    nummissiles--;
    if (nummissiles > 0 && i != nummissiles)
        missileactive[i] = missileactive[nummissiles];
}

/* @0x80081280 PORTAL.CPP:285 */
void RemovePortalMissile(int id)
{
    int i, mi;
    struct MissileStruct *m;

    for (i = 0; i < nummissiles; i++) {
        mi = missileactive[i];
        m = &missile[mi];
        if (m->_mitype == MIT_TOWN && m->_misource == id) {
            dung_map[m->_mix][m->_miy].dFlags &= ~BFLAG_MISSILE;
            dung_map[m->_mix][m->_miy].dMissile = 0;
            if (portal[id].level != 0)
                AddUnLight(m->_mlid);
            DelMis(mi, i);
            m->_miDelFlag = 1;
        }
    }
}

/* @0x800813E4 PORTAL.CPP:306 */
void SetCurrentPortal(int p)
{
    portalindex = p;
}

/* @0x800813F0 PORTAL.CPP:312 */
void GetPortalLevel(void)
{
    if (currlevel) {
        setlevel = 0;
        setlvlnum = 0;
        currlevel = 0;
        plr[myplr].plrlevel = 0;
        leveltype = 0;
        return;
    }
    if (portal[portalindex].setlvl) {
        setlevel = 1;
        setlvlnum = portal[portalindex].setlvlnum;
        currlevel = portal[portalindex].level;
        plr[myplr].plrlevel = currlevel;
        leveltype = portal[portalindex].ltype;
    } else {
        setlevel = 0;
        setlvlnum = 0;
        currlevel = portal[portalindex].level;
        plr[myplr].plrlevel = currlevel;
        leveltype = portal[portalindex].ltype;
    }
    NetSendCmd(1, CMD_DEACTIVATEPORTAL);
    DeactivatePortal(portalindex);
}

/* @0x80081554 PORTAL.CPP:346 */
void GetPortalLvlPos(void)
{
    if (!currlevel) {
        ViewX = WarpDropX[portalindex] + 1;
        ViewY = WarpDropY[portalindex] + 1;
        return;
    }
    ViewX = portal[portalindex].x;
    ViewY = portal[portalindex].y;
    if (portalindex != myplr) {
        ViewX++;
        ViewY++;
    }
}
