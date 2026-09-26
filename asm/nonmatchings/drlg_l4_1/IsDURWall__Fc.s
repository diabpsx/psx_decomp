.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsDURWall__Fc, 0x30

glabel IsDURWall__Fc
    /* 1A4F8 801540F0 00260400 */  sll        $a0, $a0, 24
    /* 1A4FC 801540F4 03260400 */  sra        $a0, $a0, 24
    /* 1A500 801540F8 19000224 */  addiu      $v0, $zero, 0x19
    /* 1A504 801540FC 03008210 */  beq        $a0, $v0, .L8015410C
    /* 1A508 80154100 1C000224 */   addiu     $v0, $zero, 0x1C
    /* 1A50C 80154104 03008214 */  bne        $a0, $v0, .L80154114
    /* 1A510 80154108 17008238 */   xori      $v0, $a0, 0x17
  .L8015410C:
    /* 1A514 8015410C 46500508 */  j          .L80154118
    /* 1A518 80154110 01000224 */   addiu     $v0, $zero, 0x1
  .L80154114:
    /* 1A51C 80154114 0100422C */  sltiu      $v0, $v0, 0x1
  .L80154118:
    /* 1A520 80154118 0800E003 */  jr         $ra
    /* 1A524 8015411C 00000000 */   nop
endlabel IsDURWall__Fc
