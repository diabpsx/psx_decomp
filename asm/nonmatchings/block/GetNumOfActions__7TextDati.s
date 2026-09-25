.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNumOfActions__7TextDati, 0x24

glabel GetNumOfActions__7TextDati
    /* 81DBC 80091DBC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81DC0 80091DC0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 81DC4 80091DC4 7847020C */  jal        GetCreature__7TextDati_80091de0
    /* 81DC8 80091DC8 00000000 */   nop
    /* 81DCC 80091DCC 0000428C */  lw         $v0, 0x0($v0)
    /* 81DD0 80091DD0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 81DD4 80091DD4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81DD8 80091DD8 0800E003 */  jr         $ra
    /* 81DDC 80091DDC 00000000 */   nop
endlabel GetNumOfActions__7TextDati
