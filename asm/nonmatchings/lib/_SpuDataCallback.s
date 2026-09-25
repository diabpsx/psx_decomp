.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _SpuDataCallback, 0x24

glabel _SpuDataCallback
    /* 732C 8001732C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7330 80017330 1000BFAF */  sw         $ra, 0x10($sp)
    /* 7334 80017334 21288000 */  addu       $a1, $a0, $zero
    /* 7338 80017338 B748000C */  jal        DMACallback
    /* 733C 8001733C 04000424 */   addiu     $a0, $zero, 0x4
    /* 7340 80017340 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7344 80017344 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7348 80017348 0800E003 */  jr         $ra
    /* 734C 8001734C 00000000 */   nop
endlabel _SpuDataCallback
    /* 7350 80017350 00000000 */  nop
    /* 7354 80017354 00000000 */  nop
    /* 7358 80017358 00000000 */  nop
