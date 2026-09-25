.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_MakeTaskInactive, 0x14

glabel TSK_MakeTaskInactive
    /* 108E4 800208E4 1000828C */  lw         $v0, 0x10($a0)
    /* 108E8 800208E8 F7FF0324 */  addiu      $v1, $zero, -0x9
    /* 108EC 800208EC 24104300 */  and        $v0, $v0, $v1
    /* 108F0 800208F0 0800E003 */  jr         $ra
    /* 108F4 800208F4 100082AC */   sw        $v0, 0x10($a0)
endlabel TSK_MakeTaskInactive
