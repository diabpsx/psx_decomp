/* EACLIB LOADCALL.C (cmn/loadcall.c) -- loadfile callback: verify and strip the CRCF trailer.
 * Source twin: NFS2 PC beta eaclib loadcall.c (same abort lines 89/107; PSX reads via getm/geti). */
#define LIBTEXT __attribute__((section(".text.lib")))

typedef char *MEMBLOCK;

extern char *abortfile;
extern int abortline;
extern void abortmessage(char *message, ...);
extern unsigned char *getblockadr(MEMBLOCK *block);
extern int getblocklen(MEMBLOCK *block);
extern unsigned int getm(void *address, int bytes);
extern unsigned int geti(void *address, int bytes);
extern unsigned int crc16(void *address, int length);
extern int resizememblocka(MEMBLOCK *block, int size, int abort);
extern void purgememblock(MEMBLOCK *block);
extern MEMBLOCK *(*loadfilecallback)(MEMBLOCK *block, char *name, unsigned int flags, int abort);

int iscrcblock(MEMBLOCK *block) LIBTEXT;
int checkcrcblock(MEMBLOCK *block) LIBTEXT;
MEMBLOCK *eacloadfilecallback(MEMBLOCK *block, char *name, unsigned int flags, int abort) LIBTEXT;
void initloadfilecallback(void) LIBTEXT;

int iscrcblock(MEMBLOCK *block)
{
    unsigned char *address;
    int length;
    int result;

    address = getblockadr(block);
    length = getblocklen(block);
    result = 0;
    if (length >= 12)
        result = getm(address + length - 12, 4) == getm("CRCF", 4);
    return result;
}

int checkcrcblock(MEMBLOCK *block)
{
    unsigned char *address;
    int length;
    int result;

    address = getblockadr(block);
    length = getblocklen(block);
    result = 1;
    if (iscrcblock(block))
        result = geti(address + length - 4, 4) == crc16(address, length - 12);
    return result;
}

int crcresize = 12;
int crcrequired = 0;

MEMBLOCK *eacloadfilecallback(MEMBLOCK *block, char *name, unsigned int flags, int abort)
{
    int valid;

    if (block != 0) {
        valid = iscrcblock(block);
        if (!valid) {
            if (crcrequired != 0) {
                int length = getblocklen(block);
                if (abort != 0) {
                    abortfile = "cmn/loadcall.c";
                    abortline = 89;
                    abortmessage("loadfile - REQUIRED CRC NOT FOUND FOR FILE '%s'. filelen %ld\n", name, length);
                }
            } else
                valid = 1;
        } else {
            valid = checkcrcblock(block);
            if (!valid) {
                if (abort != 0) {
                    unsigned char *address = getblockadr(block);
                    int length = getblocklen(block);
                    unsigned int storedcrc = geti(address + length - 4, 4);
                    unsigned int calculatedcrc = crc16(address, length - 12);
                    abortfile = "cmn/loadcall.c";
                    abortline = 107;
                    abortmessage("loadfile - CRC FOR FILE '%s' DOES NOT MATCH CALCULATION.\nfilelen %ld, crcfile %lx,crccalc %lx\n",
                                 name, length, storedcrc, calculatedcrc);
                }
            } else
                resizememblocka(block, getblocklen(block) - crcresize, abort);
        }
        if (!valid) {
            purgememblock(block);
            block = 0;
        }
    }
    return block;
}

void initloadfilecallback(void)
{
    loadfilecallback = eacloadfilecallback;
}
