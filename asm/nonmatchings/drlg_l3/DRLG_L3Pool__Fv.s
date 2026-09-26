.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3Pool__Fv, 0x250

glabel DRLG_L3Pool__Fv
    /* 1105C 8014AC54 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 11060 8014AC58 2000B2AF */  sw         $s2, 0x20($sp)
    /* 11064 8014AC5C 21900000 */  addu       $s2, $zero, $zero
    /* 11068 8014AC60 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1106C 8014AC64 0E80163C */  lui        $s6, %hi(dungeon)
    /* 11070 8014AC68 C440D626 */  addiu      $s6, $s6, %lo(dungeon)
    /* 11074 8014AC6C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 11078 8014AC70 01001524 */  addiu      $s5, $zero, 0x1
    /* 1107C 8014AC74 3400BFAF */  sw         $ra, 0x34($sp)
    /* 11080 8014AC78 2800B4AF */  sw         $s4, 0x28($sp)
    /* 11084 8014AC7C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 11088 8014AC80 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1108C 8014AC84 1800B0AF */  sw         $s0, 0x18($sp)
    /* 11090 8014AC88 21880000 */  addu       $s1, $zero, $zero
  .L8014AC8C:
    /* 11094 8014AC8C 01005426 */  addiu      $s4, $s2, 0x1
    /* 11098 8014AC90 2198C002 */  addu       $s3, $s6, $zero
  .L8014AC94:
    /* 1109C 8014AC94 40101200 */  sll        $v0, $s2, 1
    /* 110A0 8014AC98 21285300 */  addu       $a1, $v0, $s3
    /* 110A4 8014AC9C 0000A494 */  lhu        $a0, 0x0($a1)
    /* 110A8 8014ACA0 08000224 */  addiu      $v0, $zero, 0x8
    /* 110AC 8014ACA4 FFFF8330 */  andi       $v1, $a0, 0xFFFF
    /* 110B0 8014ACA8 6B006214 */  bne        $v1, $v0, .L8014AE58
    /* 110B4 8014ACAC 80008234 */   ori       $v0, $a0, 0x80
    /* 110B8 8014ACB0 01002426 */  addiu      $a0, $s1, 0x1
    /* 110BC 8014ACB4 0000A2A4 */  sh         $v0, 0x0($a1)
    /* 110C0 8014ACB8 28008228 */  slti       $v0, $a0, 0x28
    /* 110C4 8014ACBC 06004010 */  beqz       $v0, .L8014ACD8
    /* 110C8 8014ACC0 1000B5AF */   sw        $s5, 0x10($sp)
    /* 110CC 8014ACC4 21284002 */  addu       $a1, $s2, $zero
    /* 110D0 8014ACC8 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 110D4 8014ACCC 1000A627 */   addiu     $a2, $sp, 0x10
    /* 110D8 8014ACD0 372B0508 */  j          .L8014ACDC
    /* 110DC 8014ACD4 21804000 */   addu      $s0, $v0, $zero
  .L8014ACD8:
    /* 110E0 8014ACD8 01001024 */  addiu      $s0, $zero, 0x1
  .L8014ACDC:
    /* 110E4 8014ACDC FFFF2426 */  addiu      $a0, $s1, -0x1
    /* 110E8 8014ACE0 08008018 */  blez       $a0, .L8014AD04
    /* 110EC 8014ACE4 00000000 */   nop
    /* 110F0 8014ACE8 07000016 */  bnez       $s0, .L8014AD08
    /* 110F4 8014ACEC 01001024 */   addiu     $s0, $zero, 0x1
    /* 110F8 8014ACF0 21284002 */  addu       $a1, $s2, $zero
    /* 110FC 8014ACF4 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 11100 8014ACF8 1000A627 */   addiu     $a2, $sp, 0x10
    /* 11104 8014ACFC 422B0508 */  j          .L8014AD08
    /* 11108 8014AD00 21804000 */   addu      $s0, $v0, $zero
  .L8014AD04:
    /* 1110C 8014AD04 01001024 */  addiu      $s0, $zero, 0x1
  .L8014AD08:
    /* 11110 8014AD08 2800822A */  slti       $v0, $s4, 0x28
    /* 11114 8014AD0C 09004010 */  beqz       $v0, .L8014AD34
    /* 11118 8014AD10 00000000 */   nop
    /* 1111C 8014AD14 08000016 */  bnez       $s0, .L8014AD38
    /* 11120 8014AD18 01001024 */   addiu     $s0, $zero, 0x1
    /* 11124 8014AD1C 21202002 */  addu       $a0, $s1, $zero
    /* 11128 8014AD20 21288002 */  addu       $a1, $s4, $zero
    /* 1112C 8014AD24 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 11130 8014AD28 1000A627 */   addiu     $a2, $sp, 0x10
    /* 11134 8014AD2C 4E2B0508 */  j          .L8014AD38
    /* 11138 8014AD30 21804000 */   addu      $s0, $v0, $zero
  .L8014AD34:
    /* 1113C 8014AD34 01001024 */  addiu      $s0, $zero, 0x1
  .L8014AD38:
    /* 11140 8014AD38 FFFF4526 */  addiu      $a1, $s2, -0x1
    /* 11144 8014AD3C 0800A018 */  blez       $a1, .L8014AD60
    /* 11148 8014AD40 00000000 */   nop
    /* 1114C 8014AD44 07000016 */  bnez       $s0, .L8014AD64
    /* 11150 8014AD48 01001024 */   addiu     $s0, $zero, 0x1
    /* 11154 8014AD4C 21202002 */  addu       $a0, $s1, $zero
    /* 11158 8014AD50 922A050C */  jal        DRLG_L3Spawn__FiiPi
    /* 1115C 8014AD54 1000A627 */   addiu     $a2, $sp, 0x10
    /* 11160 8014AD58 592B0508 */  j          .L8014AD64
    /* 11164 8014AD5C 21804000 */   addu      $s0, $v0, $zero
  .L8014AD60:
    /* 11168 8014AD60 01001024 */  addiu      $s0, $zero, 0x1
  .L8014AD64:
    /* 1116C 8014AD64 C9F6000C */  jal        ENG_random__Fl
    /* 11170 8014AD68 64000424 */   addiu     $a0, $zero, 0x64
    /* 11174 8014AD6C 1000A38F */  lw         $v1, 0x10($sp)
    /* 11178 8014AD70 21204000 */  addu       $a0, $v0, $zero
    /* 1117C 8014AD74 23404302 */  subu       $t0, $s2, $v1
    /* 11180 8014AD78 21104302 */  addu       $v0, $s2, $v1
    /* 11184 8014AD7C 2A100201 */  slt        $v0, $t0, $v0
    /* 11188 8014AD80 35004010 */  beqz       $v0, .L8014AE58
    /* 1118C 8014AD84 00000000 */   nop
    /* 11190 8014AD88 19008B28 */  slti       $t3, $a0, 0x19
  .L8014AD8C:
    /* 11194 8014AD8C 21306000 */  addu       $a2, $v1, $zero
    /* 11198 8014AD90 23202302 */  subu       $a0, $s1, $v1
    /* 1119C 8014AD94 21102602 */  addu       $v0, $s1, $a2
    /* 111A0 8014AD98 2A108200 */  slt        $v0, $a0, $v0
    /* 111A4 8014AD9C 28004010 */  beqz       $v0, .L8014AE40
    /* 111A8 8014ADA0 40100400 */   sll       $v0, $a0, 1
    /* 111AC 8014ADA4 40500800 */  sll        $t2, $t0, 1
    /* 111B0 8014ADA8 2800092D */  sltiu      $t1, $t0, 0x28
    /* 111B4 8014ADAC 21104400 */  addu       $v0, $v0, $a0
    /* 111B8 8014ADB0 40110200 */  sll        $v0, $v0, 5
    /* 111BC 8014ADB4 21385600 */  addu       $a3, $v0, $s6
  .L8014ADB8:
    /* 111C0 8014ADB8 21284701 */  addu       $a1, $t2, $a3
    /* 111C4 8014ADBC 0000A394 */  lhu        $v1, 0x0($a1)
    /* 111C8 8014ADC0 00000000 */  nop
    /* 111CC 8014ADC4 80006230 */  andi       $v0, $v1, 0x80
    /* 111D0 8014ADC8 17004010 */  beqz       $v0, .L8014AE28
    /* 111D4 8014ADCC 00000000 */   nop
    /* 111D8 8014ADD0 15002011 */  beqz       $t1, .L8014AE28
    /* 111DC 8014ADD4 2800822C */   sltiu     $v0, $a0, 0x28
    /* 111E0 8014ADD8 13004010 */  beqz       $v0, .L8014AE28
    /* 111E4 8014ADDC 7F006330 */   andi      $v1, $v1, 0x7F
    /* 111E8 8014ADE0 0500C228 */  slti       $v0, $a2, 0x5
    /* 111EC 8014ADE4 10004014 */  bnez       $v0, .L8014AE28
    /* 111F0 8014ADE8 0000A3A4 */   sh        $v1, 0x0($a1)
    /* 111F4 8014ADEC 0E006011 */  beqz       $t3, .L8014AE28
    /* 111F8 8014ADF0 00000000 */   nop
    /* 111FC 8014ADF4 0C000016 */  bnez       $s0, .L8014AE28
    /* 11200 8014ADF8 00000000 */   nop
    /* 11204 8014ADFC 1580013C */  lui        $at, %hi(poolsub)
    /* 11208 8014AE00 21082300 */  addu       $at, $at, $v1
    /* 1120C 8014AE04 D4862390 */  lbu        $v1, %lo(poolsub)($at)
    /* 11210 8014AE08 00000000 */  nop
    /* 11214 8014AE0C FF006230 */  andi       $v0, $v1, 0xFF
    /* 11218 8014AE10 04004010 */  beqz       $v0, .L8014AE24
    /* 1121C 8014AE14 2600422C */   sltiu     $v0, $v0, 0x26
    /* 11220 8014AE18 02004010 */  beqz       $v0, .L8014AE24
    /* 11224 8014AE1C 00000000 */   nop
    /* 11228 8014AE20 0000A3A4 */  sh         $v1, 0x0($a1)
  .L8014AE24:
    /* 1122C 8014AE24 642195A3 */  sb         $s5, %gp_rel(D_8011C8E4)($gp)
  .L8014AE28:
    /* 11230 8014AE28 1000A68F */  lw         $a2, 0x10($sp)
    /* 11234 8014AE2C 01008424 */  addiu      $a0, $a0, 0x1
    /* 11238 8014AE30 21102602 */  addu       $v0, $s1, $a2
    /* 1123C 8014AE34 2A108200 */  slt        $v0, $a0, $v0
    /* 11240 8014AE38 DFFF4014 */  bnez       $v0, .L8014ADB8
    /* 11244 8014AE3C 6000E724 */   addiu     $a3, $a3, 0x60
  .L8014AE40:
    /* 11248 8014AE40 1000A38F */  lw         $v1, 0x10($sp)
    /* 1124C 8014AE44 01000825 */  addiu      $t0, $t0, 0x1
    /* 11250 8014AE48 21104302 */  addu       $v0, $s2, $v1
    /* 11254 8014AE4C 2A100201 */  slt        $v0, $t0, $v0
    /* 11258 8014AE50 CEFF4014 */  bnez       $v0, .L8014AD8C
    /* 1125C 8014AE54 00000000 */   nop
  .L8014AE58:
    /* 11260 8014AE58 01003126 */  addiu      $s1, $s1, 0x1
    /* 11264 8014AE5C 2800222A */  slti       $v0, $s1, 0x28
    /* 11268 8014AE60 8CFF4014 */  bnez       $v0, .L8014AC94
    /* 1126C 8014AE64 60007326 */   addiu     $s3, $s3, 0x60
    /* 11270 8014AE68 01005226 */  addiu      $s2, $s2, 0x1
    /* 11274 8014AE6C 2800422A */  slti       $v0, $s2, 0x28
    /* 11278 8014AE70 86FF4014 */  bnez       $v0, .L8014AC8C
    /* 1127C 8014AE74 21880000 */   addu      $s1, $zero, $zero
    /* 11280 8014AE78 3400BF8F */  lw         $ra, 0x34($sp)
    /* 11284 8014AE7C 3000B68F */  lw         $s6, 0x30($sp)
    /* 11288 8014AE80 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1128C 8014AE84 2800B48F */  lw         $s4, 0x28($sp)
    /* 11290 8014AE88 2400B38F */  lw         $s3, 0x24($sp)
    /* 11294 8014AE8C 2000B28F */  lw         $s2, 0x20($sp)
    /* 11298 8014AE90 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1129C 8014AE94 1800B08F */  lw         $s0, 0x18($sp)
    /* 112A0 8014AE98 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 112A4 8014AE9C 0800E003 */  jr         $ra
    /* 112A8 8014AEA0 00000000 */   nop
endlabel DRLG_L3Pool__Fv
