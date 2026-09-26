.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4HorizWall__Fiii, 0x1D0

glabel L4HorizWall__Fiii
    /* 15F60 8014FB58 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 15F64 8014FB5C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 15F68 8014FB60 21888000 */  addu       $s1, $a0, $zero
    /* 15F6C 8014FB64 0E80083C */  lui        $t0, %hi(dungeon)
    /* 15F70 8014FB68 C4400825 */  addiu      $t0, $t0, %lo(dungeon)
    /* 15F74 8014FB6C 40101100 */  sll        $v0, $s1, 1
    /* 15F78 8014FB70 21105100 */  addu       $v0, $v0, $s1
    /* 15F7C 8014FB74 40110200 */  sll        $v0, $v0, 5
    /* 15F80 8014FB78 21104800 */  addu       $v0, $v0, $t0
    /* 15F84 8014FB7C 40200500 */  sll        $a0, $a1, 1
    /* 15F88 8014FB80 21388200 */  addu       $a3, $a0, $v0
    /* 15F8C 8014FB84 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 15F90 8014FB88 1800B2AF */  sw         $s2, 0x18($sp)
    /* 15F94 8014FB8C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 15F98 8014FB90 0000E394 */  lhu        $v1, 0x0($a3)
    /* 15F9C 8014FB94 0D000224 */  addiu      $v0, $zero, 0xD
    /* 15FA0 8014FB98 05006214 */  bne        $v1, $v0, .L8014FBB0
    /* 15FA4 8014FB9C 10000224 */   addiu     $v0, $zero, 0x10
    /* 15FA8 8014FBA0 11000224 */  addiu      $v0, $zero, 0x11
    /* 15FAC 8014FBA4 0000E2A4 */  sh         $v0, 0x0($a3)
    /* 15FB0 8014FBA8 0000E394 */  lhu        $v1, 0x0($a3)
    /* 15FB4 8014FBAC 10000224 */  addiu      $v0, $zero, 0x10
  .L8014FBB0:
    /* 15FB8 8014FBB0 02006214 */  bne        $v1, $v0, .L8014FBBC
    /* 15FBC 8014FBB4 0B000224 */   addiu     $v0, $zero, 0xB
    /* 15FC0 8014FBB8 0000E2A4 */  sh         $v0, 0x0($a3)
  .L8014FBBC:
    /* 15FC4 8014FBBC 0000E394 */  lhu        $v1, 0x0($a3)
    /* 15FC8 8014FBC0 0C000224 */  addiu      $v0, $zero, 0xC
    /* 15FCC 8014FBC4 02006214 */  bne        $v1, $v0, .L8014FBD0
    /* 15FD0 8014FBC8 0E000224 */   addiu     $v0, $zero, 0xE
    /* 15FD4 8014FBCC 0000E2A4 */  sh         $v0, 0x0($a3)
  .L8014FBD0:
    /* 15FD8 8014FBD0 01000724 */  addiu      $a3, $zero, 0x1
    /* 15FDC 8014FBD4 2A10E600 */  slt        $v0, $a3, $a2
    /* 15FE0 8014FBD8 0F004010 */  beqz       $v0, .L8014FC18
    /* 15FE4 8014FBDC 21182602 */   addu      $v1, $s1, $a2
    /* 15FE8 8014FBE0 21480001 */  addu       $t1, $t0, $zero
    /* 15FEC 8014FBE4 21408000 */  addu       $t0, $a0, $zero
    /* 15FF0 8014FBE8 02000424 */  addiu      $a0, $zero, 0x2
  .L8014FBEC:
    /* 15FF4 8014FBEC 21102702 */  addu       $v0, $s1, $a3
    /* 15FF8 8014FBF0 40180200 */  sll        $v1, $v0, 1
    /* 15FFC 8014FBF4 21186200 */  addu       $v1, $v1, $v0
    /* 16000 8014FBF8 40190300 */  sll        $v1, $v1, 5
    /* 16004 8014FBFC 21186900 */  addu       $v1, $v1, $t1
    /* 16008 8014FC00 21180301 */  addu       $v1, $t0, $v1
    /* 1600C 8014FC04 0100E724 */  addiu      $a3, $a3, 0x1
    /* 16010 8014FC08 2A10E600 */  slt        $v0, $a3, $a2
    /* 16014 8014FC0C F7FF4014 */  bnez       $v0, .L8014FBEC
    /* 16018 8014FC10 000064A4 */   sh        $a0, 0x0($v1)
    /* 1601C 8014FC14 21182602 */  addu       $v1, $s1, $a2
  .L8014FC18:
    /* 16020 8014FC18 0E80123C */  lui        $s2, %hi(dungeon)
    /* 16024 8014FC1C C4405226 */  addiu      $s2, $s2, %lo(dungeon)
    /* 16028 8014FC20 40100300 */  sll        $v0, $v1, 1
    /* 1602C 8014FC24 21104300 */  addu       $v0, $v0, $v1
    /* 16030 8014FC28 40110200 */  sll        $v0, $v0, 5
    /* 16034 8014FC2C 21105200 */  addu       $v0, $v0, $s2
    /* 16038 8014FC30 40800500 */  sll        $s0, $a1, 1
    /* 1603C 8014FC34 21280202 */  addu       $a1, $s0, $v0
    /* 16040 8014FC38 0000A394 */  lhu        $v1, 0x0($a1)
    /* 16044 8014FC3C 0F000224 */  addiu      $v0, $zero, 0xF
    /* 16048 8014FC40 05006214 */  bne        $v1, $v0, .L8014FC58
    /* 1604C 8014FC44 0A000224 */   addiu     $v0, $zero, 0xA
    /* 16050 8014FC48 0E000224 */  addiu      $v0, $zero, 0xE
    /* 16054 8014FC4C 0000A2A4 */  sh         $v0, 0x0($a1)
    /* 16058 8014FC50 0000A394 */  lhu        $v1, 0x0($a1)
    /* 1605C 8014FC54 0A000224 */  addiu      $v0, $zero, 0xA
  .L8014FC58:
    /* 16060 8014FC58 02006214 */  bne        $v1, $v0, .L8014FC64
    /* 16064 8014FC5C 11000224 */   addiu     $v0, $zero, 0x11
    /* 16068 8014FC60 0000A2A4 */  sh         $v0, 0x0($a1)
  .L8014FC64:
    /* 1606C 8014FC64 0000A394 */  lhu        $v1, 0x0($a1)
    /* 16070 8014FC68 15000224 */  addiu      $v0, $zero, 0x15
    /* 16074 8014FC6C 05006214 */  bne        $v1, $v0, .L8014FC84
    /* 16078 8014FC70 16000224 */   addiu     $v0, $zero, 0x16
    /* 1607C 8014FC74 17000224 */  addiu      $v0, $zero, 0x17
    /* 16080 8014FC78 0000A2A4 */  sh         $v0, 0x0($a1)
    /* 16084 8014FC7C 0000A394 */  lhu        $v1, 0x0($a1)
    /* 16088 8014FC80 16000224 */  addiu      $v0, $zero, 0x16
  .L8014FC84:
    /* 1608C 8014FC84 02006214 */  bne        $v1, $v0, .L8014FC90
    /* 16090 8014FC88 1D000224 */   addiu     $v0, $zero, 0x1D
    /* 16094 8014FC8C 0000A2A4 */  sh         $v0, 0x0($a1)
  .L8014FC90:
    /* 16098 8014FC90 C9F6000C */  jal        ENG_random__Fl
    /* 1609C 8014FC94 FDFFC424 */   addiu     $a0, $a2, -0x3
    /* 160A0 8014FC98 01004724 */  addiu      $a3, $v0, 0x1
    /* 160A4 8014FC9C 21102702 */  addu       $v0, $s1, $a3
    /* 160A8 8014FCA0 40180200 */  sll        $v1, $v0, 1
    /* 160AC 8014FCA4 21186200 */  addu       $v1, $v1, $v0
    /* 160B0 8014FCA8 40190300 */  sll        $v1, $v1, 5
    /* 160B4 8014FCAC 21107200 */  addu       $v0, $v1, $s2
    /* 160B8 8014FCB0 21300202 */  addu       $a2, $s0, $v0
    /* 160BC 8014FCB4 39000224 */  addiu      $v0, $zero, 0x39
    /* 160C0 8014FCB8 0000C2A4 */  sh         $v0, 0x0($a2)
    /* 160C4 8014FCBC C0004226 */  addiu      $v0, $s2, 0xC0
    /* 160C8 8014FCC0 21106200 */  addu       $v0, $v1, $v0
    /* 160CC 8014FCC4 21100202 */  addu       $v0, $s0, $v0
    /* 160D0 8014FCC8 38000424 */  addiu      $a0, $zero, 0x38
    /* 160D4 8014FCCC 000044A4 */  sh         $a0, 0x0($v0)
    /* 160D8 8014FCD0 60004226 */  addiu      $v0, $s2, 0x60
    /* 160DC 8014FCD4 21186200 */  addu       $v1, $v1, $v0
    /* 160E0 8014FCD8 21280302 */  addu       $a1, $s0, $v1
    /* 160E4 8014FCDC 3C000224 */  addiu      $v0, $zero, 0x3C
    /* 160E8 8014FCE0 0000A2A4 */  sh         $v0, 0x0($a1)
    /* 160EC 8014FCE4 FEFFC294 */  lhu        $v0, -0x2($a2)
    /* 160F0 8014FCE8 06000324 */  addiu      $v1, $zero, 0x6
    /* 160F4 8014FCEC 02004314 */  bne        $v0, $v1, .L8014FCF8
    /* 160F8 8014FCF0 3A000224 */   addiu     $v0, $zero, 0x3A
    /* 160FC 8014FCF4 FEFFC2A4 */  sh         $v0, -0x2($a2)
  .L8014FCF8:
    /* 16100 8014FCF8 FEFFA294 */  lhu        $v0, -0x2($a1)
    /* 16104 8014FCFC 00000000 */  nop
    /* 16108 8014FD00 02004314 */  bne        $v0, $v1, .L8014FD0C
    /* 1610C 8014FD04 3B000224 */   addiu     $v0, $zero, 0x3B
    /* 16110 8014FD08 FEFFA2A4 */  sh         $v0, -0x2($a1)
  .L8014FD0C:
    /* 16114 8014FD0C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 16118 8014FD10 1800B28F */  lw         $s2, 0x18($sp)
    /* 1611C 8014FD14 1400B18F */  lw         $s1, 0x14($sp)
    /* 16120 8014FD18 1000B08F */  lw         $s0, 0x10($sp)
    /* 16124 8014FD1C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 16128 8014FD20 0800E003 */  jr         $ra
    /* 1612C 8014FD24 00000000 */   nop
endlabel L4HorizWall__Fiii
