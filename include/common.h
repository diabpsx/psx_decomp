#ifndef COMMON_H
#define COMMON_H
/* Master include for every src/*.c translation unit (splat emits
 * `#include "common.h"`).  Provides the type aliases + INCLUDE_ASM machinery
 * so the asm-only scaffold assembles; real game headers live under recon/. */
#include "decomp/types.h"
#include "decomp/include_asm.h"
#endif
