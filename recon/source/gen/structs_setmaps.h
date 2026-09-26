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

struct ObjectStruct {   /* sizeof 44 */
    short _olid;   /* +0x0 */
    int _oRndSeed;   /* +0x4 */
    short _oAnimDelay;   /* +0x8 */
    short _oAnimCnt;   /* +0xA */
    short _oAnimLen;   /* +0xC */
    short _oVar1;   /* +0xE */
    short _oVar2;   /* +0x10 */
    short _oVar3;   /* +0x12 */
    short _oVar4;   /* +0x14 */
    short _oVar5;   /* +0x16 */
    short _oVar6;   /* +0x18 */
    short _oVar7;   /* +0x1A */
    short _oVar8;   /* +0x1C */
    char _otype;   /* +0x1E */
    char _ox;   /* +0x1F */
    char _oy;   /* +0x20 */
    char _oAnimFrame;   /* +0x21 */
    char _oBreak;   /* +0x22 */
    char _oSelFlag;   /* +0x23 */
    unsigned char _oLight;   /* +0x24 */
    unsigned char _oAnimFlag;   /* +0x25 */
    unsigned char _oDelFlag;   /* +0x26 */
    unsigned char _oSolidFlag;   /* +0x27 */
    unsigned char _oMissFlag;   /* +0x28 */
    unsigned char _oPreFlag;   /* +0x29 */
    unsigned char _oTrapFlag;   /* +0x2A */
    unsigned char _oDoorFlag;   /* +0x2B */
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
