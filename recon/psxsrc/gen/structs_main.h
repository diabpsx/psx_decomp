/* MAIN.CPP layouts (tools/symhdr.py enum LANG_TYPE LANG_DB_NO; struct TASK per fe.h's own local copy) */
struct TASK {   /* sizeof 92 */
    struct TASK *Next;   /* +0x0 */
    struct TASK *Prev;   /* +0x4 */
    unsigned long Id;   /* +0x8 */
    unsigned long SleepTime;   /* +0xC */
    unsigned long fToInit : 1;
    unsigned long fToDie : 1;
    unsigned long fKillable : 1;
    unsigned long fActive : 1;
    unsigned long fXtraStack : 1;
    void *Stack;   /* +0x14 */
    unsigned long StackSize;   /* +0x18 */
    void *Data;   /* +0x1C */
    int TskEnv[12];   /* +0x20 */
    void (*Main)();   /* +0x50 */
    long hndTask;   /* +0x54 */
    unsigned short XtraLongs;   /* +0x58 */
    unsigned short MaxStackSizeBytes;   /* +0x5A */
};

enum LANG_TYPE {
    LANG_NONE = 5,
    LANG_JAP = 4,
    LANG_SWEDISH = 3,
    LANG_GERMAN = 2,
    LANG_FRENCH = 1,
    LANG_ENGLISH = 0
};

enum LANG_DB_NO {
    LANG_DB_CREDITS = 3,
    LANG_DB_BACK = 2,
    LANG_DB_QUEST = 1,
    LANG_DB_MAIN = 0
};
