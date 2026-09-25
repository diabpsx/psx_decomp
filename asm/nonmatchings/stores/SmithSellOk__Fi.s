.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SmithSellOk__Fi, 0xE8

glabel SmithSellOk__Fi
    /* 5B3D0 8006B3D0 C0180400 */  sll        $v1, $a0, 3
    /* 5B3D4 8006B3D4 23186400 */  subu       $v1, $v1, $a0
    /* 5B3D8 8006B3D8 80180300 */  sll        $v1, $v1, 2
    /* 5B3DC 8006B3DC 23186400 */  subu       $v1, $v1, $a0
    /* 5B3E0 8006B3E0 1280043C */  lui        $a0, %hi(myplr)
    /* 5B3E4 8006B3E4 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5B3E8 8006B3E8 80180300 */  sll        $v1, $v1, 2
    /* 5B3EC 8006B3EC 40100400 */  sll        $v0, $a0, 1
    /* 5B3F0 8006B3F0 21104400 */  addu       $v0, $v0, $a0
    /* 5B3F4 8006B3F4 80100200 */  sll        $v0, $v0, 2
    /* 5B3F8 8006B3F8 21104400 */  addu       $v0, $v0, $a0
    /* 5B3FC 8006B3FC 00110200 */  sll        $v0, $v0, 4
    /* 5B400 8006B400 23104400 */  subu       $v0, $v0, $a0
    /* 5B404 8006B404 80100200 */  sll        $v0, $v0, 2
    /* 5B408 8006B408 21104400 */  addu       $v0, $v0, $a0
    /* 5B40C 8006B40C C0100200 */  sll        $v0, $v0, 3
    /* 5B410 8006B410 21206200 */  addu       $a0, $v1, $v0
    /* 5B414 8006B414 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 5B418 8006B418 21082400 */  addu       $at, $at, $a0
    /* 5B41C 8006B41C 08AA2384 */  lh         $v1, %lo(plr + 0x4D0)($at)
    /* 5B420 8006B420 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5B424 8006B424 0F006210 */  beq        $v1, $v0, .L8006B464
    /* 5B428 8006B428 00000000 */   nop
    /* 5B42C 8006B42C 0D006010 */  beqz       $v1, .L8006B464
    /* 5B430 8006B430 0B000224 */   addiu     $v0, $zero, 0xB
    /* 5B434 8006B434 0B006210 */  beq        $v1, $v0, .L8006B464
    /* 5B438 8006B438 0E000224 */   addiu     $v0, $zero, 0xE
    /* 5B43C 8006B43C 09006210 */  beq        $v1, $v0, .L8006B464
    /* 5B440 8006B440 0A000224 */   addiu     $v0, $zero, 0xA
    /* 5B444 8006B444 07006210 */  beq        $v1, $v0, .L8006B464
    /* 5B448 8006B448 21000224 */   addiu     $v0, $zero, 0x21
    /* 5B44C 8006B44C 0E80013C */  lui        $at, %hi(plr + 0x4D2)
    /* 5B450 8006B450 21082400 */  addu       $at, $at, $a0
    /* 5B454 8006B454 0AAA2384 */  lh         $v1, %lo(plr + 0x4D2)($at)
    /* 5B458 8006B458 00000000 */  nop
    /* 5B45C 8006B45C 03006214 */  bne        $v1, $v0, .L8006B46C
    /* 5B460 8006B460 00000000 */   nop
  .L8006B464:
    /* 5B464 8006B464 2CAD0108 */  j          .L8006B4B0
    /* 5B468 8006B468 21100000 */   addu      $v0, $zero, $zero
  .L8006B46C:
    /* 5B46C 8006B46C 0E80013C */  lui        $at, %hi(plr + 0x4F5)
    /* 5B470 8006B470 21082400 */  addu       $at, $at, $a0
    /* 5B474 8006B474 2DAA2380 */  lb         $v1, %lo(plr + 0x4F5)($at)
    /* 5B478 8006B478 00000000 */  nop
    /* 5B47C 8006B47C 0C006010 */  beqz       $v1, .L8006B4B0
    /* 5B480 8006B480 01000224 */   addiu     $v0, $zero, 0x1
    /* 5B484 8006B484 0E80013C */  lui        $at, %hi(plr + 0x50D)
    /* 5B488 8006B488 21082400 */  addu       $at, $at, $a0
    /* 5B48C 8006B48C 45AA2380 */  lb         $v1, %lo(plr + 0x50D)($at)
    /* 5B490 8006B490 00000000 */  nop
    /* 5B494 8006B494 06006010 */  beqz       $v1, .L8006B4B0
    /* 5B498 8006B498 00000000 */   nop
    /* 5B49C 8006B49C 0E80013C */  lui        $at, %hi(plr + 0x4BC)
    /* 5B4A0 8006B4A0 21082400 */  addu       $at, $at, $a0
    /* 5B4A4 8006B4A4 F4A9228C */  lw         $v0, %lo(plr + 0x4BC)($at)
    /* 5B4A8 8006B4A8 00000000 */  nop
    /* 5B4AC 8006B4AC 2B100200 */  sltu       $v0, $zero, $v0
  .L8006B4B0:
    /* 5B4B0 8006B4B0 0800E003 */  jr         $ra
    /* 5B4B4 8006B4B4 00000000 */   nop
endlabel SmithSellOk__Fi
