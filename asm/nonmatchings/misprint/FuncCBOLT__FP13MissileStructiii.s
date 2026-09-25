.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncCBOLT__FP13MissileStructiii, 0x6C

glabel FuncCBOLT__FP13MissileStructiii
    /* 6D038 8007D038 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6D03C 8007D03C 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6D040 8007D040 47008280 */  lb         $v0, 0x47($a0)
    /* 6D044 8007D044 28008884 */  lh         $t0, 0x28($a0)
    /* 6D048 8007D048 2A008984 */  lh         $t1, 0x2A($a0)
    /* 6D04C 8007D04C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6D050 8007D050 3F008380 */  lb         $v1, 0x3F($a0)
    /* 6D054 8007D054 12000224 */  addiu      $v0, $zero, 0x12
    /* 6D058 8007D058 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6D05C 8007D05C 80000224 */  addiu      $v0, $zero, 0x80
    /* 6D060 8007D060 2120A800 */  addu       $a0, $a1, $t0
    /* 6D064 8007D064 2128C900 */  addu       $a1, $a2, $t1
    /* 6D068 8007D068 2130E000 */  addu       $a2, $a3, $zero
    /* 6D06C 8007D06C 08000724 */  addiu      $a3, $zero, 0x8
    /* 6D070 8007D070 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6D074 8007D074 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6D078 8007D078 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6D07C 8007D07C 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6D080 8007D080 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6D084 8007D084 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6D088 8007D088 3400A0AF */  sw         $zero, 0x34($sp)
    /* 6D08C 8007D08C 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6D090 8007D090 1400A3AF */   sw        $v1, 0x14($sp)
    /* 6D094 8007D094 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6D098 8007D098 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6D09C 8007D09C 0800E003 */  jr         $ra
    /* 6D0A0 8007D0A0 00000000 */   nop
endlabel FuncCBOLT__FP13MissileStructiii
