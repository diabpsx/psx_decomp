struct TextDat;

enum LANG_TYPE {
    LANG_NONE = 5,
    LANG_JAP = 4,
    LANG_SWEDISH = 3,
    LANG_GERMAN = 2,
    LANG_FRENCH = 1,
    LANG_ENGLISH = 0
};

enum TXT_JUST {
    JustRight = 2,
    JustCentre = 1,
    JustLeft = 0
};

struct RECT {   /* sizeof 8 */
    short x;   /* +0x0 */
    short y;   /* +0x2 */
    short w;   /* +0x4 */
    short h;   /* +0x6 */
};

struct CFont {   /* sizeof 540 */
    int TextureId;   /* +0x0 */
    unsigned short FontTab[256];   /* +0x4 */
    int PrintyOTpos;   /* +0x204 */
    int MinX;   /* +0x208 */
    int MaxX;   /* +0x20C */
    int Width;   /* +0x210 */
    struct TextDat *ThisDat;   /* +0x214 */
    unsigned char FontHeight;   /* +0x218 */

    int SetOTpos(int OT);
    int GetStrWidth(char *Str);
    int GetWrap(char *Str, RECT *TextWindow);
    int Print(int X, int Y, char *Str, TXT_JUST Justify, RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
    int GetCharWidth(unsigned char ch);
};

struct CPad {   /* sizeof 236 */
    unsigned char get_both;   /* +0x0 */
    unsigned char active;   /* +0x1 */
    unsigned char PadType;   /* +0x2 */
    unsigned char PADTICK;   /* +0x3 */
    unsigned short PADTICKMASK;   /* +0x4 */
    unsigned short PadNum;   /* +0x6 */
    unsigned short Cur;   /* +0x8 */
    unsigned short Up;   /* +0xA */
    unsigned short Down;   /* +0xC */
    unsigned short Tick;   /* +0xE */
    unsigned short Old;   /* +0x10 */
    unsigned short both_Cur;   /* +0x12 */
    unsigned short both_Up;   /* +0x14 */
    unsigned short both_Down;   /* +0x16 */
    unsigned short both_Tick;   /* +0x18 */
    unsigned short both_Old;   /* +0x1A */
    BOOL TickDown[16];   /* +0x1C */
    BOOL TickBoth[16];   /* +0x5C */
    unsigned char TickCount[16];   /* +0x9C */
    unsigned short BothTickCount[16];   /* +0xAC */
    unsigned short GazTickCount[16];   /* +0xCC */

    unsigned short GetDown() const;
};

struct Dialog {   /* sizeof 16 */
    int BevelGfx;   /* +0x0 */
    int BorderGfx;   /* +0x4 */
    int BackGfx;   /* +0x8 */
    int DialogOTpos;   /* +0xC */

    Dialog();
    ~Dialog();
    void SetBorder(int Type);
    void SetRGB(unsigned char R, unsigned char G, unsigned char B);
    void Back(int DX, int DY, int DW, int DH);
    int SetOTpos(int OT);
};

class CBlocks {
public:
    static int GetOverlayOtBase();
};

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

struct STRHDR;

struct SFXHDR {   /* sizeof 132 */
    char used;   /* +0x0 */
    char loop;   /* +0x1 */
    char playing;   /* +0x2 */
    char state;   /* +0x3 */
    BOOL TaskAlive;   /* +0x4 */
    struct STRHDR *StreamHND;   /* +0x8 */
    unsigned char type;   /* +0xC */
    unsigned char ChunkGot;   /* +0xD */
    int voice;   /* +0x10 */
    int volume;   /* +0x14 */
    int s_volume;   /* +0x18 */
    int pitch;   /* +0x1C */
    int stream_sec;   /* +0x20 */
    int stream_offs;   /* +0x24 */
    int stream_read;   /* +0x28 */
    int stream_stall;   /* +0x2C */
    int stream_pos;   /* +0x30 */
    int SPU_frame;   /* +0x34 */
    int SPU_sec;   /* +0x38 */
    int SPU_pos;   /* +0x3C */
    int SPUstreamaddr;   /* +0x40 */
    int framecount;   /* +0x44 */
    int lastcount;   /* +0x48 */
    int sec_num;   /* +0x4C */
    int SPU_sec_num;   /* +0x50 */
    int ah;   /* +0x54 */
    int stream_ending;   /* +0x58 */
    int DMA_size;   /* +0x5C */
    int spu_rate;   /* +0x60 */
    int SizeIn;   /* +0x64 */
    unsigned char *mem;   /* +0x68 */
    unsigned long stream_playing;   /* +0x6C */
    int SfxNo;   /* +0x70 */
    char name[14];   /* +0x74 */
};

struct TextDataStruct {   /* PSX layout: 12 bytes (no txtspd field -- speed is computed by CalcTextSpeed) */
    char *txtstr;
    unsigned char scrlltxt;
    int sfxnr;
};
struct DEF_ARGS {   /* sizeof 16 */
    unsigned long a0;   /* +0x0 */
    unsigned long a1;   /* +0x4 */
    unsigned long a2;   /* +0x8 */
    unsigned long a3;   /* +0xC */
};
