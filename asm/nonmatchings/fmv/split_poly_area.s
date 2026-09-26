.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching split_poly_area, 0x3E8

glabel split_poly_area
    /* 1CDF4 801569EC 78FFBD27 */  addiu      $sp, $sp, -0x88
    /* 1CDF8 801569F0 8400BFAF */  sw         $ra, 0x84($sp)
    /* 1CDFC 801569F4 8000BEAF */  sw         $fp, 0x80($sp)
    /* 1CE00 801569F8 7C00B7AF */  sw         $s7, 0x7C($sp)
    /* 1CE04 801569FC 7800B6AF */  sw         $s6, 0x78($sp)
    /* 1CE08 80156A00 7400B5AF */  sw         $s5, 0x74($sp)
    /* 1CE0C 80156A04 7000B4AF */  sw         $s4, 0x70($sp)
    /* 1CE10 80156A08 6C00B3AF */  sw         $s3, 0x6C($sp)
    /* 1CE14 80156A0C 6800B2AF */  sw         $s2, 0x68($sp)
    /* 1CE18 80156A10 6400B1AF */  sw         $s1, 0x64($sp)
    /* 1CE1C 80156A14 6000B0AF */  sw         $s0, 0x60($sp)
    /* 1CE20 80156A18 1000A4AF */  sw         $a0, 0x10($sp)
    /* 1CE24 80156A1C 1800A5AF */  sw         $a1, 0x18($sp)
    /* 1CE28 80156A20 2000A6AF */  sw         $a2, 0x20($sp)
    /* 1CE2C 80156A24 2800A7AF */  sw         $a3, 0x28($sp)
    /* 1CE30 80156A28 0200F684 */  lh         $s6, 0x2($a3)
    /* 1CE34 80156A2C 0600E394 */  lhu        $v1, 0x6($a3)
    /* 1CE38 80156A30 2800A98F */  lw         $t1, 0x28($sp)
    /* 1CE3C 80156A34 3800A0AF */  sw         $zero, 0x38($sp)
    /* 1CE40 80156A38 F40D80AF */  sw         $zero, %gp_rel(area_ph)($gp)
    /* 1CE44 80156A3C 001C0300 */  sll        $v1, $v1, 16
    /* 1CE48 80156A40 04002295 */  lhu        $v0, 0x4($t1)
    /* 1CE4C 80156A44 034C0300 */  sra        $t1, $v1, 16
    /* 1CE50 80156A48 431C0300 */  sra        $v1, $v1, 17
    /* 1CE54 80156A4C 23180300 */  negu       $v1, $v1
    /* 1CE58 80156A50 3000A9AF */  sw         $t1, 0x30($sp)
    /* 1CE5C 80156A54 4800A3AF */  sw         $v1, 0x48($sp)
    /* 1CE60 80156A58 00140200 */  sll        $v0, $v0, 16
    /* 1CE64 80156A5C 43140200 */  sra        $v0, $v0, 17
    /* 1CE68 80156A60 23100200 */  negu       $v0, $v0
    /* 1CE6C 80156A64 CD002011 */  beqz       $t1, .L80156D9C
    /* 1CE70 80156A68 4000A2AF */   sw        $v0, 0x40($sp)
  .L80156A6C:
    /* 1CE74 80156A6C FF00C232 */  andi       $v0, $s6, 0xFF
    /* 1CE78 80156A70 00010324 */  addiu      $v1, $zero, 0x100
    /* 1CE7C 80156A74 3000A98F */  lw         $t1, 0x30($sp)
    /* 1CE80 80156A78 23A86200 */  subu       $s5, $v1, $v0
    /* 1CE84 80156A7C 2A103501 */  slt        $v0, $t1, $s5
    /* 1CE88 80156A80 02004010 */  beqz       $v0, .L80156A8C
    /* 1CE8C 80156A84 00000000 */   nop
    /* 1CE90 80156A88 3000B58F */  lw         $s5, 0x30($sp)
  .L80156A8C:
    /* 1CE94 80156A8C 9800BE8F */  lw         $fp, 0x98($sp)
    /* 1CE98 80156A90 23483501 */  subu       $t1, $t1, $s5
    /* 1CE9C 80156A94 3000A9AF */  sw         $t1, 0x30($sp)
    /* 1CEA0 80156A98 2800A98F */  lw         $t1, 0x28($sp)
    /* 1CEA4 80156A9C F00D80AF */  sw         $zero, %gp_rel(area_pw)($gp)
    /* 1CEA8 80156AA0 04003785 */  lh         $s7, 0x4($t1)
    /* 1CEAC 80156AA4 00003485 */  lh         $s4, 0x0($t1)
    /* 1CEB0 80156AA8 AF00E012 */  beqz       $s7, .L80156D68
    /* 1CEB4 80156AAC 2148D502 */   addu      $t1, $s6, $s5
    /* 1CEB8 80156AB0 5000A9AF */  sw         $t1, 0x50($sp)
    /* 1CEBC 80156AB4 4800A98F */  lw         $t1, 0x48($sp)
    /* 1CEC0 80156AB8 00000000 */  nop
    /* 1CEC4 80156ABC 21483501 */  addu       $t1, $t1, $s5
    /* 1CEC8 80156AC0 5800A9AF */  sw         $t1, 0x58($sp)
    /* 1CECC 80156AC4 1000A98F */  lw         $t1, 0x10($sp)
    /* 1CED0 80156AC8 00000000 */  nop
    /* 1CED4 80156ACC 20003025 */  addiu      $s0, $t1, 0x20
    /* 1CED8 80156AD0 1800A98F */  lw         $t1, 0x18($sp)
    /* 1CEDC 80156AD4 00000000 */  nop
    /* 1CEE0 80156AD8 22003225 */  addiu      $s2, $t1, 0x22
  .L80156ADC:
    /* 1CEE4 80156ADC 3F009132 */  andi       $s1, $s4, 0x3F
    /* 1CEE8 80156AE0 40000224 */  addiu      $v0, $zero, 0x40
    /* 1CEEC 80156AE4 23985100 */  subu       $s3, $v0, $s1
    /* 1CEF0 80156AE8 2A10F302 */  slt        $v0, $s7, $s3
    /* 1CEF4 80156AEC 02004010 */  beqz       $v0, .L80156AF8
    /* 1CEF8 80156AF0 00000000 */   nop
    /* 1CEFC 80156AF4 2198E002 */  addu       $s3, $s7, $zero
  .L80156AF8:
    /* 1CF00 80156AF8 1000A48F */  lw         $a0, 0x10($sp)
    /* 1CF04 80156AFC AC4C000C */  jal        SetPolyFT4
    /* 1CF08 80156B00 23B8F302 */   subu      $s7, $s7, $s3
    /* 1CF0C 80156B04 02000424 */  addiu      $a0, $zero, 0x2
    /* 1CF10 80156B08 80000224 */  addiu      $v0, $zero, 0x80
    /* 1CF14 80156B0C E4FF02A2 */  sb         $v0, -0x1C($s0)
    /* 1CF18 80156B10 E5FF02A2 */  sb         $v0, -0x1B($s0)
    /* 1CF1C 80156B14 E6FF02A2 */  sb         $v0, -0x1A($s0)
    /* 1CF20 80156B18 21103302 */  addu       $v0, $s1, $s3
    /* 1CF24 80156B1C ECFF11A2 */  sb         $s1, -0x14($s0)
    /* 1CF28 80156B20 EDFF16A2 */  sb         $s6, -0x13($s0)
    /* 1CF2C 80156B24 F4FF02A2 */  sb         $v0, -0xC($s0)
    /* 1CF30 80156B28 F5FF16A2 */  sb         $s6, -0xB($s0)
    /* 1CF34 80156B2C FCFF11A2 */  sb         $s1, -0x4($s0)
    /* 1CF38 80156B30 2118D303 */  addu       $v1, $fp, $s3
    /* 1CF3C 80156B34 21280000 */  addu       $a1, $zero, $zero
    /* 1CF40 80156B38 5000A993 */  lbu        $t1, 0x50($sp)
    /* 1CF44 80156B3C C0FF8632 */  andi       $a2, $s4, 0xFFC0
    /* 1CF48 80156B40 040002A2 */  sb         $v0, 0x4($s0)
    /* 1CF4C 80156B44 FDFF09A2 */  sb         $t1, -0x3($s0)
    /* 1CF50 80156B48 5000A993 */  lbu        $t1, 0x50($sp)
    /* 1CF54 80156B4C E8FF1EA6 */  sh         $fp, -0x18($s0)
    /* 1CF58 80156B50 050009A2 */  sb         $t1, 0x5($s0)
    /* 1CF5C 80156B54 9C00A997 */  lhu        $t1, 0x9C($sp)
    /* 1CF60 80156B58 F0FF03A6 */  sh         $v1, -0x10($s0)
    /* 1CF64 80156B5C EAFF09A6 */  sh         $t1, -0x16($s0)
    /* 1CF68 80156B60 9C00A997 */  lhu        $t1, 0x9C($sp)
    /* 1CF6C 80156B64 F8FF1EA6 */  sh         $fp, -0x8($s0)
    /* 1CF70 80156B68 F2FF09A6 */  sh         $t1, -0xE($s0)
    /* 1CF74 80156B6C 9C00A98F */  lw         $t1, 0x9C($sp)
    /* 1CF78 80156B70 00FFC732 */  andi       $a3, $s6, 0xFF00
    /* 1CF7C 80156B74 000003A6 */  sh         $v1, 0x0($s0)
    /* 1CF80 80156B78 21103501 */  addu       $v0, $t1, $s5
    /* 1CF84 80156B7C FAFF02A6 */  sh         $v0, -0x6($s0)
    /* 1CF88 80156B80 074C000C */  jal        GetTPage
    /* 1CF8C 80156B84 020002A6 */   sh        $v0, 0x2($s0)
    /* 1CF90 80156B88 F6FF02A6 */  sh         $v0, -0xA($s0)
    /* 1CF94 80156B8C 1800A98F */  lw         $t1, 0x18($sp)
    /* 1CF98 80156B90 00000000 */  nop
    /* 1CF9C 80156B94 2D002011 */  beqz       $t1, .L80156C4C
    /* 1CFA0 80156B98 21400002 */   addu      $t0, $s0, $zero
    /* 1CFA4 80156B9C 1800A78F */  lw         $a3, 0x18($sp)
    /* 1CFA8 80156BA0 1000A68F */  lw         $a2, 0x10($sp)
  .L80156BA4:
    /* 1CFAC 80156BA4 00000000 */  nop
    /* 1CFB0 80156BA8 0000C28C */  lw         $v0, 0x0($a2)
    /* 1CFB4 80156BAC 0400C38C */  lw         $v1, 0x4($a2)
    /* 1CFB8 80156BB0 0800C48C */  lw         $a0, 0x8($a2)
    /* 1CFBC 80156BB4 0C00C58C */  lw         $a1, 0xC($a2)
    /* 1CFC0 80156BB8 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1CFC4 80156BBC 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1CFC8 80156BC0 0800E4AC */  sw         $a0, 0x8($a3)
    /* 1CFCC 80156BC4 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 1CFD0 80156BC8 1000C624 */  addiu      $a2, $a2, 0x10
    /* 1CFD4 80156BCC F5FFC814 */  bne        $a2, $t0, .L80156BA4
    /* 1CFD8 80156BD0 1000E724 */   addiu     $a3, $a3, 0x10
    /* 1CFDC 80156BD4 0000C28C */  lw         $v0, 0x0($a2)
    /* 1CFE0 80156BD8 0400C38C */  lw         $v1, 0x4($a2)
    /* 1CFE4 80156BDC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 1CFE8 80156BE0 0400E3AC */  sw         $v1, 0x4($a3)
    /* 1CFEC 80156BE4 A000A48F */  lw         $a0, 0xA0($sp)
    /* 1CFF0 80156BE8 C9F6000C */  jal        ENG_random__Fl
    /* 1CFF4 80156BEC 00000000 */   nop
    /* 1CFF8 80156BF0 A000A48F */  lw         $a0, 0xA0($sp)
    /* 1CFFC 80156BF4 C9F6000C */  jal        ENG_random__Fl
    /* 1D000 80156BF8 E2FF42A2 */   sb        $v0, -0x1E($s2)
    /* 1D004 80156BFC A000A48F */  lw         $a0, 0xA0($sp)
    /* 1D008 80156C00 C9F6000C */  jal        ENG_random__Fl
    /* 1D00C 80156C04 E3FF42A2 */   sb        $v0, -0x1D($s2)
    /* 1D010 80156C08 E4FF42A2 */  sb         $v0, -0x1C($s2)
    /* 1D014 80156C0C 21109302 */  addu       $v0, $s4, $s3
    /* 1D018 80156C10 E6FF54A6 */  sh         $s4, -0x1A($s2)
    /* 1D01C 80156C14 E8FF56A6 */  sh         $s6, -0x18($s2)
    /* 1D020 80156C18 EEFF42A6 */  sh         $v0, -0x12($s2)
    /* 1D024 80156C1C F0FF56A6 */  sh         $s6, -0x10($s2)
    /* 1D028 80156C20 F6FF54A6 */  sh         $s4, -0xA($s2)
    /* 1D02C 80156C24 5000A997 */  lhu        $t1, 0x50($sp)
    /* 1D030 80156C28 FEFF42A6 */  sh         $v0, -0x2($s2)
    /* 1D034 80156C2C F8FF49A6 */  sh         $t1, -0x8($s2)
    /* 1D038 80156C30 5000A997 */  lhu        $t1, 0x50($sp)
    /* 1D03C 80156C34 00000000 */  nop
    /* 1D040 80156C38 000049A6 */  sh         $t1, 0x0($s2)
    /* 1D044 80156C3C 1800A98F */  lw         $t1, 0x18($sp)
    /* 1D048 80156C40 28005226 */  addiu      $s2, $s2, 0x28
    /* 1D04C 80156C44 28002925 */  addiu      $t1, $t1, 0x28
    /* 1D050 80156C48 1800A9AF */  sw         $t1, 0x18($sp)
  .L80156C4C:
    /* 1D054 80156C4C 21A09302 */  addu       $s4, $s4, $s3
    /* 1D058 80156C50 21F0D303 */  addu       $fp, $fp, $s3
    /* 1D05C 80156C54 3800A98F */  lw         $t1, 0x38($sp)
    /* 1D060 80156C58 F40D848F */  lw         $a0, %gp_rel(area_ph)($gp)
    /* 1D064 80156C5C F00D888F */  lw         $t0, %gp_rel(area_pw)($gp)
    /* 1D068 80156C60 01002925 */  addiu      $t1, $t1, 0x1
    /* 1D06C 80156C64 C0300400 */  sll        $a2, $a0, 3
    /* 1D070 80156C68 80180800 */  sll        $v1, $t0, 2
    /* 1D074 80156C6C 21186800 */  addu       $v1, $v1, $t0
    /* 1D078 80156C70 00190300 */  sll        $v1, $v1, 4
    /* 1D07C 80156C74 2128C300 */  addu       $a1, $a2, $v1
    /* 1D080 80156C78 01000825 */  addiu      $t0, $t0, 0x1
    /* 1D084 80156C7C 01008424 */  addiu      $a0, $a0, 0x1
    /* 1D088 80156C80 3800A9AF */  sw         $t1, 0x38($sp)
    /* 1D08C 80156C84 1000A98F */  lw         $t1, 0x10($sp)
    /* 1D090 80156C88 C0200400 */  sll        $a0, $a0, 3
    /* 1D094 80156C8C 28002925 */  addiu      $t1, $t1, 0x28
    /* 1D098 80156C90 1000A9AF */  sw         $t1, 0x10($sp)
    /* 1D09C 80156C94 2000A98F */  lw         $t1, 0x20($sp)
    /* 1D0A0 80156C98 21188300 */  addu       $v1, $a0, $v1
    /* 1D0A4 80156C9C F00D88AF */  sw         $t0, %gp_rel(area_pw)($gp)
    /* 1D0A8 80156CA0 40100900 */  sll        $v0, $t1, 1
    /* 1D0AC 80156CA4 21104900 */  addu       $v0, $v0, $t1
    /* 1D0B0 80156CA8 C0100200 */  sll        $v0, $v0, 3
    /* 1D0B4 80156CAC 21104900 */  addu       $v0, $v0, $t1
    /* 1D0B8 80156CB0 40110200 */  sll        $v0, $v0, 5
    /* 1D0BC 80156CB4 2128A200 */  addu       $a1, $a1, $v0
    /* 1D0C0 80156CB8 4000A997 */  lhu        $t1, 0x40($sp)
    /* 1D0C4 80156CBC 21186200 */  addu       $v1, $v1, $v0
    /* 1D0C8 80156CC0 1580013C */  lui        $at, %hi(tmdc_pol_offs)
    /* 1D0CC 80156CC4 21082500 */  addu       $at, $at, $a1
    /* 1D0D0 80156CC8 F45529A4 */  sh         $t1, %lo(tmdc_pol_offs)($at)
    /* 1D0D4 80156CCC 4800A997 */  lhu        $t1, 0x48($sp)
    /* 1D0D8 80156CD0 1580013C */  lui        $at, %hi(tmdc_pol_offs + 0x2)
    /* 1D0DC 80156CD4 21082500 */  addu       $at, $at, $a1
    /* 1D0E0 80156CD8 F65529A4 */  sh         $t1, %lo(tmdc_pol_offs + 0x2)($at)
    /* 1D0E4 80156CDC 80280800 */  sll        $a1, $t0, 2
    /* 1D0E8 80156CE0 2128A800 */  addu       $a1, $a1, $t0
    /* 1D0EC 80156CE4 00290500 */  sll        $a1, $a1, 4
    /* 1D0F0 80156CE8 2130C500 */  addu       $a2, $a2, $a1
    /* 1D0F4 80156CEC 2130C200 */  addu       $a2, $a2, $v0
    /* 1D0F8 80156CF0 21208500 */  addu       $a0, $a0, $a1
    /* 1D0FC 80156CF4 4000A98F */  lw         $t1, 0x40($sp)
    /* 1D100 80156CF8 21208200 */  addu       $a0, $a0, $v0
    /* 1D104 80156CFC 21383301 */  addu       $a3, $t1, $s3
    /* 1D108 80156D00 1580013C */  lui        $at, %hi(tmdc_pol_offs)
    /* 1D10C 80156D04 21082600 */  addu       $at, $at, $a2
    /* 1D110 80156D08 F45527A4 */  sh         $a3, %lo(tmdc_pol_offs)($at)
    /* 1D114 80156D0C 4800A997 */  lhu        $t1, 0x48($sp)
    /* 1D118 80156D10 1580013C */  lui        $at, %hi(tmdc_pol_offs + 0x2)
    /* 1D11C 80156D14 21082600 */  addu       $at, $at, $a2
    /* 1D120 80156D18 F65529A4 */  sh         $t1, %lo(tmdc_pol_offs + 0x2)($at)
    /* 1D124 80156D1C 4000A997 */  lhu        $t1, 0x40($sp)
    /* 1D128 80156D20 1580013C */  lui        $at, %hi(tmdc_pol_offs)
    /* 1D12C 80156D24 21082300 */  addu       $at, $at, $v1
    /* 1D130 80156D28 F45529A4 */  sh         $t1, %lo(tmdc_pol_offs)($at)
    /* 1D134 80156D2C 5800A997 */  lhu        $t1, 0x58($sp)
    /* 1D138 80156D30 4000A7AF */  sw         $a3, 0x40($sp)
    /* 1D13C 80156D34 1580013C */  lui        $at, %hi(tmdc_pol_offs + 0x2)
    /* 1D140 80156D38 21082300 */  addu       $at, $at, $v1
    /* 1D144 80156D3C F65529A4 */  sh         $t1, %lo(tmdc_pol_offs + 0x2)($at)
    /* 1D148 80156D40 4000A997 */  lhu        $t1, 0x40($sp)
    /* 1D14C 80156D44 1580013C */  lui        $at, %hi(tmdc_pol_offs)
    /* 1D150 80156D48 21082400 */  addu       $at, $at, $a0
    /* 1D154 80156D4C F45529A4 */  sh         $t1, %lo(tmdc_pol_offs)($at)
    /* 1D158 80156D50 5800A997 */  lhu        $t1, 0x58($sp)
    /* 1D15C 80156D54 1580013C */  lui        $at, %hi(tmdc_pol_offs + 0x2)
    /* 1D160 80156D58 21082400 */  addu       $at, $at, $a0
    /* 1D164 80156D5C F65529A4 */  sh         $t1, %lo(tmdc_pol_offs + 0x2)($at)
    /* 1D168 80156D60 5EFFE016 */  bnez       $s7, .L80156ADC
    /* 1D16C 80156D64 28001026 */   addiu     $s0, $s0, 0x28
  .L80156D68:
    /* 1D170 80156D68 4800A98F */  lw         $t1, 0x48($sp)
    /* 1D174 80156D6C 00000000 */  nop
    /* 1D178 80156D70 21483501 */  addu       $t1, $t1, $s5
    /* 1D17C 80156D74 4800A9AF */  sw         $t1, 0x48($sp)
    /* 1D180 80156D78 9C00A98F */  lw         $t1, 0x9C($sp)
    /* 1D184 80156D7C F40D828F */  lw         $v0, %gp_rel(area_ph)($gp)
    /* 1D188 80156D80 21483501 */  addu       $t1, $t1, $s5
    /* 1D18C 80156D84 9C00A9AF */  sw         $t1, 0x9C($sp)
    /* 1D190 80156D88 3000A98F */  lw         $t1, 0x30($sp)
    /* 1D194 80156D8C 01004224 */  addiu      $v0, $v0, 0x1
    /* 1D198 80156D90 F40D82AF */  sw         $v0, %gp_rel(area_ph)($gp)
    /* 1D19C 80156D94 35FF2015 */  bnez       $t1, .L80156A6C
    /* 1D1A0 80156D98 21B0D502 */   addu      $s6, $s6, $s5
  .L80156D9C:
    /* 1D1A4 80156D9C 3800A28F */  lw         $v0, 0x38($sp)
    /* 1D1A8 80156DA0 8400BF8F */  lw         $ra, 0x84($sp)
    /* 1D1AC 80156DA4 8000BE8F */  lw         $fp, 0x80($sp)
    /* 1D1B0 80156DA8 7C00B78F */  lw         $s7, 0x7C($sp)
    /* 1D1B4 80156DAC 7800B68F */  lw         $s6, 0x78($sp)
    /* 1D1B8 80156DB0 7400B58F */  lw         $s5, 0x74($sp)
    /* 1D1BC 80156DB4 7000B48F */  lw         $s4, 0x70($sp)
    /* 1D1C0 80156DB8 6C00B38F */  lw         $s3, 0x6C($sp)
    /* 1D1C4 80156DBC 6800B28F */  lw         $s2, 0x68($sp)
    /* 1D1C8 80156DC0 6400B18F */  lw         $s1, 0x64($sp)
    /* 1D1CC 80156DC4 6000B08F */  lw         $s0, 0x60($sp)
    /* 1D1D0 80156DC8 8800BD27 */  addiu      $sp, $sp, 0x88
    /* 1D1D4 80156DCC 0800E003 */  jr         $ra
    /* 1D1D8 80156DD0 00000000 */   nop
endlabel split_poly_area
