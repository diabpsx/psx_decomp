.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DisplayHelp__Fv, 0x380

glabel DisplayHelp__Fv
    /* 9E950 800AE950 1280093C */  lui        $t1, %hi(GOLDG)
    /* 9E954 800AE954 DBAB2981 */  lb         $t1, %lo(GOLDG)($t1)
    /* 9E958 800AE958 1280023C */  lui        $v0, %hi(GOLDR)
    /* 9E95C 800AE95C DAAB4290 */  lbu        $v0, %lo(GOLDR)($v0)
    /* 9E960 800AE960 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 9E964 800AE964 7400B7AF */  sw         $s7, 0x74($sp)
    /* 9E968 800AE968 0D80173C */  lui        $s7, %hi(D_800CD524)
    /* 9E96C 800AE96C 24D5F726 */  addiu      $s7, $s7, %lo(D_800CD524)
    /* 9E970 800AE970 7000B6AF */  sw         $s6, 0x70($sp)
    /* 9E974 800AE974 10001624 */  addiu      $s6, $zero, 0x10
    /* 9E978 800AE978 7C00BFAF */  sw         $ra, 0x7C($sp)
    /* 9E97C 800AE97C 7800BEAF */  sw         $fp, 0x78($sp)
    /* 9E980 800AE980 6C00B5AF */  sw         $s5, 0x6C($sp)
    /* 9E984 800AE984 6800B4AF */  sw         $s4, 0x68($sp)
    /* 9E988 800AE988 6400B3AF */  sw         $s3, 0x64($sp)
    /* 9E98C 800AE98C 6000B2AF */  sw         $s2, 0x60($sp)
    /* 9E990 800AE990 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 9E994 800AE994 5800B0AF */  sw         $s0, 0x58($sp)
    /* 9E998 800AE998 3800A0AF */  sw         $zero, 0x38($sp)
    /* 9E99C 800AE99C 4800A9AF */  sw         $t1, 0x48($sp)
    /* 9E9A0 800AE9A0 1280093C */  lui        $t1, %hi(GOLDB)
    /* 9E9A4 800AE9A4 DCAB2981 */  lb         $t1, %lo(GOLDB)($t1)
    /* 9E9A8 800AE9A8 00160200 */  sll        $v0, $v0, 24
    /* 9E9AC 800AE9AC 5000A9AF */  sw         $t1, 0x50($sp)
    /* 9E9B0 800AE9B0 4000A2AF */  sw         $v0, 0x40($sp)
  .L800AE9B4:
    /* 9E9B4 800AE9B4 3800A98F */  lw         $t1, 0x38($sp)
    /* 9E9B8 800AE9B8 00000000 */  nop
    /* 9E9BC 800AE9BC 19002229 */  slti       $v0, $t1, 0x19
    /* 9E9C0 800AE9C0 B6004010 */  beqz       $v0, .L800AEC9C
    /* 9E9C4 800AE9C4 00000000 */   nop
    /* 9E9C8 800AE9C8 0400E48E */  lw         $a0, 0x4($s7)
    /* 9E9CC 800AE9CC 4AED010C */  jal        GetStr__Fi
    /* 9E9D0 800AE9D0 00000000 */   nop
    /* 9E9D4 800AE9D4 C41F8393 */  lbu        $v1, %gp_rel(D_8011C744)($gp)
    /* 9E9D8 800AE9D8 3800A98F */  lw         $t1, 0x38($sp)
    /* 9E9DC 800AE9DC 00000000 */  nop
    /* 9E9E0 800AE9E0 2A182301 */  slt        $v1, $t1, $v1
    /* 9E9E4 800AE9E4 7D006014 */  bnez       $v1, .L800AEBDC
    /* 9E9E8 800AE9E8 21804000 */   addu      $s0, $v0, $zero
    /* 9E9EC 800AE9EC 780B828F */  lw         $v0, %gp_rel(displayinghelp)($gp)
    /* 9E9F0 800AE9F0 00000000 */  nop
    /* 9E9F4 800AE9F4 7D004014 */  bnez       $v0, .L800AEBEC
    /* 9E9F8 800AE9F8 00000000 */   nop
    /* 9E9FC 800AE9FC C51F8283 */  lb         $v0, %gp_rel(D_8011C745)($gp)
    /* 9EA00 800AEA00 00000000 */  nop
    /* 9EA04 800AEA04 4B002215 */  bne        $t1, $v0, .L800AEB34
    /* 9EA08 800AEA08 04000224 */   addiu     $v0, $zero, 0x4
    /* 9EA0C 800AEA0C 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9EA10 800AEA10 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9EA14 800AEA14 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 9EA18 800AEA18 21280002 */   addu      $a1, $s0, $zero
    /* 9EA1C 800AEA1C 780B828F */  lw         $v0, %gp_rel(displayinghelp)($gp)
    /* 9EA20 800AEA20 00000000 */  nop
    /* 9EA24 800AEA24 02004010 */  beqz       $v0, .L800AEA30
    /* 9EA28 800AEA28 00000000 */   nop
    /* 9EA2C 800AEA2C 0200D626 */  addiu      $s6, $s6, 0x2
  .L800AEA30:
    /* 9EA30 800AEA30 4000A98F */  lw         $t1, 0x40($sp)
    /* 9EA34 800AEA34 21200000 */  addu       $a0, $zero, $zero
    /* 9EA38 800AEA38 033E0900 */  sra        $a3, $t1, 24
    /* 9EA3C 800AEA3C 4800A98F */  lw         $t1, 0x48($sp)
    /* 9EA40 800AEA40 2128C002 */  addu       $a1, $s6, $zero
    /* 9EA44 800AEA44 1000A9AF */  sw         $t1, 0x10($sp)
    /* 9EA48 800AEA48 5000A98F */  lw         $t1, 0x50($sp)
    /* 9EA4C 800AEA4C 21300002 */  addu       $a2, $s0, $zero
    /* 9EA50 800AEA50 1800B7AF */  sw         $s7, 0x18($sp)
    /* 9EA54 800AEA54 CFB9020C */  jal        DrawHelpLine__FiiPccccP10HelpStruct
    /* 9EA58 800AEA58 1400A9AF */   sw        $t1, 0x14($sp)
    /* 9EA5C 800AEA5C 780B838F */  lw         $v1, %gp_rel(displayinghelp)($gp)
    /* 9EA60 800AEA60 00000000 */  nop
    /* 9EA64 800AEA64 31006014 */  bnez       $v1, .L800AEB2C
    /* 9EA68 800AEA68 21F04000 */   addu      $fp, $v0, $zero
    /* 9EA6C 800AEA6C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 9EA70 800AEA70 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 9EA74 800AEA74 00000000 */  nop
    /* 9EA78 800AEA78 09004010 */  beqz       $v0, .L800AEAA0
    /* 9EA7C 800AEA7C 14000424 */   addiu     $a0, $zero, 0x14
    /* 9EA80 800AEA80 3200D026 */  addiu      $s0, $s6, 0x32
    /* 9EA84 800AEA84 6EF2040C */  jal        func_8013C9B8
    /* 9EA88 800AEA88 21280002 */   addu      $a1, $s0, $zero
    /* 9EA8C 800AEA8C 2400C427 */  addiu      $a0, $fp, 0x24
    /* 9EA90 800AEA90 6EF2040C */  jal        func_8013C9B8
    /* 9EA94 800AEA94 21280002 */   addu      $a1, $s0, $zero
    /* 9EA98 800AEA98 1FBB0208 */  j          .L800AEC7C
    /* 9EA9C 800AEA9C 1000D626 */   addiu     $s6, $s6, 0x10
  .L800AEAA0:
    /* 9EAA0 800AEAA0 3200D526 */  addiu      $s5, $s6, 0x32
    /* 9EAA4 800AEAA4 2128A002 */  addu       $a1, $s5, $zero
    /* 9EAA8 800AEAA8 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 9EAAC 800AEAAC 40000724 */  addiu      $a3, $zero, 0x40
    /* 9EAB0 800AEAB0 F0001424 */  addiu      $s4, $zero, 0xF0
    /* 9EAB4 800AEAB4 20001324 */  addiu      $s3, $zero, 0x20
    /* 9EAB8 800AEAB8 40001224 */  addiu      $s2, $zero, 0x40
    /* 9EABC 800AEABC 01000924 */  addiu      $t1, $zero, 0x1
    /* 9EAC0 800AEAC0 18011124 */  addiu      $s1, $zero, 0x118
    /* 9EAC4 800AEAC4 2000A9AF */  sw         $t1, 0x20($sp)
    /* 9EAC8 800AEAC8 08001024 */  addiu      $s0, $zero, 0x8
    /* 9EACC 800AEACC 1000B4AF */  sw         $s4, 0x10($sp)
    /* 9EAD0 800AEAD0 1400B3AF */  sw         $s3, 0x14($sp)
    /* 9EAD4 800AEAD4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9EAD8 800AEAD8 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 9EADC 800AEADC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 9EAE0 800AEAE0 2800A9AF */  sw         $t1, 0x28($sp)
    /* 9EAE4 800AEAE4 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 9EAE8 800AEAE8 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 9EAEC 800AEAEC 3000B0AF */   sw        $s0, 0x30($sp)
    /* 9EAF0 800AEAF0 2400C427 */  addiu      $a0, $fp, 0x24
    /* 9EAF4 800AEAF4 2128A002 */  addu       $a1, $s5, $zero
    /* 9EAF8 800AEAF8 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 9EAFC 800AEAFC 40000724 */  addiu      $a3, $zero, 0x40
    /* 9EB00 800AEB00 01000924 */  addiu      $t1, $zero, 0x1
    /* 9EB04 800AEB04 2000A9AF */  sw         $t1, 0x20($sp)
    /* 9EB08 800AEB08 1000B4AF */  sw         $s4, 0x10($sp)
    /* 9EB0C 800AEB0C 1400B3AF */  sw         $s3, 0x14($sp)
    /* 9EB10 800AEB10 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9EB14 800AEB14 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 9EB18 800AEB18 2400B1AF */  sw         $s1, 0x24($sp)
    /* 9EB1C 800AEB1C 2800A9AF */  sw         $t1, 0x28($sp)
    /* 9EB20 800AEB20 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 9EB24 800AEB24 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 9EB28 800AEB28 3000B0AF */   sw        $s0, 0x30($sp)
  .L800AEB2C:
    /* 9EB2C 800AEB2C 1FBB0208 */  j          .L800AEC7C
    /* 9EB30 800AEB30 1000D626 */   addiu     $s6, $s6, 0x10
  .L800AEB34:
    /* 9EB34 800AEB34 0000E382 */  lb         $v1, 0x0($s7)
    /* 9EB38 800AEB38 00000000 */  nop
    /* 9EB3C 800AEB3C 16006214 */  bne        $v1, $v0, .L800AEB98
    /* 9EB40 800AEB40 21200000 */   addu      $a0, $zero, $zero
    /* 9EB44 800AEB44 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9EB48 800AEB48 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9EB4C 800AEB4C 21280000 */  addu       $a1, $zero, $zero
    /* 9EB50 800AEB50 2130C002 */  addu       $a2, $s6, $zero
    /* 9EB54 800AEB54 21380002 */  addu       $a3, $s0, $zero
    /* 9EB58 800AEB58 01000924 */  addiu      $t1, $zero, 0x1
    /* 9EB5C 800AEB5C 1280083C */  lui        $t0, %hi(WHITER)
    /* 9EB60 800AEB60 D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 9EB64 800AEB64 1280033C */  lui        $v1, %hi(WHITEG)
    /* 9EB68 800AEB68 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 9EB6C 800AEB6C 1280023C */  lui        $v0, %hi(D_8011C73C)
    /* 9EB70 800AEB70 3CC74224 */  addiu      $v0, $v0, %lo(D_8011C73C)
    /* 9EB74 800AEB74 1000A9AF */  sw         $t1, 0x10($sp)
    /* 9EB78 800AEB78 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9EB7C 800AEB7C 1800A8AF */  sw         $t0, 0x18($sp)
    /* 9EB80 800AEB80 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 9EB84 800AEB84 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9EB88 800AEB88 2000A3AF */   sw        $v1, 0x20($sp)
    /* 9EB8C 800AEB8C 00110200 */  sll        $v0, $v0, 4
    /* 9EB90 800AEB90 1FBB0208 */  j          .L800AEC7C
    /* 9EB94 800AEB94 21B0C202 */   addu      $s6, $s6, $v0
  .L800AEB98:
    /* 9EB98 800AEB98 2128C002 */  addu       $a1, $s6, $zero
    /* 9EB9C 800AEB9C 21300002 */  addu       $a2, $s0, $zero
    /* 9EBA0 800AEBA0 1280073C */  lui        $a3, %hi(WHITER)
    /* 9EBA4 800AEBA4 D1ABE790 */  lbu        $a3, %lo(WHITER)($a3)
    /* 9EBA8 800AEBA8 1280023C */  lui        $v0, %hi(WHITEG)
    /* 9EBAC 800AEBAC D2AB4280 */  lb         $v0, %lo(WHITEG)($v0)
    /* 9EBB0 800AEBB0 1280033C */  lui        $v1, %hi(WHITEB)
    /* 9EBB4 800AEBB4 D3AB6380 */  lb         $v1, %lo(WHITEB)($v1)
    /* 9EBB8 800AEBB8 1000D626 */  addiu      $s6, $s6, 0x10
    /* 9EBBC 800AEBBC 1800B7AF */  sw         $s7, 0x18($sp)
    /* 9EBC0 800AEBC0 003E0700 */  sll        $a3, $a3, 24
    /* 9EBC4 800AEBC4 033E0700 */  sra        $a3, $a3, 24
    /* 9EBC8 800AEBC8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 9EBCC 800AEBCC CFB9020C */  jal        DrawHelpLine__FiiPccccP10HelpStruct
    /* 9EBD0 800AEBD0 1400A3AF */   sw        $v1, 0x14($sp)
    /* 9EBD4 800AEBD4 20BB0208 */  j          .L800AEC80
    /* 9EBD8 800AEBD8 9B00C22A */   slti      $v0, $s6, 0x9B
  .L800AEBDC:
    /* 9EBDC 800AEBDC 780B828F */  lw         $v0, %gp_rel(displayinghelp)($gp)
    /* 9EBE0 800AEBE0 00000000 */  nop
    /* 9EBE4 800AEBE4 26004010 */  beqz       $v0, .L800AEC80
    /* 9EBE8 800AEBE8 9B00C22A */   slti      $v0, $s6, 0x9B
  .L800AEBEC:
    /* 9EBEC 800AEBEC C51F8283 */  lb         $v0, %gp_rel(D_8011C745)($gp)
    /* 9EBF0 800AEBF0 3800A98F */  lw         $t1, 0x38($sp)
    /* 9EBF4 800AEBF4 00000000 */  nop
    /* 9EBF8 800AEBF8 21002215 */  bne        $t1, $v0, .L800AEC80
    /* 9EBFC 800AEBFC 9B00C22A */   slti      $v0, $s6, 0x9B
    /* 9EC00 800AEC00 4000A98F */  lw         $t1, 0x40($sp)
    /* 9EC04 800AEC04 21200000 */  addu       $a0, $zero, $zero
    /* 9EC08 800AEC08 033E0900 */  sra        $a3, $t1, 24
    /* 9EC0C 800AEC0C 4800A98F */  lw         $t1, 0x48($sp)
    /* 9EC10 800AEC10 2128C002 */  addu       $a1, $s6, $zero
    /* 9EC14 800AEC14 1000A9AF */  sw         $t1, 0x10($sp)
    /* 9EC18 800AEC18 5000A98F */  lw         $t1, 0x50($sp)
    /* 9EC1C 800AEC1C 21300002 */  addu       $a2, $s0, $zero
    /* 9EC20 800AEC20 1800B7AF */  sw         $s7, 0x18($sp)
    /* 9EC24 800AEC24 CFB9020C */  jal        DrawHelpLine__FiiPccccP10HelpStruct
    /* 9EC28 800AEC28 1400A9AF */   sw        $t1, 0x14($sp)
    /* 9EC2C 800AEC2C 0800E48E */  lw         $a0, 0x8($s7)
    /* 9EC30 800AEC30 4AED010C */  jal        GetStr__Fi
    /* 9EC34 800AEC34 1000D626 */   addiu     $s6, $s6, 0x10
    /* 9EC38 800AEC38 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9EC3C 800AEC3C D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9EC40 800AEC40 21280000 */  addu       $a1, $zero, $zero
    /* 9EC44 800AEC44 2130C002 */  addu       $a2, $s6, $zero
    /* 9EC48 800AEC48 21384000 */  addu       $a3, $v0, $zero
    /* 9EC4C 800AEC4C 1280083C */  lui        $t0, %hi(WHITER)
    /* 9EC50 800AEC50 D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 9EC54 800AEC54 1280033C */  lui        $v1, %hi(WHITEG)
    /* 9EC58 800AEC58 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 9EC5C 800AEC5C 1280023C */  lui        $v0, %hi(D_8011C73C)
    /* 9EC60 800AEC60 3CC74224 */  addiu      $v0, $v0, %lo(D_8011C73C)
    /* 9EC64 800AEC64 1000A0AF */  sw         $zero, 0x10($sp)
    /* 9EC68 800AEC68 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9EC6C 800AEC6C 1800A8AF */  sw         $t0, 0x18($sp)
    /* 9EC70 800AEC70 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 9EC74 800AEC74 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9EC78 800AEC78 2000A3AF */   sw        $v1, 0x20($sp)
  .L800AEC7C:
    /* 9EC7C 800AEC7C 9B00C22A */  slti       $v0, $s6, 0x9B
  .L800AEC80:
    /* 9EC80 800AEC80 06004010 */  beqz       $v0, .L800AEC9C
    /* 9EC84 800AEC84 0C00F726 */   addiu     $s7, $s7, 0xC
    /* 9EC88 800AEC88 3800A98F */  lw         $t1, 0x38($sp)
    /* 9EC8C 800AEC8C 00000000 */  nop
    /* 9EC90 800AEC90 01002925 */  addiu      $t1, $t1, 0x1
    /* 9EC94 800AEC94 6DBA0208 */  j          .L800AE9B4
    /* 9EC98 800AEC98 3800A9AF */   sw        $t1, 0x38($sp)
  .L800AEC9C:
    /* 9EC9C 800AEC9C 7C00BF8F */  lw         $ra, 0x7C($sp)
    /* 9ECA0 800AECA0 7800BE8F */  lw         $fp, 0x78($sp)
    /* 9ECA4 800AECA4 7400B78F */  lw         $s7, 0x74($sp)
    /* 9ECA8 800AECA8 7000B68F */  lw         $s6, 0x70($sp)
    /* 9ECAC 800AECAC 6C00B58F */  lw         $s5, 0x6C($sp)
    /* 9ECB0 800AECB0 6800B48F */  lw         $s4, 0x68($sp)
    /* 9ECB4 800AECB4 6400B38F */  lw         $s3, 0x64($sp)
    /* 9ECB8 800AECB8 6000B28F */  lw         $s2, 0x60($sp)
    /* 9ECBC 800AECBC 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 9ECC0 800AECC0 5800B08F */  lw         $s0, 0x58($sp)
    /* 9ECC4 800AECC4 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 9ECC8 800AECC8 0800E003 */  jr         $ra
    /* 9ECCC 800AECCC 00000000 */   nop
endlabel DisplayHelp__Fv
