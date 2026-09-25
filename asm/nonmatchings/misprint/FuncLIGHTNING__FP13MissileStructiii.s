.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncLIGHTNING__FP13MissileStructiii, 0x68

glabel FuncLIGHTNING__FP13MissileStructiii
    /* 6C438 8007C438 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6C43C 8007C43C 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6C440 8007C440 47008280 */  lb         $v0, 0x47($a0)
    /* 6C444 8007C444 28008884 */  lh         $t0, 0x28($a0)
    /* 6C448 8007C448 2A008984 */  lh         $t1, 0x2A($a0)
    /* 6C44C 8007C44C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6C450 8007C450 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C454 8007C454 3F008380 */  lb         $v1, 0x3F($a0)
    /* 6C458 8007C458 2120A800 */  addu       $a0, $a1, $t0
    /* 6C45C 8007C45C 2128C900 */  addu       $a1, $a2, $t1
    /* 6C460 8007C460 2130E000 */  addu       $a2, $a3, $zero
    /* 6C464 8007C464 08000724 */  addiu      $a3, $zero, 0x8
    /* 6C468 8007C468 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C46C 8007C46C 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6C470 8007C470 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C474 8007C474 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C478 8007C478 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C47C 8007C47C 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C480 8007C480 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C484 8007C484 3400A0AF */  sw         $zero, 0x34($sp)
    /* 6C488 8007C488 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C48C 8007C48C 1400A3AF */   sw        $v1, 0x14($sp)
    /* 6C490 8007C490 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6C494 8007C494 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6C498 8007C498 0800E003 */  jr         $ra
    /* 6C49C 8007C49C 00000000 */   nop
endlabel FuncLIGHTNING__FP13MissileStructiii
