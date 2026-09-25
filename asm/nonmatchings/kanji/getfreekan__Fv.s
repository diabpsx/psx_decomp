.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getfreekan__Fv, 0xB8

glabel getfreekan__Fv
    /* 9DB68 800ADB68 4C0B828F */  lw         $v0, %gp_rel(D_8011B2CC)($gp)
    /* 9DB6C 800ADB6C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9DB70 800ADB70 1800B0AF */  sw         $s0, 0x18($sp)
    /* 9DB74 800ADB74 480B908F */  lw         $s0, %gp_rel(D_8011B2C8)($gp)
    /* 9DB78 800ADB78 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 9DB7C 800ADB7C FF001124 */  addiu      $s1, $zero, 0xFF
    /* 9DB80 800ADB80 2000B2AF */  sw         $s2, 0x20($sp)
    /* 9DB84 800ADB84 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 9DB88 800ADB88 06004014 */  bnez       $v0, .L800ADBA4
    /* 9DB8C 800ADB8C 2400BFAF */   sw        $ra, 0x24($sp)
    /* 9DB90 800ADB90 21200000 */  addu       $a0, $zero, $zero
    /* 9DB94 800ADB94 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9DB98 800ADB98 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9DB9C 800ADB9C A583000C */  jal        DBG_Error
    /* 9DBA0 800ADBA0 00020624 */   addiu     $a2, $zero, 0x200
  .L800ADBA4:
    /* 9DBA4 800ADBA4 06000016 */  bnez       $s0, .L800ADBC0
    /* 9DBA8 800ADBA8 00000000 */   nop
    /* 9DBAC 800ADBAC 21200000 */  addu       $a0, $zero, $zero
    /* 9DBB0 800ADBB0 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9DBB4 800ADBB4 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9DBB8 800ADBB8 A583000C */  jal        DBG_Error
    /* 9DBBC 800ADBBC 01020624 */   addiu     $a2, $zero, 0x201
  .L800ADBC0:
    /* 9DBC0 800ADBC0 4C0B828F */  lw         $v0, %gp_rel(D_8011B2CC)($gp)
    /* 9DBC4 800ADBC4 00000000 */  nop
    /* 9DBC8 800ADBC8 0D004018 */  blez       $v0, .L800ADC00
    /* 9DBCC 800ADBCC 21200000 */   addu      $a0, $zero, $zero
    /* 9DBD0 800ADBD0 21284000 */  addu       $a1, $v0, $zero
  .L800ADBD4:
    /* 9DBD4 800ADBD4 02000392 */  lbu        $v1, 0x2($s0)
    /* 9DBD8 800ADBD8 00000000 */  nop
    /* 9DBDC 800ADBDC 2B107100 */  sltu       $v0, $v1, $s1
    /* 9DBE0 800ADBE0 03004010 */  beqz       $v0, .L800ADBF0
    /* 9DBE4 800ADBE4 00000000 */   nop
    /* 9DBE8 800ADBE8 21886000 */  addu       $s1, $v1, $zero
    /* 9DBEC 800ADBEC 21908000 */  addu       $s2, $a0, $zero
  .L800ADBF0:
    /* 9DBF0 800ADBF0 01008424 */  addiu      $a0, $a0, 0x1
    /* 9DBF4 800ADBF4 2A108500 */  slt        $v0, $a0, $a1
    /* 9DBF8 800ADBF8 F6FF4014 */  bnez       $v0, .L800ADBD4
    /* 9DBFC 800ADBFC 04001026 */   addiu     $s0, $s0, 0x4
  .L800ADC00:
    /* 9DC00 800ADC00 21104002 */  addu       $v0, $s2, $zero
    /* 9DC04 800ADC04 2400BF8F */  lw         $ra, 0x24($sp)
    /* 9DC08 800ADC08 2000B28F */  lw         $s2, 0x20($sp)
    /* 9DC0C 800ADC0C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 9DC10 800ADC10 1800B08F */  lw         $s0, 0x18($sp)
    /* 9DC14 800ADC14 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9DC18 800ADC18 0800E003 */  jr         $ra
    /* 9DC1C 800ADC1C 00000000 */   nop
endlabel getfreekan__Fv
