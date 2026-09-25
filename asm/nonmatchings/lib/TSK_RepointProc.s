.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_RepointProc, 0x44

glabel TSK_RepointProc
    /* 1066C 8002066C 1280023C */  lui        $v0, %hi(D_8011C990)
    /* 10670 80020670 90C9428C */  lw         $v0, %lo(D_8011C990)($v0)
    /* 10674 80020674 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10678 80020678 05008214 */  bne        $a0, $v0, .L80020690
    /* 1067C 8002067C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 10680 80020680 8981000C */  jal        TSK_JumpAndResetStack
    /* 10684 80020684 2120A000 */   addu      $a0, $a1, $zero
    /* 10688 80020688 A8810008 */  j          .L800206A0
    /* 1068C 8002068C 00000000 */   nop
  .L80020690:
    /* 10690 80020690 1000828C */  lw         $v0, 0x10($a0)
    /* 10694 80020694 500085AC */  sw         $a1, 0x50($a0)
    /* 10698 80020698 01004234 */  ori        $v0, $v0, 0x1
    /* 1069C 8002069C 100082AC */  sw         $v0, 0x10($a0)
  .L800206A0:
    /* 106A0 800206A0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 106A4 800206A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 106A8 800206A8 0800E003 */  jr         $ra
    /* 106AC 800206AC 00000000 */   nop
endlabel TSK_RepointProc
