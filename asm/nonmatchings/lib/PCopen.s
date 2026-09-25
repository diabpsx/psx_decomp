.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PCopen, 0x20

glabel PCopen
    /* EAC 80010EAC 2130A000 */  addu       $a2, $a1, $zero
    /* EB0 80010EB0 21288000 */  addu       $a1, $a0, $zero
    /* EB4 80010EB4 CD400000 */  break      0, 259
    /* EB8 80010EB8 02004010 */  beqz       $v0, .L80010EC4
    /* EBC 80010EBC 21106000 */   addu      $v0, $v1, $zero
    /* EC0 80010EC0 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80010EC4:
    /* EC4 80010EC4 0800E003 */  jr         $ra
    /* EC8 80010EC8 00000000 */   nop
endlabel PCopen
