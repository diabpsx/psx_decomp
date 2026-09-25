.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StopCARD, 0x28

glabel StopCARD
    /* A900 8001A900 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A904 8001A904 1000BFAF */  sw         $ra, 0x10($sp)
    /* A908 8001A908 536A000C */  jal        StopCARD2
    /* A90C 8001A90C 00000000 */   nop
    /* A910 8001A910 CB6A000C */  jal        _ExitCard
    /* A914 8001A914 00000000 */   nop
    /* A918 8001A918 1000BF8F */  lw         $ra, 0x10($sp)
    /* A91C 8001A91C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* A920 8001A920 0800E003 */  jr         $ra
    /* A924 8001A924 00000000 */   nop
endlabel StopCARD
    /* A928 8001A928 00000000 */  nop
