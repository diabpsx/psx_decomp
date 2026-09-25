.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintStoreItem__FPC10ItemStructic, 0x53C

glabel PrintStoreItem__FPC10ItemStructic
    /* 59ECC 80069ECC 40FFBD27 */  addiu      $sp, $sp, -0xC0
    /* 59ED0 80069ED0 A000B2AF */  sw         $s2, 0xA0($sp)
    /* 59ED4 80069ED4 21908000 */  addu       $s2, $a0, $zero
    /* 59ED8 80069ED8 69004282 */  lb         $v0, 0x69($s2)
    /* 59EDC 80069EDC AC00B5AF */  sw         $s5, 0xAC($sp)
    /* 59EE0 80069EE0 21A8A000 */  addu       $s5, $a1, $zero
    /* 59EE4 80069EE4 B000B6AF */  sw         $s6, 0xB0($sp)
    /* 59EE8 80069EE8 21B00000 */  addu       $s6, $zero, $zero
    /* 59EEC 80069EEC B400B7AF */  sw         $s7, 0xB4($sp)
    /* 59EF0 80069EF0 21B8C000 */  addu       $s7, $a2, $zero
    /* 59EF4 80069EF4 B800BFAF */  sw         $ra, 0xB8($sp)
    /* 59EF8 80069EF8 A800B4AF */  sw         $s4, 0xA8($sp)
    /* 59EFC 80069EFC A400B3AF */  sw         $s3, 0xA4($sp)
    /* 59F00 80069F00 9C00B1AF */  sw         $s1, 0x9C($sp)
    /* 59F04 80069F04 9800B0AF */  sw         $s0, 0x98($sp)
    /* 59F08 80069F08 39004010 */  beqz       $v0, .L80069FF0
    /* 59F0C 80069F0C 1800A0A3 */   sb        $zero, 0x18($sp)
    /* 59F10 80069F10 51004382 */  lb         $v1, 0x51($s2)
    /* 59F14 80069F14 02000224 */  addiu      $v0, $zero, 0x2
    /* 59F18 80069F18 14006210 */  beq        $v1, $v0, .L80069F6C
    /* 59F1C 80069F1C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 59F20 80069F20 5F004382 */  lb         $v1, 0x5F($s2)
    /* 59F24 80069F24 00000000 */  nop
    /* 59F28 80069F28 10006210 */  beq        $v1, $v0, .L80069F6C
    /* 59F2C 80069F2C 80100300 */   sll       $v0, $v1, 2
    /* 59F30 80069F30 21104300 */  addu       $v0, $v0, $v1
    /* 59F34 80069F34 C0100200 */  sll        $v0, $v0, 3
    /* 59F38 80069F38 1180013C */  lui        $at, %hi(PL_Prefix + 0x4)
    /* 59F3C 80069F3C 21082200 */  addu       $at, $at, $v0
    /* 59F40 80069F40 48272480 */  lb         $a0, %lo(PL_Prefix + 0x4)($at)
    /* 59F44 80069F44 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 59F48 80069F48 21284002 */   addu      $a1, $s2, $zero
    /* 59F4C 80069F4C 0D80053C */  lui        $a1, %hi(tempstr)
    /* 59F50 80069F50 10EAA524 */  addiu      $a1, $a1, %lo(tempstr)
    /* 59F54 80069F54 0000A280 */  lb         $v0, 0x0($a1)
    /* 59F58 80069F58 00000000 */  nop
    /* 59F5C 80069F5C 03004010 */  beqz       $v0, .L80069F6C
    /* 59F60 80069F60 00000000 */   nop
    /* 59F64 80069F64 FC40000C */  jal        strcat
    /* 59F68 80069F68 1800A427 */   addiu     $a0, $sp, 0x18
  .L80069F6C:
    /* 59F6C 80069F6C 60004382 */  lb         $v1, 0x60($s2)
    /* 59F70 80069F70 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 59F74 80069F74 1E006210 */  beq        $v1, $v0, .L80069FF0
    /* 59F78 80069F78 80100300 */   sll       $v0, $v1, 2
    /* 59F7C 80069F7C 21104300 */  addu       $v0, $v0, $v1
    /* 59F80 80069F80 C0100200 */  sll        $v0, $v0, 3
    /* 59F84 80069F84 1180013C */  lui        $at, %hi(PL_Suffix + 0x4)
    /* 59F88 80069F88 21082200 */  addu       $at, $at, $v0
    /* 59F8C 80069F8C 68342480 */  lb         $a0, %lo(PL_Suffix + 0x4)($at)
    /* 59F90 80069F90 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 59F94 80069F94 21284002 */   addu      $a1, $s2, $zero
    /* 59F98 80069F98 1800A283 */  lb         $v0, 0x18($sp)
    /* 59F9C 80069F9C 00000000 */  nop
    /* 59FA0 80069FA0 0B004010 */  beqz       $v0, .L80069FD0
    /* 59FA4 80069FA4 00000000 */   nop
    /* 59FA8 80069FA8 0D80023C */  lui        $v0, %hi(tempstr)
    /* 59FAC 80069FAC 10EA4280 */  lb         $v0, %lo(tempstr)($v0)
    /* 59FB0 80069FB0 00000000 */  nop
    /* 59FB4 80069FB4 0E004010 */  beqz       $v0, .L80069FF0
    /* 59FB8 80069FB8 00000000 */   nop
    /* 59FBC 80069FBC 1280053C */  lui        $a1, %hi(D_8011BAAC)
    /* 59FC0 80069FC0 ACBAA524 */  addiu      $a1, $a1, %lo(D_8011BAAC)
    /* 59FC4 80069FC4 FC40000C */  jal        strcat
    /* 59FC8 80069FC8 1800A427 */   addiu     $a0, $sp, 0x18
    /* 59FCC 80069FCC 0100D626 */  addiu      $s6, $s6, 0x1
  .L80069FD0:
    /* 59FD0 80069FD0 0D80053C */  lui        $a1, %hi(tempstr)
    /* 59FD4 80069FD4 10EAA524 */  addiu      $a1, $a1, %lo(tempstr)
    /* 59FD8 80069FD8 0000A280 */  lb         $v0, 0x0($a1)
    /* 59FDC 80069FDC 00000000 */  nop
    /* 59FE0 80069FE0 03004010 */  beqz       $v0, .L80069FF0
    /* 59FE4 80069FE4 00000000 */   nop
    /* 59FE8 80069FE8 FC40000C */  jal        strcat
    /* 59FEC 80069FEC 1800A427 */   addiu     $a0, $sp, 0x18
  .L80069FF0:
    /* 59FF0 80069FF0 4D004392 */  lbu        $v1, 0x4D($s2)
    /* 59FF4 80069FF4 17000224 */  addiu      $v0, $zero, 0x17
    /* 59FF8 80069FF8 1A006214 */  bne        $v1, $v0, .L8006A064
    /* 59FFC 80069FFC 00000000 */   nop
    /* 5A000 8006A000 4B005092 */  lbu        $s0, 0x4B($s2)
    /* 5A004 8006A004 00000000 */  nop
    /* 5A008 8006A008 16000012 */  beqz       $s0, .L8006A064
    /* 5A00C 8006A00C 00000000 */   nop
    /* 5A010 8006A010 4AED010C */  jal        GetStr__Fi
    /* 5A014 8006A014 B2000424 */   addiu     $a0, $zero, 0xB2
    /* 5A018 8006A018 0D80113C */  lui        $s1, %hi(tempstr)
    /* 5A01C 8006A01C 10EA3126 */  addiu      $s1, $s1, %lo(tempstr)
    /* 5A020 8006A020 21202002 */  addu       $a0, $s1, $zero
    /* 5A024 8006A024 21284000 */  addu       $a1, $v0, $zero
    /* 5A028 8006A028 49004692 */  lbu        $a2, 0x49($s2)
    /* 5A02C 8006A02C 9767000C */  jal        sprintf
    /* 5A030 8006A030 21380002 */   addu      $a3, $s0, $zero
    /* 5A034 8006A034 1800A283 */  lb         $v0, 0x18($sp)
    /* 5A038 8006A038 00000000 */  nop
    /* 5A03C 8006A03C 07004010 */  beqz       $v0, .L8006A05C
    /* 5A040 8006A040 1800A427 */   addiu     $a0, $sp, 0x18
    /* 5A044 8006A044 1280053C */  lui        $a1, %hi(D_8011BAAC)
    /* 5A048 8006A048 ACBAA524 */  addiu      $a1, $a1, %lo(D_8011BAAC)
    /* 5A04C 8006A04C FC40000C */  jal        strcat
    /* 5A050 8006A050 1800A427 */   addiu     $a0, $sp, 0x18
    /* 5A054 8006A054 0100D626 */  addiu      $s6, $s6, 0x1
    /* 5A058 8006A058 1800A427 */  addiu      $a0, $sp, 0x18
  .L8006A05C:
    /* 5A05C 8006A05C FC40000C */  jal        strcat
    /* 5A060 8006A060 21282002 */   addu      $a1, $s1, $zero
  .L8006A064:
    /* 5A064 8006A064 1800A283 */  lb         $v0, 0x18($sp)
    /* 5A068 8006A068 00000000 */  nop
    /* 5A06C 8006A06C 0C004010 */  beqz       $v0, .L8006A0A0
    /* 5A070 8006A070 0C000424 */   addiu     $a0, $zero, 0xC
    /* 5A074 8006A074 2128A002 */  addu       $a1, $s5, $zero
    /* 5A078 8006A078 21300000 */  addu       $a2, $zero, $zero
    /* 5A07C 8006A07C 1800A727 */  addiu      $a3, $sp, 0x18
    /* 5A080 8006A080 00161700 */  sll        $v0, $s7, 24
    /* 5A084 8006A084 03160200 */  sra        $v0, $v0, 24
    /* 5A088 8006A088 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5A08C 8006A08C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5A090 8006A090 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5A094 8006A094 0100A226 */  addiu      $v0, $s5, 0x1
    /* 5A098 8006A098 21A85600 */  addu       $s5, $v0, $s6
    /* 5A09C 8006A09C 21B00000 */  addu       $s6, $zero, $zero
  .L8006A0A0:
    /* 5A0A0 8006A0A0 55005082 */  lb         $s0, 0x55($s2)
    /* 5A0A4 8006A0A4 01000224 */  addiu      $v0, $zero, 0x1
    /* 5A0A8 8006A0A8 0B000216 */  bne        $s0, $v0, .L8006A0D8
    /* 5A0AC 8006A0AC 1800A0A3 */   sb        $zero, 0x18($sp)
    /* 5A0B0 8006A0B0 4AED010C */  jal        GetStr__Fi
    /* 5A0B4 8006A0B4 E1000424 */   addiu     $a0, $zero, 0xE1
    /* 5A0B8 8006A0B8 1800A427 */  addiu      $a0, $sp, 0x18
    /* 5A0BC 8006A0BC 21304000 */  addu       $a2, $v0, $zero
    /* 5A0C0 8006A0C0 3B004782 */  lb         $a3, 0x3B($s2)
    /* 5A0C4 8006A0C4 3C004282 */  lb         $v0, 0x3C($s2)
    /* 5A0C8 8006A0C8 1180053C */  lui        $a1, %hi(D_8011795C)
    /* 5A0CC 8006A0CC 5C79A524 */  addiu      $a1, $a1, %lo(D_8011795C)
    /* 5A0D0 8006A0D0 9767000C */  jal        sprintf
    /* 5A0D4 8006A0D4 1000A2AF */   sw        $v0, 0x10($sp)
  .L8006A0D8:
    /* 5A0D8 8006A0D8 02000224 */  addiu      $v0, $zero, 0x2
    /* 5A0DC 8006A0DC 08000216 */  bne        $s0, $v0, .L8006A100
    /* 5A0E0 8006A0E0 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 5A0E4 8006A0E4 4AED010C */  jal        GetStr__Fi
    /* 5A0E8 8006A0E8 2F000424 */   addiu     $a0, $zero, 0x2F
    /* 5A0EC 8006A0EC 1800A427 */  addiu      $a0, $sp, 0x18
    /* 5A0F0 8006A0F0 4A004682 */  lb         $a2, 0x4A($s2)
    /* 5A0F4 8006A0F4 9767000C */  jal        sprintf
    /* 5A0F8 8006A0F8 21284000 */   addu      $a1, $v0, $zero
    /* 5A0FC 8006A0FC FF000224 */  addiu      $v0, $zero, 0xFF
  .L8006A100:
    /* 5A100 8006A100 40005086 */  lh         $s0, 0x40($s2)
    /* 5A104 8006A104 1800A383 */  lb         $v1, 0x18($sp)
    /* 5A108 8006A108 03000212 */  beq        $s0, $v0, .L8006A118
    /* 5A10C 8006A10C 00000000 */   nop
    /* 5A110 8006A110 0C000016 */  bnez       $s0, .L8006A144
    /* 5A114 8006A114 00000000 */   nop
  .L8006A118:
    /* 5A118 8006A118 05006010 */  beqz       $v1, .L8006A130
    /* 5A11C 8006A11C 00000000 */   nop
    /* 5A120 8006A120 1280053C */  lui        $a1, %hi(D_8011BAAC)
    /* 5A124 8006A124 ACBAA524 */  addiu      $a1, $a1, %lo(D_8011BAAC)
    /* 5A128 8006A128 FC40000C */  jal        strcat
    /* 5A12C 8006A12C 1800A427 */   addiu     $a0, $sp, 0x18
  .L8006A130:
    /* 5A130 8006A130 4AED010C */  jal        GetStr__Fi
    /* 5A134 8006A134 18020424 */   addiu     $a0, $zero, 0x218
    /* 5A138 8006A138 1800A427 */  addiu      $a0, $sp, 0x18
    /* 5A13C 8006A13C 71A80108 */  j          .L8006A1C4
    /* 5A140 8006A140 21284000 */   addu      $a1, $v0, $zero
  .L8006A144:
    /* 5A144 8006A144 4AED010C */  jal        GetStr__Fi
    /* 5A148 8006A148 1F010424 */   addiu     $a0, $zero, 0x11F
    /* 5A14C 8006A14C 0D80113C */  lui        $s1, %hi(tempstr)
    /* 5A150 8006A150 10EA3126 */  addiu      $s1, $s1, %lo(tempstr)
    /* 5A154 8006A154 21202002 */  addu       $a0, $s1, $zero
    /* 5A158 8006A158 21284000 */  addu       $a1, $v0, $zero
    /* 5A15C 8006A15C 3E004686 */  lh         $a2, 0x3E($s2)
    /* 5A160 8006A160 9767000C */  jal        sprintf
    /* 5A164 8006A164 21380002 */   addu      $a3, $s0, $zero
    /* 5A168 8006A168 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 5A16C 8006A16C D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 5A170 8006A170 21200002 */  addu       $a0, $s0, $zero
    /* 5A174 8006A174 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 5A178 8006A178 21282002 */   addu      $a1, $s1, $zero
    /* 5A17C 8006A17C 21200002 */  addu       $a0, $s0, $zero
    /* 5A180 8006A180 1800A527 */  addiu      $a1, $sp, 0x18
    /* 5A184 8006A184 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 5A188 8006A188 21804000 */   addu      $s0, $v0, $zero
    /* 5A18C 8006A18C 38218387 */  lh         $v1, %gp_rel(D_8011C8B8)($gp)
    /* 5A190 8006A190 21800202 */  addu       $s0, $s0, $v0
    /* 5A194 8006A194 40180300 */  sll        $v1, $v1, 1
    /* 5A198 8006A198 BCFF6324 */  addiu      $v1, $v1, -0x44
    /* 5A19C 8006A19C 2A187000 */  slt        $v1, $v1, $s0
    /* 5A1A0 8006A1A0 05006014 */  bnez       $v1, .L8006A1B8
    /* 5A1A4 8006A1A4 00000000 */   nop
    /* 5A1A8 8006A1A8 1280053C */  lui        $a1, %hi(D_8011BAB0)
    /* 5A1AC 8006A1AC B0BAA524 */  addiu      $a1, $a1, %lo(D_8011BAB0)
    /* 5A1B0 8006A1B0 FC40000C */  jal        strcat
    /* 5A1B4 8006A1B4 1800A427 */   addiu     $a0, $sp, 0x18
  .L8006A1B8:
    /* 5A1B8 8006A1B8 04002012 */  beqz       $s1, .L8006A1CC
    /* 5A1BC 8006A1BC 1800A427 */   addiu     $a0, $sp, 0x18
    /* 5A1C0 8006A1C0 21282002 */  addu       $a1, $s1, $zero
  .L8006A1C4:
    /* 5A1C4 8006A1C4 FC40000C */  jal        strcat
    /* 5A1C8 8006A1C8 00000000 */   nop
  .L8006A1CC:
    /* 5A1CC 8006A1CC 2C004286 */  lh         $v0, 0x2C($s2)
    /* 5A1D0 8006A1D0 00000000 */  nop
    /* 5A1D4 8006A1D4 02004014 */  bnez       $v0, .L8006A1E0
    /* 5A1D8 8006A1D8 00000000 */   nop
    /* 5A1DC 8006A1DC 1800A0A3 */  sb         $zero, 0x18($sp)
  .L8006A1E0:
    /* 5A1E0 8006A1E0 4D004392 */  lbu        $v1, 0x4D($s2)
    /* 5A1E4 8006A1E4 00000000 */  nop
    /* 5A1E8 8006A1E8 EBFF6224 */  addiu      $v0, $v1, -0x15
    /* 5A1EC 8006A1EC 0200422C */  sltiu      $v0, $v0, 0x2
    /* 5A1F0 8006A1F0 20004014 */  bnez       $v0, .L8006A274
    /* 5A1F4 8006A1F4 FEFF6224 */   addiu     $v0, $v1, -0x2
    /* 5A1F8 8006A1F8 0200422C */  sltiu      $v0, $v0, 0x2
    /* 5A1FC 8006A1FC 1D004014 */  bnez       $v0, .L8006A274
    /* 5A200 8006A200 FCFF6224 */   addiu     $v0, $v1, -0x4
    /* 5A204 8006A204 0200422C */  sltiu      $v0, $v0, 0x2
    /* 5A208 8006A208 1A004014 */  bnez       $v0, .L8006A274
    /* 5A20C 8006A20C FAFF6224 */   addiu     $v0, $v1, -0x6
    /* 5A210 8006A210 0200422C */  sltiu      $v0, $v0, 0x2
    /* 5A214 8006A214 17004014 */  bnez       $v0, .L8006A274
    /* 5A218 8006A218 F6FF6224 */   addiu     $v0, $v1, -0xA
    /* 5A21C 8006A21C 0200422C */  sltiu      $v0, $v0, 0x2
    /* 5A220 8006A220 14004014 */  bnez       $v0, .L8006A274
    /* 5A224 8006A224 F4FF6224 */   addiu     $v0, $v1, -0xC
    /* 5A228 8006A228 0200422C */  sltiu      $v0, $v0, 0x2
    /* 5A22C 8006A22C 11004014 */  bnez       $v0, .L8006A274
    /* 5A230 8006A230 F2FF6224 */   addiu     $v0, $v1, -0xE
    /* 5A234 8006A234 0200422C */  sltiu      $v0, $v0, 0x2
    /* 5A238 8006A238 0E004014 */  bnez       $v0, .L8006A274
    /* 5A23C 8006A23C F0FF6224 */   addiu     $v0, $v1, -0x10
    /* 5A240 8006A240 0200422C */  sltiu      $v0, $v0, 0x2
    /* 5A244 8006A244 0B004014 */  bnez       $v0, .L8006A274
    /* 5A248 8006A248 EEFF6224 */   addiu     $v0, $v1, -0x12
    /* 5A24C 8006A24C 0200422C */  sltiu      $v0, $v0, 0x2
    /* 5A250 8006A250 08004014 */  bnez       $v0, .L8006A274
    /* 5A254 8006A254 FF006330 */   andi      $v1, $v1, 0xFF
    /* 5A258 8006A258 18000224 */  addiu      $v0, $zero, 0x18
    /* 5A25C 8006A25C 05006210 */  beq        $v1, $v0, .L8006A274
    /* 5A260 8006A260 00000000 */   nop
    /* 5A264 8006A264 1280053C */  lui        $a1, %hi(D_8011BAAC)
    /* 5A268 8006A268 ACBAA524 */  addiu      $a1, $a1, %lo(D_8011BAAC)
    /* 5A26C 8006A26C FC40000C */  jal        strcat
    /* 5A270 8006A270 1800A427 */   addiu     $a0, $sp, 0x18
  .L8006A274:
    /* 5A274 8006A274 61005192 */  lbu        $s1, 0x61($s2)
    /* 5A278 8006A278 64005392 */  lbu        $s3, 0x64($s2)
    /* 5A27C 8006A27C 62005492 */  lbu        $s4, 0x62($s2)
    /* 5A280 8006A280 21103302 */  addu       $v0, $s1, $s3
    /* 5A284 8006A284 21105400 */  addu       $v0, $v0, $s4
    /* 5A288 8006A288 06004014 */  bnez       $v0, .L8006A2A4
    /* 5A28C 8006A28C 00000000 */   nop
    /* 5A290 8006A290 4AED010C */  jal        GetStr__Fi
    /* 5A294 8006A294 D1020424 */   addiu     $a0, $zero, 0x2D1
    /* 5A298 8006A298 1800A427 */  addiu      $a0, $sp, 0x18
    /* 5A29C 8006A29C CDA80108 */  j          .L8006A334
    /* 5A2A0 8006A2A0 21284000 */   addu      $a1, $v0, $zero
  .L8006A2A4:
    /* 5A2A4 8006A2A4 4AED010C */  jal        GetStr__Fi
    /* 5A2A8 8006A2A8 5D030424 */   addiu     $a0, $zero, 0x35D
    /* 5A2AC 8006A2AC 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5A2B0 8006A2B0 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5A2B4 8006A2B4 21200002 */  addu       $a0, $s0, $zero
    /* 5A2B8 8006A2B8 F240000C */  jal        strcpy
    /* 5A2BC 8006A2BC 21284000 */   addu      $a1, $v0, $zero
    /* 5A2C0 8006A2C0 08002012 */  beqz       $s1, .L8006A2E4
    /* 5A2C4 8006A2C4 00000000 */   nop
    /* 5A2C8 8006A2C8 4AED010C */  jal        GetStr__Fi
    /* 5A2CC 8006A2CC 1C050424 */   addiu     $a0, $zero, 0x51C
    /* 5A2D0 8006A2D0 21200002 */  addu       $a0, $s0, $zero
    /* 5A2D4 8006A2D4 21284000 */  addu       $a1, $v0, $zero
    /* 5A2D8 8006A2D8 21300002 */  addu       $a2, $s0, $zero
    /* 5A2DC 8006A2DC 9767000C */  jal        sprintf
    /* 5A2E0 8006A2E0 21382002 */   addu      $a3, $s1, $zero
  .L8006A2E4:
    /* 5A2E4 8006A2E4 08006012 */  beqz       $s3, .L8006A308
    /* 5A2E8 8006A2E8 00000000 */   nop
    /* 5A2EC 8006A2EC 4AED010C */  jal        GetStr__Fi
    /* 5A2F0 8006A2F0 1B050424 */   addiu     $a0, $zero, 0x51B
    /* 5A2F4 8006A2F4 21200002 */  addu       $a0, $s0, $zero
    /* 5A2F8 8006A2F8 21284000 */  addu       $a1, $v0, $zero
    /* 5A2FC 8006A2FC 21300002 */  addu       $a2, $s0, $zero
    /* 5A300 8006A300 9767000C */  jal        sprintf
    /* 5A304 8006A304 21386002 */   addu      $a3, $s3, $zero
  .L8006A308:
    /* 5A308 8006A308 09008012 */  beqz       $s4, .L8006A330
    /* 5A30C 8006A30C 1800A427 */   addiu     $a0, $sp, 0x18
    /* 5A310 8006A310 4AED010C */  jal        GetStr__Fi
    /* 5A314 8006A314 1A050424 */   addiu     $a0, $zero, 0x51A
    /* 5A318 8006A318 21200002 */  addu       $a0, $s0, $zero
    /* 5A31C 8006A31C 21284000 */  addu       $a1, $v0, $zero
    /* 5A320 8006A320 21300002 */  addu       $a2, $s0, $zero
    /* 5A324 8006A324 9767000C */  jal        sprintf
    /* 5A328 8006A328 21388002 */   addu      $a3, $s4, $zero
    /* 5A32C 8006A32C 1800A427 */  addiu      $a0, $sp, 0x18
  .L8006A330:
    /* 5A330 8006A330 21280002 */  addu       $a1, $s0, $zero
  .L8006A334:
    /* 5A334 8006A334 FC40000C */  jal        strcat
    /* 5A338 8006A338 00000000 */   nop
    /* 5A33C 8006A33C 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5A340 8006A340 2128A002 */  addu       $a1, $s5, $zero
    /* 5A344 8006A344 21300000 */  addu       $a2, $zero, $zero
    /* 5A348 8006A348 1800A727 */  addiu      $a3, $sp, 0x18
    /* 5A34C 8006A34C 00161700 */  sll        $v0, $s7, 24
    /* 5A350 8006A350 03860200 */  sra        $s0, $v0, 24
    /* 5A354 8006A354 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5A358 8006A358 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5A35C 8006A35C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5A360 8006A360 0200A226 */  addiu      $v0, $s5, 0x2
    /* 5A364 8006A364 21A85600 */  addu       $s5, $v0, $s6
    /* 5A368 8006A368 51004382 */  lb         $v1, 0x51($s2)
    /* 5A36C 8006A36C 02000224 */  addiu      $v0, $zero, 0x2
    /* 5A370 8006A370 19006214 */  bne        $v1, $v0, .L8006A3D8
    /* 5A374 8006A374 00000000 */   nop
    /* 5A378 8006A378 69004282 */  lb         $v0, 0x69($s2)
    /* 5A37C 8006A37C 00000000 */  nop
    /* 5A380 8006A380 15004010 */  beqz       $v0, .L8006A3D8
    /* 5A384 8006A384 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 5A388 8006A388 40004486 */  lh         $a0, 0x40($s2)
    /* 5A38C 8006A38C 00000000 */  nop
    /* 5A390 8006A390 03008210 */  beq        $a0, $v0, .L8006A3A0
    /* 5A394 8006A394 00000000 */   nop
    /* 5A398 8006A398 06008014 */  bnez       $a0, .L8006A3B4
    /* 5A39C 8006A39C 00000000 */   nop
  .L8006A3A0:
    /* 5A3A0 8006A3A0 4AED010C */  jal        GetStr__Fi
    /* 5A3A4 8006A3A4 A3040424 */   addiu     $a0, $zero, 0x4A3
    /* 5A3A8 8006A3A8 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5A3AC 8006A3AC F1A80108 */  j          .L8006A3C4
    /* 5A3B0 8006A3B0 0100A526 */   addiu     $a1, $s5, 0x1
  .L8006A3B4:
    /* 5A3B4 8006A3B4 4AED010C */  jal        GetStr__Fi
    /* 5A3B8 8006A3B8 A3040424 */   addiu     $a0, $zero, 0x4A3
    /* 5A3BC 8006A3BC 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5A3C0 8006A3C0 2128A002 */  addu       $a1, $s5, $zero
  .L8006A3C4:
    /* 5A3C4 8006A3C4 21300000 */  addu       $a2, $zero, $zero
    /* 5A3C8 8006A3C8 21384000 */  addu       $a3, $v0, $zero
    /* 5A3CC 8006A3CC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5A3D0 8006A3D0 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5A3D4 8006A3D4 1400A0AF */   sw        $zero, 0x14($sp)
  .L8006A3D8:
    /* 5A3D8 8006A3D8 B800BF8F */  lw         $ra, 0xB8($sp)
    /* 5A3DC 8006A3DC B400B78F */  lw         $s7, 0xB4($sp)
    /* 5A3E0 8006A3E0 B000B68F */  lw         $s6, 0xB0($sp)
    /* 5A3E4 8006A3E4 AC00B58F */  lw         $s5, 0xAC($sp)
    /* 5A3E8 8006A3E8 A800B48F */  lw         $s4, 0xA8($sp)
    /* 5A3EC 8006A3EC A400B38F */  lw         $s3, 0xA4($sp)
    /* 5A3F0 8006A3F0 A000B28F */  lw         $s2, 0xA0($sp)
    /* 5A3F4 8006A3F4 9C00B18F */  lw         $s1, 0x9C($sp)
    /* 5A3F8 8006A3F8 9800B08F */  lw         $s0, 0x98($sp)
    /* 5A3FC 8006A3FC C000BD27 */  addiu      $sp, $sp, 0xC0
    /* 5A400 8006A400 0800E003 */  jr         $ra
    /* 5A404 8006A404 00000000 */   nop
endlabel PrintStoreItem__FPC10ItemStructic
