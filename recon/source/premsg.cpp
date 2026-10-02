/* PREMSG.CPP — Diablo PSX (Climax 1998) reconstruction (pregame overlay, premsg segment).
 * Twin: refs/diablo-hellfire/src/MSG.CPP (DefragItems/removellist/DeltaLoadLevel live inline in the PC's
 * MSG.CPP multiplayer-delta code; PSX splits them into their own overlay TU). Reconstructed from the
 * retail asm oracle + skel/SOURCE/PREMSG.CPP (Ghidra/IDA draft). */
#include "diabpsx_types.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"

struct TextDat {
    BOOL OwnDat;
    int TexNum, LastFrame;
    BOOL DatLoaded;
    long hndDat;
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
#include "source/gen/structs_premsg.h"
#include "source/gen/externs_premsg.h"
#include "source/gen/protos_premsg.h"
#include "source/diablo.h"

void DefragItems(unsigned char *ilist, int num)
{
    int p = 0;

    for (int i = 0; i < num; i++) {
        if (ilist[i] != 0xFF) {
            itemactive[p] = ilist[i];
            p++;
        }
    }
}

void removellist(unsigned char *ilist, unsigned char val)
{
    for (int i = 0; i < 127; i++) {
        if (ilist[i] == val)
            ilist[i] = 0xFF;
    }
}

void DeltaLoadLevel(void)
{
    int i;
    int ii;
    DLevel *ThisLevel;
    unsigned char litemlist[127];
    int lnumitems;

    deltaload = 1;
    ThisLevel = GetDLevel(currlevel, setlevel != 0);

    if (currlevel != 0) {
        for (i = 0; i < nummonsters; i++) {
            MonsterStruct *DestMptr = &monster[i];
            const DMonsterStr *SrcMptr = &ThisLevel->monster[i];
            if (SrcMptr->_mx == 0xFF)
                continue;
            M_ClearSquares(i);
            DestMptr->_mx = SrcMptr->_mx;
            DestMptr->_my = SrcMptr->_my;
            DestMptr->_moldx = DestMptr->_mx;
            DestMptr->_moldy = DestMptr->_my;
            DestMptr->_mfutx = DestMptr->_mx;
            DestMptr->_mfuty = DestMptr->_my;
            if (SrcMptr->_mhitpoints != -1)
                DestMptr->_mhitpoints = SrcMptr->_mhitpoints;
            if (!SrcMptr->_mhitpoints) {
                DestMptr->_moldx = SrcMptr->_mx;
                DestMptr->_moldy = SrcMptr->_my;
                M_ClearSquares(i);
                if (DestMptr->_mAi != 0x1B)
                    AddDead(DestMptr->_mx, DestMptr->_my, DestMptr->MType->mdeadval, DestMptr->_mdir);
                DestMptr->_mDelFlag = 1;
                M_UpdateLeader(i);
            } else {
                int enemy = SrcMptr->_menemy;
                decode_enemy(i, enemy);
                if (((unsigned char)DestMptr->_mx != 0 && (unsigned char)DestMptr->_mx != 1) || DestMptr->_my != 0)
                    dung_map[DestMptr->_mx][DestMptr->_my].dMonster = i + 1;
                if (i < 4)
                    DestMptr->_mFlags |= 0x30;
                else
                    M_StartStand(i, DestMptr->_mdir);
            }
        }

        if (setlevel == 0)
            memcpy(&automapview[0][0], &sgLocals[currlevel].automapsv[0][0], sizeof(automapview));
        else
            memcpy(&automapview[0][0], &sgLocals[16 + setlvlnum].automapsv[0][0], sizeof(automapview));
    }

    if (currlevel != 0) {
        for (i = 0; i < 0x7F; i++) {
            switch (ThisLevel->object[i].bCmd) {
            case 0x2B:
            case 0x2C:
            case 0x2D:
            case 0x2E:
                SyncOpObject(-1, ThisLevel->object[i].bCmd, i);
                break;
            case 0x2F:
                SyncBreakObj(-1, i);
                break;
            case 0x30:   /* empty case: the third switch node makes 0x2F the compare-tree root, as retail */
                break;
            }
        }
        for (i = 0; i < numobjects; i++) {
            ii = objectactive[i];
            if ((unsigned)((unsigned char)object[ii]._otype - 0x35) < 2)
                Obj_Trap(ii);
        }
    }

    ConvertdPiece();
    BuildLevTrigs();

    if (QuestStatus(9) && quests[9]._qvar2 == 4) {
        if (quests[9].pad_for_laz == 0)
            CreateItem(7, setpc_x * 2 + 0x19, setpc_y * 2 + 0x13);
    }

    lnumitems = numitems;
    for (i = 0; i < numitems; i++)
        litemlist[i] = itemactive[i];

    for (i = 0; i < 0x7F; i++) {
        if (ThisLevel->item[i].bCmd == 0xFF)
            continue;
        if (ThisLevel->item[i].bCmd == 1) {
            ii = FindGetItem(ThisLevel->item[i].wIndx, ThisLevel->item[i].wCI, ThisLevel->item[i].dwSeed);
            if (ii != -1) {
                if (dung_map[item[ii]._ix][item[ii]._iy].dItem == ii + 1)
                    dung_map[item[ii]._ix][item[ii]._iy].dItem = 0;
                DeleteItem(ii, i);
                removellist(litemlist, ii);
            }
        }
        if (ThisLevel->item[i].bCmd == 2) {
            int ox, oy;

            ii = itemavail[0];
            litemlist[lnumitems] = ii;
            lnumitems++;
            itemavail[0] = itemavail[0x7E - numitems];
            itemactive[numitems] = ii;

            if (ThisLevel->item[i].wIndx == 0x17) {
                RecreateEar(ii, ThisLevel->item[i].wCI, ThisLevel->item[i].dwSeed, ThisLevel->item[i].bId, ThisLevel->item[i].bDur, ThisLevel->item[i].bMDur, ThisLevel->item[i].bCh, ThisLevel->item[i].bMCh, ThisLevel->item[i].wValue, ThisLevel->item[i].dwBuff);
            } else {
                RecreateItem(ii, ThisLevel->item[i].wIndx, ThisLevel->item[i].wCI, ThisLevel->item[i].dwSeed, ThisLevel->item[i].wValue, ThisLevel->item[i].dwBuff);
                if (ThisLevel->item[i].bId)
                    item[ii]._iIdentified = 1;
                item[ii]._iDurability = ThisLevel->item[i].bDur;
                item[ii]._iMaxDur = ThisLevel->item[i].bMDur;
                item[ii]._iCharges = ThisLevel->item[i].bCh;
                item[ii]._iMaxCharges = ThisLevel->item[i].bMCh;
            }

            ox = ThisLevel->item[i].x;
            oy = ThisLevel->item[i].y;

            if (!CanPut(ox, oy)) {
                unsigned char done = 0;
                for (int l = 1; l < 0x32 && !done; l++) {
                    for (int j = -l; j <= l && !done; j++) {
                        int yy = oy + j;
                        for (int iz = -l; iz <= l && !done; iz++) {
                            int xx = ox + iz;
                            if (CanPut(xx, yy)) {
                                done = 1;
                                ox = xx;
                                oy = yy;
                            }
                        }
                    }
                }
            }

            item[ii]._ix = ox;
            item[ii]._iy = oy;
            dung_map[item[ii]._ix][item[ii]._iy].dItem = ii + 1;
            RespawnItem(ii, 0);
            numitems++;
        }
    }

    DefragItems(litemlist, lnumitems);
    deltaload = 0;
    ReleaseDLevel(ThisLevel);
}
