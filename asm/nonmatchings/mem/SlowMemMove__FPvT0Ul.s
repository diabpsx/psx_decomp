.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SlowMemMove__FPvT0Ul, 0x20

glabel SlowMemMove__FPvT0Ul
    /* 7442C 8008442C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 74430 80084430 1000BFAF */  sw         $ra, 0x10($sp)
    /* 74434 80084434 BF69000C */  jal        memmove
    /* 74438 80084438 00000000 */   nop
    /* 7443C 8008443C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 74440 80084440 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 74444 80084444 0800E003 */  jr         $ra
    /* 74448 80084448 00000000 */   nop
endlabel SlowMemMove__FPvT0Ul
