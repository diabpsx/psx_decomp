.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3MakeMegas__Fv, 0x13C

glabel DRLG_L3MakeMegas__Fv
    /* 10060 80149C58 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 10064 80149C5C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 10068 80149C60 0E80143C */  lui        $s4, %hi(dungeon)
    /* 1006C 80149C64 C4409426 */  addiu      $s4, $s4, %lo(dungeon)
    /* 10070 80149C68 2400B5AF */  sw         $s5, 0x24($sp)
    /* 10074 80149C6C 60009526 */  addiu      $s5, $s4, 0x60
    /* 10078 80149C70 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1007C 80149C74 21980000 */  addu       $s3, $zero, $zero
    /* 10080 80149C78 2800BFAF */  sw         $ra, 0x28($sp)
    /* 10084 80149C7C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 10088 80149C80 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1008C 80149C84 1000B0AF */  sw         $s0, 0x10($sp)
  .L80149C88:
    /* 10090 80149C88 21906002 */  addu       $s2, $s3, $zero
    /* 10094 80149C8C 21808002 */  addu       $s0, $s4, $zero
    /* 10098 80149C90 2188A002 */  addu       $s1, $s5, $zero
  .L80149C94:
    /* 1009C 80149C94 21205002 */  addu       $a0, $s2, $s0
    /* 100A0 80149C98 21285102 */  addu       $a1, $s2, $s1
    /* 100A4 80149C9C 00008394 */  lhu        $v1, 0x0($a0)
    /* 100A8 80149CA0 0000A294 */  lhu        $v0, 0x0($a1)
    /* 100AC 80149CA4 C0300300 */  sll        $a2, $v1, 3
    /* 100B0 80149CA8 80100200 */  sll        $v0, $v0, 2
    /* 100B4 80149CAC 2130C200 */  addu       $a2, $a2, $v0
    /* 100B8 80149CB0 02008394 */  lhu        $v1, 0x2($a0)
    /* 100BC 80149CB4 0200A294 */  lhu        $v0, 0x2($a1)
    /* 100C0 80149CB8 40180300 */  sll        $v1, $v1, 1
    /* 100C4 80149CBC 2130C300 */  addu       $a2, $a2, $v1
    /* 100C8 80149CC0 2130C200 */  addu       $a2, $a2, $v0
    /* 100CC 80149CC4 06000224 */  addiu      $v0, $zero, 0x6
    /* 100D0 80149CC8 0700C214 */  bne        $a2, $v0, .L80149CE8
    /* 100D4 80149CCC 09000224 */   addiu     $v0, $zero, 0x9
    /* 100D8 80149CD0 C9F6000C */  jal        ENG_random__Fl
    /* 100DC 80149CD4 02000424 */   addiu     $a0, $zero, 0x2
    /* 100E0 80149CD8 02004014 */  bnez       $v0, .L80149CE4
    /* 100E4 80149CDC 05000624 */   addiu     $a2, $zero, 0x5
    /* 100E8 80149CE0 0C000624 */  addiu      $a2, $zero, 0xC
  .L80149CE4:
    /* 100EC 80149CE4 09000224 */  addiu      $v0, $zero, 0x9
  .L80149CE8:
    /* 100F0 80149CE8 0700C214 */  bne        $a2, $v0, .L80149D08
    /* 100F4 80149CEC 21185002 */   addu      $v1, $s2, $s0
    /* 100F8 80149CF0 C9F6000C */  jal        ENG_random__Fl
    /* 100FC 80149CF4 02000424 */   addiu     $a0, $zero, 0x2
    /* 10100 80149CF8 02004014 */  bnez       $v0, .L80149D04
    /* 10104 80149CFC 0E000624 */   addiu     $a2, $zero, 0xE
    /* 10108 80149D00 0D000624 */  addiu      $a2, $zero, 0xD
  .L80149D04:
    /* 1010C 80149D04 21185002 */  addu       $v1, $s2, $s0
  .L80149D08:
    /* 10110 80149D08 60001026 */  addiu      $s0, $s0, 0x60
    /* 10114 80149D0C 1580013C */  lui        $at, %hi(L3ConvTbl)
    /* 10118 80149D10 21082600 */  addu       $at, $at, $a2
    /* 1011C 80149D14 E4862290 */  lbu        $v0, %lo(L3ConvTbl)($at)
    /* 10120 80149D18 00000000 */  nop
    /* 10124 80149D1C 000062A4 */  sh         $v0, 0x0($v1)
    /* 10128 80149D20 A00E8226 */  addiu      $v0, $s4, 0xEA0
    /* 1012C 80149D24 2A100202 */  slt        $v0, $s0, $v0
    /* 10130 80149D28 DAFF4014 */  bnez       $v0, .L80149C94
    /* 10134 80149D2C 60003126 */   addiu     $s1, $s1, 0x60
    /* 10138 80149D30 08000224 */  addiu      $v0, $zero, 0x8
    /* 1013C 80149D34 0E80013C */  lui        $at, %hi(dungeon + 0xEA0)
    /* 10140 80149D38 21083300 */  addu       $at, $at, $s3
    /* 10144 80149D3C 644F22A4 */  sh         $v0, %lo(dungeon + 0xEA0)($at)
    /* 10148 80149D40 02007326 */  addiu      $s3, $s3, 0x2
    /* 1014C 80149D44 4E00622A */  slti       $v0, $s3, 0x4E
    /* 10150 80149D48 CFFF4014 */  bnez       $v0, .L80149C88
    /* 10154 80149D4C 08000324 */   addiu     $v1, $zero, 0x8
    /* 10158 80149D50 40110224 */  addiu      $v0, $zero, 0x1140
  .L80149D54:
    /* 1015C 80149D54 0E80013C */  lui        $at, %hi(dungeon + 0x4E)
    /* 10160 80149D58 21082200 */  addu       $at, $at, $v0
    /* 10164 80149D5C 124123A4 */  sh         $v1, %lo(dungeon + 0x4E)($at)
    /* 10168 80149D60 A0FF4224 */  addiu      $v0, $v0, -0x60
    /* 1016C 80149D64 FBFF4104 */  bgez       $v0, .L80149D54
    /* 10170 80149D68 00000000 */   nop
    /* 10174 80149D6C 2800BF8F */  lw         $ra, 0x28($sp)
    /* 10178 80149D70 2400B58F */  lw         $s5, 0x24($sp)
    /* 1017C 80149D74 2000B48F */  lw         $s4, 0x20($sp)
    /* 10180 80149D78 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 10184 80149D7C 1800B28F */  lw         $s2, 0x18($sp)
    /* 10188 80149D80 1400B18F */  lw         $s1, 0x14($sp)
    /* 1018C 80149D84 1000B08F */  lw         $s0, 0x10($sp)
    /* 10190 80149D88 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 10194 80149D8C 0800E003 */  jr         $ra
    /* 10198 80149D90 00000000 */   nop
endlabel DRLG_L3MakeMegas__Fv
