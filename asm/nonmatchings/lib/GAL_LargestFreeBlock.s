.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_LargestFreeBlock, 0x7C

glabel GAL_LargestFreeBlock
    /* 119F0 800219F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 119F4 800219F4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 119F8 800219F8 FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 119FC 800219FC FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 11A00 80021A00 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 11A04 80021A04 24208200 */   and       $a0, $a0, $v0
    /* 11A08 80021A08 05004014 */  bnez       $v0, .L80021A20
    /* 11A0C 80021A0C 00000000 */   nop
    /* 11A10 80021A10 0389000C */  jal        GSetError
    /* 11A14 80021A14 04000434 */   ori       $a0, $zero, 0x4
    /* 11A18 80021A18 97860008 */  j          .L80021A5C
    /* 11A1C 80021A1C 21100000 */   addu      $v0, $zero, $zero
  .L80021A20:
    /* 11A20 80021A20 2000438C */  lw         $v1, 0x20($v0)
    /* 11A24 80021A24 00000000 */  nop
    /* 11A28 80021A28 0B006010 */  beqz       $v1, .L80021A58
    /* 11A2C 80021A2C 21280000 */   addu      $a1, $zero, $zero
  .L80021A30:
    /* 11A30 80021A30 0C00648C */  lw         $a0, 0xC($v1)
    /* 11A34 80021A34 00000000 */  nop
    /* 11A38 80021A38 2B10A400 */  sltu       $v0, $a1, $a0
    /* 11A3C 80021A3C 02004010 */  beqz       $v0, .L80021A48
    /* 11A40 80021A40 00000000 */   nop
    /* 11A44 80021A44 21288000 */  addu       $a1, $a0, $zero
  .L80021A48:
    /* 11A48 80021A48 0400638C */  lw         $v1, 0x4($v1)
    /* 11A4C 80021A4C 00000000 */  nop
    /* 11A50 80021A50 F7FF6014 */  bnez       $v1, .L80021A30
    /* 11A54 80021A54 00000000 */   nop
  .L80021A58:
    /* 11A58 80021A58 2110A000 */  addu       $v0, $a1, $zero
  .L80021A5C:
    /* 11A5C 80021A5C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 11A60 80021A60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 11A64 80021A64 0800E003 */  jr         $ra
    /* 11A68 80021A68 00000000 */   nop
endlabel GAL_LargestFreeBlock
