#ifndef SOURCE_DIABLO_H
#define SOURCE_DIABLO_H
/* Game-core constants shared by the SOURCE/*.CPP TUs (values as compiled into the retail image;
 * names from devilution).  Only what the reconstructed TUs use so far. */
#include "cstring.h"
#ifdef __cplusplus
extern "C" {
#endif
void *memset(void *s, int c, unsigned long n);
int abs(int v);
#ifdef __cplusplus
}
#endif

#define NUM_TOWNERS 16
#define MAXQUESTS   16

/* towner types (_ttype) */
#define TOWN_SMITH   0
#define TOWN_HEALER  1
#define TOWN_DEADGUY 2
#define TOWN_TAVERN  3
#define TOWN_STORY   4
#define TOWN_DRUNK   5
#define TOWN_WITCH   6
#define TOWN_BMAID   7
#define TOWN_PEGBOY  8
#define TOWN_COW     9

/* directions */
#define DIR_S  0
#define DIR_SW 1
#define DIR_W  2
#define DIR_NW 3
#define DIR_N  4
#define DIR_NE 5
#define DIR_E  6
#define DIR_SE 7

/* quests */
#define Q_ROCK     0
#define Q_BUTCHER  6
#define Q_LTBANNER 7
#define QUEST_NOTAVAIL 0
#define QUEST_INIT     1
#define QUEST_ACTIVE   2
#define QUEST_DONE     3

/* sound effect ids (retail values) */
#define TSFX_COW1 217
#define TSFX_COW2 218
#define PS_MAGE49  556
#define PS_MAGE50  557
#define PS_MAGE52  559
#define PS_ROGUE49 660
#define PS_ROGUE50 661
#define PS_ROGUE52 663
#define PS_WARR49  770
#define PS_WARR50  771
#define PS_WARR52  773

/* engine.h (devilution): free through a temp so the pointer is cleared before the call */
#define MemFreeDbg(p)      \
    {                      \
        void *p__p;        \
        p__p = p;          \
        p = NULL;          \
        mem_free_dbg(p__p); \
    }
#endif
