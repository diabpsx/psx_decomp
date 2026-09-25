.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckUnique__FiiiUc, 0x1A4

glabel CheckUnique__FiiiUc
    /* 33DB0 80043DB0 58FFBD27 */  addiu      $sp, $sp, -0xA8
    /* 33DB4 80043DB4 9400B1AF */  sw         $s1, 0x94($sp)
    /* 33DB8 80043DB8 21888000 */  addu       $s1, $a0, $zero
    /* 33DBC 80043DBC 9C00B3AF */  sw         $s3, 0x9C($sp)
    /* 33DC0 80043DC0 2198A000 */  addu       $s3, $a1, $zero
    /* 33DC4 80043DC4 9000B0AF */  sw         $s0, 0x90($sp)
    /* 33DC8 80043DC8 2180C000 */  addu       $s0, $a2, $zero
    /* 33DCC 80043DCC 64000424 */  addiu      $a0, $zero, 0x64
    /* 33DD0 80043DD0 9800B2AF */  sw         $s2, 0x98($sp)
    /* 33DD4 80043DD4 A000BFAF */  sw         $ra, 0xA0($sp)
    /* 33DD8 80043DD8 C9F6000C */  jal        ENG_random__Fl
    /* 33DDC 80043DDC 2190E000 */   addu      $s2, $a3, $zero
    /* 33DE0 80043DE0 2A800202 */  slt        $s0, $s0, $v0
    /* 33DE4 80043DE4 53000016 */  bnez       $s0, .L80043F34
    /* 33DE8 80043DE8 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 33DEC 80043DEC 21800000 */  addu       $s0, $zero, $zero
    /* 33DF0 80043DF0 1000A427 */  addiu      $a0, $sp, 0x10
    /* 33DF4 80043DF4 21280000 */  addu       $a1, $zero, $zero
    /* 33DF8 80043DF8 E940000C */  jal        memset
    /* 33DFC 80043DFC 80000624 */   addiu     $a2, $zero, 0x80
    /* 33E00 80043E00 1180033C */  lui        $v1, %hi(UniqueItemList + 0x4)
    /* 33E04 80043E04 68436380 */  lb         $v1, %lo(UniqueItemList + 0x4)($v1)
    /* 33E08 80043E08 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 33E0C 80043E0C 32006210 */  beq        $v1, $v0, .L80043ED8
    /* 33E10 80043E10 21200000 */   addu      $a0, $zero, $zero
    /* 33E14 80043E14 C0101100 */  sll        $v0, $s1, 3
    /* 33E18 80043E18 23105100 */  subu       $v0, $v0, $s1
    /* 33E1C 80043E1C 80100200 */  sll        $v0, $v0, 2
    /* 33E20 80043E20 23105100 */  subu       $v0, $v0, $s1
    /* 33E24 80043E24 80400200 */  sll        $t0, $v0, 2
    /* 33E28 80043E28 01000724 */  addiu      $a3, $zero, 0x1
    /* 33E2C 80043E2C 1180053C */  lui        $a1, %hi(UniqueItemList + 0x4)
    /* 33E30 80043E30 6843A524 */  addiu      $a1, $a1, %lo(UniqueItemList + 0x4)
    /* 33E34 80043E34 21300000 */  addu       $a2, $zero, $zero
  .L80043E38:
    /* 33E38 80043E38 0D80013C */  lui        $at, %hi(item + 0x2E)
    /* 33E3C 80043E3C 21082800 */  addu       $at, $at, $t0
    /* 33E40 80043E40 821D2284 */  lh         $v0, %lo(item + 0x2E)($at)
    /* 33E44 80043E44 0000A380 */  lb         $v1, 0x0($a1)
    /* 33E48 80043E48 40110200 */  sll        $v0, $v0, 5
    /* 33E4C 80043E4C 1180013C */  lui        $at, %hi(AllItemsList + 0x5)
    /* 33E50 80043E50 21082200 */  addu       $at, $at, $v0
    /* 33E54 80043E54 A9132280 */  lb         $v0, %lo(AllItemsList + 0x5)($at)
    /* 33E58 80043E58 00000000 */  nop
    /* 33E5C 80043E5C 18006214 */  bne        $v1, $v0, .L80043EC0
    /* 33E60 80043E60 00000000 */   nop
    /* 33E64 80043E64 1180013C */  lui        $at, %hi(UniqueItemList + 0x5)
    /* 33E68 80043E68 21082600 */  addu       $at, $at, $a2
    /* 33E6C 80043E6C 69432280 */  lb         $v0, %lo(UniqueItemList + 0x5)($at)
    /* 33E70 80043E70 00000000 */  nop
    /* 33E74 80043E74 2A106202 */  slt        $v0, $s3, $v0
    /* 33E78 80043E78 11004014 */  bnez       $v0, .L80043EC0
    /* 33E7C 80043E7C FF004232 */   andi      $v0, $s2, 0xFF
    /* 33E80 80043E80 0C004014 */  bnez       $v0, .L80043EB4
    /* 33E84 80043E84 1000A227 */   addiu     $v0, $sp, 0x10
    /* 33E88 80043E88 0D80013C */  lui        $at, %hi(UniqueItemFlag)
    /* 33E8C 80043E8C 21082400 */  addu       $at, $at, $a0
    /* 33E90 80043E90 54542290 */  lbu        $v0, %lo(UniqueItemFlag)($at)
    /* 33E94 80043E94 00000000 */  nop
    /* 33E98 80043E98 06004010 */  beqz       $v0, .L80043EB4
    /* 33E9C 80043E9C 1000A227 */   addiu     $v0, $sp, 0x10
    /* 33EA0 80043EA0 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 33EA4 80043EA4 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 33EA8 80043EA8 00000000 */  nop
    /* 33EAC 80043EAC 04004710 */  beq        $v0, $a3, .L80043EC0
    /* 33EB0 80043EB0 1000A227 */   addiu     $v0, $sp, 0x10
  .L80043EB4:
    /* 33EB4 80043EB4 21104400 */  addu       $v0, $v0, $a0
    /* 33EB8 80043EB8 000047A0 */  sb         $a3, 0x0($v0)
    /* 33EBC 80043EBC 01001026 */  addiu      $s0, $s0, 0x1
  .L80043EC0:
    /* 33EC0 80043EC0 5400A524 */  addiu      $a1, $a1, 0x54
    /* 33EC4 80043EC4 5400C624 */  addiu      $a2, $a2, 0x54
    /* 33EC8 80043EC8 0000A380 */  lb         $v1, 0x0($a1)
    /* 33ECC 80043ECC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 33ED0 80043ED0 D9FF6214 */  bne        $v1, $v0, .L80043E38
    /* 33ED4 80043ED4 01008424 */   addiu     $a0, $a0, 0x1
  .L80043ED8:
    /* 33ED8 80043ED8 16000012 */  beqz       $s0, .L80043F34
    /* 33EDC 80043EDC FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 33EE0 80043EE0 C9F6000C */  jal        ENG_random__Fl
    /* 33EE4 80043EE4 0A000424 */   addiu     $a0, $zero, 0xA
    /* 33EE8 80043EE8 1100001A */  blez       $s0, .L80043F30
    /* 33EEC 80043EEC 21200000 */   addu      $a0, $zero, $zero
    /* 33EF0 80043EF0 80000624 */  addiu      $a2, $zero, 0x80
    /* 33EF4 80043EF4 1000A527 */  addiu      $a1, $sp, 0x10
    /* 33EF8 80043EF8 2118A000 */  addu       $v1, $a1, $zero
  .L80043EFC:
    /* 33EFC 80043EFC 00006290 */  lbu        $v0, 0x0($v1)
    /* 33F00 80043F00 00000000 */  nop
    /* 33F04 80043F04 02004010 */  beqz       $v0, .L80043F10
    /* 33F08 80043F08 00000000 */   nop
    /* 33F0C 80043F0C FFFF1026 */  addiu      $s0, $s0, -0x1
  .L80043F10:
    /* 33F10 80043F10 0800001A */  blez       $s0, .L80043F34
    /* 33F14 80043F14 21108000 */   addu      $v0, $a0, $zero
    /* 33F18 80043F18 01008424 */  addiu      $a0, $a0, 0x1
    /* 33F1C 80043F1C F7FF8614 */  bne        $a0, $a2, .L80043EFC
    /* 33F20 80043F20 01006324 */   addiu     $v1, $v1, 0x1
    /* 33F24 80043F24 2118A000 */  addu       $v1, $a1, $zero
    /* 33F28 80043F28 BF0F0108 */  j          .L80043EFC
    /* 33F2C 80043F2C 21200000 */   addu      $a0, $zero, $zero
  .L80043F30:
    /* 33F30 80043F30 21108000 */  addu       $v0, $a0, $zero
  .L80043F34:
    /* 33F34 80043F34 A000BF8F */  lw         $ra, 0xA0($sp)
    /* 33F38 80043F38 9C00B38F */  lw         $s3, 0x9C($sp)
    /* 33F3C 80043F3C 9800B28F */  lw         $s2, 0x98($sp)
    /* 33F40 80043F40 9400B18F */  lw         $s1, 0x94($sp)
    /* 33F44 80043F44 9000B08F */  lw         $s0, 0x90($sp)
    /* 33F48 80043F48 A800BD27 */  addiu      $sp, $sp, 0xA8
    /* 33F4C 80043F4C 0800E003 */  jr         $ra
    /* 33F50 80043F50 00000000 */   nop
endlabel CheckUnique__FiiiUc
