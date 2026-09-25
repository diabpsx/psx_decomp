.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_STAND__FP12ObjectStructiiP7TextDati, 0x3C

glabel PrintOBJ_STAND__FP12ObjectStructiiP7TextDati
    /* 6EC74 8007EC74 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 6EC78 8007EC78 3800A28F */  lw         $v0, 0x38($sp)
    /* 6EC7C 8007EC7C 00000000 */  nop
    /* 6EC80 8007EC80 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 6EC84 8007EC84 02004104 */  bgez       $v0, .L8007EC90
    /* 6EC88 8007EC88 2000BFAF */   sw        $ra, 0x20($sp)
    /* 6EC8C 8007EC8C 21100000 */  addu       $v0, $zero, $zero
  .L8007EC90:
    /* 6EC90 8007EC90 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6EC94 8007EC94 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6EC98 8007EC98 7AF6010C */  jal        DefaultObjPrint__FP12ObjectStructiiP7TextDatiii
    /* 6EC9C 8007EC9C 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6ECA0 8007ECA0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 6ECA4 8007ECA4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 6ECA8 8007ECA8 0800E003 */  jr         $ra
    /* 6ECAC 8007ECAC 00000000 */   nop
endlabel PrintOBJ_STAND__FP12ObjectStructiiP7TextDati
