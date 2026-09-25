.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateInnSignChest__Fii, 0x1D8

glabel OperateInnSignChest__Fii
    /* 491A4 800591A4 1280023C */  lui        $v0, %hi(numitems)
    /* 491A8 800591A8 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 491AC 800591AC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 491B0 800591B0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 491B4 800591B4 2188A000 */  addu       $s1, $a1, $zero
    /* 491B8 800591B8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 491BC 800591BC 7F004228 */  slti       $v0, $v0, 0x7F
    /* 491C0 800591C0 05004014 */  bnez       $v0, .L800591D8
    /* 491C4 800591C4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 491C8 800591C8 C6F5000C */  jal        PlaySFX__Fi
    /* 491CC 800591CC D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 491D0 800591D0 D9640108 */  j          .L80059364
    /* 491D4 800591D4 00000000 */   nop
  .L800591D8:
    /* 491D8 800591D8 0E80023C */  lui        $v0, %hi(quests + 0x9B)
    /* 491DC 800591DC DBDA4290 */  lbu        $v0, %lo(quests + 0x9B)($v0)
    /* 491E0 800591E0 00000000 */  nop
    /* 491E4 800591E4 0200422C */  sltiu      $v0, $v0, 0x2
    /* 491E8 800591E8 29004010 */  beqz       $v0, .L80059290
    /* 491EC 800591EC 40101100 */   sll       $v0, $s1, 1
    /* 491F0 800591F0 1280023C */  lui        $v0, %hi(deltaload)
    /* 491F4 800591F4 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 491F8 800591F8 00000000 */  nop
    /* 491FC 800591FC 59004014 */  bnez       $v0, .L80059364
    /* 49200 80059200 00000000 */   nop
    /* 49204 80059204 1280023C */  lui        $v0, %hi(myplr)
    /* 49208 80059208 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4920C 8005920C 00000000 */  nop
    /* 49210 80059210 54008214 */  bne        $a0, $v0, .L80059364
    /* 49214 80059214 40100400 */   sll       $v0, $a0, 1
    /* 49218 80059218 21104400 */  addu       $v0, $v0, $a0
    /* 4921C 8005921C 80100200 */  sll        $v0, $v0, 2
    /* 49220 80059220 21104400 */  addu       $v0, $v0, $a0
    /* 49224 80059224 00110200 */  sll        $v0, $v0, 4
    /* 49228 80059228 23104400 */  subu       $v0, $v0, $a0
    /* 4922C 8005922C 80100200 */  sll        $v0, $v0, 2
    /* 49230 80059230 21104400 */  addu       $v0, $v0, $a0
    /* 49234 80059234 C0100200 */  sll        $v0, $v0, 3
    /* 49238 80059238 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 4923C 8005923C 21082200 */  addu       $at, $at, $v0
    /* 49240 80059240 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 49244 80059244 00000000 */  nop
    /* 49248 80059248 05006014 */  bnez       $v1, .L80059260
    /* 4924C 8005924C 01000224 */   addiu     $v0, $zero, 0x1
    /* 49250 80059250 C6F5000C */  jal        PlaySFX__Fi
    /* 49254 80059254 E9020424 */   addiu     $a0, $zero, 0x2E9
    /* 49258 80059258 D9640108 */  j          .L80059364
    /* 4925C 8005925C 00000000 */   nop
  .L80059260:
    /* 49260 80059260 05006214 */  bne        $v1, $v0, .L80059278
    /* 49264 80059264 02000224 */   addiu     $v0, $zero, 0x2
    /* 49268 80059268 C6F5000C */  jal        PlaySFX__Fi
    /* 4926C 8005926C 7B020424 */   addiu     $a0, $zero, 0x27B
    /* 49270 80059270 D9640108 */  j          .L80059364
    /* 49274 80059274 00000000 */   nop
  .L80059278:
    /* 49278 80059278 3A006214 */  bne        $v1, $v0, .L80059364
    /* 4927C 8005927C 00000000 */   nop
    /* 49280 80059280 C6F5000C */  jal        PlaySFX__Fi
    /* 49284 80059284 13020424 */   addiu     $a0, $zero, 0x213
    /* 49288 80059288 D9640108 */  j          .L80059364
    /* 4928C 8005928C 00000000 */   nop
  .L80059290:
    /* 49290 80059290 21105100 */  addu       $v0, $v0, $s1
    /* 49294 80059294 80100200 */  sll        $v0, $v0, 2
    /* 49298 80059298 23105100 */  subu       $v0, $v0, $s1
    /* 4929C 8005929C 80800200 */  sll        $s0, $v0, 2
    /* 492A0 800592A0 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 492A4 800592A4 21083000 */  addu       $at, $at, $s0
    /* 492A8 800592A8 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 492AC 800592AC 00000000 */  nop
    /* 492B0 800592B0 2C004010 */  beqz       $v0, .L80059364
    /* 492B4 800592B4 00000000 */   nop
    /* 492B8 800592B8 1280023C */  lui        $v0, %hi(deltaload)
    /* 492BC 800592BC 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 492C0 800592C0 00000000 */  nop
    /* 492C4 800592C4 0A004014 */  bnez       $v0, .L800592F0
    /* 492C8 800592C8 02000224 */   addiu     $v0, $zero, 0x2
    /* 492CC 800592CC 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 492D0 800592D0 21083000 */  addu       $at, $at, $s0
    /* 492D4 800592D4 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 492D8 800592D8 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 492DC 800592DC 21083000 */  addu       $at, $at, $s0
    /* 492E0 800592E0 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 492E4 800592E4 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 492E8 800592E8 12000424 */   addiu     $a0, $zero, 0x12
    /* 492EC 800592EC 02000224 */  addiu      $v0, $zero, 0x2
  .L800592F0:
    /* 492F0 800592F0 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 492F4 800592F4 21083000 */  addu       $at, $at, $s0
    /* 492F8 800592F8 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 492FC 800592FC 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 49300 80059300 21083000 */  addu       $at, $at, $s0
    /* 49304 80059304 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 49308 80059308 1280023C */  lui        $v0, %hi(deltaload)
    /* 4930C 8005930C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 49310 80059310 00000000 */  nop
    /* 49314 80059314 13004014 */  bnez       $v0, .L80059364
    /* 49318 80059318 1800A627 */   addiu     $a2, $sp, 0x18
    /* 4931C 8005931C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 49320 80059320 21083000 */  addu       $at, $at, $s0
    /* 49324 80059324 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 49328 80059328 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4932C 8005932C 21083000 */  addu       $at, $at, $s0
    /* 49330 80059330 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 49334 80059334 7F02010C */  jal        GetSuperItemLoc__FiiRiT2
    /* 49338 80059338 1C00A727 */   addiu     $a3, $sp, 0x1C
    /* 4933C 8005933C 0C000424 */  addiu      $a0, $zero, 0xC
    /* 49340 80059340 1000A0AF */  sw         $zero, 0x10($sp)
    /* 49344 80059344 1800A58F */  lw         $a1, 0x18($sp)
    /* 49348 80059348 1C00A68F */  lw         $a2, 0x1C($sp)
    /* 4934C 8005934C 8214010C */  jal        SpawnQuestItem__Fiiiii
    /* 49350 80059350 21380000 */   addu      $a3, $zero, $zero
    /* 49354 80059354 21200000 */  addu       $a0, $zero, $zero
    /* 49358 80059358 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4935C 8005935C 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 49360 80059360 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L80059364:
    /* 49364 80059364 2800BF8F */  lw         $ra, 0x28($sp)
    /* 49368 80059368 2400B18F */  lw         $s1, 0x24($sp)
    /* 4936C 8005936C 2000B08F */  lw         $s0, 0x20($sp)
    /* 49370 80059370 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 49374 80059374 0800E003 */  jr         $ra
    /* 49378 80059378 00000000 */   nop
endlabel OperateInnSignChest__Fii
