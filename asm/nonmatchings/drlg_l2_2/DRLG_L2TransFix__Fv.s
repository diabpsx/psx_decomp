.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L2TransFix__Fv, 0x22C

glabel DRLG_L2TransFix__Fv
    /* D170 80146D68 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* D174 80146D6C 0000B0AF */  sw         $s0, 0x0($sp)
    /* D178 80146D70 10000E24 */  addiu      $t6, $zero, 0x10
    /* D17C 80146D74 21680000 */  addu       $t5, $zero, $zero
    /* D180 80146D78 0A001924 */  addiu      $t9, $zero, 0xA
    /* D184 80146D7C 0E80183C */  lui        $t8, %hi(dungeon)
    /* D188 80146D80 C4401827 */  addiu      $t8, $t8, %lo(dungeon)
    /* D18C 80146D84 60001027 */  addiu      $s0, $t8, 0x60
    /* D190 80146D88 0B000F24 */  addiu      $t7, $zero, 0xB
    /* D194 80146D8C 88000824 */  addiu      $t0, $zero, 0x88
  .L80146D90:
    /* D198 80146D90 40500D00 */  sll        $t2, $t5, 1
    /* D19C 80146D94 21380003 */  addu       $a3, $t8, $zero
    /* D1A0 80146D98 21600000 */  addu       $t4, $zero, $zero
    /* D1A4 80146D9C 00380925 */  addiu      $t1, $t0, 0x3800
    /* D1A8 80146DA0 C0580E00 */  sll        $t3, $t6, 3
    /* D1AC 80146DA4 00386525 */  addiu      $a1, $t3, 0x3800
    /* D1B0 80146DA8 803B0624 */  addiu      $a2, $zero, 0x3B80
  .L80146DAC:
    /* D1B4 80146DAC 21204701 */  addu       $a0, $t2, $a3
    /* D1B8 80146DB0 00008394 */  lhu        $v1, 0x0($a0)
    /* D1BC 80146DB4 0E000224 */  addiu      $v0, $zero, 0xE
    /* D1C0 80146DB8 14006214 */  bne        $v1, $v0, .L80146E0C
    /* D1C4 80146DBC 21104701 */   addu      $v0, $t2, $a3
    /* D1C8 80146DC0 FEFF8294 */  lhu        $v0, -0x2($a0)
    /* D1CC 80146DC4 00000000 */  nop
    /* D1D0 80146DC8 10005914 */  bne        $v0, $t9, .L80146E0C
    /* D1D4 80146DCC 21104701 */   addu      $v0, $t2, $a3
    /* D1D8 80146DD0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D1DC 80146DD4 21082500 */  addu       $at, $at, $a1
    /* D1E0 80146DD8 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* D1E4 80146DDC 21106601 */  addu       $v0, $t3, $a2
    /* D1E8 80146DE0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D1EC 80146DE4 21082200 */  addu       $at, $at, $v0
    /* D1F0 80146DE8 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* D1F4 80146DEC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D1F8 80146DF0 21082500 */  addu       $at, $at, $a1
    /* D1FC 80146DF4 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* D200 80146DF8 21100601 */  addu       $v0, $t0, $a2
    /* D204 80146DFC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D208 80146E00 21082200 */  addu       $at, $at, $v0
    /* D20C 80146E04 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* D210 80146E08 21104701 */  addu       $v0, $t2, $a3
  .L80146E0C:
    /* D214 80146E0C 00004394 */  lhu        $v1, 0x0($v0)
    /* D218 80146E10 0F000224 */  addiu      $v0, $zero, 0xF
    /* D21C 80146E14 14006214 */  bne        $v1, $v0, .L80146E68
    /* D220 80146E18 21204701 */   addu      $a0, $t2, $a3
    /* D224 80146E1C 21109001 */  addu       $v0, $t4, $s0
    /* D228 80146E20 21104201 */  addu       $v0, $t2, $v0
    /* D22C 80146E24 00004294 */  lhu        $v0, 0x0($v0)
    /* D230 80146E28 00000000 */  nop
    /* D234 80146E2C 0E004F14 */  bne        $v0, $t7, .L80146E68
    /* D238 80146E30 00000000 */   nop
    /* D23C 80146E34 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D240 80146E38 21082500 */  addu       $at, $at, $a1
    /* D244 80146E3C 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* D248 80146E40 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D24C 80146E44 21082900 */  addu       $at, $at, $t1
    /* D250 80146E48 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* D254 80146E4C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D258 80146E50 21082500 */  addu       $at, $at, $a1
    /* D25C 80146E54 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* D260 80146E58 21100601 */  addu       $v0, $t0, $a2
    /* D264 80146E5C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D268 80146E60 21082200 */  addu       $at, $at, $v0
    /* D26C 80146E64 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
  .L80146E68:
    /* D270 80146E68 00008294 */  lhu        $v0, 0x0($a0)
    /* D274 80146E6C 00000000 */  nop
    /* D278 80146E70 10005914 */  bne        $v0, $t9, .L80146EB4
    /* D27C 80146E74 00000000 */   nop
    /* D280 80146E78 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D284 80146E7C 21082500 */  addu       $at, $at, $a1
    /* D288 80146E80 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* D28C 80146E84 21106601 */  addu       $v0, $t3, $a2
    /* D290 80146E88 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D294 80146E8C 21082200 */  addu       $at, $at, $v0
    /* D298 80146E90 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* D29C 80146E94 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D2A0 80146E98 21082500 */  addu       $at, $at, $a1
    /* D2A4 80146E9C 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* D2A8 80146EA0 21100601 */  addu       $v0, $t0, $a2
    /* D2AC 80146EA4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D2B0 80146EA8 21082200 */  addu       $at, $at, $v0
    /* D2B4 80146EAC 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* D2B8 80146EB0 00008294 */  lhu        $v0, 0x0($a0)
  .L80146EB4:
    /* D2BC 80146EB4 00000000 */  nop
    /* D2C0 80146EB8 0E004F14 */  bne        $v0, $t7, .L80146EF4
    /* D2C4 80146EBC 00000000 */   nop
    /* D2C8 80146EC0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D2CC 80146EC4 21082500 */  addu       $at, $at, $a1
    /* D2D0 80146EC8 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* D2D4 80146ECC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D2D8 80146ED0 21082900 */  addu       $at, $at, $t1
    /* D2DC 80146ED4 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* D2E0 80146ED8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D2E4 80146EDC 21082500 */  addu       $at, $at, $a1
    /* D2E8 80146EE0 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* D2EC 80146EE4 21100601 */  addu       $v0, $t0, $a2
    /* D2F0 80146EE8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D2F4 80146EEC 21082200 */  addu       $at, $at, $v0
    /* D2F8 80146EF0 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
  .L80146EF4:
    /* D2FC 80146EF4 00008394 */  lhu        $v1, 0x0($a0)
    /* D300 80146EF8 10000224 */  addiu      $v0, $zero, 0x10
    /* D304 80146EFC 14006214 */  bne        $v1, $v0, .L80146F50
    /* D308 80146F00 21106601 */   addu      $v0, $t3, $a2
    /* D30C 80146F04 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D310 80146F08 21082500 */  addu       $at, $at, $a1
    /* D314 80146F0C 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* D318 80146F10 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D31C 80146F14 21082200 */  addu       $at, $at, $v0
    /* D320 80146F18 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* D324 80146F1C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D328 80146F20 21082500 */  addu       $at, $at, $a1
    /* D32C 80146F24 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* D330 80146F28 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D334 80146F2C 21082900 */  addu       $at, $at, $t1
    /* D338 80146F30 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* D33C 80146F34 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D340 80146F38 21082500 */  addu       $at, $at, $a1
    /* D344 80146F3C 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* D348 80146F40 21100601 */  addu       $v0, $t0, $a2
    /* D34C 80146F44 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D350 80146F48 21082200 */  addu       $at, $at, $v0
    /* D354 80146F4C 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
  .L80146F50:
    /* D358 80146F50 00072925 */  addiu      $t1, $t1, 0x700
    /* D35C 80146F54 0007A524 */  addiu      $a1, $a1, 0x700
    /* D360 80146F58 0007C624 */  addiu      $a2, $a2, 0x700
    /* D364 80146F5C 6000E724 */  addiu      $a3, $a3, 0x60
    /* D368 80146F60 000F0227 */  addiu      $v0, $t8, 0xF00
    /* D36C 80146F64 2A10E200 */  slt        $v0, $a3, $v0
    /* D370 80146F68 90FF4014 */  bnez       $v0, .L80146DAC
    /* D374 80146F6C 60008C25 */   addiu     $t4, $t4, 0x60
    /* D378 80146F70 10000825 */  addiu      $t0, $t0, 0x10
    /* D37C 80146F74 0100AD25 */  addiu      $t5, $t5, 0x1
    /* D380 80146F78 2800A229 */  slti       $v0, $t5, 0x28
    /* D384 80146F7C 84FF4014 */  bnez       $v0, .L80146D90
    /* D388 80146F80 0200CE25 */   addiu     $t6, $t6, 0x2
    /* D38C 80146F84 0000B08F */  lw         $s0, 0x0($sp)
    /* D390 80146F88 0800BD27 */  addiu      $sp, $sp, 0x8
    /* D394 80146F8C 0800E003 */  jr         $ra
    /* D398 80146F90 00000000 */   nop
endlabel DRLG_L2TransFix__Fv
