.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawWarLord__Fii, 0xFC

glabel DrawWarLord__Fii
    /* 2526C 8015EE64 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 25270 8015EE68 1400B1AF */  sw         $s1, 0x14($sp)
    /* 25274 8015EE6C 21888000 */  addu       $s1, $a0, $zero
    /* 25278 8015EE70 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2527C 8015EE74 2180A000 */  addu       $s0, $a1, $zero
    /* 25280 8015EE78 1280043C */  lui        $a0, %hi(D_80119B3C)
    /* 25284 8015EE7C 3C9B8424 */  addiu      $a0, $a0, %lo(D_80119B3C)
    /* 25288 8015EE80 1800BFAF */  sw         $ra, 0x18($sp)
    /* 2528C 8015EE84 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 25290 8015EE88 21280000 */   addu      $a1, $zero, $zero
    /* 25294 8015EE8C 21204000 */  addu       $a0, $v0, $zero
    /* 25298 8015EE90 00008D90 */  lbu        $t5, 0x0($a0)
    /* 2529C 8015EE94 02008C90 */  lbu        $t4, 0x2($a0)
    /* 252A0 8015EE98 21400002 */  addu       $t0, $s0, $zero
    /* 252A4 8015EE9C 1280013C */  lui        $at, %hi(setpc_x)
    /* 252A8 8015EEA0 E4C031AC */  sw         $s1, %lo(setpc_x)($at)
    /* 252AC 8015EEA4 1280013C */  lui        $at, %hi(setpc_y)
    /* 252B0 8015EEA8 E8C030AC */  sw         $s0, %lo(setpc_y)($at)
    /* 252B4 8015EEAC 21108801 */  addu       $v0, $t4, $t0
    /* 252B8 8015EEB0 2A100201 */  slt        $v0, $t0, $v0
    /* 252BC 8015EEB4 1280013C */  lui        $at, %hi(setpc_w)
    /* 252C0 8015EEB8 ECC02DAC */  sw         $t5, %lo(setpc_w)($at)
    /* 252C4 8015EEBC 1280013C */  lui        $at, %hi(setpc_h)
    /* 252C8 8015EEC0 F0C02CAC */  sw         $t4, %lo(setpc_h)($at)
    /* 252CC 8015EEC4 1E004010 */  beqz       $v0, .L8015EF40
    /* 252D0 8015EEC8 04008924 */   addiu     $t1, $a0, 0x4
    /* 252D4 8015EECC 0E800E3C */  lui        $t6, %hi(dungeon)
    /* 252D8 8015EED0 C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* 252DC 8015EED4 21282002 */  addu       $a1, $s1, $zero
  .L8015EED8:
    /* 252E0 8015EED8 2118A501 */  addu       $v1, $t5, $a1
    /* 252E4 8015EEDC 2A10A300 */  slt        $v0, $a1, $v1
    /* 252E8 8015EEE0 12004010 */  beqz       $v0, .L8015EF2C
    /* 252EC 8015EEE4 40100500 */   sll       $v0, $a1, 1
    /* 252F0 8015EEE8 40580800 */  sll        $t3, $t0, 1
    /* 252F4 8015EEEC 21506000 */  addu       $t2, $v1, $zero
    /* 252F8 8015EEF0 21104500 */  addu       $v0, $v0, $a1
    /* 252FC 8015EEF4 40110200 */  sll        $v0, $v0, 5
    /* 25300 8015EEF8 21384E00 */  addu       $a3, $v0, $t6
  .L8015EEFC:
    /* 25304 8015EEFC 06000324 */  addiu      $v1, $zero, 0x6
    /* 25308 8015EF00 00002291 */  lbu        $v0, 0x0($t1)
    /* 2530C 8015EF04 00000000 */  nop
    /* 25310 8015EF08 02004010 */  beqz       $v0, .L8015EF14
    /* 25314 8015EF0C 21306701 */   addu      $a2, $t3, $a3
    /* 25318 8015EF10 FF004330 */  andi       $v1, $v0, 0xFF
  .L8015EF14:
    /* 2531C 8015EF14 0000C3A4 */  sh         $v1, 0x0($a2)
    /* 25320 8015EF18 02002925 */  addiu      $t1, $t1, 0x2
    /* 25324 8015EF1C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 25328 8015EF20 2A10AA00 */  slt        $v0, $a1, $t2
    /* 2532C 8015EF24 F5FF4014 */  bnez       $v0, .L8015EEFC
    /* 25330 8015EF28 6000E724 */   addiu     $a3, $a3, 0x60
  .L8015EF2C:
    /* 25334 8015EF2C 01000825 */  addiu      $t0, $t0, 0x1
    /* 25338 8015EF30 21109001 */  addu       $v0, $t4, $s0
    /* 2533C 8015EF34 2A100201 */  slt        $v0, $t0, $v0
    /* 25340 8015EF38 E7FF4014 */  bnez       $v0, .L8015EED8
    /* 25344 8015EF3C 21282002 */   addu      $a1, $s1, $zero
  .L8015EF40:
    /* 25348 8015EF40 F7F6000C */  jal        mem_free_dbg__FPv
    /* 2534C 8015EF44 00000000 */   nop
    /* 25350 8015EF48 1800BF8F */  lw         $ra, 0x18($sp)
    /* 25354 8015EF4C 1400B18F */  lw         $s1, 0x14($sp)
    /* 25358 8015EF50 1000B08F */  lw         $s0, 0x10($sp)
    /* 2535C 8015EF54 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 25360 8015EF58 0800E003 */  jr         $ra
    /* 25364 8015EF5C 00000000 */   nop
endlabel DrawWarLord__Fii
