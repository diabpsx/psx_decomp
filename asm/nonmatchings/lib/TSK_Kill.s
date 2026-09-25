.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_Kill, 0x50

glabel TSK_Kill
    /* 10548 80020548 1280023C */  lui        $v0, %hi(D_8011C990)
    /* 1054C 8002054C 90C9428C */  lw         $v0, %lo(D_8011C990)($v0)
    /* 10550 80020550 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10554 80020554 0A008214 */  bne        $a0, $v0, .L80020580
    /* 10558 80020558 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1055C 8002055C 08008010 */  beqz       $a0, .L80020580
    /* 10560 80020560 00000000 */   nop
    /* 10564 80020564 1000828C */  lw         $v0, 0x10($a0)
    /* 10568 80020568 00000000 */  nop
    /* 1056C 8002056C 02004234 */  ori        $v0, $v0, 0x2
    /* 10570 80020570 2581000C */  jal        ReturnToSchedulerIfCurrentTask
    /* 10574 80020574 100082AC */   sw        $v0, 0x10($a0)
    /* 10578 80020578 62810008 */  j          .L80020588
    /* 1057C 8002057C 00000000 */   nop
  .L80020580:
    /* 10580 80020580 7282000C */  jal        LoTskKill
    /* 10584 80020584 00000000 */   nop
  .L80020588:
    /* 10588 80020588 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1058C 8002058C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10590 80020590 0800E003 */  jr         $ra
    /* 10594 80020594 00000000 */   nop
endlabel TSK_Kill
