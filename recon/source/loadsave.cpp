/* LOADSAVE.CPP -- Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/loadsave.cpp
 * (the generic byte/int/bool stream helpers plus LoadQuest/SaveQuest only, so far).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py, see gen headers).
 * PSX deltas: PC's memcpy/pointer-file save-game is entirely replaced by a memory-card block save
 * (PSX_GM_SaveGame, PSX_GM_LoadGame, the PSX_CH_ family, RestorePads, StorePads, GetIcon, the
 * PSX_OPT_ family, LoadOptions, SaveOptions, RestoreLoadedData) -- NOT YET RECONSTRUCTED (13 of 23
 * functions; see the final report).
 * LoadQuest/SaveQuest on PSX are a straight memcpy of QuestStruct with NO trailing WLoad() calls for
 * ReturnLvlX/Y/ReturnLvl/ReturnLvlT/DoomQuestState (devilution's LoadQuest reads those 5 extra ints
 * after the quest struct; PSX's LoadQuest does not touch them here). */
#include "diabpsx_types.h"
#include "source/gen/structs_loadsave.h"
#include "source/gen/externs_loadsave.h"
#include "source/gen/protos_loadsave.h"
#include "source/diablo.h"

#define TRUE  1
#define FALSE 0

/* file-scope static (SYM class STAT; the load/save cursor into the decoded save-file buffer). */
static unsigned char *tbuff;

/* @0x8015B958 */
char *GetOptStr(void)
{
    return "\x83\x49\x83\x76\x83\x56\x83\x87\x83\x93";   /* Shift-JIS "オプション" ("Option") */
}

/* @0x8015B968 */
char *GetDiabloStr(void)
{
    return "\x83\x66\x83\x42\x83\x41\x83\x75\x83\x8D";   /* Shift-JIS "ディアブロ" ("Diablo") */
}

/* @0x8015B978 */
char BLoad(void)
{
    return *tbuff++;
}

/* @0x8015B994 */
int ILoad(void)
{
    int rv;

    rv = *tbuff++ << 24;
    rv |= *tbuff++ << 16;
    rv |= *tbuff++ << 8;
    rv |= *tbuff++;

    return rv;
}

/* @0x8015B9E8 */
BOOL OLoad(void)
{
    if (*tbuff++ == TRUE)
        return TRUE;
    else
        return FALSE;
}

/* @0x8015BA0C */
void LoadQuest(int i)
{
    memcpy(&quests[i], tbuff, sizeof(struct QuestStruct));
    tbuff += sizeof(struct QuestStruct);
}

/* @0x8015BAD4 */
void BSave(char v)
{
    *tbuff++ = v;
}

/* @0x8015BAEC */
void ISave(int v)
{
    *tbuff++ = v >> 24;
    *tbuff++ = v >> 16;
    *tbuff++ = v >> 8;
    *tbuff++ = v;
}

/* @0x8015BB4C */
void OSave(unsigned char v)
{
    if (v)
        *tbuff++ = 1;
    else
        *tbuff++ = 0;
}

/* @0x8015BB90 */
void SaveQuest(int i)
{
    memcpy(tbuff, &quests[i], sizeof(struct QuestStruct));
    tbuff += sizeof(struct QuestStruct);
}
