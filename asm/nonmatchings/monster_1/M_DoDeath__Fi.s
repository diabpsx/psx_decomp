.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoDeath__Fi, 0x1C4

glabel M_DoDeath__Fi
    /* 15114 8014ED0C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 15118 8014ED10 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1511C 8014ED14 21888000 */  addu       $s1, $a0, $zero
    /* 15120 8014ED18 40101100 */  sll        $v0, $s1, 1
    /* 15124 8014ED1C 21105100 */  addu       $v0, $v0, $s1
    /* 15128 8014ED20 80100200 */  sll        $v0, $v0, 2
    /* 1512C 8014ED24 21105100 */  addu       $v0, $v0, $s1
    /* 15130 8014ED28 1000B0AF */  sw         $s0, 0x10($sp)
    /* 15134 8014ED2C C0800200 */  sll        $s0, $v0, 3
    /* 15138 8014ED30 1080033C */  lui        $v1, %hi(monster)
    /* 1513C 8014ED34 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 15140 8014ED38 21180302 */  addu       $v1, $s0, $v1
    /* 15144 8014ED3C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 15148 8014ED40 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1514C 8014ED44 1800B2AF */  sw         $s2, 0x18($sp)
    /* 15150 8014ED48 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 15154 8014ED4C 21083000 */  addu       $at, $at, $s0
    /* 15158 8014ED50 AC532294 */  lhu        $v0, %lo(monster + 0x18)($at)
    /* 1515C 8014ED54 34007280 */  lb         $s2, 0x34($v1)
    /* 15160 8014ED58 01004224 */  addiu      $v0, $v0, 0x1
    /* 15164 8014ED5C 180062A4 */  sh         $v0, 0x18($v1)
    /* 15168 8014ED60 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1516C 8014ED64 21083000 */  addu       $at, $at, $s0
    /* 15170 8014ED68 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 15174 8014ED6C 35007380 */  lb         $s3, 0x35($v1)
    /* 15178 8014ED70 1200A490 */  lbu        $a0, 0x12($a1)
    /* 1517C 8014ED74 6E000224 */  addiu      $v0, $zero, 0x6E
    /* 15180 8014ED78 2C008214 */  bne        $a0, $v0, .L8014EE2C
    /* 15184 8014ED7C 01000224 */   addiu     $v0, $zero, 0x1
    /* 15188 8014ED80 1280053C */  lui        $a1, %hi(ViewX)
    /* 1518C 8014ED84 14C1A58C */  lw         $a1, %lo(ViewX)($a1)
    /* 15190 8014ED88 1280013C */  lui        $at, %hi(DiabloDieFlag)
    /* 15194 8014ED8C 5CB222AC */  sw         $v0, %lo(DiabloDieFlag)($at)
    /* 15198 8014ED90 23104502 */  subu       $v0, $s2, $a1
    /* 1519C 8014ED94 03004004 */  bltz       $v0, .L8014EDA4
    /* 151A0 8014ED98 2A100200 */   slt       $v0, $zero, $v0
    /* 151A4 8014ED9C 6A3B0508 */  j          .L8014EDA8
    /* 151A8 8014EDA0 2110A200 */   addu      $v0, $a1, $v0
  .L8014EDA4:
    /* 151AC 8014EDA4 FFFFA224 */  addiu      $v0, $a1, -0x1
  .L8014EDA8:
    /* 151B0 8014EDA8 1280033C */  lui        $v1, %hi(ViewY)
    /* 151B4 8014EDAC 18C1638C */  lw         $v1, %lo(ViewY)($v1)
    /* 151B8 8014EDB0 1280013C */  lui        $at, %hi(ViewX)
    /* 151BC 8014EDB4 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 151C0 8014EDB8 23106302 */  subu       $v0, $s3, $v1
    /* 151C4 8014EDBC 03004004 */  bltz       $v0, .L8014EDCC
    /* 151C8 8014EDC0 2A100200 */   slt       $v0, $zero, $v0
    /* 151CC 8014EDC4 743B0508 */  j          .L8014EDD0
    /* 151D0 8014EDC8 21106200 */   addu      $v0, $v1, $v0
  .L8014EDCC:
    /* 151D4 8014EDCC FFFF6224 */  addiu      $v0, $v1, -0x1
  .L8014EDD0:
    /* 151D8 8014EDD0 1280013C */  lui        $at, %hi(ViewY)
    /* 151DC 8014EDD4 18C122AC */  sw         $v0, %lo(ViewY)($at)
    /* 151E0 8014EDD8 40101100 */  sll        $v0, $s1, 1
    /* 151E4 8014EDDC 21105100 */  addu       $v0, $v0, $s1
    /* 151E8 8014EDE0 80100200 */  sll        $v0, $v0, 2
    /* 151EC 8014EDE4 21105100 */  addu       $v0, $v0, $s1
    /* 151F0 8014EDE8 C0200200 */  sll        $a0, $v0, 3
    /* 151F4 8014EDEC 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 151F8 8014EDF0 21082400 */  addu       $at, $at, $a0
    /* 151FC 8014EDF4 AC532384 */  lh         $v1, %lo(monster + 0x18)($at)
    /* 15200 8014EDF8 8C000224 */  addiu      $v0, $zero, 0x8C
    /* 15204 8014EDFC 2C006214 */  bne        $v1, $v0, .L8014EEB0
    /* 15208 8014EE00 21100000 */   addu      $v0, $zero, $zero
    /* 1520C 8014EE04 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 15210 8014EE08 21082400 */  addu       $at, $at, $a0
    /* 15214 8014EE0C BA532484 */  lh         $a0, %lo(monster + 0x26)($at)
    /* 15218 8014EE10 01000224 */  addiu      $v0, $zero, 0x1
    /* 1521C 8014EE14 1280013C */  lui        $at, %hi(gbMaxPlayers)
    /* 15220 8014EE18 A2B922A0 */  sb         $v0, %lo(gbMaxPlayers)($at)
    /* 15224 8014EE1C F13A050C */  jal        PrepDoEnding__Fi
    /* 15228 8014EE20 00000000 */   nop
    /* 1522C 8014EE24 AC3B0508 */  j          .L8014EEB0
    /* 15230 8014EE28 21100000 */   addu      $v0, $zero, $zero
  .L8014EE2C:
    /* 15234 8014EE2C 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 15238 8014EE30 21083000 */  addu       $at, $at, $s0
    /* 1523C 8014EE34 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 15240 8014EE38 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 15244 8014EE3C 21083000 */  addu       $at, $at, $s0
    /* 15248 8014EE40 D4532280 */  lb         $v0, %lo(monster + 0x40)($at)
    /* 1524C 8014EE44 00000000 */  nop
    /* 15250 8014EE48 19006214 */  bne        $v1, $v0, .L8014EEB0
    /* 15254 8014EE4C 21100000 */   addu      $v0, $zero, $zero
    /* 15258 8014EE50 6D000224 */  addiu      $v0, $zero, 0x6D
    /* 1525C 8014EE54 07008210 */  beq        $a0, $v0, .L8014EE74
    /* 15260 8014EE58 21204002 */   addu      $a0, $s2, $zero
    /* 15264 8014EE5C 1800A680 */  lb         $a2, 0x18($a1)
    /* 15268 8014EE60 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1526C 8014EE64 21083000 */  addu       $at, $at, $s0
    /* 15270 8014EE68 D0532780 */  lb         $a3, %lo(monster + 0x3C)($at)
    /* 15274 8014EE6C E3DF000C */  jal        AddDead__Fiici
    /* 15278 8014EE70 21286002 */   addu      $a1, $s3, $zero
  .L8014EE74:
    /* 1527C 8014EE74 C0101300 */  sll        $v0, $s3, 3
    /* 15280 8014EE78 C0181200 */  sll        $v1, $s2, 3
    /* 15284 8014EE7C 23187200 */  subu       $v1, $v1, $s2
    /* 15288 8014EE80 C0190300 */  sll        $v1, $v1, 7
    /* 1528C 8014EE84 21104300 */  addu       $v0, $v0, $v1
    /* 15290 8014EE88 0E80013C */  lui        $at, %hi(dung_map)
    /* 15294 8014EE8C 21082200 */  addu       $at, $at, $v0
    /* 15298 8014EE90 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 1529C 8014EE94 01000224 */  addiu      $v0, $zero, 0x1
    /* 152A0 8014EE98 1080013C */  lui        $at, %hi(monster + 0x5B)
    /* 152A4 8014EE9C 21083000 */  addu       $at, $at, $s0
    /* 152A8 8014EEA0 EF5322A0 */  sb         $v0, %lo(monster + 0x5B)($at)
    /* 152AC 8014EEA4 F5FF010C */  jal        M_UpdateLeader__Fi
    /* 152B0 8014EEA8 21202002 */   addu      $a0, $s1, $zero
    /* 152B4 8014EEAC 21100000 */  addu       $v0, $zero, $zero
  .L8014EEB0:
    /* 152B8 8014EEB0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 152BC 8014EEB4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 152C0 8014EEB8 1800B28F */  lw         $s2, 0x18($sp)
    /* 152C4 8014EEBC 1400B18F */  lw         $s1, 0x14($sp)
    /* 152C8 8014EEC0 1000B08F */  lw         $s0, 0x10($sp)
    /* 152CC 8014EEC4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 152D0 8014EEC8 0800E003 */  jr         $ra
    /* 152D4 8014EECC 00000000 */   nop
endlabel M_DoDeath__Fi
