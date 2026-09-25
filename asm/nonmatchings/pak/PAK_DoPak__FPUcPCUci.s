.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PAK_DoPak__FPUcPCUci, 0x240

glabel PAK_DoPak__FPUcPCUci
    /* 9E084 800AE084 A0FDBD27 */  addiu      $sp, $sp, -0x260
    /* 9E088 800AE088 5802BEAF */  sw         $fp, 0x258($sp)
    /* 9E08C 800AE08C 21F0A000 */  addu       $fp, $a1, $zero
    /* 9E090 800AE090 0000C293 */  lbu        $v0, 0x0($fp)
    /* 9E094 800AE094 0100C393 */  lbu        $v1, 0x1($fp)
    /* 9E098 800AE098 2802A6AF */  sw         $a2, 0x228($sp)
    /* 9E09C 800AE09C 2802A78F */  lw         $a3, 0x228($sp)
    /* 9E0A0 800AE0A0 4C02B5AF */  sw         $s5, 0x24C($sp)
    /* 9E0A4 800AE0A4 01001524 */  addiu      $s5, $zero, 0x1
    /* 9E0A8 800AE0A8 1402A0AF */  sw         $zero, 0x214($sp)
    /* 9E0AC 800AE0AC 1402B5AF */  sw         $s5, 0x214($sp)
    /* 9E0B0 800AE0B0 02001524 */  addiu      $s5, $zero, 0x2
    /* 9E0B4 800AE0B4 5C02BFAF */  sw         $ra, 0x25C($sp)
    /* 9E0B8 800AE0B8 5402B7AF */  sw         $s7, 0x254($sp)
    /* 9E0BC 800AE0BC 5002B6AF */  sw         $s6, 0x250($sp)
    /* 9E0C0 800AE0C0 4802B4AF */  sw         $s4, 0x248($sp)
    /* 9E0C4 800AE0C4 4402B3AF */  sw         $s3, 0x244($sp)
    /* 9E0C8 800AE0C8 4002B2AF */  sw         $s2, 0x240($sp)
    /* 9E0CC 800AE0CC 3C02B1AF */  sw         $s1, 0x23C($sp)
    /* 9E0D0 800AE0D0 3802B0AF */  sw         $s0, 0x238($sp)
    /* 9E0D4 800AE0D4 1C02A4AF */  sw         $a0, 0x21C($sp)
    /* 9E0D8 800AE0D8 2002A0AF */  sw         $zero, 0x220($sp)
    /* 9E0DC 800AE0DC 1002A0A3 */  sb         $zero, 0x210($sp)
    /* 9E0E0 800AE0E0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 9E0E4 800AE0E4 2A10A702 */  slt        $v0, $s5, $a3
    /* 9E0E8 800AE0E8 60004010 */  beqz       $v0, .L800AE26C
    /* 9E0EC 800AE0EC 1400A3AF */   sw        $v1, 0x14($sp)
    /* 9E0F0 800AE0F0 1000A727 */  addiu      $a3, $sp, 0x10
    /* 9E0F4 800AE0F4 3002A7AF */  sw         $a3, 0x230($sp)
    /* 9E0F8 800AE0F8 23181500 */  negu       $v1, $s5
    /* 9E0FC 800AE0FC 2802A78F */  lw         $a3, 0x228($sp)
  .L800AE100:
    /* 9E100 800AE100 80FF6228 */  slti       $v0, $v1, -0x80
    /* 9E104 800AE104 02004010 */  beqz       $v0, .L800AE110
    /* 9E108 800AE108 2398F500 */   subu      $s3, $a3, $s5
    /* 9E10C 800AE10C 80FF0324 */  addiu      $v1, $zero, -0x80
  .L800AE110:
    /* 9E110 800AE110 FF000724 */  addiu      $a3, $zero, 0xFF
    /* 9E114 800AE114 2A10F300 */  slt        $v0, $a3, $s3
    /* 9E118 800AE118 02004010 */  beqz       $v0, .L800AE124
    /* 9E11C 800AE11C 21B86000 */   addu      $s7, $v1, $zero
    /* 9E120 800AE120 FF001324 */  addiu      $s3, $zero, 0xFF
  .L800AE124:
    /* 9E124 800AE124 01001124 */  addiu      $s1, $zero, 0x1
    /* 9E128 800AE128 2110B702 */  addu       $v0, $s5, $s7
    /* 9E12C 800AE12C 2190C203 */  addu       $s2, $fp, $v0
    /* 9E130 800AE130 21A0E002 */  addu       $s4, $s7, $zero
    /* 9E134 800AE134 2800E106 */  bgez       $s7, .L800AE1D8
    /* 9E138 800AE138 21B0D503 */   addu      $s6, $fp, $s5
  .L800AE13C:
    /* 9E13C 800AE13C 00004392 */  lbu        $v1, 0x0($s2)
    /* 9E140 800AE140 0000C292 */  lbu        $v0, 0x0($s6)
    /* 9E144 800AE144 00000000 */  nop
    /* 9E148 800AE148 1C006214 */  bne        $v1, $v0, .L800AE1BC
    /* 9E14C 800AE14C 2A103302 */   slt       $v0, $s1, $s3
    /* 9E150 800AE150 21204002 */  addu       $a0, $s2, $zero
    /* 9E154 800AE154 01003026 */  addiu      $s0, $s1, 0x1
    /* 9E158 800AE158 2128C002 */  addu       $a1, $s6, $zero
    /* 9E15C 800AE15C DB69000C */  jal        memcmp
    /* 9E160 800AE160 21300002 */   addu      $a2, $s0, $zero
    /* 9E164 800AE164 15004014 */  bnez       $v0, .L800AE1BC
    /* 9E168 800AE168 2A103302 */   slt       $v0, $s1, $s3
    /* 9E16C 800AE16C 21880002 */  addu       $s1, $s0, $zero
    /* 9E170 800AE170 21285102 */  addu       $a1, $s2, $s1
    /* 9E174 800AE174 2120D102 */  addu       $a0, $s6, $s1
    /* 9E178 800AE178 0000A390 */  lbu        $v1, 0x0($a1)
    /* 9E17C 800AE17C 00008290 */  lbu        $v0, 0x0($a0)
    /* 9E180 800AE180 00000000 */  nop
    /* 9E184 800AE184 0C006214 */  bne        $v1, $v0, .L800AE1B8
    /* 9E188 800AE188 21B88002 */   addu      $s7, $s4, $zero
    /* 9E18C 800AE18C 0100A524 */  addiu      $a1, $a1, 0x1
  .L800AE190:
    /* 9E190 800AE190 01003126 */  addiu      $s1, $s1, 0x1
    /* 9E194 800AE194 2A103302 */  slt        $v0, $s1, $s3
    /* 9E198 800AE198 0A004010 */  beqz       $v0, .L800AE1C4
    /* 9E19C 800AE19C 01008424 */   addiu     $a0, $a0, 0x1
    /* 9E1A0 800AE1A0 0000A390 */  lbu        $v1, 0x0($a1)
    /* 9E1A4 800AE1A4 00008290 */  lbu        $v0, 0x0($a0)
    /* 9E1A8 800AE1A8 00000000 */  nop
    /* 9E1AC 800AE1AC F8FF6210 */  beq        $v1, $v0, .L800AE190
    /* 9E1B0 800AE1B0 0100A524 */   addiu     $a1, $a1, 0x1
    /* 9E1B4 800AE1B4 FFFFA524 */  addiu      $a1, $a1, -0x1
  .L800AE1B8:
    /* 9E1B8 800AE1B8 2A103302 */  slt        $v0, $s1, $s3
  .L800AE1BC:
    /* 9E1BC 800AE1BC 03004014 */  bnez       $v0, .L800AE1CC
    /* 9E1C0 800AE1C0 00000000 */   nop
  .L800AE1C4:
    /* 9E1C4 800AE1C4 76B80208 */  j          .L800AE1D8
    /* 9E1C8 800AE1C8 21886002 */   addu      $s1, $s3, $zero
  .L800AE1CC:
    /* 9E1CC 800AE1CC 01009426 */  addiu      $s4, $s4, 0x1
    /* 9E1D0 800AE1D0 DAFF8006 */  bltz       $s4, .L800AE13C
    /* 9E1D4 800AE1D4 01005226 */   addiu     $s2, $s2, 0x1
  .L800AE1D8:
    /* 9E1D8 800AE1D8 0300222A */  slti       $v0, $s1, 0x3
    /* 9E1DC 800AE1DC 17004010 */  beqz       $v0, .L800AE23C
    /* 9E1E0 800AE1E0 00000000 */   nop
    /* 9E1E4 800AE1E4 1002A293 */  lbu        $v0, 0x210($sp)
    /* 9E1E8 800AE1E8 00000000 */  nop
    /* 9E1EC 800AE1EC 06004014 */  bnez       $v0, .L800AE208
    /* 9E1F0 800AE1F0 00000000 */   nop
    /* 9E1F4 800AE1F4 1402A28F */  lw         $v0, 0x214($sp)
    /* 9E1F8 800AE1F8 00000000 */  nop
    /* 9E1FC 800AE1FC 7F004228 */  slti       $v0, $v0, 0x7F
    /* 9E200 800AE200 04004014 */  bnez       $v0, .L800AE214
    /* 9E204 800AE204 2110D503 */   addu      $v0, $fp, $s5
  .L800AE208:
    /* 9E208 800AE208 E7B7020C */  jal        writeblock__FP5block
    /* 9E20C 800AE20C 1000A427 */   addiu     $a0, $sp, 0x10
    /* 9E210 800AE210 2110D503 */  addu       $v0, $fp, $s5
  .L800AE214:
    /* 9E214 800AE214 0100B526 */  addiu      $s5, $s5, 0x1
    /* 9E218 800AE218 1402A38F */  lw         $v1, 0x214($sp)
    /* 9E21C 800AE21C 00004290 */  lbu        $v0, 0x0($v0)
    /* 9E220 800AE220 3002A78F */  lw         $a3, 0x230($sp)
    /* 9E224 800AE224 01006324 */  addiu      $v1, $v1, 0x1
    /* 9E228 800AE228 1402A3AF */  sw         $v1, 0x214($sp)
    /* 9E22C 800AE22C 80180300 */  sll        $v1, $v1, 2
    /* 9E230 800AE230 21186700 */  addu       $v1, $v1, $a3
    /* 9E234 800AE234 96B80208 */  j          .L800AE258
    /* 9E238 800AE238 000062AC */   sw        $v0, 0x0($v1)
  .L800AE23C:
    /* 9E23C 800AE23C E7B7020C */  jal        writeblock__FP5block
    /* 9E240 800AE240 1000A427 */   addiu     $a0, $sp, 0x10
    /* 9E244 800AE244 21A8B102 */  addu       $s5, $s5, $s1
    /* 9E248 800AE248 01000224 */  addiu      $v0, $zero, 0x1
    /* 9E24C 800AE24C 1002A2A3 */  sb         $v0, 0x210($sp)
    /* 9E250 800AE250 1402B1AF */  sw         $s1, 0x214($sp)
    /* 9E254 800AE254 1802B7AF */  sw         $s7, 0x218($sp)
  .L800AE258:
    /* 9E258 800AE258 2802A78F */  lw         $a3, 0x228($sp)
    /* 9E25C 800AE25C 00000000 */  nop
    /* 9E260 800AE260 2A10A702 */  slt        $v0, $s5, $a3
    /* 9E264 800AE264 A6FF4014 */  bnez       $v0, .L800AE100
    /* 9E268 800AE268 23181500 */   negu      $v1, $s5
  .L800AE26C:
    /* 9E26C 800AE26C E7B7020C */  jal        writeblock__FP5block
    /* 9E270 800AE270 1000A427 */   addiu     $a0, $sp, 0x10
    /* 9E274 800AE274 1000A427 */  addiu      $a0, $sp, 0x10
    /* 9E278 800AE278 01000224 */  addiu      $v0, $zero, 0x1
    /* 9E27C 800AE27C 1002A2A3 */  sb         $v0, 0x210($sp)
    /* 9E280 800AE280 1402A0AF */  sw         $zero, 0x214($sp)
    /* 9E284 800AE284 E7B7020C */  jal        writeblock__FP5block
    /* 9E288 800AE288 1802A0AF */   sw        $zero, 0x218($sp)
    /* 9E28C 800AE28C 2002A28F */  lw         $v0, 0x220($sp)
    /* 9E290 800AE290 5C02BF8F */  lw         $ra, 0x25C($sp)
    /* 9E294 800AE294 5802BE8F */  lw         $fp, 0x258($sp)
    /* 9E298 800AE298 5402B78F */  lw         $s7, 0x254($sp)
    /* 9E29C 800AE29C 5002B68F */  lw         $s6, 0x250($sp)
    /* 9E2A0 800AE2A0 4C02B58F */  lw         $s5, 0x24C($sp)
    /* 9E2A4 800AE2A4 4802B48F */  lw         $s4, 0x248($sp)
    /* 9E2A8 800AE2A8 4402B38F */  lw         $s3, 0x244($sp)
    /* 9E2AC 800AE2AC 4002B28F */  lw         $s2, 0x240($sp)
    /* 9E2B0 800AE2B0 3C02B18F */  lw         $s1, 0x23C($sp)
    /* 9E2B4 800AE2B4 3802B08F */  lw         $s0, 0x238($sp)
    /* 9E2B8 800AE2B8 6002BD27 */  addiu      $sp, $sp, 0x260
    /* 9E2BC 800AE2BC 0800E003 */  jr         $ra
    /* 9E2C0 800AE2C0 00000000 */   nop
endlabel PAK_DoPak__FPUcPCUci
