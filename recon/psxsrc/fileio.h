#ifndef PSXSRC_FILEIO_H
#define PSXSRC_FILEIO_H
/* FILEIO.CPP — Climax file system object.  Layout from SYM (sizeof 20, vtable ptr at +0x10).
 * Only the members used so far are declared; the 7-entry vtable is not modelled yet (callers so far
 * use non-virtual methods). */
#include "diabpsx_types.h"
#include "psxsrc/sysobj.h"

typedef BOOL (*StreamCallback)(unsigned char *Mem, int ReadSoFar, int Size, BOOL LastChunk);

struct FileIO : public SysObj {   /* SYM lists the base subobject as a member named `SysObj` @+0x00 */
    unsigned long MemId;         /* +0x04 */
    long          hndPath;       /* +0x08 */
    char         *SearchPath;    /* +0x0C */

    long Read(const char *Name, unsigned long RamId);                                       /* @0x80085920 */
    int  FileLen(const char *Name);                                                          /* @0x80085A90 */
    BOOL ReadAtAddr(const char *Name, unsigned char *Dest, int Len);                         /* @0x80085BF4 */
    BOOL StreamFile(const char *Name, int Slice, StreamCallback Func, int Offset, int Size); /* @0x80085B14 */
};
#endif
