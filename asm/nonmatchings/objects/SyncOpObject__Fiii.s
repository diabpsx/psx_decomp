.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncOpObject__Fiii, 0x210

glabel SyncOpObject__Fiii
    /* 4E1A4 8005E1A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4E1A8 8005E1A8 40100600 */  sll        $v0, $a2, 1
    /* 4E1AC 8005E1AC 21104600 */  addu       $v0, $v0, $a2
    /* 4E1B0 8005E1B0 80100200 */  sll        $v0, $v0, 2
    /* 4E1B4 8005E1B4 23104600 */  subu       $v0, $v0, $a2
    /* 4E1B8 8005E1B8 80100200 */  sll        $v0, $v0, 2
    /* 4E1BC 8005E1BC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 4E1C0 8005E1C0 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4E1C4 8005E1C4 21082200 */  addu       $at, $at, $v0
    /* 4E1C8 8005E1C8 6A8C2290 */  lbu        $v0, %lo(object + 0x1E)($at)
    /* 4E1CC 8005E1CC 00000000 */  nop
    /* 4E1D0 8005E1D0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4E1D4 8005E1D4 00160200 */  sll        $v0, $v0, 24
    /* 4E1D8 8005E1D8 031E0200 */  sra        $v1, $v0, 24
    /* 4E1DC 8005E1DC 6100622C */  sltiu      $v0, $v1, 0x61
    /* 4E1E0 8005E1E0 70004010 */  beqz       $v0, .L8005E3A4
    /* 4E1E4 8005E1E4 80100300 */   sll       $v0, $v1, 2
    /* 4E1E8 8005E1E8 1180013C */  lui        $at, %hi(jtbl_80117158)
    /* 4E1EC 8005E1EC 21082200 */  addu       $at, $at, $v0
    /* 4E1F0 8005E1F0 5871228C */  lw         $v0, %lo(jtbl_80117158)($at)
    /* 4E1F4 8005E1F4 00000000 */  nop
    /* 4E1F8 8005E1F8 08004000 */  jr         $v0
    /* 4E1FC 8005E1FC 00000000 */   nop
  jlabel .L8005E200
    /* 4E200 8005E200 9A77010C */  jal        SyncOpL1Door__Fiii
    /* 4E204 8005E204 00000000 */   nop
    /* 4E208 8005E208 E9780108 */  j          .L8005E3A4
    /* 4E20C 8005E20C 00000000 */   nop
  jlabel .L8005E210
    /* 4E210 8005E210 DF77010C */  jal        SyncOpL2Door__Fiii
    /* 4E214 8005E214 00000000 */   nop
    /* 4E218 8005E218 E9780108 */  j          .L8005E3A4
    /* 4E21C 8005E21C 00000000 */   nop
  jlabel .L8005E220
    /* 4E220 8005E220 2478010C */  jal        SyncOpL3Door__Fiii
    /* 4E224 8005E224 00000000 */   nop
    /* 4E228 8005E228 E9780108 */  j          .L8005E3A4
    /* 4E22C 8005E22C 00000000 */   nop
  jlabel .L8005E230
    /* 4E230 8005E230 135F010C */  jal        OperateLever__Fii
    /* 4E234 8005E234 2128C000 */   addu      $a1, $a2, $zero
    /* 4E238 8005E238 E9780108 */  j          .L8005E3A4
    /* 4E23C 8005E23C 00000000 */   nop
  jlabel .L8005E240
    /* 4E240 8005E240 2128C000 */  addu       $a1, $a2, $zero
    /* 4E244 8005E244 F462010C */  jal        OperateChest__FiiUc
    /* 4E248 8005E248 21300000 */   addu      $a2, $zero, $zero
    /* 4E24C 8005E24C E9780108 */  j          .L8005E3A4
    /* 4E250 8005E250 00000000 */   nop
  jlabel .L8005E254
    /* 4E254 8005E254 2128C000 */  addu       $a1, $a2, $zero
    /* 4E258 8005E258 E765010C */  jal        OperateSarc__FiiUc
    /* 4E25C 8005E25C 21300000 */   addu      $a2, $zero, $zero
    /* 4E260 8005E260 E9780108 */  j          .L8005E3A4
    /* 4E264 8005E264 00000000 */   nop
  jlabel .L8005E268
    /* 4E268 8005E268 3F61010C */  jal        OperateBookLever__Fii
    /* 4E26C 8005E26C 2128C000 */   addu      $a1, $a2, $zero
    /* 4E270 8005E270 E9780108 */  j          .L8005E3A4
    /* 4E274 8005E274 00000000 */   nop
  jlabel .L8005E278
    /* 4E278 8005E278 2128C000 */  addu       $a1, $a2, $zero
    /* 4E27C 8005E27C 1E69010C */  jal        OperateShrine__Fiii
    /* 4E280 8005E280 2C000624 */   addiu     $a2, $zero, 0x2C
    /* 4E284 8005E284 E9780108 */  j          .L8005E3A4
    /* 4E288 8005E288 00000000 */   nop
  jlabel .L8005E28C
    /* 4E28C 8005E28C 2128C000 */  addu       $a1, $a2, $zero
    /* 4E290 8005E290 1472010C */  jal        OperateSkelBook__FiiUc
    /* 4E294 8005E294 21300000 */   addu      $a2, $zero, $zero
    /* 4E298 8005E298 E9780108 */  j          .L8005E3A4
    /* 4E29C 8005E29C 00000000 */   nop
  jlabel .L8005E2A0
    /* 4E2A0 8005E2A0 2128C000 */  addu       $a1, $a2, $zero
    /* 4E2A4 8005E2A4 7272010C */  jal        OperateBookCase__FiiUc
    /* 4E2A8 8005E2A8 21300000 */   addu      $a2, $zero, $zero
    /* 4E2AC 8005E2AC E9780108 */  j          .L8005E3A4
    /* 4E2B0 8005E2B0 00000000 */   nop
  jlabel .L8005E2B4
    /* 4E2B4 8005E2B4 8C5F010C */  jal        OperateBook__Fii
    /* 4E2B8 8005E2B8 2128C000 */   addu      $a1, $a2, $zero
    /* 4E2BC 8005E2BC E9780108 */  j          .L8005E3A4
    /* 4E2C0 8005E2C0 00000000 */   nop
  jlabel .L8005E2C4
    /* 4E2C4 8005E2C4 2128C000 */  addu       $a1, $a2, $zero
    /* 4E2C8 8005E2C8 F872010C */  jal        OperateDecap__FiiUc
    /* 4E2CC 8005E2CC 21300000 */   addu      $a2, $zero, $zero
    /* 4E2D0 8005E2D0 E9780108 */  j          .L8005E3A4
    /* 4E2D4 8005E2D4 00000000 */   nop
  jlabel .L8005E2D8
    /* 4E2D8 8005E2D8 2128C000 */  addu       $a1, $a2, $zero
    /* 4E2DC 8005E2DC 3273010C */  jal        OperateArmorStand__FiiUc
    /* 4E2E0 8005E2E0 21300000 */   addu      $a2, $zero, $zero
    /* 4E2E4 8005E2E4 E9780108 */  j          .L8005E3A4
    /* 4E2E8 8005E2E8 00000000 */   nop
  jlabel .L8005E2EC
    /* 4E2EC 8005E2EC 2128C000 */  addu       $a1, $a2, $zero
    /* 4E2F0 8005E2F0 C873010C */  jal        OperateGoatShrine__Fiii
    /* 4E2F4 8005E2F4 5D000624 */   addiu     $a2, $zero, 0x5D
    /* 4E2F8 8005E2F8 E9780108 */  j          .L8005E3A4
    /* 4E2FC 8005E2FC 00000000 */   nop
  jlabel .L8005E300
    /* 4E300 8005E300 2128C000 */  addu       $a1, $a2, $zero
    /* 4E304 8005E304 F273010C */  jal        OperateCauldron__Fiii
    /* 4E308 8005E308 4C000624 */   addiu     $a2, $zero, 0x4C
    /* 4E30C 8005E30C E9780108 */  j          .L8005E3A4
    /* 4E310 8005E310 00000000 */   nop
  jlabel .L8005E314
    /* 4E314 8005E314 1B74010C */  jal        OperateFountains__Fii
    /* 4E318 8005E318 2128C000 */   addu      $a1, $a2, $zero
    /* 4E31C 8005E31C E9780108 */  j          .L8005E3A4
    /* 4E320 8005E320 00000000 */   nop
  jlabel .L8005E324
    /* 4E324 8005E324 EE75010C */  jal        OperateStoryBook__Fii
    /* 4E328 8005E328 2128C000 */   addu      $a1, $a2, $zero
    /* 4E32C 8005E32C E9780108 */  j          .L8005E3A4
    /* 4E330 8005E330 00000000 */   nop
  jlabel .L8005E334
    /* 4E334 8005E334 4567010C */  jal        OperatePedistal__Fii
    /* 4E338 8005E338 2128C000 */   addu      $a1, $a2, $zero
    /* 4E33C 8005E33C E9780108 */  j          .L8005E3A4
    /* 4E340 8005E340 00000000 */   nop
  jlabel .L8005E344
    /* 4E344 8005E344 2128C000 */  addu       $a1, $a2, $zero
    /* 4E348 8005E348 8475010C */  jal        OperateWeaponRack__FiiUc
    /* 4E34C 8005E34C 21300000 */   addu      $a2, $zero, $zero
    /* 4E350 8005E350 E9780108 */  j          .L8005E3A4
    /* 4E354 8005E354 00000000 */   nop
  jlabel .L8005E358
    /* 4E358 8005E358 E463010C */  jal        OperateMushPatch__Fii
    /* 4E35C 8005E35C 2128C000 */   addu      $a1, $a2, $zero
    /* 4E360 8005E360 E9780108 */  j          .L8005E3A4
    /* 4E364 8005E364 00000000 */   nop
  jlabel .L8005E368
    /* 4E368 8005E368 2128C000 */  addu       $a1, $a2, $zero
    /* 4E36C 8005E36C DF64010C */  jal        OperateSlainHero__FiiUc
    /* 4E370 8005E370 21300000 */   addu      $a2, $zero, $zero
    /* 4E374 8005E374 E9780108 */  j          .L8005E3A4
    /* 4E378 8005E378 00000000 */   nop
  jlabel .L8005E37C
    /* 4E37C 8005E37C 6964010C */  jal        OperateInnSignChest__Fii
    /* 4E380 8005E380 2128C000 */   addu      $a1, $a2, $zero
    /* 4E384 8005E384 E9780108 */  j          .L8005E3A4
    /* 4E388 8005E388 00000000 */   nop
  jlabel .L8005E38C
    /* 4E38C 8005E38C 6562010C */  jal        OperateSChambBk__Fii
    /* 4E390 8005E390 2128C000 */   addu      $a1, $a2, $zero
    /* 4E394 8005E394 E9780108 */  j          .L8005E3A4
    /* 4E398 8005E398 00000000 */   nop
  jlabel .L8005E39C
    /* 4E39C 8005E39C 2B76010C */  jal        OperateLazStand__Fii
    /* 4E3A0 8005E3A0 2128C000 */   addu      $a1, $a2, $zero
  jlabel .L8005E3A4
    /* 4E3A4 8005E3A4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4E3A8 8005E3A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4E3AC 8005E3AC 0800E003 */  jr         $ra
    /* 4E3B0 8005E3B0 00000000 */   nop
endlabel SyncOpObject__Fiii
