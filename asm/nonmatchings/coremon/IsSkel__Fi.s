.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsSkel__Fi, 0x60

glabel IsSkel__Fi
    /* 6F49C 8007F49C 1280033C */  lui        $v1, %hi(currlevel)
    /* 6F4A0 8007F4A0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 6F4A4 8007F4A4 10000224 */  addiu      $v0, $zero, 0x10
    /* 6F4A8 8007F4A8 06006214 */  bne        $v1, $v0, .L8007F4C4
    /* 6F4AC 8007F4AC F8FF8224 */   addiu     $v0, $a0, -0x8
    /* 6F4B0 8007F4B0 90FF8224 */  addiu      $v0, $a0, -0x70
    /* 6F4B4 8007F4B4 0400422C */  sltiu      $v0, $v0, 0x4
    /* 6F4B8 8007F4B8 0E004014 */  bnez       $v0, .L8007F4F4
    /* 6F4BC 8007F4BC 01000224 */   addiu     $v0, $zero, 0x1
    /* 6F4C0 8007F4C0 F8FF8224 */  addiu      $v0, $a0, -0x8
  .L8007F4C4:
    /* 6F4C4 8007F4C4 0400422C */  sltiu      $v0, $v0, 0x4
    /* 6F4C8 8007F4C8 08004014 */  bnez       $v0, .L8007F4EC
    /* 6F4CC 8007F4CC 21180000 */   addu      $v1, $zero, $zero
    /* 6F4D0 8007F4D0 ECFF8224 */  addiu      $v0, $a0, -0x14
    /* 6F4D4 8007F4D4 0400422C */  sltiu      $v0, $v0, 0x4
    /* 6F4D8 8007F4D8 04004014 */  bnez       $v0, .L8007F4EC
    /* 6F4DC 8007F4DC E8FF8224 */   addiu     $v0, $a0, -0x18
    /* 6F4E0 8007F4E0 0400422C */  sltiu      $v0, $v0, 0x4
    /* 6F4E4 8007F4E4 03004010 */  beqz       $v0, .L8007F4F4
    /* 6F4E8 8007F4E8 21106000 */   addu      $v0, $v1, $zero
  .L8007F4EC:
    /* 6F4EC 8007F4EC 01000324 */  addiu      $v1, $zero, 0x1
    /* 6F4F0 8007F4F0 21106000 */  addu       $v0, $v1, $zero
  .L8007F4F4:
    /* 6F4F4 8007F4F4 0800E003 */  jr         $ra
    /* 6F4F8 8007F4F8 00000000 */   nop
endlabel IsSkel__Fi
