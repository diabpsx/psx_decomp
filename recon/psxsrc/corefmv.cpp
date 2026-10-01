/* COREFMV.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the PC plays movies
 * through Storm/SVid; the PSX version loads the FMV overlay, plays the movie through
 * PlayFMVOverLay (FMV.BIN, C linkage), chains the intro and victory movies, then reloads the
 * overlay that was resident before.  play_movie maps a movie name to its FmvTab entry. */
#include "diabpsx_types.h"

enum OVER_TYPE {
    OVR_NONE = 0,
    OVR_PREGAME = 1,
    OVR_GAME = 2,
    OVR_FRONTEND = 3,
    OVR_FMV = 4
};

struct FMVDAT {   /* sizeof 8 */
    char *Name;
    unsigned short Width;
    unsigned short Height;
};

struct FMVDAT FmvTab[6] = {   /* @0x800CD4F4; six 8-byte entries in retail SYM */
    {"EACLOGO.MOV", 320, 144},
    {"DIABEND.MOV", 320, 144},
    {"FPRST3.MOV", 320, 144},
    {"DIABVIC1.MOV", 320, 144},
    {"DIABVIC2.MOV", 320, 144},
    {"DIABVIC3.MOV", 320, 144}
};
extern BOOL user_start;           /* @0x8011B4E4 */
extern int FileSYS;               /* @0x8011AAEC */

extern "C" {
int strcmp(const char *a, const char *b);
int fileexists(char *name);
short PlayFMVOverLay(char *str, int w, int h);
}

BOOL PA_SetPauseOk(BOOL NewPause);
enum OVER_TYPE OVR_GetCurrentOverlay(void);
void music_stop(void);
void OVR_LoadFmv(void);
void OVR_LoadPregame(void);
void OVR_LoadGame(void);
void OVR_LoadFrontend(void);
void SCR_DumpClut(void);
short PlayFMV(char *str, int w, int h);

/* @0x800ACF58 COREFMV.CPP:95 */
short PlayFMV(char *str, int w, int h)
{
    short RetVal;
    enum OVER_TYPE CurrentOver;

    PA_SetPauseOk(0);
    CurrentOver = OVR_GetCurrentOverlay();
    music_stop();
    OVR_LoadFmv();
    RetVal = PlayFMVOverLay(str, w, h);

    if (!strcmp(str, "EACLOGO.MOV") && !user_start) {
        RetVal = PlayFMVOverLay("BLIZZARD.MOV", w, h);
        if (!user_start)
            RetVal = PlayFMVOverLay("DIABLO1.MOV", w, h);
    }

    if ((!strcmp(str, "DIABVIC1.MOV") || !strcmp(str, "DIABVIC2.MOV") || !strcmp(str, "DIABVIC3.MOV")) && !user_start)
        RetVal = PlayFMVOverLay("DIABEND.MOV", w, h);

    switch (CurrentOver) {
    case OVR_NONE:
        break;
    case OVR_PREGAME:
        OVR_LoadPregame();
        break;
    case OVR_GAME:
        OVR_LoadGame();
        break;
    case OVR_FRONTEND:
        OVR_LoadFrontend();
        break;
    case OVR_FMV:
        break;
    }

    PA_SetPauseOk(1);
    return RetVal;
}

/* @0x800AD128 COREFMV.CPP:197 */
extern "C" void play_movie(char *pszMovie)
{
    /* retail bound: sizeof(FmvTab) / 4 (12), twice the table's 6 entries */
    if (FileSYS != 1) {
        for (int i = 0; i < (int)(sizeof(FmvTab) / 4); i++) {
            if (!strcmp(pszMovie, FmvTab[i].Name)) {
                if (fileexists(FmvTab[i].Name))
                    PlayFMV(FmvTab[i].Name, FmvTab[i].Width, FmvTab[i].Height);
                SCR_DumpClut();
                break;
            }
        }
    }
}
