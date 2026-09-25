.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_800a4f04, 0x20

glabel SetRGB__6DialogUcUcUc_800a4f04
    /* 94F04 800A4F04 1280013C */  lui        $at, %hi(DialogRed)
    /* 94F08 800A4F08 FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 94F0C 800A4F0C 1280013C */  lui        $at, %hi(DialogGreen)
    /* 94F10 800A4F10 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 94F14 800A4F14 1280013C */  lui        $at, %hi(DialogBlue)
    /* 94F18 800A4F18 FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 94F1C 800A4F1C 0800E003 */  jr         $ra
    /* 94F20 800A4F20 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_800a4f04
