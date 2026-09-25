.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_8006923c, 0x20

glabel SetRGB__6DialogUcUcUc_8006923c
    /* 5923C 8006923C 1280013C */  lui        $at, %hi(DialogRed)
    /* 59240 80069240 FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 59244 80069244 1280013C */  lui        $at, %hi(DialogGreen)
    /* 59248 80069248 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 5924C 8006924C 1280013C */  lui        $at, %hi(DialogBlue)
    /* 59250 80069250 FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 59254 80069254 0800E003 */  jr         $ra
    /* 59258 80069258 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_8006923c
