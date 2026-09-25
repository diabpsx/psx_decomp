.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeltaAddItem__Fi, 0x228

glabel DeltaAddItem__Fi
    /* 3F338 8004F338 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3F33C 8004F33C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3F340 8004F340 21808000 */  addu       $s0, $a0, $zero
    /* 3F344 8004F344 1280053C */  lui        $a1, %hi(setlevel)
    /* 3F348 8004F348 0EC1A590 */  lbu        $a1, %lo(setlevel)($a1)
    /* 3F34C 8004F34C 1280043C */  lui        $a0, %hi(currlevel)
    /* 3F350 8004F350 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 3F354 8004F354 1400BFAF */  sw         $ra, 0x14($sp)
    /* 3F358 8004F358 224A010C */  jal        GetDLevel__Fib
    /* 3F35C 8004F35C 2B280500 */   sltu      $a1, $zero, $a1
    /* 3F360 8004F360 21204000 */  addu       $a0, $v0, $zero
    /* 3F364 8004F364 21508000 */  addu       $t2, $a0, $zero
    /* 3F368 8004F368 21388000 */  addu       $a3, $a0, $zero
    /* 3F36C 8004F36C 21400000 */  addu       $t0, $zero, $zero
    /* 3F370 8004F370 C0101000 */  sll        $v0, $s0, 3
    /* 3F374 8004F374 23105000 */  subu       $v0, $v0, $s0
    /* 3F378 8004F378 80100200 */  sll        $v0, $v0, 2
    /* 3F37C 8004F37C 23105000 */  subu       $v0, $v0, $s0
    /* 3F380 8004F380 80480200 */  sll        $t1, $v0, 2
    /* 3F384 8004F384 10008524 */  addiu      $a1, $a0, 0x10
  .L8004F388:
    /* 3F388 8004F388 0000E690 */  lbu        $a2, 0x0($a3)
    /* 3F38C 8004F38C FF000224 */  addiu      $v0, $zero, 0xFF
    /* 3F390 8004F390 1800C210 */  beq        $a2, $v0, .L8004F3F4
    /* 3F394 8004F394 00000000 */   nop
    /* 3F398 8004F398 FAFFA394 */  lhu        $v1, -0x6($a1)
    /* 3F39C 8004F39C 0D80013C */  lui        $at, %hi(item + 0x2E)
    /* 3F3A0 8004F3A0 21082900 */  addu       $at, $at, $t1
    /* 3F3A4 8004F3A4 821D2284 */  lh         $v0, %lo(item + 0x2E)($at)
    /* 3F3A8 8004F3A8 00000000 */  nop
    /* 3F3AC 8004F3AC 11006214 */  bne        $v1, $v0, .L8004F3F4
    /* 3F3B0 8004F3B0 00000000 */   nop
    /* 3F3B4 8004F3B4 FCFFA394 */  lhu        $v1, -0x4($a1)
    /* 3F3B8 8004F3B8 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3F3BC 8004F3BC 21082900 */  addu       $at, $at, $t1
    /* 3F3C0 8004F3C0 781D2294 */  lhu        $v0, %lo(item + 0x24)($at)
    /* 3F3C4 8004F3C4 00000000 */  nop
    /* 3F3C8 8004F3C8 0A006214 */  bne        $v1, $v0, .L8004F3F4
    /* 3F3CC 8004F3CC 00000000 */   nop
    /* 3F3D0 8004F3D0 0000A38C */  lw         $v1, 0x0($a1)
    /* 3F3D4 8004F3D4 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3F3D8 8004F3D8 21082900 */  addu       $at, $at, $t1
    /* 3F3DC 8004F3DC 641D228C */  lw         $v0, %lo(item + 0x10)($at)
    /* 3F3E0 8004F3E0 00000000 */  nop
    /* 3F3E4 8004F3E4 03006214 */  bne        $v1, $v0, .L8004F3F4
    /* 3F3E8 8004F3E8 0200C22C */   sltiu     $v0, $a2, 0x2
    /* 3F3EC 8004F3EC 55004014 */  bnez       $v0, .L8004F544
    /* 3F3F0 8004F3F0 00000000 */   nop
  .L8004F3F4:
    /* 3F3F4 8004F3F4 01000825 */  addiu      $t0, $t0, 0x1
    /* 3F3F8 8004F3F8 1800A524 */  addiu      $a1, $a1, 0x18
    /* 3F3FC 8004F3FC 7F000229 */  slti       $v0, $t0, 0x7F
    /* 3F400 8004F400 E1FF4014 */  bnez       $v0, .L8004F388
    /* 3F404 8004F404 1800E724 */   addiu     $a3, $a3, 0x18
    /* 3F408 8004F408 21384001 */  addu       $a3, $t2, $zero
    /* 3F40C 8004F40C 21400000 */  addu       $t0, $zero, $zero
    /* 3F410 8004F410 C0101000 */  sll        $v0, $s0, 3
    /* 3F414 8004F414 23105000 */  subu       $v0, $v0, $s0
    /* 3F418 8004F418 80100200 */  sll        $v0, $v0, 2
    /* 3F41C 8004F41C 23105000 */  subu       $v0, $v0, $s0
    /* 3F420 8004F420 80300200 */  sll        $a2, $v0, 2
    /* 3F424 8004F424 1400E524 */  addiu      $a1, $a3, 0x14
  .L8004F428:
    /* 3F428 8004F428 0000E390 */  lbu        $v1, 0x0($a3)
    /* 3F42C 8004F42C FF000224 */  addiu      $v0, $zero, 0xFF
    /* 3F430 8004F430 40006214 */  bne        $v1, $v0, .L8004F534
    /* 3F434 8004F434 01000825 */   addiu     $t0, $t0, 0x1
    /* 3F438 8004F438 01000224 */  addiu      $v0, $zero, 0x1
    /* 3F43C 8004F43C B52082A3 */  sb         $v0, %gp_rel(D_8011C835)($gp)
    /* 3F440 8004F440 0000E0A0 */  sb         $zero, 0x0($a3)
    /* 3F444 8004F444 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 3F448 8004F448 21082600 */  addu       $at, $at, $a2
    /* 3F44C 8004F44C A61D2290 */  lbu        $v0, %lo(item + 0x52)($at)
    /* 3F450 8004F450 00000000 */  nop
    /* 3F454 8004F454 EDFFA2A0 */  sb         $v0, -0x13($a1)
    /* 3F458 8004F458 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 3F45C 8004F45C 21082600 */  addu       $at, $at, $a2
    /* 3F460 8004F460 A71D2290 */  lbu        $v0, %lo(item + 0x53)($at)
    /* 3F464 8004F464 00000000 */  nop
    /* 3F468 8004F468 EEFFA2A0 */  sb         $v0, -0x12($a1)
    /* 3F46C 8004F46C 0D80013C */  lui        $at, %hi(item + 0x2E)
    /* 3F470 8004F470 21082600 */  addu       $at, $at, $a2
    /* 3F474 8004F474 821D2294 */  lhu        $v0, %lo(item + 0x2E)($at)
    /* 3F478 8004F478 00000000 */  nop
    /* 3F47C 8004F47C F6FFA2A4 */  sh         $v0, -0xA($a1)
    /* 3F480 8004F480 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3F484 8004F484 21082600 */  addu       $at, $at, $a2
    /* 3F488 8004F488 781D2294 */  lhu        $v0, %lo(item + 0x24)($at)
    /* 3F48C 8004F48C 00000000 */  nop
    /* 3F490 8004F490 F8FFA2A4 */  sh         $v0, -0x8($a1)
    /* 3F494 8004F494 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3F498 8004F498 21082600 */  addu       $at, $at, $a2
    /* 3F49C 8004F49C 641D228C */  lw         $v0, %lo(item + 0x10)($at)
    /* 3F4A0 8004F4A0 00000000 */  nop
    /* 3F4A4 8004F4A4 FCFFA2AC */  sw         $v0, -0x4($a1)
    /* 3F4A8 8004F4A8 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 3F4AC 8004F4AC 21082600 */  addu       $at, $at, $a2
    /* 3F4B0 8004F4B0 BD1D2290 */  lbu        $v0, %lo(item + 0x69)($at)
    /* 3F4B4 8004F4B4 00000000 */  nop
    /* 3F4B8 8004F4B8 EFFFA2A0 */  sb         $v0, -0x11($a1)
    /* 3F4BC 8004F4BC 0D80013C */  lui        $at, %hi(item + 0x3E)
    /* 3F4C0 8004F4C0 21082600 */  addu       $at, $at, $a2
    /* 3F4C4 8004F4C4 921D2294 */  lhu        $v0, %lo(item + 0x3E)($at)
    /* 3F4C8 8004F4C8 00000000 */  nop
    /* 3F4CC 8004F4CC F0FFA2A0 */  sb         $v0, -0x10($a1)
    /* 3F4D0 8004F4D0 0D80013C */  lui        $at, %hi(item + 0x40)
    /* 3F4D4 8004F4D4 21082600 */  addu       $at, $at, $a2
    /* 3F4D8 8004F4D8 941D2294 */  lhu        $v0, %lo(item + 0x40)($at)
    /* 3F4DC 8004F4DC 00000000 */  nop
    /* 3F4E0 8004F4E0 F1FFA2A0 */  sb         $v0, -0xF($a1)
    /* 3F4E4 8004F4E4 0D80013C */  lui        $at, %hi(item + 0x49)
    /* 3F4E8 8004F4E8 21082600 */  addu       $at, $at, $a2
    /* 3F4EC 8004F4EC 9D1D2290 */  lbu        $v0, %lo(item + 0x49)($at)
    /* 3F4F0 8004F4F0 00000000 */  nop
    /* 3F4F4 8004F4F4 F2FFA2A0 */  sb         $v0, -0xE($a1)
    /* 3F4F8 8004F4F8 0D80013C */  lui        $at, %hi(item + 0x4B)
    /* 3F4FC 8004F4FC 21082600 */  addu       $at, $at, $a2
    /* 3F500 8004F500 9F1D2290 */  lbu        $v0, %lo(item + 0x4B)($at)
    /* 3F504 8004F504 00000000 */  nop
    /* 3F508 8004F508 F3FFA2A0 */  sb         $v0, -0xD($a1)
    /* 3F50C 8004F50C 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 3F510 8004F510 21082600 */  addu       $at, $at, $a2
    /* 3F514 8004F514 681D228C */  lw         $v0, %lo(item + 0x14)($at)
    /* 3F518 8004F518 00000000 */  nop
    /* 3F51C 8004F51C F4FFA2A4 */  sh         $v0, -0xC($a1)
    /* 3F520 8004F520 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 3F524 8004F524 21082600 */  addu       $at, $at, $a2
    /* 3F528 8004F528 B91D2280 */  lb         $v0, %lo(item + 0x65)($at)
    /* 3F52C 8004F52C 513D0108 */  j          .L8004F544
    /* 3F530 8004F530 0000A2AC */   sw        $v0, 0x0($a1)
  .L8004F534:
    /* 3F534 8004F534 1800A524 */  addiu      $a1, $a1, 0x18
    /* 3F538 8004F538 7F000229 */  slti       $v0, $t0, 0x7F
    /* 3F53C 8004F53C BAFF4014 */  bnez       $v0, .L8004F428
    /* 3F540 8004F540 1800E724 */   addiu     $a3, $a3, 0x18
  .L8004F544:
    /* 3F544 8004F544 344A010C */  jal        ReleaseDLevel__FP6DLevel
    /* 3F548 8004F548 00000000 */   nop
    /* 3F54C 8004F54C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 3F550 8004F550 1000B08F */  lw         $s0, 0x10($sp)
    /* 3F554 8004F554 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3F558 8004F558 0800E003 */  jr         $ra
    /* 3F55C 8004F55C 00000000 */   nop
endlabel DeltaAddItem__Fi
