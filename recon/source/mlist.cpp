/* MLIST.CPP — Diablo PSX (Climax 1998) reconstruction.  No PC twin: the PSX monster-list tables.
 * Each dungeon level has several prebuilt monster lists (AllLevels); MlTab/QlTab hold the list
 * chosen per level for normal and quest (setlevel) maps, and ML_GetPresetMonsters picks the
 * monster types of the chosen list that the current quests allow. */
#include "diabpsx_types.h"

struct MonstList {   /* sizeof 16 */
    unsigned short NumOfMonsters;
    unsigned short TexNum;
    unsigned char *TheList;
    char *ListName;
    unsigned long QuestBits;
};

struct MonstLevel {   /* sizeof 8 */
    int NumOfLists;
    struct MonstList *TheLists;
};

extern "C" {
void DBG_Error(char *Text, char *File, int Line);
unsigned long GU_GetRndRange(unsigned int Range);
}

extern char MlTab[16];
extern char QlTab[16];
extern struct MonstLevel AllLevels[16];
extern unsigned char setlevel;

/* @0x8007D5F8 MLIST.CPP:71 */
void ML_Init(void)
{
    for (int f = 0; f < 16; f++) {
        MlTab[f] = -1;
        QlTab[f] = -1;
    }
}

/* @0x8007D630 MLIST.CPP:85 */
int ML_GetList(int Level)
{
    int RetVal = -1;

    if (Level) {
        Level--;
        if (!(Level < 16))
            DBG_Error(NULL, "source/MLIST.cpp", 93);
        if (!setlevel)
            RetVal = MlTab[Level];
        else
            RetVal = QlTab[Level];
    }
    return RetVal;
}

/* @0x8007D6B0 MLIST.CPP:109 */
int ML_SetRandomList(int Level)
{
    int NumOfLists;

    Level--;
    if (!(Level >= 0 && Level < 16))
        DBG_Error(NULL, "source/MLIST.cpp", 111);
    NumOfLists = AllLevels[Level].NumOfLists;
    if (!setlevel)
        return MlTab[Level] = GU_GetRndRange(NumOfLists);
    else
        return QlTab[Level] = GU_GetRndRange(NumOfLists);
}

/* @0x8007D748 MLIST.CPP:135 */
int ML_SetList(int Level, int List)
{
    int NumOfLists;

    Level--;
    if (!(Level >= 0 && Level < 16))
        DBG_Error(NULL, "source/MLIST.cpp", 139);
    NumOfLists = AllLevels[Level].NumOfLists;
    if (!(List < NumOfLists))
        DBG_Error(NULL, "source/MLIST.cpp", 144);
    if (!setlevel)
        MlTab[Level] = List;
    else
        QlTab[Level] = List;
    return List;
}
