/* ERROR.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/error.cpp
 * (msgtable/msgdelay/msgflag/msgcnt logic matches 1:1); refs/devilutionx/Source/diablo_msg.cpp is
 * a heavily-refactored modern port, semantic reference only.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: DrawDiabloMsg does not draw the CelDraw panel border (that lives in the STEXT/DIALOG
 * TU's frame code) -- it only gates on stextflag/msgholdflag and prints the message text via
 * CFont::Print with a fixed RECT, using localized strings via MsgStrings[]+GetStr() (ids into the
 * language table) instead of devilution's literal string table. */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"
#include "psxsrc/textfileinfo_header.h"
#include "source/gen/structs_error.h"
#include "source/gen/externs_error.h"
#include "source/gen/protos_error.h"
#include "source/diablo.h"

/* Localized PSX message IDs; PC ERROR.CPP supplies the corresponding text list. */
int MsgStrings[44] = {
    0x4FA, 0x2CA, 0x4FA, 0x4FA, 0x4FA, 0x4FA, 0x2D0, 0x4FA,
    0x4FA, 0x4FA, 0x25A, 0x38B, 0x3E5, 0x2B4, 0x486, 0x474,
    0x4D1, 0x46A, 0x489, 0x271, 0x4CC, 0x21E, 0x01B, 0x433,
    0x0D8, 0x234, 0x11C, 0x4CD, 0x12F, 0x36B, 0x4CE, 0x059,
    0x45A, 0x41A, 0x44F, 0x47D, 0x381, 0x2AC, 0x485, 0x17D,
    0x4F2, 0x4F0, 0x4F1, 0x01C
};
char msgtable[80];
char msgholdflag = 0;
char msgcnt = 0;
char msgflag = 0;
char msgdelay = 0;

void InitDiabloMsg(char e)
{
    int i;

    for (i = 0; i < msgcnt; i++) {
        if (msgtable[i] == e)
            return;
    }

    msgtable[msgcnt] = e;
    if (msgcnt < (unsigned char)sizeof(msgtable))
        msgcnt++;

    msgflag = msgtable[0];
    msgdelay = 0x46;
}

void ClrDiabloMsg(void)
{
    for (int i = 0; i < 80; i++)
        msgtable[i] = 0;

    msgflag = 0;
    msgcnt = 0;
}

void DrawDiabloMsg(void)
{
    RECT MsgBox;
    char newcnt;

    if (stextflag) {
        msgholdflag = 1;
        return;
    }
    if (msgholdflag) {
        msgholdflag = 0;
        return;
    }

    MsgBox.x = 0x30;
    MsgBox.y = 0x6C;
    MsgBox.w = 0xE0;
    MsgBox.h = 0xB0;

    MediumFont.Print(0, 0xC, GetStr(MsgStrings[msgflag]), JustCentre, &MsgBox, WHITER, WHITEG, WHITEG);

    if (msgdelay > 0)
        msgdelay--;
    if (msgdelay == 0) {
        msgdelay = 0x46;
        newcnt = msgcnt - 1;
        msgcnt = newcnt;
        if (newcnt == 0)
            msgflag = 0;
        else
            msgflag = msgtable[newcnt];
    }
}
