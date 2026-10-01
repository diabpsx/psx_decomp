/* MLIST.CPP — Diablo PSX (Climax 1998) reconstruction.  No PC twin: the PSX monster-list tables.
 * Each dungeon level has several prebuilt monster lists (AllLevels); MlTab/QlTab hold the list
 * chosen per level for normal and quest (setlevel) maps, and ML_GetPresetMonsters picks the
 * monster types of the chosen list that the current quests allow. */
#include "diabpsx_types.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"

struct TextDat {
    BOOL OwnDat;
    int TexNum, LastFrame;
    BOOL DatLoaded;
    long hndDat;
    inline void DumpDatFile();
};
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

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

char MlTab[16] = {0};   /* Retail initialized data at 0x800E39C4. */
char QlTab[16] = {0};   /* Retail initialized data at 0x800E39D4. */
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

struct MonsterData {   /* sizeof 60; only the fields read here */
    unsigned short GraphicType;
    unsigned char pad0[0x18 - 2];
    char mMinDLvl;   /* +0x18 */
    char mMaxDLvl;   /* +0x19 */
    unsigned char pad1[60 - 0x1A];
};

extern int OPT_NoQuests;
extern unsigned long glSeedTbl[17];
extern struct MonsterData monsterdata[113];
int CM_ChooseMonsterList(int currlevel, unsigned long QuestsNeededMask);
void CM_ShowMonsterList(int currlevel, int List);
void GLUE_SetMonsterList(int List);
struct MonstList *GLUE_GetCurrentList(int currlevel);
void SetRndSeed(long s);

/* @0x8007D7F8 MLIST.CPP:163 */
int ML_GetPresetMonsters(int currlevel, int *typelist, unsigned long QuestsNeededMask)
{
    struct MonstList *Mlist;
    int NumOfMonsters;
    int ThisList;
    int Index[10];

    NumOfMonsters = 0;
    if (OPT_NoQuests)
        QuestsNeededMask = 0;
    ThisList = ML_GetList(currlevel);
    if (ThisList == -1) {
        ThisList = CM_ChooseMonsterList(currlevel, QuestsNeededMask);
        ML_SetList(currlevel, ThisList);
        SetRndSeed(glSeedTbl[currlevel]);
    } else
        CM_ShowMonsterList(currlevel, ThisList);

    GLUE_SetMonsterList(ThisList);
    Mlist = GLUE_GetCurrentList(currlevel);
    for (unsigned int f = 0; f < Mlist->NumOfMonsters; f++) {
        if (Mlist->TheList[f] != 9 && Mlist->TheList[f] != 29) {
            for (int i = 0; i < 111; i++) {
                if (monsterdata[i].GraphicType == Mlist->TheList[f]) {
                    int minl = monsterdata[i].mMinDLvl / 2 + 1;
                    int maxl = monsterdata[i].mMaxDLvl / 2 + 1;
                    if ((currlevel >= minl && currlevel <= maxl) || Mlist->TheList[f] == 29)
                        typelist[NumOfMonsters++] = i;
                }
            }
        }
    }
    if (!NumOfMonsters)
        DBG_Error(NULL, "source/MLIST.cpp", 215);
    return NumOfMonsters;
}
