/* KANJI.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/KANJI.CPP).  No PC twin: the Japanese
 * text layer.  Loads the per-database kanji bitmap font (maintxt/credtxt/questtxt/backtxt.out) into
 * KanjiFontData, and builds 12x12 kanji glyphs on demand into a small VRAM cache (KanjiList, LRU by
 * count) returned as POLY_FT4s.  Sources: retail asm oracle > SYM (scratch/tuinfo.py KANJI.CPP; the SYM
 * text also gives each function its STAT/EXT class) > skel/PSXSRC/KANJI.CPP drafts.
 * TUTILS.H's static tpage helpers and the GMAN.H/BLOCK.H/PRIMPOOL.H inlines are emitted in this object. */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"
#include "psxsrc/textfileinfo_header.h"
#include "psxsrc/fileio.h"

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "psxsrc/KANJI.CPP", line)   /* retail line literals */

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

struct DEF_ARGS {   /* sizeof 16 */
    unsigned long a0;   /* +0x0 */
    unsigned long a1;   /* +0x4 */
    unsigned long a2;   /* +0x8 */
    unsigned long a3;   /* +0xC */
};

enum KANJI_FRMS { KANJI_QUEST = 0, KANJI_MAIN = 1 };
enum LANG_DB_NO { LANG_DB_MAIN = 0, LANG_DB_QUEST = 1, LANG_DB_BACK = 2, LANG_DB_CREDITS = 3 };

struct vbuffS {   /* sizeof 4 */
    short kan;   /* +0x0 */
    unsigned char count;   /* +0x2 */
};

struct DECOMP_BUFFER {   /* sizeof 8 */
    unsigned long TpX;   /* +0x0 */
    unsigned long TpY;   /* +0x4 */
};

struct ALL_DECOMP_BUFFERS {   /* sizeof 12 */
    unsigned long NumOfBuffers;   /* +0x0 */
    struct DECOMP_BUFFER TheBuffers[1];   /* +0x4 */
};

struct FRAME_HDR {   /* sizeof 12 */
    unsigned int FrOffset : 32;
    int X : 8;
    int Y : 8;
    unsigned int PalNum : 8;
    unsigned int NotTrans : 1;
    unsigned int Rotated : 1;
    unsigned int InVRAM : 1;
    unsigned int CompType : 2;
    unsigned int Floor : 1;
    unsigned int Cycle : 1;
    unsigned int pad : 1;
    unsigned int W : 9;
    unsigned int H : 9;
    unsigned int PentaGram : 1;
    unsigned int pad2 : 13;
};

struct SPR_HDR {   /* sizeof 40 */
    unsigned int DecompOffset : 32;
    unsigned int CreatureOffset : 32;
    unsigned int PalOffset : 32;
    unsigned int FrameOffset : 32;
    unsigned int BaseFrame : 32;
    unsigned int DestTPage : 32;
    unsigned int ComponentOffset : 32;
    unsigned int NumOfCreatures : 32;
    unsigned int NumOfFrames : 16;
    unsigned int NumOfPals : 16;
    unsigned int TWidth : 8;
    unsigned int THeight : 8;
    unsigned int IsTiles : 8;
    unsigned int Spare : 8;
};

struct CTextFileInfo;

struct TextDat {   /* sizeof 112 */
    BOOL OwnDat;   /* +0x0 */
    int TexNum;   /* +0x4 */
    int LastFrame;   /* +0x8 */
    BOOL DatLoaded;   /* +0xC */
    long hndDat;   /* +0x10 */
    long hndHdr;   /* +0x14 */
    long hndPalOffset;   /* +0x18 */
    long hndCreatureOffset;   /* +0x1C */
    long hndBlockOffsets;   /* +0x20 */
    struct FRAME_HDR *Frames;   /* +0x24 */
    struct SPR_HDR *Hdr;   /* +0x28 */
    void *Pals;   /* +0x2C */
    int *PalOffset;   /* +0x30 */
    int *CreatureOffset;   /* +0x34 */
    unsigned char *CreatureAnims;   /* +0x38 */
    unsigned char *Blocks;   /* +0x3C */
    BOOL Loaded;   /* +0x40 */
    int LoadCount;   /* +0x44 */
    struct CTextFileInfo *FileInfo;   /* +0x48 */
    long hndDecompBuffer;   /* +0x4C */
    int DecX;   /* +0x50 */
    int DecY;   /* +0x54 */
    int PalX;   /* +0x58 */
    int PalY;   /* +0x5C */
    int Scr;   /* +0x60 */
    int NumOfBuffers[2];   /* +0x64 */
    long hndDecompArrays;   /* +0x6C */

    void SetPal(struct FRAME_HDR *Fr, POLY_FT4 *FT4);   /* @0x80093DD4 GMAN.CPP:1358 */
    /* GMAN.H in-class inlines (out-of-line copies land in this TU) */
    inline struct ALL_DECOMP_BUFFERS *GetDecompBuffers();
    inline struct FRAME_HDR *GetFr(int FrNum);
    void DumpDatFile();
};

inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

/* Original CPLAYER.H layout and unused inline retain its diagnostic filename. */
class CPlayer : public TextDat {
public:
    long hndDatMem;
    unsigned short NumOfPlayers;
    BOOL InTown;
    unsigned short PlayerNum, Tpage;
    int TexId, LastScrX, LastScrY, LastOtPos;
    static CPlayer *PActiveArray[2];
    static CPlayer *GetPlayer(int PNum)
    {
        if ((unsigned)PNum >= 2) DBG_Error(NULL, "psxsrc/cplayer.h", 65);
        return PActiveArray[PNum];
    }
};

class CBlocks : public TextDat {   /* sizeof 264; only the fields touched here are named */
public:
    struct TextDat *MonstTexDat;    /* +0x70 */
    struct TextDat *ObjTexDat;      /* +0x74 */
    struct MonstList *MonsterList;  /* +0x78 */
    int RndX, RndY;                 /* +0x7C, +0x80 */
    int MonstTexId;                 /* +0x84 */
    unsigned char _rest[264 - 0x88];   /* +0x88 .. sizeof 264 (SYM) */

    void SetTownersGraphics();                              /* @BLOCK.CPP */
    void DumpGraphics(struct TextDat **TDat, int *Id);     /* @BLOCK.CPP */
    /* BLOCK.H:228 */
    inline void DumpMonsters();
};

/* ---- externals ---- */
extern "C" {
void *memset(void *s, int c, unsigned long n);
int LoadImage2(RECT *rect, unsigned long *p);
void TSK_Sleep(int Frames);
TASK *TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);
TASK *TSK_Exist(TASK *T, unsigned long Id, unsigned long Mask);
}
FileIO *SYSI_GetFs(void);
void stream_stop(void);
BOOL BL_LoadFileAtAddr(char *Name, unsigned char *Dest, char LumpID);
void BL_WaitForAsyncFinish(void);
BOOL IsGameLoading(void);
BOOL GLUE_SetShowGameScreenFlag(BOOL NewFlag);
void GLUE_ResumeGame(void);
TextDat *GM_UseTexData(int Id);
void GM_FinishedUsing(TextDat *Fin);
void GM_ForceTpLoad(int Id);
CBlocks *BL_GetCurrentBlocks(void);

extern BOOL CDWAIT;
extern int FileSYS;
extern unsigned char leveltype;
extern unsigned char gbProcessPlayers;
extern unsigned char qtextflag;
extern unsigned char FeFlag;
extern char stextflag;
extern unsigned char questlog;
extern unsigned char PauseMode;
extern TextDat *AllDats[372];

/* ---- TUTILS.H ---- */
static int GetTpY(unsigned short tpage)
{
    return ((tpage << 4) & 0x100) | ((tpage >> 2) & 0x200);
}

static int GetTpX(unsigned short tpage)
{
    return (tpage << 6) & 0x3C0;
}

/* ---- TU data (SYM STAT) ---- */
static KANJI_FRMS KanjiCacheType;                 /* @0x8011C730 sbss */
static struct vbuffS KanjiList[200];              /* @0x8011D078 bss */
static struct ALL_DECOMP_BUFFERS *KanjiBuffers;   /* @0x8011C734 sbss */
static struct FRAME_HDR *KanjiPalFrame;           /* @0x8011C738 sbss */
static unsigned char KanjiFontData[18650];        /* @0x8011D398 bss */
static TextDat *KanjiGfxTData = NULL;             /* @0x8011B2C4 sdata */
static struct vbuffS *KanjiCache = KanjiList;     /* @0x8011B2C8 sdata */
static int CacheLen = 0;                          /* @0x8011B2CC sdata */
static BOOL KanjiLoaded = false;                  /* @0x8011B2D0 sdata */

/* @0x800AD218 KANJI.CPP:71 */
static void LoadKanjiFont(char *name)
{
    FileIO *Fs = SYSI_GetFs();

    CDWAIT = 1;
    stream_stop();
    if (FileSYS != 1 && !IsGameLoading()) {
        BL_LoadFileAtAddr(name, KanjiFontData, 0);
        BL_WaitForAsyncFinish();
    } else {
        Fs->ReadAtAddr(name, KanjiFontData, -1);
    }
}

/* @0x800AD2C4 KANJI.CPP:107 */
void FreeKanji(void)
{
    CacheLen = 0;
}

/* @0x800AD2D0 KANJI.CPP:127 */
void ClearKanjiCount(void)
{
    struct vbuffS *kl = KanjiCache;
    int i;

    for (i = 0; i < CacheLen; i++) {
        kl->count = 0;
        kl++;
    }
}

/* @0x800AD308 KANJI.CPP:139 */
void ClearKanjiBuffer(void)
{
    struct vbuffS *kl = KanjiCache;
    int i;

    for (i = 0; i < CacheLen; i++, kl++)
        kl->kan = 0;
    ClearKanjiCount();
}

/* @0x800AD34C KANJI.CPP:154 */
static void KANJI_SetCache(KANJI_FRMS ct)
{
    CBlocks *BgBlocks = BL_GetCurrentBlocks();

    KanjiCacheType = ct;
    switch (ct) {
    case KANJI_MAIN:
        CacheLen = 80;
        break;
    case KANJI_QUEST:
        CacheLen = 200;
        break;
    }
    if (ct == KANJI_QUEST) {
        TextDat *Dat;
        if (BgBlocks) {
            GLUE_SetShowGameScreenFlag(false);
            if (!leveltype)
                BgBlocks->DumpMonsters();
        }
        CDWAIT = 1;
        if (!KanjiGfxTData) {
            KanjiGfxTData = GM_UseTexData(FeFlag ? 0x123 : 0x122);
            ASSERT(KanjiGfxTData, 0xB8);
        }
        KanjiBuffers = KanjiGfxTData->GetDecompBuffers();
        ASSERT(KanjiBuffers, 0xBB);
        Dat = AllDats[0];
        ASSERT(Dat, 0xBE);
        KanjiPalFrame = Dat->GetFr(0x39);
        ASSERT(KanjiPalFrame, 0xC1);
    } else {
        TextDat *Dat;
        if (KanjiGfxTData) {
            GM_FinishedUsing(KanjiGfxTData);
            KanjiGfxTData = NULL;
        }
        if (BgBlocks) {
            CDWAIT = 1;
            if (leveltype) {
                GM_ForceTpLoad(0xD0);
            } else {
                BgBlocks->SetTownersGraphics();
                GM_ForceTpLoad(0xCD);
            }
            GLUE_SetShowGameScreenFlag(true);
        }
        if (FeFlag || (!stextflag && !questlog)) {
            TASK *T = TSK_Exist(NULL, 0x4000, 0xFFFFFFFF);
            if (T)
                GLUE_ResumeGame();
        }
        Dat = AllDats[0];
        ASSERT(Dat, 0xE6);
        KanjiBuffers = Dat->GetDecompBuffers();
        ASSERT(KanjiBuffers, 0xE9);
        KanjiPalFrame = Dat->GetFr(0x39);
        ASSERT(KanjiPalFrame, 0xEC);
    }
}

/* @0x800AD5D8 KANJI.CPP:245 */
void LoadKanji(LANG_DB_NO NewLangDbNo)
{
    FreeKanji();
    switch (NewLangDbNo) {
    case LANG_DB_MAIN:
        LoadKanjiFont("maintxt.out");
        KANJI_SetCache(KANJI_MAIN);
        if (qtextflag) {
            qtextflag = 0;
            PauseMode = 0;
            if (!FeFlag)
                gbProcessPlayers = 1;
        }
        break;
    case LANG_DB_CREDITS:
        LoadKanjiFont("credtxt.out");
        KANJI_SetCache(KANJI_MAIN);
        break;
    case LANG_DB_QUEST:
        LoadKanjiFont("questtxt.out");
        KANJI_SetCache(KANJI_QUEST);
        break;
    case LANG_DB_BACK:
        LoadKanjiFont("backtxt.out");
        KANJI_SetCache(KANJI_QUEST);
        break;
    }
    ASSERT(CacheLen, 0x114);
    ClearKanjiBuffer();
}

/* @0x800AD708 KANJI.CPP:286 */
BOOL SetKanjiLoaded(BOOL loaded)
{
    BOOL iret = KanjiLoaded;
    KanjiLoaded = loaded;
    return iret;
}

/* @0x800AD718 KANJI.CPP:294 */
BOOL IsKanjiLoaded(void)
{
    return KanjiLoaded;
}

/* @0x800AD724 KANJI.CPP:300 */
void KanjiSetTSK(TASK *T)
{
    struct DEF_ARGS *args = (struct DEF_ARGS *)T->Data;
    LANG_DB_NO NewLangDbNo = (LANG_DB_NO)args->a0;

    if (!FeFlag)
        TSK_Sleep(5);
    LoadKanji(NewLangDbNo);
    KanjiLoaded = true;
    CDWAIT = 0;
}

/* @0x800AD77C KANJI.CPP:317 */
void KANJI_SetDb(LANG_DB_NO NewLangDbNo)
{
    TASK *T;
    struct DEF_ARGS *args;

    T = TSK_AddTask(0, (void (*)())KanjiSetTSK, 0x1000, sizeof(struct DEF_ARGS));
    ASSERT(T, 0x144);
    args = (struct DEF_ARGS *)T->Data;
    KanjiLoaded = false;
    CDWAIT = 1;
    args->a0 = NewLangDbNo;
}

/* @0x800AD7F4 KANJI.CPP:336 */
static int inmem(short k)
{
    struct vbuffS *kl = KanjiCache;

    ASSERT(CacheLen, 0x153);
    for (int i = 0; i < CacheLen; i++, kl++) {
        if (kl->kan == k)
            return i + 1;
    }
    return 0;
}

/* @0x800AD87C KANJI.CPP:351 */
static unsigned short getb(unsigned short n)
{
    n &= 0x7FFF;
    n--;
    return n;
}

/* @0x800AD88C KANJI.CPP:365 */
static void ShadeBuff(unsigned char *b, int col, int border)
{
    for (int y = 0; y < 12; y++) {
        for (int x = 0; x < 12; x++) {
            if ((char)*b == col) {
                if (col == 7 && x) {
                    b--;
                    if (!*b)
                        *b = border;
                    b++;
                }
                if (x < 11) {
                    b++;
                    if (!*b)
                        *b = border;
                    b--;
                }
                if (col == 7 && y) {
                    b -= 12;
                    if (!*b)
                        *b = border;
                    b += 12;
                }
                if (y < 11) {
                    b += 12;
                    if (!*b)
                        *b = border;
                    b -= 12;
                }
                if (col == 7 && x && y) {
                    b -= 13;
                    if (!*b)
                        *b = border;
                    if (x < 11) {
                        b += 2;
                        if (!*b)
                            *b = border;
                        b += 11;
                    } else {
                        b += 13;
                    }
                }
                if (x < 11 && y < 11) {
                    b += 13;
                    if (!*b)
                        *b = border;
                    if (col == 7 && x) {
                        b -= 2;
                        if (!*b)
                            *b = border;
                        b -= 11;
                    } else {
                        b -= 13;
                    }
                }
            }
            b++;
        }
    }
}

/* @0x800ADA34 KANJI.CPP:450 */
static void Crunch(unsigned char *s, unsigned char *db)
{
    int c;
    unsigned short *d = (unsigned short *)db;

    for (int y = 0; y < 12; y++) {
        for (int x = 0; x < 3; x++) {
            c = *s++;
            c |= *s++ << 4;
            c |= *s++ << 8;
            c |= *s++ << 12;
            *d++ = c;
        }
    }
}

/* @0x800ADAA8 KANJI.CPP:474 */
static void _get_font(unsigned char *d, unsigned short num, unsigned char *abuff)
{
    unsigned char *bp;
    long i;
    char bcy;
    char shift;

    bp = abuff + getb(num);
    ASSERT(bp, 0x1E2);
    bcy = *bp++;
    memset(d, 0, 144);
    shift = 1;
    for (i = 0; i < 132; i++) {
        if (bcy & shift)
            *d = 7;
        shift <<= 1;
        d++;
        if (!shift) {
            shift = 1;
            bcy = *bp++;
        }
    }
}

/* @0x800ADB68 KANJI.CPP:507 */
static int getfreekan(void)
{
    unsigned char max = 255;
    int n = -1;
    struct vbuffS *kl = KanjiCache;

    ASSERT(CacheLen, 0x200);
    ASSERT(kl, 0x201);
    for (int i = 0; i < CacheLen; i++, kl++) {
        if (kl->count < max) {
            max = kl->count;
            n = i;
        }
    }
    return n;
}

/* @0x800ADC20 KANJI.CPP:530 */
KANJI_FRMS GetKanjiCacheFrm(void)
{
    return KanjiCacheType;
}

/* @0x800ADC2C KANJI.CPP:535 */
inline FRAME_HDR *TextDat::GetFr(int FrNum)
{
    return Frames + (unsigned short)FrNum;
}
inline ALL_DECOMP_BUFFERS *TextDat::GetDecompBuffers()
{
    if (Hdr->DecompOffset)
        return (ALL_DECOMP_BUFFERS *)((unsigned char *)Hdr + Hdr->DecompOffset);
    return NULL;
}
inline void CBlocks::DumpMonsters()
{
    MonsterList = NULL;
    DumpGraphics(&MonstTexDat, &MonstTexId);
}
#include "psxsrc/primpool.h"

POLY_FT4 *GetKanjiFrm(unsigned short kan)
{
    POLY_FT4 *ft4;
    int im;
    RECT r;
    unsigned char deBuff[144];
    unsigned char dekbuff[144];
    struct vbuffS *kl;
    TextDat *Dat;
    int TpX;
    int TpY;
    unsigned char *kbuff;
    unsigned char *kanjbuff;
    int U;
    int V;

    GetKanjiCacheFrm();
    Dat = AllDats[0];
    PRIM_GetPrim(&ft4);
    ASSERT(ft4, 0x22A);
    setPolyFT4(ft4);
    ASSERT(Dat, 0x233);
    ASSERT(KanjiPalFrame, 0x234);
    Dat->SetPal(KanjiPalFrame, ft4);
    im = inmem(kan);
    if (im) {
        im--;
        kl = &KanjiCache[im];
        if (kl->count < 255)
            kl->count++;
        TpX = KanjiBuffers->TheBuffers[im].TpX;
        TpY = KanjiBuffers->TheBuffers[im].TpY;
    } else {
        im = getfreekan();
        kl = &KanjiCache[im];
        kl->kan = kan;
        kl->count = 1;
        kanjbuff = KanjiFontData;
        ASSERT(kanjbuff, 0x250);
        kbuff = deBuff;
        _get_font(kbuff, kan, kanjbuff);
        ShadeBuff(kbuff, 7, 2);
        ShadeBuff(kbuff, 2, 1);
        Crunch(kbuff, dekbuff);
        r.x = KanjiBuffers->TheBuffers[im].TpX;
        r.y = KanjiBuffers->TheBuffers[im].TpY;
        r.w = 3;
        r.h = 12;
        TpX = r.x;
        TpY = r.y;
        LoadImage2(&r, (unsigned long *)dekbuff);
    }
    ft4->tpage = getTPage(0, 0, TpX, TpY);
    U = (TpX << 2) & 0xFF;
    V = TpY & 0xFF;
    setUVWH(ft4, U, V, 12, 12);
    return ft4;
}
