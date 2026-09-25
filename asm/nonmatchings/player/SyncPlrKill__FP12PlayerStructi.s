.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncPlrKill__FP12PlayerStructi, 0x20

glabel SyncPlrKill__FP12PlayerStructi
    /* 51DB0 80061DB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 51DB4 80061DB4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 51DB8 80061DB8 5286010C */  jal        StartPlayerKill__FP12PlayerStructi
    /* 51DBC 80061DBC 00000000 */   nop
    /* 51DC0 80061DC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 51DC4 80061DC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 51DC8 80061DC8 0800E003 */  jr         $ra
    /* 51DCC 80061DCC 00000000 */   nop
endlabel SyncPlrKill__FP12PlayerStructi
