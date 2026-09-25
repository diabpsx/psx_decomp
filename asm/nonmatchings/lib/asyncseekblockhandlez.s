.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncseekblockhandlez, 0x20

glabel asyncseekblockhandlez
    /* 17094 80027094 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 17098 80027098 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1709C 8002709C F99B000C */  jal        asyncseekblockhandlea
    /* 170A0 800270A0 21300000 */   addu      $a2, $zero, $zero
    /* 170A4 800270A4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 170A8 800270A8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 170AC 800270AC 0800E003 */  jr         $ra
    /* 170B0 800270B0 00000000 */   nop
endlabel asyncseekblockhandlez
