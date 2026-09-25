#include "common.h"

INCLUDE_ASM("asm/nonmatchings/biglump", BL_InitEAC__Fv);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_ReadFile__FPcUl);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_AsyncReadFile__FPcUl);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_LoadDirectory__Fv);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_LoadStreamDir__Fv);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_MakeFilePosTab__FPUcUl);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_FindStreamFile__FPcc);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_FileExists__FPcc);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_FileLength__FPcc);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_LoadFileAtAddr__FPcPUcc);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_AsyncLoadDone__Fv);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_WaitForAsyncFinish__Fv);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_AsyncLoadCallBack__Fi);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_LoadFileAsync__FPcc);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_AsyncLoadFileAtAddr__FPcPUcc);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_OpenStreamFile__FPcc);

INCLUDE_ASM("asm/nonmatchings/biglump", BL_CloseStreamFile__FP6STRHDR);
