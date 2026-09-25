.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_IsTaskMortal, 0x14

glabel TSK_IsTaskMortal
    /* 10948 80020948 1000828C */  lw         $v0, 0x10($a0)
    /* 1094C 8002094C 00000000 */  nop
    /* 10950 80020950 82100200 */  srl        $v0, $v0, 2
    /* 10954 80020954 0800E003 */  jr         $ra
    /* 10958 80020958 01004230 */   andi      $v0, $v0, 0x1
endlabel TSK_IsTaskMortal
