.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_8015b878, 0x20

glabel SetRGB__6DialogUcUcUc_8015b878
    /* 21C80 8015B878 1280013C */  lui        $at, %hi(DialogRed)
    /* 21C84 8015B87C FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 21C88 8015B880 1280013C */  lui        $at, %hi(DialogGreen)
    /* 21C8C 8015B884 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 21C90 8015B888 1280013C */  lui        $at, %hi(DialogBlue)
    /* 21C94 8015B88C FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 21C98 8015B890 0800E003 */  jr         $ra
    /* 21C9C 8015B894 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_8015b878
