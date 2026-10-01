#ifndef TEXTFILEINFO_HEADER_H
#define TEXTFILEINFO_HEADER_H
#include "diabpsx_types.h"

/* GMAN.H: CTextFileInfo layout and original HasTp/HasDat inlines (160-161).
 * Unused inlines retain the real extension literals under the retail compiler. */
struct CTextFileInfo {
    char *FileName;
    BOOL HasFile(const char *Ext) const;
    BOOL HasTp() const { return HasFile(".tp"); }
    BOOL HasDat() const { return HasFile(".dat"); }
};
#endif
