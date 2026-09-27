/* CHOOSEM.CPP — Diablo PSX (Climax 1998) reconstruction (SOURCE).  No PC twin: picks which of a
 * level's monster lists is used.  Each MonstLevel holds several MonstLists tagged with the quests
 * they need; a list matching the current quest mask is chosen at random (optionally in a task, so
 * the choice can be shown on screen). */
#include "diabpsx_types.h"

struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};

enum TXT_JUST { JustLeft = 0, JustCentre = 1, JustRight = 2 };

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

struct DEF_ARGS {   /* sizeof 16 */
    unsigned long a0;
    unsigned long a1;
    unsigned long a2;
    unsigned long a3;
};

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

class CPad {   /* sizeof 236 */
public:
    unsigned char get_both;
    unsigned char active;
    unsigned char PadType;
    unsigned char PADTICK;
    unsigned short PADTICKMASK;
    unsigned short PadNum;
    unsigned short Cur;
    unsigned short Up;
    unsigned short Down;
    unsigned short Tick;
    unsigned short Old;
    unsigned short both_Cur;
    unsigned short both_Up;
    unsigned short both_Down;
    unsigned short both_Tick;
    unsigned short both_Old;
    unsigned char rest[236 - 0x1C];

    unsigned short GetDown() const
    {
        if (get_both)
            return both_Down;
        return Down;
    }
};

class CFont {
public:
    unsigned char data[540];
    int Print(int X, int Y, char *Str, enum TXT_JUST Justify, struct RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
};

extern "C" {
void DBG_Error(char *Text, char *File, int Line);
void TSK_Sleep(int Frames);
TASK *TSK_AddTask(unsigned long Id, void (*Main)(TASK *), int StackSize, int DataSize);
TASK *TSK_Exist(TASK *T, unsigned long Id, unsigned long Mask);
int sprintf(char *dst, const char *fmt, ...);
}
void GLUE_SuspendGame(void);
void GLUE_ResumeGame(void);
long ENG_random(long v);
CPad *PAD_GetPad(int PadNum, unsigned char both);

int NoUiListChoose(int Level, unsigned long QuestsNeededMask);
void ChooseTask(struct TASK *T);
int GetListsAvailable(int Level, unsigned long QuestsNeededMask, unsigned char *ListofLists);

extern int NumOfMonsterListLevels;
extern struct MonstLevel AllLevels[16];
extern int demo_pad_time;
extern CFont MediumFont;
extern const unsigned char WHITER, WHITEG;
static char *MgToText[34];

static int DoUiForChooseMonster = 1;

/* @0x80155A04 CHOOSEM.CPP:134 */
unsigned long CM_QuestToBitPattern(int QuestNum)
{
    unsigned long RetVal = 0;

    switch (QuestNum) {
    case 6:
        RetVal = 1;
        break;
    case 2:
        RetVal = 2;
        break;
    case 3:
        RetVal = 4;
        break;
    case 7:
        RetVal = 8;
        break;
    case 4:
        RetVal = 0x10;
        break;
    case 11:
        RetVal = 0x20;
        break;
    case 12:
        RetVal = 0x40;
        break;
    case 5:
        RetVal = 0x80;
        break;
    case 15:
        RetVal = 0x100;
        break;
    case 14:
        RetVal = 0x200;
        break;
    case 10:
        RetVal = 0x400;
        break;
    case 13:
        RetVal = 0x800;
        break;
    case 9:
        RetVal = 0x1000;
        break;
    default:
        if (!!"Quest not supported")
            DBG_Error(0, "source/CHOOSEM.cpp", 192);
        break;
    }
    return RetVal;
}

/* @0x80155ADC CHOOSEM.CPP:227 */
void CM_ShowMonsterList(int Level, int List)
{
}

/* @0x80155AE4 CHOOSEM.CPP:253 */
int CM_ChooseMonsterList(int Level, unsigned long QuestsNeededMask)
{
    struct DEF_ARGS *A;

    if (DoUiForChooseMonster) {
        int ListChosen = 0;

        A = (struct DEF_ARGS *)TSK_AddTask(0x4002, ChooseTask, 0x1000, 0x10)->Data;
        A->a0 = Level;
        A->a1 = (unsigned long)&ListChosen;
        A->a2 = QuestsNeededMask;
        do
            TSK_Sleep(1);
        while (TSK_Exist(0, 0x4002, -1));
        return ListChosen;
    } else {
        return NoUiListChoose(Level, QuestsNeededMask);
    }
}

/* @0x80155B84 CHOOSEM.CPP:290 */
int NoUiListChoose(int Level, unsigned long QuestsNeededMask)
{
    return 0;
}

/* @0x80155B8C CHOOSEM.CPP:304 */
void ChooseTask(struct TASK *T)
{
    struct DEF_ARGS *A;
    int *List;
    int Level;
    unsigned int NumOfLists;
    unsigned long QuestsNeededMask;
    unsigned char ListsToChooseFrom[50];
    unsigned int Selection;

    GLUE_SuspendGame();
    A = (struct DEF_ARGS *)T->Data;
    Level = A->a0;
    List = (int *)A->a1;
    QuestsNeededMask = A->a2;
    Level--;
    if (Level < 0 || Level >= NumOfMonsterListLevels)
        DBG_Error(0, "source/CHOOSEM.cpp", 324);
    NumOfLists = GetListsAvailable(Level, QuestsNeededMask, ListsToChooseFrom);
    Selection = ENG_random(NumOfLists);
    if (demo_pad_time)
        Selection = 0;
    if (Selection == NumOfLists)
        Selection = 0;
    *List = ListsToChooseFrom[Selection];
    GLUE_ResumeGame();
}

/* @0x80155C5C CHOOSEM.CPP:483 */
void ShowTask(struct TASK *T)
{
    struct DEF_ARGS *A;
    int List;
    int Level;
    BOOL Finished;
    struct MonstLevel *ThisLev;
    char Buffer[100];

    GLUE_SuspendGame();
    A = (struct DEF_ARGS *)T->Data;
    Level = A->a0;
    List = A->a1;
    Level--;
    if (Level < 0 || Level >= NumOfMonsterListLevels)
        DBG_Error(0, "source/CHOOSEM.cpp", 499);
    Finished = 0;
    ThisLev = &AllLevels[Level];
    sprintf(Buffer, "CHOOSEN MONSTER LIST FOR LEV %d", Level + 1);
    while (!Finished) {
        unsigned int f;
        struct MonstList *ThisList;

        MediumFont.Print(100, 100, Buffer, JustCentre, 0, 64, 64, 128);
        ThisList = &ThisLev->TheLists[List];
        MediumFont.Print(100, 120, ThisList->ListName, JustCentre, 0, WHITER, WHITEG, WHITEG);
        for (f = 0; f < ThisList->NumOfMonsters; f++)
            MediumFont.Print(50, 120 + f * 16, MgToText[ThisList->TheList[f]], JustLeft, 0, WHITER, WHITEG, WHITEG);
        if ((PAD_GetPad(0, 1)->GetDown() & 0x40) || demo_pad_time)
            Finished = 1;
        TSK_Sleep(1);
    }
    GLUE_ResumeGame();
}

/* @0x80155E8C CHOOSEM.CPP:542 */
int GetListsAvailable(int Level, unsigned long QuestsNeededMask, unsigned char *ListofLists)
{
    int NumOfChoices;
    int NumOfLists;
    struct MonstLevel *ThisLev;

    if (Level < 0 || Level >= NumOfMonsterListLevels)
        DBG_Error(0, "source/CHOOSEM.cpp", 547);
    NumOfChoices = 0;
    ThisLev = &AllLevels[Level];
    NumOfLists = ThisLev->NumOfLists;
    for (int f = 0; f < NumOfLists; f++) {
        if (ThisLev->TheLists[f].QuestBits == QuestsNeededMask) {
            if (NumOfChoices == 50)
                DBG_Error(0, "source/CHOOSEM.cpp", 559);
            *ListofLists++ = f;
            NumOfChoices++;
        }
    }
    if (!NumOfChoices)
        DBG_Error(0, "source/CHOOSEM.cpp", 566);
    return NumOfChoices;
}
