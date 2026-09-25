.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncread, 0x20

glabel asyncread
    /* 14238 80024238 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1423C 8002423C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 14240 80024240 3E90000C */  jal        asyncreadcallback
    /* 14244 80024244 21300000 */   addu      $a2, $zero, $zero
    /* 14248 80024248 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1424C 8002424C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 14250 80024250 0800E003 */  jr         $ra
    /* 14254 80024254 00000000 */   nop
endlabel asyncread
