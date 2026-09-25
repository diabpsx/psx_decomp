.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_NEWLVL__FPC4TCmdi, 0x30

glabel On_NEWLVL__FPC4TCmdi
    /* 416BC 800516BC 21108000 */  addu       $v0, $a0, $zero
    /* 416C0 800516C0 2120A000 */  addu       $a0, $a1, $zero
    /* 416C4 800516C4 02004594 */  lhu        $a1, 0x2($v0)
    /* 416C8 800516C8 04004694 */  lhu        $a2, 0x4($v0)
    /* 416CC 800516CC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 416D0 800516D0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 416D4 800516D4 019B010C */  jal        StartNewLvl__Fiii
    /* 416D8 800516D8 00000000 */   nop
    /* 416DC 800516DC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 416E0 800516E0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 416E4 800516E4 0800E003 */  jr         $ra
    /* 416E8 800516E8 00000000 */   nop
endlabel On_NEWLVL__FPC4TCmdi
