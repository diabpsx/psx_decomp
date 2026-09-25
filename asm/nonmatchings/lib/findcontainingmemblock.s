.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching findcontainingmemblock, 0x20

glabel findcontainingmemblock
    /* 1BB10 8002BB10 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BB14 8002BB14 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1BB18 8002BB18 89AE000C */  jal        findcontainingmemblocka
    /* 1BB1C 8002BB1C 01000524 */   addiu     $a1, $zero, 0x1
    /* 1BB20 8002BB20 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1BB24 8002BB24 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BB28 8002BB28 0800E003 */  jr         $ra
    /* 1BB2C 8002BB2C 00000000 */   nop
endlabel findcontainingmemblock
