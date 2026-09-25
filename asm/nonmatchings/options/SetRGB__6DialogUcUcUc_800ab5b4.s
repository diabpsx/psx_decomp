.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_800ab5b4, 0x20

glabel SetRGB__6DialogUcUcUc_800ab5b4
    /* 9B5B4 800AB5B4 1280013C */  lui        $at, %hi(DialogRed)
    /* 9B5B8 800AB5B8 FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 9B5BC 800AB5BC 1280013C */  lui        $at, %hi(DialogGreen)
    /* 9B5C0 800AB5C0 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 9B5C4 800AB5C4 1280013C */  lui        $at, %hi(DialogBlue)
    /* 9B5C8 800AB5C8 FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 9B5CC 800AB5CC 0800E003 */  jr         $ra
    /* 9B5D0 800AB5D0 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_800ab5b4
