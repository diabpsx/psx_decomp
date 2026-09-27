/* TESTCODE.CPP — Diablo PSX (Climax 1998) reconstruction.  No PC twin: two debug entry points that
 * start a game directly (bypassing the front end). */
#include "diabpsx_types.h"

void GRL_InitGwin(void);
void StartGame(unsigned char bNewGame, unsigned char bSinglePlayer);
void LittleStart(unsigned char bNewGame, unsigned char bSinglePlayer);
void alloc_plr(void);

/* @0x8007B170 TESTCODE.CPP:66 */
void DoGameTestStuff(void)
{
    GRL_InitGwin();
    StartGame(1, 1);
}

/* @0x8007B19C TESTCODE.CPP:73 */
void DoInitGameStuff(void)
{
    GRL_InitGwin();
    alloc_plr();
    LittleStart(1, 1);
}
