struct QuestStruct {   /* sizeof 20 */
    unsigned char _qlevel;   /* +0x0 */
    unsigned char _qtype;   /* +0x1 */
    unsigned char _qactive;   /* +0x2 */
    unsigned char _qlvltype;   /* +0x3 */
    int _qtx;   /* +0x4 */
    int _qty;   /* +0x8 */
    unsigned char _qslvl;   /* +0xC */
    unsigned char _qidx;   /* +0xD */
    unsigned char _qmsg;   /* +0xE */
    unsigned char _qvar1;   /* +0xF */
    unsigned char _qvar2;   /* +0x10 */
    unsigned char _qlog;   /* +0x11 */
    unsigned char pad_for_laz;   /* +0x12 */
};

struct KEY_ASSIGNS {   /* sizeof 16 */
    int txt;   /* +0x0 */
    int pad_val;   /* +0x4 */
    void (*func)();   /* +0x8 */
    int combo_val;   /* +0xC */
};

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

enum GM_SPEEDS {
    GM_SPEED_NORMAL,
    GM_SPEED_FAST,
    GM_SPEED_FASTER,
    GM_SPEED_FASTEST
};

enum LANG_TYPE {
    LANG_ENGLISH,
    LANG_FRENCH,
    LANG_GERMAN,
    LANG_SPANISH,
    LANG_ITALIAN,
    LANG_JAPANESE
};

struct PkPlayerStruct {   /* sizeof 1272 -- opaque byte blob; this TU only takes its address, it
                           * never reads/writes individual fields (that's PackPlayer/UnPackPlayer's
                           * job, both external). */
    unsigned char _opaque[1272];
};

struct CharDataStructDef {   /* sizeof 7648 */
    struct PkPlayerStruct CharSlots[6];   /* +0x0 */
    char ToggleSave[6];   /* +0x1DD0 */
    char spltypesave[6];   /* +0x1DD6 */
};
