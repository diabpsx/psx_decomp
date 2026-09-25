.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintQuitMessage__17CTempPauseMessagei, 0x178

glabel PrintQuitMessage__17CTempPauseMessagei
    /* 78E58 80088E58 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 78E5C 80088E5C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 78E60 80088E60 21908000 */  addu       $s2, $a0, $zero
    /* 78E64 80088E64 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 78E68 80088E68 2198A000 */  addu       $s3, $a1, $zero
    /* 78E6C 80088E6C 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 78E70 80088E70 3800B6AF */  sw         $s6, 0x38($sp)
    /* 78E74 80088E74 3400B5AF */  sw         $s5, 0x34($sp)
    /* 78E78 80088E78 3000B4AF */  sw         $s4, 0x30($sp)
    /* 78E7C 80088E7C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 78E80 80088E80 3ED8000C */  jal        RedBack__Fv
    /* 78E84 80088E84 2000B0AF */   sw        $s0, 0x20($sp)
    /* 78E88 80088E88 2925020C */  jal        GetMaxOtPos__7CBlocks_800894a4
    /* 78E8C 80088E8C 00000000 */   nop
    /* 78E90 80088E90 1280113C */  lui        $s1, %hi(D_8011CBC0)
    /* 78E94 80088E94 C0CB3126 */  addiu      $s1, $s1, %lo(D_8011CBC0)
    /* 78E98 80088E98 21202002 */  addu       $a0, $s1, $zero
    /* 78E9C 80088E9C 21804000 */  addu       $s0, $v0, $zero
    /* 78EA0 80088EA0 8A34020C */  jal        SetOTpos__6Dialogi
    /* 78EA4 80088EA4 FDFF0526 */   addiu     $a1, $s0, -0x3
    /* 78EA8 80088EA8 0C80143C */  lui        $s4, %hi(MediumFont)
    /* 78EAC 80088EAC D8829426 */  addiu      $s4, $s4, %lo(MediumFont)
    /* 78EB0 80088EB0 21208002 */  addu       $a0, $s4, $zero
    /* 78EB4 80088EB4 FEFF0526 */  addiu      $a1, $s0, -0x2
    /* 78EB8 80088EB8 E82A020C */  jal        SetOTpos__5CFonti
    /* 78EBC 80088EBC 21B04000 */   addu      $s6, $v0, $zero
    /* 78EC0 80088EC0 21202002 */  addu       $a0, $s1, $zero
    /* 78EC4 80088EC4 1280053C */  lui        $a1, %hi(BORDERR)
    /* 78EC8 80088EC8 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 78ECC 80088ECC 1280063C */  lui        $a2, %hi(BORDERG)
    /* 78ED0 80088ED0 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 78ED4 80088ED4 1280073C */  lui        $a3, %hi(BORDERB)
    /* 78ED8 80088ED8 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 78EDC 80088EDC F124020C */  jal        SetRGB__6DialogUcUcUc_800893c4
    /* 78EE0 80088EE0 21A84000 */   addu      $s5, $v0, $zero
    /* 78EE4 80088EE4 21202002 */  addu       $a0, $s1, $zero
    /* 78EE8 80088EE8 F924020C */  jal        SetBack__6Dialogi_800893e4
    /* 78EEC 80088EEC 94000524 */   addiu     $a1, $zero, 0x94
    /* 78EF0 80088EF0 21202002 */  addu       $a0, $s1, $zero
    /* 78EF4 80088EF4 FB24020C */  jal        SetBorder__6Dialogi_800893ec
    /* 78EF8 80088EF8 12000524 */   addiu     $a1, $zero, 0x12
    /* 78EFC 80088EFC 21202002 */  addu       $a0, $s1, $zero
    /* 78F00 80088F00 5F000524 */  addiu      $a1, $zero, 0x5F
    /* 78F04 80088F04 60000624 */  addiu      $a2, $zero, 0x60
    /* 78F08 80088F08 82000724 */  addiu      $a3, $zero, 0x82
    /* 78F0C 80088F0C 30000224 */  addiu      $v0, $zero, 0x30
    /* 78F10 80088F10 B82F020C */  jal        Back__6Dialogiiii
    /* 78F14 80088F14 1000A2AF */   sw        $v0, 0x10($sp)
    /* 78F18 80088F18 21204002 */  addu       $a0, $s2, $zero
    /* 78F1C 80088F1C 21280000 */  addu       $a1, $zero, $zero
    /* 78F20 80088F20 43030624 */  addiu      $a2, $zero, 0x343
    /* 78F24 80088F24 21386002 */  addu       $a3, $s3, $zero
    /* 78F28 80088F28 5F000224 */  addiu      $v0, $zero, 0x5F
    /* 78F2C 80088F2C 1800A2A7 */  sh         $v0, 0x18($sp)
    /* 78F30 80088F30 60000224 */  addiu      $v0, $zero, 0x60
    /* 78F34 80088F34 1A00A2A7 */  sh         $v0, 0x1A($sp)
    /* 78F38 80088F38 82000224 */  addiu      $v0, $zero, 0x82
    /* 78F3C 80088F3C 1C00A2A7 */  sh         $v0, 0x1C($sp)
    /* 78F40 80088F40 30000224 */  addiu      $v0, $zero, 0x30
    /* 78F44 80088F44 1800B027 */  addiu      $s0, $sp, 0x18
    /* 78F48 80088F48 1E00A2A7 */  sh         $v0, 0x1E($sp)
    /* 78F4C 80088F4C 0423020C */  jal        MY_PausePrint__17CTempPauseMessageiiiP4RECT
    /* 78F50 80088F50 1000B0AF */   sw        $s0, 0x10($sp)
    /* 78F54 80088F54 21204002 */  addu       $a0, $s2, $zero
    /* 78F58 80088F58 02000524 */  addiu      $a1, $zero, 0x2
    /* 78F5C 80088F5C 43030624 */  addiu      $a2, $zero, 0x343
    /* 78F60 80088F60 21386002 */  addu       $a3, $s3, $zero
    /* 78F64 80088F64 0423020C */  jal        MY_PausePrint__17CTempPauseMessageiiiP4RECT
    /* 78F68 80088F68 1000B0AF */   sw        $s0, 0x10($sp)
    /* 78F6C 80088F6C 21204002 */  addu       $a0, $s2, $zero
    /* 78F70 80088F70 03000524 */  addiu      $a1, $zero, 0x3
    /* 78F74 80088F74 35010624 */  addiu      $a2, $zero, 0x135
    /* 78F78 80088F78 21386002 */  addu       $a3, $s3, $zero
    /* 78F7C 80088F7C 0423020C */  jal        MY_PausePrint__17CTempPauseMessageiiiP4RECT
    /* 78F80 80088F80 1000B0AF */   sw        $s0, 0x10($sp)
    /* 78F84 80088F84 349A020C */  jal        PrintSelectBack__FUs
    /* 78F88 80088F88 E6040424 */   addiu     $a0, $zero, 0x4E6
    /* 78F8C 80088F8C 21208002 */  addu       $a0, $s4, $zero
    /* 78F90 80088F90 E82A020C */  jal        SetOTpos__5CFonti
    /* 78F94 80088F94 2128A002 */   addu      $a1, $s5, $zero
    /* 78F98 80088F98 21202002 */  addu       $a0, $s1, $zero
    /* 78F9C 80088F9C 8A34020C */  jal        SetOTpos__6Dialogi
    /* 78FA0 80088FA0 2128C002 */   addu      $a1, $s6, $zero
    /* 78FA4 80088FA4 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 78FA8 80088FA8 3800B68F */  lw         $s6, 0x38($sp)
    /* 78FAC 80088FAC 3400B58F */  lw         $s5, 0x34($sp)
    /* 78FB0 80088FB0 3000B48F */  lw         $s4, 0x30($sp)
    /* 78FB4 80088FB4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 78FB8 80088FB8 2800B28F */  lw         $s2, 0x28($sp)
    /* 78FBC 80088FBC 2400B18F */  lw         $s1, 0x24($sp)
    /* 78FC0 80088FC0 2000B08F */  lw         $s0, 0x20($sp)
    /* 78FC4 80088FC4 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 78FC8 80088FC8 0800E003 */  jr         $ra
    /* 78FCC 80088FCC 00000000 */   nop
endlabel PrintQuitMessage__17CTempPauseMessagei
