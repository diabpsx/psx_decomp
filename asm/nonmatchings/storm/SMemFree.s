.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SMemFree, 0x20

glabel SMemFree
    /* 6B1F0 8007B1F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6B1F4 8007B1F4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6B1F8 8007B1F8 E720020C */  jal        Tfree__FPv
    /* 6B1FC 8007B1FC 00000000 */   nop
    /* 6B200 8007B200 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6B204 8007B204 01000224 */  addiu      $v0, $zero, 0x1
    /* 6B208 8007B208 0800E003 */  jr         $ra
    /* 6B20C 8007B20C 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel SMemFree
