.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LightObjPrint__FP12ObjectStructiiP7TextDati, 0xC4

glabel LightObjPrint__FP12ObjectStructiiP7TextDati
    /* 6DB7C 8007DB7C B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6DB80 8007DB80 3800B0AF */  sw         $s0, 0x38($sp)
    /* 6DB84 8007DB84 21808000 */  addu       $s0, $a0, $zero
    /* 6DB88 8007DB88 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6DB8C 8007DB8C 2188A000 */  addu       $s1, $a1, $zero
    /* 6DB90 8007DB90 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6DB94 8007DB94 2190C000 */  addu       $s2, $a2, $zero
    /* 6DB98 8007DB98 4800B4AF */  sw         $s4, 0x48($sp)
    /* 6DB9C 8007DB9C 6000B48F */  lw         $s4, 0x60($sp)
    /* 6DBA0 8007DBA0 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 6DBA4 8007DBA4 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6DBA8 8007DBA8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6DBAC 8007DBAC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6DBB0 8007DBB0 7AF6010C */  jal        DefaultObjPrint__FP12ObjectStructiiP7TextDatiii
    /* 6DBB4 8007DBB4 1000B4AF */   sw        $s4, 0x10($sp)
    /* 6DBB8 8007DBB8 21984000 */  addu       $s3, $v0, $zero
    /* 6DBBC 8007DBBC 16006012 */  beqz       $s3, .L8007DC18
    /* 6DBC0 8007DBC0 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 6DBC4 8007DBC4 00000386 */  lh         $v1, 0x0($s0)
    /* 6DBC8 8007DBC8 00000000 */  nop
    /* 6DBCC 8007DBCC 12006210 */  beq        $v1, $v0, .L8007DC18
    /* 6DBD0 8007DBD0 01002426 */   addiu     $a0, $s1, 0x1
    /* 6DBD4 8007DBD4 E6FF4526 */  addiu      $a1, $s2, -0x1A
    /* 6DBD8 8007DBD8 21300000 */  addu       $a2, $zero, $zero
    /* 6DBDC 8007DBDC 21380000 */  addu       $a3, $zero, $zero
    /* 6DBE0 8007DBE0 10000224 */  addiu      $v0, $zero, 0x10
    /* 6DBE4 8007DBE4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6DBE8 8007DBE8 40000224 */  addiu      $v0, $zero, 0x40
    /* 6DBEC 8007DBEC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6DBF0 8007DBF0 01000224 */  addiu      $v0, $zero, 0x1
    /* 6DBF4 8007DBF4 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6DBF8 8007DBF8 08000224 */  addiu      $v0, $zero, 0x8
    /* 6DBFC 8007DBFC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6DC00 8007DC00 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6DC04 8007DC04 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6DC08 8007DC08 2400B4AF */  sw         $s4, 0x24($sp)
    /* 6DC0C 8007DC0C 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 6DC10 8007DC10 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 6DC14 8007DC14 3000A2AF */   sw        $v0, 0x30($sp)
  .L8007DC18:
    /* 6DC18 8007DC18 21106002 */  addu       $v0, $s3, $zero
    /* 6DC1C 8007DC1C 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 6DC20 8007DC20 4800B48F */  lw         $s4, 0x48($sp)
    /* 6DC24 8007DC24 4400B38F */  lw         $s3, 0x44($sp)
    /* 6DC28 8007DC28 4000B28F */  lw         $s2, 0x40($sp)
    /* 6DC2C 8007DC2C 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6DC30 8007DC30 3800B08F */  lw         $s0, 0x38($sp)
    /* 6DC34 8007DC34 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6DC38 8007DC38 0800E003 */  jr         $ra
    /* 6DC3C 8007DC3C 00000000 */   nop
endlabel LightObjPrint__FP12ObjectStructiiP7TextDati
