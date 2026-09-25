.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching closecdrom, 0x1C

glabel closecdrom
    /* 1739C 8002739C 701C828F */  lw         $v0, %gp_rel(cdrominitflag)($gp)
    /* 173A0 800273A0 00000000 */  nop
    /* 173A4 800273A4 02004010 */  beqz       $v0, .L800273B0
    /* 173A8 800273A8 00000000 */   nop
    /* 173AC 800273AC 701C80AF */  sw         $zero, %gp_rel(cdrominitflag)($gp)
  .L800273B0:
    /* 173B0 800273B0 0800E003 */  jr         $ra
    /* 173B4 800273B4 00000000 */   nop
endlabel closecdrom
