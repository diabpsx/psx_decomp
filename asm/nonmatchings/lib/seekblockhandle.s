.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching seekblockhandle, 0x20

glabel seekblockhandle
    /* 16FA4 80026FA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 16FA8 80026FA8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 16FAC 80026FAC C59B000C */  jal        seekblockhandlea
    /* 16FB0 80026FB0 01000624 */   addiu     $a2, $zero, 0x1
    /* 16FB4 80026FB4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 16FB8 80026FB8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 16FBC 80026FBC 0800E003 */  jr         $ra
    /* 16FC0 80026FC0 00000000 */   nop
endlabel seekblockhandle
