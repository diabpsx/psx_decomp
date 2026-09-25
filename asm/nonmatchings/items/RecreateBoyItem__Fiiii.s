.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RecreateBoyItem__Fiiii, 0xD8

glabel RecreateBoyItem__Fiiii
    /* 3A3DC 8004A3DC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3A3E0 8004A3E0 2000B2AF */  sw         $s2, 0x20($sp)
    /* 3A3E4 8004A3E4 21908000 */  addu       $s2, $a0, $zero
    /* 3A3E8 8004A3E8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 3A3EC 8004A3EC 2180C000 */  addu       $s0, $a2, $zero
    /* 3A3F0 8004A3F0 2400B3AF */  sw         $s3, 0x24($sp)
    /* 3A3F4 8004A3F4 2198E000 */  addu       $s3, $a3, $zero
    /* 3A3F8 8004A3F8 21206002 */  addu       $a0, $s3, $zero
    /* 3A3FC 8004A3FC 2800BFAF */  sw         $ra, 0x28($sp)
    /* 3A400 8004A400 B3F6000C */  jal        SetRndSeed__Fl
    /* 3A404 8004A404 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 3A408 8004A408 1227010C */  jal        RndBoyItem__Fi
    /* 3A40C 8004A40C 21200002 */   addu      $a0, $s0, $zero
    /* 3A410 8004A410 21204002 */  addu       $a0, $s2, $zero
    /* 3A414 8004A414 FFFF5124 */  addiu      $s1, $v0, -0x1
    /* 3A418 8004A418 21282002 */  addu       $a1, $s1, $zero
    /* 3A41C 8004A41C A704010C */  jal        GetItemAttrs__Fiii
    /* 3A420 8004A420 21300002 */   addu      $a2, $s0, $zero
    /* 3A424 8004A424 21204002 */  addu       $a0, $s2, $zero
    /* 3A428 8004A428 21282002 */  addu       $a1, $s1, $zero
    /* 3A42C 8004A42C 21300002 */  addu       $a2, $s0, $zero
    /* 3A430 8004A430 01000224 */  addiu      $v0, $zero, 0x1
    /* 3A434 8004A434 40381000 */  sll        $a3, $s0, 1
    /* 3A438 8004A438 0D0D010C */  jal        GetItemBonus__FiiiiUc
    /* 3A43C 8004A43C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 3A440 8004A440 C0101200 */  sll        $v0, $s2, 3
    /* 3A444 8004A444 23105200 */  subu       $v0, $v0, $s2
    /* 3A448 8004A448 80100200 */  sll        $v0, $v0, 2
    /* 3A44C 8004A44C 23105200 */  subu       $v0, $v0, $s2
    /* 3A450 8004A450 80100200 */  sll        $v0, $v0, 2
    /* 3A454 8004A454 01000324 */  addiu      $v1, $zero, 0x1
    /* 3A458 8004A458 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 3A45C 8004A45C 21082200 */  addu       $at, $at, $v0
    /* 3A460 8004A460 BD1D23A0 */  sb         $v1, %lo(item + 0x69)($at)
    /* 3A464 8004A464 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 3A468 8004A468 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 3A46C 8004A46C 00101036 */  ori        $s0, $s0, 0x1000
    /* 3A470 8004A470 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3A474 8004A474 21082200 */  addu       $at, $at, $v0
    /* 3A478 8004A478 641D33AC */  sw         $s3, %lo(item + 0x10)($at)
    /* 3A47C 8004A47C 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3A480 8004A480 21082200 */  addu       $at, $at, $v0
    /* 3A484 8004A484 781D30A4 */  sh         $s0, %lo(item + 0x24)($at)
    /* 3A488 8004A488 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 3A48C 8004A48C 21082200 */  addu       $at, $at, $v0
    /* 3A490 8004A490 B91D23A0 */  sb         $v1, %lo(item + 0x65)($at)
    /* 3A494 8004A494 2800BF8F */  lw         $ra, 0x28($sp)
    /* 3A498 8004A498 2400B38F */  lw         $s3, 0x24($sp)
    /* 3A49C 8004A49C 2000B28F */  lw         $s2, 0x20($sp)
    /* 3A4A0 8004A4A0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 3A4A4 8004A4A4 1800B08F */  lw         $s0, 0x18($sp)
    /* 3A4A8 8004A4A8 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3A4AC 8004A4AC 0800E003 */  jr         $ra
    /* 3A4B0 8004A4B0 00000000 */   nop
endlabel RecreateBoyItem__Fiiii
