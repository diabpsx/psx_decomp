.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001E908, 0x2C

glabel func_8001E908
    /* E908 8001E908 0800C010 */  beqz       $a2, .L8001E92C
    /* E90C 8001E90C 21180000 */   addu      $v1, $zero, $zero
  .L8001E910:
    /* E910 8001E910 0000A28C */  lw         $v0, 0x0($a1)
    /* E914 8001E914 0400A524 */  addiu      $a1, $a1, 0x4
    /* E918 8001E918 01006324 */  addiu      $v1, $v1, 0x1
    /* E91C 8001E91C 000082AC */  sw         $v0, 0x0($a0)
    /* E920 8001E920 2B106600 */  sltu       $v0, $v1, $a2
    /* E924 8001E924 FAFF4014 */  bnez       $v0, .L8001E910
    /* E928 8001E928 04008424 */   addiu     $a0, $a0, 0x4
  .L8001E92C:
    /* E92C 8001E92C 0800E003 */  jr         $ra
    /* E930 8001E930 00000000 */   nop
endlabel func_8001E908
