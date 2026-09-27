/* PREMSG.CPP — Diablo PSX (Climax 1998) reconstruction (pregame overlay, premsg segment).
 * Twin: refs/diablo-hellfire/src/MSG.CPP (DefragItems/removellist/DeltaLoadLevel live inline in the PC's
 * MSG.CPP multiplayer-delta code; PSX splits them into their own overlay TU). Reconstructed from the
 * retail asm oracle + skel/SOURCE/PREMSG.CPP (Ghidra/IDA draft). */
#include "diabpsx_types.h"
#include "source/gen/structs_premsg.h"
#include "source/gen/externs_premsg.h"
#include "source/gen/protos_premsg.h"
#include "source/diablo.h"

void DefragItems(unsigned char *ilist, int num)
{
    int p;
    unsigned char *end;

    p = 0;
    end = ilist + num;
    if (num > 0) {
        do {
            if (*ilist != 0xFF) {
                itemactive[p] = *ilist;
                p++;
            }
            ilist++;
        } while ((int)ilist < (int)end);
    }
}

void removellist(unsigned char *ilist, unsigned char val)
{
    unsigned char *end;

    end = ilist + 0x7F;
    do {
        if (*ilist == val)
            *ilist = 0xFF;
        ilist++;
    } while ((int)ilist < (int)end);
}

void DeltaLoadLevel(void)
{
    DLevel *ThisLevel;
    int i, ii;
    unsigned char litemlist[127];
    int lnumitems;
    int enemy;
    unsigned char *p;

    deltaload = 1;
    ThisLevel = GetDLevel(currlevel, setlevel != 0);

    if (currlevel != 0) {
        for (i = 0; i < nummonsters; i++) {
            DMonsterStr *SrcM = &ThisLevel->monster[i];
            MonsterStruct *DestM = &monster[i];
            if (SrcM->_mx != 0xFF) {
                M_ClearSquares(i);
                DestM->_mx = SrcM->_mx;
                DestM->_my = SrcM->_my;
                DestM->_moldx = DestM->_mx;
                DestM->_moldy = DestM->_my;
                DestM->_mfutx = DestM->_mx;
                DestM->_mfuty = DestM->_my;
                if (SrcM->_mhitpoints != -1)
                    DestM->_mhitpoints = SrcM->_mhitpoints;
                if (SrcM->_mhitpoints == 0) {
                    DestM->_moldx = SrcM->_mx;
                    DestM->_moldy = SrcM->_my;
                    M_ClearSquares(i);
                    if (DestM->_mAi != 0x1B) {
                        if (DestM->_uniqtype == 0)
                            AddDead(DestM->_mx, DestM->_my, DestM->MType->mdeadval, DestM->_mdir);
                        else
                            AddDead(DestM->_mx, DestM->_my, DestM->_udeadval, DestM->_mdir);
                    }
                    DestM->_mDelFlag = 1;
                    M_UpdateLeader(i);
                } else {
                    enemy = SrcM->_menemy;
                    decode_enemy(i, enemy);
                    if (((DestM->_mx != 0) && (DestM->_mx != 1)) || (DestM->_my != 0))
                        dung_map[(unsigned char)DestM->_mx][(unsigned char)DestM->_my].dMonster = i + 1;
                    if (i < 4) {
                        DestM->_mFlags |= 0x30;
                    } else {
                        M_StartStand(i, DestM->_mdir);
                    }
                    DestM->_msquelch = SrcM->_menemy;
                }
            }
        }

        if (setlevel == 0)
            memcpy(&automapview[0][0], &sgLocals[currlevel].automapsv[0][0], sizeof(automapview));
        else
            memcpy(&automapview[0][0], &sgLocals[16 + setlvlnum].automapsv[0][0], sizeof(automapview));

        for (i = 0; i < 0x7F; i++) {
            unsigned char cmd = ThisLevel->object[i].bCmd;
            if (cmd == 0x2F) {
                SyncBreakObj(-1, i);
            } else if (cmd >= 0x2B && cmd < 0x30) {
                SyncOpObject(-1, cmd, i);
            }
        }
        if (numobjects > 0) {
            for (i = 0; i < numobjects; i++) {
                int oi = objectactive[i];
                if ((unsigned)(*((unsigned char *)&object[oi] + 0x1E) - 0x35) < 2)
                    Obj_Trap(oi);
            }
        }
    }

    ConvertdPiece();
    BuildLevTrigs();

    if (QuestStatus(9) && quests[9]._qvar2 == 4 && quests[9].pad_for_laz == 0)
        CreateItem(7, setpc_x * 2 + 0x19, setpc_y * 2 + 0x13);

    lnumitems = numitems;
    if (numitems > 0) {
        p = litemlist;
        for (i = 0; i < numitems; i++)
            *p++ = itemactive[i];
    }

    for (i = 0; i < 0x7F; i++) {
        TCmdPItem *SrcI = &ThisLevel->item[i];
        if (SrcI->bCmd == 0xFF)
            continue;
        if (SrcI->bCmd == 1) {
            ii = FindGetItem(SrcI->wIndx, SrcI->wCI, SrcI->dwSeed);
            if (ii != -1) {
                if (dung_map[(unsigned char)item[ii]._ix][(unsigned char)item[ii]._iy].dItem == (ii + 1))
                    dung_map[(unsigned char)item[ii]._ix][(unsigned char)item[ii]._iy].dItem = 0;
                DeleteItem(ii, i);
                removellist(litemlist, ii & 0xFF);
            }
        }
        if (SrcI->bCmd == 2) {
            int ox, oy;
            unsigned char newii;

            newii = itemavail[0];
            litemlist[lnumitems] = newii;
            lnumitems++;
            itemavail[0] = itemavail[0x7E - numitems];
            itemactive[numitems] = newii;

            if (SrcI->wIndx == 0x17) {
                RecreateEar(newii, SrcI->wCI, SrcI->dwSeed, SrcI->bId, SrcI->bDur, SrcI->bMDur, SrcI->bCh, SrcI->bMCh, SrcI->wValue, SrcI->dwBuff);
            } else {
                RecreateItem(newii, SrcI->wIndx, SrcI->wCI, SrcI->dwSeed, SrcI->wValue, SrcI->dwBuff);
                if (SrcI->bId != 0)
                    item[newii]._iIdentified = 1;
                item[newii]._iDurability = SrcI->bDur;
                item[newii]._iMaxDur = SrcI->bMDur;
                item[newii]._iCharges = SrcI->bCh;
                item[newii]._iMaxCharges = SrcI->bMCh;
            }

            ox = SrcI->x;
            oy = SrcI->y;

            if (!CanPut(ox, oy)) {
                unsigned char done;
                int l, j, k;
                int yy, xx;

                done = 0;
                for (l = 1; l < 0x32 && !done; l++) {
                    for (j = -l; j <= l && !done; j++) {
                        yy = oy + j;
                        for (k = -l; k <= l && !done; k++) {
                            xx = ox + k;
                            if (CanPut(xx, yy)) {
                                done = 1;
                                ox = xx;
                                oy = yy;
                            }
                        }
                    }
                }
            }

            item[newii]._ix = ox;
            item[newii]._iy = oy;
            dung_map[(unsigned char)item[newii]._ix][(unsigned char)item[newii]._iy].dItem = newii + 1;
            RespawnItem(newii, 0);
            numitems++;
        }
    }

    DefragItems(litemlist, lnumitems);
    deltaload = 0;
    ReleaseDLevel(ThisLevel);
}
