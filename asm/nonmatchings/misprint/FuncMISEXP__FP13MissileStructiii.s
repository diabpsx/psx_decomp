.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncMISEXP__FP13MissileStructiii, 0x6C

glabel FuncMISEXP__FP13MissileStructiii
    /* 6D1D8 8007D1D8 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6D1DC 8007D1DC 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6D1E0 8007D1E0 28008884 */  lh         $t0, 0x28($a0)
    /* 6D1E4 8007D1E4 2A008984 */  lh         $t1, 0x2A($a0)
    /* 6D1E8 8007D1E8 47008380 */  lb         $v1, 0x47($a0)
    /* 6D1EC 8007D1EC F0000224 */  addiu      $v0, $zero, 0xF0
    /* 6D1F0 8007D1F0 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6D1F4 8007D1F4 80000224 */  addiu      $v0, $zero, 0x80
    /* 6D1F8 8007D1F8 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6D1FC 8007D1FC 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6D200 8007D200 01000224 */  addiu      $v0, $zero, 0x1
    /* 6D204 8007D204 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6D208 8007D208 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6D20C 8007D20C 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6D210 8007D210 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6D214 8007D214 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6D218 8007D218 3400A2AF */  sw         $v0, 0x34($sp)
    /* 6D21C 8007D21C 2120A800 */  addu       $a0, $a1, $t0
    /* 6D220 8007D220 2128C900 */  addu       $a1, $a2, $t1
    /* 6D224 8007D224 2130E000 */  addu       $a2, $a3, $zero
    /* 6D228 8007D228 0C000724 */  addiu      $a3, $zero, 0xC
    /* 6D22C 8007D22C 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6D230 8007D230 1000A3AF */   sw        $v1, 0x10($sp)
    /* 6D234 8007D234 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6D238 8007D238 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6D23C 8007D23C 0800E003 */  jr         $ra
    /* 6D240 8007D240 00000000 */   nop
endlabel FuncMISEXP__FP13MissileStructiii
