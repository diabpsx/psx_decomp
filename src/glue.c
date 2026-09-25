#include "common.h"

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_SetMonsterList__Fi);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_GetMonsterList__Fv);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_SuspendGame__Fv);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_ResumeGame__Fv);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_PreTown__Fv);

void GLUE_PreDun__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_Finished__Fv);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_SetFinished__Fb);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_StartBg__Fibi);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_SetShowGameScreenFlag__Fb);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_GetShowGameScreenFlag__Fv);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_SetHomingScrollFlag__Fb);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_SetShowPanelFlag__Fb);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_HasGameStarted__Fv);

INCLUDE_ASM("asm/nonmatchings/glue", DoShowPanelGFX__FP6GPanelT0);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_DoQuake__Fii);

INCLUDE_ASM("asm/nonmatchings/glue", BgTask__FP4TASK);

INCLUDE_ASM("asm/nonmatchings/glue", FindPlayerChar__FPc);

INCLUDE_ASM("asm/nonmatchings/glue", FindPlayerChar__Fiii);

INCLUDE_ASM("asm/nonmatchings/glue", FindPlayerChar__FP12PlayerStruct);

INCLUDE_ASM("asm/nonmatchings/glue", FindPlayerChar__FP12PlayerStructb);

INCLUDE_ASM("asm/nonmatchings/glue", MakeSurePlayerDressedProperly__FR7CPlayerR12PlayerStructbT2);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_GetCurrentList__Fi);

INCLUDE_ASM("asm/nonmatchings/glue", GLUE_StartGameExit__Fv);

void GLUE_Init__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/glue", GetTexId__7CPlayer);

INCLUDE_ASM("asm/nonmatchings/glue", SetTown__7CBlocksb);

INCLUDE_ASM("asm/nonmatchings/glue", MoveToScrollTarget__7CBlocks_8009c534);
