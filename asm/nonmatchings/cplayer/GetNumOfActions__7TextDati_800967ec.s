.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfActions__7TextDati_800967ec, 0x24

glabel GetNumOfActions__7TextDati_800967ec
    /* 867EC 800967EC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 867F0 800967F0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 867F4 800967F4 045A020C */  jal        GetCreature__7TextDati_80096810
    /* 867F8 800967F8 00000000 */   nop
    /* 867FC 800967FC 0000428C */  lw         $v0, 0x0($v0)
    /* 86800 80096800 1000BF8F */  lw         $ra, 0x10($sp)
    /* 86804 80096804 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 86808 80096808 0800E003 */  jr         $ra
    /* 8680C 8009680C 00000000 */   nop
endlabel GetNumOfActions__7TextDati_800967ec
