.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RecreateHealerItem__Fiiii, 0xD4

glabel RecreateHealerItem__Fiiii
    /* 3A308 8004A308 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3A30C 8004A30C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3A310 8004A310 21808000 */  addu       $s0, $a0, $zero
    /* 3A314 8004A314 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3A318 8004A318 2188C000 */  addu       $s1, $a2, $zero
    /* 3A31C 8004A31C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3A320 8004A320 2190E000 */  addu       $s2, $a3, $zero
    /* 3A324 8004A324 18000224 */  addiu      $v0, $zero, 0x18
    /* 3A328 8004A328 0600A210 */  beq        $a1, $v0, .L8004A344
    /* 3A32C 8004A32C 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 3A330 8004A330 1D000224 */  addiu      $v0, $zero, 0x1D
    /* 3A334 8004A334 0300A210 */  beq        $a1, $v0, .L8004A344
    /* 3A338 8004A338 22000224 */   addiu     $v0, $zero, 0x22
    /* 3A33C 8004A33C 0300A214 */  bne        $a1, $v0, .L8004A34C
    /* 3A340 8004A340 00000000 */   nop
  .L8004A344:
    /* 3A344 8004A344 D9280108 */  j          .L8004A364
    /* 3A348 8004A348 21200002 */   addu      $a0, $s0, $zero
  .L8004A34C:
    /* 3A34C 8004A34C B3F6000C */  jal        SetRndSeed__Fl
    /* 3A350 8004A350 21204002 */   addu      $a0, $s2, $zero
    /* 3A354 8004A354 C627010C */  jal        RndHealerItem__Fi
    /* 3A358 8004A358 21202002 */   addu      $a0, $s1, $zero
    /* 3A35C 8004A35C 21200002 */  addu       $a0, $s0, $zero
    /* 3A360 8004A360 FFFF4524 */  addiu      $a1, $v0, -0x1
  .L8004A364:
    /* 3A364 8004A364 A704010C */  jal        GetItemAttrs__Fiii
    /* 3A368 8004A368 21302002 */   addu      $a2, $s1, $zero
    /* 3A36C 8004A36C C0101000 */  sll        $v0, $s0, 3
    /* 3A370 8004A370 23105000 */  subu       $v0, $v0, $s0
    /* 3A374 8004A374 80100200 */  sll        $v0, $v0, 2
    /* 3A378 8004A378 23105000 */  subu       $v0, $v0, $s0
    /* 3A37C 8004A37C 80100200 */  sll        $v0, $v0, 2
    /* 3A380 8004A380 01000324 */  addiu      $v1, $zero, 0x1
    /* 3A384 8004A384 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 3A388 8004A388 21082200 */  addu       $at, $at, $v0
    /* 3A38C 8004A38C BD1D23A0 */  sb         $v1, %lo(item + 0x69)($at)
    /* 3A390 8004A390 1280043C */  lui        $a0, %hi(FePlayerNo)
    /* 3A394 8004A394 78B3848C */  lw         $a0, %lo(FePlayerNo)($a0)
    /* 3A398 8004A398 00402336 */  ori        $v1, $s1, 0x4000
    /* 3A39C 8004A39C 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 3A3A0 8004A3A0 21082200 */  addu       $at, $at, $v0
    /* 3A3A4 8004A3A4 641D32AC */  sw         $s2, %lo(item + 0x10)($at)
    /* 3A3A8 8004A3A8 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 3A3AC 8004A3AC 21082200 */  addu       $at, $at, $v0
    /* 3A3B0 8004A3B0 781D23A4 */  sh         $v1, %lo(item + 0x24)($at)
    /* 3A3B4 8004A3B4 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 3A3B8 8004A3B8 21082200 */  addu       $at, $at, $v0
    /* 3A3BC 8004A3BC B91D24A0 */  sb         $a0, %lo(item + 0x65)($at)
    /* 3A3C0 8004A3C0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 3A3C4 8004A3C4 1800B28F */  lw         $s2, 0x18($sp)
    /* 3A3C8 8004A3C8 1400B18F */  lw         $s1, 0x14($sp)
    /* 3A3CC 8004A3CC 1000B08F */  lw         $s0, 0x10($sp)
    /* 3A3D0 8004A3D0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3A3D4 8004A3D4 0800E003 */  jr         $ra
    /* 3A3D8 8004A3D8 00000000 */   nop
endlabel RecreateHealerItem__Fiiii
