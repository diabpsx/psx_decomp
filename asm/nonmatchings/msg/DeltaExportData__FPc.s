.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeltaExportData__FPc, 0x2C

glabel DeltaExportData__FPc
    /* 3F560 8004F560 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3F564 8004F564 1000BFAF */  sw         $ra, 0x10($sp)
    /* 3F568 8004F568 21288000 */  addu       $a1, $a0, $zero
    /* 3F56C 8004F56C 0D80043C */  lui        $a0, %hi(GameMaps)
    /* 3F570 8004F570 4C708424 */  addiu      $a0, $a0, %lo(GameMaps)
    /* 3F574 8004F574 5406020C */  jal        ExportData__13CompLevelMapsPUc
    /* 3F578 8004F578 00000000 */   nop
    /* 3F57C 8004F57C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3F580 8004F580 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3F584 8004F584 0800E003 */  jr         $ra
    /* 3F588 8004F588 00000000 */   nop
endlabel DeltaExportData__FPc
