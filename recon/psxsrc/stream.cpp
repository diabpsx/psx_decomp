/* STREAM.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/STREAM.CPP).  No PC twin: the PSX SPU
 * audio streamer.  Two SFXHDR stream slots (SFXTab) are fed from the CD in 0x3000-byte chunks
 * (STR_PlayStream -> STR_DMAControl -> SpuWrite) by a per-stream async task (STR_AsyncTASK for music,
 * STR_AsyncWeeTASK for short files), with pause/resume/fade handled by a small command state machine
 * (STR_SoundCommand / STR_Command).  Also the CD-wait spinner task.
 * Sources: retail asm oracle > SYM (scratch/tuinfo.py STREAM.CPP; SYM text gives STAT/EXT per function)
 * > skel/PSXSRC/STREAM.CPP drafts.  Layouts from tools/symhdr.py. */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "glibdev/gdebug.h"

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "psxsrc/STREAM.CPP", line)   /* retail line literals */

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

struct STRHDR {   /* sizeof 20 */
    unsigned char Name[12];   /* +0x0 */
    unsigned long Offset;   /* +0xC */
    int Size;   /* +0x10 */
};

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

struct SpuVolume {   /* sizeof 4 */
    short left;   /* +0x0 */
    short right;   /* +0x2 */
};

struct SpuVoiceAttr {   /* sizeof 64 */
    unsigned long voice;   /* +0x0 */
    unsigned long mask;   /* +0x4 */
    struct SpuVolume volume;   /* +0x8 */
    struct SpuVolume volmode;   /* +0xC */
    struct SpuVolume volumex;   /* +0x10 */
    unsigned short pitch;   /* +0x14 */
    unsigned short note;   /* +0x16 */
    unsigned short sample_note;   /* +0x18 */
    short envx;   /* +0x1A */
    unsigned long addr;   /* +0x1C */
    unsigned long loop_addr;   /* +0x20 */
    long a_mode;   /* +0x24 */
    long s_mode;   /* +0x28 */
    long r_mode;   /* +0x2C */
    unsigned short ar;   /* +0x30 */
    unsigned short dr;   /* +0x32 */
    unsigned short sr;   /* +0x34 */
    unsigned short rr;   /* +0x36 */
    unsigned short sl;   /* +0x38 */
    unsigned short adsr1;   /* +0x3A */
    unsigned short adsr2;   /* +0x3C */
};

enum LANG_TYPE { LANG_ENGLISH = 0, LANG_FRENCH = 1, LANG_GERMAN = 2, LANG_SWEDISH = 3, LANG_JAP = 4, LANG_NONE = 5 };

struct TextDat {   /* sizeof 112 (SYM); members not used here */
    unsigned char body[112];
    struct POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);   /* @0x80093418 GMAN.CPP:989 */
};
struct PlayerStruct {   /* sizeof 6632 -- only plractive is read here */
    int _pmode;              /* +0x0 */
    char walkpath[25];       /* +0x4 */
    unsigned char plractive; /* +0x1D */
    unsigned char rest[6632 - 0x1E];
};
struct TSFX;

/* ---- externals ---- */
extern "C" {
int sprintf(char *buf, const char *fmt, ...);
int printf(const char *fmt, ...);
char *strcpy(char *dst, const char *src);
int strcmp(const char *a, const char *b);
void TSK_Sleep(int Frames);
TASK *TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);
void TSK_MakeTaskImmortal(TASK *T);
void systemtask(TASK *T);
long GetVideoMode(void);
long SpuMalloc(long size);
long SpuSetTransferMode(long mode);
unsigned long SpuSetTransferStartAddr(unsigned long addr);
unsigned long SpuWrite0(unsigned long size);
unsigned long SpuWrite(unsigned char *addr, unsigned long size);
long SpuIsTransferCompleted(long flag);
unsigned long SpuSetReverbVoice(long on_off, unsigned long voice_bit);
void SpuSetVoiceAttr(struct SpuVoiceAttr *arg);
void SpuSetKeyOnWithAttr(struct SpuVoiceAttr *attr);
void SpuSetKey(long on_off, unsigned long voice_bit);
void SpuFree(unsigned long addr);
}
TextDat *GM_UseTexData(int Id);
void PRIM_FullScreen(int Depth);
BOOL IsGameLoading(void);
unsigned long VID_GetTick(void);
LANG_TYPE LANG_GetLang(void);
void AS_CloseStream(STRHDR *sh, SFXHDR *sfh);
int AS_OpenStream(STRHDR *sh, SFXHDR *sfh);
char AS_GetBlock(SFXHDR *sfh);
void AS_WasLastBlock(int ah, STRHDR *sh, SFXHDR *sfh);
BOOL BL_CloseStreamFile(STRHDR *StreamHDR);
STRHDR *BL_OpenStreamFile(char *Name, char LumpID);
BOOL GLUE_HasGameStarted(void);

extern struct PlayerStruct plr[2];
extern unsigned char FeFlag;
extern unsigned char qtextflag;
extern unsigned char leveltype;
extern int FileSYS;
extern long sglMasterVolume;
extern long sglMusicVolume;
extern long sglSoundVolume;
extern long sglSpeechVolume;
extern struct SFXHDR *sghMusic;
extern struct SFXHDR *sghStream;
extern struct TSFX *sgpStreamSFX;
extern int sgnMusicTrack;
extern unsigned short sgszMusicTracks[6];
extern BOOL FRIGFLAG;

void STR_Debug(SFXHDR *, char *, ...);
void STR_SystemTask(TASK *);
void STR_AllocBuffer();
SFXHDR *STR_InitStream(char);
void STR_setvolume(SFXHDR *);
void STR_setpitch(SFXHDR *);
void STR_PlaySFX(SFXHDR *);
void STR_CloseStream(SFXHDR *);
void STR_SoundCommand(SFXHDR *, int);
char STR_Command(SFXHDR *);
void STR_DMAControl(SFXHDR *);
void STR_PlayStream(SFXHDR *, unsigned char *, int);
void STR_AsyncWeeTASK(TASK *);
void STR_AsyncTASK(TASK *);
void STR_StreamMainTask(SFXHDR *, char);

/* ---- TU data ---- */
SFXHDR SFXTab[2] = { { 0 } };            /* @0x800B9BE0 (.data) */
unsigned long STR_Buffer[18432] = { 0 }; /* @0x800B9CE8 (.data) */
struct SpuVoiceAttr voice_attr = { 0 };  /* @0x800CBCE8 (.data) */
SFXHDR STRSave = { 0 };                  /* @0x800CBD28 (.data) */
static BOOL SavePause;                   /* @0x8011C6A4 (sbss) */
char NoActiveStreams = 0;                /* @0x8011ADBD (.sdata) */
static BOOL STRInit = false;             /* @0x8011ADC0 */
static int frame_rate = 60;              /* @0x8011ADC4 */
static unsigned char CDAngle = 0;        /* @0x8011ADC8 */
int my_spurate = 0x7E;                   /* @0x8011ADCC */
unsigned long Time = 0;                  /* @0x8011ADE8 */
BOOL CDWAIT = false;                     /* @0x8011ADEC */

/* @0x80098988 STREAM.CPP:166 */
static void PrintCDWaitTask(TASK *T)
{
    TextDat *CDGfxData = GM_UseTexData(0);
    POLY_FT4 *Ft4;

    while (1) {
        if (CDWAIT) {
            int cdx;
            int cdy;
            PRIM_FullScreen(300);
            cdx = 0x120 - (((CDAngle >> 1) + 1) & 1);
            cdy = 0xD0;
            if (!IsGameLoading() && !FeFlag && !qtextflag && (unsigned char)plr[1]._pmode)
                cdx -= 0x80;
            Ft4 = CDGfxData->PrintFt4(0, cdx, cdy, (CDAngle >> 1) & 1, 0x1FE, 0);
            Ft4->r0 = 0x80;
            Ft4->g0 = 0x80;
            Ft4->b0 = 0x80;
            setShadeTex(Ft4, 0);
            CDAngle++;
        }
        TSK_Sleep(1);
    }
}

/* @0x80098AC4 STREAM.CPP:197 */
void InitCDWaitIcon(void)
{
    CDWAIT = false;
    TSK_AddTask(0x8000, (void (*)())PrintCDWaitTask, 0x800, 0);
}

/* @0x80098AF8 STREAM.CPP:209 */
void STR_Debug(SFXHDR *sfh, char *e, ...)
{
}

/* @0x80098B0C STREAM.CPP:424 */
void STR_SystemTask(TASK *T)
{
    while (1) {
        systemtask(NULL);
        TSK_Sleep(1);
    }
}

/* @0x80098B3C STREAM.CPP:456 */
void STR_AllocBuffer(void)
{
    if (FileSYS == 2) {
        for (int i = 0x47FF; i >= 0; i--)
            STR_Buffer[i] = 0;
    }
}

/* @0x80098B74 STREAM.CPP:472 */
void STR_Init(void)
{
    if (!STRInit) {
        long vm = GetVideoMode();
        switch (vm) {
        case 0:
            frame_rate = 60;
            break;
        case 1:
            frame_rate = 50;
            break;
        }
        STR_AllocBuffer();
        unsigned char *ptr = (unsigned char *)STR_Buffer;
        Time = 0;
        for (int i = 0; i < 2; i++) {
            SFXTab[i].mem = ptr;
            ptr += 0x9000;
            SFXTab[i].used = 0;
            SFXTab[i].SPUstreamaddr = 0;
            SFXTab[i].voice = i;
        }
        TASK *T = TSK_AddTask(0, (void (*)())STR_SystemTask, 0x800, 0);
        ASSERT(T, 0x1FF);
        TSK_MakeTaskImmortal(T);
        InitCDWaitIcon();
        sglMasterVolume = 0xE6;
        sglMusicVolume = 0x1FFF;
        sglSoundVolume = 0x1FFF;
        sglSpeechVolume = 0x1FFF;
        STRInit = true;
    }
}

/* @0x80098CA0 STREAM.CPP:531 */
SFXHDR *STR_InitStream(char flag)
{
    SFXHDR *sfh = &SFXTab[flag];

    if (sfh->used == 0) {
    sfh->used = 1;
    sfh->state = 1;
    sfh->framecount = VID_GetTick();
    sfh->lastcount = VID_GetTick();
    sfh->stream_playing = 2;
    sfh->pitch = 0x3FC;
    sfh->stream_sec = 0;
    sfh->stream_pos = 0;
    sfh->sec_num = 0;
    sfh->SPU_frame = 0;
    sfh->SPU_sec = 0;
    sfh->SPU_pos = 0;
    sfh->SPU_sec_num = 0;
    sfh->stream_offs = 0;
    sfh->playing = 0;
    sfh->stream_read = 0;
    sfh->stream_stall = 0;
    sfh->stream_ending = 0;
    sfh->voice = flag;
    sfh->DMA_size = 0;
    sfh->ChunkGot = 0;
    sfh->spu_rate = 0x69;
    sfh->SPUstreamaddr = SpuMalloc(0x8EA0);
    ASSERT(sfh->SPUstreamaddr != -1, 0x23E);
    SpuSetTransferMode(0);
    SpuSetTransferStartAddr(sfh->SPUstreamaddr);
    SpuWrite0(0x8E80);
    SpuIsTransferCompleted(1);
    NoActiveStreams++;
    return sfh;
    }
    return NULL;
}

/* @0x80098DC8 STREAM.CPP:597 */
SFXHDR *STR_PlaySound(unsigned short Name, char flag, int volume, char loop)
{
    SFXHDR *sfh;
    char tstring[32];
    char Prefix[2];

    STR_Init();
    if (!flag) {
        LANG_TYPE Lang = LANG_GetLang();
        switch (Lang) {
        case LANG_ENGLISH:
            Prefix[0] = 'E';
            break;
        case LANG_FRENCH:
            Prefix[0] = 'F';
            break;
        case LANG_GERMAN:
            Prefix[0] = 'G';
            break;
        case LANG_SWEDISH:
            Prefix[0] = 'S';
            break;
        case LANG_JAP:
            Prefix[0] = 'J';
            break;
        case LANG_NONE:
            ASSERT(!"NO LANGUAGE SELECTED ???", 0x277);
            break;
        }
    } else {
        Prefix[0] = 'M';
    }
    switch (Name) {
    case 0xC:
    case 0x2E:
    case 0x69:
    case 0x6B:
    case 0x348:
        Prefix[0] = 'M';
        break;
    }
    Prefix[1] = 0;
    sprintf(tstring, "%s%04X", Prefix, Name);
    flag = (flag + 1) & 1;
    if (!(sfh = STR_InitStream(flag)))
        return NULL;
    flag ^= 1;
    sfh->type = flag;
    sfh->loop = loop;
    sfh->volume = volume;
    sfh->s_volume = volume;
    STR_setvolume(sfh);
    if (flag) {
        sfh->pitch = 0x3FC;
        if (frame_rate == 50)
            sfh->spu_rate = my_spurate;
        else
            sfh->spu_rate = 0x68;
        if (leveltype)
            SpuSetReverbVoice(1, 1 << sfh->voice);
    } else {
        sfh->pitch = 0x3FC;
        if (frame_rate == 50)
            sfh->spu_rate = my_spurate;
        else
            sfh->spu_rate = 0x68;
        SpuSetReverbVoice(0, 1 << sfh->voice);
    }
    sprintf(sfh->name, "%s.VAG", tstring);
    sfh->SfxNo = Name;
    STR_StreamMainTask(sfh, flag);
    return sfh;
}

/* @0x80099010 STREAM.CPP:736 */
void STR_setvolume(SFXHDR *sfh)
{
    voice_attr.mask = 3;
    voice_attr.voice = 1 << sfh->voice;
    voice_attr.volume.left = sfh->volume;
    voice_attr.volume.right = sfh->volume;
    LANG_TYPE lang = LANG_GetLang();
    if ((lang == LANG_FRENCH || lang == LANG_SWEDISH) && sfh->voice == 1) {
        voice_attr.volume.left <<= 1;
        voice_attr.volume.right <<= 1;
    }
    SpuSetVoiceAttr(&voice_attr);
}

/* @0x800990DC STREAM.CPP:761 */
void STR_setpitch(SFXHDR *sfh)
{
    voice_attr.mask = 0x10;
    voice_attr.voice = 1 << sfh->voice;
    voice_attr.pitch = sfh->pitch;
    SpuSetVoiceAttr(&voice_attr);
}

/* @0x80099128 STREAM.CPP:775 */
void STR_PlaySFX(SFXHDR *sfh)
{
    int offs = sfh->SPU_pos;

    voice_attr.mask = 0xFF93;
    voice_attr.voice = 1 << sfh->voice;
    voice_attr.volume.left = sfh->volume;
    voice_attr.volume.right = sfh->volume;
    voice_attr.pitch = sfh->pitch;
    voice_attr.addr = sfh->SPUstreamaddr + ((offs % 0x8E80) & ~0xF);
    voice_attr.r_mode = 3;
    voice_attr.rr = 3;
    voice_attr.sl = 0xF;
    voice_attr.a_mode = 1;
    voice_attr.s_mode = 1;
    voice_attr.ar = 0;
    voice_attr.dr = 0;
    voice_attr.sr = 0;
    SpuSetKeyOnWithAttr(&voice_attr);
}

/* @0x80099234 STREAM.CPP:816 */
void STR_pauseall(void)
{
    for (int i = 0; i < 2; i++) {
        if (SFXTab[i].used)
            STR_SoundCommand(&SFXTab[i], 3);
    }
}

/* @0x800992A8 STREAM.CPP:831 */
void STR_resumeall(void)
{
    for (int i = 0; i < 2; i++) {
        if (SFXTab[i].used)
            STR_SoundCommand(&SFXTab[i], 4);
    }
}

/* @0x8009931C STREAM.CPP:846 */
void STR_CloseStream(SFXHDR *sfh)
{
    if (sfh->used) {
        NoActiveStreams--;
        sfh->volume = 0;
        sfh->used = 0;
        STR_setvolume(sfh);
        SpuSetKey(0, 1 << sfh->voice);
        SpuFree(sfh->SPUstreamaddr);
    }
}

/* @0x80099388 STREAM.CPP:876 */
void STR_SoundCommand(SFXHDR *sfh, int Command)
{
    if (sfh->state == 6 && Command == 6)
        Command = 1;
    if (sfh->state != 3 && Command == 4)
        return;
    if (Command == 3)
        sfh->s_volume = sfh->volume;
    if (Command == 8) {
        sfh->volume = 0;
        STR_setvolume(sfh);
        AS_CloseStream(sfh->StreamHND, sfh);
        STR_CloseStream(sfh);
        BL_CloseStreamFile(sfh->StreamHND);
        sfh->TaskAlive = false;
        if (!sfh->type) {
            sghStream = NULL;
            sgpStreamSFX = NULL;
        } else {
            sghMusic = NULL;
        }
        sprintf(sfh->name, "BATTER");
    } else {
        sfh->state = Command;
    }
}

/* @0x80099474 STREAM.CPP:927 */
char STR_Command(SFXHDR *sfh)
{
    switch (sfh->state) {
    case 2:
    case 8:
        sfh->loop = 0;
        return 1;
    case 3:
        sfh->volume = 0;
        STR_setvolume(sfh);
        return 0;
    case 4:
        sfh->state = 1;
        sfh->volume = sfh->s_volume;
        STR_PlaySFX(sfh);
        return 0;
    case 5:
        if (sfh->volume >= 0) {
            sfh->volume -= 0x100;
            STR_setvolume(sfh);
            if (FRIGFLAG) {
                sfh->pitch -= 0x40;
                STR_setpitch(sfh);
                return 0;
            }
        } else {
            sfh->state = 8;
            sfh->loop = 0;
        }
        break;
    case 7:
        sfh->SPU_sec = ((sfh->SPU_pos = sfh->stream_pos - 0x5F00) / 0x2F80) % 3;
        sfh->stream_playing = 1;
        sfh->state = 1;
        STR_PlaySFX(sfh);
        return 0;
    case 9:
        STRSave.sec_num = sfh->sec_num;
        STRSave.stream_pos = sfh->stream_pos;
        STRSave.stream_read = sfh->stream_read;
        STRSave.SizeIn = sfh->SizeIn;
        break;
    case 10:
        sfh->sec_num = STRSave.sec_num;
        sfh->stream_pos = STRSave.stream_pos;
        sfh->stream_read = STRSave.stream_read;
        AS_WasLastBlock(sfh->ah, sfh->StreamHND, sfh);
        sfh->SizeIn = STRSave.SizeIn;
        break;
    case 1:   /* retail jump table: state 1 (and 6) -> switch exit */
        break;
    }
    return 0;
}

/* @0x80099664 STREAM.CPP:1013 */
void STR_DMAControl(SFXHDR *sfh)
{
    unsigned char *ptr;
    int DMA_off;
    int sec;

    sec = sfh->stream_sec - 1;
    DMA_off = 0x2F80 - sfh->DMA_size;
    if (sec < 0)
        sec = 2;
    if (sfh->DMA_size > 0) {
        ptr = &sfh->mem[0x80];
        ptr += sec * 0x3000 + DMA_off;
        SpuSetTransferMode(0);
        SpuSetTransferStartAddr(sfh->SPUstreamaddr + sec * 0x2F80 + DMA_off);
        SpuWrite(ptr, 0x17C0);
        SpuIsTransferCompleted(1);
        sfh->DMA_size -= 0x17C0;
    }
}

/* @0x8009972C STREAM.CPP:1042 */
void STR_PlayStream(SFXHDR *sfh, unsigned char *Src, int size)
{
    int sec_num;
    unsigned char *dp;
    int i;
    int read;
    int osize;

    size -= 0x80;
    sec_num = *(unsigned short *)Src;
    dp = Src;
    dp += 0x80;
    if (size & 0xF) {
        STR_Debug(sfh, "ERROR - SFX size not div 16");
        DBG_Error(NULL, "psxsrc/STREAM.CPP", 0x41E);
    }
    if (sec_num != sfh->sec_num)
        STR_SoundCommand(sfh, 7);
    osize = sfh->StreamHND->Size;
    read = sfh->stream_pos;
    osize -= read;
    if (osize < size) {
        for (i = osize; i < size; i++)
            dp[i] = 0;
        for (i = osize; i < size; i += 32) {
            dp[i + 1] = 1;
            dp[i + 17] = 7;
        }
        for (i = 0; i < osize - 32; i += 16)
            dp[i + 1] = 0;
        dp[i + 1] = 1;
        dp[i + 17] = 7;
    } else if (sfh->stream_sec == 0) {
        dp[1] = 6;
        for (i = 16; i < size; i += 16)
            dp[i + 1] = 2;
    } else if (sfh->stream_sec == 2) {
        for (i = 0; i < size - 16; i += 16)
            dp[i + 1] = 2;
        dp[i + 1] = 3;
    } else {
        for (i = 0; i < size; i += 16)
            dp[i + 1] = 2;
    }
    while (sfh->DMA_size)
        STR_DMAControl(sfh);
    sfh->DMA_size = 0x2F80;
    if (!sfh->stream_playing) {
        STR_PlaySFX(sfh);
        sfh->playing = 1;
        sfh->stream_playing = -1;
    } else {
        sfh->stream_playing--;
    }
    sfh->sec_num++;
    sfh->stream_read += 0x80 + size;
    sfh->stream_pos += size;
    sfh->stream_sec++;
    sfh->stream_offs += size;
    if (sfh->stream_sec == 3) {
        sfh->stream_sec = 0;
        sfh->stream_offs = 0;
    }
}

/* @0x800999AC STREAM.CPP:1145 */
void STR_AsyncWeeTASK(TASK *T)
{
    struct DEF_ARGS *A = (struct DEF_ARGS *)T->Data;
    STRHDR *StreamHND;
    SFXHDR *sfh;
    char Done;
    int frame;
    int framediff;
    int AsyncHND;
    unsigned char *ptr;
    char OrigName[14];

    sfh = (SFXHDR *)A->a1;
    StreamHND = (STRHDR *)A->a0;
    strcpy(OrigName, sfh->name);
    AsyncHND = AS_OpenStream(StreamHND, sfh);
    sfh->TaskAlive = true;
    sfh->StreamHND = StreamHND;
    if (AsyncHND == -1) {
        ASSERT(!"ASYNC STREAM OPEN ERROR", 0x48E);
    } else {
        Done = 0;
        sfh->stream_playing = 0;
        while (!Done) {
            int res = strcmp(OrigName, sfh->name);
            if (res) {
                sfh->TaskAlive = false;
                break;
            }
            Done = STR_Command(sfh);
            frame = VID_GetTick();
            framediff = frame - sfh->framecount;
            if (framediff < 0)
                framediff = -framediff;
            if (sfh->SizeIn <= 0)
                Done = 1;
            if (Done) {
                if (sfh->state != 8) {
                    Done = 0;
                    sfh->stream_ending++;
                    if (sfh->SPU_pos >= sfh->stream_pos || sfh->volume <= 0) {
                        STR_SoundCommand(sfh, 8);
                        STR_Debug(sfh, "STREAM ENDED");
                        Done = 1;
                    }
                } else {
                    Done = 1;
                }
            }
            if (sfh->state != 3 && !Done) {
                if (AS_GetBlock(sfh) && !sfh->DMA_size) {
                    STR_Debug(sfh, "CD SEEK TIME %d", frame - sfh->lastcount);
                    ptr = sfh->mem;
                    ptr += sfh->stream_sec * 0x3000;
                    STR_PlayStream(sfh, ptr, 0x3000);
                    AS_WasLastBlock(AsyncHND, StreamHND, sfh);
                    AsyncHND = sfh->ah;
                    sfh->ChunkGot = 0;
                    sfh->stream_stall = 0;
                    sfh->lastcount = frame;
                }
                STR_DMAControl(sfh);
                if (sfh->playing) {
                    sfh->SPU_pos += sfh->spu_rate * framediff;
                    sfh->SPU_frame += framediff;
                    sfh->SPU_sec_num = sfh->SPU_pos / 0x2F80;
                    sfh->SPU_sec = sfh->SPU_sec_num % 3;
                }
            }
            sfh->framecount = frame;
            TSK_Sleep(1);
        }
        if (sfh->TaskAlive) {
            AS_CloseStream(StreamHND, sfh);
            STR_CloseStream(sfh);
            BL_CloseStreamFile(StreamHND);
        }
    }
}

/* @0x80099C84 STREAM.CPP:1281 */
void STR_AsyncTASK(TASK *T)
{
    struct DEF_ARGS *A = (struct DEF_ARGS *)T->Data;
    STRHDR *StreamHND;
    SFXHDR *sfh;
    char Done;
    int latency;
    int frame;
    int framediff;
    int AsyncHND;
    unsigned char *ptr;
    char OrigName[14];

    sfh = (SFXHDR *)A->a1;
    StreamHND = (STRHDR *)A->a0;
    strcpy(OrigName, sfh->name);
    AsyncHND = AS_OpenStream(StreamHND, sfh);
    sfh->TaskAlive = true;
    sfh->StreamHND = StreamHND;
    if (AsyncHND == -1) {
        ASSERT(!"ASYNC STREAM OPEN ERROR", 0x518);
    } else {
        Done = 0;
        while (!Done) {
            int res = strcmp(OrigName, sfh->name);
            if (res) {
                sfh->TaskAlive = false;
                break;
            }
            Done = STR_Command(sfh);
            frame = VID_GetTick();
            framediff = frame - sfh->framecount;
            if (framediff < 0)
                framediff = -framediff;
            latency = sfh->stream_pos - sfh->SPU_pos;
            if (sfh->SizeIn <= 0)
                Done = 1;
            if (Done) {
                if (sfh->state == 8) {
                    Done = 1;
                } else {
                    Done = 0;
                    sfh->stream_ending++;
                    if (sfh->SPU_pos >= sfh->stream_pos || sfh->volume < 0) {
                        if (sfh->loop) {
                            unsigned long vol = sfh->volume;
                            STR_SoundCommand(sfh, 8);
                            if (!sghMusic)
                                sghMusic = STR_PlaySound(sgszMusicTracks[sgnMusicTrack], 1, vol, 1);
                            return;
                        } else {
                            STR_SoundCommand(sfh, 8);
                            STR_Debug(sfh, "STREAM ENDED");
                            Done = 1;
                        }
                    }
                }
            }
            if (latency < 0x2F80 && sfh->playing && !sfh->stream_ending) {
                if (sfh->stream_stall == 1) {
                    sfh->s_volume = sfh->volume;
                    sfh->volume = 0;
                    STR_setvolume(sfh);
                } else {
                    STR_SoundCommand(sfh, 7);
                }
                sfh->stream_stall++;
            }
            if (sfh->state != 3 && !Done) {
                if ((latency < 0x5F01 || !sfh->playing) && !sfh->stream_ending && AS_GetBlock(sfh)) {
                    STR_Debug(sfh, "CD SEEK TIME %d", frame - sfh->lastcount);
                    if (sfh->stream_stall) {
                        sfh->volume = sfh->s_volume;
                        STR_setvolume(sfh);
                        sfh->stream_stall = 0;
                    }
                    ptr = sfh->mem;
                    ptr += sfh->stream_sec * 0x3000;
                    STR_PlayStream(sfh, ptr, 0x3000);
                    AS_WasLastBlock(AsyncHND, StreamHND, sfh);
                    AsyncHND = sfh->ah;
                    sfh->ChunkGot = 0;
                    sfh->lastcount = frame;
                }
                STR_DMAControl(sfh);
                if (sfh->playing) {
                    sfh->SPU_pos += sfh->spu_rate * framediff;
                    sfh->SPU_frame += framediff;
                    sfh->SPU_sec_num = sfh->SPU_pos / 0x2F80;
                    sfh->SPU_sec = sfh->SPU_sec_num % 3;
                }
            }
            sfh->framecount = frame;
            TSK_Sleep(1);
        }
        if (sfh->TaskAlive) {
            AS_CloseStream(StreamHND, sfh);
            STR_CloseStream(sfh);
            BL_CloseStreamFile(StreamHND);
        }
    }
}

/* @0x8009A06C STREAM.CPP:1471 */
void STR_StreamMainTask(SFXHDR *sfh, char FileType)
{
    if (!sfh->type && !FeFlag) {
        while (!GLUE_HasGameStarted())
            TSK_Sleep(1);
    }
    STRHDR *sh = BL_OpenStreamFile(sfh->name, 0);
    struct DEF_ARGS *A;
    if (sh) {
        TASK *T2;
        sfh->SizeIn = sh->Size;
        if (sh->Size <= 0x8E80)
            T2 = TSK_AddTask(0x8000, (void (*)())STR_AsyncWeeTASK, 0x800, sizeof(struct DEF_ARGS));
        else
            T2 = TSK_AddTask(0x8000, (void (*)())STR_AsyncTASK, 0x800, sizeof(struct DEF_ARGS));
        ASSERT(T2, 0x5DC);
        TSK_MakeTaskImmortal(T2);
        A = (struct DEF_ARGS *)T2->Data;
        A->a0 = (unsigned long)sh;
        A->a1 = (unsigned long)sfh;
    } else {
        printf("FILE %s NOT FOUND", sfh->name);
        STR_CloseStream(sfh);
    }
}
