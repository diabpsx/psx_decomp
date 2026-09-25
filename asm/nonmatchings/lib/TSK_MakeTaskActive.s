.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_MakeTaskActive, 0x14

glabel TSK_MakeTaskActive
    /* 108F8 800208F8 1000828C */  lw         $v0, 0x10($a0)
    /* 108FC 800208FC 00000000 */  nop
    /* 10900 80020900 08004234 */  ori        $v0, $v0, 0x8
    /* 10904 80020904 0800E003 */  jr         $ra
    /* 10908 80020908 100082AC */   sw        $v0, 0x10($a0)
endlabel TSK_MakeTaskActive
