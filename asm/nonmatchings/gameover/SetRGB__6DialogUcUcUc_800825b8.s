.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_800825b8, 0x20

glabel SetRGB__6DialogUcUcUc_800825b8
    /* 725B8 800825B8 1280013C */  lui        $at, %hi(DialogRed)
    /* 725BC 800825BC FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 725C0 800825C0 1280013C */  lui        $at, %hi(DialogGreen)
    /* 725C4 800825C4 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 725C8 800825C8 1280013C */  lui        $at, %hi(DialogBlue)
    /* 725CC 800825CC FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 725D0 800825D0 0800E003 */  jr         $ra
    /* 725D4 800825D4 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_800825b8
