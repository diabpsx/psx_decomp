.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_ChangeLightOff__FP12PlayerStruct, 0x38

glabel PM_ChangeLightOff__FP12PlayerStruct
    /* 50F00 80060F00 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 50F04 80060F04 1000BFAF */  sw         $ra, 0x10($sp)
    /* 50F08 80060F08 2800858C */  lw         $a1, 0x28($a0)
    /* 50F0C 80060F0C 2C00868C */  lw         $a2, 0x2C($a0)
    /* 50F10 80060F10 5B008480 */  lb         $a0, 0x5B($a0)
    /* 50F14 80060F14 0F00A530 */  andi       $a1, $a1, 0xF
    /* 50F18 80060F18 0F00C630 */  andi       $a2, $a2, 0xF
    /* 50F1C 80060F1C F8FFA524 */  addiu      $a1, $a1, -0x8
    /* 50F20 80060F20 EE34010C */  jal        ChangeLightOff__Fiii
    /* 50F24 80060F24 F8FFC624 */   addiu     $a2, $a2, -0x8
    /* 50F28 80060F28 1000BF8F */  lw         $ra, 0x10($sp)
    /* 50F2C 80060F2C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 50F30 80060F30 0800E003 */  jr         $ra
    /* 50F34 80060F34 00000000 */   nop
endlabel PM_ChangeLightOff__FP12PlayerStruct
