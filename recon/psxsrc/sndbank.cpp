/* SNDBANK.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  PSX-only (no PC twin): the SPU sample
 * bank -- per-level bank upload (LevelN.bnk streamed into SPU RAM, LevelN.bof offset table in main RAM),
 * voice allocation, SFX lookup/remap and key-on, plus the channel-status monitor task.
 * Reconstructed from the raw oracle (asm/nonmatchings/sndbank/*.s) + the SYM; libspu calls = PsyQ 4.0 LIBSPU. */
#include "diabpsx_types.h"
#include "psxsrc/fileio.h"
#include "psxsrc/sysinit.h"

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

struct SpuVolume {   /* sizeof 4 */
    short left;   /* +0x0 */
    short right;   /* +0x2 */
};

struct SpuExtAttr {   /* sizeof 12 */
    struct SpuVolume volume;   /* +0x0 */
    long reverb;   /* +0x4 */
    long mix;   /* +0x8 */
};

struct SpuCommonAttr {   /* sizeof 40 */
    unsigned long mask;   /* +0x0 */
    struct SpuVolume mvol;   /* +0x4 */
    struct SpuVolume mvolmode;   /* +0x8 */
    struct SpuVolume mvolx;   /* +0xC */
    struct SpuExtAttr cd;   /* +0x10 */
    struct SpuExtAttr ext;   /* +0x1C */
};

struct SpuReverbAttr {   /* sizeof 20 */
    unsigned long mask;   /* +0x0 */
    long mode;   /* +0x4 */
    struct SpuVolume depth;   /* +0x8 */
    long delay;   /* +0xC */
    long feedback;   /* +0x10 */
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

struct bank_entry {   /* sizeof 12 */
    unsigned short Name;   /* +0x0 */
    unsigned long offset;   /* +0x4 */
    unsigned short len;   /* +0x8 */
    unsigned short pitch;   /* +0xA */
};

/* ---------------------------------------------------------------- externs */
extern unsigned char leveltype;   /* @0x8011C10D */

extern "C" {
void SpuGetAllKeysStatus(char *status);
long SpuMalloc(long size);
void SpuFree(unsigned long addr);
long SpuInitMalloc(long num, char *top);
void SpuSetKeyOnWithAttr(SpuVoiceAttr *attr);
long SpuSetReverbVoice(long on_off, unsigned long voice_bit);
void SpuSetKey(long on_off, unsigned long voice_bit);
unsigned long SpuWrite(unsigned char *addr, unsigned long size);
unsigned long SpuWrite0(unsigned long size);
long SpuSetTransferMode(long mode);
unsigned long SpuSetTransferStartAddr(unsigned long addr);
long SpuIsTransferCompleted(long flag);
void SpuSetCommonAttr(SpuCommonAttr *attr);
long SpuSetReverbModeParam(SpuReverbAttr *attr);
long SpuSetReverb(long on_off);
long SpuReserveReverbWorkArea(long on_off);
void SpuSetReverbDepth(SpuReverbAttr *attr);
void *GAL_Lock(long Handle);   /* @0x80021774 GAL.C:466 */
unsigned char GAL_Unlock(long Handle);   /* @0x800217DC GAL.C:501 */
unsigned char GAL_Free(long Handle);   /* @0x80021860 GAL.C:544 */
void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */
TASK *TSK_AddTask(unsigned long Id, void (*Main)(TASK *), int StackSize, int DataSize);   /* TASKER.C:141 */
void TSK_Sleep(int Frames);   /* TASKER.C:287 */
int sprintf(char *buf, const char *fmt, ...);
}
BOOL IsGameLoading(void);   /* @0x800A4648 LOADING.CPP:212 */

void SND_StopSnd(int voice);
void SPU_Init(void);
void SND_ClearBank(void);
int SND_FindSFX(unsigned short Name);

/* ---------------------------------------------------------------- data (TU-owned, address order) */
static long OffsetHandle = -1;   /* @0x8011ADFC */
static int BankBase = 0;   /* @0x8011AE00 */
static int NoSNDRemaps = 30;   /* @0x8011AE04 */
char SFXNotPlayed;   /* @0x8011AE08 */
char SFXNotInBank;   /* @0x8011AE09 */
static unsigned short NoSfx;   /* @0x8011C6AC */
static char spu_management[264];   /* @0x8011CC68 */
static SpuReverbAttr rev_attr;   /* @0x8011CD78 */
static unsigned short CHStatus[24];   /* @0x8011CD98 */
static const unsigned short SFXRemapTab[60] = {   /* @0x801109C8: (missing sfx, stand-in) pairs */
    0x0D, 0x31, 0x10, 0x11, 0x17, 0x31, 0x18, 0x1E, 0x2D, 0x2C, 0x2F, 0x2B, 0x2F, 0x1C, 0x43, 0x54,
    0x44, 0x54, 0x4C, 0x23, 0x38, 0x39, 0x53, 0x54, 0x55, 0x54, 0x57, 0x56, 0x6A, 0x23, 0x6D, 0x6C,
    0x70, 0x60, 0x06, 0x3D, 0x385, 0x04, 0x386, 0x37E, 0x387, 0x37F, 0x388, 0x380, 0x3AB, 0x6F, 0x39F, 0x0F,
    0x391, 0x09, 0x39F, 0x0F, 0x36F, 0x367, 0x36E, 0x366, 0x370, 0x368, 0x38C, 0x54
};

/* @0x8009A198 SNDBANK.CPP:145 */
void SND_Monitor(TASK *T)
{
    char status[24];

    while (1) {
        SpuGetAllKeysStatus(status);
        for (int i = 2; i < 24; i++) {
            if (status[i] != 1)
                CHStatus[i] = 0;
        }
        TSK_Sleep(1);
    }
}

/* @0x8009A224 SNDBANK.CPP:164 */
void SPU_OnceOnlyInit(void)
{
    SPU_Init();
    TSK_AddTask(0x8000, SND_Monitor, 0x400, 0);
}

/* @0x8009A25C SNDBANK.CPP:175 */
void SPU_Init(void)
{
    {   /* retail SYM: common_attr sits one level below the body level */
        SpuCommonAttr common_attr;

        for (int i = 2; i < 24; i++) {
            SND_StopSnd(i);
            CHStatus[i] = 0;
        }
        SND_ClearBank();
        SpuInitMalloc(32, spu_management);
        SpuSetTransferMode(0);
        SpuSetTransferStartAddr(0);
        SpuWrite0(0x80000);
        SpuIsTransferCompleted(1);
        common_attr.mask = 3;
        common_attr.mvol.left = 0x3FFF;
        common_attr.mvol.right = 0x3FFF;
        SpuSetCommonAttr(&common_attr);
        rev_attr.mask = 7;
        rev_attr.mode = 5;
        rev_attr.depth.left = 0x666;
        rev_attr.depth.right = 0x666;
        SpuSetReverbModeParam(&rev_attr);
        SpuSetReverb(1);
        SpuReserveReverbWorkArea(1);
        SpuSetReverbVoice(0, 0xFFFFFFFF);
        rev_attr.mask = 6;
        SpuSetReverbDepth(&rev_attr);
    }
}

/* @0x8009A364 SNDBANK.CPP:231 */
int SND_FindChannel(void)
{
    char status[24];
    int count;
    int result = -1;

    SpuGetAllKeysStatus(status);
    for (count = 2; count < 24; count++) {
        if (result != -1)
            break;
        if (status[count] != 1)
            result = count;
    }
    return result;
}

/* @0x8009A3D0 SNDBANK.CPP:254 */
void SND_ClearBank(void)
{
    if (BankBase)
        SpuFree(BankBase);
    if (OffsetHandle != -1) {
        BOOL ok = GAL_Free(OffsetHandle);
        if (!ok)
            DBG_Error(NULL, "psxsrc/SNDBANK.CPP", 263);
        OffsetHandle = -1;
    }
    BankBase = 0;
    NoSfx = 0;
}

/* @0x8009A440 SNDBANK.CPP:278 */
BOOL SndLoadCallBack(unsigned char *Mem, int ReadSoFar, int Size, BOOL LastChunk)
{
    static int DestAddr;

    if (!ReadSoFar)
        DestAddr = BankBase;
    SpuSetTransferMode(0);
    SpuSetTransferStartAddr(DestAddr);
    SpuWrite(Mem, Size);
    SpuIsTransferCompleted(1);
    DestAddr += Size;
    return 1;
}

/* @0x8009A4B8 SNDBANK.CPP:296 */
void SND_LoadBank(int lvlnum)
{
    FileIO *MyFileIO;
    char BankFile[16];

    SND_ClearBank();
    SPU_Init();
    if (lvlnum >= 18)
        DBG_Error(NULL, "psxsrc/SNDBANK.CPP", 308);
    sprintf(BankFile, "Level%d.bnk", lvlnum);
    MyFileIO = SYSI_GetFs();
    BankBase = SpuMalloc(MyFileIO->FileLen(BankFile));
    if (BankBase == -1)
        DBG_Error(NULL, "psxsrc/SNDBANK.CPP", 321);
    MyFileIO->StreamFile(BankFile, 0x8000, SndLoadCallBack, 0, -1);
    sprintf(BankFile, "Level%d.bof", lvlnum);
    OffsetHandle = MyFileIO->Read(BankFile, 1);
    NoSfx = (unsigned short)MyFileIO->FileLen(BankFile) / sizeof(bank_entry);
}

/* @0x8009A5DC SNDBANK.CPP:410 */
int SND_FindSFX(unsigned short Name)
{
    bank_entry *BankOffsets;
    int RetVal;

    BankOffsets = (bank_entry *)GAL_Lock(OffsetHandle);
    if (!BankOffsets)
        DBG_Error(NULL, "psxsrc/SNDBANK.CPP", 416);
    RetVal = -1;
    for (int i = 0; i < NoSfx; i++) {
        if (RetVal != -1)
            break;
        if (BankOffsets[i].Name == Name)
            RetVal = i;
    }
    if (!GAL_Unlock(OffsetHandle))
        DBG_Error(NULL, "psxsrc/SNDBANK.CPP", 427);
    return RetVal;
}

/* @0x8009A6B8 SNDBANK.CPP:453 */
void SND_StopSnd(int voice)
{
    SpuSetReverbVoice(0, 1 << voice);
    SpuSetKey(0, 0xFFFFFFFF);
}

/* @0x8009A6EC SNDBANK.CPP:466 */
BOOL SND_IsSfxPlaying(int SFXNo)
{
    SFXNo++;
    for (int i = 2; i < 24; i++) {
        if (CHStatus[i] == SFXNo)
            return 1;
    }
    return 0;
}

/* @0x8009A728 SNDBANK.CPP:483 */
int SND_RemapSnd(int SFXNo)
{
    for (int i = 0; i < NoSNDRemaps; i++) {
        if (SFXRemapTab[i * 2] == SFXNo)
            return SND_FindSFX(SFXRemapTab[i * 2 + 1]);
    }
    return -1;
}

/* @0x8009A79C SNDBANK.CPP:498 */
int SND_PlaySnd(unsigned short Name, int vol, int pan, int pitchadj)
{
    int RetVal;

    if (!BankBase)
        DBG_Error(NULL, "psxsrc/SNDBANK.CPP", 499);
    RetVal = 0;
    if (!IsGameLoading()) {
        int sfxnum = SND_FindSFX(Name);
        if (sfxnum == -1)
            sfxnum = SND_RemapSnd(Name);
        if (sfxnum == -1) {
            SFXNotInBank = 1;
        } else {
            int voice = SND_FindChannel();
            if (voice != -1) {
                if (Name >= 0x3C5 && Name <= 0x3C8)
                    vol <<= 3;
                if (Name == 0x50)
                    vol <<= 3;
                if (vol >= 0x4000)
                    vol = 0x3FFF;
                bank_entry *BankOffsets = (bank_entry *)GAL_Lock(OffsetHandle);
                if (!BankOffsets)
                    DBG_Error(NULL, "psxsrc/SNDBANK.CPP", 545);
                int Offset = BankOffsets[sfxnum].offset;
                SpuVoiceAttr voice_attr;
                CHStatus[voice] = Name + 1;
                voice_attr.mask = 0x93;
                voice_attr.voice = 1 << voice;
                voice_attr.volume.left = ((0x10000 - pan) * vol) >> 16;
                voice_attr.volume.right = (pan * vol) >> 16;
                voice_attr.pitch = BankOffsets[sfxnum].pitch + pitchadj;
                voice_attr.addr = BankBase + Offset;
                SpuSetKeyOnWithAttr(&voice_attr);
                if (leveltype)
                    SpuSetReverbVoice(1, 1 << voice);
                RetVal = voice;
                if (!GAL_Unlock(OffsetHandle))
                    DBG_Error(NULL, "psxsrc/SNDBANK.CPP", 567);
            }
        }
    }
    return RetVal;
}
