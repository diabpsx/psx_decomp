.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RecreatePremiumItem__Fiiii, 0xDC

glabel RecreatePremiumItem__Fiiii
    /* 3A014 8004A014 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3A018 8004A018 2000B2AF */  sw         $s2, 0x20($sp)
    /* 3A01C 8004A01C 21908000 */  addu       $s2, $a0, $zero
    /* 3A020 8004A020 1800B0AF */  sw         $s0, 0x18($sp)
    /* 3A024 8004A024 2180C000 */  addu       $s0, $a2, $zero
    /* 3A028 8004A028 2400B3AF */  sw         $s3, 0x24($sp)
    /* 3A02C 8004A02C 2198E000 */  addu       $s3, $a3, $zero
    /* 3A030 8004A030 21206002 */  addu       $a0, $s3, $zero
    /* 3A034 8004A034 2800BFAF */  sw         $ra, 0x28($sp)
    /* 3A038 8004A038 B3F6000C */  jal        SetRndSeed__Fl
    /* 3A03C 8004A03C 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 3A040 8004A040 83201000 */  sra        $a0, $s0, 2
    /* 3A044 8004A044 851F010C */  jal        RndPremiumItem__Fii
    /* 3A048 8004A048 21280002 */   addu      $a1, $s0, $zero
    /* 3A04C 8004A04C 21204002 */  addu       $a0, $s2, $zero
    /* 3A050 8004A050 FFFF5124 */  addiu      $s1, $v0, -0x1
    /* 3A054 8004A054 21282002 */  addu       $a1, $s1, $zero
    /* 3A058 8004A058 A704010C */  jal        GetItemAttrs__Fiii
    /* 3A05C 8004A05C 21300002 */   addu      $a2, $s0, $zero
    /* 3A060 8004A060 21204002 */  addu       $a0, $s2, $zero
    /* 3A064 8004A064 21282002 */  addu       $a1, $s1, $zero
    /* 3A068 8004A068 43301000 */  sra        $a2, $s0, 1
    /* 3A06C 8004A06C 01000224 */  addiu      $v0, $zero, 0x1
    /* 3A070 8004A070 21380002 */  addu       $a3, $s0, $zero
    /* 3A074 8004A074 0D0D010C */  jal        GetItemBonus__FiiiiUc
    /* 3A078 8004A078 1000A2AF */   sw        $v0, 0x10($sp)
    /* 3A07C 8004A07C C0101200 */  sll        $v0, $s2, 3
    /* 3A080 8004A080 23105200 */  subu       $v0, $v0, $s2
    /* 3A084 8004A084 80100200 */  sll        $v0, $v0, 2
    /* 3A088 8004A088 23105200 */  subu       $v0, $v0, $s2
    /* 3A08C 8004A08C 80100200 */  sll        $v0, $v0, 2
    /* 3A090 8004A090 01000324 */  addiu      $v1, $zero, 0x1
    /* 3A094 8004A094 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 3A098 8004A098 21082200 */  addu       $at, $at, $v0
    /* 3A09C 8004A09C BD1D23A0 */  sb         $v1, %lo(item + 0x69)($at)
    /* 3A0A0 8004A0A0 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 3A0A4 8004A0A4 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 3A0A8 8004A0A8 00081036 */  ori        $s0, $s0, 0x800
    /* 3A0AC 8004A0AC 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3A0B0 8004A0B0 21082200 */  addu       $at, $at, $v0
    /* 3A0B4 8004A0B4 641D33AC */  sw         $s3, %lo(item + 0x10)($at)
    /* 3A0B8 8004A0B8 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3A0BC 8004A0BC 21082200 */  addu       $at, $at, $v0
    /* 3A0C0 8004A0C0 781D30A4 */  sh         $s0, %lo(item + 0x24)($at)
    /* 3A0C4 8004A0C4 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 3A0C8 8004A0C8 21082200 */  addu       $at, $at, $v0
    /* 3A0CC 8004A0CC B91D23A0 */  sb         $v1, %lo(item + 0x65)($at)
    /* 3A0D0 8004A0D0 2800BF8F */  lw         $ra, 0x28($sp)
    /* 3A0D4 8004A0D4 2400B38F */  lw         $s3, 0x24($sp)
    /* 3A0D8 8004A0D8 2000B28F */  lw         $s2, 0x20($sp)
    /* 3A0DC 8004A0DC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 3A0E0 8004A0E0 1800B08F */  lw         $s0, 0x18($sp)
    /* 3A0E4 8004A0E4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3A0E8 8004A0E8 0800E003 */  jr         $ra
    /* 3A0EC 8004A0EC 00000000 */   nop
endlabel RecreatePremiumItem__Fiiii
