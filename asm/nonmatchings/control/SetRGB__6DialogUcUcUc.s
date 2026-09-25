.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc, 0x20

glabel SetRGB__6DialogUcUcUc
    /* 27614 80037614 1280013C */  lui        $at, %hi(DialogRed)
    /* 27618 80037618 FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 2761C 8003761C 1280013C */  lui        $at, %hi(DialogGreen)
    /* 27620 80037620 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 27624 80037624 1280013C */  lui        $at, %hi(DialogBlue)
    /* 27628 80037628 FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 2762C 8003762C 0800E003 */  jr         $ra
    /* 27630 80037630 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc
