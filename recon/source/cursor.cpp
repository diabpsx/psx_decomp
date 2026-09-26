/* CURSOR.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/CURSOR.CPP.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: the PC cursor globals become per-player arrays (_pcurs[myplr], _pcursmonst[2] ...,
 * _trigflag/_infostr[sel_data]); cursor sizes come from InvItemWidth/InvItemHeight and the
 * inventory cell is 16 pixels; InitCursor/FreeCursor/CheckCursMove are empty; CheckTown and
 * CheckRportal probe the 8 neighbours (offset_x/offset_y) of the cursor square around each
 * portal and stop at the first hit; strings come from GetStr(). */
#include "diabpsx_types.h"
#include "source/gen/structs_cursor.h"
#include "source/gen/externs_cursor.h"
#include "source/gen/protos_cursor.h"
#include "source/diablo.h"
#include "cstring.h"

extern "C" int sprintf(char *buf, const char *fmt, ...);

#define GLOVE_CURS 1
#define MIT_TOWN 10
#define MIT_RPORTAL 65
#define TEXT_CENTER 1

int sel_data;
int _pcurs[2];
int cursW;
int cursH;
int icursW;
int icursH;
int icursW28;
int icursH28;
int cursmx;
int cursmy;
int _pcursmonst[2];
char _pcursobj[2];
char _pcursitem[2];
char _pcursinvitem[2];
char _pcursplr[2];

#define curs _pcurs[myplr]
#define trigflag _trigflag[sel_data]
#define infostr _infostr[sel_data]

/* @0x80037734 CURSOR.CPP:126 */
void InitCursor(void)
{
}

/* @0x8003773C CURSOR.CPP:137 */
void FreeCursor(void)
{
}

/* @0x80037744 CURSOR.CPP:148 */
void SetICursor(int i)
{
    icursW = InvItemWidth[i];
    icursH = InvItemHeight[i];
    icursW28 = icursW / 16;
    icursH28 = icursH / 16;
}

/* @0x800377A0 CURSOR.CPP:165 */
void SetCursor(int i)
{
    curs = i;
    cursW = InvItemWidth[curs];
    cursH = InvItemHeight[curs];
    SetICursor(i);
}

/* @0x80037804 CURSOR.CPP:179 */
void NewCursor(int i)
{
    SetCursor(i);
}

/* @0x80037824 CURSOR.CPP:186 */
void InitLevelCursor(void)
{
    SetCursor(GLOVE_CURS);
    cursmx = ViewX;
    cursmy = ViewY;
    _pcursmonst[0] = -1;
    _pcursmonst[1] = -1;
    _pcursobj[0] = -1;
    _pcursobj[1] = -1;
    _pcursitem[0] = -1;
    _pcursitem[1] = -1;
    _pcursplr[0] = -1;
    _pcursplr[1] = -1;
}

/* @0x80037884 CURSOR.CPP:211 */
void CheckTown(void)
{
    int ocursmx = cursmx;
    int ocursmy = cursmy;

    for (int i = 0; i < nummissiles; i++) {
        int mx = missileactive[i];
        if (missile[mx]._mitype == MIT_TOWN) {
            for (int dir = 0; dir < 8; dir++) {
                cursmx = ocursmx + offset_x[dir];
                cursmy = ocursmy + offset_y[dir];
                if (((cursmx == missile[mx]._mix - 1) && (cursmy == missile[mx]._miy)) ||
                    ((cursmx == missile[mx]._mix) && (cursmy == missile[mx]._miy - 1)) ||
                    ((cursmx == missile[mx]._mix - 1) && (cursmy == missile[mx]._miy - 1)) ||
                    ((cursmx == missile[mx]._mix - 2) && (cursmy == missile[mx]._miy - 1)) ||
                    ((cursmx == missile[mx]._mix - 2) && (cursmy == missile[mx]._miy - 2)) ||
                    ((cursmx == missile[mx]._mix - 1) && (cursmy == missile[mx]._miy - 2)) ||
                    ((cursmx == missile[mx]._mix) && (cursmy == missile[mx]._miy))) {
                    trigflag = 1;
                    ClearPanel();
                    strcpy(infostr, GetStr(0x494));
                    sprintf(tempstr, GetStr(0x16E), plr[missile[mx]._misource]._pName);
                    AddPanelString(tempstr, TEXT_CENTER);
                    cursmx = missile[mx]._mix;
                    cursmy = missile[mx]._miy;
                    return;
                }
            }
        }
    }
}

/* @0x80037B18 CURSOR.CPP:247 */
void CheckRportal(void)
{
    int ocursmx = cursmx;
    int ocursmy = cursmy;

    for (int i = 0; i < nummissiles; i++) {
        int mx = missileactive[i];
        if (missile[mx]._mitype == MIT_RPORTAL) {
            for (int dir = 0; dir < 8; dir++) {
                cursmx = ocursmx + offset_x[dir];
                cursmy = ocursmy + offset_y[dir];
                if (((cursmx == missile[mx]._mix - 1) && (cursmy == missile[mx]._miy)) ||
                    ((cursmx == missile[mx]._mix) && (cursmy == missile[mx]._miy - 1)) ||
                    ((cursmx == missile[mx]._mix - 1) && (cursmy == missile[mx]._miy - 1)) ||
                    ((cursmx == missile[mx]._mix - 2) && (cursmy == missile[mx]._miy - 1)) ||
                    ((cursmx == missile[mx]._mix - 2) && (cursmy == missile[mx]._miy - 2)) ||
                    ((cursmx == missile[mx]._mix - 1) && (cursmy == missile[mx]._miy - 2)) ||
                    ((cursmx == missile[mx]._mix) && (cursmy == missile[mx]._miy))) {
                    trigflag = 1;
                    ClearPanel();
                    strcpy(infostr, GetStr(0x31E));
                    if (!setlevel)
                        strcpy(tempstr, GetStr(0x479));
                    else
                        strcpy(tempstr, GetStr(0x244));
                    AddPanelString(tempstr, TEXT_CENTER);
                    cursmx = missile[mx]._mix;
                    cursmy = missile[mx]._miy;
                    return;
                }
            }
        }
    }
}

/* @0x80037D80 CURSOR.CPP:284 */
void CheckCursMove(void)
{
}
