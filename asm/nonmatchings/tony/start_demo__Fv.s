.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching start_demo__Fv, 0x10

glabel start_demo__Fv
    /* 8B9A4 8009B9A4 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 8B9A8 8009B9A8 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 8B9AC 8009B9AC 0800E003 */  jr         $ra
    /* 8B9B0 8009B9B0 00000000 */   nop
endlabel start_demo__Fv
