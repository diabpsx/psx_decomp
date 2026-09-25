.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching walk__7GamePadi, 0x348

glabel walk__7GamePadi
    /* 69C68 80079C68 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 69C6C 80079C6C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 69C70 80079C70 21808000 */  addu       $s0, $a0, $zero
    /* 69C74 80079C74 2000BFAF */  sw         $ra, 0x20($sp)
    /* 69C78 80079C78 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 69C7C 80079C7C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 69C80 80079C80 1400B1AF */  sw         $s1, 0x14($sp)
    /* 69C84 80079C84 0000038E */  lw         $v1, 0x0($s0)
    /* 69C88 80079C88 00000000 */  nop
    /* 69C8C 80079C8C D3006290 */  lbu        $v0, 0xD3($v1)
    /* 69C90 80079C90 00000000 */  nop
    /* 69C94 80079C94 0A004010 */  beqz       $v0, .L80079CC0
    /* 69C98 80079C98 2190A000 */   addu      $s2, $a1, $zero
    /* 69C9C 80079C9C 1C01628C */  lw         $v0, 0x11C($v1)
    /* 69CA0 80079CA0 00000000 */  nop
    /* 69CA4 80079CA4 06004014 */  bnez       $v0, .L80079CC0
    /* 69CA8 80079CA8 00000000 */   nop
    /* 69CAC 80079CAC 4C000482 */  lb         $a0, 0x4C($s0)
    /* 69CB0 80079CB0 899B010C */  jal        StartPlrKill__Fii
    /* 69CB4 80079CB4 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 69CB8 80079CB8 E4E70108 */  j          .L80079F90
    /* 69CBC 80079CBC 00000000 */   nop
  .L80079CC0:
    /* 69CC0 80079CC0 0000028E */  lw         $v0, 0x0($s0)
    /* 69CC4 80079CC4 00000000 */  nop
    /* 69CC8 80079CC8 0000428C */  lw         $v0, 0x0($v0)
    /* 69CCC 80079CCC 00000000 */  nop
    /* 69CD0 80079CD0 04004228 */  slti       $v0, $v0, 0x4
    /* 69CD4 80079CD4 AE004010 */  beqz       $v0, .L80079F90
    /* 69CD8 80079CD8 00000000 */   nop
    /* 69CDC 80079CDC 36EC010C */  jal        Active__11SpellTarget_8007b0d8
    /* 69CE0 80079CE0 04000426 */   addiu     $a0, $s0, 0x4
    /* 69CE4 80079CE4 AA004014 */  bnez       $v0, .L80079F90
    /* 69CE8 80079CE8 00000000 */   nop
    /* 69CEC 80079CEC 5000028E */  lw         $v0, 0x50($s0)
    /* 69CF0 80079CF0 00000000 */  nop
    /* 69CF4 80079CF4 A6004014 */  bnez       $v0, .L80079F90
    /* 69CF8 80079CF8 21200002 */   addu      $a0, $s0, $zero
    /* 69CFC 80079CFC C2E6010C */  jal        CheckBodge__7GamePadi
    /* 69D00 80079D00 21284002 */   addu      $a1, $s2, $zero
    /* 69D04 80079D04 4C000392 */  lbu        $v1, 0x4C($s0)
    /* 69D08 80079D08 21884000 */  addu       $s1, $v0, $zero
    /* 69D0C 80079D0C 01006338 */  xori       $v1, $v1, 0x1
    /* 69D10 80079D10 001E0300 */  sll        $v1, $v1, 24
    /* 69D14 80079D14 031E0300 */  sra        $v1, $v1, 24
    /* 69D18 80079D18 40100300 */  sll        $v0, $v1, 1
    /* 69D1C 80079D1C 21104300 */  addu       $v0, $v0, $v1
    /* 69D20 80079D20 80100200 */  sll        $v0, $v0, 2
    /* 69D24 80079D24 21104300 */  addu       $v0, $v0, $v1
    /* 69D28 80079D28 00110200 */  sll        $v0, $v0, 4
    /* 69D2C 80079D2C 23104300 */  subu       $v0, $v0, $v1
    /* 69D30 80079D30 80100200 */  sll        $v0, $v0, 2
    /* 69D34 80079D34 21104300 */  addu       $v0, $v0, $v1
    /* 69D38 80079D38 C0100200 */  sll        $v0, $v0, 3
    /* 69D3C 80079D3C 0E80033C */  lui        $v1, %hi(plr)
    /* 69D40 80079D40 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 69D44 80079D44 21184300 */  addu       $v1, $v0, $v1
    /* 69D48 80079D48 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 69D4C 80079D4C 1E002212 */  beq        $s1, $v0, .L80079DC8
    /* 69D50 80079D50 00000000 */   nop
    /* 69D54 80079D54 0000058E */  lw         $a1, 0x0($s0)
    /* 69D58 80079D58 00000000 */  nop
    /* 69D5C 80079D5C 1D00A290 */  lbu        $v0, 0x1D($a1)
    /* 69D60 80079D60 00000000 */  nop
    /* 69D64 80079D64 16004010 */  beqz       $v0, .L80079DC0
    /* 69D68 80079D68 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 69D6C 80079D6C 1D006290 */  lbu        $v0, 0x1D($v1)
    /* 69D70 80079D70 00000000 */  nop
    /* 69D74 80079D74 12004010 */  beqz       $v0, .L80079DC0
    /* 69D78 80079D78 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 69D7C 80079D7C 2800668C */  lw         $a2, 0x28($v1)
    /* 69D80 80079D80 2C00678C */  lw         $a3, 0x2C($v1)
    /* 69D84 80079D84 1280013C */  lui        $at, %hi(offset_x)
    /* 69D88 80079D88 21083100 */  addu       $at, $at, $s1
    /* 69D8C 80079D8C A8C22380 */  lb         $v1, %lo(offset_x)($at)
    /* 69D90 80079D90 2800A48C */  lw         $a0, 0x28($a1)
    /* 69D94 80079D94 1280013C */  lui        $at, %hi(offset_y)
    /* 69D98 80079D98 21083100 */  addu       $at, $at, $s1
    /* 69D9C 80079D9C B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 69DA0 80079DA0 2C00A58C */  lw         $a1, 0x2C($a1)
    /* 69DA4 80079DA4 21208300 */  addu       $a0, $a0, $v1
    /* 69DA8 80079DA8 5A89010C */  jal        ChkPlrOffsets__Fiiii
    /* 69DAC 80079DAC 2128A200 */   addu      $a1, $a1, $v0
    /* 69DB0 80079DB0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 69DB4 80079DB4 02004014 */  bnez       $v0, .L80079DC0
    /* 69DB8 80079DB8 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 69DBC 80079DBC FFFF1124 */  addiu      $s1, $zero, -0x1
  .L80079DC0:
    /* 69DC0 80079DC0 06002216 */  bne        $s1, $v0, .L80079DDC
    /* 69DC4 80079DC4 00000000 */   nop
  .L80079DC8:
    /* 69DC8 80079DC8 4C000482 */  lb         $a0, 0x4C($s0)
    /* 69DCC 80079DCC 299B010C */  jal        StartStand__Fii
    /* 69DD0 80079DD0 21284002 */   addu      $a1, $s2, $zero
    /* 69DD4 80079DD4 E4E70108 */  j          .L80079F90
    /* 69DD8 80079DD8 00000000 */   nop
  .L80079DDC:
    /* 69DDC 80079DDC 0000038E */  lw         $v1, 0x0($s0)
    /* 69DE0 80079DE0 1280013C */  lui        $at, %hi(offset_x)
    /* 69DE4 80079DE4 21083100 */  addu       $at, $at, $s1
    /* 69DE8 80079DE8 A8C23280 */  lb         $s2, %lo(offset_x)($at)
    /* 69DEC 80079DEC 42006280 */  lb         $v0, 0x42($v1)
    /* 69DF0 80079DF0 1280013C */  lui        $at, %hi(offset_y)
    /* 69DF4 80079DF4 21083100 */  addu       $at, $at, $s1
    /* 69DF8 80079DF8 B0C23380 */  lb         $s3, %lo(offset_y)($at)
    /* 69DFC 80079DFC 05002216 */  bne        $s1, $v0, .L80079E14
    /* 69E00 80079E00 08000524 */   addiu     $a1, $zero, 0x8
    /* 69E04 80079E04 0000628C */  lw         $v0, 0x0($v1)
    /* 69E08 80079E08 00000000 */  nop
    /* 69E0C 80079E0C 17004014 */  bnez       $v0, .L80079E6C
    /* 69E10 80079E10 00000000 */   nop
  .L80079E14:
    /* 69E14 80079E14 4C000482 */  lb         $a0, 0x4C($s0)
    /* 69E18 80079E18 9401668C */  lw         $a2, 0x194($v1)
    /* 69E1C 80079E1C 9C9B010C */  jal        NewPlrAnim__Fiiii
    /* 69E20 80079E20 21380000 */   addu      $a3, $zero, $zero
    /* 69E24 80079E24 0000028E */  lw         $v0, 0x0($s0)
    /* 69E28 80079E28 00000000 */  nop
    /* 69E2C 80079E2C 640140A4 */  sh         $zero, 0x164($v0)
    /* 69E30 80079E30 0000028E */  lw         $v0, 0x0($s0)
    /* 69E34 80079E34 00000000 */  nop
    /* 69E38 80079E38 5A0151A4 */  sh         $s1, 0x15A($v0)
    /* 69E3C 80079E3C 0000028E */  lw         $v0, 0x0($s0)
    /* 69E40 80079E40 00000000 */  nop
    /* 69E44 80079E44 30004484 */  lh         $a0, 0x30($v0)
    /* 69E48 80079E48 32004584 */  lh         $a1, 0x32($v0)
    /* 69E4C 80079E4C 1B83010C */  jal        PlrClrTrans__Fii
    /* 69E50 80079E50 00000000 */   nop
    /* 69E54 80079E54 0000028E */  lw         $v0, 0x0($s0)
    /* 69E58 80079E58 00000000 */  nop
    /* 69E5C 80079E5C 30004484 */  lh         $a0, 0x30($v0)
    /* 69E60 80079E60 32004584 */  lh         $a1, 0x32($v0)
    /* 69E64 80079E64 3983010C */  jal        PlrDoTrans__Fii
    /* 69E68 80079E68 00000000 */   nop
  .L80079E6C:
    /* 69E6C 80079E6C 0000028E */  lw         $v0, 0x0($s0)
    /* 69E70 80079E70 03004016 */  bnez       $s2, .L80079E80
    /* 69E74 80079E74 420051A0 */   sb        $s1, 0x42($v0)
    /* 69E78 80079E78 45006012 */  beqz       $s3, .L80079F90
    /* 69E7C 80079E7C 00000000 */   nop
  .L80079E80:
    /* 69E80 80079E80 0000038E */  lw         $v1, 0x0($s0)
    /* 69E84 80079E84 01000224 */  addiu      $v0, $zero, 0x1
    /* 69E88 80079E88 000062AC */  sw         $v0, 0x0($v1)
    /* 69E8C 80079E8C 0000028E */  lw         $v0, 0x0($s0)
    /* 69E90 80079E90 00000000 */  nop
    /* 69E94 80079E94 560152A4 */  sh         $s2, 0x156($v0)
    /* 69E98 80079E98 0000028E */  lw         $v0, 0x0($s0)
    /* 69E9C 80079E9C 00000000 */  nop
    /* 69EA0 80079EA0 580153A4 */  sh         $s3, 0x158($v0)
    /* 69EA4 80079EA4 0000028E */  lw         $v0, 0x0($s0)
    /* 69EA8 80079EA8 00000000 */  nop
    /* 69EAC 80079EAC 30004384 */  lh         $v1, 0x30($v0)
    /* 69EB0 80079EB0 1280023C */  lui        $v0, %hi(ViewX)
    /* 69EB4 80079EB4 14C1428C */  lw         $v0, %lo(ViewX)($v0)
    /* 69EB8 80079EB8 0E80123C */  lui        $s2, %hi(ScrollInfo + 0x8)
    /* 69EBC 80079EBC 1C795226 */  addiu      $s2, $s2, %lo(ScrollInfo + 0x8)
    /* 69EC0 80079EC0 23286200 */  subu       $a1, $v1, $v0
    /* 69EC4 80079EC4 000045AE */  sw         $a1, 0x0($s2)
    /* 69EC8 80079EC8 0000028E */  lw         $v0, 0x0($s0)
    /* 69ECC 80079ECC 1280033C */  lui        $v1, %hi(ViewY)
    /* 69ED0 80079ED0 18C1638C */  lw         $v1, %lo(ViewY)($v1)
    /* 69ED4 80079ED4 32004284 */  lh         $v0, 0x32($v0)
    /* 69ED8 80079ED8 1280043C */  lui        $a0, %hi(svgamode)
    /* 69EDC 80079EDC E0B78490 */  lbu        $a0, %lo(svgamode)($a0)
    /* 69EE0 80079EE0 23104300 */  subu       $v0, $v0, $v1
    /* 69EE4 80079EE4 11008010 */  beqz       $a0, .L80079F2C
    /* 69EE8 80079EE8 040042AE */   sw        $v0, 0x4($s2)
    /* 69EEC 80079EEC 21800000 */  addu       $s0, $zero, $zero
    /* 69EF0 80079EF0 6D41000C */  jal        abs
    /* 69EF4 80079EF4 2120A000 */   addu      $a0, $a1, $zero
    /* 69EF8 80079EF8 03004228 */  slti       $v0, $v0, 0x3
    /* 69EFC 80079EFC 05004010 */  beqz       $v0, .L80079F14
    /* 69F00 80079F00 00000000 */   nop
    /* 69F04 80079F04 0400448E */  lw         $a0, 0x4($s2)
    /* 69F08 80079F08 6D41000C */  jal        abs
    /* 69F0C 80079F0C 00000000 */   nop
    /* 69F10 80079F10 03005028 */  slti       $s0, $v0, 0x3
  .L80079F14:
    /* 69F14 80079F14 1C000012 */  beqz       $s0, .L80079F88
    /* 69F18 80079F18 FDFF2226 */   addiu     $v0, $s1, -0x3
    /* 69F1C 80079F1C 1100401C */  bgtz       $v0, .L80079F64
    /* 69F20 80079F20 FEFF2226 */   addiu     $v0, $s1, -0x2
    /* 69F24 80079F24 DEE70108 */  j          .L80079F78
    /* 69F28 80079F28 05002226 */   addiu     $v0, $s1, 0x5
  .L80079F2C:
    /* 69F2C 80079F2C 21800000 */  addu       $s0, $zero, $zero
    /* 69F30 80079F30 6D41000C */  jal        abs
    /* 69F34 80079F34 2120A000 */   addu      $a0, $a1, $zero
    /* 69F38 80079F38 02004228 */  slti       $v0, $v0, 0x2
    /* 69F3C 80079F3C 05004010 */  beqz       $v0, .L80079F54
    /* 69F40 80079F40 00000000 */   nop
    /* 69F44 80079F44 0400448E */  lw         $a0, 0x4($s2)
    /* 69F48 80079F48 6D41000C */  jal        abs
    /* 69F4C 80079F4C 00000000 */   nop
    /* 69F50 80079F50 02005028 */  slti       $s0, $v0, 0x2
  .L80079F54:
    /* 69F54 80079F54 0C000012 */  beqz       $s0, .L80079F88
    /* 69F58 80079F58 FDFF2226 */   addiu     $v0, $s1, -0x3
    /* 69F5C 80079F5C 05004018 */  blez       $v0, .L80079F74
    /* 69F60 80079F60 FEFF2226 */   addiu     $v0, $s1, -0x2
  .L80079F64:
    /* 69F64 80079F64 0E80013C */  lui        $at, %hi(ScrollInfo + 0x10)
    /* 69F68 80079F68 247922AC */  sw         $v0, %lo(ScrollInfo + 0x10)($at)
    /* 69F6C 80079F6C E4E70108 */  j          .L80079F90
    /* 69F70 80079F70 00000000 */   nop
  .L80079F74:
    /* 69F74 80079F74 05002226 */  addiu      $v0, $s1, 0x5
  .L80079F78:
    /* 69F78 80079F78 0E80013C */  lui        $at, %hi(ScrollInfo + 0x10)
    /* 69F7C 80079F7C 247922AC */  sw         $v0, %lo(ScrollInfo + 0x10)($at)
    /* 69F80 80079F80 E4E70108 */  j          .L80079F90
    /* 69F84 80079F84 00000000 */   nop
  .L80079F88:
    /* 69F88 80079F88 0E80013C */  lui        $at, %hi(ScrollInfo + 0x10)
    /* 69F8C 80079F8C 247920AC */  sw         $zero, %lo(ScrollInfo + 0x10)($at)
  .L80079F90:
    /* 69F90 80079F90 2000BF8F */  lw         $ra, 0x20($sp)
    /* 69F94 80079F94 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 69F98 80079F98 1800B28F */  lw         $s2, 0x18($sp)
    /* 69F9C 80079F9C 1400B18F */  lw         $s1, 0x14($sp)
    /* 69FA0 80079FA0 1000B08F */  lw         $s0, 0x10($sp)
    /* 69FA4 80079FA4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 69FA8 80079FA8 0800E003 */  jr         $ra
    /* 69FAC 80079FAC 00000000 */   nop
endlabel walk__7GamePadi
