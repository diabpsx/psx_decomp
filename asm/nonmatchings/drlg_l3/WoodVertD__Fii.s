.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WoodVertD__Fii, 0x9C

glabel WoodVertD__Fii
    /* 11C20 8014B818 0E80063C */  lui        $a2, %hi(dungeon + 0x60)
    /* 11C24 8014B81C 2441C624 */  addiu      $a2, $a2, %lo(dungeon + 0x60)
    /* 11C28 8014B820 40100400 */  sll        $v0, $a0, 1
    /* 11C2C 8014B824 21104400 */  addu       $v0, $v0, $a0
    /* 11C30 8014B828 40190200 */  sll        $v1, $v0, 5
    /* 11C34 8014B82C 21106600 */  addu       $v0, $v1, $a2
    /* 11C38 8014B830 40280500 */  sll        $a1, $a1, 1
    /* 11C3C 8014B834 2110A200 */  addu       $v0, $a1, $v0
    /* 11C40 8014B838 00004294 */  lhu        $v0, 0x0($v0)
    /* 11C44 8014B83C 00000000 */  nop
    /* 11C48 8014B840 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11C4C 8014B844 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11C50 8014B848 18004014 */  bnez       $v0, .L8014B8AC
    /* 11C54 8014B84C 21100000 */   addu      $v0, $zero, $zero
    /* 11C58 8014B850 40FFC224 */  addiu      $v0, $a2, -0xC0
    /* 11C5C 8014B854 21106200 */  addu       $v0, $v1, $v0
    /* 11C60 8014B858 2110A200 */  addu       $v0, $a1, $v0
    /* 11C64 8014B85C 00004294 */  lhu        $v0, 0x0($v0)
    /* 11C68 8014B860 00000000 */  nop
    /* 11C6C 8014B864 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11C70 8014B868 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11C74 8014B86C 0F004014 */  bnez       $v0, .L8014B8AC
    /* 11C78 8014B870 21100000 */   addu      $v0, $zero, $zero
    /* 11C7C 8014B874 A0FFC224 */  addiu      $v0, $a2, -0x60
    /* 11C80 8014B878 21106200 */  addu       $v0, $v1, $v0
    /* 11C84 8014B87C 2110A200 */  addu       $v0, $a1, $v0
    /* 11C88 8014B880 00004394 */  lhu        $v1, 0x0($v0)
    /* 11C8C 8014B884 07000224 */  addiu      $v0, $zero, 0x7
    /* 11C90 8014B888 07006210 */  beq        $v1, $v0, .L8014B8A8
    /* 11C94 8014B88C 02000224 */   addiu     $v0, $zero, 0x2
    /* 11C98 8014B890 05006210 */  beq        $v1, $v0, .L8014B8A8
    /* 11C9C 8014B894 86000224 */   addiu     $v0, $zero, 0x86
    /* 11CA0 8014B898 03006210 */  beq        $v1, $v0, .L8014B8A8
    /* 11CA4 8014B89C 88000224 */   addiu     $v0, $zero, 0x88
    /* 11CA8 8014B8A0 02006214 */  bne        $v1, $v0, .L8014B8AC
    /* 11CAC 8014B8A4 21100000 */   addu      $v0, $zero, $zero
  .L8014B8A8:
    /* 11CB0 8014B8A8 01000224 */  addiu      $v0, $zero, 0x1
  .L8014B8AC:
    /* 11CB4 8014B8AC 0800E003 */  jr         $ra
    /* 11CB8 8014B8B0 00000000 */   nop
endlabel WoodVertD__Fii
