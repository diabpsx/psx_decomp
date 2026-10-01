#ifndef PREQUEST_HEADER_METHODS_H
#define PREQUEST_HEADER_METHODS_H
/* PREQUEST's GMAN.H/CPLAYER.H types and inline methods, from retail SYM.
 * Layouts: TextDat 112 bytes, CPlayer 144 bytes. Bodies: gman.h DumpDatFile
 * (lines 290-296) and refs/skeleton JAP CPLAYER.H GetPlayer (lines 64-67).
 * These unused original inlines emit their diagnostic filename literals under
 * PsyQ 2.7.2, but no function bodies. Keeping the declarations separate from
 * our aggregate gman.h avoids unrelated PRIMPOOL/FILEIO header dependencies.
 * The resulting complete 140-byte PREQUEST pool matches retail, including its
 * jump table; no synthetic arrays, alignment fillers, or output edits. */
#include "psxsrc/cplayer_header.h"

#endif
