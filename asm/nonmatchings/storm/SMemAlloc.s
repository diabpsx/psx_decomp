.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SMemAlloc, 0x20

glabel SMemAlloc
    /* 6B1D0 8007B1D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6B1D4 8007B1D4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6B1D8 8007B1D8 AA20020C */  jal        Tmalloc__Fi
    /* 6B1DC 8007B1DC 00000000 */   nop
    /* 6B1E0 8007B1E0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6B1E4 8007B1E4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6B1E8 8007B1E8 0800E003 */  jr         $ra
    /* 6B1EC 8007B1EC 00000000 */   nop
endlabel SMemAlloc
