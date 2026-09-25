.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_80010A2C, 0x50

glabel func_80010A2C
    /* A2C 80010A2C FCFFA4AF */  sw         $a0, -0x4($sp)
    /* A30 80010A30 FCFFBD27 */  addiu      $sp, $sp, -0x4
  .L80010A34:
    /* A34 80010A34 00004428 */  slti       $a0, $v0, 0x0
    /* A38 80010A38 40100200 */  sll        $v0, $v0, 1
    /* A3C 80010A3C 42080300 */  srl        $at, $v1, 1
    /* A40 80010A40 C01F0300 */  sll        $v1, $v1, 31
    /* A44 80010A44 25186100 */  or         $v1, $v1, $at
    /* A48 80010A48 02006104 */  bgez       $v1, .L80010A54
    /* A4C 80010A4C 00000000 */   nop
    /* A50 80010A50 01004234 */  ori        $v0, $v0, 0x1
  .L80010A54:
    /* A54 80010A54 0C008014 */  bnez       $a0, .L80010A88
    /* A58 80010A58 00000000 */   nop
    /* A5C 80010A5C FFFFC620 */  addi       $a2, $a2, -0x1 /* handwritten instruction */
    /* A60 80010A60 F4FFC014 */  bnez       $a2, .L80010A34
    /* A64 80010A64 00000000 */   nop
    /* A68 80010A68 0000A48F */  lw         $a0, 0x0($sp)
    /* A6C 80010A6C 00000000 */  nop
    /* A70 80010A70 0400BD27 */  addiu      $sp, $sp, 0x4
    /* A74 80010A74 0800E003 */  jr         $ra
    /* A78 80010A78 00000000 */   nop
endlabel func_80010A2C
