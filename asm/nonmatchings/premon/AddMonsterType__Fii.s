.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddMonsterType__Fii, 0xFC

glabel AddMonsterType__Fii
    /* 25D94 8015F98C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 25D98 8015F990 21308000 */  addu       $a2, $a0, $zero
    /* 25D9C 8015F994 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 25DA0 8015F998 2188A000 */  addu       $s1, $a1, $zero
    /* 25DA4 8015F99C 1280053C */  lui        $a1, %hi(nummtypes)
    /* 25DA8 8015F9A0 9CC2A58C */  lw         $a1, %lo(nummtypes)($a1)
    /* 25DAC 8015F9A4 21200000 */  addu       $a0, $zero, $zero
    /* 25DB0 8015F9A8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 25DB4 8015F9AC 21800000 */  addu       $s0, $zero, $zero
    /* 25DB8 8015F9B0 0F00A018 */  blez       $a1, .L8015F9F0
    /* 25DBC 8015F9B4 2000BFAF */   sw        $ra, 0x20($sp)
    /* 25DC0 8015F9B8 21180000 */  addu       $v1, $zero, $zero
  .L8015F9BC:
    /* 25DC4 8015F9BC 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 25DC8 8015F9C0 21082300 */  addu       $at, $at, $v1
    /* 25DCC 8015F9C4 CEA32290 */  lbu        $v0, %lo(Monsters + 0x12)($at)
    /* 25DD0 8015F9C8 01001026 */  addiu      $s0, $s0, 0x1
    /* 25DD4 8015F9CC 26104600 */  xor        $v0, $v0, $a2
    /* 25DD8 8015F9D0 0100422C */  sltiu      $v0, $v0, 0x1
    /* 25DDC 8015F9D4 21204000 */  addu       $a0, $v0, $zero
    /* 25DE0 8015F9D8 2A100502 */  slt        $v0, $s0, $a1
    /* 25DE4 8015F9DC 04004010 */  beqz       $v0, .L8015F9F0
    /* 25DE8 8015F9E0 1C006324 */   addiu     $v1, $v1, 0x1C
    /* 25DEC 8015F9E4 FF008230 */  andi       $v0, $a0, 0xFF
    /* 25DF0 8015F9E8 F4FF4010 */  beqz       $v0, .L8015F9BC
    /* 25DF4 8015F9EC 00000000 */   nop
  .L8015F9F0:
    /* 25DF8 8015F9F0 FF008230 */  andi       $v0, $a0, 0xFF
    /* 25DFC 8015F9F4 12004014 */  bnez       $v0, .L8015FA40
    /* 25E00 8015F9F8 FFFF1026 */   addiu     $s0, $s0, -0x1
    /* 25E04 8015F9FC 1280023C */  lui        $v0, %hi(nummtypes)
    /* 25E08 8015FA00 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 25E0C 8015FA04 00000000 */  nop
    /* 25E10 8015FA08 21804000 */  addu       $s0, $v0, $zero
    /* 25E14 8015FA0C 01000226 */  addiu      $v0, $s0, 0x1
    /* 25E18 8015FA10 1280013C */  lui        $at, %hi(nummtypes)
    /* 25E1C 8015FA14 9CC222AC */  sw         $v0, %lo(nummtypes)($at)
    /* 25E20 8015FA18 C0101000 */  sll        $v0, $s0, 3
    /* 25E24 8015FA1C 23105000 */  subu       $v0, $v0, $s0
    /* 25E28 8015FA20 80100200 */  sll        $v0, $v0, 2
    /* 25E2C 8015FA24 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 25E30 8015FA28 21082200 */  addu       $at, $at, $v0
    /* 25E34 8015FA2C CEA326A0 */  sb         $a2, %lo(Monsters + 0x12)($at)
    /* 25E38 8015FA30 0A7E050C */  jal        InitMonsterGFX__Fi
    /* 25E3C 8015FA34 21200002 */   addu      $a0, $s0, $zero
    /* 25E40 8015FA38 5FF4000C */  jal        InitMonsterSND__Fi
    /* 25E44 8015FA3C 21200002 */   addu      $a0, $s0, $zero
  .L8015FA40:
    /* 25E48 8015FA40 C0181000 */  sll        $v1, $s0, 3
    /* 25E4C 8015FA44 23187000 */  subu       $v1, $v1, $s0
    /* 25E50 8015FA48 80180300 */  sll        $v1, $v1, 2
    /* 25E54 8015FA4C 1180013C */  lui        $at, %hi(Monsters + 0x13)
    /* 25E58 8015FA50 21082300 */  addu       $at, $at, $v1
    /* 25E5C 8015FA54 CFA32290 */  lbu        $v0, %lo(Monsters + 0x13)($at)
    /* 25E60 8015FA58 00000000 */  nop
    /* 25E64 8015FA5C 25105100 */  or         $v0, $v0, $s1
    /* 25E68 8015FA60 1180013C */  lui        $at, %hi(Monsters + 0x13)
    /* 25E6C 8015FA64 21082300 */  addu       $at, $at, $v1
    /* 25E70 8015FA68 CFA322A0 */  sb         $v0, %lo(Monsters + 0x13)($at)
    /* 25E74 8015FA6C 21100002 */  addu       $v0, $s0, $zero
    /* 25E78 8015FA70 2000BF8F */  lw         $ra, 0x20($sp)
    /* 25E7C 8015FA74 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 25E80 8015FA78 1800B08F */  lw         $s0, 0x18($sp)
    /* 25E84 8015FA7C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 25E88 8015FA80 0800E003 */  jr         $ra
    /* 25E8C 8015FA84 00000000 */   nop
endlabel AddMonsterType__Fii
