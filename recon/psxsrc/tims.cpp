/* TIMS.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  A programmer's scratch file: TimSwann
 * is empty (its body is compiled out).  TUTILS.H's static tpage helpers are emitted in this object. */
#include "diabpsx_types.h"

/* TUTILS.H */
static int GetTpY(unsigned short tpage)
{
    return ((tpage << 4) & 0x100) | ((tpage >> 2) & 0x200);
}

static int GetTpX(unsigned short tpage)
{
    return (tpage << 6) & 0x3C0;
}

/* @0x80085874 TIMS.CPP:462 */
void TimSwann(void)
{
}
