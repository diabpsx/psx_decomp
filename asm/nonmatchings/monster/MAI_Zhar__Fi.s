.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Zhar__Fi, 0x1FC

glabel MAI_Zhar__Fi
    /* 1A188 80153D80 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1A18C 80153D84 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1A190 80153D88 21988000 */  addu       $s3, $a0, $zero
    /* 1A194 80153D8C 40101300 */  sll        $v0, $s3, 1
    /* 1A198 80153D90 21105300 */  addu       $v0, $v0, $s3
    /* 1A19C 80153D94 80100200 */  sll        $v0, $v0, 2
    /* 1A1A0 80153D98 21105300 */  addu       $v0, $v0, $s3
    /* 1A1A4 80153D9C C0100200 */  sll        $v0, $v0, 3
    /* 1A1A8 80153DA0 1080033C */  lui        $v1, %hi(monster)
    /* 1A1AC 80153DA4 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 1A1B0 80153DA8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1A1B4 80153DAC 21884300 */  addu       $s1, $v0, $v1
    /* 1A1B8 80153DB0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1A1BC 80153DB4 34003082 */  lb         $s0, 0x34($s1)
    /* 1A1C0 80153DB8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1A1C4 80153DBC 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1A1C8 80153DC0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1A1CC 80153DC4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1A1D0 80153DC8 33002282 */  lb         $v0, 0x33($s1)
    /* 1A1D4 80153DCC 35003282 */  lb         $s2, 0x35($s1)
    /* 1A1D8 80153DD0 60004014 */  bnez       $v0, .L80153F54
    /* 1A1DC 80153DD4 00000000 */   nop
    /* 1A1E0 80153DD8 EB2A050C */  jal        M_GetDir__Fi
    /* 1A1E4 80153DDC 00000000 */   nop
    /* 1A1E8 80153DE0 21A84000 */  addu       $s5, $v0, $zero
    /* 1A1EC 80153DE4 0000238E */  lw         $v1, 0x0($s1)
    /* 1A1F0 80153DE8 94000224 */  addiu      $v0, $zero, 0x94
    /* 1A1F4 80153DEC 15006214 */  bne        $v1, $v0, .L80153E44
    /* 1A1F8 80153DF0 C0101200 */   sll       $v0, $s2, 3
    /* 1A1FC 80153DF4 C0181000 */  sll        $v1, $s0, 3
    /* 1A200 80153DF8 23187000 */  subu       $v1, $v1, $s0
    /* 1A204 80153DFC C0190300 */  sll        $v1, $v1, 7
    /* 1A208 80153E00 21104300 */  addu       $v0, $v0, $v1
    /* 1A20C 80153E04 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1A210 80153E08 21082200 */  addu       $at, $at, $v0
    /* 1A214 80153E0C 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1A218 80153E10 00000000 */  nop
    /* 1A21C 80153E14 04004230 */  andi       $v0, $v0, 0x4
    /* 1A220 80153E18 15004014 */  bnez       $v0, .L80153E70
    /* 1A224 80153E1C 07000224 */   addiu     $v0, $zero, 0x7
    /* 1A228 80153E20 49002392 */  lbu        $v1, 0x49($s1)
    /* 1A22C 80153E24 00000000 */  nop
    /* 1A230 80153E28 06006214 */  bne        $v1, $v0, .L80153E44
    /* 1A234 80153E2C C0101200 */   sll       $v0, $s2, 3
    /* 1A238 80153E30 95000224 */  addiu      $v0, $zero, 0x95
    /* 1A23C 80153E34 000022AE */  sw         $v0, 0x0($s1)
    /* 1A240 80153E38 06000224 */  addiu      $v0, $zero, 0x6
    /* 1A244 80153E3C 490022A2 */  sb         $v0, 0x49($s1)
    /* 1A248 80153E40 C0101200 */  sll        $v0, $s2, 3
  .L80153E44:
    /* 1A24C 80153E44 C0181000 */  sll        $v1, $s0, 3
    /* 1A250 80153E48 23187000 */  subu       $v1, $v1, $s0
    /* 1A254 80153E4C C0190300 */  sll        $v1, $v1, 7
    /* 1A258 80153E50 21104300 */  addu       $v0, $v0, $v1
    /* 1A25C 80153E54 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1A260 80153E58 21082200 */  addu       $at, $at, $v0
    /* 1A264 80153E5C 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1A268 80153E60 00000000 */  nop
    /* 1A26C 80153E64 04004230 */  andi       $v0, $v0, 0x4
    /* 1A270 80153E68 22004010 */  beqz       $v0, .L80153EF4
    /* 1A274 80153E6C 00000000 */   nop
  .L80153E70:
    /* 1A278 80153E70 4A002292 */  lbu        $v0, 0x4A($s1)
    /* 1A27C 80153E74 00000000 */  nop
    /* 1A280 80153E78 23A00202 */  subu       $s4, $s0, $v0
    /* 1A284 80153E7C 4B002292 */  lbu        $v0, 0x4B($s1)
    /* 1A288 80153E80 21208002 */  addu       $a0, $s4, $zero
    /* 1A28C 80153E84 6D41000C */  jal        abs
    /* 1A290 80153E88 23904202 */   subu      $s2, $s2, $v0
    /* 1A294 80153E8C 21204002 */  addu       $a0, $s2, $zero
    /* 1A298 80153E90 6D41000C */  jal        abs
    /* 1A29C 80153E94 21804000 */   addu      $s0, $v0, $zero
    /* 1A2A0 80153E98 2A105000 */  slt        $v0, $v0, $s0
    /* 1A2A4 80153E9C 02004014 */  bnez       $v0, .L80153EA8
    /* 1A2A8 80153EA0 21208002 */   addu      $a0, $s4, $zero
    /* 1A2AC 80153EA4 21204002 */  addu       $a0, $s2, $zero
  .L80153EA8:
    /* 1A2B0 80153EA8 6D41000C */  jal        abs
    /* 1A2B4 80153EAC 00000000 */   nop
    /* 1A2B8 80153EB0 0000238E */  lw         $v1, 0x0($s1)
    /* 1A2BC 80153EB4 95000224 */  addiu      $v0, $zero, 0x95
    /* 1A2C0 80153EB8 0E006214 */  bne        $v1, $v0, .L80153EF4
    /* 1A2C4 80153EBC 00000000 */   nop
    /* 1A2C8 80153EC0 CDF3000C */  jal        effect_is_playing__Fi
    /* 1A2CC 80153EC4 5B030424 */   addiu     $a0, $zero, 0x35B
    /* 1A2D0 80153EC8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1A2D4 80153ECC 09004014 */  bnez       $v0, .L80153EF4
    /* 1A2D8 80153ED0 07000224 */   addiu     $v0, $zero, 0x7
    /* 1A2DC 80153ED4 49002392 */  lbu        $v1, 0x49($s1)
    /* 1A2E0 80153ED8 00000000 */  nop
    /* 1A2E4 80153EDC 05006214 */  bne        $v1, $v0, .L80153EF4
    /* 1A2E8 80153EE0 01000224 */   addiu     $v0, $zero, 0x1
    /* 1A2EC 80153EE4 490022A2 */  sb         $v0, 0x49($s1)
    /* 1A2F0 80153EE8 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 1A2F4 80153EEC 4E0022A2 */  sb         $v0, 0x4E($s1)
    /* 1A2F8 80153EF0 000020AE */  sw         $zero, 0x0($s1)
  .L80153EF4:
    /* 1A2FC 80153EF4 49002392 */  lbu        $v1, 0x49($s1)
    /* 1A300 80153EF8 00000000 */  nop
    /* 1A304 80153EFC FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 1A308 80153F00 0200422C */  sltiu      $v0, $v0, 0x2
    /* 1A30C 80153F04 04004014 */  bnez       $v0, .L80153F18
    /* 1A310 80153F08 FF006330 */   andi      $v1, $v1, 0xFF
    /* 1A314 80153F0C 04000224 */  addiu      $v0, $zero, 0x4
    /* 1A318 80153F10 04006214 */  bne        $v1, $v0, .L80153F24
    /* 1A31C 80153F14 40101300 */   sll       $v0, $s3, 1
  .L80153F18:
    /* 1A320 80153F18 B54D050C */  jal        MAI_Counselor__Fi
    /* 1A324 80153F1C 21206002 */   addu      $a0, $s3, $zero
    /* 1A328 80153F20 40101300 */  sll        $v0, $s3, 1
  .L80153F24:
    /* 1A32C 80153F24 21105300 */  addu       $v0, $v0, $s3
    /* 1A330 80153F28 80100200 */  sll        $v0, $v0, 2
    /* 1A334 80153F2C 21105300 */  addu       $v0, $v0, $s3
    /* 1A338 80153F30 C0100200 */  sll        $v0, $v0, 3
    /* 1A33C 80153F34 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1A340 80153F38 21082200 */  addu       $at, $at, $v0
    /* 1A344 80153F3C D05335A0 */  sb         $s5, %lo(monster + 0x3C)($at)
    /* 1A348 80153F40 33002282 */  lb         $v0, 0x33($s1)
    /* 1A34C 80153F44 00000000 */  nop
    /* 1A350 80153F48 02004014 */  bnez       $v0, .L80153F54
    /* 1A354 80153F4C 00000000 */   nop
    /* 1A358 80153F50 5A0020A2 */  sb         $zero, 0x5A($s1)
  .L80153F54:
    /* 1A35C 80153F54 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1A360 80153F58 2400B58F */  lw         $s5, 0x24($sp)
    /* 1A364 80153F5C 2000B48F */  lw         $s4, 0x20($sp)
    /* 1A368 80153F60 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1A36C 80153F64 1800B28F */  lw         $s2, 0x18($sp)
    /* 1A370 80153F68 1400B18F */  lw         $s1, 0x14($sp)
    /* 1A374 80153F6C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1A378 80153F70 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1A37C 80153F74 0800E003 */  jr         $ra
    /* 1A380 80153F78 00000000 */   nop
endlabel MAI_Zhar__Fi
