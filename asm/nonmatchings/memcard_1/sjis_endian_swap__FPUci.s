.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching sjis_endian_swap__FPUci, 0x48

glabel sjis_endian_swap__FPUci
    /* 8B34 8014272C 0F00A018 */  blez       $a1, .L8014276C
    /* 8B38 80142730 00000000 */   nop
    /* 8B3C 80142734 2128A400 */  addu       $a1, $a1, $a0
  .L80142738:
    /* 8B40 80142738 01008390 */  lbu        $v1, 0x1($a0)
    /* 8B44 8014273C 00000000 */  nop
    /* 8B48 80142740 80006230 */  andi       $v0, $v1, 0x80
    /* 8B4C 80142744 05004010 */  beqz       $v0, .L8014275C
    /* 8B50 80142748 00000000 */   nop
    /* 8B54 8014274C 00008290 */  lbu        $v0, 0x0($a0)
    /* 8B58 80142750 000083A0 */  sb         $v1, 0x0($a0)
    /* 8B5C 80142754 010082A0 */  sb         $v0, 0x1($a0)
    /* 8B60 80142758 01008424 */  addiu      $a0, $a0, 0x1
  .L8014275C:
    /* 8B64 8014275C 01008424 */  addiu      $a0, $a0, 0x1
    /* 8B68 80142760 2A108500 */  slt        $v0, $a0, $a1
    /* 8B6C 80142764 F4FF4014 */  bnez       $v0, .L80142738
    /* 8B70 80142768 00000000 */   nop
  .L8014276C:
    /* 8B74 8014276C 0800E003 */  jr         $ra
    /* 8B78 80142770 00000000 */   nop
endlabel sjis_endian_swap__FPUci
