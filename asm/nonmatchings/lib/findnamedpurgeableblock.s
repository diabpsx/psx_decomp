.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching findnamedpurgeableblock, 0x20

glabel findnamedpurgeableblock
    /* 19DB0 80029DB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 19DB4 80029DB4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 19DB8 80029DB8 41A7000C */  jal        findnamedpurgeableblockinclass
    /* 19DBC 80029DBC 21280000 */   addu      $a1, $zero, $zero
    /* 19DC0 80029DC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 19DC4 80029DC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 19DC8 80029DC8 0800E003 */  jr         $ra
    /* 19DCC 80029DCC 00000000 */   nop
endlabel findnamedpurgeableblock
