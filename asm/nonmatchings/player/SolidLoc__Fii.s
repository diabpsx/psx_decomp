.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SolidLoc__Fii, 0x20

glabel SolidLoc__Fii
    /* 50C4C 80060C4C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 50C50 80060C50 1000BFAF */  sw         $ra, 0x10($sp)
    /* 50C54 80060C54 380B020C */  jal        GetSOLID__Fii
    /* 50C58 80060C58 00000000 */   nop
    /* 50C5C 80060C5C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 50C60 80060C60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 50C64 80060C64 0800E003 */  jr         $ra
    /* 50C68 80060C68 00000000 */   nop
endlabel SolidLoc__Fii
