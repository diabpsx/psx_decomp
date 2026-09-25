.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_MakeTaskMortal, 0x14

glabel TSK_MakeTaskMortal
    /* 10920 80020920 1000828C */  lw         $v0, 0x10($a0)
    /* 10924 80020924 00000000 */  nop
    /* 10928 80020928 04004234 */  ori        $v0, $v0, 0x4
    /* 1092C 8002092C 0800E003 */  jr         $ra
    /* 10930 80020930 100082AC */   sw        $v0, 0x10($a0)
endlabel TSK_MakeTaskMortal
