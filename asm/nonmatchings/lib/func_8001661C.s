.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001661C, 0x24

glabel func_8001661C
    /* 661C 8001661C 0600C010 */  beqz       $a2, .L80016638
    /* 6620 80016620 FFFFC224 */   addiu     $v0, $a2, -0x1
    /* 6624 80016624 FFFF0324 */  addiu      $v1, $zero, -0x1
  .L80016628:
    /* 6628 80016628 000085A0 */  sb         $a1, 0x0($a0)
    /* 662C 8001662C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 6630 80016630 FDFF4314 */  bne        $v0, $v1, .L80016628
    /* 6634 80016634 01008424 */   addiu     $a0, $a0, 0x1
  .L80016638:
    /* 6638 80016638 0800E003 */  jr         $ra
    /* 663C 8001663C 00000000 */   nop
endlabel func_8001661C
    /* 6640 80016640 00000000 */  nop
    /* 6644 80016644 00000000 */  nop
    /* 6648 80016648 00000000 */  nop
