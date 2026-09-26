.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitNewP2NameMenu__Fv, 0x54

glabel FeInitNewP2NameMenu__Fv
    /* 18A0 8013B498 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 18A4 8013B49C 0D80043C */  lui        $a0, %hi(FeNameEngMenuTable)
    /* 18A8 8013B4A0 40D98424 */  addiu      $a0, $a0, %lo(FeNameEngMenuTable)
    /* 18AC 8013B4A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 18B0 8013B4A8 54E7040C */  jal        FeAddNameTable__FPUci
    /* 18B4 8013B4AC 28000524 */   addiu     $a1, $zero, 0x28
    /* 18B8 8013B4B0 0C000224 */  addiu      $v0, $zero, 0xC
    /* 18BC 8013B4B4 E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 18C0 8013B4B8 20000224 */  addiu      $v0, $zero, 0x20
    /* 18C4 8013B4BC E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 18C8 8013B4C0 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 18CC 8013B4C4 EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 18D0 8013B4C8 80000224 */  addiu      $v0, $zero, 0x80
    /* 18D4 8013B4CC F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 18D8 8013B4D0 01000224 */  addiu      $v0, $zero, 0x1
    /* 18DC 8013B4D4 0E80013C */  lui        $at, %hi(plr + 0x1B24)
    /* 18E0 8013B4D8 5CC022A0 */  sb         $v0, %lo(plr + 0x1B24)($at)
    /* 18E4 8013B4DC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 18E8 8013B4E0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 18EC 8013B4E4 0800E003 */  jr         $ra
    /* 18F0 8013B4E8 00000000 */   nop
endlabel FeInitNewP2NameMenu__Fv
