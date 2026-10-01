/* PAK.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: a small block LZ packer.
 * Output is a stream of blocks: a literal run (count-1 < 0x80, then the bytes) or a back
 * reference (signed offset byte >= 0x80, then a length byte); offset 0x80 with length 0 ends it. */
#include "diabpsx_types.h"

extern "C" {
void *memcpy(void *dst, const void *src, unsigned int n);
int memcmp(const void *a, const void *b, unsigned int n);
}

struct block {   /* sizeof 532 */
    int data[128];
    unsigned char blockrep;
    int blocksize;
    int blockoffset;
    unsigned char *Dest;
    int outsize;

    /* @0x800AE364 PAK.CPP:55 */
    void fputc(unsigned char Val)
    {
        *Dest = Val;
        Dest++;
        outsize++;
    }
};

/* @0x800ADF9C PAK.CPP:85 */
void writeblock(struct block *theblock)
{
    if (theblock->blockrep && theblock->blocksize == 0) {
        theblock->fputc(0x80);
        theblock->fputc(0);
    } else if (theblock->blockrep) {
        theblock->fputc(theblock->blockoffset);
        theblock->fputc(theblock->blocksize);
    } else {
        theblock->fputc(theblock->blocksize & 0x7F);
        for (int i = 0; i <= theblock->blocksize; i++)
            theblock->fputc(theblock->data[i]);
    }
    theblock->blockrep = 0;
    theblock->blockoffset = 0;
    theblock->blocksize = -1;
}

/* @0x800AE084 PAK.CPP:118 -- OPEN (120 diffs, 142/144 insns; fsize 600 vs 608).  Retail hoists &theblock.data
 * (sp+16) out of the outer loop into a pseudo that global-alloc spills (sw at 0x230, lw a3 at the literal
 * store) -> +8 frame and a different s-register assignment (retail inpos=s5 bestoffset=s7 theptr=s6).  Ours:
 * cc1plus -dL 'Insn 340: regno 124 (life 1), savings 1 not desirable' -- loop.c moves an invariant only when
 * threshold(1+n_non_fixed_regs, call in loop) * savings * lifetime >= insn_count (84): needs lifetime >= 3.
 * Falsified: *(data + ++bs), bs += 1, split ++bs / store / inpos++ statements.  Next angle: a spelling whose
 * RTL materializes the data base 3+ insns before its use (or shares it with another use in the loop).  Kept
 * from this pass (131 -> 120): ptr1 = &buffer[inpos + bestoffset] before theptr, ptr3++ before ptr2++. */
int PAK_DoPak(unsigned char *Dest, const unsigned char *buffer, int insize)
{
    long begin, end, bestlength;
    int offset, bestoffset;
    unsigned char *theptr, *ptr1, *ptr2, *ptr3;
    struct block theblock;
    int inpos;
    int FORWARDDIST = 255;   /* Climax lowLevelPak (SBSPSS Utils pak.cpp): constant-initialised, no SYM record */

    theblock.Dest = Dest;
    theblock.outsize = 0;
    theblock.blockrep = 0;
    inpos = 0;
    theblock.blocksize = -1;
    theblock.data[++theblock.blocksize] = buffer[inpos++];
    theblock.data[++theblock.blocksize] = buffer[inpos++];
    while (inpos < insize) {
        begin = -inpos;
        end = insize - inpos;
        if (begin < -128)
            begin = -128;
        if (end > FORWARDDIST)
            end = FORWARDDIST;
        bestoffset = begin;
        bestlength = 1;
        theptr = (unsigned char *)buffer + (inpos);
        ptr1 = (unsigned char *)buffer + (inpos + begin);
        for (offset = begin; offset < 0; offset++) {
            if (*ptr1 == *theptr) {
                if (!memcmp(ptr1, theptr, bestlength + 1)) {
                    bestlength++;
                    bestoffset = offset;
                    ptr2 = ptr1 + bestlength;
                    ptr3 = theptr + bestlength;
                    while (*ptr2 == *ptr3) {
                        ptr2++;
                        ptr3++;
                        bestlength++;
                        if (bestlength >= end)
                            break;
                    }
                }
            }
            if (bestlength >= end) {
                bestlength = end;
                break;
            }
            ptr1++;
        }
        if (bestlength < 3) {
            if (theblock.blockrep) {
                writeblock(&theblock);
                theblock.data[++theblock.blocksize] = buffer[inpos++];
            } else {
                if (theblock.blocksize >= 127)
                    writeblock(&theblock);
                theblock.data[++theblock.blocksize] = buffer[inpos++];
            }
        } else {
            writeblock(&theblock);
            theblock.blockrep = 1;
            theblock.blocksize = bestlength;
            theblock.blockoffset = bestoffset;
            inpos += bestlength;
        }
    }
    writeblock(&theblock);
    theblock.blockrep = 1;
    theblock.blocksize = 0;
    theblock.blockoffset = 0;
    writeblock(&theblock);
    return theblock.outsize;
}

/* @0x800AE2C4 PAK.CPP:245 */
int PAK_DoUnpak(unsigned char *Dest, const unsigned char *Source)
{
    int outsize = 0;

    while (1) {
        unsigned char *From;
        int size;
        int ch;

        ch = *Source++;
        if (ch < 0x80) {
            size = ch + 1;
            From = (unsigned char *)Source;
            Source += size;
        } else {
            size = *Source++;
            if (!size)
                break;
            From = Dest + (char)ch;
        }
        memcpy(Dest, From, size);
        Dest += size;
        outsize += size;
    }
    return outsize;
}
