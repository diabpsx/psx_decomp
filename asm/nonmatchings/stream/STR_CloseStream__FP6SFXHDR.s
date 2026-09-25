.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_CloseStream__FP6SFXHDR, 0x6C

glabel STR_CloseStream__FP6SFXHDR
    /* 8931C 8009931C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 89320 80099320 1000B0AF */  sw         $s0, 0x10($sp)
    /* 89324 80099324 21808000 */  addu       $s0, $a0, $zero
    /* 89328 80099328 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8932C 8009932C 00000282 */  lb         $v0, 0x0($s0)
    /* 89330 80099330 00000000 */  nop
    /* 89334 80099334 0F004010 */  beqz       $v0, .L80099374
    /* 89338 80099338 00000000 */   nop
    /* 8933C 8009933C 3D068293 */  lbu        $v0, %gp_rel(NoActiveStreams)($gp)
    /* 89340 80099340 140000AE */  sw         $zero, 0x14($s0)
    /* 89344 80099344 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 89348 80099348 3D0682A3 */  sb         $v0, %gp_rel(NoActiveStreams)($gp)
    /* 8934C 8009934C 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 89350 80099350 000000A2 */   sb        $zero, 0x0($s0)
    /* 89354 80099354 21200000 */  addu       $a0, $zero, $zero
    /* 89358 80099358 1000028E */  lw         $v0, 0x10($s0)
    /* 8935C 8009935C 01000524 */  addiu      $a1, $zero, 0x1
    /* 89360 80099360 C362000C */  jal        SpuSetKey
    /* 89364 80099364 04284500 */   sllv      $a1, $a1, $v0
    /* 89368 80099368 4000048E */  lw         $a0, 0x40($s0)
    /* 8936C 8009936C 635E000C */  jal        SpuFree
    /* 89370 80099370 00000000 */   nop
  .L80099374:
    /* 89374 80099374 1400BF8F */  lw         $ra, 0x14($sp)
    /* 89378 80099378 1000B08F */  lw         $s0, 0x10($sp)
    /* 8937C 8009937C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 89380 80099380 0800E003 */  jr         $ra
    /* 89384 80099384 00000000 */   nop
endlabel STR_CloseStream__FP6SFXHDR
