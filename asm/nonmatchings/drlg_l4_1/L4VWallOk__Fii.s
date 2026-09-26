.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4VWallOk__Fii, 0x170

glabel L4VWallOk__Fii
    /* 15DF0 8014F9E8 21408000 */  addu       $t0, $a0, $zero
    /* 15DF4 8014F9EC 01000A24 */  addiu      $t2, $zero, 0x1
    /* 15DF8 8014F9F0 0100A924 */  addiu      $t1, $a1, 0x1
    /* 15DFC 8014F9F4 40380900 */  sll        $a3, $t1, 1
    /* 15E00 8014F9F8 0E80043C */  lui        $a0, %hi(dungeon)
    /* 15E04 8014F9FC C4408424 */  addiu      $a0, $a0, %lo(dungeon)
    /* 15E08 8014FA00 40100800 */  sll        $v0, $t0, 1
    /* 15E0C 8014FA04 21104800 */  addu       $v0, $v0, $t0
    /* 15E10 8014FA08 40110200 */  sll        $v0, $v0, 5
    /* 15E14 8014FA0C 21584400 */  addu       $t3, $v0, $a0
    /* 15E18 8014FA10 2118EB00 */  addu       $v1, $a3, $t3
    /* 15E1C 8014FA14 06000C24 */  addiu      $t4, $zero, 0x6
    /* 15E20 8014FA18 00006694 */  lhu        $a2, 0x0($v1)
    /* 15E24 8014FA1C A0FF8324 */  addiu      $v1, $a0, -0x60
    /* 15E28 8014FA20 60008424 */  addiu      $a0, $a0, 0x60
    /* 15E2C 8014FA24 21684400 */  addu       $t5, $v0, $a0
    /* 15E30 8014FA28 1280043C */  lui        $a0, %hi(mydflags)
    /* 15E34 8014FA2C D8C0848C */  lw         $a0, %lo(mydflags)($a0)
    /* 15E38 8014FA30 1C00CC14 */  bne        $a2, $t4, .L8014FAA4
    /* 15E3C 8014FA34 21704300 */   addu      $t6, $v0, $v1
    /* 15E40 8014FA38 80100900 */  sll        $v0, $t1, 2
    /* 15E44 8014FA3C A23E0508 */  j          .L8014FA88
    /* 15E48 8014FA40 21104900 */   addu      $v0, $v0, $t1
  .L8014FA44:
    /* 15E4C 8014FA44 00004294 */  lhu        $v0, 0x0($v0)
    /* 15E50 8014FA48 00000000 */  nop
    /* 15E54 8014FA4C 15004614 */  bne        $v0, $a2, .L8014FAA4
    /* 15E58 8014FA50 2110ED00 */   addu      $v0, $a3, $t5
    /* 15E5C 8014FA54 00004294 */  lhu        $v0, 0x0($v0)
    /* 15E60 8014FA58 00000000 */  nop
    /* 15E64 8014FA5C 11004614 */  bne        $v0, $a2, .L8014FAA4
    /* 15E68 8014FA60 00000000 */   nop
    /* 15E6C 8014FA64 01004A25 */  addiu      $t2, $t2, 0x1
    /* 15E70 8014FA68 2118AA00 */  addu       $v1, $a1, $t2
    /* 15E74 8014FA6C 40380300 */  sll        $a3, $v1, 1
    /* 15E78 8014FA70 2110EB00 */  addu       $v0, $a3, $t3
    /* 15E7C 8014FA74 00004694 */  lhu        $a2, 0x0($v0)
    /* 15E80 8014FA78 00000000 */  nop
    /* 15E84 8014FA7C 0900CC14 */  bne        $a2, $t4, .L8014FAA4
    /* 15E88 8014FA80 80100300 */   sll       $v0, $v1, 2
    /* 15E8C 8014FA84 21104300 */  addu       $v0, $v0, $v1
  .L8014FA88:
    /* 15E90 8014FA88 C0100200 */  sll        $v0, $v0, 3
    /* 15E94 8014FA8C 21104800 */  addu       $v0, $v0, $t0
    /* 15E98 8014FA90 21108200 */  addu       $v0, $a0, $v0
    /* 15E9C 8014FA94 00004290 */  lbu        $v0, 0x0($v0)
    /* 15EA0 8014FA98 00000000 */  nop
    /* 15EA4 8014FA9C E9FF4010 */  beqz       $v0, .L8014FA44
    /* 15EA8 8014FAA0 2110EE00 */   addu      $v0, $a3, $t6
  .L8014FAA4:
    /* 15EAC 8014FAA4 0E80033C */  lui        $v1, %hi(dungeon)
    /* 15EB0 8014FAA8 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 15EB4 8014FAAC 40100800 */  sll        $v0, $t0, 1
    /* 15EB8 8014FAB0 21104800 */  addu       $v0, $v0, $t0
    /* 15EBC 8014FAB4 40110200 */  sll        $v0, $v0, 5
    /* 15EC0 8014FAB8 21104300 */  addu       $v0, $v0, $v1
    /* 15EC4 8014FABC 2118AA00 */  addu       $v1, $a1, $t2
    /* 15EC8 8014FAC0 40180300 */  sll        $v1, $v1, 1
    /* 15ECC 8014FAC4 21186200 */  addu       $v1, $v1, $v0
    /* 15ED0 8014FAC8 00006494 */  lhu        $a0, 0x0($v1)
    /* 15ED4 8014FACC 00000000 */  nop
    /* 15ED8 8014FAD0 08008238 */  xori       $v0, $a0, 0x8
    /* 15EDC 8014FAD4 0100422C */  sltiu      $v0, $v0, 0x1
    /* 15EE0 8014FAD8 21184000 */  addu       $v1, $v0, $zero
    /* 15EE4 8014FADC 09000224 */  addiu      $v0, $zero, 0x9
    /* 15EE8 8014FAE0 02008214 */  bne        $a0, $v0, .L8014FAEC
    /* 15EEC 8014FAE4 0B000224 */   addiu     $v0, $zero, 0xB
    /* 15EF0 8014FAE8 01000324 */  addiu      $v1, $zero, 0x1
  .L8014FAEC:
    /* 15EF4 8014FAEC 02008214 */  bne        $a0, $v0, .L8014FAF8
    /* 15EF8 8014FAF0 0E000224 */   addiu     $v0, $zero, 0xE
    /* 15EFC 8014FAF4 01000324 */  addiu      $v1, $zero, 0x1
  .L8014FAF8:
    /* 15F00 8014FAF8 02008214 */  bne        $a0, $v0, .L8014FB04
    /* 15F04 8014FAFC 0F000224 */   addiu     $v0, $zero, 0xF
    /* 15F08 8014FB00 01000324 */  addiu      $v1, $zero, 0x1
  .L8014FB04:
    /* 15F0C 8014FB04 02008214 */  bne        $a0, $v0, .L8014FB10
    /* 15F10 8014FB08 10000224 */   addiu     $v0, $zero, 0x10
    /* 15F14 8014FB0C 01000324 */  addiu      $v1, $zero, 0x1
  .L8014FB10:
    /* 15F18 8014FB10 02008214 */  bne        $a0, $v0, .L8014FB1C
    /* 15F1C 8014FB14 15000224 */   addiu     $v0, $zero, 0x15
    /* 15F20 8014FB18 01000324 */  addiu      $v1, $zero, 0x1
  .L8014FB1C:
    /* 15F24 8014FB1C 02008214 */  bne        $a0, $v0, .L8014FB28
    /* 15F28 8014FB20 17000224 */   addiu     $v0, $zero, 0x17
    /* 15F2C 8014FB24 01000324 */  addiu      $v1, $zero, 0x1
  .L8014FB28:
    /* 15F30 8014FB28 02008214 */  bne        $a0, $v0, .L8014FB34
    /* 15F34 8014FB2C 04004229 */   slti      $v0, $t2, 0x4
    /* 15F38 8014FB30 01000324 */  addiu      $v1, $zero, 0x1
  .L8014FB34:
    /* 15F3C 8014FB34 03004010 */  beqz       $v0, .L8014FB44
    /* 15F40 8014FB38 FF006330 */   andi      $v1, $v1, 0xFF
    /* 15F44 8014FB3C 21180000 */  addu       $v1, $zero, $zero
    /* 15F48 8014FB40 FF006330 */  andi       $v1, $v1, 0xFF
  .L8014FB44:
    /* 15F4C 8014FB44 02006014 */  bnez       $v1, .L8014FB50
    /* 15F50 8014FB48 21104001 */   addu      $v0, $t2, $zero
    /* 15F54 8014FB4C FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8014FB50:
    /* 15F58 8014FB50 0800E003 */  jr         $ra
    /* 15F5C 8014FB54 00000000 */   nop
endlabel L4VWallOk__Fii
