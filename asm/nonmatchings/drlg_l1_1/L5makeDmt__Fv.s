.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5makeDmt__Fv, 0xE8

glabel L5makeDmt__Fv
    /* 4090 8013DC88 21400000 */  addu       $t0, $zero, $zero
    /* 4094 8013DC8C 0E80063C */  lui        $a2, %hi(dungeon)
    /* 4098 8013DC90 C440C624 */  addiu      $a2, $a2, %lo(dungeon)
    /* 409C 8013DC94 16000524 */  addiu      $a1, $zero, 0x16
    /* 40A0 8013DC98 21380000 */  addu       $a3, $zero, $zero
  .L8013DC9C:
    /* 40A4 8013DC9C 40200800 */  sll        $a0, $t0, 1
    /* 40A8 8013DCA0 2118C000 */  addu       $v1, $a2, $zero
  .L8013DCA4:
    /* 40AC 8013DCA4 21108300 */  addu       $v0, $a0, $v1
    /* 40B0 8013DCA8 000045A4 */  sh         $a1, 0x0($v0)
    /* 40B4 8013DCAC 0100E724 */  addiu      $a3, $a3, 0x1
    /* 40B8 8013DCB0 2F00E228 */  slti       $v0, $a3, 0x2F
    /* 40BC 8013DCB4 FBFF4014 */  bnez       $v0, .L8013DCA4
    /* 40C0 8013DCB8 60006324 */   addiu     $v1, $v1, 0x60
    /* 40C4 8013DCBC 01000825 */  addiu      $t0, $t0, 0x1
    /* 40C8 8013DCC0 2F000229 */  slti       $v0, $t0, 0x2F
    /* 40CC 8013DCC4 F5FF4014 */  bnez       $v0, .L8013DC9C
    /* 40D0 8013DCC8 21380000 */   addu      $a3, $zero, $zero
    /* 40D4 8013DCCC 21600000 */  addu       $t4, $zero, $zero
    /* 40D8 8013DCD0 01000824 */  addiu      $t0, $zero, 0x1
    /* 40DC 8013DCD4 14800E3C */  lui        $t6, %hi(L5dungeon)
    /* 40E0 8013DCD8 B0A3CE25 */  addiu      $t6, $t6, %lo(L5dungeon)
    /* 40E4 8013DCDC 5000D825 */  addiu      $t8, $t6, 0x50
    /* 40E8 8013DCE0 0E800F3C */  lui        $t7, %hi(dungeon)
    /* 40EC 8013DCE4 C440EF25 */  addiu      $t7, $t7, %lo(dungeon)
  .L8013DCE8:
    /* 40F0 8013DCE8 01000724 */  addiu      $a3, $zero, 0x1
    /* 40F4 8013DCEC 40680C00 */  sll        $t5, $t4, 1
    /* 40F8 8013DCF0 50000B27 */  addiu      $t3, $t8, 0x50
    /* 40FC 8013DCF4 5000CA25 */  addiu      $t2, $t6, 0x50
    /* 4100 8013DCF8 2148E001 */  addu       $t1, $t7, $zero
  .L8013DCFC:
    /* 4104 8013DCFC 2130A901 */  addu       $a2, $t5, $t1
    /* 4108 8013DD00 60002925 */  addiu      $t1, $t1, 0x60
    /* 410C 8013DD04 21286801 */  addu       $a1, $t3, $t0
    /* 4110 8013DD08 A0006B25 */  addiu      $t3, $t3, 0xA0
    /* 4114 8013DD0C 21204801 */  addu       $a0, $t2, $t0
    /* 4118 8013DD10 0000A390 */  lbu        $v1, 0x0($a1)
    /* 411C 8013DD14 00008290 */  lbu        $v0, 0x0($a0)
    /* 4120 8013DD18 01008490 */  lbu        $a0, 0x1($a0)
    /* 4124 8013DD1C 40180300 */  sll        $v1, $v1, 1
    /* 4128 8013DD20 21104300 */  addu       $v0, $v0, $v1
    /* 412C 8013DD24 80200400 */  sll        $a0, $a0, 2
    /* 4130 8013DD28 0100A390 */  lbu        $v1, 0x1($a1)
    /* 4134 8013DD2C 21104400 */  addu       $v0, $v0, $a0
    /* 4138 8013DD30 C0180300 */  sll        $v1, $v1, 3
    /* 413C 8013DD34 21104300 */  addu       $v0, $v0, $v1
    /* 4140 8013DD38 1480013C */  lui        $at, %hi(L5ConvTbl)
    /* 4144 8013DD3C 21082200 */  addu       $at, $at, $v0
    /* 4148 8013DD40 589C2290 */  lbu        $v0, %lo(L5ConvTbl)($at)
    /* 414C 8013DD44 0200E724 */  addiu      $a3, $a3, 0x2
    /* 4150 8013DD48 0000C2A4 */  sh         $v0, 0x0($a2)
    /* 4154 8013DD4C 4E00E228 */  slti       $v0, $a3, 0x4E
    /* 4158 8013DD50 EAFF4014 */  bnez       $v0, .L8013DCFC
    /* 415C 8013DD54 A0004A25 */   addiu     $t2, $t2, 0xA0
    /* 4160 8013DD58 02000825 */  addiu      $t0, $t0, 0x2
    /* 4164 8013DD5C 4E000229 */  slti       $v0, $t0, 0x4E
    /* 4168 8013DD60 E1FF4014 */  bnez       $v0, .L8013DCE8
    /* 416C 8013DD64 01008C25 */   addiu     $t4, $t4, 0x1
    /* 4170 8013DD68 0800E003 */  jr         $ra
    /* 4174 8013DD6C 00000000 */   nop
endlabel L5makeDmt__Fv
