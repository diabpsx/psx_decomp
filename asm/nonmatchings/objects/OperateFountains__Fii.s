.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateFountains__Fii, 0x5A4

glabel OperateFountains__Fii
    /* 4D06C 8005D06C B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 4D070 8005D070 3000B2AF */  sw         $s2, 0x30($sp)
    /* 4D074 8005D074 21908000 */  addu       $s2, $a0, $zero
    /* 4D078 8005D078 4400B7AF */  sw         $s7, 0x44($sp)
    /* 4D07C 8005D07C 21B8A000 */  addu       $s7, $a1, $zero
    /* 4D080 8005D080 40101700 */  sll        $v0, $s7, 1
    /* 4D084 8005D084 21105700 */  addu       $v0, $v0, $s7
    /* 4D088 8005D088 80100200 */  sll        $v0, $v0, 2
    /* 4D08C 8005D08C 23105700 */  subu       $v0, $v0, $s7
    /* 4D090 8005D090 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 4D094 8005D094 80880200 */  sll        $s1, $v0, 2
    /* 4D098 8005D098 4800BFAF */  sw         $ra, 0x48($sp)
    /* 4D09C 8005D09C 4000B6AF */  sw         $s6, 0x40($sp)
    /* 4D0A0 8005D0A0 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 4D0A4 8005D0A4 3800B4AF */  sw         $s4, 0x38($sp)
    /* 4D0A8 8005D0A8 3400B3AF */  sw         $s3, 0x34($sp)
    /* 4D0AC 8005D0AC 2800B0AF */  sw         $s0, 0x28($sp)
    /* 4D0B0 8005D0B0 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4D0B4 8005D0B4 21083100 */  addu       $at, $at, $s1
    /* 4D0B8 8005D0B8 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4D0BC 8005D0BC B3F6000C */  jal        SetRndSeed__Fl
    /* 4D0C0 8005D0C0 21980000 */   addu      $s3, $zero, $zero
    /* 4D0C4 8005D0C4 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4D0C8 8005D0C8 21083100 */  addu       $at, $at, $s1
    /* 4D0CC 8005D0CC 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4D0D0 8005D0D0 4C000224 */  addiu      $v0, $zero, 0x4C
    /* 4D0D4 8005D0D4 0E006210 */  beq        $v1, $v0, .L8005D110
    /* 4D0D8 8005D0D8 4D006228 */   slti      $v0, $v1, 0x4D
    /* 4D0DC 8005D0DC 05004010 */  beqz       $v0, .L8005D0F4
    /* 4D0E0 8005D0E0 42000224 */   addiu     $v0, $zero, 0x42
    /* 4D0E4 8005D0E4 51006210 */  beq        $v1, $v0, .L8005D22C
    /* 4D0E8 8005D0E8 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 4D0EC 8005D0EC 75750108 */  j          .L8005D5D4
    /* 4D0F0 8005D0F0 00000000 */   nop
  .L8005D0F4:
    /* 4D0F4 8005D0F4 51000224 */  addiu      $v0, $zero, 0x51
    /* 4D0F8 8005D0F8 9D006210 */  beq        $v1, $v0, .L8005D370
    /* 4D0FC 8005D0FC 52000224 */   addiu     $v0, $zero, 0x52
    /* 4D100 8005D100 D8006210 */  beq        $v1, $v0, .L8005D464
    /* 4D104 8005D104 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 4D108 8005D108 75750108 */  j          .L8005D5D4
    /* 4D10C 8005D10C 00000000 */   nop
  .L8005D110:
    /* 4D110 8005D110 1280023C */  lui        $v0, %hi(deltaload)
    /* 4D114 8005D114 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4D118 8005D118 00000000 */  nop
    /* 4D11C 8005D11C 30014014 */  bnez       $v0, .L8005D5E0
    /* 4D120 8005D120 21100000 */   addu      $v0, $zero, $zero
    /* 4D124 8005D124 1280023C */  lui        $v0, %hi(myplr)
    /* 4D128 8005D128 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4D12C 8005D12C 00000000 */  nop
    /* 4D130 8005D130 2B014216 */  bne        $s2, $v0, .L8005D5E0
    /* 4D134 8005D134 21100000 */   addu      $v0, $zero, $zero
    /* 4D138 8005D138 40101200 */  sll        $v0, $s2, 1
    /* 4D13C 8005D13C 21105200 */  addu       $v0, $v0, $s2
    /* 4D140 8005D140 80100200 */  sll        $v0, $v0, 2
    /* 4D144 8005D144 21105200 */  addu       $v0, $v0, $s2
    /* 4D148 8005D148 00110200 */  sll        $v0, $v0, 4
    /* 4D14C 8005D14C 23105200 */  subu       $v0, $v0, $s2
    /* 4D150 8005D150 80100200 */  sll        $v0, $v0, 2
    /* 4D154 8005D154 21105200 */  addu       $v0, $v0, $s2
    /* 4D158 8005D158 C0800200 */  sll        $s0, $v0, 3
    /* 4D15C 8005D15C 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4D160 8005D160 21083000 */  addu       $at, $at, $s0
    /* 4D164 8005D164 68A6228C */  lw         $v0, %lo(plr + 0x130)($at)
    /* 4D168 8005D168 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4D16C 8005D16C 21083000 */  addu       $at, $at, $s0
    /* 4D170 8005D170 6CA6238C */  lw         $v1, %lo(plr + 0x134)($at)
    /* 4D174 8005D174 00000000 */  nop
    /* 4D178 8005D178 2A104300 */  slt        $v0, $v0, $v1
    /* 4D17C 8005D17C 72004010 */  beqz       $v0, .L8005D348
    /* 4D180 8005D180 00000000 */   nop
    /* 4D184 8005D184 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4D188 8005D188 21083100 */  addu       $at, $at, $s1
    /* 4D18C 8005D18C 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4D190 8005D190 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4D194 8005D194 21083100 */  addu       $at, $at, $s1
    /* 4D198 8005D198 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4D19C 8005D19C E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4D1A0 8005D1A0 5A000424 */   addiu     $a0, $zero, 0x5A
    /* 4D1A4 8005D1A4 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4D1A8 8005D1A8 21083000 */  addu       $at, $at, $s0
    /* 4D1AC 8005D1AC 68A6228C */  lw         $v0, %lo(plr + 0x130)($at)
    /* 4D1B0 8005D1B0 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4D1B4 8005D1B4 21083000 */  addu       $at, $at, $s0
    /* 4D1B8 8005D1B8 6CA6248C */  lw         $a0, %lo(plr + 0x134)($at)
    /* 4D1BC 8005D1BC 40004224 */  addiu      $v0, $v0, 0x40
    /* 4D1C0 8005D1C0 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4D1C4 8005D1C4 21083000 */  addu       $at, $at, $s0
    /* 4D1C8 8005D1C8 68A622AC */  sw         $v0, %lo(plr + 0x130)($at)
    /* 4D1CC 8005D1CC 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4D1D0 8005D1D0 21083000 */  addu       $at, $at, $s0
    /* 4D1D4 8005D1D4 60A6228C */  lw         $v0, %lo(plr + 0x128)($at)
    /* 4D1D8 8005D1D8 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4D1DC 8005D1DC 21083000 */  addu       $at, $at, $s0
    /* 4D1E0 8005D1E0 68A6238C */  lw         $v1, %lo(plr + 0x130)($at)
    /* 4D1E4 8005D1E4 40004224 */  addiu      $v0, $v0, 0x40
    /* 4D1E8 8005D1E8 2A188300 */  slt        $v1, $a0, $v1
    /* 4D1EC 8005D1EC 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4D1F0 8005D1F0 21083000 */  addu       $at, $at, $s0
    /* 4D1F4 8005D1F4 60A622AC */  sw         $v0, %lo(plr + 0x128)($at)
    /* 4D1F8 8005D1F8 F5006010 */  beqz       $v1, .L8005D5D0
    /* 4D1FC 8005D1FC 01001324 */   addiu     $s3, $zero, 0x1
    /* 4D200 8005D200 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4D204 8005D204 21083000 */  addu       $at, $at, $s0
    /* 4D208 8005D208 64A6228C */  lw         $v0, %lo(plr + 0x12C)($at)
    /* 4D20C 8005D20C 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4D210 8005D210 21083000 */  addu       $at, $at, $s0
    /* 4D214 8005D214 68A624AC */  sw         $a0, %lo(plr + 0x130)($at)
    /* 4D218 8005D218 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4D21C 8005D21C 21083000 */  addu       $at, $at, $s0
    /* 4D220 8005D220 60A622AC */  sw         $v0, %lo(plr + 0x128)($at)
    /* 4D224 8005D224 75750108 */  j          .L8005D5D4
    /* 4D228 8005D228 FF000224 */   addiu     $v0, $zero, 0xFF
  .L8005D22C:
    /* 4D22C 8005D22C 1280023C */  lui        $v0, %hi(deltaload)
    /* 4D230 8005D230 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4D234 8005D234 00000000 */  nop
    /* 4D238 8005D238 E9004014 */  bnez       $v0, .L8005D5E0
    /* 4D23C 8005D23C 21100000 */   addu      $v0, $zero, $zero
    /* 4D240 8005D240 1280023C */  lui        $v0, %hi(myplr)
    /* 4D244 8005D244 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4D248 8005D248 00000000 */  nop
    /* 4D24C 8005D24C E4004216 */  bne        $s2, $v0, .L8005D5E0
    /* 4D250 8005D250 21100000 */   addu      $v0, $zero, $zero
    /* 4D254 8005D254 40101200 */  sll        $v0, $s2, 1
    /* 4D258 8005D258 21105200 */  addu       $v0, $v0, $s2
    /* 4D25C 8005D25C 80100200 */  sll        $v0, $v0, 2
    /* 4D260 8005D260 21105200 */  addu       $v0, $v0, $s2
    /* 4D264 8005D264 00110200 */  sll        $v0, $v0, 4
    /* 4D268 8005D268 23105200 */  subu       $v0, $v0, $s2
    /* 4D26C 8005D26C 80100200 */  sll        $v0, $v0, 2
    /* 4D270 8005D270 21105200 */  addu       $v0, $v0, $s2
    /* 4D274 8005D274 C0800200 */  sll        $s0, $v0, 3
    /* 4D278 8005D278 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 4D27C 8005D27C 21083000 */  addu       $at, $at, $s0
    /* 4D280 8005D280 54A6228C */  lw         $v0, %lo(plr + 0x11C)($at)
    /* 4D284 8005D284 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 4D288 8005D288 21083000 */  addu       $at, $at, $s0
    /* 4D28C 8005D28C 58A6238C */  lw         $v1, %lo(plr + 0x120)($at)
    /* 4D290 8005D290 00000000 */  nop
    /* 4D294 8005D294 2A104300 */  slt        $v0, $v0, $v1
    /* 4D298 8005D298 2B004010 */  beqz       $v0, .L8005D348
    /* 4D29C 8005D29C 00000000 */   nop
    /* 4D2A0 8005D2A0 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4D2A4 8005D2A4 21083100 */  addu       $at, $at, $s1
    /* 4D2A8 8005D2A8 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4D2AC 8005D2AC 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4D2B0 8005D2B0 21083100 */  addu       $at, $at, $s1
    /* 4D2B4 8005D2B4 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4D2B8 8005D2B8 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4D2BC 8005D2BC 5A000424 */   addiu     $a0, $zero, 0x5A
    /* 4D2C0 8005D2C0 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 4D2C4 8005D2C4 21083000 */  addu       $at, $at, $s0
    /* 4D2C8 8005D2C8 54A6228C */  lw         $v0, %lo(plr + 0x11C)($at)
    /* 4D2CC 8005D2CC 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 4D2D0 8005D2D0 21083000 */  addu       $at, $at, $s0
    /* 4D2D4 8005D2D4 58A6248C */  lw         $a0, %lo(plr + 0x120)($at)
    /* 4D2D8 8005D2D8 40004224 */  addiu      $v0, $v0, 0x40
    /* 4D2DC 8005D2DC 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 4D2E0 8005D2E0 21083000 */  addu       $at, $at, $s0
    /* 4D2E4 8005D2E4 54A622AC */  sw         $v0, %lo(plr + 0x11C)($at)
    /* 4D2E8 8005D2E8 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 4D2EC 8005D2EC 21083000 */  addu       $at, $at, $s0
    /* 4D2F0 8005D2F0 4CA6228C */  lw         $v0, %lo(plr + 0x114)($at)
    /* 4D2F4 8005D2F4 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 4D2F8 8005D2F8 21083000 */  addu       $at, $at, $s0
    /* 4D2FC 8005D2FC 54A6238C */  lw         $v1, %lo(plr + 0x11C)($at)
    /* 4D300 8005D300 40004224 */  addiu      $v0, $v0, 0x40
    /* 4D304 8005D304 2A188300 */  slt        $v1, $a0, $v1
    /* 4D308 8005D308 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 4D30C 8005D30C 21083000 */  addu       $at, $at, $s0
    /* 4D310 8005D310 4CA622AC */  sw         $v0, %lo(plr + 0x114)($at)
    /* 4D314 8005D314 AE006010 */  beqz       $v1, .L8005D5D0
    /* 4D318 8005D318 01001324 */   addiu     $s3, $zero, 0x1
    /* 4D31C 8005D31C 0E80013C */  lui        $at, %hi(plr + 0x118)
    /* 4D320 8005D320 21083000 */  addu       $at, $at, $s0
    /* 4D324 8005D324 50A6228C */  lw         $v0, %lo(plr + 0x118)($at)
    /* 4D328 8005D328 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 4D32C 8005D32C 21083000 */  addu       $at, $at, $s0
    /* 4D330 8005D330 54A624AC */  sw         $a0, %lo(plr + 0x11C)($at)
    /* 4D334 8005D334 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 4D338 8005D338 21083000 */  addu       $at, $at, $s0
    /* 4D33C 8005D33C 4CA622AC */  sw         $v0, %lo(plr + 0x114)($at)
    /* 4D340 8005D340 75750108 */  j          .L8005D5D4
    /* 4D344 8005D344 FF000224 */   addiu     $v0, $zero, 0xFF
  .L8005D348:
    /* 4D348 8005D348 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4D34C 8005D34C 21083100 */  addu       $at, $at, $s1
    /* 4D350 8005D350 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4D354 8005D354 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4D358 8005D358 21083100 */  addu       $at, $at, $s1
    /* 4D35C 8005D35C 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4D360 8005D360 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4D364 8005D364 5A000424 */   addiu     $a0, $zero, 0x5A
    /* 4D368 8005D368 75750108 */  j          .L8005D5D4
    /* 4D36C 8005D36C FF000224 */   addiu     $v0, $zero, 0xFF
  .L8005D370:
    /* 4D370 8005D370 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D374 8005D374 21083100 */  addu       $at, $at, $s1
    /* 4D378 8005D378 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4D37C 8005D37C 00000000 */  nop
    /* 4D380 8005D380 94004010 */  beqz       $v0, .L8005D5D4
    /* 4D384 8005D384 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 4D388 8005D388 1280023C */  lui        $v0, %hi(deltaload)
    /* 4D38C 8005D38C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4D390 8005D390 00000000 */  nop
    /* 4D394 8005D394 09004014 */  bnez       $v0, .L8005D3BC
    /* 4D398 8005D398 00000000 */   nop
    /* 4D39C 8005D39C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4D3A0 8005D3A0 21083100 */  addu       $at, $at, $s1
    /* 4D3A4 8005D3A4 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4D3A8 8005D3A8 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4D3AC 8005D3AC 21083100 */  addu       $at, $at, $s1
    /* 4D3B0 8005D3B0 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4D3B4 8005D3B4 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4D3B8 8005D3B8 5A000424 */   addiu     $a0, $zero, 0x5A
  .L8005D3BC:
    /* 4D3BC 8005D3BC 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D3C0 8005D3C0 21083100 */  addu       $at, $at, $s1
    /* 4D3C4 8005D3C4 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4D3C8 8005D3C8 1280023C */  lui        $v0, %hi(deltaload)
    /* 4D3CC 8005D3CC 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4D3D0 8005D3D0 00000000 */  nop
    /* 4D3D4 8005D3D4 82004014 */  bnez       $v0, .L8005D5E0
    /* 4D3D8 8005D3D8 21100000 */   addu      $v0, $zero, $zero
    /* 4D3DC 8005D3DC 40101200 */  sll        $v0, $s2, 1
    /* 4D3E0 8005D3E0 21105200 */  addu       $v0, $v0, $s2
    /* 4D3E4 8005D3E4 80100200 */  sll        $v0, $v0, 2
    /* 4D3E8 8005D3E8 21105200 */  addu       $v0, $v0, $s2
    /* 4D3EC 8005D3EC 00110200 */  sll        $v0, $v0, 4
    /* 4D3F0 8005D3F0 23105200 */  subu       $v0, $v0, $s2
    /* 4D3F4 8005D3F4 80100200 */  sll        $v0, $v0, 2
    /* 4D3F8 8005D3F8 21105200 */  addu       $v0, $v0, $s2
    /* 4D3FC 8005D3FC C0100200 */  sll        $v0, $v0, 3
    /* 4D400 8005D400 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 4D404 8005D404 21082200 */  addu       $at, $at, $v0
    /* 4D408 8005D408 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 4D40C 8005D40C 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 4D410 8005D410 21082200 */  addu       $at, $at, $v0
    /* 4D414 8005D414 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 4D418 8005D418 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* 4D41C 8005D41C 21082200 */  addu       $at, $at, $v0
    /* 4D420 8005D420 7AA52380 */  lb         $v1, %lo(plr + 0x42)($at)
    /* 4D424 8005D424 27000224 */  addiu      $v0, $zero, 0x27
    /* 4D428 8005D428 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4D42C 8005D42C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4D430 8005D430 1800A2AF */  sw         $v0, 0x18($sp)
    /* 4D434 8005D434 1280023C */  lui        $v0, %hi(leveltype)
    /* 4D438 8005D438 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 4D43C 8005D43C 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 4D440 8005D440 2000A0AF */  sw         $zero, 0x20($sp)
    /* 4D444 8005D444 21308000 */  addu       $a2, $a0, $zero
    /* 4D448 8005D448 40100200 */  sll        $v0, $v0, 1
    /* 4D44C 8005D44C 2138A000 */  addu       $a3, $a1, $zero
    /* 4D450 8005D450 1000A3AF */  sw         $v1, 0x10($sp)
    /* 4D454 8005D454 810A050C */  jal        func_80142A04
    /* 4D458 8005D458 2400A2AF */   sw        $v0, 0x24($sp)
    /* 4D45C 8005D45C 6B750108 */  j          .L8005D5AC
    /* 4D460 8005D460 00000000 */   nop
  .L8005D464:
    /* 4D464 8005D464 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D468 8005D468 21083100 */  addu       $at, $at, $s1
    /* 4D46C 8005D46C 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4D470 8005D470 00000000 */  nop
    /* 4D474 8005D474 57004010 */  beqz       $v0, .L8005D5D4
    /* 4D478 8005D478 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 4D47C 8005D47C FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 4D480 8005D480 FFFF1424 */  addiu      $s4, $zero, -0x1
    /* 4D484 8005D484 21B00000 */  addu       $s6, $zero, $zero
    /* 4D488 8005D488 1280023C */  lui        $v0, %hi(deltaload)
    /* 4D48C 8005D48C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4D490 8005D490 00000000 */  nop
    /* 4D494 8005D494 09004014 */  bnez       $v0, .L8005D4BC
    /* 4D498 8005D498 21A80000 */   addu      $s5, $zero, $zero
    /* 4D49C 8005D49C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4D4A0 8005D4A0 21083100 */  addu       $at, $at, $s1
    /* 4D4A4 8005D4A4 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4D4A8 8005D4A8 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4D4AC 8005D4AC 21083100 */  addu       $at, $at, $s1
    /* 4D4B0 8005D4B0 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4D4B4 8005D4B4 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4D4B8 8005D4B8 5A000424 */   addiu     $a0, $zero, 0x5A
  .L8005D4BC:
    /* 4D4BC 8005D4BC 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4D4C0 8005D4C0 21083100 */  addu       $at, $at, $s1
    /* 4D4C4 8005D4C4 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4D4C8 8005D4C8 1280023C */  lui        $v0, %hi(deltaload)
    /* 4D4CC 8005D4CC 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4D4D0 8005D4D0 00000000 */  nop
    /* 4D4D4 8005D4D4 42004014 */  bnez       $v0, .L8005D5E0
    /* 4D4D8 8005D4D8 21100000 */   addu      $v0, $zero, $zero
    /* 4D4DC 8005D4DC 1280023C */  lui        $v0, %hi(myplr)
    /* 4D4E0 8005D4E0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4D4E4 8005D4E4 00000000 */  nop
    /* 4D4E8 8005D4E8 3D004216 */  bne        $s2, $v0, .L8005D5E0
    /* 4D4EC 8005D4EC 21100000 */   addu      $v0, $zero, $zero
  .L8005D4F0:
    /* 4D4F0 8005D4F0 C9F6000C */  jal        ENG_random__Fl
    /* 4D4F4 8005D4F4 04000424 */   addiu     $a0, $zero, 0x4
    /* 4D4F8 8005D4F8 21804000 */  addu       $s0, $v0, $zero
    /* 4D4FC 8005D4FC 23001412 */  beq        $s0, $s4, .L8005D58C
    /* 4D500 8005D500 01000224 */   addiu     $v0, $zero, 0x1
    /* 4D504 8005D504 12000212 */  beq        $s0, $v0, .L8005D550
    /* 4D508 8005D508 0200022A */   slti      $v0, $s0, 0x2
    /* 4D50C 8005D50C 05004010 */  beqz       $v0, .L8005D524
    /* 4D510 8005D510 00000000 */   nop
    /* 4D514 8005D514 0A000012 */  beqz       $s0, .L8005D540
    /* 4D518 8005D518 21204002 */   addu      $a0, $s2, $zero
    /* 4D51C 8005D51C 61750108 */  j          .L8005D584
    /* 4D520 8005D520 21A00002 */   addu      $s4, $s0, $zero
  .L8005D524:
    /* 4D524 8005D524 02000224 */  addiu      $v0, $zero, 0x2
    /* 4D528 8005D528 0E000212 */  beq        $s0, $v0, .L8005D564
    /* 4D52C 8005D52C 03000224 */   addiu     $v0, $zero, 0x3
    /* 4D530 8005D530 11000212 */  beq        $s0, $v0, .L8005D578
    /* 4D534 8005D534 21204002 */   addu      $a0, $s2, $zero
    /* 4D538 8005D538 61750108 */  j          .L8005D584
    /* 4D53C 8005D53C 21A00002 */   addu      $s4, $s0, $zero
  .L8005D540:
    /* 4D540 8005D540 6897010C */  jal        ModifyPlrStr__Fii
    /* 4D544 8005D544 21286002 */   addu      $a1, $s3, $zero
    /* 4D548 8005D548 61750108 */  j          .L8005D584
    /* 4D54C 8005D54C 21A00002 */   addu      $s4, $s0, $zero
  .L8005D550:
    /* 4D550 8005D550 21204002 */  addu       $a0, $s2, $zero
    /* 4D554 8005D554 AF97010C */  jal        ModifyPlrMag__Fii
    /* 4D558 8005D558 21286002 */   addu      $a1, $s3, $zero
    /* 4D55C 8005D55C 61750108 */  j          .L8005D584
    /* 4D560 8005D560 21A00002 */   addu      $s4, $s0, $zero
  .L8005D564:
    /* 4D564 8005D564 21204002 */  addu       $a0, $s2, $zero
    /* 4D568 8005D568 EA97010C */  jal        ModifyPlrDex__Fii
    /* 4D56C 8005D56C 21286002 */   addu      $a1, $s3, $zero
    /* 4D570 8005D570 61750108 */  j          .L8005D584
    /* 4D574 8005D574 21A00002 */   addu      $s4, $s0, $zero
  .L8005D578:
    /* 4D578 8005D578 2398010C */  jal        ModifyPlrVit__Fii
    /* 4D57C 8005D57C 21286002 */   addu      $a1, $s3, $zero
    /* 4D580 8005D580 21A00002 */  addu       $s4, $s0, $zero
  .L8005D584:
    /* 4D584 8005D584 01001324 */  addiu      $s3, $zero, 0x1
    /* 4D588 8005D588 0100B526 */  addiu      $s5, $s5, 0x1
  .L8005D58C:
    /* 4D58C 8005D58C 0200A22A */  slti       $v0, $s5, 0x2
    /* 4D590 8005D590 02004014 */  bnez       $v0, .L8005D59C
    /* 4D594 8005D594 00000000 */   nop
    /* 4D598 8005D598 01001624 */  addiu      $s6, $zero, 0x1
  .L8005D59C:
    /* 4D59C 8005D59C D4FFC012 */  beqz       $s6, .L8005D4F0
    /* 4D5A0 8005D5A0 00000000 */   nop
    /* 4D5A4 8005D5A4 F396010C */  jal        CheckStats__Fi
    /* 4D5A8 8005D5A8 21204002 */   addu      $a0, $s2, $zero
  .L8005D5AC:
    /* 4D5AC 8005D5AC 1280023C */  lui        $v0, %hi(myplr)
    /* 4D5B0 8005D5B0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4D5B4 8005D5B4 00000000 */  nop
    /* 4D5B8 8005D5B8 05004216 */  bne        $s2, $v0, .L8005D5D0
    /* 4D5BC 8005D5BC 01001324 */   addiu     $s3, $zero, 0x1
    /* 4D5C0 8005D5C0 21200000 */  addu       $a0, $zero, $zero
    /* 4D5C4 8005D5C4 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4D5C8 8005D5C8 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 4D5CC 8005D5CC FFFFE632 */   andi      $a2, $s7, 0xFFFF
  .L8005D5D0:
    /* 4D5D0 8005D5D0 FF000224 */  addiu      $v0, $zero, 0xFF
  .L8005D5D4:
    /* 4D5D4 8005D5D4 1280013C */  lui        $at, %hi(force_redraw)
    /* 4D5D8 8005D5D8 90B722AC */  sw         $v0, %lo(force_redraw)($at)
    /* 4D5DC 8005D5DC 21106002 */  addu       $v0, $s3, $zero
  .L8005D5E0:
    /* 4D5E0 8005D5E0 4800BF8F */  lw         $ra, 0x48($sp)
    /* 4D5E4 8005D5E4 4400B78F */  lw         $s7, 0x44($sp)
    /* 4D5E8 8005D5E8 4000B68F */  lw         $s6, 0x40($sp)
    /* 4D5EC 8005D5EC 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 4D5F0 8005D5F0 3800B48F */  lw         $s4, 0x38($sp)
    /* 4D5F4 8005D5F4 3400B38F */  lw         $s3, 0x34($sp)
    /* 4D5F8 8005D5F8 3000B28F */  lw         $s2, 0x30($sp)
    /* 4D5FC 8005D5FC 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 4D600 8005D600 2800B08F */  lw         $s0, 0x28($sp)
    /* 4D604 8005D604 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 4D608 8005D608 0800E003 */  jr         $ra
    /* 4D60C 8005D60C 00000000 */   nop
endlabel OperateFountains__Fii
