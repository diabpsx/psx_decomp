.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TFit_Shrine__Fi, 0x2F0

glabel TFit_Shrine__Fi
    /* 22014 8015BC0C A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 22018 8015BC10 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 2201C 8015BC14 21880000 */  addu       $s1, $zero, $zero
    /* 22020 8015BC18 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 22024 8015BC1C 21A80000 */  addu       $s5, $zero, $zero
    /* 22028 8015BC20 C0200400 */  sll        $a0, $a0, 3
    /* 2202C 8015BC24 08000624 */  addiu      $a2, $zero, 0x8
    /* 22030 8015BC28 2000A6AF */  sw         $a2, 0x20($sp)
    /* 22034 8015BC2C 01000624 */  addiu      $a2, $zero, 0x1
    /* 22038 8015BC30 4800B4AF */  sw         $s4, 0x48($sp)
    /* 2203C 8015BC34 F8FF1424 */  addiu      $s4, $zero, -0x8
    /* 22040 8015BC38 2800A6AF */  sw         $a2, 0x28($sp)
    /* 22044 8015BC3C FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 22048 8015BC40 5800BEAF */  sw         $fp, 0x58($sp)
    /* 2204C 8015BC44 21F00000 */  addu       $fp, $zero, $zero
    /* 22050 8015BC48 4000B2AF */  sw         $s2, 0x40($sp)
    /* 22054 8015BC4C 80FC1224 */  addiu      $s2, $zero, -0x380
    /* 22058 8015BC50 5400B7AF */  sw         $s7, 0x54($sp)
    /* 2205C 8015BC54 FFFF1724 */  addiu      $s7, $zero, -0x1
    /* 22060 8015BC58 4400B3AF */  sw         $s3, 0x44($sp)
    /* 22064 8015BC5C 21980000 */  addu       $s3, $zero, $zero
    /* 22068 8015BC60 5000B6AF */  sw         $s6, 0x50($sp)
    /* 2206C 8015BC64 80031624 */  addiu      $s6, $zero, 0x380
    /* 22070 8015BC68 5C00BFAF */  sw         $ra, 0x5C($sp)
    /* 22074 8015BC6C 3800B0AF */  sw         $s0, 0x38($sp)
    /* 22078 8015BC70 1000A0AF */  sw         $zero, 0x10($sp)
    /* 2207C 8015BC74 1800A4AF */  sw         $a0, 0x18($sp)
    /* 22080 8015BC78 3000A6AF */  sw         $a2, 0x30($sp)
    /* 22084 8015BC7C 2110D303 */  addu       $v0, $fp, $s3
  .L8015BC80:
    /* 22088 8015BC80 1800A68F */  lw         $a2, 0x18($sp)
    /* 2208C 8015BC84 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22090 8015BC88 21082200 */  addu       $at, $at, $v0
    /* 22094 8015BC8C 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 22098 8015BC90 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 2209C 8015BC94 21082600 */  addu       $at, $at, $a2
    /* 220A0 8015BC98 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 220A4 8015BC9C 00000000 */  nop
    /* 220A8 8015BCA0 60006214 */  bne        $v1, $v0, .L8015BE24
    /* 220AC 8015BCA4 21800000 */   addu      $s0, $zero, $zero
    /* 220B0 8015BCA8 3000A58F */  lw         $a1, 0x30($sp)
    /* 220B4 8015BCAC 340C020C */  jal        GetTRAP__Fii
    /* 220B8 8015BCB0 21202002 */   addu      $a0, $s1, $zero
    /* 220BC 8015BCB4 08004010 */  beqz       $v0, .L8015BCD8
    /* 220C0 8015BCB8 2120E002 */   addu      $a0, $s7, $zero
    /* 220C4 8015BCBC 380B020C */  jal        GetSOLID__Fii
    /* 220C8 8015BCC0 2128A002 */   addu      $a1, $s5, $zero
    /* 220CC 8015BCC4 04004014 */  bnez       $v0, .L8015BCD8
    /* 220D0 8015BCC8 01002426 */   addiu     $a0, $s1, 0x1
    /* 220D4 8015BCCC 380B020C */  jal        GetSOLID__Fii
    /* 220D8 8015BCD0 2128A002 */   addu      $a1, $s5, $zero
    /* 220DC 8015BCD4 0100502C */  sltiu      $s0, $v0, 0x1
  .L8015BCD8:
    /* 220E0 8015BCD8 1E000012 */  beqz       $s0, .L8015BD54
    /* 220E4 8015BCDC 2110D203 */   addu      $v0, $fp, $s2
    /* 220E8 8015BCE0 1800A68F */  lw         $a2, 0x18($sp)
    /* 220EC 8015BCE4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 220F0 8015BCE8 21082200 */  addu       $at, $at, $v0
    /* 220F4 8015BCEC 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 220F8 8015BCF0 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 220FC 8015BCF4 21082600 */  addu       $at, $at, $a2
    /* 22100 8015BCF8 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 22104 8015BCFC 00000000 */  nop
    /* 22108 8015BD00 14006214 */  bne        $v1, $v0, .L8015BD54
    /* 2210C 8015BD04 2110D603 */   addu      $v0, $fp, $s6
    /* 22110 8015BD08 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 22114 8015BD0C 21082200 */  addu       $at, $at, $v0
    /* 22118 8015BD10 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 2211C 8015BD14 00000000 */  nop
    /* 22120 8015BD18 0E004314 */  bne        $v0, $v1, .L8015BD54
    /* 22124 8015BD1C 21109202 */   addu      $v0, $s4, $s2
    /* 22128 8015BD20 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 2212C 8015BD24 21082200 */  addu       $at, $at, $v0
    /* 22130 8015BD28 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 22134 8015BD2C 00000000 */  nop
    /* 22138 8015BD30 08004014 */  bnez       $v0, .L8015BD54
    /* 2213C 8015BD34 21109602 */   addu      $v0, $s4, $s6
    /* 22140 8015BD38 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 22144 8015BD3C 21082200 */  addu       $at, $at, $v0
    /* 22148 8015BD40 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 2214C 8015BD44 00000000 */  nop
    /* 22150 8015BD48 02004014 */  bnez       $v0, .L8015BD54
    /* 22154 8015BD4C 01000624 */   addiu     $a2, $zero, 0x1
    /* 22158 8015BD50 1000A6AF */  sw         $a2, 0x10($sp)
  .L8015BD54:
    /* 2215C 8015BD54 1000A68F */  lw         $a2, 0x10($sp)
    /* 22160 8015BD58 00000000 */  nop
    /* 22164 8015BD5C 5600C014 */  bnez       $a2, .L8015BEB8
    /* 22168 8015BD60 21800000 */   addu      $s0, $zero, $zero
    /* 2216C 8015BD64 2120E002 */  addu       $a0, $s7, $zero
    /* 22170 8015BD68 340C020C */  jal        GetTRAP__Fii
    /* 22174 8015BD6C 2128A002 */   addu      $a1, $s5, $zero
    /* 22178 8015BD70 0A004010 */  beqz       $v0, .L8015BD9C
    /* 2217C 8015BD74 00000000 */   nop
    /* 22180 8015BD78 3000A58F */  lw         $a1, 0x30($sp)
    /* 22184 8015BD7C 380B020C */  jal        GetSOLID__Fii
    /* 22188 8015BD80 21202002 */   addu      $a0, $s1, $zero
    /* 2218C 8015BD84 05004014 */  bnez       $v0, .L8015BD9C
    /* 22190 8015BD88 00000000 */   nop
    /* 22194 8015BD8C 2800A58F */  lw         $a1, 0x28($sp)
    /* 22198 8015BD90 380B020C */  jal        GetSOLID__Fii
    /* 2219C 8015BD94 21202002 */   addu      $a0, $s1, $zero
    /* 221A0 8015BD98 0100502C */  sltiu      $s0, $v0, 0x1
  .L8015BD9C:
    /* 221A4 8015BD9C 21000012 */  beqz       $s0, .L8015BE24
    /* 221A8 8015BDA0 21109302 */   addu      $v0, $s4, $s3
    /* 221AC 8015BDA4 1800A68F */  lw         $a2, 0x18($sp)
    /* 221B0 8015BDA8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 221B4 8015BDAC 21082200 */  addu       $at, $at, $v0
    /* 221B8 8015BDB0 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 221BC 8015BDB4 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 221C0 8015BDB8 21082600 */  addu       $at, $at, $a2
    /* 221C4 8015BDBC 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 221C8 8015BDC0 00000000 */  nop
    /* 221CC 8015BDC4 17006214 */  bne        $v1, $v0, .L8015BE24
    /* 221D0 8015BDC8 00000000 */   nop
    /* 221D4 8015BDCC 2000A68F */  lw         $a2, 0x20($sp)
    /* 221D8 8015BDD0 00000000 */  nop
    /* 221DC 8015BDD4 2110D300 */  addu       $v0, $a2, $s3
    /* 221E0 8015BDD8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 221E4 8015BDDC 21082200 */  addu       $at, $at, $v0
    /* 221E8 8015BDE0 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 221EC 8015BDE4 00000000 */  nop
    /* 221F0 8015BDE8 0E004314 */  bne        $v0, $v1, .L8015BE24
    /* 221F4 8015BDEC 21109202 */   addu      $v0, $s4, $s2
    /* 221F8 8015BDF0 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 221FC 8015BDF4 21082200 */  addu       $at, $at, $v0
    /* 22200 8015BDF8 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 22204 8015BDFC 00000000 */  nop
    /* 22208 8015BE00 08004014 */  bnez       $v0, .L8015BE24
    /* 2220C 8015BE04 2110D200 */   addu      $v0, $a2, $s2
    /* 22210 8015BE08 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 22214 8015BE0C 21082200 */  addu       $at, $at, $v0
    /* 22218 8015BE10 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 2221C 8015BE14 00000000 */  nop
    /* 22220 8015BE18 02004014 */  bnez       $v0, .L8015BE24
    /* 22224 8015BE1C 02000624 */   addiu     $a2, $zero, 0x2
    /* 22228 8015BE20 1000A6AF */  sw         $a2, 0x10($sp)
  .L8015BE24:
    /* 2222C 8015BE24 1000A68F */  lw         $a2, 0x10($sp)
    /* 22230 8015BE28 00000000 */  nop
    /* 22234 8015BE2C 2100C014 */  bnez       $a2, .L8015BEB4
    /* 22238 8015BE30 60000624 */   addiu     $a2, $zero, 0x60
    /* 2223C 8015BE34 80035226 */  addiu      $s2, $s2, 0x380
    /* 22240 8015BE38 0100F726 */  addiu      $s7, $s7, 0x1
    /* 22244 8015BE3C 80037326 */  addiu      $s3, $s3, 0x380
    /* 22248 8015BE40 01003126 */  addiu      $s1, $s1, 0x1
    /* 2224C 8015BE44 17002616 */  bne        $s1, $a2, .L8015BEA4
    /* 22250 8015BE48 8003D626 */   addiu     $s6, $s6, 0x380
    /* 22254 8015BE4C 80FC1224 */  addiu      $s2, $zero, -0x380
    /* 22258 8015BE50 FFFF1724 */  addiu      $s7, $zero, -0x1
    /* 2225C 8015BE54 21980000 */  addu       $s3, $zero, $zero
    /* 22260 8015BE58 80031624 */  addiu      $s6, $zero, 0x380
    /* 22264 8015BE5C 21880000 */  addu       $s1, $zero, $zero
    /* 22268 8015BE60 2000A68F */  lw         $a2, 0x20($sp)
    /* 2226C 8015BE64 08009426 */  addiu      $s4, $s4, 0x8
    /* 22270 8015BE68 0800C624 */  addiu      $a2, $a2, 0x8
    /* 22274 8015BE6C 2000A6AF */  sw         $a2, 0x20($sp)
    /* 22278 8015BE70 2800A68F */  lw         $a2, 0x28($sp)
    /* 2227C 8015BE74 00000000 */  nop
    /* 22280 8015BE78 0100C624 */  addiu      $a2, $a2, 0x1
    /* 22284 8015BE7C 2800A6AF */  sw         $a2, 0x28($sp)
    /* 22288 8015BE80 3000A68F */  lw         $a2, 0x30($sp)
    /* 2228C 8015BE84 0100B526 */  addiu      $s5, $s5, 0x1
    /* 22290 8015BE88 0100C624 */  addiu      $a2, $a2, 0x1
    /* 22294 8015BE8C 3000A6AF */  sw         $a2, 0x30($sp)
    /* 22298 8015BE90 60000624 */  addiu      $a2, $zero, 0x60
    /* 2229C 8015BE94 0300A616 */  bne        $s5, $a2, .L8015BEA4
    /* 222A0 8015BE98 0800DE27 */   addiu     $fp, $fp, 0x8
    /* 222A4 8015BE9C B26F0508 */  j          .L8015BEC8
    /* 222A8 8015BEA0 21100000 */   addu      $v0, $zero, $zero
  .L8015BEA4:
    /* 222AC 8015BEA4 1000A68F */  lw         $a2, 0x10($sp)
    /* 222B0 8015BEA8 00000000 */  nop
    /* 222B4 8015BEAC 74FFC010 */  beqz       $a2, .L8015BC80
    /* 222B8 8015BEB0 2110D303 */   addu      $v0, $fp, $s3
  .L8015BEB4:
    /* 222BC 8015BEB4 1000A68F */  lw         $a2, 0x10($sp)
  .L8015BEB8:
    /* 222C0 8015BEB8 01000224 */  addiu      $v0, $zero, 0x1
    /* 222C4 8015BEBC 181A91AF */  sw         $s1, %gp_rel(themex)($gp)
    /* 222C8 8015BEC0 1C1A95AF */  sw         $s5, %gp_rel(themey)($gp)
    /* 222CC 8015BEC4 201A86AF */  sw         $a2, %gp_rel(themeVar1)($gp)
  .L8015BEC8:
    /* 222D0 8015BEC8 5C00BF8F */  lw         $ra, 0x5C($sp)
    /* 222D4 8015BECC 5800BE8F */  lw         $fp, 0x58($sp)
    /* 222D8 8015BED0 5400B78F */  lw         $s7, 0x54($sp)
    /* 222DC 8015BED4 5000B68F */  lw         $s6, 0x50($sp)
    /* 222E0 8015BED8 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 222E4 8015BEDC 4800B48F */  lw         $s4, 0x48($sp)
    /* 222E8 8015BEE0 4400B38F */  lw         $s3, 0x44($sp)
    /* 222EC 8015BEE4 4000B28F */  lw         $s2, 0x40($sp)
    /* 222F0 8015BEE8 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 222F4 8015BEEC 3800B08F */  lw         $s0, 0x38($sp)
    /* 222F8 8015BEF0 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 222FC 8015BEF4 0800E003 */  jr         $ra
    /* 22300 8015BEF8 00000000 */   nop
endlabel TFit_Shrine__Fi
