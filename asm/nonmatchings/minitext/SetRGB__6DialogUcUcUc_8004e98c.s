.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_8004e98c, 0x20

glabel SetRGB__6DialogUcUcUc_8004e98c
    /* 3E98C 8004E98C 1280013C */  lui        $at, %hi(DialogRed)
    /* 3E990 8004E990 FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 3E994 8004E994 1280013C */  lui        $at, %hi(DialogGreen)
    /* 3E998 8004E998 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 3E99C 8004E99C 1280013C */  lui        $at, %hi(DialogBlue)
    /* 3E9A0 8004E9A0 FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 3E9A4 8004E9A4 0800E003 */  jr         $ra
    /* 3E9A8 8004E9A8 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_8004e98c
