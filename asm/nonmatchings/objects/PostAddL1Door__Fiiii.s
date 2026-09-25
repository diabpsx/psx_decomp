.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostAddL1Door__Fiiii, 0xE8

glabel PostAddL1Door__Fiiii
    /* 43080 80053080 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 43084 80053084 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 43088 80053088 21988000 */  addu       $s3, $a0, $zero
    /* 4308C 8005308C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 43090 80053090 2188A000 */  addu       $s1, $a1, $zero
    /* 43094 80053094 1800B2AF */  sw         $s2, 0x18($sp)
    /* 43098 80053098 40101300 */  sll        $v0, $s3, 1
    /* 4309C 8005309C 21105300 */  addu       $v0, $v0, $s3
    /* 430A0 800530A0 80100200 */  sll        $v0, $v0, 2
    /* 430A4 800530A4 23105300 */  subu       $v0, $v0, $s3
    /* 430A8 800530A8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 430AC 800530AC 80800200 */  sll        $s0, $v0, 2
    /* 430B0 800530B0 01000224 */  addiu      $v0, $zero, 0x1
    /* 430B4 800530B4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 430B8 800530B8 0E80013C */  lui        $at, %hi(object + 0x2B)
    /* 430BC 800530BC 21083000 */  addu       $at, $at, $s0
    /* 430C0 800530C0 778C22A0 */  sb         $v0, %lo(object + 0x2B)($at)
    /* 430C4 800530C4 01000224 */  addiu      $v0, $zero, 0x1
    /* 430C8 800530C8 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 430CC 800530CC 21083000 */  addu       $at, $at, $s0
    /* 430D0 800530D0 718C20A0 */  sb         $zero, %lo(object + 0x25)($at)
    /* 430D4 800530D4 0700E214 */  bne        $a3, $v0, .L800530F4
    /* 430D8 800530D8 2190C000 */   addu      $s2, $a2, $zero
    /* 430DC 800530DC 21202002 */  addu       $a0, $s1, $zero
    /* 430E0 800530E0 80D4010C */  jal        FindBlock__Fii
    /* 430E4 800530E4 21284002 */   addu      $a1, $s2, $zero
    /* 430E8 800530E8 21202002 */  addu       $a0, $s1, $zero
    /* 430EC 800530EC 424C0108 */  j          .L80053108
    /* 430F0 800530F0 FFFF4526 */   addiu     $a1, $s2, -0x1
  .L800530F4:
    /* 430F4 800530F4 21202002 */  addu       $a0, $s1, $zero
    /* 430F8 800530F8 80D4010C */  jal        FindBlock__Fii
    /* 430FC 800530FC 21284002 */   addu      $a1, $s2, $zero
    /* 43100 80053100 FFFF2426 */  addiu      $a0, $s1, -0x1
    /* 43104 80053104 21284002 */  addu       $a1, $s2, $zero
  .L80053108:
    /* 43108 80053108 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4310C 8005310C 21083000 */  addu       $at, $at, $s0
    /* 43110 80053110 5A8C22A4 */  sh         $v0, %lo(object + 0xE)($at)
    /* 43114 80053114 80D4010C */  jal        FindBlock__Fii
    /* 43118 80053118 00000000 */   nop
    /* 4311C 8005311C 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 43120 80053120 21083000 */  addu       $at, $at, $s0
    /* 43124 80053124 5C8C22A4 */  sh         $v0, %lo(object + 0x10)($at)
    /* 43128 80053128 40101300 */  sll        $v0, $s3, 1
    /* 4312C 8005312C 21105300 */  addu       $v0, $v0, $s3
    /* 43130 80053130 80100200 */  sll        $v0, $v0, 2
    /* 43134 80053134 23105300 */  subu       $v0, $v0, $s3
    /* 43138 80053138 80100200 */  sll        $v0, $v0, 2
    /* 4313C 8005313C 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 43140 80053140 21082200 */  addu       $at, $at, $v0
    /* 43144 80053144 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 43148 80053148 2000BF8F */  lw         $ra, 0x20($sp)
    /* 4314C 8005314C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 43150 80053150 1800B28F */  lw         $s2, 0x18($sp)
    /* 43154 80053154 1400B18F */  lw         $s1, 0x14($sp)
    /* 43158 80053158 1000B08F */  lw         $s0, 0x10($sp)
    /* 4315C 8005315C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 43160 80053160 0800E003 */  jr         $ra
    /* 43164 80053164 00000000 */   nop
endlabel PostAddL1Door__Fiiii
