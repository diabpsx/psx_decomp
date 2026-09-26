.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Mega__Fi, 0x24

glabel MAI_Mega__Fi
    /* 190C0 80152CB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 190C4 80152CBC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 190C8 80152CC0 31000524 */  addiu      $a1, $zero, 0x31
    /* 190CC 80152CC4 F549050C */  jal        MAI_RR2__Fiii
    /* 190D0 80152CC8 21300000 */   addu      $a2, $zero, $zero
    /* 190D4 80152CCC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 190D8 80152CD0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 190DC 80152CD4 0800E003 */  jr         $ra
    /* 190E0 80152CD8 00000000 */   nop
endlabel MAI_Mega__Fi
