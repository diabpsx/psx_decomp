.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SwapMonsterType__FPi, 0x74

glabel SwapMonsterType__FPi
    /* 25AF0 8015F6E8 10000224 */  addiu      $v0, $zero, 0x10
    /* 25AF4 8015F6EC 1280033C */  lui        $v1, %hi(currlevel)
    /* 25AF8 8015F6F0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 25AFC 8015F6F4 0000858C */  lw         $a1, 0x0($a0)
    /* 25B00 8015F6F8 0D006214 */  bne        $v1, $v0, .L8015F730
    /* 25B04 8015F6FC 46000224 */   addiu     $v0, $zero, 0x46
    /* 25B08 8015F700 A3FFA224 */  addiu      $v0, $a1, -0x5D
    /* 25B0C 8015F704 0200422C */  sltiu      $v0, $v0, 0x2
    /* 25B10 8015F708 04004014 */  bnez       $v0, .L8015F71C
    /* 25B14 8015F70C A1FFA224 */   addiu     $v0, $a1, -0x5F
    /* 25B18 8015F710 0200422C */  sltiu      $v0, $v0, 0x2
    /* 25B1C 8015F714 03004010 */  beqz       $v0, .L8015F724
    /* 25B20 8015F718 6B000224 */   addiu     $v0, $zero, 0x6B
  .L8015F71C:
    /* 25B24 8015F71C 70000524 */  addiu      $a1, $zero, 0x70
    /* 25B28 8015F720 6B000224 */  addiu      $v0, $zero, 0x6B
  .L8015F724:
    /* 25B2C 8015F724 0200A214 */  bne        $a1, $v0, .L8015F730
    /* 25B30 8015F728 46000224 */   addiu     $v0, $zero, 0x46
    /* 25B34 8015F72C 6C000524 */  addiu      $a1, $zero, 0x6C
  .L8015F730:
    /* 25B38 8015F730 0200A214 */  bne        $a1, $v0, .L8015F73C
    /* 25B3C 8015F734 47000224 */   addiu     $v0, $zero, 0x47
    /* 25B40 8015F738 4C000524 */  addiu      $a1, $zero, 0x4C
  .L8015F73C:
    /* 25B44 8015F73C 0200A214 */  bne        $a1, $v0, .L8015F748
    /* 25B48 8015F740 45000224 */   addiu     $v0, $zero, 0x45
    /* 25B4C 8015F744 4E000524 */  addiu      $a1, $zero, 0x4E
  .L8015F748:
    /* 25B50 8015F748 0200A214 */  bne        $a1, $v0, .L8015F754
    /* 25B54 8015F74C 00000000 */   nop
    /* 25B58 8015F750 4D000524 */  addiu      $a1, $zero, 0x4D
  .L8015F754:
    /* 25B5C 8015F754 0800E003 */  jr         $ra
    /* 25B60 8015F758 000085AC */   sw        $a1, 0x0($a0)
endlabel SwapMonsterType__FPi
