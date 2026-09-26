.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShowCharacterFiles__FiiG4RECTi, 0x1E0

glabel ShowCharacterFiles__FiiG4RECTi
    /* 20D14 8015A90C 68FFBD27 */  addiu      $sp, $sp, -0x98
    /* 20D18 8015A910 8400B5AF */  sw         $s5, 0x84($sp)
    /* 20D1C 8015A914 21A8A000 */  addu       $s5, $a1, $zero
    /* 20D20 8015A918 E00C858F */  lw         $a1, %gp_rel(current_card)($gp)
    /* 20D24 8015A91C 03000324 */  addiu      $v1, $zero, 0x3
    /* 20D28 8015A920 9400BFAF */  sw         $ra, 0x94($sp)
    /* 20D2C 8015A924 9000BEAF */  sw         $fp, 0x90($sp)
    /* 20D30 8015A928 8C00B7AF */  sw         $s7, 0x8C($sp)
    /* 20D34 8015A92C 8800B6AF */  sw         $s6, 0x88($sp)
    /* 20D38 8015A930 8000B4AF */  sw         $s4, 0x80($sp)
    /* 20D3C 8015A934 7C00B3AF */  sw         $s3, 0x7C($sp)
    /* 20D40 8015A938 7800B2AF */  sw         $s2, 0x78($sp)
    /* 20D44 8015A93C 7400B1AF */  sw         $s1, 0x74($sp)
    /* 20D48 8015A940 7000B0AF */  sw         $s0, 0x70($sp)
    /* 20D4C 8015A944 6800A4AF */  sw         $a0, 0x68($sp)
    /* 20D50 8015A948 A000A6AF */  sw         $a2, 0xA0($sp)
    /* 20D54 8015A94C A400A7AF */  sw         $a3, 0xA4($sp)
    /* 20D58 8015A950 80100500 */  sll        $v0, $a1, 2
    /* 20D5C 8015A954 1280013C */  lui        $at, %hi(card_status)
    /* 20D60 8015A958 21082200 */  addu       $at, $at, $v0
    /* 20D64 8015A95C DCB3228C */  lw         $v0, %lo(card_status)($at)
    /* 20D68 8015A960 A800B08F */  lw         $s0, 0xA8($sp)
    /* 20D6C 8015A964 54004310 */  beq        $v0, $v1, .L8015AAB8
    /* 20D70 8015A968 00000000 */   nop
    /* 20D74 8015A96C 0200A014 */  bnez       $a1, .L8015A978
    /* 20D78 8015A970 89020424 */   addiu     $a0, $zero, 0x289
    /* 20D7C 8015A974 88020424 */  addiu      $a0, $zero, 0x288
  .L8015A978:
    /* 20D80 8015A978 4AED010C */  jal        GetStr__Fi
    /* 20D84 8015A97C 21980000 */   addu      $s3, $zero, $zero
    /* 20D88 8015A980 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 20D8C 8015A984 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 20D90 8015A988 21280000 */  addu       $a1, $zero, $zero
    /* 20D94 8015A98C 23301502 */  subu       $a2, $s0, $s5
    /* 20D98 8015A990 21384000 */  addu       $a3, $v0, $zero
    /* 20D9C 8015A994 1280033C */  lui        $v1, %hi(GOLDR)
    /* 20DA0 8015A998 DAAB6390 */  lbu        $v1, %lo(GOLDR)($v1)
    /* 20DA4 8015A99C 1280083C */  lui        $t0, %hi(GOLDG)
    /* 20DA8 8015A9A0 DBAB0891 */  lbu        $t0, %lo(GOLDG)($t0)
    /* 20DAC 8015A9A4 1280093C */  lui        $t1, %hi(GOLDB)
    /* 20DB0 8015A9A8 DCAB2991 */  lbu        $t1, %lo(GOLDB)($t1)
    /* 20DB4 8015A9AC 01000224 */  addiu      $v0, $zero, 0x1
    /* 20DB8 8015A9B0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 20DBC 8015A9B4 1400A0AF */  sw         $zero, 0x14($sp)
    /* 20DC0 8015A9B8 1800A3AF */  sw         $v1, 0x18($sp)
    /* 20DC4 8015A9BC 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 20DC8 8015A9C0 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 20DCC 8015A9C4 2000A9AF */   sw        $t1, 0x20($sp)
    /* 20DD0 8015A9C8 21A00002 */  addu       $s4, $s0, $zero
    /* 20DD4 8015A9CC 1280023C */  lui        $v0, %hi(WHITER)
    /* 20DD8 8015A9D0 D1AB4290 */  lbu        $v0, %lo(WHITER)($v0)
    /* 20DDC 8015A9D4 1280033C */  lui        $v1, %hi(WHITEB)
    /* 20DE0 8015A9D8 D3AB6390 */  lbu        $v1, %lo(WHITEB)($v1)
    /* 20DE4 8015A9DC 42F00200 */  srl        $fp, $v0, 1
    /* 20DE8 8015A9E0 1280023C */  lui        $v0, %hi(WHITEG)
    /* 20DEC 8015A9E4 D2AB4290 */  lbu        $v0, %lo(WHITEG)($v0)
    /* 20DF0 8015A9E8 42B00300 */  srl        $s6, $v1, 1
    /* 20DF4 8015A9EC 42B80200 */  srl        $s7, $v0, 1
  .L8015A9F0:
    /* 20DF8 8015A9F0 0600622A */  slti       $v0, $s3, 0x6
    /* 20DFC 8015A9F4 30004010 */  beqz       $v0, .L8015AAB8
    /* 20E00 8015A9F8 00000000 */   nop
    /* 20E04 8015A9FC E00C848F */  lw         $a0, %gp_rel(current_card)($gp)
    /* 20E08 8015AA00 980C858F */  lw         $a1, %gp_rel(DiabloCharacterFile)($gp)
    /* 20E0C 8015AA04 6465050C */  jal        GetFileNumber__FiPc
    /* 20E10 8015AA08 00000000 */   nop
    /* 20E14 8015AA0C 6800AA8F */  lw         $t2, 0x68($sp)
    /* 20E18 8015AA10 00000000 */  nop
    /* 20E1C 8015AA14 09006A16 */  bne        $s3, $t2, .L8015AA3C
    /* 20E20 8015AA18 21184000 */   addu      $v1, $v0, $zero
    /* 20E24 8015AA1C 1280123C */  lui        $s2, %hi(GOLDR)
    /* 20E28 8015AA20 DAAB5292 */  lbu        $s2, %lo(GOLDR)($s2)
    /* 20E2C 8015AA24 1280113C */  lui        $s1, %hi(GOLDG)
    /* 20E30 8015AA28 DBAB3192 */  lbu        $s1, %lo(GOLDG)($s1)
    /* 20E34 8015AA2C 1280103C */  lui        $s0, %hi(GOLDB)
    /* 20E38 8015AA30 DCAB1092 */  lbu        $s0, %lo(GOLDB)($s0)
    /* 20E3C 8015AA34 9D6A0508 */  j          .L8015AA74
    /* 20E40 8015AA38 2800A427 */   addiu     $a0, $sp, 0x28
  .L8015AA3C:
    /* 20E44 8015AA3C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 20E48 8015AA40 09006210 */  beq        $v1, $v0, .L8015AA68
    /* 20E4C 8015AA44 FF00D233 */   andi      $s2, $fp, 0xFF
    /* 20E50 8015AA48 1280123C */  lui        $s2, %hi(WHITER)
    /* 20E54 8015AA4C D1AB5292 */  lbu        $s2, %lo(WHITER)($s2)
    /* 20E58 8015AA50 1280113C */  lui        $s1, %hi(WHITEG)
    /* 20E5C 8015AA54 D2AB3192 */  lbu        $s1, %lo(WHITEG)($s1)
    /* 20E60 8015AA58 1280103C */  lui        $s0, %hi(WHITEB)
    /* 20E64 8015AA5C D3AB1092 */  lbu        $s0, %lo(WHITEB)($s0)
    /* 20E68 8015AA60 9D6A0508 */  j          .L8015AA74
    /* 20E6C 8015AA64 2800A427 */   addiu     $a0, $sp, 0x28
  .L8015AA68:
    /* 20E70 8015AA68 FF00F132 */  andi       $s1, $s7, 0xFF
    /* 20E74 8015AA6C FF00D032 */  andi       $s0, $s6, 0xFF
    /* 20E78 8015AA70 2800A427 */  addiu      $a0, $sp, 0x28
  .L8015AA74:
    /* 20E7C 8015AA74 A16C050C */  jal        ConstructSlotName__FPci
    /* 20E80 8015AA78 21286002 */   addu      $a1, $s3, $zero
    /* 20E84 8015AA7C 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 20E88 8015AA80 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 20E8C 8015AA84 21280000 */  addu       $a1, $zero, $zero
    /* 20E90 8015AA88 21308002 */  addu       $a2, $s4, $zero
    /* 20E94 8015AA8C 2800A727 */  addiu      $a3, $sp, 0x28
    /* 20E98 8015AA90 01000224 */  addiu      $v0, $zero, 0x1
    /* 20E9C 8015AA94 1000A2AF */  sw         $v0, 0x10($sp)
    /* 20EA0 8015AA98 1400A0AF */  sw         $zero, 0x14($sp)
    /* 20EA4 8015AA9C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 20EA8 8015AAA0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 20EAC 8015AAA4 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 20EB0 8015AAA8 2000B0AF */   sw        $s0, 0x20($sp)
    /* 20EB4 8015AAAC 21A09502 */  addu       $s4, $s4, $s5
    /* 20EB8 8015AAB0 7C6A0508 */  j          .L8015A9F0
    /* 20EBC 8015AAB4 01007326 */   addiu     $s3, $s3, 0x1
  .L8015AAB8:
    /* 20EC0 8015AAB8 9400BF8F */  lw         $ra, 0x94($sp)
    /* 20EC4 8015AABC 9000BE8F */  lw         $fp, 0x90($sp)
    /* 20EC8 8015AAC0 8C00B78F */  lw         $s7, 0x8C($sp)
    /* 20ECC 8015AAC4 8800B68F */  lw         $s6, 0x88($sp)
    /* 20ED0 8015AAC8 8400B58F */  lw         $s5, 0x84($sp)
    /* 20ED4 8015AACC 8000B48F */  lw         $s4, 0x80($sp)
    /* 20ED8 8015AAD0 7C00B38F */  lw         $s3, 0x7C($sp)
    /* 20EDC 8015AAD4 7800B28F */  lw         $s2, 0x78($sp)
    /* 20EE0 8015AAD8 7400B18F */  lw         $s1, 0x74($sp)
    /* 20EE4 8015AADC 7000B08F */  lw         $s0, 0x70($sp)
    /* 20EE8 8015AAE0 9800BD27 */  addiu      $sp, $sp, 0x98
    /* 20EEC 8015AAE4 0800E003 */  jr         $ra
    /* 20EF0 8015AAE8 00000000 */   nop
endlabel ShowCharacterFiles__FiiG4RECTi
