.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuInit, 0x20

glabel SpuInit
    /* 665C 8001665C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6660 80016660 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6664 80016664 9F59000C */  jal        _SpuInit
    /* 6668 80016668 21200000 */   addu      $a0, $zero, $zero
    /* 666C 8001666C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6670 80016670 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6674 80016674 0800E003 */  jr         $ra
    /* 6678 80016678 00000000 */   nop
endlabel SpuInit
