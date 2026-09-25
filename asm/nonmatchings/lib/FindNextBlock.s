.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindNextBlock, 0x3C

glabel FindNextBlock
    /* 12D2C 80022D2C 0C008010 */  beqz       $a0, .L80022D60
    /* 12D30 80022D30 21100000 */   addu      $v0, $zero, $zero
    /* 12D34 80022D34 0A00A010 */  beqz       $a1, .L80022D60
    /* 12D38 80022D38 00000000 */   nop
  .L80022D3C:
    /* 12D3C 80022D3C 0800A28C */  lw         $v0, 0x8($a1)
    /* 12D40 80022D40 00000000 */  nop
    /* 12D44 80022D44 2B104400 */  sltu       $v0, $v0, $a0
    /* 12D48 80022D48 05004010 */  beqz       $v0, .L80022D60
    /* 12D4C 80022D4C 2110A000 */   addu      $v0, $a1, $zero
    /* 12D50 80022D50 0400A58C */  lw         $a1, 0x4($a1)
    /* 12D54 80022D54 00000000 */  nop
    /* 12D58 80022D58 F8FFA014 */  bnez       $a1, .L80022D3C
    /* 12D5C 80022D5C 21100000 */   addu      $v0, $zero, $zero
  .L80022D60:
    /* 12D60 80022D60 0800E003 */  jr         $ra
    /* 12D64 80022D64 00000000 */   nop
endlabel FindNextBlock
