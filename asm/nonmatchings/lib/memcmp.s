.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching memcmp, 0x4C

glabel memcmp
    /* A76C 8001A76C E2690008 */  j          .L8001A788
    /* A770 8001A770 00000000 */   nop
  .L8001A774:
    /* A774 8001A774 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* A778 8001A778 0300C01C */  bgtz       $a2, .L8001A788
    /* A77C 8001A77C 0100A524 */   addiu     $a1, $a1, 0x1
    /* A780 8001A780 EC690008 */  j          .L8001A7B0
    /* A784 8001A784 21100000 */   addu      $v0, $zero, $zero
  .L8001A788:
    /* A788 8001A788 00008390 */  lbu        $v1, 0x0($a0)
    /* A78C 8001A78C 0000A290 */  lbu        $v0, 0x0($a1)
    /* A790 8001A790 00000000 */  nop
    /* A794 8001A794 F7FF6210 */  beq        $v1, $v0, .L8001A774
    /* A798 8001A798 01008424 */   addiu     $a0, $a0, 0x1
    /* A79C 8001A79C FFFF8424 */  addiu      $a0, $a0, -0x1
    /* A7A0 8001A7A0 00008390 */  lbu        $v1, 0x0($a0)
    /* A7A4 8001A7A4 0000A290 */  lbu        $v0, 0x0($a1)
    /* A7A8 8001A7A8 00000000 */  nop
    /* A7AC 8001A7AC 23106200 */  subu       $v0, $v1, $v0
  .L8001A7B0:
    /* A7B0 8001A7B0 0800E003 */  jr         $ra
    /* A7B4 8001A7B4 00000000 */   nop
endlabel memcmp
    /* A7B8 8001A7B8 00000000 */  nop
