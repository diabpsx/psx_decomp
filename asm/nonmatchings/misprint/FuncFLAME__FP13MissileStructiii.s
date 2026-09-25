.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncFLAME__FP13MissileStructiii, 0x6C

glabel FuncFLAME__FP13MissileStructiii
    /* 6C6F4 8007C6F4 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6C6F8 8007C6F8 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6C6FC 8007C6FC 47008280 */  lb         $v0, 0x47($a0)
    /* 6C700 8007C700 28008884 */  lh         $t0, 0x28($a0)
    /* 6C704 8007C704 2A008984 */  lh         $t1, 0x2A($a0)
    /* 6C708 8007C708 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6C70C 8007C70C 3F008380 */  lb         $v1, 0x3F($a0)
    /* 6C710 8007C710 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C714 8007C714 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C718 8007C718 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C71C 8007C71C 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C720 8007C720 01000224 */  addiu      $v0, $zero, 0x1
    /* 6C724 8007C724 2120A800 */  addu       $a0, $a1, $t0
    /* 6C728 8007C728 2128C900 */  addu       $a1, $a2, $t1
    /* 6C72C 8007C72C 2130E000 */  addu       $a2, $a3, $zero
    /* 6C730 8007C730 07000724 */  addiu      $a3, $zero, 0x7
    /* 6C734 8007C734 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C738 8007C738 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6C73C 8007C73C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C740 8007C740 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C744 8007C744 3400A2AF */  sw         $v0, 0x34($sp)
    /* 6C748 8007C748 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C74C 8007C74C 1400A3AF */   sw        $v1, 0x14($sp)
    /* 6C750 8007C750 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6C754 8007C754 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6C758 8007C758 0800E003 */  jr         $ra
    /* 6C75C 8007C75C 00000000 */   nop
endlabel FuncFLAME__FP13MissileStructiii
