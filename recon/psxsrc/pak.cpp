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
int writeblock(struct block *theblock)
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

/* @0x800AE084 PAK.CPP:118 */
int PAK_DoPak(unsigned char *Dest, const unsigned char *buffer, int insize)
{
    long begin, end, bestlength;
    int offset, bestoffset;
    unsigned char *theptr, *ptr1, *ptr2, *ptr3;
    struct block theblock;
    int inpos;

    theblock.blocksize = 0;
    theblock.blocksize = 1;
    theblock.Dest = Dest;
    theblock.outsize = 0;
    theblock.blockrep = 0;
    theblock.data[0] = buffer[0];
    theblock.data[1] = buffer[1];
    inpos = 2;
    while (inpos < insize) {
        begin = -inpos;
        if (begin < -128)
            begin = -128;
        end = insize - inpos;
        if (end > 255)
            end = 255;
        bestoffset = begin;
        bestlength = 1;
        theptr = (unsigned char *)buffer + inpos;
        ptr1 = (unsigned char *)buffer + inpos + begin;
        for (offset = begin; offset < 0; offset++, ptr1++) {
            if (*ptr1 == *theptr && !memcmp(ptr1, theptr, bestlength + 1)) {
                bestlength++;
                bestoffset = offset;
                ptr2 = ptr1 + bestlength;
                ptr3 = theptr + bestlength;
                while (*ptr2 == *ptr3) {
                    bestlength++;
                    if (bestlength >= end)
                        break;
                    ptr2++;
                    ptr3++;
                }
            }
            if (bestlength >= end) {
                bestlength = end;
                break;
            }
        }
        if (bestlength < 3) {
            if (theblock.blockrep || theblock.blocksize >= 127)
                writeblock(&theblock);
            theblock.data[++theblock.blocksize] = buffer[inpos++];
        } else {
            writeblock(&theblock);
            inpos += bestlength;
            theblock.blockrep = 1;
            theblock.blocksize = bestlength;
            theblock.blockoffset = bestoffset;
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
