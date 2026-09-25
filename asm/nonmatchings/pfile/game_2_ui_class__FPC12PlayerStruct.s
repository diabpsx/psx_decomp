.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching game_2_ui_class__FPC12PlayerStruct, 0x2C

glabel game_2_ui_class__FPC12PlayerStruct
    /* 4FC20 8005FC20 F6008480 */  lb         $a0, 0xF6($a0)
    /* 4FC24 8005FC24 00000000 */  nop
    /* 4FC28 8005FC28 03008014 */  bnez       $a0, .L8005FC38
    /* 4FC2C 8005FC2C 01000324 */   addiu     $v1, $zero, 0x1
    /* 4FC30 8005FC30 117F0108 */  j          .L8005FC44
    /* 4FC34 8005FC34 21100000 */   addu      $v0, $zero, $zero
  .L8005FC38:
    /* 4FC38 8005FC38 02008310 */  beq        $a0, $v1, .L8005FC44
    /* 4FC3C 8005FC3C 01000224 */   addiu     $v0, $zero, 0x1
    /* 4FC40 8005FC40 02000224 */  addiu      $v0, $zero, 0x2
  .L8005FC44:
    /* 4FC44 8005FC44 0800E003 */  jr         $ra
    /* 4FC48 8005FC48 00000000 */   nop
endlabel game_2_ui_class__FPC12PlayerStruct
