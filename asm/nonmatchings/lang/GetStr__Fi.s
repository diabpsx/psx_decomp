.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetStr__Fi, 0x7C

glabel GetStr__Fi
    /* 6B528 8007B528 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6B52C 8007B52C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6B530 8007B530 21808000 */  addu       $s0, $a0, $zero
    /* 6B534 8007B534 00400232 */  andi       $v0, $s0, 0x4000
    /* 6B538 8007B538 04004010 */  beqz       $v0, .L8007B54C
    /* 6B53C 8007B53C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 6B540 8007B540 00C01026 */  addiu      $s0, $s0, -0x4000
    /* 6B544 8007B544 5EED0108 */  j          .L8007B578
    /* 6B548 8007B548 03000424 */   addiu     $a0, $zero, 0x3
  .L8007B54C:
    /* 6B54C 8007B54C 00200232 */  andi       $v0, $s0, 0x2000
    /* 6B550 8007B550 03004010 */  beqz       $v0, .L8007B560
    /* 6B554 8007B554 02000424 */   addiu     $a0, $zero, 0x2
    /* 6B558 8007B558 5EED0108 */  j          .L8007B578
    /* 6B55C 8007B55C 00E01026 */   addiu     $s0, $s0, -0x2000
  .L8007B560:
    /* 6B560 8007B560 00100232 */  andi       $v0, $s0, 0x1000
    /* 6B564 8007B564 03004010 */  beqz       $v0, .L8007B574
    /* 6B568 8007B568 01000424 */   addiu     $a0, $zero, 0x1
    /* 6B56C 8007B56C 5EED0108 */  j          .L8007B578
    /* 6B570 8007B570 00F01026 */   addiu     $s0, $s0, -0x1000
  .L8007B574:
    /* 6B574 8007B574 21200000 */  addu       $a0, $zero, $zero
  .L8007B578:
    /* 6B578 8007B578 D5EC010C */  jal        LANG_SetDb__F10LANG_DB_NO
    /* 6B57C 8007B57C 00000000 */   nop
    /* 6B580 8007B580 7414838F */  lw         $v1, %gp_rel(TextPtr)($gp)
    /* 6B584 8007B584 80101000 */  sll        $v0, $s0, 2
    /* 6B588 8007B588 21104300 */  addu       $v0, $v0, $v1
    /* 6B58C 8007B58C 0000428C */  lw         $v0, 0x0($v0)
    /* 6B590 8007B590 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6B594 8007B594 1000B08F */  lw         $s0, 0x10($sp)
    /* 6B598 8007B598 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6B59C 8007B59C 0800E003 */  jr         $ra
    /* 6B5A0 8007B5A0 00000000 */   nop
endlabel GetStr__Fi
