.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintCtrlString__FiiUcic, 0x554

glabel PrintCtrlString__FiiUcic
    /* 8D084 8009D084 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 8D088 8009D088 6000B4AF */  sw         $s4, 0x60($sp)
    /* 8D08C 8009D08C 21A0E000 */  addu       $s4, $a3, $zero
    /* 8D090 8009D090 7000BEAF */  sw         $fp, 0x70($sp)
    /* 8D094 8009D094 00111400 */  sll        $v0, $s4, 4
    /* 8D098 8009D098 0D80033C */  lui        $v1, %hi(txt_actions)
    /* 8D09C 8009D09C 0CC46324 */  addiu      $v1, $v1, %lo(txt_actions)
    /* 8D0A0 8009D0A0 5400B1AF */  sw         $s1, 0x54($sp)
    /* 8D0A4 8009D0A4 21884300 */  addu       $s1, $v0, $v1
    /* 8D0A8 8009D0A8 3800A5AF */  sw         $a1, 0x38($sp)
    /* 8D0AC 8009D0AC E8FFA224 */  addiu      $v0, $a1, -0x18
    /* 8D0B0 8009D0B0 8800A38F */  lw         $v1, 0x88($sp)
    /* 8D0B4 8009D0B4 8300422C */  sltiu      $v0, $v0, 0x83
    /* 8D0B8 8009D0B8 7400BFAF */  sw         $ra, 0x74($sp)
    /* 8D0BC 8009D0BC 6C00B7AF */  sw         $s7, 0x6C($sp)
    /* 8D0C0 8009D0C0 6800B6AF */  sw         $s6, 0x68($sp)
    /* 8D0C4 8009D0C4 6400B5AF */  sw         $s5, 0x64($sp)
    /* 8D0C8 8009D0C8 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 8D0CC 8009D0CC 5800B2AF */  sw         $s2, 0x58($sp)
    /* 8D0D0 8009D0D0 5000B0AF */  sw         $s0, 0x50($sp)
    /* 8D0D4 8009D0D4 4000A0A3 */  sb         $zero, 0x40($sp)
    /* 8D0D8 8009D0D8 4800A0A3 */  sb         $zero, 0x48($sp)
    /* 8D0DC 8009D0DC 0000328E */  lw         $s2, 0x0($s1)
    /* 8D0E0 8009D0E0 30014010 */  beqz       $v0, .L8009D5A4
    /* 8D0E4 8009D0E4 21F00000 */   addu      $fp, $zero, $zero
    /* 8D0E8 8009D0E8 00160300 */  sll        $v0, $v1, 24
    /* 8D0EC 8009D0EC 031E0200 */  sra        $v1, $v0, 24
    /* 8D0F0 8009D0F0 01000224 */  addiu      $v0, $zero, 0x1
    /* 8D0F4 8009D0F4 17006210 */  beq        $v1, $v0, .L8009D154
    /* 8D0F8 8009D0F8 02006228 */   slti      $v0, $v1, 0x2
    /* 8D0FC 8009D0FC 05004010 */  beqz       $v0, .L8009D114
    /* 8D100 8009D100 00000000 */   nop
    /* 8D104 8009D104 0A006010 */  beqz       $v1, .L8009D130
    /* 8D108 8009D108 00000000 */   nop
    /* 8D10C 8009D10C 70740208 */  j          .L8009D1C0
    /* 8D110 8009D110 00000000 */   nop
  .L8009D114:
    /* 8D114 8009D114 02000224 */  addiu      $v0, $zero, 0x2
    /* 8D118 8009D118 17006210 */  beq        $v1, $v0, .L8009D178
    /* 8D11C 8009D11C 03000224 */   addiu     $v0, $zero, 0x3
    /* 8D120 8009D120 1E006210 */  beq        $v1, $v0, .L8009D19C
    /* 8D124 8009D124 00000000 */   nop
    /* 8D128 8009D128 70740208 */  j          .L8009D1C0
    /* 8D12C 8009D12C 00000000 */   nop
  .L8009D130:
    /* 8D130 8009D130 1280083C */  lui        $t0, %hi(WHITER)
    /* 8D134 8009D134 D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 8D138 8009D138 12801E3C */  lui        $fp, %hi(WHITEB)
    /* 8D13C 8009D13C D3ABDE93 */  lbu        $fp, %lo(WHITEB)($fp)
    /* 8D140 8009D140 4000A8A3 */  sb         $t0, 0x40($sp)
    /* 8D144 8009D144 1280083C */  lui        $t0, %hi(WHITEG)
    /* 8D148 8009D148 D2AB0891 */  lbu        $t0, %lo(WHITEG)($t0)
    /* 8D14C 8009D14C 70740208 */  j          .L8009D1C0
    /* 8D150 8009D150 4800A8A3 */   sb        $t0, 0x48($sp)
  .L8009D154:
    /* 8D154 8009D154 1280083C */  lui        $t0, %hi(BLUER)
    /* 8D158 8009D158 D4AB0891 */  lbu        $t0, %lo(BLUER)($t0)
    /* 8D15C 8009D15C 12801E3C */  lui        $fp, %hi(BLUEB)
    /* 8D160 8009D160 D6ABDE93 */  lbu        $fp, %lo(BLUEB)($fp)
    /* 8D164 8009D164 4000A8A3 */  sb         $t0, 0x40($sp)
    /* 8D168 8009D168 1280083C */  lui        $t0, %hi(BLUEG)
    /* 8D16C 8009D16C D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 8D170 8009D170 70740208 */  j          .L8009D1C0
    /* 8D174 8009D174 4800A8A3 */   sb        $t0, 0x48($sp)
  .L8009D178:
    /* 8D178 8009D178 1280083C */  lui        $t0, %hi(REDR)
    /* 8D17C 8009D17C D7AB0891 */  lbu        $t0, %lo(REDR)($t0)
    /* 8D180 8009D180 12801E3C */  lui        $fp, %hi(REDB)
    /* 8D184 8009D184 D9ABDE93 */  lbu        $fp, %lo(REDB)($fp)
    /* 8D188 8009D188 4000A8A3 */  sb         $t0, 0x40($sp)
    /* 8D18C 8009D18C 1280083C */  lui        $t0, %hi(REDG)
    /* 8D190 8009D190 D8AB0891 */  lbu        $t0, %lo(REDG)($t0)
    /* 8D194 8009D194 70740208 */  j          .L8009D1C0
    /* 8D198 8009D198 4800A8A3 */   sb        $t0, 0x48($sp)
  .L8009D19C:
    /* 8D19C 8009D19C 1280083C */  lui        $t0, %hi(GOLDR)
    /* 8D1A0 8009D1A0 DAAB0891 */  lbu        $t0, %lo(GOLDR)($t0)
    /* 8D1A4 8009D1A4 12801E3C */  lui        $fp, %hi(GOLDB)
    /* 8D1A8 8009D1A8 DCABDE93 */  lbu        $fp, %lo(GOLDB)($fp)
    /* 8D1AC 8009D1AC 4000A8A3 */  sb         $t0, 0x40($sp)
    /* 8D1B0 8009D1B0 1280083C */  lui        $t0, %hi(GOLDG)
    /* 8D1B4 8009D1B4 DBAB0891 */  lbu        $t0, %lo(GOLDG)($t0)
    /* 8D1B8 8009D1B8 00000000 */  nop
    /* 8D1BC 8009D1BC 4800A8A3 */  sb         $t0, 0x48($sp)
  .L8009D1C0:
    /* 8D1C0 8009D1C0 3800A88F */  lw         $t0, 0x38($sp)
    /* 8D1C4 8009D1C4 21204002 */  addu       $a0, $s2, $zero
    /* 8D1C8 8009D1C8 FCFF0825 */  addiu      $t0, $t0, -0x4
    /* 8D1CC 8009D1CC 4AED010C */  jal        GetStr__Fi
    /* 8D1D0 8009D1D0 3800A8AF */   sw        $t0, 0x38($sp)
    /* 8D1D4 8009D1D4 0D80133C */  lui        $s3, %hi(tempstr)
    /* 8D1D8 8009D1D8 10EA7326 */  addiu      $s3, $s3, %lo(tempstr)
    /* 8D1DC 8009D1DC 21206002 */  addu       $a0, $s3, $zero
    /* 8D1E0 8009D1E0 F240000C */  jal        strcpy
    /* 8D1E4 8009D1E4 21284000 */   addu      $a1, $v0, $zero
    /* 8D1E8 8009D1E8 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 8D1EC 8009D1EC D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 8D1F0 8009D1F0 21200002 */  addu       $a0, $s0, $zero
    /* 8D1F4 8009D1F4 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 8D1F8 8009D1F8 21286002 */   addu      $a1, $s3, $zero
    /* 8D1FC 8009D1FC 21200002 */  addu       $a0, $s0, $zero
    /* 8D200 8009D200 06000524 */  addiu      $a1, $zero, 0x6
    /* 8D204 8009D204 21386002 */  addu       $a3, $s3, $zero
    /* 8D208 8009D208 3800A68F */  lw         $a2, 0x38($sp)
    /* 8D20C 8009D20C 4000A893 */  lbu        $t0, 0x40($sp)
    /* 8D210 8009D210 1280033C */  lui        $v1, %hi(D_8011C6D0)
    /* 8D214 8009D214 D0C66324 */  addiu      $v1, $v1, %lo(D_8011C6D0)
    /* 8D218 8009D218 1800A8AF */  sw         $t0, 0x18($sp)
    /* 8D21C 8009D21C 4800A893 */  lbu        $t0, 0x48($sp)
    /* 8D220 8009D220 21A84000 */  addu       $s5, $v0, $zero
    /* 8D224 8009D224 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8D228 8009D228 1400A3AF */  sw         $v1, 0x14($sp)
    /* 8D22C 8009D22C 2000BEAF */  sw         $fp, 0x20($sp)
    /* 8D230 8009D230 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 8D234 8009D234 1C00A8AF */   sw        $t0, 0x1C($sp)
    /* 8D238 8009D238 A6020224 */  addiu      $v0, $zero, 0x2A6
    /* 8D23C 8009D23C 07004216 */  bne        $s2, $v0, .L8009D25C
    /* 8D240 8009D240 C3000224 */   addiu     $v0, $zero, 0xC3
    /* 8D244 8009D244 0400228E */  lw         $v0, 0x4($s1)
    /* 8D248 8009D248 00000000 */  nop
    /* 8D24C 8009D24C 0A004010 */  beqz       $v0, .L8009D278
    /* 8D250 8009D250 58030424 */   addiu     $a0, $zero, 0x358
    /* 8D254 8009D254 9E740208 */  j          .L8009D278
    /* 8D258 8009D258 04000424 */   addiu     $a0, $zero, 0x4
  .L8009D25C:
    /* 8D25C 8009D25C 0E004216 */  bne        $s2, $v0, .L8009D298
    /* 8D260 8009D260 C6000224 */   addiu     $v0, $zero, 0xC6
    /* 8D264 8009D264 0400228E */  lw         $v0, 0x4($s1)
    /* 8D268 8009D268 00000000 */  nop
    /* 8D26C 8009D26C 02004010 */  beqz       $v0, .L8009D278
    /* 8D270 8009D270 C4000424 */   addiu     $a0, $zero, 0xC4
    /* 8D274 8009D274 C5000424 */  addiu      $a0, $zero, 0xC5
  .L8009D278:
    /* 8D278 8009D278 4AED010C */  jal        GetStr__Fi
    /* 8D27C 8009D27C 00000000 */   nop
    /* 8D280 8009D280 0D80043C */  lui        $a0, %hi(tempstr)
    /* 8D284 8009D284 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 8D288 8009D288 F240000C */  jal        strcpy
    /* 8D28C 8009D28C 21284000 */   addu      $a1, $v0, $zero
    /* 8D290 8009D290 1A750208 */  j          .L8009D468
    /* 8D294 8009D294 00000000 */   nop
  .L8009D298:
    /* 8D298 8009D298 24004212 */  beq        $s2, $v0, .L8009D32C
    /* 8D29C 8009D29C 000060A2 */   sb        $zero, 0x0($s3)
    /* 8D2A0 8009D2A0 EC08828F */  lw         $v0, %gp_rel(D_8011B06C)($gp)
    /* 8D2A4 8009D2A4 00000000 */  nop
    /* 8D2A8 8009D2A8 20004014 */  bnez       $v0, .L8009D32C
    /* 8D2AC 8009D2AC 00000000 */   nop
    /* 8D2B0 8009D2B0 0D80043C */  lui        $a0, %hi(txt_actions + 0x44)
    /* 8D2B4 8009D2B4 50C4848C */  lw         $a0, %lo(txt_actions + 0x44)($a0)
    /* 8D2B8 8009D2B8 00000000 */  nop
    /* 8D2BC 8009D2BC 3D008010 */  beqz       $a0, .L8009D3B4
    /* 8D2C0 8009D2C0 01000224 */   addiu     $v0, $zero, 0x1
    /* 8D2C4 8009D2C4 491F8383 */  lb         $v1, %gp_rel(D_8011C6C9)($gp)
    /* 8D2C8 8009D2C8 00000000 */  nop
    /* 8D2CC 8009D2CC 19006214 */  bne        $v1, $v0, .L8009D334
    /* 8D2D0 8009D2D0 00000000 */   nop
    /* 8D2D4 8009D2D4 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8D2D8 8009D2D8 00000000 */  nop
    /* 8D2DC 8009D2DC 15008216 */  bne        $s4, $v0, .L8009D334
    /* 8D2E0 8009D2E0 00000000 */   nop
    /* 8D2E4 8009D2E4 4A1F8283 */  lb         $v0, %gp_rel(D_8011C6CA)($gp)
    /* 8D2E8 8009D2E8 00000000 */  nop
    /* 8D2EC 8009D2EC 11004010 */  beqz       $v0, .L8009D334
    /* 8D2F0 8009D2F0 00000000 */   nop
    /* 8D2F4 8009D2F4 CA71020C */  jal        get_key_pad__Fi
    /* 8D2F8 8009D2F8 00000000 */   nop
    /* 8D2FC 8009D2FC 40180200 */  sll        $v1, $v0, 1
    /* 8D300 8009D300 21186200 */  addu       $v1, $v1, $v0
    /* 8D304 8009D304 80180300 */  sll        $v1, $v1, 2
    /* 8D308 8009D308 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 8D30C 8009D30C 21082300 */  addu       $at, $at, $v1
    /* 8D310 8009D310 6CC32680 */  lb         $a2, %lo(pad_txt + 0x8)($at)
    /* 8D314 8009D314 1280053C */  lui        $a1, %hi(D_8011B070)
    /* 8D318 8009D318 70B0A524 */  addiu      $a1, $a1, %lo(D_8011B070)
    /* 8D31C 8009D31C 9767000C */  jal        sprintf
    /* 8D320 8009D320 21206002 */   addu      $a0, $s3, $zero
    /* 8D324 8009D324 1A750208 */  j          .L8009D468
    /* 8D328 8009D328 00000000 */   nop
  .L8009D32C:
    /* 8D32C 8009D32C 0D80043C */  lui        $a0, %hi(txt_actions + 0x44)
    /* 8D330 8009D330 50C4848C */  lw         $a0, %lo(txt_actions + 0x44)($a0)
  .L8009D334:
    /* 8D334 8009D334 00000000 */  nop
    /* 8D338 8009D338 1E008010 */  beqz       $a0, .L8009D3B4
    /* 8D33C 8009D33C 00000000 */   nop
    /* 8D340 8009D340 0C00228E */  lw         $v0, 0xC($s1)
    /* 8D344 8009D344 00000000 */  nop
    /* 8D348 8009D348 1A004010 */  beqz       $v0, .L8009D3B4
    /* 8D34C 8009D34C 00000000 */   nop
    /* 8D350 8009D350 CA71020C */  jal        get_key_pad__Fi
    /* 8D354 8009D354 00000000 */   nop
    /* 8D358 8009D358 40180200 */  sll        $v1, $v0, 1
    /* 8D35C 8009D35C 21186200 */  addu       $v1, $v1, $v0
    /* 8D360 8009D360 80180300 */  sll        $v1, $v1, 2
    /* 8D364 8009D364 0C00248E */  lw         $a0, 0xC($s1)
    /* 8D368 8009D368 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 8D36C 8009D36C 21082300 */  addu       $at, $at, $v1
    /* 8D370 8009D370 6CC33080 */  lb         $s0, %lo(pad_txt + 0x8)($at)
    /* 8D374 8009D374 CA71020C */  jal        get_key_pad__Fi
    /* 8D378 8009D378 00000000 */   nop
    /* 8D37C 8009D37C 0D80043C */  lui        $a0, %hi(tempstr)
    /* 8D380 8009D380 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 8D384 8009D384 1280053C */  lui        $a1, %hi(D_8011B078)
    /* 8D388 8009D388 78B0A524 */  addiu      $a1, $a1, %lo(D_8011B078)
    /* 8D38C 8009D38C 40180200 */  sll        $v1, $v0, 1
    /* 8D390 8009D390 21186200 */  addu       $v1, $v1, $v0
    /* 8D394 8009D394 80180300 */  sll        $v1, $v1, 2
    /* 8D398 8009D398 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 8D39C 8009D39C 21082300 */  addu       $at, $at, $v1
    /* 8D3A0 8009D3A0 6CC32780 */  lb         $a3, %lo(pad_txt + 0x8)($at)
    /* 8D3A4 8009D3A4 9767000C */  jal        sprintf
    /* 8D3A8 8009D3A8 21300002 */   addu      $a2, $s0, $zero
    /* 8D3AC 8009D3AC 1A750208 */  j          .L8009D468
    /* 8D3B0 8009D3B0 00000000 */   nop
  .L8009D3B4:
    /* 8D3B4 8009D3B4 21008012 */  beqz       $s4, .L8009D43C
    /* 8D3B8 8009D3B8 44FC4226 */   addiu     $v0, $s2, -0x3BC
    /* 8D3BC 8009D3BC 0400248E */  lw         $a0, 0x4($s1)
    /* 8D3C0 8009D3C0 00000000 */  nop
    /* 8D3C4 8009D3C4 1E008010 */  beqz       $a0, .L8009D440
    /* 8D3C8 8009D3C8 0200422C */   sltiu     $v0, $v0, 0x2
    /* 8D3CC 8009D3CC CA71020C */  jal        get_key_pad__Fi
    /* 8D3D0 8009D3D0 00000000 */   nop
    /* 8D3D4 8009D3D4 40180200 */  sll        $v1, $v0, 1
    /* 8D3D8 8009D3D8 21186200 */  addu       $v1, $v1, $v0
    /* 8D3DC 8009D3DC 80180300 */  sll        $v1, $v1, 2
    /* 8D3E0 8009D3E0 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 8D3E4 8009D3E4 21082300 */  addu       $at, $at, $v1
    /* 8D3E8 8009D3E8 6CC32280 */  lb         $v0, %lo(pad_txt + 0x8)($at)
    /* 8D3EC 8009D3EC 00000000 */  nop
    /* 8D3F0 8009D3F0 1D004010 */  beqz       $v0, .L8009D468
    /* 8D3F4 8009D3F4 00000000 */   nop
    /* 8D3F8 8009D3F8 0400248E */  lw         $a0, 0x4($s1)
    /* 8D3FC 8009D3FC CA71020C */  jal        get_key_pad__Fi
    /* 8D400 8009D400 00000000 */   nop
    /* 8D404 8009D404 0D80043C */  lui        $a0, %hi(tempstr)
    /* 8D408 8009D408 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 8D40C 8009D40C 40180200 */  sll        $v1, $v0, 1
    /* 8D410 8009D410 21186200 */  addu       $v1, $v1, $v0
    /* 8D414 8009D414 80180300 */  sll        $v1, $v1, 2
    /* 8D418 8009D418 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 8D41C 8009D41C 21082300 */  addu       $at, $at, $v1
    /* 8D420 8009D420 6CC32680 */  lb         $a2, %lo(pad_txt + 0x8)($at)
    /* 8D424 8009D424 1280053C */  lui        $a1, %hi(D_8011B080)
    /* 8D428 8009D428 80B0A524 */  addiu      $a1, $a1, %lo(D_8011B080)
    /* 8D42C 8009D42C 9767000C */  jal        sprintf
    /* 8D430 8009D430 00000000 */   nop
    /* 8D434 8009D434 1A750208 */  j          .L8009D468
    /* 8D438 8009D438 00000000 */   nop
  .L8009D43C:
    /* 8D43C 8009D43C 0200422C */  sltiu      $v0, $v0, 0x2
  .L8009D440:
    /* 8D440 8009D440 09004014 */  bnez       $v0, .L8009D468
    /* 8D444 8009D444 2C050224 */   addiu     $v0, $zero, 0x52C
    /* 8D448 8009D448 07004212 */  beq        $s2, $v0, .L8009D468
    /* 8D44C 8009D44C 00000000 */   nop
    /* 8D450 8009D450 4AED010C */  jal        GetStr__Fi
    /* 8D454 8009D454 03010424 */   addiu     $a0, $zero, 0x103
    /* 8D458 8009D458 0D80043C */  lui        $a0, %hi(tempstr)
    /* 8D45C 8009D45C 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 8D460 8009D460 9767000C */  jal        sprintf
    /* 8D464 8009D464 21284000 */   addu      $a1, $v0, $zero
  .L8009D468:
    /* 8D468 8009D468 481F8283 */  lb         $v0, %gp_rel(D_8011C6C8)($gp)
    /* 8D46C 8009D46C 00000000 */  nop
    /* 8D470 8009D470 36008216 */  bne        $s4, $v0, .L8009D54C
    /* 8D474 8009D474 00000000 */   nop
    /* 8D478 8009D478 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 8D47C 8009D47C D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 8D480 8009D480 0D80053C */  lui        $a1, %hi(tempstr)
    /* 8D484 8009D484 10EAA524 */  addiu      $a1, $a1, %lo(tempstr)
    /* 8D488 8009D488 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 8D48C 8009D48C 00000000 */   nop
    /* 8D490 8009D490 21204000 */  addu       $a0, $v0, $zero
    /* 8D494 8009D494 491F8383 */  lb         $v1, %gp_rel(D_8011C6C9)($gp)
    /* 8D498 8009D498 01000224 */  addiu      $v0, $zero, 0x1
    /* 8D49C 8009D49C 05006214 */  bne        $v1, $v0, .L8009D4B4
    /* 8D4A0 8009D4A0 13001024 */   addiu     $s0, $zero, 0x13
    /* 8D4A4 8009D4A4 26011024 */  addiu      $s0, $zero, 0x126
    /* 8D4A8 8009D4A8 18010224 */  addiu      $v0, $zero, 0x118
    /* 8D4AC 8009D4AC 2E750208 */  j          .L8009D4B8
    /* 8D4B0 8009D4B0 23B84400 */   subu      $s7, $v0, $a0
  .L8009D4B4:
    /* 8D4B4 8009D4B4 1800B726 */  addiu      $s7, $s5, 0x18
  .L8009D4B8:
    /* 8D4B8 8009D4B8 2A77020C */  jal        GetOverlayOtBase__7CBlocks_8009dca8
    /* 8D4BC 8009D4BC F0001424 */   addiu     $s4, $zero, 0xF0
    /* 8D4C0 8009D4C0 FCFF0426 */  addiu      $a0, $s0, -0x4
    /* 8D4C4 8009D4C4 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 8D4C8 8009D4C8 40000724 */  addiu      $a3, $zero, 0x40
    /* 8D4CC 8009D4CC 20001324 */  addiu      $s3, $zero, 0x20
    /* 8D4D0 8009D4D0 40001224 */  addiu      $s2, $zero, 0x40
    /* 8D4D4 8009D4D4 01001024 */  addiu      $s0, $zero, 0x1
    /* 8D4D8 8009D4D8 04005624 */  addiu      $s6, $v0, 0x4
    /* 8D4DC 8009D4DC 3800A88F */  lw         $t0, 0x38($sp)
    /* 8D4E0 8009D4E0 08001124 */  addiu      $s1, $zero, 0x8
    /* 8D4E4 8009D4E4 1000B4AF */  sw         $s4, 0x10($sp)
    /* 8D4E8 8009D4E8 1400B3AF */  sw         $s3, 0x14($sp)
    /* 8D4EC 8009D4EC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8D4F0 8009D4F0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 8D4F4 8009D4F4 2000B0AF */  sw         $s0, 0x20($sp)
    /* 8D4F8 8009D4F8 2400B6AF */  sw         $s6, 0x24($sp)
    /* 8D4FC 8009D4FC 2800B0AF */  sw         $s0, 0x28($sp)
    /* 8D500 8009D500 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 8D504 8009D504 3000B1AF */  sw         $s1, 0x30($sp)
    /* 8D508 8009D508 32001525 */  addiu      $s5, $t0, 0x32
    /* 8D50C 8009D50C 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 8D510 8009D510 2128A002 */   addu      $a1, $s5, $zero
    /* 8D514 8009D514 2120E002 */  addu       $a0, $s7, $zero
    /* 8D518 8009D518 2128A002 */  addu       $a1, $s5, $zero
    /* 8D51C 8009D51C A0000624 */  addiu      $a2, $zero, 0xA0
    /* 8D520 8009D520 40000724 */  addiu      $a3, $zero, 0x40
    /* 8D524 8009D524 1000B4AF */  sw         $s4, 0x10($sp)
    /* 8D528 8009D528 1400B3AF */  sw         $s3, 0x14($sp)
    /* 8D52C 8009D52C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8D530 8009D530 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 8D534 8009D534 2000B0AF */  sw         $s0, 0x20($sp)
    /* 8D538 8009D538 2400B6AF */  sw         $s6, 0x24($sp)
    /* 8D53C 8009D53C 2800B0AF */  sw         $s0, 0x28($sp)
    /* 8D540 8009D540 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 8D544 8009D544 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 8D548 8009D548 3000B1AF */   sw        $s1, 0x30($sp)
  .L8009D54C:
    /* 8D54C 8009D54C 0D80103C */  lui        $s0, %hi(tempstr)
    /* 8D550 8009D550 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 8D554 8009D554 1280053C */  lui        $a1, %hi(D_8011B084)
    /* 8D558 8009D558 84B0A524 */  addiu      $a1, $a1, %lo(D_8011B084)
    /* 8D55C 8009D55C FC40000C */  jal        strcat
    /* 8D560 8009D560 21200002 */   addu      $a0, $s0, $zero
    /* 8D564 8009D564 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 8D568 8009D568 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 8D56C 8009D56C 21280000 */  addu       $a1, $zero, $zero
    /* 8D570 8009D570 21380002 */  addu       $a3, $s0, $zero
    /* 8D574 8009D574 3800A68F */  lw         $a2, 0x38($sp)
    /* 8D578 8009D578 4000A893 */  lbu        $t0, 0x40($sp)
    /* 8D57C 8009D57C 02000224 */  addiu      $v0, $zero, 0x2
    /* 8D580 8009D580 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8D584 8009D584 1800A8AF */  sw         $t0, 0x18($sp)
    /* 8D588 8009D588 4800A893 */  lbu        $t0, 0x48($sp)
    /* 8D58C 8009D58C 1280023C */  lui        $v0, %hi(D_8011C6D0)
    /* 8D590 8009D590 D0C64224 */  addiu      $v0, $v0, %lo(D_8011C6D0)
    /* 8D594 8009D594 1400A2AF */  sw         $v0, 0x14($sp)
    /* 8D598 8009D598 2000BEAF */  sw         $fp, 0x20($sp)
    /* 8D59C 8009D59C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 8D5A0 8009D5A0 1C00A8AF */   sw        $t0, 0x1C($sp)
  .L8009D5A4:
    /* 8D5A4 8009D5A4 7400BF8F */  lw         $ra, 0x74($sp)
    /* 8D5A8 8009D5A8 7000BE8F */  lw         $fp, 0x70($sp)
    /* 8D5AC 8009D5AC 6C00B78F */  lw         $s7, 0x6C($sp)
    /* 8D5B0 8009D5B0 6800B68F */  lw         $s6, 0x68($sp)
    /* 8D5B4 8009D5B4 6400B58F */  lw         $s5, 0x64($sp)
    /* 8D5B8 8009D5B8 6000B48F */  lw         $s4, 0x60($sp)
    /* 8D5BC 8009D5BC 5C00B38F */  lw         $s3, 0x5C($sp)
    /* 8D5C0 8009D5C0 5800B28F */  lw         $s2, 0x58($sp)
    /* 8D5C4 8009D5C4 5400B18F */  lw         $s1, 0x54($sp)
    /* 8D5C8 8009D5C8 5000B08F */  lw         $s0, 0x50($sp)
    /* 8D5CC 8009D5CC 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 8D5D0 8009D5D0 0800E003 */  jr         $ra
    /* 8D5D4 8009D5D4 00000000 */   nop
endlabel PrintCtrlString__FiiUcic
