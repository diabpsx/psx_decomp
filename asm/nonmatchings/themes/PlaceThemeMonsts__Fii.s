.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaceThemeMonsts__Fii, 0x184

glabel PlaceThemeMonsts__Fii
    /* 231B8 8015CDB0 00FEBD27 */  addiu      $sp, $sp, -0x200
    /* 231BC 8015CDB4 F001B4AF */  sw         $s4, 0x1F0($sp)
    /* 231C0 8015CDB8 21A08000 */  addu       $s4, $a0, $zero
    /* 231C4 8015CDBC F401B5AF */  sw         $s5, 0x1F4($sp)
    /* 231C8 8015CDC0 21A8A000 */  addu       $s5, $a1, $zero
    /* 231CC 8015CDC4 21180000 */  addu       $v1, $zero, $zero
    /* 231D0 8015CDC8 1280023C */  lui        $v0, %hi(nummtypes)
    /* 231D4 8015CDCC 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 231D8 8015CDD0 21200000 */  addu       $a0, $zero, $zero
    /* 231DC 8015CDD4 F801BFAF */  sw         $ra, 0x1F8($sp)
    /* 231E0 8015CDD8 EC01B3AF */  sw         $s3, 0x1EC($sp)
    /* 231E4 8015CDDC E801B2AF */  sw         $s2, 0x1E8($sp)
    /* 231E8 8015CDE0 E401B1AF */  sw         $s1, 0x1E4($sp)
    /* 231EC 8015CDE4 12004018 */  blez       $v0, .L8015CE30
    /* 231F0 8015CDE8 E001B0AF */   sw        $s0, 0x1E0($sp)
    /* 231F4 8015CDEC 21384000 */  addu       $a3, $v0, $zero
    /* 231F8 8015CDF0 21300000 */  addu       $a2, $zero, $zero
    /* 231FC 8015CDF4 1800A527 */  addiu      $a1, $sp, 0x18
  .L8015CDF8:
    /* 23200 8015CDF8 1180013C */  lui        $at, %hi(Monsters + 0x13)
    /* 23204 8015CDFC 21082600 */  addu       $at, $at, $a2
    /* 23208 8015CE00 CFA32290 */  lbu        $v0, %lo(Monsters + 0x13)($at)
    /* 2320C 8015CE04 00000000 */  nop
    /* 23210 8015CE08 01004230 */  andi       $v0, $v0, 0x1
    /* 23214 8015CE0C 04004010 */  beqz       $v0, .L8015CE20
    /* 23218 8015CE10 00000000 */   nop
    /* 2321C 8015CE14 0000A3AC */  sw         $v1, 0x0($a1)
    /* 23220 8015CE18 0400A524 */  addiu      $a1, $a1, 0x4
    /* 23224 8015CE1C 01008424 */  addiu      $a0, $a0, 0x1
  .L8015CE20:
    /* 23228 8015CE20 01006324 */  addiu      $v1, $v1, 0x1
    /* 2322C 8015CE24 2A106700 */  slt        $v0, $v1, $a3
    /* 23230 8015CE28 F3FF4014 */  bnez       $v0, .L8015CDF8
    /* 23234 8015CE2C 1C00C624 */   addiu     $a2, $a2, 0x1C
  .L8015CE30:
    /* 23238 8015CE30 C9F6000C */  jal        ENG_random__Fl
    /* 2323C 8015CE34 21900000 */   addu      $s2, $zero, $zero
    /* 23240 8015CE38 80100200 */  sll        $v0, $v0, 2
    /* 23244 8015CE3C 2110A203 */  addu       $v0, $sp, $v0
    /* 23248 8015CE40 1800538C */  lw         $s3, 0x18($v0)
    /* 2324C 8015CE44 21880000 */  addu       $s1, $zero, $zero
  .L8015CE48:
    /* 23250 8015CE48 C0801200 */  sll        $s0, $s2, 3
  .L8015CE4C:
    /* 23254 8015CE4C C0101400 */  sll        $v0, $s4, 3
    /* 23258 8015CE50 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 2325C 8015CE54 21083000 */  addu       $at, $at, $s0
    /* 23260 8015CE58 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 23264 8015CE5C 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 23268 8015CE60 21082200 */  addu       $at, $at, $v0
    /* 2326C 8015CE64 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 23270 8015CE68 00000000 */  nop
    /* 23274 8015CE6C 1F006214 */  bne        $v1, $v0, .L8015CEEC
    /* 23278 8015CE70 21202002 */   addu      $a0, $s1, $zero
    /* 2327C 8015CE74 380B020C */  jal        GetSOLID__Fii
    /* 23280 8015CE78 21284002 */   addu      $a1, $s2, $zero
    /* 23284 8015CE7C 01004238 */  xori       $v0, $v0, 0x1
    /* 23288 8015CE80 1A004010 */  beqz       $v0, .L8015CEEC
    /* 2328C 8015CE84 00000000 */   nop
    /* 23290 8015CE88 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 23294 8015CE8C 21083000 */  addu       $at, $at, $s0
    /* 23298 8015CE90 2C7A2280 */  lb         $v0, %lo(dung_map + 0x4)($at)
    /* 2329C 8015CE94 00000000 */  nop
    /* 232A0 8015CE98 14004014 */  bnez       $v0, .L8015CEEC
    /* 232A4 8015CE9C 00000000 */   nop
    /* 232A8 8015CEA0 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 232AC 8015CEA4 21083000 */  addu       $at, $at, $s0
    /* 232B0 8015CEA8 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 232B4 8015CEAC 00000000 */  nop
    /* 232B8 8015CEB0 0E004014 */  bnez       $v0, .L8015CEEC
    /* 232BC 8015CEB4 00000000 */   nop
    /* 232C0 8015CEB8 C9F6000C */  jal        ENG_random__Fl
    /* 232C4 8015CEBC 2120A002 */   addu      $a0, $s5, $zero
    /* 232C8 8015CEC0 0A004014 */  bnez       $v0, .L8015CEEC
    /* 232CC 8015CEC4 00000000 */   nop
    /* 232D0 8015CEC8 C9F6000C */  jal        ENG_random__Fl
    /* 232D4 8015CECC 08000424 */   addiu     $a0, $zero, 0x8
    /* 232D8 8015CED0 01000324 */  addiu      $v1, $zero, 0x1
    /* 232DC 8015CED4 1000A3AF */  sw         $v1, 0x10($sp)
    /* 232E0 8015CED8 21202002 */  addu       $a0, $s1, $zero
    /* 232E4 8015CEDC 21284002 */  addu       $a1, $s2, $zero
    /* 232E8 8015CEE0 21304000 */  addu       $a2, $v0, $zero
    /* 232EC 8015CEE4 74FF010C */  jal        AddMonster__FiiiiUc
    /* 232F0 8015CEE8 21386002 */   addu      $a3, $s3, $zero
  .L8015CEEC:
    /* 232F4 8015CEEC 01003126 */  addiu      $s1, $s1, 0x1
    /* 232F8 8015CEF0 6000222A */  slti       $v0, $s1, 0x60
    /* 232FC 8015CEF4 D5FF4014 */  bnez       $v0, .L8015CE4C
    /* 23300 8015CEF8 80031026 */   addiu     $s0, $s0, 0x380
    /* 23304 8015CEFC 01005226 */  addiu      $s2, $s2, 0x1
    /* 23308 8015CF00 6000422A */  slti       $v0, $s2, 0x60
    /* 2330C 8015CF04 D0FF4014 */  bnez       $v0, .L8015CE48
    /* 23310 8015CF08 21880000 */   addu      $s1, $zero, $zero
    /* 23314 8015CF0C F801BF8F */  lw         $ra, 0x1F8($sp)
    /* 23318 8015CF10 F401B58F */  lw         $s5, 0x1F4($sp)
    /* 2331C 8015CF14 F001B48F */  lw         $s4, 0x1F0($sp)
    /* 23320 8015CF18 EC01B38F */  lw         $s3, 0x1EC($sp)
    /* 23324 8015CF1C E801B28F */  lw         $s2, 0x1E8($sp)
    /* 23328 8015CF20 E401B18F */  lw         $s1, 0x1E4($sp)
    /* 2332C 8015CF24 E001B08F */  lw         $s0, 0x1E0($sp)
    /* 23330 8015CF28 0002BD27 */  addiu      $sp, $sp, 0x200
    /* 23334 8015CF2C 0800E003 */  jr         $ra
    /* 23338 8015CF30 00000000 */   nop
endlabel PlaceThemeMonsts__Fii
