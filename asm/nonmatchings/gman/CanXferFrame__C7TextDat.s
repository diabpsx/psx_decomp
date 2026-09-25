.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CanXferFrame__C7TextDat, 0x28

glabel CanXferFrame__C7TextDat
    /* 85298 80095298 5000828C */  lw         $v0, 0x50($a0)
    /* 8529C 8009529C 00000000 */  nop
    /* 852A0 800952A0 05004004 */  bltz       $v0, .L800952B8
    /* 852A4 800952A4 21180000 */   addu      $v1, $zero, $zero
    /* 852A8 800952A8 5400828C */  lw         $v0, 0x54($a0)
    /* 852AC 800952AC 00000000 */  nop
    /* 852B0 800952B0 27100200 */  nor        $v0, $zero, $v0
    /* 852B4 800952B4 C21F0200 */  srl        $v1, $v0, 31
  .L800952B8:
    /* 852B8 800952B8 0800E003 */  jr         $ra
    /* 852BC 800952BC 21106000 */   addu      $v0, $v1, $zero
endlabel CanXferFrame__C7TextDat
