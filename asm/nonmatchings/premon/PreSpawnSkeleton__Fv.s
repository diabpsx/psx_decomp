.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PreSpawnSkeleton__Fv, 0x138

glabel PreSpawnSkeleton__Fv
    /* 28164 80161D5C 1280023C */  lui        $v0, %hi(nummtypes)
    /* 28168 80161D60 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 2816C 80161D64 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 28170 80161D68 3000B2AF */  sw         $s2, 0x30($sp)
    /* 28174 80161D6C 21900000 */  addu       $s2, $zero, $zero
    /* 28178 80161D70 2800B0AF */  sw         $s0, 0x28($sp)
    /* 2817C 80161D74 21800000 */  addu       $s0, $zero, $zero
    /* 28180 80161D78 3800BFAF */  sw         $ra, 0x38($sp)
    /* 28184 80161D7C 3400B3AF */  sw         $s3, 0x34($sp)
    /* 28188 80161D80 11004018 */  blez       $v0, .L80161DC8
    /* 2818C 80161D84 2C00B1AF */   sw        $s1, 0x2C($sp)
    /* 28190 80161D88 21880000 */  addu       $s1, $zero, $zero
  .L80161D8C:
    /* 28194 80161D8C 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 28198 80161D90 21083100 */  addu       $at, $at, $s1
    /* 2819C 80161D94 CEA32490 */  lbu        $a0, %lo(Monsters + 0x12)($at)
    /* 281A0 80161D98 27FD010C */  jal        IsSkel__Fi
    /* 281A4 80161D9C 00000000 */   nop
    /* 281A8 80161DA0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 281AC 80161DA4 02004010 */  beqz       $v0, .L80161DB0
    /* 281B0 80161DA8 00000000 */   nop
    /* 281B4 80161DAC 01005226 */  addiu      $s2, $s2, 0x1
  .L80161DB0:
    /* 281B8 80161DB0 1280023C */  lui        $v0, %hi(nummtypes)
    /* 281BC 80161DB4 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 281C0 80161DB8 01001026 */  addiu      $s0, $s0, 0x1
    /* 281C4 80161DBC 2A100202 */  slt        $v0, $s0, $v0
    /* 281C8 80161DC0 F2FF4014 */  bnez       $v0, .L80161D8C
    /* 281CC 80161DC4 1C003126 */   addiu     $s1, $s1, 0x1C
  .L80161DC8:
    /* 281D0 80161DC8 2A004012 */  beqz       $s2, .L80161E74
    /* 281D4 80161DCC FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 281D8 80161DD0 C9F6000C */  jal        ENG_random__Fl
    /* 281DC 80161DD4 21204002 */   addu      $a0, $s2, $zero
    /* 281E0 80161DD8 21900000 */  addu       $s2, $zero, $zero
    /* 281E4 80161DDC 21800000 */  addu       $s0, $zero, $zero
    /* 281E8 80161DE0 1280033C */  lui        $v1, %hi(nummtypes)
    /* 281EC 80161DE4 9CC2638C */  lw         $v1, %lo(nummtypes)($v1)
    /* 281F0 80161DE8 00000000 */  nop
    /* 281F4 80161DEC 14006018 */  blez       $v1, .L80161E40
    /* 281F8 80161DF0 21984000 */   addu      $s3, $v0, $zero
    /* 281FC 80161DF4 21880000 */  addu       $s1, $zero, $zero
  .L80161DF8:
    /* 28200 80161DF8 2A107202 */  slt        $v0, $s3, $s2
    /* 28204 80161DFC 10004014 */  bnez       $v0, .L80161E40
    /* 28208 80161E00 00000000 */   nop
    /* 2820C 80161E04 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 28210 80161E08 21083100 */  addu       $at, $at, $s1
    /* 28214 80161E0C CEA32490 */  lbu        $a0, %lo(Monsters + 0x12)($at)
    /* 28218 80161E10 27FD010C */  jal        IsSkel__Fi
    /* 2821C 80161E14 00000000 */   nop
    /* 28220 80161E18 FF004230 */  andi       $v0, $v0, 0xFF
    /* 28224 80161E1C 02004010 */  beqz       $v0, .L80161E28
    /* 28228 80161E20 00000000 */   nop
    /* 2822C 80161E24 01005226 */  addiu      $s2, $s2, 0x1
  .L80161E28:
    /* 28230 80161E28 1280023C */  lui        $v0, %hi(nummtypes)
    /* 28234 80161E2C 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 28238 80161E30 01001026 */  addiu      $s0, $s0, 0x1
    /* 2823C 80161E34 2A100202 */  slt        $v0, $s0, $v0
    /* 28240 80161E38 EFFF4014 */  bnez       $v0, .L80161DF8
    /* 28244 80161E3C 1C003126 */   addiu     $s1, $s1, 0x1C
  .L80161E40:
    /* 28248 80161E40 1000A0AF */  sw         $zero, 0x10($sp)
    /* 2824C 80161E44 21200000 */  addu       $a0, $zero, $zero
    /* 28250 80161E48 21280000 */  addu       $a1, $zero, $zero
    /* 28254 80161E4C 21300000 */  addu       $a2, $zero, $zero
    /* 28258 80161E50 74FF010C */  jal        AddMonster__FiiiiUc
    /* 2825C 80161E54 FFFF0726 */   addiu     $a3, $s0, -0x1
    /* 28260 80161E58 21804000 */  addu       $s0, $v0, $zero
    /* 28264 80161E5C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 28268 80161E60 03000212 */  beq        $s0, $v0, .L80161E70
    /* 2826C 80161E64 21200002 */   addu      $a0, $s0, $zero
    /* 28270 80161E68 9CFF010C */  jal        M_StartStand__Fii
    /* 28274 80161E6C 21280000 */   addu      $a1, $zero, $zero
  .L80161E70:
    /* 28278 80161E70 21100002 */  addu       $v0, $s0, $zero
  .L80161E74:
    /* 2827C 80161E74 3800BF8F */  lw         $ra, 0x38($sp)
    /* 28280 80161E78 3400B38F */  lw         $s3, 0x34($sp)
    /* 28284 80161E7C 3000B28F */  lw         $s2, 0x30($sp)
    /* 28288 80161E80 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 2828C 80161E84 2800B08F */  lw         $s0, 0x28($sp)
    /* 28290 80161E88 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 28294 80161E8C 0800E003 */  jr         $ra
    /* 28298 80161E90 00000000 */   nop
endlabel PreSpawnSkeleton__Fv
