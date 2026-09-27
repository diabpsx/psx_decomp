/* ATTRACT.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: entry from the front
 * end into the game.  ATT_DoAttract runs the front end (InitFrontEnd, FRONTEND overlay) until it
 * drops FeFlag, then -- unless a saved game is being loaded -- loads the game overlay and creates
 * the players the front end set up (keeping characters loaded from a memory card). */
#include "diabpsx_types.h"

struct PlayerStruct {   /* sizeof 6632; only the fields this file touches */
    unsigned char pad0[0xD6];
    char _pName[32];              /* +0xD6 */
    unsigned char pad1[0x154 - 0xF6];
    unsigned char _pInfraFlag;    /* +0x154 */
    unsigned char pad2[6632 - 0x155];
};

struct FE_PLR {   /* sizeof 16 */
    char Name[10];
    int Class;
};

struct FE_CREATE {   /* sizeof 36 */
    int NumOfPlayers;
    struct FE_PLR Plrs[2];
};

extern "C" {
void TSK_Sleep(int Frames);
int printf(const char *fmt, ...);
char *strcpy(char *dst, const char *src);
}
BOOL PA_SetPauseOk(BOOL NewPause);
void InitFrontEnd(struct FE_CREATE *CreateStruct);
void OVR_LoadGame(void);
void ClearLoadCharItems(void);
void CalcPlrInv(int p, unsigned char Loadgfx);
void CreatePlayer(int pnum, char c);
void CustomPlayerInit(struct PlayerStruct &P);
void CreatePlayersFromFeData(struct FE_CREATE &CStruct);

extern struct PlayerStruct plr[2];
extern unsigned char FeFlag;
extern BOOL DoLoadedGame;
extern BOOL DoLoadedChar;
extern BOOL LoadedChar[2];

/* @0x8008D274 ATTRACT.CPP:71 */
void ATT_DoAttract(void)
{
    struct FE_CREATE CStruct;

    PA_SetPauseOk(0);
    InitFrontEnd(&CStruct);
    while (FeFlag)
        TSK_Sleep(1);

    /* the if opens a (record-less) level; the then-block's retail local was compiled out */
    if (!DoLoadedGame) {
        int dummy;
        OVR_LoadGame();
        if (DoLoadedChar) {
            printf("Cleared loaded char items \n");
            ClearLoadCharItems();
            CalcPlrInv(0, 0);
            CalcPlrInv(1, 0);
            DoLoadedChar = 0;
        }
        CreatePlayersFromFeData(CStruct);
    }
}

/* @0x8008D33C ATTRACT.CPP:144 */
void CustomPlayerInit(struct PlayerStruct &P)
{
    P._pInfraFlag = 0;
}

/* @0x8008D344 ATTRACT.CPP:149 */
void CreatePlayersFromFeData(struct FE_CREATE &CStruct)
{
    for (int Loop = 0; Loop < CStruct.NumOfPlayers; Loop++) {
        if (!LoadedChar[Loop]) {
            CreatePlayer(Loop, CStruct.Plrs[Loop].Class);
            CustomPlayerInit(plr[Loop]);
            strcpy(plr[Loop]._pName, CStruct.Plrs[Loop].Name);
        }
    }
}
