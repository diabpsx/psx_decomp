.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_IsStackCorrupted, 0x7C

glabel TSK_IsStackCorrupted
    /* 105A8 800205A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 105AC 800205AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 105B0 800205B0 21808000 */  addu       $s0, $a0, $zero
    /* 105B4 800205B4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 105B8 800205B8 1000028E */  lw         $v0, 0x10($s0)
    /* 105BC 800205BC 00000000 */  nop
    /* 105C0 800205C0 10004230 */  andi       $v0, $v0, 0x10
    /* 105C4 800205C4 07004014 */  bnez       $v0, .L800205E4
    /* 105C8 800205C8 00000000 */   nop
    /* 105CC 800205CC 1400048E */  lw         $a0, 0x14($s0)
    /* 105D0 800205D0 1800058E */  lw         $a1, 0x18($s0)
    /* 105D4 800205D4 7284000C */  jal        GSYS_IsStackCorrupted
    /* 105D8 800205D8 00000000 */   nop
    /* 105DC 800205DC 84810008 */  j          .L80020610
    /* 105E0 800205E0 FF004230 */   andi      $v0, $v0, 0xFF
  .L800205E4:
    /* 105E4 800205E4 1800058E */  lw         $a1, 0x18($s0)
    /* 105E8 800205E8 1400048E */  lw         $a0, 0x14($s0)
    /* 105EC 800205EC EC82000C */  jal        CheckExtraStack
    /* 105F0 800205F0 82280500 */   srl       $a1, $a1, 2
    /* 105F4 800205F4 58000396 */  lhu        $v1, 0x58($s0)
    /* 105F8 800205F8 21204000 */  addu       $a0, $v0, $zero
    /* 105FC 800205FC 2A108300 */  slt        $v0, $a0, $v1
    /* 10600 80020600 18000396 */  lhu        $v1, 0x18($s0)
    /* 10604 80020604 80200400 */  sll        $a0, $a0, 2
    /* 10608 80020608 23186400 */  subu       $v1, $v1, $a0
    /* 1060C 8002060C 5A0003A6 */  sh         $v1, 0x5A($s0)
  .L80020610:
    /* 10610 80020610 1400BF8F */  lw         $ra, 0x14($sp)
    /* 10614 80020614 1000B08F */  lw         $s0, 0x10($sp)
    /* 10618 80020618 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1061C 8002061C 0800E003 */  jr         $ra
    /* 10620 80020620 00000000 */   nop
endlabel TSK_IsStackCorrupted
