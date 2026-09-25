.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_JumpAndResetStack, 0x48

glabel TSK_JumpAndResetStack
    /* 10624 80020624 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10628 80020628 1280063C */  lui        $a2, %hi(D_8011C990)
    /* 1062C 8002062C 90C9C68C */  lw         $a2, %lo(D_8011C990)($a2)
    /* 10630 80020630 21188000 */  addu       $v1, $a0, $zero
    /* 10634 80020634 0900C010 */  beqz       $a2, .L8002065C
    /* 10638 80020638 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1063C 8002063C 1400C48C */  lw         $a0, 0x14($a2)
    /* 10640 80020640 1800C28C */  lw         $v0, 0x18($a2)
    /* 10644 80020644 0280053C */  lui        $a1, %hi(ExecuteTask)
    /* 10648 80020648 380AA524 */  addiu      $a1, $a1, %lo(ExecuteTask)
    /* 1064C 8002064C 5000C3AC */  sw         $v1, 0x50($a2)
    /* 10650 80020650 21208200 */  addu       $a0, $a0, $v0
    /* 10654 80020654 5F84000C */  jal        GSYS_SetStackAndJump
    /* 10658 80020658 F0FF8424 */   addiu     $a0, $a0, -0x10
  .L8002065C:
    /* 1065C 8002065C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10660 80020660 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10664 80020664 0800E003 */  jr         $ra
    /* 10668 80020668 00000000 */   nop
endlabel TSK_JumpAndResetStack
