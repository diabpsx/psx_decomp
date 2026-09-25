.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PCcreat, 0x20

glabel PCcreat
    /* F00 80010F00 21288000 */  addu       $a1, $a0, $zero
    /* F04 80010F04 21300000 */  addu       $a2, $zero, $zero
    /* F08 80010F08 8D400000 */  break      0, 258
    /* F0C 80010F0C 02004010 */  beqz       $v0, .L80010F18
    /* F10 80010F10 21106000 */   addu      $v0, $v1, $zero
    /* F14 80010F14 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80010F18:
    /* F18 80010F18 0800E003 */  jr         $ra
    /* F1C 80010F1C 00000000 */   nop
endlabel PCcreat
