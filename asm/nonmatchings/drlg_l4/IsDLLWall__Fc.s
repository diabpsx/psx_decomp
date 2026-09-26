.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsDLLWall__Fc, 0x30

glabel IsDLLWall__Fc
    /* 1A528 80154120 00260400 */  sll        $a0, $a0, 24
    /* 1A52C 80154124 03260400 */  sra        $a0, $a0, 24
    /* 1A530 80154128 1B000224 */  addiu      $v0, $zero, 0x1B
    /* 1A534 8015412C 03008210 */  beq        $a0, $v0, .L8015413C
    /* 1A538 80154130 1A000224 */   addiu     $v0, $zero, 0x1A
    /* 1A53C 80154134 03008214 */  bne        $a0, $v0, .L80154144
    /* 1A540 80154138 16008238 */   xori      $v0, $a0, 0x16
  .L8015413C:
    /* 1A544 8015413C 52500508 */  j          .L80154148
    /* 1A548 80154140 01000224 */   addiu     $v0, $zero, 0x1
  .L80154144:
    /* 1A54C 80154144 0100422C */  sltiu      $v0, $v0, 0x1
  .L80154148:
    /* 1A550 80154148 0800E003 */  jr         $ra
    /* 1A554 8015414C 00000000 */   nop
endlabel IsDLLWall__Fc
