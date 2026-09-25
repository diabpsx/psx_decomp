.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching findcontainingmemblockz, 0x20

glabel findcontainingmemblockz
    /* 1BB30 8002BB30 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BB34 8002BB34 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1BB38 8002BB38 89AE000C */  jal        findcontainingmemblocka
    /* 1BB3C 8002BB3C 21280000 */   addu      $a1, $zero, $zero
    /* 1BB40 8002BB40 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1BB44 8002BB44 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BB48 8002BB48 0800E003 */  jr         $ra
    /* 1BB4C 8002BB4C 00000000 */   nop
endlabel findcontainingmemblockz
