.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetHighlightCol__FiPiUsUsUs, 0x48

glabel GetHighlightCol__FiPiUsUsUs
    /* 81ABC 80091ABC 0000A38C */  lw         $v1, 0x0($a1)
    /* 81AC0 80091AC0 0400A28C */  lw         $v0, 0x4($a1)
    /* 81AC4 80091AC4 1000A897 */  lhu        $t0, 0x10($sp)
    /* 81AC8 80091AC8 03006214 */  bne        $v1, $v0, .L80091AD8
    /* 81ACC 80091ACC 00000000 */   nop
    /* 81AD0 80091AD0 0A006410 */  beq        $v1, $a0, .L80091AFC
    /* 81AD4 80091AD4 21100001 */   addu      $v0, $t0, $zero
  .L80091AD8:
    /* 81AD8 80091AD8 0000A28C */  lw         $v0, 0x0($a1)
    /* 81ADC 80091ADC 00000000 */  nop
    /* 81AE0 80091AE0 06008210 */  beq        $a0, $v0, .L80091AFC
    /* 81AE4 80091AE4 FFFFC230 */   andi      $v0, $a2, 0xFFFF
    /* 81AE8 80091AE8 0400A28C */  lw         $v0, 0x4($a1)
    /* 81AEC 80091AEC 00000000 */  nop
    /* 81AF0 80091AF0 02008214 */  bne        $a0, $v0, .L80091AFC
    /* 81AF4 80091AF4 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 81AF8 80091AF8 FFFFE230 */  andi       $v0, $a3, 0xFFFF
  .L80091AFC:
    /* 81AFC 80091AFC 0800E003 */  jr         $ra
    /* 81B00 80091B00 00000000 */   nop
endlabel GetHighlightCol__FiPiUsUsUs
