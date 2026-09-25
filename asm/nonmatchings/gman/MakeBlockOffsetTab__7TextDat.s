.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeBlockOffsetTab__7TextDat, 0x4C

glabel MakeBlockOffsetTab__7TextDat
    /* 82368 80092368 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8236C 8009236C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 82370 80092370 21808000 */  addu       $s0, $a0, $zero
    /* 82374 80092374 1400BFAF */  sw         $ra, 0x14($sp)
    /* 82378 80092378 2800028E */  lw         $v0, 0x28($s0)
    /* 8237C 8009237C 00000000 */  nop
    /* 82380 80092380 1800428C */  lw         $v0, 0x18($v0)
    /* 82384 80092384 00000000 */  nop
    /* 82388 80092388 05004010 */  beqz       $v0, .L800923A0
    /* 8238C 8009238C 00000000 */   nop
    /* 82390 80092390 3C00048E */  lw         $a0, 0x3C($s0)
    /* 82394 80092394 ED48020C */  jal        MakeOffsetTab__C9CBlockHdr
    /* 82398 80092398 00000000 */   nop
    /* 8239C 8009239C 200002AE */  sw         $v0, 0x20($s0)
  .L800923A0:
    /* 823A0 800923A0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 823A4 800923A4 1000B08F */  lw         $s0, 0x10($sp)
    /* 823A8 800923A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 823AC 800923AC 0800E003 */  jr         $ra
    /* 823B0 800923B0 00000000 */   nop
endlabel MakeBlockOffsetTab__7TextDat
