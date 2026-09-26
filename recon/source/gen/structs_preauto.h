struct TextDat;

struct SysObj {   /* sizeof 4 */
    long MemHnd;   /* +0x0 */
};

struct FileIO {   /* sizeof 20 */
    struct SysObj SysObj;   /* +0x0 */
    unsigned long MemId;   /* +0x4 */
    long hndPath;   /* +0x8 */
    char *SearchPath;   /* +0xC */
    void *_vf;   /* +0x10 vptr (gcc 2.7 places it after the members; declared only to give this
                  * TU's local copy the retail sizeof 20 -- FileLen/ReadAtAddr are called here by
                  * direct jal, so the real virtuals are not modeled). */
    int FileLen(char *Name);
    BOOL ReadAtAddr(char *Name, unsigned char *Dest, int Len);
};

struct map_info {   /* sizeof 8 */
    short dMonster;   /* +0x0 */
    unsigned char dBits;   /* +0x2 */
    char dObject;   /* +0x3 */
    char dItem;   /* +0x4 */
    char dMissile;   /* +0x5 */
    char dFlags;   /* +0x6 */
    char dTransVal;   /* +0x7 */
};
