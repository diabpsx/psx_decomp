.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M2MStartHit__Fiii, 0x2BC

glabel M2MStartHit__Fiii
    /* 11CF0 8014B8E8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 11CF4 8014B8EC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 11CF8 8014B8F0 21888000 */  addu       $s1, $a0, $zero
    /* 11CFC 8014B8F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 11D00 8014B8F8 2180A000 */  addu       $s0, $a1, $zero
    /* 11D04 8014B8FC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 11D08 8014B900 2198C000 */  addu       $s3, $a2, $zero
    /* 11D0C 8014B904 2000BFAF */  sw         $ra, 0x20($sp)
    /* 11D10 8014B908 0F000006 */  bltz       $s0, .L8014B948
    /* 11D14 8014B90C 1800B2AF */   sw        $s2, 0x18($sp)
    /* 11D18 8014B910 40101000 */  sll        $v0, $s0, 1
    /* 11D1C 8014B914 21105000 */  addu       $v0, $v0, $s0
    /* 11D20 8014B918 80100200 */  sll        $v0, $v0, 2
    /* 11D24 8014B91C 21105000 */  addu       $v0, $v0, $s0
    /* 11D28 8014B920 C0100200 */  sll        $v0, $v0, 3
    /* 11D2C 8014B924 01000324 */  addiu      $v1, $zero, 0x1
    /* 11D30 8014B928 1080013C */  lui        $at, %hi(monster + 0x46)
    /* 11D34 8014B92C 21082200 */  addu       $at, $at, $v0
    /* 11D38 8014B930 DA532490 */  lbu        $a0, %lo(monster + 0x46)($at)
    /* 11D3C 8014B934 04180302 */  sllv       $v1, $v1, $s0
    /* 11D40 8014B938 25208300 */  or         $a0, $a0, $v1
    /* 11D44 8014B93C 1080013C */  lui        $at, %hi(monster + 0x46)
    /* 11D48 8014B940 21082200 */  addu       $at, $at, $v0
    /* 11D4C 8014B944 DA5324A0 */  sb         $a0, %lo(monster + 0x46)($at)
  .L8014B948:
    /* 11D50 8014B948 40101100 */  sll        $v0, $s1, 1
    /* 11D54 8014B94C 21105100 */  addu       $v0, $v0, $s1
    /* 11D58 8014B950 80100200 */  sll        $v0, $v0, 2
    /* 11D5C 8014B954 21105100 */  addu       $v0, $v0, $s1
    /* 11D60 8014B958 C0900200 */  sll        $s2, $v0, 3
    /* 11D64 8014B95C 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 11D68 8014B960 21083200 */  addu       $at, $at, $s2
    /* 11D6C 8014B964 A453258C */  lw         $a1, %lo(monster + 0x10)($at)
    /* 11D70 8014B968 1280063C */  lui        $a2, %hi(currlevel)
    /* 11D74 8014B96C 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 11D78 8014B970 E43A010C */  jal        delta_monster_hp__FilUc
    /* 11D7C 8014B974 21202002 */   addu      $a0, $s1, $zero
    /* 11D80 8014B978 21200000 */  addu       $a0, $zero, $zero
    /* 11D84 8014B97C 25000524 */  addiu      $a1, $zero, 0x25
    /* 11D88 8014B980 FFFF2632 */  andi       $a2, $s1, 0xFFFF
    /* 11D8C 8014B984 183E010C */  jal        NetSendCmdParam2__FUcUcUsUs
    /* 11D90 8014B988 FFFF6732 */   andi      $a3, $s3, 0xFFFF
    /* 11D94 8014B98C 21202002 */  addu       $a0, $s1, $zero
    /* 11D98 8014B990 4AF5000C */  jal        PlayEffect__Fii
    /* 11D9C 8014B994 01000524 */   addiu     $a1, $zero, 0x1
    /* 11DA0 8014B998 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 11DA4 8014B99C 21083200 */  addu       $at, $at, $s2
    /* 11DA8 8014B9A0 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 11DAC 8014B9A4 00000000 */  nop
    /* 11DB0 8014B9A8 12004290 */  lbu        $v0, 0x12($v0)
    /* 11DB4 8014B9AC 00000000 */  nop
    /* 11DB8 8014B9B0 E3FF4224 */  addiu      $v0, $v0, -0x1D
    /* 11DBC 8014B9B4 0400422C */  sltiu      $v0, $v0, 0x4
    /* 11DC0 8014B9B8 09004014 */  bnez       $v0, .L8014B9E0
    /* 11DC4 8014B9BC 83191300 */   sra       $v1, $s3, 6
    /* 11DC8 8014B9C0 1080013C */  lui        $at, %hi(monster + 0x47)
    /* 11DCC 8014B9C4 21083200 */  addu       $at, $at, $s2
    /* 11DD0 8014B9C8 DB532280 */  lb         $v0, %lo(monster + 0x47)($at)
    /* 11DD4 8014B9CC 00000000 */  nop
    /* 11DD8 8014B9D0 03004224 */  addiu      $v0, $v0, 0x3
    /* 11DDC 8014B9D4 2A186200 */  slt        $v1, $v1, $v0
    /* 11DE0 8014B9D8 6A006014 */  bnez       $v1, .L8014BB84
    /* 11DE4 8014B9DC 00000000 */   nop
  .L8014B9E0:
    /* 11DE8 8014B9E0 0E000006 */  bltz       $s0, .L8014BA1C
    /* 11DEC 8014B9E4 40101000 */   sll       $v0, $s0, 1
    /* 11DF0 8014B9E8 21105000 */  addu       $v0, $v0, $s0
    /* 11DF4 8014B9EC 80100200 */  sll        $v0, $v0, 2
    /* 11DF8 8014B9F0 21105000 */  addu       $v0, $v0, $s0
    /* 11DFC 8014B9F4 C0100200 */  sll        $v0, $v0, 3
    /* 11E00 8014B9F8 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 11E04 8014B9FC 21082200 */  addu       $at, $at, $v0
    /* 11E08 8014BA00 D0532290 */  lbu        $v0, %lo(monster + 0x3C)($at)
    /* 11E0C 8014BA04 00000000 */  nop
    /* 11E10 8014BA08 04004224 */  addiu      $v0, $v0, 0x4
    /* 11E14 8014BA0C 07004230 */  andi       $v0, $v0, 0x7
    /* 11E18 8014BA10 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 11E1C 8014BA14 21083200 */  addu       $at, $at, $s2
    /* 11E20 8014BA18 D05322A0 */  sb         $v0, %lo(monster + 0x3C)($at)
  .L8014BA1C:
    /* 11E24 8014BA1C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 11E28 8014BA20 21083200 */  addu       $at, $at, $s2
    /* 11E2C 8014BA24 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 11E30 8014BA28 00000000 */  nop
    /* 11E34 8014BA2C 12004490 */  lbu        $a0, 0x12($v0)
    /* 11E38 8014BA30 27000224 */  addiu      $v0, $zero, 0x27
    /* 11E3C 8014BA34 FF008330 */  andi       $v1, $a0, 0xFF
    /* 11E40 8014BA38 05006214 */  bne        $v1, $v0, .L8014BA50
    /* 11E44 8014BA3C F0FF8224 */   addiu     $v0, $a0, -0x10
    /* 11E48 8014BA40 283A050C */  jal        M_Teleport__Fi
    /* 11E4C 8014BA44 21202002 */   addu      $a0, $s1, $zero
    /* 11E50 8014BA48 9A2E0508 */  j          .L8014BA68
    /* 11E54 8014BA4C 00000000 */   nop
  .L8014BA50:
    /* 11E58 8014BA50 0400422C */  sltiu      $v0, $v0, 0x4
    /* 11E5C 8014BA54 04004010 */  beqz       $v0, .L8014BA68
    /* 11E60 8014BA58 01000224 */   addiu     $v0, $zero, 0x1
    /* 11E64 8014BA5C 1080013C */  lui        $at, %hi(monster + 0x49)
    /* 11E68 8014BA60 21083200 */  addu       $at, $at, $s2
    /* 11E6C 8014BA64 DD5322A0 */  sb         $v0, %lo(monster + 0x49)($at)
  .L8014BA68:
    /* 11E70 8014BA68 1080033C */  lui        $v1, %hi(monster)
    /* 11E74 8014BA6C 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 11E78 8014BA70 40101100 */  sll        $v0, $s1, 1
    /* 11E7C 8014BA74 21105100 */  addu       $v0, $v0, $s1
    /* 11E80 8014BA78 80100200 */  sll        $v0, $v0, 2
    /* 11E84 8014BA7C 21105100 */  addu       $v0, $v0, $s1
    /* 11E88 8014BA80 C0800200 */  sll        $s0, $v0, 3
    /* 11E8C 8014BA84 21180302 */  addu       $v1, $s0, $v1
    /* 11E90 8014BA88 0F000424 */  addiu      $a0, $zero, 0xF
    /* 11E94 8014BA8C 38007280 */  lb         $s2, 0x38($v1)
    /* 11E98 8014BA90 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 11E9C 8014BA94 21083000 */  addu       $at, $at, $s0
    /* 11EA0 8014BA98 C7532280 */  lb         $v0, %lo(monster + 0x33)($at)
    /* 11EA4 8014BA9C 39007380 */  lb         $s3, 0x39($v1)
    /* 11EA8 8014BAA0 38004410 */  beq        $v0, $a0, .L8014BB84
    /* 11EAC 8014BAA4 6D000224 */   addiu     $v0, $zero, 0x6D
    /* 11EB0 8014BAA8 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 11EB4 8014BAAC 21083000 */  addu       $at, $at, $s0
    /* 11EB8 8014BAB0 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 11EBC 8014BAB4 00000000 */  nop
    /* 11EC0 8014BAB8 1200A390 */  lbu        $v1, 0x12($a1)
    /* 11EC4 8014BABC 00000000 */  nop
    /* 11EC8 8014BAC0 0B006210 */  beq        $v1, $v0, .L8014BAF0
    /* 11ECC 8014BAC4 21202002 */   addu      $a0, $s1, $zero
    /* 11ED0 8014BAC8 0A00A524 */  addiu      $a1, $a1, 0xA
    /* 11ED4 8014BACC 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 11ED8 8014BAD0 21083000 */  addu       $at, $at, $s0
    /* 11EDC 8014BAD4 D0532680 */  lb         $a2, %lo(monster + 0x3C)($at)
    /* 11EE0 8014BAD8 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 11EE4 8014BADC 03000724 */   addiu     $a3, $zero, 0x3
    /* 11EE8 8014BAE0 05000224 */  addiu      $v0, $zero, 0x5
    /* 11EEC 8014BAE4 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 11EF0 8014BAE8 21083000 */  addu       $at, $at, $s0
    /* 11EF4 8014BAEC C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
  .L8014BAF0:
    /* 11EF8 8014BAF0 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 11EFC 8014BAF4 21083000 */  addu       $at, $at, $s0
    /* 11F00 8014BAF8 CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 11F04 8014BAFC 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 11F08 8014BB00 21083000 */  addu       $at, $at, $s0
    /* 11F0C 8014BB04 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 11F10 8014BB08 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 11F14 8014BB0C 21083000 */  addu       $at, $at, $s0
    /* 11F18 8014BB10 C85332A0 */  sb         $s2, %lo(monster + 0x34)($at)
    /* 11F1C 8014BB14 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 11F20 8014BB18 21083000 */  addu       $at, $at, $s0
    /* 11F24 8014BB1C C95333A0 */  sb         $s3, %lo(monster + 0x35)($at)
    /* 11F28 8014BB20 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 11F2C 8014BB24 21083000 */  addu       $at, $at, $s0
    /* 11F30 8014BB28 CA5332A0 */  sb         $s2, %lo(monster + 0x36)($at)
    /* 11F34 8014BB2C 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 11F38 8014BB30 21083000 */  addu       $at, $at, $s0
    /* 11F3C 8014BB34 CB5333A0 */  sb         $s3, %lo(monster + 0x37)($at)
    /* 11F40 8014BB38 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 11F44 8014BB3C 21083000 */  addu       $at, $at, $s0
    /* 11F48 8014BB40 CC5332A0 */  sb         $s2, %lo(monster + 0x38)($at)
    /* 11F4C 8014BB44 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 11F50 8014BB48 21083000 */  addu       $at, $at, $s0
    /* 11F54 8014BB4C CD5333A0 */  sb         $s3, %lo(monster + 0x39)($at)
    /* 11F58 8014BB50 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 11F5C 8014BB54 21202002 */   addu      $a0, $s1, $zero
    /* 11F60 8014BB58 D7FC010C */  jal        M_ClearSquares__Fi
    /* 11F64 8014BB5C 21202002 */   addu      $a0, $s1, $zero
    /* 11F68 8014BB60 C0101300 */  sll        $v0, $s3, 3
    /* 11F6C 8014BB64 C0181200 */  sll        $v1, $s2, 3
    /* 11F70 8014BB68 23187200 */  subu       $v1, $v1, $s2
    /* 11F74 8014BB6C C0190300 */  sll        $v1, $v1, 7
    /* 11F78 8014BB70 21104300 */  addu       $v0, $v0, $v1
    /* 11F7C 8014BB74 01002326 */  addiu      $v1, $s1, 0x1
    /* 11F80 8014BB78 0E80013C */  lui        $at, %hi(dung_map)
    /* 11F84 8014BB7C 21082200 */  addu       $at, $at, $v0
    /* 11F88 8014BB80 287A23A4 */  sh         $v1, %lo(dung_map)($at)
  .L8014BB84:
    /* 11F8C 8014BB84 2000BF8F */  lw         $ra, 0x20($sp)
    /* 11F90 8014BB88 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 11F94 8014BB8C 1800B28F */  lw         $s2, 0x18($sp)
    /* 11F98 8014BB90 1400B18F */  lw         $s1, 0x14($sp)
    /* 11F9C 8014BB94 1000B08F */  lw         $s0, 0x10($sp)
    /* 11FA0 8014BB98 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 11FA4 8014BB9C 0800E003 */  jr         $ra
    /* 11FA8 8014BBA0 00000000 */   nop
endlabel M2MStartHit__Fiii
