.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BreakCrux__Fii, 0x234

glabel BreakCrux__Fii
    /* 4E3B4 8005E3B4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4E3B8 8005E3B8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 4E3BC 8005E3BC 21888000 */  addu       $s1, $a0, $zero
    /* 4E3C0 8005E3C0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 4E3C4 8005E3C4 2180A000 */  addu       $s0, $a1, $zero
    /* 4E3C8 8005E3C8 40101000 */  sll        $v0, $s0, 1
    /* 4E3CC 8005E3CC 21105000 */  addu       $v0, $v0, $s0
    /* 4E3D0 8005E3D0 80100200 */  sll        $v0, $v0, 2
    /* 4E3D4 8005E3D4 23105000 */  subu       $v0, $v0, $s0
    /* 4E3D8 8005E3D8 80200200 */  sll        $a0, $v0, 2
    /* 4E3DC 8005E3DC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 4E3E0 8005E3E0 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4E3E4 8005E3E4 21082400 */  addu       $at, $at, $a0
    /* 4E3E8 8005E3E8 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4E3EC 8005E3EC 00000000 */  nop
    /* 4E3F0 8005E3F0 77004010 */  beqz       $v0, .L8005E5D0
    /* 4E3F4 8005E3F4 01000624 */   addiu     $a2, $zero, 0x1
    /* 4E3F8 8005E3F8 01000224 */  addiu      $v0, $zero, 0x1
    /* 4E3FC 8005E3FC 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 4E400 8005E400 21082400 */  addu       $at, $at, $a0
    /* 4E404 8005E404 718C22A0 */  sb         $v0, %lo(object + 0x25)($at)
    /* 4E408 8005E408 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4E40C 8005E40C 21082400 */  addu       $at, $at, $a0
    /* 4E410 8005E410 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 4E414 8005E414 0E80013C */  lui        $at, %hi(object + 0x27)
    /* 4E418 8005E418 21082400 */  addu       $at, $at, $a0
    /* 4E41C 8005E41C 738C22A0 */  sb         $v0, %lo(object + 0x27)($at)
    /* 4E420 8005E420 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 4E424 8005E424 21082400 */  addu       $at, $at, $a0
    /* 4E428 8005E428 748C22A0 */  sb         $v0, %lo(object + 0x28)($at)
    /* 4E42C 8005E42C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4E430 8005E430 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 4E434 8005E434 21082400 */  addu       $at, $at, $a0
    /* 4E438 8005E438 6E8C22A0 */  sb         $v0, %lo(object + 0x22)($at)
    /* 4E43C 8005E43C 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4E440 8005E440 21082400 */  addu       $at, $at, $a0
    /* 4E444 8005E444 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4E448 8005E448 4C12838F */  lw         $v1, %gp_rel(numobjects)($gp)
    /* 4E44C 8005E44C 01000224 */  addiu      $v0, $zero, 0x1
    /* 4E450 8005E450 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 4E454 8005E454 21082400 */  addu       $at, $at, $a0
    /* 4E458 8005E458 548C22A4 */  sh         $v0, %lo(object + 0x8)($at)
    /* 4E45C 8005E45C 2C006018 */  blez       $v1, .L8005E510
    /* 4E460 8005E460 21280000 */   addu      $a1, $zero, $zero
    /* 4E464 8005E464 16000924 */  addiu      $t1, $zero, 0x16
    /* 4E468 8005E468 21388000 */  addu       $a3, $a0, $zero
    /* 4E46C 8005E46C FFFF0824 */  addiu      $t0, $zero, -0x1
  .L8005E470:
    /* 4E470 8005E470 0E80013C */  lui        $at, %hi(objectactive)
    /* 4E474 8005E474 21082500 */  addu       $at, $at, $a1
    /* 4E478 8005E478 20A22280 */  lb         $v0, %lo(objectactive)($at)
    /* 4E47C 8005E47C 00000000 */  nop
    /* 4E480 8005E480 40180200 */  sll        $v1, $v0, 1
    /* 4E484 8005E484 21186200 */  addu       $v1, $v1, $v0
    /* 4E488 8005E488 80180300 */  sll        $v1, $v1, 2
    /* 4E48C 8005E48C 23186200 */  subu       $v1, $v1, $v0
    /* 4E490 8005E490 80200300 */  sll        $a0, $v1, 2
    /* 4E494 8005E494 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4E498 8005E498 21082400 */  addu       $at, $at, $a0
    /* 4E49C 8005E49C 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4E4A0 8005E4A0 00000000 */  nop
    /* 4E4A4 8005E4A4 ECFF6224 */  addiu      $v0, $v1, -0x14
    /* 4E4A8 8005E4A8 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4E4AC 8005E4AC 03004014 */  bnez       $v0, .L8005E4BC
    /* 4E4B0 8005E4B0 00000000 */   nop
    /* 4E4B4 8005E4B4 11006914 */  bne        $v1, $t1, .L8005E4FC
    /* 4E4B8 8005E4B8 00000000 */   nop
  .L8005E4BC:
    /* 4E4BC 8005E4BC 0E80013C */  lui        $at, %hi(object + 0x1C)
    /* 4E4C0 8005E4C0 21082700 */  addu       $at, $at, $a3
    /* 4E4C4 8005E4C4 688C2384 */  lh         $v1, %lo(object + 0x1C)($at)
    /* 4E4C8 8005E4C8 0E80013C */  lui        $at, %hi(object + 0x1C)
    /* 4E4CC 8005E4CC 21082400 */  addu       $at, $at, $a0
    /* 4E4D0 8005E4D0 688C2284 */  lh         $v0, %lo(object + 0x1C)($at)
    /* 4E4D4 8005E4D4 00000000 */  nop
    /* 4E4D8 8005E4D8 08006214 */  bne        $v1, $v0, .L8005E4FC
    /* 4E4DC 8005E4DC 00000000 */   nop
    /* 4E4E0 8005E4E0 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 4E4E4 8005E4E4 21082400 */  addu       $at, $at, $a0
    /* 4E4E8 8005E4E8 6E8C2280 */  lb         $v0, %lo(object + 0x22)($at)
    /* 4E4EC 8005E4EC 00000000 */  nop
    /* 4E4F0 8005E4F0 02004810 */  beq        $v0, $t0, .L8005E4FC
    /* 4E4F4 8005E4F4 00000000 */   nop
    /* 4E4F8 8005E4F8 21300000 */  addu       $a2, $zero, $zero
  .L8005E4FC:
    /* 4E4FC 8005E4FC 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 4E500 8005E500 0100A524 */  addiu      $a1, $a1, 0x1
    /* 4E504 8005E504 2A10A200 */  slt        $v0, $a1, $v0
    /* 4E508 8005E508 D9FF4014 */  bnez       $v0, .L8005E470
    /* 4E50C 8005E50C 00000000 */   nop
  .L8005E510:
    /* 4E510 8005E510 FF00C230 */  andi       $v0, $a2, 0xFF
    /* 4E514 8005E514 25004010 */  beqz       $v0, .L8005E5AC
    /* 4E518 8005E518 00000000 */   nop
    /* 4E51C 8005E51C 1280023C */  lui        $v0, %hi(deltaload)
    /* 4E520 8005E520 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4E524 8005E524 00000000 */  nop
    /* 4E528 8005E528 0E004014 */  bnez       $v0, .L8005E564
    /* 4E52C 8005E52C 40101000 */   sll       $v0, $s0, 1
    /* 4E530 8005E530 21105000 */  addu       $v0, $v0, $s0
    /* 4E534 8005E534 80100200 */  sll        $v0, $v0, 2
    /* 4E538 8005E538 23105000 */  subu       $v0, $v0, $s0
    /* 4E53C 8005E53C 80100200 */  sll        $v0, $v0, 2
    /* 4E540 8005E540 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4E544 8005E544 21082200 */  addu       $at, $at, $v0
    /* 4E548 8005E548 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4E54C 8005E54C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4E550 8005E550 21082200 */  addu       $at, $at, $v0
    /* 4E554 8005E554 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4E558 8005E558 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4E55C 8005E55C 2B000424 */   addiu     $a0, $zero, 0x2B
    /* 4E560 8005E560 40101000 */  sll        $v0, $s0, 1
  .L8005E564:
    /* 4E564 8005E564 21105000 */  addu       $v0, $v0, $s0
    /* 4E568 8005E568 80100200 */  sll        $v0, $v0, 2
    /* 4E56C 8005E56C 23105000 */  subu       $v0, $v0, $s0
    /* 4E570 8005E570 80100200 */  sll        $v0, $v0, 2
    /* 4E574 8005E574 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4E578 8005E578 21082200 */  addu       $at, $at, $v0
    /* 4E57C 8005E57C 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 4E580 8005E580 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4E584 8005E584 21082200 */  addu       $at, $at, $v0
    /* 4E588 8005E588 5C8C2584 */  lh         $a1, %lo(object + 0x10)($at)
    /* 4E58C 8005E58C 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 4E590 8005E590 21082200 */  addu       $at, $at, $v0
    /* 4E594 8005E594 5E8C2684 */  lh         $a2, %lo(object + 0x12)($at)
    /* 4E598 8005E598 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4E59C 8005E59C 21082200 */  addu       $at, $at, $v0
    /* 4E5A0 8005E5A0 608C2784 */  lh         $a3, %lo(object + 0x14)($at)
    /* 4E5A4 8005E5A4 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 4E5A8 8005E5A8 00000000 */   nop
  .L8005E5AC:
    /* 4E5AC 8005E5AC 1280023C */  lui        $v0, %hi(deltaload)
    /* 4E5B0 8005E5B0 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4E5B4 8005E5B4 00000000 */  nop
    /* 4E5B8 8005E5B8 05004014 */  bnez       $v0, .L8005E5D0
    /* 4E5BC 8005E5BC 21200000 */   addu      $a0, $zero, $zero
    /* 4E5C0 8005E5C0 2F000524 */  addiu      $a1, $zero, 0x2F
    /* 4E5C4 8005E5C4 FFFF2632 */  andi       $a2, $s1, 0xFFFF
    /* 4E5C8 8005E5C8 183E010C */  jal        NetSendCmdParam2__FUcUcUsUs
    /* 4E5CC 8005E5CC FFFF0732 */   andi      $a3, $s0, 0xFFFF
  .L8005E5D0:
    /* 4E5D0 8005E5D0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 4E5D4 8005E5D4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 4E5D8 8005E5D8 1800B08F */  lw         $s0, 0x18($sp)
    /* 4E5DC 8005E5DC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4E5E0 8005E5E0 0800E003 */  jr         $ra
    /* 4E5E4 8005E5E4 00000000 */   nop
endlabel BreakCrux__Fii
