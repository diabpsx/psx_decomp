.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching writehandle, 0x20

glabel writehandle
    /* 18EC8 80028EC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 18ECC 80028ECC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 18ED0 80028ED0 7746000C */  jal        write
    /* 18ED4 80028ED4 00000000 */   nop
    /* 18ED8 80028ED8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 18EDC 80028EDC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 18EE0 80028EE0 0800E003 */  jr         $ra
    /* 18EE4 80028EE4 00000000 */   nop
endlabel writehandle
