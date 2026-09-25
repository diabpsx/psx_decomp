.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPAD, 0x30

glabel StartPAD
    /* 1C58 80011C58 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C5C 80011C5C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1C60 80011C60 8B47000C */  jal        StartPAD2
    /* 1C64 80011C64 00000000 */   nop
    /* 1C68 80011C68 9346000C */  jal        ChangeClearPAD
    /* 1C6C 80011C6C 21200000 */   addu      $a0, $zero, $zero
    /* 1C70 80011C70 9F47000C */  jal        EnablePAD
    /* 1C74 80011C74 00000000 */   nop
    /* 1C78 80011C78 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1C7C 80011C7C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C80 80011C80 0800E003 */  jr         $ra
    /* 1C84 80011C84 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel StartPAD
