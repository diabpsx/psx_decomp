.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindCreature__7CBlocksi, 0x74

glabel FindCreature__7CBlocksi
    /* 7D688 8008D688 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7D68C 8008D68C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7D690 8008D690 7800848C */  lw         $a0, 0x78($a0)
    /* 7D694 8008D694 00000000 */  nop
    /* 7D698 8008D698 00008294 */  lhu        $v0, 0x0($a0)
    /* 7D69C 8008D69C 00000000 */  nop
    /* 7D6A0 8008D6A0 0C004010 */  beqz       $v0, .L8008D6D4
    /* 7D6A4 8008D6A4 21180000 */   addu      $v1, $zero, $zero
    /* 7D6A8 8008D6A8 21304000 */  addu       $a2, $v0, $zero
    /* 7D6AC 8008D6AC 0400848C */  lw         $a0, 0x4($a0)
  .L8008D6B0:
    /* 7D6B0 8008D6B0 00000000 */  nop
    /* 7D6B4 8008D6B4 00008290 */  lbu        $v0, 0x0($a0)
    /* 7D6B8 8008D6B8 00000000 */  nop
    /* 7D6BC 8008D6BC 0B004510 */  beq        $v0, $a1, .L8008D6EC
    /* 7D6C0 8008D6C0 21106000 */   addu      $v0, $v1, $zero
    /* 7D6C4 8008D6C4 01006324 */  addiu      $v1, $v1, 0x1
    /* 7D6C8 8008D6C8 2B106600 */  sltu       $v0, $v1, $a2
    /* 7D6CC 8008D6CC F8FF4014 */  bnez       $v0, .L8008D6B0
    /* 7D6D0 8008D6D0 01008424 */   addiu     $a0, $a0, 0x1
  .L8008D6D4:
    /* 7D6D4 8008D6D4 21200000 */  addu       $a0, $zero, $zero
    /* 7D6D8 8008D6D8 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7D6DC 8008D6DC 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7D6E0 8008D6E0 A583000C */  jal        DBG_Error
    /* 7D6E4 8008D6E4 7E010624 */   addiu     $a2, $zero, 0x17E
    /* 7D6E8 8008D6E8 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8008D6EC:
    /* 7D6EC 8008D6EC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7D6F0 8008D6F0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7D6F4 8008D6F4 0800E003 */  jr         $ra
    /* 7D6F8 8008D6F8 00000000 */   nop
endlabel FindCreature__7CBlocksi
