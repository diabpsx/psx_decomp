.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_DoLanding__FP10BIRDSTRUCT, 0x6C

glabel BIRD_DoLanding__FP10BIRDSTRUCT
    /* 9C520 800AC520 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9C524 800AC524 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9C528 800AC528 21808000 */  addu       $s0, $a0, $zero
    /* 9C52C 800AC52C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9C530 800AC530 13000292 */  lbu        $v0, 0x13($s0)
    /* 9C534 800AC534 01000524 */  addiu      $a1, $zero, 0x1
    /* 9C538 800AC538 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9C53C 800AC53C CFAD020C */  jal        AlterBirdPos__FP10BIRDSTRUCTUc
    /* 9C540 800AC540 130002A2 */   sb        $v0, 0x13($s0)
    /* 9C544 800AC544 13000282 */  lb         $v0, 0x13($s0)
    /* 9C548 800AC548 00000000 */  nop
    /* 9C54C 800AC54C 0A00401C */  bgtz       $v0, .L800AC578
    /* 9C550 800AC550 00000000 */   nop
    /* 9C554 800AC554 08000482 */  lb         $a0, 0x8($s0)
    /* 9C558 800AC558 09000582 */  lb         $a1, 0x9($s0)
    /* 9C55C 800AC55C 1383010C */  jal        SolidLoc__Fii
    /* 9C560 800AC560 130000A2 */   sb        $zero, 0x13($s0)
    /* 9C564 800AC564 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9C568 800AC568 03004014 */  bnez       $v0, .L800AC578
    /* 9C56C 800AC56C 00000000 */   nop
    /* 9C570 800AC570 94AF020C */  jal        BIRD_StartPerch__FP10BIRDSTRUCT
    /* 9C574 800AC574 21200002 */   addu      $a0, $s0, $zero
  .L800AC578:
    /* 9C578 800AC578 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9C57C 800AC57C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9C580 800AC580 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9C584 800AC584 0800E003 */  jr         $ra
    /* 9C588 800AC588 00000000 */   nop
endlabel BIRD_DoLanding__FP10BIRDSTRUCT
