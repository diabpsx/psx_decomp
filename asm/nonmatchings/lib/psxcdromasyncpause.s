.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching psxcdromasyncpause, 0x3C

glabel psxcdromasyncpause
    /* 175C4 800275C4 01000224 */  addiu      $v0, $zero, 0x1
    /* 175C8 800275C8 981C82AF */  sw         $v0, %gp_rel(asyncpausereq)($gp)
    /* 175CC 800275CC 741C828F */  lw         $v0, %gp_rel(asynctimerflag)($gp)
    /* 175D0 800275D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 175D4 800275D4 06004010 */  beqz       $v0, .L800275F0
    /* 175D8 800275D8 1000BFAF */   sw        $ra, 0x10($sp)
    /* 175DC 800275DC 0280043C */  lui        $a0, %hi(asynctimer)
    /* 175E0 800275E0 70768424 */  addiu      $a0, $a0, %lo(asynctimer)
    /* 175E4 800275E4 1ABF000C */  jal        deltimer
    /* 175E8 800275E8 00000000 */   nop
    /* 175EC 800275EC 741C80AF */  sw         $zero, %gp_rel(asynctimerflag)($gp)
  .L800275F0:
    /* 175F0 800275F0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 175F4 800275F4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 175F8 800275F8 0800E003 */  jr         $ra
    /* 175FC 800275FC 00000000 */   nop
endlabel psxcdromasyncpause
