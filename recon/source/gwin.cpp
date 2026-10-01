/* GWIN.CPP — Diablo PSX (Climax 1998) reconstruction.  No PC twin: the PSX stand-in for the Win32
 * window procedure.  GRL_PostMessage dispatches a game message synchronously through the PSX
 * handler, the installed window proc and the post handler; Msg2Txt names the WM_DIAB* messages
 * (and asserts the message is known). */
#include "diabpsx_types.h"

struct MESSAGE_STR {   /* sizeof 8 */
    int Msg;
    char *Text;
};

typedef unsigned long (*WNDPROC)(unsigned long hw, unsigned int msg, long wp, unsigned long lp);

extern "C" void DBG_Error(char *Text, char *File, int Line);
void PSX_WndProc(unsigned int Msg, long wParam, unsigned long lParam);
void PSX_PostWndProc(unsigned int Msg, long wParam, unsigned long lParam);
void SetAmbientLight(void);
char *Msg2Txt(int Msg);
void GRL_CallWindowProc(unsigned long hw, unsigned int msg, long wp, unsigned long lp);

static WNDPROC CurrentProc;

/* @0x8007B210 GWIN.CPP:94 */
void GRL_InitGwin(void)
{
    CurrentProc = 0;
}

/* @0x8007B21C GWIN.CPP:106 */
WNDPROC GRL_SetWindowProc(WNDPROC NewProc)
{
    WNDPROC OldProc = CurrentProc;
    CurrentProc = NewProc;
    return OldProc;
}

/* @0x8007B22C GWIN.CPP:121 */
void GRL_CallWindowProc(unsigned long hw, unsigned int msg, long wp, unsigned long lp)
{
    if (CurrentProc)
        CurrentProc(hw, msg, wp, lp);
}

/* @0x8007B254 GWIN.CPP:133 */
unsigned char GRL_PostMessage(unsigned long hWnd, unsigned int Msg, long wParam, unsigned long lParam)
{
    if (!Msg2Txt(Msg))
        DBG_Error(NULL, "source/GWIN.cpp", 137);
    PSX_WndProc(Msg, wParam, lParam);
    GRL_CallWindowProc(hWnd, Msg, wParam, lParam);
    PSX_PostWndProc(Msg, wParam, lParam);
    SetAmbientLight();
    return 1;
}

/* @0x8007B300 GWIN.CPP:160 */
static const struct MESSAGE_STR AllMsgs[11] = {
    { 0x42, "WM_DIABNEXTLVL" },
    { 0x43, "WM_DIABPREVLVL" },
    { 0x44, "WM_DIABRTNLVL" },
    { 0x45, "WM_DIABSETLVL" },
    { 0x46, "WM_DIABWARPLVL" },
    { 0x47, "WM_DIABTOWNWARP" },
    { 0x48, "WM_DIABTWARPUP" },
    { 0x49, "WM_DIABRETOWN" },
    { 0x4A, "WM_DIABNEWGAME" },
    { 0x4B, "WM_DIABLOADGAME" },
    { 0x4D, "WM_DIAVNEWLVL" },
};

char *Msg2Txt(int Msg)
{
    for (int i = 0; i < sizeof(AllMsgs) / sizeof(struct MESSAGE_STR); i++) {
        if (Msg == AllMsgs[i].Msg)
            return AllMsgs[i].Text;
    }
    return 0;
}
