.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_ChangeOffset__FP12PlayerStruct, 0x2C

glabel PM_ChangeOffset__FP12PlayerStruct
    /* 50F38 80060F38 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 50F3C 80060F3C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 50F40 80060F40 64018294 */  lhu        $v0, 0x164($a0)
    /* 50F44 80060F44 00000000 */  nop
    /* 50F48 80060F48 01004224 */  addiu      $v0, $v0, 0x1
    /* 50F4C 80060F4C C083010C */  jal        PM_ChangeLightOff__FP12PlayerStruct
    /* 50F50 80060F50 640182A4 */   sh        $v0, 0x164($a0)
    /* 50F54 80060F54 1000BF8F */  lw         $ra, 0x10($sp)
    /* 50F58 80060F58 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 50F5C 80060F5C 0800E003 */  jr         $ra
    /* 50F60 80060F60 00000000 */   nop
endlabel PM_ChangeOffset__FP12PlayerStruct
