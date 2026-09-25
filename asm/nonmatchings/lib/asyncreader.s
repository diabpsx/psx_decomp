.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncreader, 0x44

glabel asyncreader
    /* 14370 80024370 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 14374 80024374 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 14378 80024378 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 1437C 8002437C 1280013C */  lui        $at, %hi(abortfile)
    /* 14380 80024380 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 14384 80024384 39050224 */  addiu      $v0, $zero, 0x539
    /* 14388 80024388 1180043C */  lui        $a0, %hi(D_8010E9CC)
    /* 1438C 8002438C CCE98424 */  addiu      $a0, $a0, %lo(D_8010E9CC)
    /* 14390 80024390 1000BFAF */  sw         $ra, 0x10($sp)
    /* 14394 80024394 1280013C */  lui        $at, %hi(abortline)
    /* 14398 80024398 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1439C 8002439C 0F95000C */  jal        abortmessage
    /* 143A0 800243A0 00000000 */   nop
    /* 143A4 800243A4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 143A8 800243A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 143AC 800243AC 0800E003 */  jr         $ra
    /* 143B0 800243B0 00000000 */   nop
endlabel asyncreader
