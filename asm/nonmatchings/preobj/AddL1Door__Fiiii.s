.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddL1Door__Fiiii, 0xE8

glabel AddL1Door__Fiiii
    /* 1C3E0 80155FD8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1C3E4 80155FDC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1C3E8 80155FE0 21988000 */  addu       $s3, $a0, $zero
    /* 1C3EC 80155FE4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1C3F0 80155FE8 2188A000 */  addu       $s1, $a1, $zero
    /* 1C3F4 80155FEC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1C3F8 80155FF0 40101300 */  sll        $v0, $s3, 1
    /* 1C3FC 80155FF4 21105300 */  addu       $v0, $v0, $s3
    /* 1C400 80155FF8 80100200 */  sll        $v0, $v0, 2
    /* 1C404 80155FFC 23105300 */  subu       $v0, $v0, $s3
    /* 1C408 80156000 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1C40C 80156004 80800200 */  sll        $s0, $v0, 2
    /* 1C410 80156008 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C414 8015600C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1C418 80156010 0E80013C */  lui        $at, %hi(object + 0x2B)
    /* 1C41C 80156014 21083000 */  addu       $at, $at, $s0
    /* 1C420 80156018 778C22A0 */  sb         $v0, %lo(object + 0x2B)($at)
    /* 1C424 8015601C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C428 80156020 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 1C42C 80156024 21083000 */  addu       $at, $at, $s0
    /* 1C430 80156028 718C20A0 */  sb         $zero, %lo(object + 0x25)($at)
    /* 1C434 8015602C 0700E214 */  bne        $a3, $v0, .L8015604C
    /* 1C438 80156030 2190C000 */   addu      $s2, $a2, $zero
    /* 1C43C 80156034 21202002 */  addu       $a0, $s1, $zero
    /* 1C440 80156038 910A020C */  jal        GetDPiece__Fii
    /* 1C444 8015603C 21284002 */   addu      $a1, $s2, $zero
    /* 1C448 80156040 21202002 */  addu       $a0, $s1, $zero
    /* 1C44C 80156044 18580508 */  j          .L80156060
    /* 1C450 80156048 FFFF4526 */   addiu     $a1, $s2, -0x1
  .L8015604C:
    /* 1C454 8015604C 21202002 */  addu       $a0, $s1, $zero
    /* 1C458 80156050 910A020C */  jal        GetDPiece__Fii
    /* 1C45C 80156054 21284002 */   addu      $a1, $s2, $zero
    /* 1C460 80156058 FFFF2426 */  addiu      $a0, $s1, -0x1
    /* 1C464 8015605C 21284002 */  addu       $a1, $s2, $zero
  .L80156060:
    /* 1C468 80156060 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1C46C 80156064 21083000 */  addu       $at, $at, $s0
    /* 1C470 80156068 5A8C22A4 */  sh         $v0, %lo(object + 0xE)($at)
    /* 1C474 8015606C 910A020C */  jal        GetDPiece__Fii
    /* 1C478 80156070 00000000 */   nop
    /* 1C47C 80156074 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1C480 80156078 21083000 */  addu       $at, $at, $s0
    /* 1C484 8015607C 5C8C22A4 */  sh         $v0, %lo(object + 0x10)($at)
    /* 1C488 80156080 40101300 */  sll        $v0, $s3, 1
    /* 1C48C 80156084 21105300 */  addu       $v0, $v0, $s3
    /* 1C490 80156088 80100200 */  sll        $v0, $v0, 2
    /* 1C494 8015608C 23105300 */  subu       $v0, $v0, $s3
    /* 1C498 80156090 80100200 */  sll        $v0, $v0, 2
    /* 1C49C 80156094 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1C4A0 80156098 21082200 */  addu       $at, $at, $v0
    /* 1C4A4 8015609C 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 1C4A8 801560A0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1C4AC 801560A4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1C4B0 801560A8 1800B28F */  lw         $s2, 0x18($sp)
    /* 1C4B4 801560AC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1C4B8 801560B0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C4BC 801560B4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1C4C0 801560B8 0800E003 */  jr         $ra
    /* 1C4C4 801560BC 00000000 */   nop
endlabel AddL1Door__Fiiii
