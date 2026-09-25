.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching memmove, 0x6C

glabel memmove
    /* A6FC 8001A6FC 21388000 */  addu       $a3, $a0, $zero
    /* A700 8001A700 2B10E500 */  sltu       $v0, $a3, $a1
    /* A704 8001A704 0C004014 */  bnez       $v0, .L8001A738
    /* A708 8001A708 2110C000 */   addu      $v0, $a2, $zero
    /* A70C 8001A70C 13004018 */  blez       $v0, .L8001A75C
    /* A710 8001A710 FFFFC624 */   addiu     $a2, $a2, -0x1
  .L8001A714:
    /* A714 8001A714 2120E600 */  addu       $a0, $a3, $a2
    /* A718 8001A718 2110A600 */  addu       $v0, $a1, $a2
    /* A71C 8001A71C 2118C000 */  addu       $v1, $a2, $zero
    /* A720 8001A720 00004290 */  lbu        $v0, 0x0($v0)
    /* A724 8001A724 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* A728 8001A728 FAFF601C */  bgtz       $v1, .L8001A714
    /* A72C 8001A72C 000082A0 */   sb        $v0, 0x0($a0)
    /* A730 8001A730 D8690008 */  j          .L8001A760
    /* A734 8001A734 2110E000 */   addu      $v0, $a3, $zero
  .L8001A738:
    /* A738 8001A738 08004018 */  blez       $v0, .L8001A75C
    /* A73C 8001A73C FFFFC624 */   addiu     $a2, $a2, -0x1
  .L8001A740:
    /* A740 8001A740 0000A290 */  lbu        $v0, 0x0($a1)
    /* A744 8001A744 0100A524 */  addiu      $a1, $a1, 0x1
    /* A748 8001A748 2118C000 */  addu       $v1, $a2, $zero
    /* A74C 8001A74C FFFFC624 */  addiu      $a2, $a2, -0x1
    /* A750 8001A750 0000E2A0 */  sb         $v0, 0x0($a3)
    /* A754 8001A754 FAFF601C */  bgtz       $v1, .L8001A740
    /* A758 8001A758 0100E724 */   addiu     $a3, $a3, 0x1
  .L8001A75C:
    /* A75C 8001A75C 2110E000 */  addu       $v0, $a3, $zero
  .L8001A760:
    /* A760 8001A760 0800E003 */  jr         $ra
    /* A764 8001A764 00000000 */   nop
endlabel memmove
    /* A768 8001A768 00000000 */  nop
