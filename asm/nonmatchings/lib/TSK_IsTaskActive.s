.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_IsTaskActive, 0x14

glabel TSK_IsTaskActive
    /* 10934 80020934 1000828C */  lw         $v0, 0x10($a0)
    /* 10938 80020938 00000000 */  nop
    /* 1093C 8002093C C2100200 */  srl        $v0, $v0, 3
    /* 10940 80020940 0800E003 */  jr         $ra
    /* 10944 80020944 01004230 */   andi      $v0, $v0, 0x1
endlabel TSK_IsTaskActive
