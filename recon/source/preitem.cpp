/* PREITEM.CPP -- Diablo PSX (Climax 1998) reconstruction.  The retail object carries no code and no data of its own
 * (rom/DIABPSX.MAP: .PREITEM_rdata = 33 bytes of header literals, a 9-byte .sdata pool): only what its includes
 * leave behind, GMAN.H's "psxsrc/gman.h" literal and CPLAYER.H's "psxsrc/cplayer.h" literal in .rdata and the
 * ".tp"/".dat" pool in .sdata. */
#include "diabpsx_types.h"
#include "psxsrc/textfileinfo_header.h"
#include "psxsrc/cplayer_header.h"
