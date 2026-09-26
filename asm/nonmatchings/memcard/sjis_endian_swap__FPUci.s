.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching sjis_endian_swap__FPUci, 0x20

glabel sjis_endian_swap__FPUci
    /* 8B34 8014272C 0F00A018 */  blez       $a1, D_8014276C
    /* 8B38 80142730 00000000 */   nop
    /* 8B3C 80142734 2128A400 */  addu       $a1, $a1, $a0
    /* 8B40 80142738 01008390 */  lbu        $v1, 0x1($a0)
    /* 8B44 8014273C 00000000 */  nop
    /* 8B48 80142740 80006230 */  andi       $v0, $v1, 0x80
    /* 8B4C 80142744 05004010 */  beqz       $v0, D_8014275C
    /* 8B50 80142748 00000000 */   nop
endlabel sjis_endian_swap__FPUci
