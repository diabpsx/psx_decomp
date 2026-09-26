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

/* --- TalkToTowner vocabulary (retail values) --- */
#define CURSOR_FIRSTITEM 12
#define PC_WARRIOR  0
#define PC_ROGUE    1
#define PC_SORCERER 2
#define Q_MUSHROOM  1
#define Q_DIABLO    5
#define Q_ANVIL     10
#define Q_SKELKING  12
#define Q_PWATER    13
#define Q_BETRAYER  15
#define QS_TOMEGIVEN  2
#define QS_MUSHPICKED 4
#define QS_MUSHGIVEN  5
#define QS_BRAINGIVEN 7
#define IDI_ROCK     9
#define IDI_BANNER   0xC
#define IDI_ANVIL    0x10
#define IDI_MUSHROOM 0x11
#define IDI_BRAIN    0x12
#define IDI_FUNGALTM 0x13
#define IDI_SPECELIX 0x14
#define IDI_LAZSTAFF 0x21
#define UITEM_INFRARING 2
#define UITEM_TRING     4
#define UITEM_HARCREST  5
#define UITEM_GRISWOLD  8
#define STORE_SMITH   1
#define STORE_WITCH   5
#define STORE_BOY     0xC
#define STORE_HEALER  0xE
#define STORE_STORY   0xF
#define STORE_TAVERN  0x15
#define STORE_DRUNK   0x16
#define STORE_BARMAID 0x17
#define TEXT_KING2     1
#define TEXT_KING4     3
#define TEXT_BANNER2   0xC
#define TEXT_BANNER3   0xD
#define TEXT_VILE1     0x17
#define TEXT_VILE3     0x19
#define TEXT_POISON3   0x27
#define TEXT_POISON5   0x29
#define TEXT_BUTCH9    0x3F
#define TEXT_ANVIL5    0x58
#define TEXT_ANVIL7    0x5A
#define TEXT_INFRA5    0x73
#define TEXT_INFRA7    0x75
#define TEXT_MUSH3     0x7B
#define TEXT_MUSH4     0x7C
#define TEXT_MUSH8     0x80
#define TEXT_MUSH9     0x81
#define TEXT_MUSH10    0x82
#define TEXT_MUSH11    0x83
#define TEXT_MUSH12    0x84
#define TEXT_STORY1    0x96
#define TEXT_OGDEN1    0xA0
#define TEXT_PEPIN1    0xA9
#define TEXT_GILLIAN1  0xB3
#define TEXT_GRISWOLD1 0xBC
#define TEXT_FARNHAM1  0xC8
#define TEXT_ADRIA1    0xD4
#define TEXT_WIRT1     0xE0
#define TEXT_INTRO     0x102
#define PS_MAGE8  0x203
#define PS_ROGUE8 0x26B
#define PS_WARR8  0x2D3
#endif
