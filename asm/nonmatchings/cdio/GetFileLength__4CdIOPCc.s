.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFileLength__4CdIOPCc, 0x24

glabel GetFileLength__4CdIOPCc
    /* 76D9C 80086D9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 76DA0 80086DA0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 76DA4 80086DA4 2120A000 */  addu       $a0, $a1, $zero
    /* 76DA8 80086DA8 0D1F020C */  jal        BL_FileLength__FPcc
    /* 76DAC 80086DAC 01000524 */   addiu     $a1, $zero, 0x1
    /* 76DB0 80086DB0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 76DB4 80086DB4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 76DB8 80086DB8 0800E003 */  jr         $ra
    /* 76DBC 80086DBC 00000000 */   nop
endlabel GetFileLength__4CdIOPCc
