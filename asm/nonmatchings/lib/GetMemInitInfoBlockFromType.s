.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetMemInitInfoBlockFromType, 0x3C

glabel GetMemInitInfoBlockFromType
    /* 11C98 80021C98 1280033C */  lui        $v1, %hi(D_8011C9CC)
    /* 11C9C 80021C9C CCC9638C */  lw         $v1, %lo(D_8011C9CC)($v1)
    /* 11CA0 80021CA0 00000000 */  nop
    /* 11CA4 80021CA4 09006010 */  beqz       $v1, .L80021CCC
    /* 11CA8 80021CA8 21100000 */   addu      $v0, $zero, $zero
  .L80021CAC:
    /* 11CAC 80021CAC 0800628C */  lw         $v0, 0x8($v1)
    /* 11CB0 80021CB0 00000000 */  nop
    /* 11CB4 80021CB4 05004410 */  beq        $v0, $a0, .L80021CCC
    /* 11CB8 80021CB8 21106000 */   addu      $v0, $v1, $zero
    /* 11CBC 80021CBC 1800638C */  lw         $v1, 0x18($v1)
    /* 11CC0 80021CC0 00000000 */  nop
    /* 11CC4 80021CC4 F9FF6014 */  bnez       $v1, .L80021CAC
    /* 11CC8 80021CC8 21100000 */   addu      $v0, $zero, $zero
  .L80021CCC:
    /* 11CCC 80021CCC 0800E003 */  jr         $ra
    /* 11CD0 80021CD0 00000000 */   nop
endlabel GetMemInitInfoBlockFromType
