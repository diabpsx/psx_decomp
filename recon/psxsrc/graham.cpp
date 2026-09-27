/* GRAHAM.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the two palette-cycle
 * tasks.  color_cycle rotates the water CLUT (water_clut; the setlevel-4 blood pool gets a red
 * ramp that fades towards the original colours); penta_cycle_task pulses the pentagram CLUT
 * (penta_clut) red once the Diablo quest is active (always in multiplayer). */
#include "diabpsx_types.h"

struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};

struct TASK {   /* sizeof 92 */
    struct TASK *Next;
    struct TASK *Prev;
    unsigned long Id;
    unsigned long SleepTime;
    unsigned long fToInit : 1;
    unsigned long fToDie : 1;
    unsigned long fKillable : 1;
    unsigned long fActive : 1;
    unsigned long fXtraStack : 1;
    void *Stack;
    unsigned long StackSize;
    void *Data;
    int TskEnv[12];
    void (*Main)();
    long hndTask;
    unsigned short XtraLongs;
    unsigned short MaxStackSizeBytes;
};

struct QuestStruct {   /* sizeof 20 */
    unsigned char _qlevel;
    unsigned char _qtype;
    unsigned char _qactive;
    unsigned char _qlvltype;
    int _qtx;
    int _qty;
    unsigned char _qslvl;
    unsigned char _qidx;
    unsigned char _qmsg;
    unsigned char _qvar1;
    unsigned char _qvar2;
    unsigned char _qlog;
    unsigned char pad_for_laz;
};

#define Q_DIABLO 5
#define QUEST_ACTIVE 2

extern "C" {
void TSK_Sleep(int Frames);
int LoadImage(struct RECT *rect, unsigned long *p);
int StoreImage(struct RECT *rect, unsigned long *p);
int DrawSync(int mode);
}
BOOL GLUE_Finished(void);

extern struct QuestStruct quests[16];
extern unsigned char gbMaxPlayers;
extern BOOL DoDrawBg;
extern unsigned char PauseMode;
extern unsigned char setlevel;
extern unsigned char setlvlnum;
extern BOOL WaterDone;

unsigned short water_clut;
unsigned short penta_clut;
BOOL penta_cycle;

/* @0x8009DCB0 GRAHAM.CPP:233 */
void color_cycle(struct TASK *T)
{
    struct RECT ClutR;
    int cx, cy;
    unsigned short ORIGPal[16];
    unsigned short VRAMPal[16];
    unsigned short CLUTPal[16];
    int paloffset;
    int y;
    BOOL ch;

    paloffset = 0;
    penta_clut = 0;
    water_clut = 0;
    do {
        if (GLUE_Finished())
            return;
        TSK_Sleep(1);
    } while (!water_clut);

    cx = (water_clut & 0x3F) << 4;
    ClutR.x = cx;
    cy = water_clut >> 6;
    ClutR.y = cy;
    ClutR.w = 16;
    ClutR.h = 1;
    DrawSync(0);
    StoreImage(&ClutR, (unsigned long *)ORIGPal);
    y = 0;
    for (int i = 0; i < 16; i++) {
        unsigned short col1 = ORIGPal[i];
        unsigned char r = col1 & 0x1F;
        unsigned char g = (col1 >> 5) & 0x1F;
        unsigned char b = (col1 >> 10) & 0x1F;
        if (setlevel && setlvlnum == 4) {
            if (y < 8)
                r = g = y + 8;
            else
                r = g = 24 - y;
            b = 0;
            y++;
        }
        VRAMPal[i] = r | (g << 5) | (b << 10) | (col1 & 0x8000);
    }

    ch = 1;
    while (!GLUE_Finished()) {
        if (water_clut && DoDrawBg && !PauseMode) {
            if (WaterDone && ch && setlevel && setlvlnum == 4) {
                ch = 0;
                for (int i = 1; i < 16; i++) {
                    unsigned short col1 = ORIGPal[i];
                    unsigned short col2 = VRAMPal[i];
                    unsigned char sb = col1 & 0x1F;
                    unsigned char sg = (col1 >> 5) & 0x1F;
                    unsigned char dr = col2 & 0x1F;
                    unsigned char dg = (col2 >> 5) & 0x1F;
                    unsigned char db = (col2 >> 10) & 0x1F;
                    if (dr < ((col1 >> 10) & 0x1F)) {
                        dr++;
                        ch = 1;
                    }
                    if (((col1 >> 10) & 0x1F) < dr) {
                        dr--;
                        ch = 1;
                    }
                    if (dg < sg) {
                        dg++;
                        ch = 1;
                    }
                    if (sg < dg) {
                        dg--;
                        ch = 1;
                    }
                    if (db < sb) {
                        db++;
                        ch = 1;
                    }
                    if (sb < db) {
                        db--;
                        ch = 1;
                    }
                    if (db < sb) {
                        db++;
                        ch = 1;
                    }
                    if (sb < db) {
                        db--;
                        ch = 1;
                    }
                    VRAMPal[i] = dr + (dg << 5) + (db << 10) + (col1 & 0x8000);
                }
            }
            for (int i = 0; i < 15; i++)
                CLUTPal[i + 1] = VRAMPal[(paloffset + i) % 15 + 1];
            CLUTPal[0] = 0;
            LoadImage(&ClutR, (unsigned long *)CLUTPal);
            paloffset++;
            paloffset %= 15;
        }
        TSK_Sleep(4);
    }
}

/* @0x8009E070 GRAHAM.CPP:331 */
void penta_cycle_task(struct TASK *T)
{
    struct RECT ClutR;
    int cx, cy, RVal;

    penta_clut = 0;
    penta_cycle = 0;
    do {
        if (GLUE_Finished())
            return;
        TSK_Sleep(1);
    } while (!penta_clut);

    for (;;) {
        if (gbMaxPlayers != 1 || quests[Q_DIABLO]._qactive == QUEST_ACTIVE)
            break;
        if (GLUE_Finished())
            return;
        TSK_Sleep(1);
    }

    RVal = 0;
    cx = (penta_clut & 0x3F) << 4;
    cy = penta_clut >> 6;
    ClutR.w = 16;
    ClutR.h = 1;
    ClutR.x = cx;
    ClutR.y = cy;
    while (!GLUE_Finished()) {
        if (penta_clut && DoDrawBg && !PauseMode) {
            unsigned short Pal[16];
            int Col = RVal;
            if (RVal & 0x20)
                Col = RVal ^ 0x1F;
            for (int f = 1; f < 16; f++)
                Pal[f] = (Col & 0x1F) | 0x8000;
            Pal[0] = 0;
            LoadImage(&ClutR, (unsigned long *)Pal);
            RVal++;
        }
        TSK_Sleep(1);
    }
}
