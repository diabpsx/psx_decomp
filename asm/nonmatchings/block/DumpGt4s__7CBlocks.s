.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpGt4s__7CBlocks, 0x68

glabel DumpGt4s__7CBlocks
    /* 7D9E8 8008D9E8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7D9EC 8008D9EC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7D9F0 8008D9F0 21808000 */  addu       $s0, $a0, $zero
    /* 7D9F4 8008D9F4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7D9F8 8008D9F8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7D9FC 8008D9FC B400048E */  lw         $a0, 0xB4($s0)
    /* 7DA00 8008DA00 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 7DA04 8008DA04 0C009110 */  beq        $a0, $s1, .L8008DA38
    /* 7DA08 8008DA08 00000000 */   nop
    /* 7DA0C 8008DA0C 1886000C */  jal        GAL_Free
    /* 7DA10 8008DA10 00000000 */   nop
    /* 7DA14 8008DA14 FF004230 */  andi       $v0, $v0, 0xFF
    /* 7DA18 8008DA18 05004014 */  bnez       $v0, .L8008DA30
    /* 7DA1C 8008DA1C 21200000 */   addu      $a0, $zero, $zero
    /* 7DA20 8008DA20 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DA24 8008DA24 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DA28 8008DA28 A583000C */  jal        DBG_Error
    /* 7DA2C 8008DA2C 08020624 */   addiu     $a2, $zero, 0x208
  .L8008DA30:
    /* 7DA30 8008DA30 B00000AE */  sw         $zero, 0xB0($s0)
    /* 7DA34 8008DA34 B40011AE */  sw         $s1, 0xB4($s0)
  .L8008DA38:
    /* 7DA38 8008DA38 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7DA3C 8008DA3C 1400B18F */  lw         $s1, 0x14($sp)
    /* 7DA40 8008DA40 1000B08F */  lw         $s0, 0x10($sp)
    /* 7DA44 8008DA44 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7DA48 8008DA48 0800E003 */  jr         $ra
    /* 7DA4C 8008DA4C 00000000 */   nop
endlabel DumpGt4s__7CBlocks
