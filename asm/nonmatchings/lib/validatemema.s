.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching validatemema, 0x150

glabel validatemema
    /* 1C4F0 8002C4F0 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1C4F4 8002C4F4 3400B5AF */  sw         $s5, 0x34($sp)
    /* 1C4F8 8002C4F8 21A88000 */  addu       $s5, $a0, $zero
    /* 1C4FC 8002C4FC 1280043C */  lui        $a0, %hi(_lv)
    /* 1C500 8002C500 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C504 8002C504 3000B4AF */  sw         $s4, 0x30($sp)
    /* 1C508 8002C508 01001424 */  addiu      $s4, $zero, 0x1
    /* 1C50C 8002C50C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 1C510 8002C510 21800000 */  addu       $s0, $zero, $zero
    /* 1C514 8002C514 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 1C518 8002C518 21980000 */  addu       $s3, $zero, $zero
    /* 1C51C 8002C51C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 1C520 8002C520 21880000 */  addu       $s1, $zero, $zero
    /* 1C524 8002C524 3800BFAF */  sw         $ra, 0x38($sp)
    /* 1C528 8002C528 E8BD000C */  jal        locksemaphore
    /* 1C52C 8002C52C 2800B2AF */   sw        $s2, 0x28($sp)
  .L8002C530:
    /* 1C530 8002C530 19008012 */  beqz       $s4, .L8002C598
    /* 1C534 8002C534 00000000 */   nop
    /* 1C538 8002C538 1380013C */  lui        $at, %hi(D_80137A34)
    /* 1C53C 8002C53C 21083100 */  addu       $at, $at, $s1
    /* 1C540 8002C540 347A228C */  lw         $v0, %lo(D_80137A34)($at)
    /* 1C544 8002C544 00000000 */  nop
    /* 1C548 8002C548 0D004010 */  beqz       $v0, .L8002C580
    /* 1C54C 8002C54C 00000000 */   nop
    /* 1C550 8002C550 1380013C */  lui        $at, %hi(memclass)
    /* 1C554 8002C554 21083100 */  addu       $at, $at, $s1
    /* 1C558 8002C558 307A308C */  lw         $s0, %lo(memclass)($at)
    /* 1C55C 8002C55C 21904000 */  addu       $s2, $v0, $zero
  .L8002C560:
    /* 1C560 8002C560 2000108E */  lw         $s0, 0x20($s0)
    /* 1C564 8002C564 1BB1000C */  jal        checksentinelz
    /* 1C568 8002C568 21200002 */   addu      $a0, $s0, $zero
    /* 1C56C 8002C56C 21A04000 */  addu       $s4, $v0, $zero
    /* 1C570 8002C570 03008012 */  beqz       $s4, .L8002C580
    /* 1C574 8002C574 00000000 */   nop
    /* 1C578 8002C578 F9FF1216 */  bne        $s0, $s2, .L8002C560
    /* 1C57C 8002C57C 00000000 */   nop
  .L8002C580:
    /* 1C580 8002C580 01007326 */  addiu      $s3, $s3, 0x1
    /* 1C584 8002C584 1000622A */  slti       $v0, $s3, 0x10
    /* 1C588 8002C588 E9FF4014 */  bnez       $v0, .L8002C530
    /* 1C58C 8002C58C 18003126 */   addiu     $s1, $s1, 0x18
    /* 1C590 8002C590 1C008016 */  bnez       $s4, .L8002C604
    /* 1C594 8002C594 00000000 */   nop
  .L8002C598:
    /* 1C598 8002C598 1A00A012 */  beqz       $s5, .L8002C604
    /* 1C59C 8002C59C 1800A527 */   addiu     $a1, $sp, 0x18
    /* 1C5A0 8002C5A0 1C00A0A3 */  sb         $zero, 0x1C($sp)
    /* 1C5A4 8002C5A4 0000028E */  lw         $v0, 0x0($s0)
    /* 1C5A8 8002C5A8 1400048E */  lw         $a0, 0x14($s0)
    /* 1C5AC 8002C5AC 04000624 */  addiu      $a2, $zero, 0x4
    /* 1C5B0 8002C5B0 F1B1000C */  jal        blockmove
    /* 1C5B4 8002C5B4 21204400 */   addu      $a0, $v0, $a0
    /* 1C5B8 8002C5B8 0000038E */  lw         $v1, 0x0($s0)
    /* 1C5BC 8002C5BC 1400048E */  lw         $a0, 0x14($s0)
    /* 1C5C0 8002C5C0 1800A227 */  addiu      $v0, $sp, 0x18
    /* 1C5C4 8002C5C4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1C5C8 8002C5C8 21186400 */  addu       $v1, $v1, $a0
    /* 1C5CC 8002C5CC 1000A3AF */  sw         $v1, 0x10($sp)
    /* 1C5D0 8002C5D0 0000068E */  lw         $a2, 0x0($s0)
    /* 1C5D4 8002C5D4 1400078E */  lw         $a3, 0x14($s0)
    /* 1C5D8 8002C5D8 1180023C */  lui        $v0, %hi(D_8010FA80)
    /* 1C5DC 8002C5DC 80FA4224 */  addiu      $v0, $v0, %lo(D_8010FA80)
    /* 1C5E0 8002C5E0 1280013C */  lui        $at, %hi(abortfile)
    /* 1C5E4 8002C5E4 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1C5E8 8002C5E8 A4000224 */  addiu      $v0, $zero, 0xA4
    /* 1C5EC 8002C5EC 1280013C */  lui        $at, %hi(abortline)
    /* 1C5F0 8002C5F0 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1C5F4 8002C5F4 1180043C */  lui        $a0, %hi(D_8010FA90)
    /* 1C5F8 8002C5F8 90FA8424 */  addiu      $a0, $a0, %lo(D_8010FA90)
    /* 1C5FC 8002C5FC 0F95000C */  jal        abortmessage
    /* 1C600 8002C600 04000526 */   addiu     $a1, $s0, 0x4
  .L8002C604:
    /* 1C604 8002C604 1280043C */  lui        $a0, %hi(_lv)
    /* 1C608 8002C608 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C60C 8002C60C F3BD000C */  jal        unlocksemaphore
    /* 1C610 8002C610 00000000 */   nop
    /* 1C614 8002C614 21108002 */  addu       $v0, $s4, $zero
    /* 1C618 8002C618 3800BF8F */  lw         $ra, 0x38($sp)
    /* 1C61C 8002C61C 3400B58F */  lw         $s5, 0x34($sp)
    /* 1C620 8002C620 3000B48F */  lw         $s4, 0x30($sp)
    /* 1C624 8002C624 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 1C628 8002C628 2800B28F */  lw         $s2, 0x28($sp)
    /* 1C62C 8002C62C 2400B18F */  lw         $s1, 0x24($sp)
    /* 1C630 8002C630 2000B08F */  lw         $s0, 0x20($sp)
    /* 1C634 8002C634 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1C638 8002C638 0800E003 */  jr         $ra
    /* 1C63C 8002C63C 00000000 */   nop
endlabel validatemema
