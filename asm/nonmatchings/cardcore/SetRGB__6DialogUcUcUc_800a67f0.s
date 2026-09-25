.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_800a67f0, 0x20

glabel SetRGB__6DialogUcUcUc_800a67f0
    /* 967F0 800A67F0 1280013C */  lui        $at, %hi(DialogRed)
    /* 967F4 800A67F4 FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 967F8 800A67F8 1280013C */  lui        $at, %hi(DialogGreen)
    /* 967FC 800A67FC FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 96800 800A6800 1280013C */  lui        $at, %hi(DialogBlue)
    /* 96804 800A6804 FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 96808 800A6808 0800E003 */  jr         $ra
    /* 9680C 800A680C 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_800a67f0
