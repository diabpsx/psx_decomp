.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_800aefb0, 0x20

glabel SetRGB__6DialogUcUcUc_800aefb0
    /* 9EFB0 800AEFB0 1280013C */  lui        $at, %hi(DialogRed)
    /* 9EFB4 800AEFB4 FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 9EFB8 800AEFB8 1280013C */  lui        $at, %hi(DialogGreen)
    /* 9EFBC 800AEFBC FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 9EFC0 800AEFC0 1280013C */  lui        $at, %hi(DialogBlue)
    /* 9EFC4 800AEFC4 FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 9EFC8 800AEFC8 0800E003 */  jr         $ra
    /* 9EFCC 800AEFCC 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_800aefb0
