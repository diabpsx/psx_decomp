/* SCROLLRT.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/scrollrt.cpp
 * (heavily refactored on PSX -- the actual dungeon/town scene render happens elsewhere via the GTE
 * 3D pipeline; DrawView/DrawAndBlit here are the frame-level HUD/overlay-draw + load-gate wrapper).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_scrollrt.h"
#include "source/gen/externs_scrollrt.h"
#include "source/gen/protos_scrollrt.h"
#include "source/diablo.h"

/* PSX StartX/StartY are the retained devilution DrawView signature but are unused here: the actual
 * scene (dungeon/town) render is driven by the GTE pipeline outside this TU; DrawView only draws the
 * HUD overlays that sit on top of it. */
void DrawView(int StartX, int StartY)
{
    if (GLUE_Finished() || IsGameLoading())
        return;

    if (automapflag && DoShowPanel)
        DrawAutomap();
    if (!chrflag) {
        if (!questlog && invflag)
            DrawInv();
        if (!chrflag && !questlog && !invflag) {
            if (plr[0].plractive && plr[0]._pStatPts != 0)
                DrawLevelUpIcon(0);
            if (plr[1].plractive && plr[1]._pStatPts != 0)
                DrawLevelUpIcon(1);
        }
    }
    if (msgflag && !_spselflag[0] && !_spselflag[1] && !PauseMode)
        DrawDiabloMsg();
}

void DrawAndBlit(void)
{
    if (GLUE_Finished() || IsGameLoading())
        return;

    drawhpflag = 1;
    drawmanaflag = 1;
    drawbtnflag = 1;
    drawsbarflag = 1;
    if (leveltype)
        DrawView(ViewX, ViewY);
    else
        T_DrawView(ViewX, ViewY);
    drawhpflag = 0;
    drawmanaflag = 0;
    drawbtnflag = 0;
    drawsbarflag = 0;
}
