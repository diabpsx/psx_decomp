.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TonysDummyPoll__Fv, 0x2C

glabel TonysDummyPoll__Fv
    /* 8B82C 8009B82C B406828F */  lw         $v0, %gp_rel(tony_poll)($gp)
    /* 8B830 8009B830 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8B834 8009B834 04004010 */  beqz       $v0, .L8009B848
    /* 8B838 8009B838 1000BFAF */   sw        $ra, 0x10($sp)
    /* 8B83C 8009B83C 9E4E000C */  jal        DrawSync
    /* 8B840 8009B840 21200000 */   addu      $a0, $zero, $zero
    /* 8B844 8009B844 0D000100 */  break      1
  .L8009B848:
    /* 8B848 8009B848 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8B84C 8009B84C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8B850 8009B850 0800E003 */  jr         $ra
    /* 8B854 8009B854 00000000 */   nop
endlabel TonysDummyPoll__Fv
