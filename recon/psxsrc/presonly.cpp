/* PRESONLY.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  Overlay-presence probe: the routine
 * only exists in its overlay, so reaching it from the wrong overlay trips the debug message. */
#include "diabpsx_types.h"

extern "C" void DBG_SendMessage(char *e);

void PresOnlyTestRoutine(void)
{
    DBG_SendMessage("You shouldn't get here");
}
