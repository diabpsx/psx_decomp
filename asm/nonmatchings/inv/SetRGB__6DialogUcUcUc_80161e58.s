.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_80161e58, 0x20

glabel SetRGB__6DialogUcUcUc_80161e58
    /* 28260 80161E58 1280013C */  lui        $at, %hi(DialogRed)
    /* 28264 80161E5C FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 28268 80161E60 1280013C */  lui        $at, %hi(DialogGreen)
    /* 2826C 80161E64 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 28270 80161E68 1280013C */  lui        $at, %hi(DialogBlue)
    /* 28274 80161E6C FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 28278 80161E70 0800E003 */  jr         $ra
    /* 2827C 80161E74 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_80161e58
