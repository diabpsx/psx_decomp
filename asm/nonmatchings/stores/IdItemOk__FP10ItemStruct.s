.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IdItemOk__FP10ItemStruct, 0x34

glabel IdItemOk__FP10ItemStruct
    /* 5E714 8006E714 2C008384 */  lh         $v1, 0x2C($a0)
    /* 5E718 8006E718 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5E71C 8006E71C 08006210 */  beq        $v1, $v0, .L8006E740
    /* 5E720 8006E720 21100000 */   addu      $v0, $zero, $zero
    /* 5E724 8006E724 51008280 */  lb         $v0, 0x51($a0)
    /* 5E728 8006E728 00000000 */  nop
    /* 5E72C 8006E72C 04004010 */  beqz       $v0, .L8006E740
    /* 5E730 8006E730 21100000 */   addu      $v0, $zero, $zero
    /* 5E734 8006E734 69008280 */  lb         $v0, 0x69($a0)
    /* 5E738 8006E738 00000000 */  nop
    /* 5E73C 8006E73C 0100422C */  sltiu      $v0, $v0, 0x1
  .L8006E740:
    /* 5E740 8006E740 0800E003 */  jr         $ra
    /* 5E744 8006E744 00000000 */   nop
endlabel IdItemOk__FP10ItemStruct
