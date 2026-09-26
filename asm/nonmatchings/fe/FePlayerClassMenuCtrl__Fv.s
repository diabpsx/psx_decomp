.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FePlayerClassMenuCtrl__Fv, 0x48

glabel FePlayerClassMenuCtrl__Fv
    /* 1374 8013AF6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1378 8013AF70 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 137C 8013AF74 F80B838F */  lw         $v1, %gp_rel(FePlayerNo)($gp)
    /* 1380 8013AF78 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1384 8013AF7C 0400428C */  lw         $v0, 0x4($v0)
    /* 1388 8013AF80 80180300 */  sll        $v1, $v1, 2
    /* 138C 8013AF84 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1390 8013AF88 1280013C */  lui        $at, %hi(FeChrClass)
    /* 1394 8013AF8C 21082300 */  addu       $at, $at, $v1
    /* 1398 8013AF90 8CB322AC */  sw         $v0, %lo(FeChrClass)($at)
    /* 139C 8013AF94 28EA040C */  jal        FeMainKeyCtrl__FP7CScreen
    /* 13A0 8013AF98 21200000 */   addu      $a0, $zero, $zero
    /* 13A4 8013AF9C EDEB040C */  jal        FeDrawChrClass__Fv
    /* 13A8 8013AFA0 00000000 */   nop
    /* 13AC 8013AFA4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13B0 8013AFA8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13B4 8013AFAC 0800E003 */  jr         $ra
    /* 13B8 8013AFB0 00000000 */   nop
endlabel FePlayerClassMenuCtrl__Fv
