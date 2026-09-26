.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadMapObjects__FPUciiiiiii, 0x16C

glabel LoadMapObjects__FPUciiiiiii
    /* 1F078 80158C70 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 1F07C 80158C74 3800B2AF */  sw         $s2, 0x38($sp)
    /* 1F080 80158C78 21908000 */  addu       $s2, $a0, $zero
    /* 1F084 80158C7C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F088 80158C80 5400BFAF */  sw         $ra, 0x54($sp)
    /* 1F08C 80158C84 5000BEAF */  sw         $fp, 0x50($sp)
    /* 1F090 80158C88 4C00B7AF */  sw         $s7, 0x4C($sp)
    /* 1F094 80158C8C 4800B6AF */  sw         $s6, 0x48($sp)
    /* 1F098 80158C90 4400B5AF */  sw         $s5, 0x44($sp)
    /* 1F09C 80158C94 4000B4AF */  sw         $s4, 0x40($sp)
    /* 1F0A0 80158C98 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 1F0A4 80158C9C 3400B1AF */  sw         $s1, 0x34($sp)
    /* 1F0A8 80158CA0 3000B0AF */  sw         $s0, 0x30($sp)
    /* 1F0AC 80158CA4 1280013C */  lui        $at, %hi(InitObjFlag)
    /* 1F0B0 80158CA8 D0B922A0 */  sb         $v0, %lo(InitObjFlag)($at)
    /* 1F0B4 80158CAC 00005592 */  lbu        $s5, 0x0($s2)
    /* 1F0B8 80158CB0 02005226 */  addiu      $s2, $s2, 0x2
    /* 1F0BC 80158CB4 00005692 */  lbu        $s6, 0x0($s2)
    /* 1F0C0 80158CB8 00000000 */  nop
    /* 1F0C4 80158CBC 1800B602 */  mult       $s5, $s6
    /* 1F0C8 80158CC0 12100000 */  mflo       $v0
    /* 1F0CC 80158CC4 40A81500 */  sll        $s5, $s5, 1
    /* 1F0D0 80158CC8 40B01600 */  sll        $s6, $s6, 1
    /* 1F0D4 80158CCC 1800B602 */  mult       $s5, $s6
    /* 1F0D8 80158CD0 21F0A000 */  addu       $fp, $a1, $zero
    /* 1F0DC 80158CD4 21B8E000 */  addu       $s7, $a3, $zero
    /* 1F0E0 80158CD8 21A00000 */  addu       $s4, $zero, $zero
    /* 1F0E4 80158CDC 40100200 */  sll        $v0, $v0, 1
    /* 1F0E8 80158CE0 02004224 */  addiu      $v0, $v0, 0x2
    /* 1F0EC 80158CE4 12180000 */  mflo       $v1
    /* 1F0F0 80158CE8 80180300 */  sll        $v1, $v1, 2
    /* 1F0F4 80158CEC 21104300 */  addu       $v0, $v0, $v1
    /* 1F0F8 80158CF0 2B00C012 */  beqz       $s6, .L80158DA0
    /* 1F0FC 80158CF4 21904202 */   addu      $s2, $s2, $v0
    /* 1F100 80158CF8 1000C624 */  addiu      $a2, $a2, 0x10
    /* 1F104 80158CFC 1800A6AF */  sw         $a2, 0x18($sp)
  .L80158D00:
    /* 1F108 80158D00 2300A012 */  beqz       $s5, .L80158D90
    /* 1F10C 80158D04 21880000 */   addu      $s1, $zero, $zero
    /* 1F110 80158D08 1800A88F */  lw         $t0, 0x18($sp)
    /* 1F114 80158D0C 00000000 */  nop
    /* 1F118 80158D10 21988802 */  addu       $s3, $s4, $t0
  .L80158D14:
    /* 1F11C 80158D14 00004292 */  lbu        $v0, 0x0($s2)
    /* 1F120 80158D18 00000000 */  nop
    /* 1F124 80158D1C 18004010 */  beqz       $v0, .L80158D80
    /* 1F128 80158D20 1000D027 */   addiu     $s0, $fp, 0x10
    /* 1F12C 80158D24 21803002 */  addu       $s0, $s1, $s0
    /* 1F130 80158D28 21280002 */  addu       $a1, $s0, $zero
    /* 1F134 80158D2C 80100200 */  sll        $v0, $v0, 2
    /* 1F138 80158D30 0E80093C */  lui        $t1, %hi(ObjTypeConv)
    /* 1F13C 80158D34 EC822925 */  addiu      $t1, $t1, %lo(ObjTypeConv)
    /* 1F140 80158D38 21104900 */  addu       $v0, $v0, $t1
    /* 1F144 80158D3C 0000448C */  lw         $a0, 0x0($v0)
    /* 1F148 80158D40 BE4E010C */  jal        AddObject__Fiii
    /* 1F14C 80158D44 21306002 */   addu      $a2, $s3, $zero
    /* 1F150 80158D48 21200002 */  addu       $a0, $s0, $zero
    /* 1F154 80158D4C B654050C */  jal        ObjIndex__Fii
    /* 1F158 80158D50 21286002 */   addu      $a1, $s3, $zero
    /* 1F15C 80158D54 21204000 */  addu       $a0, $v0, $zero
    /* 1F160 80158D58 6800A68F */  lw         $a2, 0x68($sp)
    /* 1F164 80158D5C 7000A88F */  lw         $t0, 0x70($sp)
    /* 1F168 80158D60 7400A98F */  lw         $t1, 0x74($sp)
    /* 1F16C 80158D64 2110C800 */  addu       $v0, $a2, $t0
    /* 1F170 80158D68 6C00A88F */  lw         $t0, 0x6C($sp)
    /* 1F174 80158D6C 2128E002 */  addu       $a1, $s7, $zero
    /* 1F178 80158D70 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1F17C 80158D74 1400A9AF */  sw         $t1, 0x14($sp)
    /* 1F180 80158D78 9C4E010C */  jal        SetObjMapRange__Fiiiiii
    /* 1F184 80158D7C 2138E802 */   addu      $a3, $s7, $t0
  .L80158D80:
    /* 1F188 80158D80 01003126 */  addiu      $s1, $s1, 0x1
    /* 1F18C 80158D84 2A103502 */  slt        $v0, $s1, $s5
    /* 1F190 80158D88 E2FF4014 */  bnez       $v0, .L80158D14
    /* 1F194 80158D8C 02005226 */   addiu     $s2, $s2, 0x2
  .L80158D90:
    /* 1F198 80158D90 01009426 */  addiu      $s4, $s4, 0x1
    /* 1F19C 80158D94 2A109602 */  slt        $v0, $s4, $s6
    /* 1F1A0 80158D98 D9FF4014 */  bnez       $v0, .L80158D00
    /* 1F1A4 80158D9C 00000000 */   nop
  .L80158DA0:
    /* 1F1A8 80158DA0 1280013C */  lui        $at, %hi(InitObjFlag)
    /* 1F1AC 80158DA4 D0B920A0 */  sb         $zero, %lo(InitObjFlag)($at)
    /* 1F1B0 80158DA8 5400BF8F */  lw         $ra, 0x54($sp)
    /* 1F1B4 80158DAC 5000BE8F */  lw         $fp, 0x50($sp)
    /* 1F1B8 80158DB0 4C00B78F */  lw         $s7, 0x4C($sp)
    /* 1F1BC 80158DB4 4800B68F */  lw         $s6, 0x48($sp)
    /* 1F1C0 80158DB8 4400B58F */  lw         $s5, 0x44($sp)
    /* 1F1C4 80158DBC 4000B48F */  lw         $s4, 0x40($sp)
    /* 1F1C8 80158DC0 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 1F1CC 80158DC4 3800B28F */  lw         $s2, 0x38($sp)
    /* 1F1D0 80158DC8 3400B18F */  lw         $s1, 0x34($sp)
    /* 1F1D4 80158DCC 3000B08F */  lw         $s0, 0x30($sp)
    /* 1F1D8 80158DD0 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 1F1DC 80158DD4 0800E003 */  jr         $ra
    /* 1F1E0 80158DD8 00000000 */   nop
endlabel LoadMapObjects__FPUciiiiiii
