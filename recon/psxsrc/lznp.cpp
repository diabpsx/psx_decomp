/* LZNP.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the LZ decoder for the
 * packed data files.  A flag byte (low bit first, 0xFF00 marks the refill) selects a literal or a
 * back-reference: bytes >= 0x60 are a short match (distance 0x100 - byte, length 2); otherwise a
 * 12-bit distance with a length of (nibble + 3), or an extension byte + 8 when the nibble is 5.
 * Distance 0 ends the stream; returns the decoded size. */
#include "diabpsx_types.h"

/* Constants and body verbatim from Nick Pelling's unlznp.c (Climax SBSPSS source/utils/lznp.cpp). */
#define SMALLEST_LEN    2                           /* smallest len usable at all */
#define MIN_LEN         3                           /* smallest short length encodable */
#define MAX_LEN         (MIN_LEN + 6 - 2)           /* largest  short length encodable */
#define MIN_SUPERLEN    (MIN_LEN + 6 - 1)           /* shortest long length encodable */
#define MAX_SUPERLEN    (MIN_SUPERLEN + 254)        /* largest  long length encodable */
#define SUPERLEN_CODE   (MIN_SUPERLEN - MIN_LEN)    /* means "read superlength" */

/* @0x800881D4 LZNP.CPP */
int LZNP_Decode(unsigned char *in, unsigned char *out)
{
    int i, j;
    unsigned int flags;                         /* now works with 16-bit ints */
    unsigned char *OriginalOut = out;

    for (flags = 0;;) {
        if (((flags >>= 1) & 0xff00) == 0) {
            flags = (*in++) | 0xff00;           /* uses higher byte cleverly (to count eight) */
        }

        if (!(flags & 1)) {
            *out++ = *in++;
        } else {
            i = *in++;

            if (i >= 0x60) {
                i = 0x100 - i;                  /* i = copy offset */
                j = SMALLEST_LEN;               /* j = copy length */
            } else {
                j = i >> 4;
                i = (i & 0x0F) << 8;
                i |= *in++;

                if (i == 0)                     /* offset of zero terminates LZNP data */
                    break;

                if (j != SUPERLEN_CODE)
                    j += MIN_LEN;
                else
                    j = MIN_SUPERLEN + (*in++);
            }

            for (i = -i, j++; --j; out++) {
                out[0] = out[i];
            }
        }
    }

    /* Return size */
    return (out - OriginalOut);
}
