.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init__4AMap, 0x6C

glabel Init__4AMap
    /* 71AA8 80081AA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 71AAC 80081AAC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71AB0 80081AB0 21808000 */  addu       $s0, $a0, $zero
    /* 71AB4 80081AB4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 71AB8 80081AB8 0400048E */  lw         $a0, 0x4($s0)
    /* 71ABC 80081ABC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 71AC0 80081AC0 0C008210 */  beq        $a0, $v0, .L80081AF4
    /* 71AC4 80081AC4 00000000 */   nop
    /* 71AC8 80081AC8 1886000C */  jal        GAL_Free
    /* 71ACC 80081ACC 00000000 */   nop
    /* 71AD0 80081AD0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 71AD4 80081AD4 07004014 */  bnez       $v0, .L80081AF4
    /* 71AD8 80081AD8 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 71ADC 80081ADC 21200000 */  addu       $a0, $zero, $zero
    /* 71AE0 80081AE0 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71AE4 80081AE4 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71AE8 80081AE8 A583000C */  jal        DBG_Error
    /* 71AEC 80081AEC EA000624 */   addiu     $a2, $zero, 0xEA
    /* 71AF0 80081AF0 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80081AF4:
    /* 71AF4 80081AF4 040002AE */  sw         $v0, 0x4($s0)
    /* 71AF8 80081AF8 0C0000AE */  sw         $zero, 0xC($s0)
    /* 71AFC 80081AFC 000000AE */  sw         $zero, 0x0($s0)
    /* 71B00 80081B00 1400BF8F */  lw         $ra, 0x14($sp)
    /* 71B04 80081B04 1000B08F */  lw         $s0, 0x10($sp)
    /* 71B08 80081B08 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 71B0C 80081B0C 0800E003 */  jr         $ra
    /* 71B10 80081B10 00000000 */   nop
endlabel Init__4AMap
