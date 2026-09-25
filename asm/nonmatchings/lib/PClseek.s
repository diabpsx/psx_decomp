.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PClseek, 0x24

glabel PClseek
    /* EDC 80010EDC 2138C000 */  addu       $a3, $a2, $zero
    /* EE0 80010EE0 2130A000 */  addu       $a2, $a1, $zero
    /* EE4 80010EE4 21288000 */  addu       $a1, $a0, $zero
    /* EE8 80010EE8 CD410000 */  break      0, 263
    /* EEC 80010EEC 02004010 */  beqz       $v0, .L80010EF8
    /* EF0 80010EF0 21106000 */   addu      $v0, $v1, $zero
    /* EF4 80010EF4 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80010EF8:
    /* EF8 80010EF8 0800E003 */  jr         $ra
    /* EFC 80010EFC 00000000 */   nop
endlabel PClseek
