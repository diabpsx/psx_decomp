.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetHighlightCol__FiPcUsUsUs, 0x48

glabel GetHighlightCol__FiPcUsUsUs
    /* 819F8 800919F8 0000A380 */  lb         $v1, 0x0($a1)
    /* 819FC 800919FC 0100A280 */  lb         $v0, 0x1($a1)
    /* 81A00 80091A00 1000A897 */  lhu        $t0, 0x10($sp)
    /* 81A04 80091A04 03006214 */  bne        $v1, $v0, .L80091A14
    /* 81A08 80091A08 00000000 */   nop
    /* 81A0C 80091A0C 0A006410 */  beq        $v1, $a0, .L80091A38
    /* 81A10 80091A10 21100001 */   addu      $v0, $t0, $zero
  .L80091A14:
    /* 81A14 80091A14 0000A280 */  lb         $v0, 0x0($a1)
    /* 81A18 80091A18 00000000 */  nop
    /* 81A1C 80091A1C 06008210 */  beq        $a0, $v0, .L80091A38
    /* 81A20 80091A20 FFFFC230 */   andi      $v0, $a2, 0xFFFF
    /* 81A24 80091A24 0100A280 */  lb         $v0, 0x1($a1)
    /* 81A28 80091A28 00000000 */  nop
    /* 81A2C 80091A2C 02008214 */  bne        $a0, $v0, .L80091A38
    /* 81A30 80091A30 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 81A34 80091A34 FFFFE230 */  andi       $v0, $a3, 0xFFFF
  .L80091A38:
    /* 81A38 80091A38 0800E003 */  jr         $ra
    /* 81A3C 80091A3C 00000000 */   nop
endlabel GetHighlightCol__FiPcUsUsUs
