.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartWRecharge__Fv, 0x430

glabel S_StartWRecharge__Fv
    /* 5D440 8006D440 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 5D444 8006D444 8000B2AF */  sw         $s2, 0x80($sp)
    /* 5D448 8006D448 21900000 */  addu       $s2, $zero, $zero
    /* 5D44C 8006D44C FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 5D450 8006D450 D4130324 */  addiu      $v1, $zero, 0x13D4
    /* 5D454 8006D454 02000224 */  addiu      $v0, $zero, 0x2
    /* 5D458 8006D458 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5D45C 8006D45C 01000224 */  addiu      $v0, $zero, 0x1
    /* 5D460 8006D460 8800BFAF */  sw         $ra, 0x88($sp)
    /* 5D464 8006D464 8400B3AF */  sw         $s3, 0x84($sp)
    /* 5D468 8006D468 7C00B1AF */  sw         $s1, 0x7C($sp)
    /* 5D46C 8006D46C 7800B0AF */  sw         $s0, 0x78($sp)
    /* 5D470 8006D470 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5D474 8006D474 282180AF */  sw         $zero, %gp_rel(D_8011C8A8)($gp)
  .L8006D478:
    /* 5D478 8006D478 0E80013C */  lui        $at, %hi(storehold + 0x2C)
    /* 5D47C 8006D47C 21082300 */  addu       $at, $at, $v1
    /* 5D480 8006D480 B41D24A4 */  sh         $a0, %lo(storehold + 0x2C)($at)
    /* 5D484 8006D484 94FF6324 */  addiu      $v1, $v1, -0x6C
    /* 5D488 8006D488 FBFF6104 */  bgez       $v1, .L8006D478
    /* 5D48C 8006D48C 00000000 */   nop
    /* 5D490 8006D490 1280033C */  lui        $v1, %hi(myplr)
    /* 5D494 8006D494 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5D498 8006D498 00000000 */  nop
    /* 5D49C 8006D49C 40100300 */  sll        $v0, $v1, 1
    /* 5D4A0 8006D4A0 21104300 */  addu       $v0, $v0, $v1
    /* 5D4A4 8006D4A4 80100200 */  sll        $v0, $v0, 2
    /* 5D4A8 8006D4A8 21104300 */  addu       $v0, $v0, $v1
    /* 5D4AC 8006D4AC 00110200 */  sll        $v0, $v0, 4
    /* 5D4B0 8006D4B0 23104300 */  subu       $v0, $v0, $v1
    /* 5D4B4 8006D4B4 80100200 */  sll        $v0, $v0, 2
    /* 5D4B8 8006D4B8 21104300 */  addu       $v0, $v0, $v1
    /* 5D4BC 8006D4BC C0200200 */  sll        $a0, $v0, 3
    /* 5D4C0 8006D4C0 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 5D4C4 8006D4C4 21082400 */  addu       $at, $at, $a0
    /* 5D4C8 8006D4C8 C4A82384 */  lh         $v1, %lo(plr + 0x38C)($at)
    /* 5D4CC 8006D4CC 0A000224 */  addiu      $v0, $zero, 0xA
    /* 5D4D0 8006D4D0 31006214 */  bne        $v1, $v0, .L8006D598
    /* 5D4D4 8006D4D4 00000000 */   nop
    /* 5D4D8 8006D4D8 0E80013C */  lui        $at, %hi(plr + 0x3A9)
    /* 5D4DC 8006D4DC 21082400 */  addu       $at, $at, $a0
    /* 5D4E0 8006D4E0 E1A82390 */  lbu        $v1, %lo(plr + 0x3A9)($at)
    /* 5D4E4 8006D4E4 0E80013C */  lui        $at, %hi(plr + 0x3AB)
    /* 5D4E8 8006D4E8 21082400 */  addu       $at, $at, $a0
    /* 5D4EC 8006D4EC E3A82290 */  lbu        $v0, %lo(plr + 0x3AB)($at)
    /* 5D4F0 8006D4F0 00000000 */  nop
    /* 5D4F4 8006D4F4 28006210 */  beq        $v1, $v0, .L8006D598
    /* 5D4F8 8006D4F8 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 5D4FC 8006D4FC 01001224 */  addiu      $s2, $zero, 0x1
    /* 5D500 8006D500 6C00A2AF */  sw         $v0, 0x6C($sp)
    /* 5D504 8006D504 1000A727 */  addiu      $a3, $sp, 0x10
    /* 5D508 8006D508 21408000 */  addu       $t0, $a0, $zero
    /* 5D50C 8006D50C 0E80023C */  lui        $v0, %hi(plr + 0x370)
    /* 5D510 8006D510 A8A84224 */  addiu      $v0, $v0, %lo(plr + 0x370)
    /* 5D514 8006D514 21300201 */  addu       $a2, $t0, $v0
    /* 5D518 8006D518 5000C924 */  addiu      $t1, $a2, 0x50
  .L8006D51C:
    /* 5D51C 8006D51C 0000C28C */  lw         $v0, 0x0($a2)
    /* 5D520 8006D520 0400C38C */  lw         $v1, 0x4($a2)
    /* 5D524 8006D524 0800C48C */  lw         $a0, 0x8($a2)
    /* 5D528 8006D528 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5D52C 8006D52C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 5D530 8006D530 0400E3AC */  sw         $v1, 0x4($a3)
    /* 5D534 8006D534 0800E4AC */  sw         $a0, 0x8($a3)
    /* 5D538 8006D538 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 5D53C 8006D53C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5D540 8006D540 F6FFC914 */  bne        $a2, $t1, .L8006D51C
    /* 5D544 8006D544 1000E724 */   addiu     $a3, $a3, 0x10
    /* 5D548 8006D548 0000C28C */  lw         $v0, 0x0($a2)
    /* 5D54C 8006D54C 0400C38C */  lw         $v1, 0x4($a2)
    /* 5D550 8006D550 0800C48C */  lw         $a0, 0x8($a2)
    /* 5D554 8006D554 0000E2AC */  sw         $v0, 0x0($a3)
    /* 5D558 8006D558 0400E3AC */  sw         $v1, 0x4($a3)
    /* 5D55C 8006D55C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 5D560 8006D560 0E80013C */  lui        $at, %hi(plr + 0x360)
    /* 5D564 8006D564 21082800 */  addu       $at, $at, $t0
    /* 5D568 8006D568 98A8248C */  lw         $a0, %lo(plr + 0x360)($at)
    /* 5D56C 8006D56C 0E80013C */  lui        $at, %hi(plr + 0x364)
    /* 5D570 8006D570 21082800 */  addu       $at, $at, $t0
    /* 5D574 8006D574 9CA8258C */  lw         $a1, %lo(plr + 0x364)($at)
    /* 5D578 8006D578 0E80013C */  lui        $at, %hi(plr + 0x368)
    /* 5D57C 8006D57C 21082800 */  addu       $at, $at, $t0
    /* 5D580 8006D580 A0A8268C */  lw         $a2, %lo(plr + 0x368)($at)
    /* 5D584 8006D584 0E80013C */  lui        $at, %hi(plr + 0x36C)
    /* 5D588 8006D588 21082800 */  addu       $at, $at, $t0
    /* 5D58C 8006D58C A4A8278C */  lw         $a3, %lo(plr + 0x36C)($at)
    /* 5D590 8006D590 AEB4010C */  jal        AddStoreHoldRecharge__FG10ItemStructi
    /* 5D594 8006D594 00000000 */   nop
  .L8006D598:
    /* 5D598 8006D598 1280023C */  lui        $v0, %hi(myplr)
    /* 5D59C 8006D59C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5D5A0 8006D5A0 00000000 */  nop
    /* 5D5A4 8006D5A4 40180200 */  sll        $v1, $v0, 1
    /* 5D5A8 8006D5A8 21186200 */  addu       $v1, $v1, $v0
    /* 5D5AC 8006D5AC 80180300 */  sll        $v1, $v1, 2
    /* 5D5B0 8006D5B0 21186200 */  addu       $v1, $v1, $v0
    /* 5D5B4 8006D5B4 00190300 */  sll        $v1, $v1, 4
    /* 5D5B8 8006D5B8 23186200 */  subu       $v1, $v1, $v0
    /* 5D5BC 8006D5BC 80180300 */  sll        $v1, $v1, 2
    /* 5D5C0 8006D5C0 21186200 */  addu       $v1, $v1, $v0
    /* 5D5C4 8006D5C4 C0180300 */  sll        $v1, $v1, 3
    /* 5D5C8 8006D5C8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5D5CC 8006D5CC 21082300 */  addu       $at, $at, $v1
    /* 5D5D0 8006D5D0 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5D5D4 8006D5D4 00000000 */  nop
    /* 5D5D8 8006D5D8 44004018 */  blez       $v0, .L8006D6EC
    /* 5D5DC 8006D5DC 21800000 */   addu      $s0, $zero, $zero
    /* 5D5E0 8006D5E0 0E80133C */  lui        $s3, %hi(plr + 0x4A4)
    /* 5D5E4 8006D5E4 DCA97326 */  addiu      $s3, $s3, %lo(plr + 0x4A4)
    /* 5D5E8 8006D5E8 21880000 */  addu       $s1, $zero, $zero
  .L8006D5EC:
    /* 5D5EC 8006D5EC 8BB4010C */  jal        WitchRechargeOk__Fi
    /* 5D5F0 8006D5F0 21200002 */   addu      $a0, $s0, $zero
    /* 5D5F4 8006D5F4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5D5F8 8006D5F8 29004010 */  beqz       $v0, .L8006D6A0
    /* 5D5FC 8006D5FC 1000A927 */   addiu     $t1, $sp, 0x10
    /* 5D600 8006D600 01001224 */  addiu      $s2, $zero, 0x1
    /* 5D604 8006D604 1280033C */  lui        $v1, %hi(myplr)
    /* 5D608 8006D608 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5D60C 8006D60C 6C00B0AF */  sw         $s0, 0x6C($sp)
    /* 5D610 8006D610 40100300 */  sll        $v0, $v1, 1
    /* 5D614 8006D614 21104300 */  addu       $v0, $v0, $v1
    /* 5D618 8006D618 80100200 */  sll        $v0, $v0, 2
    /* 5D61C 8006D61C 21104300 */  addu       $v0, $v0, $v1
    /* 5D620 8006D620 00110200 */  sll        $v0, $v0, 4
    /* 5D624 8006D624 23104300 */  subu       $v0, $v0, $v1
    /* 5D628 8006D628 80100200 */  sll        $v0, $v0, 2
    /* 5D62C 8006D62C 21104300 */  addu       $v0, $v0, $v1
    /* 5D630 8006D630 C0100200 */  sll        $v0, $v0, 3
    /* 5D634 8006D634 21105300 */  addu       $v0, $v0, $s3
    /* 5D638 8006D638 21382202 */  addu       $a3, $s1, $v0
    /* 5D63C 8006D63C 1000E624 */  addiu      $a2, $a3, 0x10
    /* 5D640 8006D640 6000E824 */  addiu      $t0, $a3, 0x60
  .L8006D644:
    /* 5D644 8006D644 0000C28C */  lw         $v0, 0x0($a2)
    /* 5D648 8006D648 0400C38C */  lw         $v1, 0x4($a2)
    /* 5D64C 8006D64C 0800C48C */  lw         $a0, 0x8($a2)
    /* 5D650 8006D650 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5D654 8006D654 000022AD */  sw         $v0, 0x0($t1)
    /* 5D658 8006D658 040023AD */  sw         $v1, 0x4($t1)
    /* 5D65C 8006D65C 080024AD */  sw         $a0, 0x8($t1)
    /* 5D660 8006D660 0C0025AD */  sw         $a1, 0xC($t1)
    /* 5D664 8006D664 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5D668 8006D668 F6FFC814 */  bne        $a2, $t0, .L8006D644
    /* 5D66C 8006D66C 10002925 */   addiu     $t1, $t1, 0x10
    /* 5D670 8006D670 0000C28C */  lw         $v0, 0x0($a2)
    /* 5D674 8006D674 0400C38C */  lw         $v1, 0x4($a2)
    /* 5D678 8006D678 0800C48C */  lw         $a0, 0x8($a2)
    /* 5D67C 8006D67C 000022AD */  sw         $v0, 0x0($t1)
    /* 5D680 8006D680 040023AD */  sw         $v1, 0x4($t1)
    /* 5D684 8006D684 080024AD */  sw         $a0, 0x8($t1)
    /* 5D688 8006D688 0000E48C */  lw         $a0, 0x0($a3)
    /* 5D68C 8006D68C 0400E58C */  lw         $a1, 0x4($a3)
    /* 5D690 8006D690 0800E68C */  lw         $a2, 0x8($a3)
    /* 5D694 8006D694 0C00E78C */  lw         $a3, 0xC($a3)
    /* 5D698 8006D698 AEB4010C */  jal        AddStoreHoldRecharge__FG10ItemStructi
    /* 5D69C 8006D69C 00000000 */   nop
  .L8006D6A0:
    /* 5D6A0 8006D6A0 1280023C */  lui        $v0, %hi(myplr)
    /* 5D6A4 8006D6A4 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5D6A8 8006D6A8 00000000 */  nop
    /* 5D6AC 8006D6AC 40180200 */  sll        $v1, $v0, 1
    /* 5D6B0 8006D6B0 21186200 */  addu       $v1, $v1, $v0
    /* 5D6B4 8006D6B4 80180300 */  sll        $v1, $v1, 2
    /* 5D6B8 8006D6B8 21186200 */  addu       $v1, $v1, $v0
    /* 5D6BC 8006D6BC 00190300 */  sll        $v1, $v1, 4
    /* 5D6C0 8006D6C0 23186200 */  subu       $v1, $v1, $v0
    /* 5D6C4 8006D6C4 80180300 */  sll        $v1, $v1, 2
    /* 5D6C8 8006D6C8 21186200 */  addu       $v1, $v1, $v0
    /* 5D6CC 8006D6CC C0180300 */  sll        $v1, $v1, 3
    /* 5D6D0 8006D6D0 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5D6D4 8006D6D4 21082300 */  addu       $at, $at, $v1
    /* 5D6D8 8006D6D8 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5D6DC 8006D6DC 01001026 */  addiu      $s0, $s0, 0x1
    /* 5D6E0 8006D6E0 2A100202 */  slt        $v0, $s0, $v0
    /* 5D6E4 8006D6E4 C1FF4014 */  bnez       $v0, .L8006D5EC
    /* 5D6E8 8006D6E8 6C003126 */   addiu     $s1, $s1, 0x6C
  .L8006D6EC:
    /* 5D6EC 8006D6EC FF004232 */  andi       $v0, $s2, 0xFF
    /* 5D6F0 8006D6F0 23004014 */  bnez       $v0, .L8006D780
    /* 5D6F4 8006D6F4 00000000 */   nop
    /* 5D6F8 8006D6F8 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5D6FC 8006D6FC 4AED010C */  jal        GetStr__Fi
    /* 5D700 8006D700 ED040424 */   addiu     $a0, $zero, 0x4ED
    /* 5D704 8006D704 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5D708 8006D708 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5D70C 8006D70C 1280053C */  lui        $a1, %hi(myplr)
    /* 5D710 8006D710 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5D714 8006D714 21200002 */  addu       $a0, $s0, $zero
    /* 5D718 8006D718 40180500 */  sll        $v1, $a1, 1
    /* 5D71C 8006D71C 21186500 */  addu       $v1, $v1, $a1
    /* 5D720 8006D720 80180300 */  sll        $v1, $v1, 2
    /* 5D724 8006D724 21186500 */  addu       $v1, $v1, $a1
    /* 5D728 8006D728 00190300 */  sll        $v1, $v1, 4
    /* 5D72C 8006D72C 23186500 */  subu       $v1, $v1, $a1
    /* 5D730 8006D730 80180300 */  sll        $v1, $v1, 2
    /* 5D734 8006D734 21186500 */  addu       $v1, $v1, $a1
    /* 5D738 8006D738 C0180300 */  sll        $v1, $v1, 3
    /* 5D73C 8006D73C 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5D740 8006D740 21082300 */  addu       $at, $at, $v1
    /* 5D744 8006D744 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5D748 8006D748 9767000C */  jal        sprintf
    /* 5D74C 8006D74C 21284000 */   addu      $a1, $v0, $zero
    /* 5D750 8006D750 21200000 */  addu       $a0, $zero, $zero
    /* 5D754 8006D754 01000524 */  addiu      $a1, $zero, 0x1
    /* 5D758 8006D758 01000624 */  addiu      $a2, $zero, 0x1
    /* 5D75C 8006D75C 21380002 */  addu       $a3, $s0, $zero
    /* 5D760 8006D760 03000224 */  addiu      $v0, $zero, 0x3
    /* 5D764 8006D764 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5D768 8006D768 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5D76C 8006D76C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5D770 8006D770 5CA7010C */  jal        AddSLine__Fi
    /* 5D774 8006D774 02000424 */   addiu     $a0, $zero, 0x2
    /* 5D778 8006D778 14B60108 */  j          .L8006D850
    /* 5D77C 8006D77C 00000000 */   nop
  .L8006D780:
    /* 5D780 8006D780 1280033C */  lui        $v1, %hi(myplr)
    /* 5D784 8006D784 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5D788 8006D788 142180AF */  sw         $zero, %gp_rel(D_8011C894)($gp)
    /* 5D78C 8006D78C 40100300 */  sll        $v0, $v1, 1
    /* 5D790 8006D790 21104300 */  addu       $v0, $v0, $v1
    /* 5D794 8006D794 80100200 */  sll        $v0, $v0, 2
    /* 5D798 8006D798 21104300 */  addu       $v0, $v0, $v1
    /* 5D79C 8006D79C 00110200 */  sll        $v0, $v0, 4
    /* 5D7A0 8006D7A0 23104300 */  subu       $v0, $v0, $v1
    /* 5D7A4 8006D7A4 80100200 */  sll        $v0, $v0, 2
    /* 5D7A8 8006D7A8 21104300 */  addu       $v0, $v0, $v1
    /* 5D7AC 8006D7AC C0100200 */  sll        $v0, $v0, 3
    /* 5D7B0 8006D7B0 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5D7B4 8006D7B4 21082200 */  addu       $at, $at, $v0
    /* 5D7B8 8006D7B8 BCBA238C */  lw         $v1, %lo(plr + 0x1584)($at)
    /* 5D7BC 8006D7BC 01000224 */  addiu      $v0, $zero, 0x1
    /* 5D7C0 8006D7C0 621382A3 */  sb         $v0, %gp_rel(stextscrl)($gp)
    /* 5D7C4 8006D7C4 182183AF */  sw         $v1, %gp_rel(D_8011C898)($gp)
    /* 5D7C8 8006D7C8 4AED010C */  jal        GetStr__Fi
    /* 5D7CC 8006D7CC 4E030424 */   addiu     $a0, $zero, 0x34E
    /* 5D7D0 8006D7D0 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5D7D4 8006D7D4 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5D7D8 8006D7D8 1280053C */  lui        $a1, %hi(myplr)
    /* 5D7DC 8006D7DC 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5D7E0 8006D7E0 21200002 */  addu       $a0, $s0, $zero
    /* 5D7E4 8006D7E4 40180500 */  sll        $v1, $a1, 1
    /* 5D7E8 8006D7E8 21186500 */  addu       $v1, $v1, $a1
    /* 5D7EC 8006D7EC 80180300 */  sll        $v1, $v1, 2
    /* 5D7F0 8006D7F0 21186500 */  addu       $v1, $v1, $a1
    /* 5D7F4 8006D7F4 00190300 */  sll        $v1, $v1, 4
    /* 5D7F8 8006D7F8 23186500 */  subu       $v1, $v1, $a1
    /* 5D7FC 8006D7FC 80180300 */  sll        $v1, $v1, 2
    /* 5D800 8006D800 21186500 */  addu       $v1, $v1, $a1
    /* 5D804 8006D804 C0180300 */  sll        $v1, $v1, 3
    /* 5D808 8006D808 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5D80C 8006D80C 21082300 */  addu       $at, $at, $v1
    /* 5D810 8006D810 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5D814 8006D814 9767000C */  jal        sprintf
    /* 5D818 8006D818 21284000 */   addu      $a1, $v0, $zero
    /* 5D81C 8006D81C 21200000 */  addu       $a0, $zero, $zero
    /* 5D820 8006D820 01000524 */  addiu      $a1, $zero, 0x1
    /* 5D824 8006D824 01000624 */  addiu      $a2, $zero, 0x1
    /* 5D828 8006D828 21380002 */  addu       $a3, $s0, $zero
    /* 5D82C 8006D82C 03000224 */  addiu      $v0, $zero, 0x3
    /* 5D830 8006D830 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5D834 8006D834 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5D838 8006D838 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5D83C 8006D83C 5CA7010C */  jal        AddSLine__Fi
    /* 5D840 8006D840 02000424 */   addiu     $a0, $zero, 0x2
    /* 5D844 8006D844 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5D848 8006D848 2EAD010C */  jal        S_ScrollSSell__Fi
    /* 5D84C 8006D84C 00000000 */   nop
  .L8006D850:
    /* 5D850 8006D850 8800BF8F */  lw         $ra, 0x88($sp)
    /* 5D854 8006D854 8400B38F */  lw         $s3, 0x84($sp)
    /* 5D858 8006D858 8000B28F */  lw         $s2, 0x80($sp)
    /* 5D85C 8006D85C 7C00B18F */  lw         $s1, 0x7C($sp)
    /* 5D860 8006D860 7800B08F */  lw         $s0, 0x78($sp)
    /* 5D864 8006D864 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 5D868 8006D868 0800E003 */  jr         $ra
    /* 5D86C 8006D86C 00000000 */   nop
endlabel S_StartWRecharge__Fv
