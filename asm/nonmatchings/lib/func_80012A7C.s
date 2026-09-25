.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80012A7C, 0x24

glabel func_80012A7C
    /* 2A7C 80012A7C 0600A010 */  beqz       $a1, .L80012A98
    /* 2A80 80012A80 FFFFA224 */   addiu     $v0, $a1, -0x1
    /* 2A84 80012A84 FFFF0324 */  addiu      $v1, $zero, -0x1
  .L80012A88:
    /* 2A88 80012A88 000080AC */  sw         $zero, 0x0($a0)
    /* 2A8C 80012A8C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 2A90 80012A90 FDFF4314 */  bne        $v0, $v1, .L80012A88
    /* 2A94 80012A94 04008424 */   addiu     $a0, $a0, 0x4
  .L80012A98:
    /* 2A98 80012A98 0800E003 */  jr         $ra
    /* 2A9C 80012A9C 00000000 */   nop
endlabel func_80012A7C
    /* 2AA0 80012AA0 00000000 */  nop
    /* 2AA4 80012AA4 00000000 */  nop
    /* 2AA8 80012AA8 00000000 */  nop
