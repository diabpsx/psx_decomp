#ifndef SOURCE_COMPMAP_H
#define SOURCE_COMPMAP_H
/* COMPMAP.H -- Climax PSX compressed level-map store (C:\diabpsx\SOURCE\COMPMAP.H).  Layouts from the retail
 * SYM (CompClass 4 = vtable pointer, CompressedLevs 180, AMap 16, CompLevelMaps 368); the in-class methods
 * are the ones the retail SYM attributes to COMPMAP.H lines 51-129, emitted out of line per calling TU
 * (-fno-inline).  The concrete compressors (NoComp, PakComp, CrunchComp) live in MSG.CPP. */
#include "diabpsx_types.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"

#define NUM_OF_MAPS 22

struct DLevel;

/* CompClass: a pure interface; the retail data shows its own 2-slot vtable (D_80116850, pure-virtual
 * DoComp/DoDecomp), and MSG.CPP emits its compiler-synthesised constructor out of line (the retail SYM
 * attributes __9CompClass to COMPMAP.H:51, the class line). */
class CompClass {                                                          /* COMPMAP.H:51 */
public:
    virtual int DoComp(unsigned char *Dest, const unsigned char *Src, int SrcLen) const = 0;
    virtual void DoDecomp(unsigned char *Dest, const unsigned char *Src, int DstLen, int SrcLen) const = 0;
};

struct CompressedLevs {   /* sizeof 180 */
    unsigned long Version;              /* +0x0 */
    unsigned long Offset[NUM_OF_MAPS];  /* +0x4 */
    unsigned long Size[NUM_OF_MAPS];    /* +0x5C */

    int GetSize() { return Offset[NUM_OF_MAPS - 1] + GAL_AlignSizeToType(Size[NUM_OF_MAPS - 1], 1); }   /* COMPMAP.H:60 */
};

class AMap {
public:
    BOOL Compressed;     /* +0x0 */
    long hnd;            /* +0x4 */
    int Size;            /* +0x8 */
    DLevel *CurrLevel;   /* +0xC */

    AMap() { hnd = -1; Init(); }                 /* COMPMAP.H:75 */
#line 80
    ~AMap() { Init(); }                          /* COMPMAP.H:80 */
#line 86
    BOOL IsCompressed() { return Compressed; }   /* COMPMAP.H:86 */
    void Init();
    int WriteCompressed(unsigned char *Dest, const CompClass &CompObj);
    void SetCompData(const unsigned char *Data, int NewSize);
    DLevel *GetMap();
    void ReleaseMap(DLevel *Dl);
    void CompressMap(const CompClass &CompObj);
    void DecompressMap(const CompClass &CompObj);
};

class CompLevelMaps {
public:
    CompClass *CompObj;              /* +0x0 */
    AMap TheMaps[NUM_OF_MAPS];       /* +0x4 */
    int LastNumOut;                  /* +0x164 */
    DLevel *LastMapOut;              /* +0x168 */
    BOOL MapOut;                     /* +0x16C */

    CompLevelMaps(const CompClass &NewCompObj);
    ~CompLevelMaps();
    void Init();
    void InitAllMaps();
    DLevel *GetMap(int MapNum);
    void ReleaseMap(DLevel *Dl);
    void ImportData(CompressedLevs *Levs);
    int ExportData(unsigned char *U8Dest);
    void MakeSureMapXDecomped(int MapNum);
    void CheckMapNum(int MapNum)     /* COMPMAP.H:129 */
    {
        if (!((unsigned)MapNum < NUM_OF_MAPS))
            DBG_Error(NULL, "source/compmap.h", 129);
    }
};

#endif
