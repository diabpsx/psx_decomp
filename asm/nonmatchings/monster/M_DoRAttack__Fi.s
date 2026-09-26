.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoRAttack__Fi, 0x188

glabel M_DoRAttack__Fi
    /* 13FF0 8014DBE8 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 13FF4 8014DBEC 3800B2AF */  sw         $s2, 0x38($sp)
    /* 13FF8 8014DBF0 21908000 */  addu       $s2, $a0, $zero
    /* 13FFC 8014DBF4 40101200 */  sll        $v0, $s2, 1
    /* 14000 8014DBF8 21105200 */  addu       $v0, $v0, $s2
    /* 14004 8014DBFC 80100200 */  sll        $v0, $v0, 2
    /* 14008 8014DC00 21105200 */  addu       $v0, $v0, $s2
    /* 1400C 8014DC04 C0200200 */  sll        $a0, $v0, 3
    /* 14010 8014DC08 4000BFAF */  sw         $ra, 0x40($sp)
    /* 14014 8014DC0C 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 14018 8014DC10 3400B1AF */  sw         $s1, 0x34($sp)
    /* 1401C 8014DC14 3000B0AF */  sw         $s0, 0x30($sp)
    /* 14020 8014DC18 1080013C */  lui        $at, %hi(monster + 0x64)
    /* 14024 8014DC1C 21082400 */  addu       $at, $at, $a0
    /* 14028 8014DC20 F853228C */  lw         $v0, %lo(monster + 0x64)($at)
    /* 1402C 8014DC24 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 14030 8014DC28 21082400 */  addu       $at, $at, $a0
    /* 14034 8014DC2C D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 14038 8014DC30 26004290 */  lbu        $v0, 0x26($v0)
    /* 1403C 8014DC34 00000000 */  nop
    /* 14040 8014DC38 32006214 */  bne        $v1, $v0, .L8014DD04
    /* 14044 8014DC3C 40101200 */   sll       $v0, $s2, 1
    /* 14048 8014DC40 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 1404C 8014DC44 21082400 */  addu       $at, $at, $a0
    /* 14050 8014DC48 AC532384 */  lh         $v1, %lo(monster + 0x18)($at)
    /* 14054 8014DC4C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 14058 8014DC50 28006210 */  beq        $v1, $v0, .L8014DCF4
    /* 1405C 8014DC54 34000224 */   addiu     $v0, $zero, 0x34
    /* 14060 8014DC58 02006214 */  bne        $v1, $v0, .L8014DC64
    /* 14064 8014DC5C 01001324 */   addiu     $s3, $zero, 0x1
    /* 14068 8014DC60 03001324 */  addiu      $s3, $zero, 0x3
  .L8014DC64:
    /* 1406C 8014DC64 23006012 */  beqz       $s3, .L8014DCF4
    /* 14070 8014DC68 21880000 */   addu      $s1, $zero, $zero
    /* 14074 8014DC6C 21808000 */  addu       $s0, $a0, $zero
  .L8014DC70:
    /* 14078 8014DC70 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1407C 8014DC74 21083000 */  addu       $at, $at, $s0
    /* 14080 8014DC78 D0532280 */  lb         $v0, %lo(monster + 0x3C)($at)
    /* 14084 8014DC7C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 14088 8014DC80 21083000 */  addu       $at, $at, $s0
    /* 1408C 8014DC84 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 14090 8014DC88 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 14094 8014DC8C 21083000 */  addu       $at, $at, $s0
    /* 14098 8014DC90 C9532580 */  lb         $a1, %lo(monster + 0x35)($at)
    /* 1409C 8014DC94 1080013C */  lui        $at, %hi(monster + 0x4A)
    /* 140A0 8014DC98 21083000 */  addu       $at, $at, $s0
    /* 140A4 8014DC9C DE532690 */  lbu        $a2, %lo(monster + 0x4A)($at)
    /* 140A8 8014DCA0 1080013C */  lui        $at, %hi(monster + 0x4B)
    /* 140AC 8014DCA4 21083000 */  addu       $at, $at, $s0
    /* 140B0 8014DCA8 DF532790 */  lbu        $a3, %lo(monster + 0x4B)($at)
    /* 140B4 8014DCAC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 140B8 8014DCB0 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 140BC 8014DCB4 21083000 */  addu       $at, $at, $s0
    /* 140C0 8014DCB8 AC532384 */  lh         $v1, %lo(monster + 0x18)($at)
    /* 140C4 8014DCBC 01000224 */  addiu      $v0, $zero, 0x1
    /* 140C8 8014DCC0 1800A2AF */  sw         $v0, 0x18($sp)
    /* 140CC 8014DCC4 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 140D0 8014DCC8 1400A3AF */  sw         $v1, 0x14($sp)
    /* 140D4 8014DCCC 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 140D8 8014DCD0 21083000 */  addu       $at, $at, $s0
    /* 140DC 8014DCD4 AE532284 */  lh         $v0, %lo(monster + 0x1A)($at)
    /* 140E0 8014DCD8 01003126 */  addiu      $s1, $s1, 0x1
    /* 140E4 8014DCDC 2400A0AF */  sw         $zero, 0x24($sp)
    /* 140E8 8014DCE0 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* 140EC 8014DCE4 2000A2AF */   sw        $v0, 0x20($sp)
    /* 140F0 8014DCE8 2A103302 */  slt        $v0, $s1, $s3
    /* 140F4 8014DCEC E0FF4014 */  bnez       $v0, .L8014DC70
    /* 140F8 8014DCF0 00000000 */   nop
  .L8014DCF4:
    /* 140FC 8014DCF4 21204002 */  addu       $a0, $s2, $zero
    /* 14100 8014DCF8 4AF5000C */  jal        PlayEffect__Fii
    /* 14104 8014DCFC 21280000 */   addu      $a1, $zero, $zero
    /* 14108 8014DD00 40101200 */  sll        $v0, $s2, 1
  .L8014DD04:
    /* 1410C 8014DD04 21105200 */  addu       $v0, $v0, $s2
    /* 14110 8014DD08 80100200 */  sll        $v0, $v0, 2
    /* 14114 8014DD0C 21105200 */  addu       $v0, $v0, $s2
    /* 14118 8014DD10 C0200200 */  sll        $a0, $v0, 3
    /* 1411C 8014DD14 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 14120 8014DD18 21082400 */  addu       $at, $at, $a0
    /* 14124 8014DD1C D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 14128 8014DD20 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 1412C 8014DD24 21082400 */  addu       $at, $at, $a0
    /* 14130 8014DD28 D4532280 */  lb         $v0, %lo(monster + 0x40)($at)
    /* 14134 8014DD2C 00000000 */  nop
    /* 14138 8014DD30 07006214 */  bne        $v1, $v0, .L8014DD50
    /* 1413C 8014DD34 21100000 */   addu      $v0, $zero, $zero
    /* 14140 8014DD38 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 14144 8014DD3C 21082400 */  addu       $at, $at, $a0
    /* 14148 8014DD40 D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 1414C 8014DD44 9CFF010C */  jal        M_StartStand__Fii
    /* 14150 8014DD48 21204002 */   addu      $a0, $s2, $zero
    /* 14154 8014DD4C 01000224 */  addiu      $v0, $zero, 0x1
  .L8014DD50:
    /* 14158 8014DD50 4000BF8F */  lw         $ra, 0x40($sp)
    /* 1415C 8014DD54 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 14160 8014DD58 3800B28F */  lw         $s2, 0x38($sp)
    /* 14164 8014DD5C 3400B18F */  lw         $s1, 0x34($sp)
    /* 14168 8014DD60 3000B08F */  lw         $s0, 0x30($sp)
    /* 1416C 8014DD64 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 14170 8014DD68 0800E003 */  jr         $ra
    /* 14174 8014DD6C 00000000 */   nop
endlabel M_DoRAttack__Fi
