/* MAIN.CPP -- Diablo PSX (Climax 1998) reconstruction: app entry point / main loop / game task.
 * Bodies from the retail oracle (asm/nonmatchings/main) + SYM (scratch/tuinfo.py MAIN.CPP) + the
 * refs/skeleton drafts (JAP_1998_05_29/DIABPSX/PSXSRC/MAIN.CPP -- an earlier prototype build; used
 * for scaffolding only, cross-checked function-by-function against this retail target's own raw).
 * Layouts / externs / prototypes from DIABPSX.SYM (tools/symhdr.py -> psxsrc/gen/*_main.h). */
#include "diabpsx_types.h"
#include "psxsrc/gen/structs_main.h"
#include "psxsrc/gen/externs_main.h"
#include "psxsrc/gen/protos_main.h"

/* plain-C BIOS calls, no mangled SYM entry (same local-declaration convention as biglump.cpp/fmv.cpp) */
extern "C" void EnterCriticalSection(void);
extern "C" void FlushCache(void);
extern "C" void ExitCriticalSection(void);

/* initpsxcdrom is a real function (BIGLUMP.CPP) but the raw also writes a word at +0x1C from its own
 * address -- an unlabeled static that just happens to sit there in the link; same raw-offset idiom as
 * loadsave.cpp's `*(int*)((char*)&plr[0]+0x64)`. */
extern "C" void initpsxcdrom(void);

/* TU-owned static (STAT class in the SYM, not EXT) -- GameTaskPtr's tentative def lives here. */
static TASK *GameTaskPtr;

void GameTask(TASK *T);
void MAIN_MainLoop(void);

/* @0x80083128 MAIN.CPP:116 */
void Remove96(void)
{
    *(int *)((char *)initpsxcdrom + 0x1C) = 0;
    EnterCriticalSection();
    FlushCache();
    ExitCriticalSection();
}

/* @0x80083160 MAIN.CPP:141 -- extern "C" in the real source (retail label is unmangled "AppMain",
 * the app's actual entry point called from the BIOS/exec stub). */
extern "C" void AppMain(void)
{
    Remove96();
    SYSI_Init();
    VER_InitVersion();
    InitPrinty();
    InitDialog();
    LANG_SetLang(LANG_JAP);
    if (FileSYS != 1)
        BL_LoadStreamDir();
    LoadKanji(LANG_DB_MAIN);
    SetKanjiLoaded(1);
    Init_GamePad();
    OVR_LoadFrontend();
    ADirtyFlagThatGaryWillLove = 1;
    UPDATEPROGRESS(4);
    GameTaskPtr = TSK_AddTask(0x4000, (void (*)())GameTask, 0x5000, 0);
    for (;;)
        MAIN_MainLoop();
}

/* @0x80083224 MAIN.CPP:273 */
void MAIN_RestartGameTask(void)
{
    TSK_RepointProc(GameTaskPtr, (void (*)())GameTask);
}

/* @0x80083250 MAIN.CPP:356 */
void GameTask(TASK *T)
{
    MSG_ClearOutCompMap();
    UPDATEPROGRESS(4);
    while (1) {
        OVR_LoadFrontend();
        InitAllItemsUseable();
        alloc_plr();
        ATT_DoAttract();
        if (demo_record_load == 1)
            set_pad_record_play(level_record);
        if (demo_pad_time != 0) {
            StartGame(1, 1);
        } else if (DoLoadedGame == 1) {
            StartGame(0, 1);
        } else {
            GLUE_PreTown();
            GAL_SetTimeStamp(4);
            StartGame(1, 1);
        }
        GLUE_SetFinished(1);
        TSK_Sleep(5);
        if (gbDoEnding != 0) {
            MSG_ClearOutCompMap();
            const int end2 = gbDoEnding;
            gbDoEnding = 0;
            DoEnding(end2 - 1);
        }
    }
}

/* @0x8008335C MAIN.CPP:445 */
void MAIN_MainLoop(void)
{
    if (demo_pad_time == 0)
        PAD_Handler();
    TSK_DoTasks();
    VID_AfterDisplay();
    DEC_DoDecompRequests();
    TICK_Update();
    SCR_Handler();
}

/* @0x8008311C MAIN.CPP:? -- texpage X coordinate bits from a texture-page word */
unsigned short GetTpX(unsigned short tpage)
{
    return (tpage << 6) & 0x3C0;
}

/* @0x80083100 MAIN.CPP:? -- texpage Y coordinate bits (split hi/lo per PSX GPU texpage encoding) */
unsigned short GetTpY(unsigned short tpage)
{
    return ((tpage << 4) & 0x100) | ((tpage >> 2) & 0x200);
}
