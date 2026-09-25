.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching newDirOk__7GamePadi, 0xB0

glabel newDirOk__7GamePadi
    /* 693F8 800793F8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 693FC 800793FC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 69400 80079400 21808000 */  addu       $s0, $a0, $zero
    /* 69404 80079404 1400B1AF */  sw         $s1, 0x14($sp)
    /* 69408 80079408 2188A000 */  addu       $s1, $a1, $zero
    /* 6940C 8007940C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 69410 80079410 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 69414 80079414 1800B2AF */  sw         $s2, 0x18($sp)
    /* 69418 80079418 0000028E */  lw         $v0, 0x0($s0)
    /* 6941C 8007941C 4C000482 */  lb         $a0, 0x4C($s0)
    /* 69420 80079420 1280013C */  lui        $at, %hi(offset_x)
    /* 69424 80079424 21083100 */  addu       $at, $at, $s1
    /* 69428 80079428 A8C23280 */  lb         $s2, %lo(offset_x)($at)
    /* 6942C 8007942C 1280013C */  lui        $at, %hi(offset_y)
    /* 69430 80079430 21083100 */  addu       $at, $at, $s1
    /* 69434 80079434 B0C23380 */  lb         $s3, %lo(offset_y)($at)
    /* 69438 80079438 30004584 */  lh         $a1, 0x30($v0)
    /* 6943C 8007943C 32004684 */  lh         $a2, 0x32($v0)
    /* 69440 80079440 2128B200 */  addu       $a1, $a1, $s2
    /* 69444 80079444 DB9A010C */  jal        PosOkPlayer__Fiii
    /* 69448 80079448 2130D300 */   addu      $a2, $a2, $s3
    /* 6944C 8007944C FF004230 */  andi       $v0, $v0, 0xFF
    /* 69450 80079450 0D004014 */  bnez       $v0, .L80079488
    /* 69454 80079454 01000224 */   addiu     $v0, $zero, 0x1
    /* 69458 80079458 21200002 */  addu       $a0, $s0, $zero
    /* 6945C 8007945C 0000828C */  lw         $v0, 0x0($a0)
    /* 69460 80079460 21282002 */  addu       $a1, $s1, $zero
    /* 69464 80079464 2800468C */  lw         $a2, 0x28($v0)
    /* 69468 80079468 2C00478C */  lw         $a3, 0x2C($v0)
    /* 6946C 8007946C 2130D200 */  addu       $a2, $a2, $s2
    /* 69470 80079470 ACE4010C */  jal        CheckDirs__7GamePadiii
    /* 69474 80079474 2138F300 */   addu      $a3, $a3, $s3
    /* 69478 80079478 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 6947C 8007947C 02004314 */  bne        $v0, $v1, .L80079488
    /* 69480 80079480 01000224 */   addiu     $v0, $zero, 0x1
    /* 69484 80079484 21100000 */  addu       $v0, $zero, $zero
  .L80079488:
    /* 69488 80079488 2000BF8F */  lw         $ra, 0x20($sp)
    /* 6948C 8007948C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 69490 80079490 1800B28F */  lw         $s2, 0x18($sp)
    /* 69494 80079494 1400B18F */  lw         $s1, 0x14($sp)
    /* 69498 80079498 1000B08F */  lw         $s0, 0x10($sp)
    /* 6949C 8007949C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 694A0 800794A0 0800E003 */  jr         $ra
    /* 694A4 800794A4 00000000 */   nop
endlabel newDirOk__7GamePadi
