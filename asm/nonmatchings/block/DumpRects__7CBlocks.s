.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpRects__7CBlocks, 0x68

glabel DumpRects__7CBlocks
    /* 7DA50 8008DA50 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7DA54 8008DA54 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7DA58 8008DA58 21808000 */  addu       $s0, $a0, $zero
    /* 7DA5C 8008DA5C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7DA60 8008DA60 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7DA64 8008DA64 BC00048E */  lw         $a0, 0xBC($s0)
    /* 7DA68 8008DA68 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 7DA6C 8008DA6C 0C009110 */  beq        $a0, $s1, .L8008DAA0
    /* 7DA70 8008DA70 00000000 */   nop
    /* 7DA74 8008DA74 1886000C */  jal        GAL_Free
    /* 7DA78 8008DA78 00000000 */   nop
    /* 7DA7C 8008DA7C FF004230 */  andi       $v0, $v0, 0xFF
    /* 7DA80 8008DA80 05004014 */  bnez       $v0, .L8008DA98
    /* 7DA84 8008DA84 21200000 */   addu      $a0, $zero, $zero
    /* 7DA88 8008DA88 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7DA8C 8008DA8C 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7DA90 8008DA90 A583000C */  jal        DBG_Error
    /* 7DA94 8008DA94 18020624 */   addiu     $a2, $zero, 0x218
  .L8008DA98:
    /* 7DA98 8008DA98 B80000AE */  sw         $zero, 0xB8($s0)
    /* 7DA9C 8008DA9C BC0011AE */  sw         $s1, 0xBC($s0)
  .L8008DAA0:
    /* 7DAA0 8008DAA0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7DAA4 8008DAA4 1400B18F */  lw         $s1, 0x14($sp)
    /* 7DAA8 8008DAA8 1000B08F */  lw         $s0, 0x10($sp)
    /* 7DAAC 8008DAAC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7DAB0 8008DAB0 0800E003 */  jr         $ra
    /* 7DAB4 8008DAB4 00000000 */   nop
endlabel DumpRects__7CBlocks
