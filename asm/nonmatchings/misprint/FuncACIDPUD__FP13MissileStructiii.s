.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncACIDPUD__FP13MissileStructiii, 0x68

glabel FuncACIDPUD__FP13MissileStructiii
    /* 6CCC8 8007CCC8 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6CCCC 8007CCCC 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6CCD0 8007CCD0 47008280 */  lb         $v0, 0x47($a0)
    /* 6CCD4 8007CCD4 00000000 */  nop
    /* 6CCD8 8007CCD8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6CCDC 8007CCDC 3F008380 */  lb         $v1, 0x3F($a0)
    /* 6CCE0 8007CCE0 80000224 */  addiu      $v0, $zero, 0x80
    /* 6CCE4 8007CCE4 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6CCE8 8007CCE8 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6CCEC 8007CCEC 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6CCF0 8007CCF0 01000224 */  addiu      $v0, $zero, 0x1
    /* 6CCF4 8007CCF4 2120A000 */  addu       $a0, $a1, $zero
    /* 6CCF8 8007CCF8 2128C000 */  addu       $a1, $a2, $zero
    /* 6CCFC 8007CCFC 2130E000 */  addu       $a2, $a3, $zero
    /* 6CD00 8007CD00 0F000724 */  addiu      $a3, $zero, 0xF
    /* 6CD04 8007CD04 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6CD08 8007CD08 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6CD0C 8007CD0C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6CD10 8007CD10 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6CD14 8007CD14 3400A2AF */  sw         $v0, 0x34($sp)
    /* 6CD18 8007CD18 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6CD1C 8007CD1C 1400A3AF */   sw        $v1, 0x14($sp)
    /* 6CD20 8007CD20 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6CD24 8007CD24 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6CD28 8007CD28 0800E003 */  jr         $ra
    /* 6CD2C 8007CD2C 00000000 */   nop
endlabel FuncACIDPUD__FP13MissileStructiii
