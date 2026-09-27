/* ASYNC.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: streamed sound
 * blocks read asynchronously from STREAM.BIN into an SFX header's buffer; the completion callbacks
 * (one per SFXTab slot) flag the chunk as got. */
#include "diabpsx_types.h"

struct STRHDR {   /* sizeof 20 */
    unsigned char Name[12];
    unsigned long Offset;
    int Size;
};

struct SFXHDR {   /* sizeof 132 */
    char used;
    char loop;
    char playing;
    char state;
    int TaskAlive;
    struct STRHDR *StreamHND;
    unsigned char type;
    unsigned char ChunkGot;
    int voice;
    int volume;
    int s_volume;
    int pitch;
    int stream_sec;
    int stream_offs;
    int stream_read;
    int stream_stall;
    int stream_pos;
    int SPU_frame;
    int SPU_sec;
    int SPU_pos;
    int SPUstreamaddr;
    int framecount;
    int lastcount;
    int sec_num;
    int SPU_sec_num;
    int ah;
    int stream_ending;
    int DMA_size;
    int spu_rate;
    int SizeIn;
    unsigned char *mem;
    unsigned long stream_playing;
    int SfxNo;
    char name[14];
};

extern "C" {
unsigned long ReloadGP(void);
void SetGP(unsigned long gp);
void systemtask(int);
void cancelasyncload(int ah);
void setasyncfile(char *name);
int asyncloadsegmentcallback(int pos, unsigned char *dest, int size, void (*cb)(int));
}

extern struct SFXHDR SFXTab[2];
extern char STREAM_BIN[16];

/* @0x8009A9B4 ASYNC.CPP:88 */
void AS_CallBack0(int ah)
{
    unsigned long OldGp;

    if (!SFXTab[0].ChunkGot) {
        OldGp = ReloadGP();
        SFXTab[0].ChunkGot = 1;
        cancelasyncload(ah);
        systemtask(0);
        SetGP(OldGp);
    }
}

/* @0x8009AA20 ASYNC.CPP:102 */
void AS_CallBack1(int ah)
{
    unsigned long OldGp;

    if (!SFXTab[1].ChunkGot) {
        OldGp = ReloadGP();
        SFXTab[1].ChunkGot = 1;
        cancelasyncload(ah);
        systemtask(0);
        SetGP(OldGp);
    }
}

/* @0x8009AA8C ASYNC.CPP:122 */
void AS_WasLastBlock(int ah, struct STRHDR *sh, struct SFXHDR *sfh)
{
    unsigned char *ptr;

    sfh->SizeIn -= 0x2F80;
    if (sfh->SizeIn > 0) {
        ptr = sfh->mem;
        ptr += sfh->stream_sec * 0x3000;
        setasyncfile(STREAM_BIN);
        systemtask(0);
        if (!sfh->voice)
            ah = asyncloadsegmentcallback(sh->Offset + sfh->stream_read, ptr, 0x3000, AS_CallBack0);
        else
            ah = asyncloadsegmentcallback(sh->Offset + sfh->stream_read, ptr, 0x3000, AS_CallBack1);
        systemtask(0);
        sfh->ah = ah;
    }
}

/* @0x8009AB54 ASYNC.CPP:166 */
int AS_OpenStream(struct STRHDR *sh, struct SFXHDR *sfh)
{
    int ah;

    sfh->SizeIn = sh->Size;
    setasyncfile(STREAM_BIN);
    systemtask(0);
    if (!sfh->voice)
        ah = asyncloadsegmentcallback(sh->Offset, sfh->mem, 0x3000, AS_CallBack0);
    else
        ah = asyncloadsegmentcallback(sh->Offset, sfh->mem, 0x3000, AS_CallBack1);
    systemtask(0);
    sfh->ah = ah;
    return ah;
}

/* @0x8009ABF4 ASYNC.CPP:193 */
char AS_GetBlock(struct SFXHDR *sfh)
{
    systemtask(0);
    return sfh->ChunkGot;
}

/* @0x8009AC24 ASYNC.CPP:205 */
void AS_CloseStream(struct STRHDR *sh, struct SFXHDR *sfh)
{
    if (!AS_GetBlock(sfh)) {
        cancelasyncload(sfh->ah);
        sfh->ChunkGot = 1;
        systemtask(0);
    }
}
