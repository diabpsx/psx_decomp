.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80012D24, 0x24

glabel func_80012D24
    /* 2D24 80012D24 0600A010 */  beqz       $a1, .L80012D40
    /* 2D28 80012D28 FFFFA224 */   addiu     $v0, $a1, -0x1
    /* 2D2C 80012D2C FFFF0324 */  addiu      $v1, $zero, -0x1
  .L80012D30:
    /* 2D30 80012D30 000080AC */  sw         $zero, 0x0($a0)
    /* 2D34 80012D34 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 2D38 80012D38 FDFF4314 */  bne        $v0, $v1, .L80012D30
    /* 2D3C 80012D3C 04008424 */   addiu     $a0, $a0, 0x4
  .L80012D40:
    /* 2D40 80012D40 0800E003 */  jr         $ra
    /* 2D44 80012D44 00000000 */   nop
endlabel func_80012D24
    /* 2D48 80012D48 00000000 */  nop
