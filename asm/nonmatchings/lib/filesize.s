.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching filesize, 0x20

glabel filesize
    /* 18F7C 80028F7C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 18F80 80028F80 1000BFAF */  sw         $ra, 0x10($sp)
    /* 18F84 80028F84 EFA3000C */  jal        filesizea
    /* 18F88 80028F88 01000524 */   addiu     $a1, $zero, 0x1
    /* 18F8C 80028F8C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 18F90 80028F90 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 18F94 80028F94 0800E003 */  jr         $ra
    /* 18F98 80028F98 00000000 */   nop
endlabel filesize
