struct map_info {   /* sizeof 8 */
    short dMonster;   /* +0x0 */
    unsigned char dBits;   /* +0x2 */
    char dObject;   /* +0x3 */
    char dItem;   /* +0x4 */
    char dMissile;   /* +0x5 */
    char dFlags;   /* +0x6 */
    char dTransVal;   /* +0x7 */
};

struct NODE {   /* sizeof 24 */
    int nHallx1;   /* +0x0 */
    int nHally1;   /* +0x4 */
    int nHallx2;   /* +0x8 */
    int nHally2;   /* +0xC */
    int nHalldir;   /* +0x10 */
    struct NODE *pNext;   /* +0x14 */
};

struct ROOMNODE {   /* sizeof 20 */
    int nRoomx1;   /* +0x0 */
    int nRoomy1;   /* +0x4 */
    int nRoomx2;   /* +0x8 */
    int nRoomy2;   /* +0xC */
    int nRoomDest;   /* +0x10 */
};

struct ShadowStruct {   /* sizeof 7 */
    unsigned char strig;   /* +0x0 */
    unsigned char s1;   /* +0x1 */
    unsigned char s2;   /* +0x2 */
    unsigned char s3;   /* +0x3 */
    unsigned char nv1;   /* +0x4 */
    unsigned char nv2;   /* +0x5 */
    unsigned char nv3;   /* +0x6 */
};
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
