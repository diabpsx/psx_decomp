.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_800893c4, 0x20

glabel SetRGB__6DialogUcUcUc_800893c4
    /* 793C4 800893C4 1280013C */  lui        $at, %hi(DialogRed)
    /* 793C8 800893C8 FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 793CC 800893CC 1280013C */  lui        $at, %hi(DialogGreen)
    /* 793D0 800893D0 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 793D4 800893D4 1280013C */  lui        $at, %hi(DialogBlue)
    /* 793D8 800893D8 FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 793DC 800893DC 0800E003 */  jr         $ra
    /* 793E0 800893E0 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_800893c4
