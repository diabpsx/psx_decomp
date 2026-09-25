.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching seekblockhandlez, 0x20

glabel seekblockhandlez
    /* 16FC4 80026FC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 16FC8 80026FC8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 16FCC 80026FCC C59B000C */  jal        seekblockhandlea
    /* 16FD0 80026FD0 21300000 */   addu      $a2, $zero, $zero
    /* 16FD4 80026FD4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 16FD8 80026FD8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 16FDC 80026FDC 0800E003 */  jr         $ra
    /* 16FE0 80026FE0 00000000 */   nop
endlabel seekblockhandlez
