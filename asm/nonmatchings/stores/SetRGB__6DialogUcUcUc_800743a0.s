.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_800743a0, 0x20

glabel SetRGB__6DialogUcUcUc_800743a0
    /* 643A0 800743A0 1280013C */  lui        $at, %hi(DialogRed)
    /* 643A4 800743A4 FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 643A8 800743A8 1280013C */  lui        $at, %hi(DialogGreen)
    /* 643AC 800743AC FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 643B0 800743B0 1280013C */  lui        $at, %hi(DialogBlue)
    /* 643B4 800743B4 FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 643B8 800743B8 0800E003 */  jr         $ra
    /* 643BC 800743BC 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_800743a0
