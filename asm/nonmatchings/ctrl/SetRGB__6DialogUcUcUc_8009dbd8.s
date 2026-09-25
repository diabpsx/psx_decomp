.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_8009dbd8, 0x20

glabel SetRGB__6DialogUcUcUc_8009dbd8
    /* 8DBD8 8009DBD8 1280013C */  lui        $at, %hi(DialogRed)
    /* 8DBDC 8009DBDC FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 8DBE0 8009DBE0 1280013C */  lui        $at, %hi(DialogGreen)
    /* 8DBE4 8009DBE4 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 8DBE8 8009DBE8 1280013C */  lui        $at, %hi(DialogBlue)
    /* 8DBEC 8009DBEC FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 8DBF0 8009DBF0 0800E003 */  jr         $ra
    /* 8DBF4 8009DBF4 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_8009dbd8
