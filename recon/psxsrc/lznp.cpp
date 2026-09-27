/* LZNP.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the LZ decoder for the
 * packed data files.  A flag byte (low bit first, 0xFF00 marks the refill) selects a literal or a
 * back-reference: bytes >= 0x60 are a short match (distance 0x100 - byte, length 2); otherwise a
 * 12-bit distance with a length of (nibble + 3), or an extension byte + 8 when the nibble is 5.
 * Distance 0 ends the stream; returns the decoded size. */
#include "diabpsx_types.h"

/* @0x800881D4 LZNP.CPP */
int LZNP_Decode(unsigned char *in, unsigned char *out)
{
    int i, j;
    unsigned int flags;
    unsigned char *OriginalOut;

    OriginalOut = out;
    flags = 0;
    for (;;) {
        flags >>= 1;
        if ((flags & 0xFF00) == 0)
            flags = *in++ | 0xFF00;
        if ((flags & 1) == 0) {
            *out++ = *in++;
        } else {
            i = *in++;
            if (i >= 0x60) {
                i = 0x100 - i;
                j = 2;
            } else {
                j = i >> 4;
                i = (i & 0xF) << 8;
                i |= *in++;
                if (i == 0)
                    break;
                if (j == 5)
                    j = *in++ + 8;
                else
                    j += 3;
            }
            /* OPEN (7 diffs, 52/53): retail strength-reduces out - i into a walking pointer that
             * reuses i's register (negu in the beqz delay slot, then addu); ours recomputes
             * subu per byte.  Falsified: i = -i + out[i] (i/j swap), i as an int pointer (swap),
             * *(out - i), for/do/while(j--) loop forms, *out++ = out[-i].
             * 2026-09-27: `i = -i; while (j) { *out = out[i]; out++; j--; }` gives retail's exact 53-insn
             * stream (negu in the beqz slot + addu + walking pointer) -- cse no longer folds out-(i) to a
             * MINUS, so loop.c reduces the giv -- but i/j swap registers (ours i=v1 j=a2, retail i=a2 j=v1):
             * greg priority giv 4.71 > i 4.52 > j 4.18 (floor_log2(refs)*refs/live).  Retail allocated j
             * first.  Next angle: a spelling that raises j's refs/shortens its live range without new code
             * (or lowers i's refs under 16); falsified: j/i decl order, register, unsigned j, j+=3 spellings,
             * do/while(--j), for(i=-i;j;j--), statement order in both length arms. */
            while (j) {
                *out = out[-i];
                out++;
                j--;
            }
        }
    }
    return out - OriginalOut;
}
