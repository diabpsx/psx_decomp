.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_IsCurrentTask, 0x18

glabel TSK_IsCurrentTask
    /* 106C0 800206C0 1280023C */  lui        $v0, %hi(D_8011C990)
    /* 106C4 800206C4 90C9428C */  lw         $v0, %lo(D_8011C990)($v0)
    /* 106C8 800206C8 00000000 */  nop
    /* 106CC 800206CC 26108200 */  xor        $v0, $a0, $v0
    /* 106D0 800206D0 0800E003 */  jr         $ra
    /* 106D4 800206D4 0100422C */   sltiu     $v0, $v0, 0x1
endlabel TSK_IsCurrentTask
