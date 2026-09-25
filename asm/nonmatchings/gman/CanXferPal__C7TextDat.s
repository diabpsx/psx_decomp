.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CanXferPal__C7TextDat, 0x28

glabel CanXferPal__C7TextDat
    /* 852C0 800952C0 5800828C */  lw         $v0, 0x58($a0)
    /* 852C4 800952C4 00000000 */  nop
    /* 852C8 800952C8 05004004 */  bltz       $v0, .L800952E0
    /* 852CC 800952CC 21180000 */   addu      $v1, $zero, $zero
    /* 852D0 800952D0 5C00828C */  lw         $v0, 0x5C($a0)
    /* 852D4 800952D4 00000000 */  nop
    /* 852D8 800952D8 27100200 */  nor        $v0, $zero, $v0
    /* 852DC 800952DC C21F0200 */  srl        $v1, $v0, 31
  .L800952E0:
    /* 852E0 800952E0 0800E003 */  jr         $ra
    /* 852E4 800952E4 21106000 */   addu      $v0, $v1, $zero
endlabel CanXferPal__C7TextDat
