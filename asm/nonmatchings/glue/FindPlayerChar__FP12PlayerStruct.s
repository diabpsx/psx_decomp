.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindPlayerChar__FP12PlayerStruct, 0x30

glabel FindPlayerChar__FP12PlayerStruct
    /* 8C254 8009C254 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8C258 8009C258 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8C25C 8009C25C 43008590 */  lbu        $a1, 0x43($a0)
    /* 8C260 8009C260 F6008480 */  lb         $a0, 0xF6($a0)
    /* 8C264 8009C264 00360500 */  sll        $a2, $a1, 24
    /* 8C268 8009C268 0F00A530 */  andi       $a1, $a1, 0xF
    /* 8C26C 8009C26C 7E70020C */  jal        FindPlayerChar__Fiii
    /* 8C270 8009C270 03370600 */   sra       $a2, $a2, 28
    /* 8C274 8009C274 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8C278 8009C278 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8C27C 8009C27C 0800E003 */  jr         $ra
    /* 8C280 8009C280 00000000 */   nop
endlabel FindPlayerChar__FP12PlayerStruct
