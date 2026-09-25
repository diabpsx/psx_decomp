#include "common.h"

INCLUDE_ASM("asm/nonmatchings/gpuq", CheckMaxArgs__Fv);

INCLUDE_ASM("asm/nonmatchings/gpuq", GPUQ_InitModule__Fv);

INCLUDE_ASM("asm/nonmatchings/gpuq", GPUQ_FlushQ__Fv);

INCLUDE_ASM("asm/nonmatchings/gpuq", GPUQ_LoadImage__FP4RECTli);

INCLUDE_ASM("asm/nonmatchings/gpuq", GPUQ_DiscardHandle__Fl);

INCLUDE_ASM("asm/nonmatchings/gpuq", GPUQ_LoadClutAddr__FiiiPv);

INCLUDE_ASM("asm/nonmatchings/gpuq", GPUQ_MoveImage__FP4RECTii);
