.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setasynciofuncs, 0x10

glabel setasynciofuncs
    /* 19504 80029504 F81C84AF */  sw         $a0, %gp_rel(async_iotaskptr)($gp)
    /* 19508 80029508 FC1C85AF */  sw         $a1, %gp_rel(async_iotaskstatus)($gp)
    /* 1950C 8002950C 0800E003 */  jr         $ra
    /* 19510 80029510 00000000 */   nop
endlabel setasynciofuncs
