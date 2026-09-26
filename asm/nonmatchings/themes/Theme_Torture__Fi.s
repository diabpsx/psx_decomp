.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_Torture__Fi, 0x158

glabel Theme_Torture__Fi
    /* 23EC8 8015DAC0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 23ECC 8015DAC4 3000B4AF */  sw         $s4, 0x30($sp)
    /* 23ED0 8015DAC8 21A08000 */  addu       $s4, $a0, $zero
    /* 23ED4 8015DACC 3400BFAF */  sw         $ra, 0x34($sp)
    /* 23ED8 8015DAD0 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 23EDC 8015DAD4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 23EE0 8015DAD8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 23EE4 8015DADC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 23EE8 8015DAE0 1280053C */  lui        $a1, %hi(D_8011C17C)
    /* 23EEC 8015DAE4 7CC1A524 */  addiu      $a1, $a1, %lo(D_8011C17C)
    /* 23EF0 8015DAE8 0300A288 */  lwl        $v0, 0x3($a1)
    /* 23EF4 8015DAEC 0000A298 */  lwr        $v0, 0x0($a1)
    /* 23EF8 8015DAF0 00000000 */  nop
    /* 23EFC 8015DAF4 1300A2AB */  swl        $v0, 0x13($sp)
    /* 23F00 8015DAF8 1000A2BB */  swr        $v0, 0x10($sp)
    /* 23F04 8015DAFC 1280053C */  lui        $a1, %hi(D_8011C180)
    /* 23F08 8015DB00 80C1A524 */  addiu      $a1, $a1, %lo(D_8011C180)
    /* 23F0C 8015DB04 0300A288 */  lwl        $v0, 0x3($a1)
    /* 23F10 8015DB08 0000A298 */  lwr        $v0, 0x0($a1)
    /* 23F14 8015DB0C 00000000 */  nop
    /* 23F18 8015DB10 1B00A2AB */  swl        $v0, 0x1B($sp)
    /* 23F1C 8015DB14 1800A2BB */  swr        $v0, 0x18($sp)
    /* 23F20 8015DB18 01001224 */  addiu      $s2, $zero, 0x1
  .L8015DB1C:
    /* 23F24 8015DB1C 01001124 */  addiu      $s1, $zero, 0x1
    /* 23F28 8015DB20 C0101200 */  sll        $v0, $s2, 3
    /* 23F2C 8015DB24 80035324 */  addiu      $s3, $v0, 0x380
  .L8015DB28:
    /* 23F30 8015DB28 C0101400 */  sll        $v0, $s4, 3
    /* 23F34 8015DB2C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 23F38 8015DB30 21083300 */  addu       $at, $at, $s3
    /* 23F3C 8015DB34 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 23F40 8015DB38 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 23F44 8015DB3C 21082200 */  addu       $at, $at, $v0
    /* 23F48 8015DB40 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 23F4C 8015DB44 00000000 */  nop
    /* 23F50 8015DB48 1B006214 */  bne        $v1, $v0, .L8015DBB8
    /* 23F54 8015DB4C 21202002 */   addu      $a0, $s1, $zero
    /* 23F58 8015DB50 380B020C */  jal        GetSOLID__Fii
    /* 23F5C 8015DB54 21284002 */   addu      $a1, $s2, $zero
    /* 23F60 8015DB58 01004238 */  xori       $v0, $v0, 0x1
    /* 23F64 8015DB5C 16004010 */  beqz       $v0, .L8015DBB8
    /* 23F68 8015DB60 21800000 */   addu      $s0, $zero, $zero
    /* 23F6C 8015DB64 21202002 */  addu       $a0, $s1, $zero
    /* 23F70 8015DB68 21284002 */  addu       $a1, $s2, $zero
    /* 23F74 8015DB6C 21308002 */  addu       $a2, $s4, $zero
    /* 23F78 8015DB70 8270050C */  jal        CheckThemeObj3__Fiiii
    /* 23F7C 8015DB74 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 23F80 8015DB78 FF004230 */  andi       $v0, $v0, 0xFF
    /* 23F84 8015DB7C 09004010 */  beqz       $v0, .L8015DBA4
    /* 23F88 8015DB80 00000000 */   nop
    /* 23F8C 8015DB84 1280023C */  lui        $v0, %hi(leveltype)
    /* 23F90 8015DB88 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23F94 8015DB8C 00000000 */  nop
    /* 23F98 8015DB90 2110A203 */  addu       $v0, $sp, $v0
    /* 23F9C 8015DB94 0F004480 */  lb         $a0, 0xF($v0)
    /* 23FA0 8015DB98 C9F6000C */  jal        ENG_random__Fl
    /* 23FA4 8015DB9C 00000000 */   nop
    /* 23FA8 8015DBA0 0100502C */  sltiu      $s0, $v0, 0x1
  .L8015DBA4:
    /* 23FAC 8015DBA4 04000012 */  beqz       $s0, .L8015DBB8
    /* 23FB0 8015DBA8 1E000424 */   addiu     $a0, $zero, 0x1E
    /* 23FB4 8015DBAC 21282002 */  addu       $a1, $s1, $zero
    /* 23FB8 8015DBB0 BE4E010C */  jal        AddObject__Fiii
    /* 23FBC 8015DBB4 21304002 */   addu      $a2, $s2, $zero
  .L8015DBB8:
    /* 23FC0 8015DBB8 01003126 */  addiu      $s1, $s1, 0x1
    /* 23FC4 8015DBBC 5F00222A */  slti       $v0, $s1, 0x5F
    /* 23FC8 8015DBC0 D9FF4014 */  bnez       $v0, .L8015DB28
    /* 23FCC 8015DBC4 80037326 */   addiu     $s3, $s3, 0x380
    /* 23FD0 8015DBC8 01005226 */  addiu      $s2, $s2, 0x1
    /* 23FD4 8015DBCC 5F00422A */  slti       $v0, $s2, 0x5F
    /* 23FD8 8015DBD0 D2FF4014 */  bnez       $v0, .L8015DB1C
    /* 23FDC 8015DBD4 00000000 */   nop
    /* 23FE0 8015DBD8 1280023C */  lui        $v0, %hi(leveltype)
    /* 23FE4 8015DBDC 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23FE8 8015DBE0 00000000 */  nop
    /* 23FEC 8015DBE4 2110A203 */  addu       $v0, $sp, $v0
    /* 23FF0 8015DBE8 17004580 */  lb         $a1, 0x17($v0)
    /* 23FF4 8015DBEC 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 23FF8 8015DBF0 21208002 */   addu      $a0, $s4, $zero
    /* 23FFC 8015DBF4 3400BF8F */  lw         $ra, 0x34($sp)
    /* 24000 8015DBF8 3000B48F */  lw         $s4, 0x30($sp)
    /* 24004 8015DBFC 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 24008 8015DC00 2800B28F */  lw         $s2, 0x28($sp)
    /* 2400C 8015DC04 2400B18F */  lw         $s1, 0x24($sp)
    /* 24010 8015DC08 2000B08F */  lw         $s0, 0x20($sp)
    /* 24014 8015DC0C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 24018 8015DC10 0800E003 */  jr         $ra
    /* 2401C 8015DC14 00000000 */   nop
endlabel Theme_Torture__Fi
