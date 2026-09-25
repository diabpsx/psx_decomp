.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncACIDSPLAT__FP13MissileStructiii, 0x68

glabel FuncACIDSPLAT__FP13MissileStructiii
    /* 6CC60 8007CC60 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6CC64 8007CC64 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6CC68 8007CC68 47008280 */  lb         $v0, 0x47($a0)
    /* 6CC6C 8007CC6C 00000000 */  nop
    /* 6CC70 8007CC70 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6CC74 8007CC74 3F008380 */  lb         $v1, 0x3F($a0)
    /* 6CC78 8007CC78 80000224 */  addiu      $v0, $zero, 0x80
    /* 6CC7C 8007CC7C 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6CC80 8007CC80 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6CC84 8007CC84 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6CC88 8007CC88 01000224 */  addiu      $v0, $zero, 0x1
    /* 6CC8C 8007CC8C 2120A000 */  addu       $a0, $a1, $zero
    /* 6CC90 8007CC90 2128C000 */  addu       $a1, $a2, $zero
    /* 6CC94 8007CC94 2130E000 */  addu       $a2, $a3, $zero
    /* 6CC98 8007CC98 0E000724 */  addiu      $a3, $zero, 0xE
    /* 6CC9C 8007CC9C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6CCA0 8007CCA0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6CCA4 8007CCA4 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6CCA8 8007CCA8 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6CCAC 8007CCAC 3400A2AF */  sw         $v0, 0x34($sp)
    /* 6CCB0 8007CCB0 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6CCB4 8007CCB4 1400A3AF */   sw        $v1, 0x14($sp)
    /* 6CCB8 8007CCB8 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6CCBC 8007CCBC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6CCC0 8007CCC0 0800E003 */  jr         $ra
    /* 6CCC4 8007CCC4 00000000 */   nop
endlabel FuncACIDSPLAT__FP13MissileStructiii
