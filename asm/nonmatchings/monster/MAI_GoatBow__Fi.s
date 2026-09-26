.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_GoatBow__Fi, 0x24

glabel MAI_GoatBow__Fi
    /* 18028 80151C20 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1802C 80151C24 1000BFAF */  sw         $ra, 0x10($sp)
    /* 18030 80151C28 21280000 */  addu       $a1, $zero, $zero
    /* 18034 80151C2C 7F46050C */  jal        MAI_Ranged__FiiUc
    /* 18038 80151C30 21300000 */   addu      $a2, $zero, $zero
    /* 1803C 80151C34 1000BF8F */  lw         $ra, 0x10($sp)
    /* 18040 80151C38 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 18044 80151C3C 0800E003 */  jr         $ra
    /* 18048 80151C40 00000000 */   nop
endlabel MAI_GoatBow__Fi
