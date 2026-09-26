.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WoodVertU__Fii, 0xAC

glabel WoodVertU__Fii
    /* 11B74 8014B76C 0E80063C */  lui        $a2, %hi(dungeon + 0x60)
    /* 11B78 8014B770 2441C624 */  addiu      $a2, $a2, %lo(dungeon + 0x60)
    /* 11B7C 8014B774 40100400 */  sll        $v0, $a0, 1
    /* 11B80 8014B778 21104400 */  addu       $v0, $v0, $a0
    /* 11B84 8014B77C 40190200 */  sll        $v1, $v0, 5
    /* 11B88 8014B780 21106600 */  addu       $v0, $v1, $a2
    /* 11B8C 8014B784 40280500 */  sll        $a1, $a1, 1
    /* 11B90 8014B788 2110A200 */  addu       $v0, $a1, $v0
    /* 11B94 8014B78C 00004294 */  lhu        $v0, 0x0($v0)
    /* 11B98 8014B790 00000000 */  nop
    /* 11B9C 8014B794 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11BA0 8014B798 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11BA4 8014B79C 1C004014 */  bnez       $v0, .L8014B810
    /* 11BA8 8014B7A0 21100000 */   addu      $v0, $zero, $zero
    /* 11BAC 8014B7A4 40FFC224 */  addiu      $v0, $a2, -0xC0
    /* 11BB0 8014B7A8 21106200 */  addu       $v0, $v1, $v0
    /* 11BB4 8014B7AC 2110A200 */  addu       $v0, $a1, $v0
    /* 11BB8 8014B7B0 00004294 */  lhu        $v0, 0x0($v0)
    /* 11BBC 8014B7B4 00000000 */  nop
    /* 11BC0 8014B7B8 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11BC4 8014B7BC 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11BC8 8014B7C0 13004014 */  bnez       $v0, .L8014B810
    /* 11BCC 8014B7C4 21100000 */   addu      $v0, $zero, $zero
    /* 11BD0 8014B7C8 A0FFC224 */  addiu      $v0, $a2, -0x60
    /* 11BD4 8014B7CC 21106200 */  addu       $v0, $v1, $v0
    /* 11BD8 8014B7D0 2110A200 */  addu       $v0, $a1, $v0
    /* 11BDC 8014B7D4 00004394 */  lhu        $v1, 0x0($v0)
    /* 11BE0 8014B7D8 07000224 */  addiu      $v0, $zero, 0x7
    /* 11BE4 8014B7DC 0B006210 */  beq        $v1, $v0, .L8014B80C
    /* 11BE8 8014B7E0 0A000224 */   addiu     $v0, $zero, 0xA
    /* 11BEC 8014B7E4 09006210 */  beq        $v1, $v0, .L8014B80C
    /* 11BF0 8014B7E8 7E000224 */   addiu     $v0, $zero, 0x7E
    /* 11BF4 8014B7EC 07006210 */  beq        $v1, $v0, .L8014B80C
    /* 11BF8 8014B7F0 81000224 */   addiu     $v0, $zero, 0x81
    /* 11BFC 8014B7F4 05006210 */  beq        $v1, $v0, .L8014B80C
    /* 11C00 8014B7F8 86000224 */   addiu     $v0, $zero, 0x86
    /* 11C04 8014B7FC 03006210 */  beq        $v1, $v0, .L8014B80C
    /* 11C08 8014B800 88000224 */   addiu     $v0, $zero, 0x88
    /* 11C0C 8014B804 02006214 */  bne        $v1, $v0, .L8014B810
    /* 11C10 8014B808 21100000 */   addu      $v0, $zero, $zero
  .L8014B80C:
    /* 11C14 8014B80C 01000224 */  addiu      $v0, $zero, 0x1
  .L8014B810:
    /* 11C18 8014B810 0800E003 */  jr         $ra
    /* 11C1C 8014B814 00000000 */   nop
endlabel WoodVertU__Fii
