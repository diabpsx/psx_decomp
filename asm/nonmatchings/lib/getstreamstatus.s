.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getstreamstatus, 0x1C

glabel getstreamstatus
    /* 1D8E0 8002D8E0 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1D8E4 8002D8E4 00000000 */  nop
    /* 1D8E8 8002D8E8 02006010 */  beqz       $v1, .L8002D8F4
    /* 1D8EC 8002D8EC 21100000 */   addu      $v0, $zero, $zero
    /* 1D8F0 8002D8F0 2800628C */  lw         $v0, 0x28($v1)
  .L8002D8F4:
    /* 1D8F4 8002D8F4 0800E003 */  jr         $ra
    /* 1D8F8 8002D8F8 00000000 */   nop
endlabel getstreamstatus
