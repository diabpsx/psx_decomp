.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetItemGraphics__7CBlocksi, 0x28

glabel SetItemGraphics__7CBlocksi
    /* 81C00 80091C00 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81C04 80091C04 1000BFAF */  sw         $ra, 0x10($sp)
    /* 81C08 80091C08 2138A000 */  addu       $a3, $a1, $zero
    /* 81C0C 80091C0C 94008524 */  addiu      $a1, $a0, 0x94
    /* 81C10 80091C10 AE36020C */  jal        SetGraphics__7CBlocksPP7TextDatPii
    /* 81C14 80091C14 90008624 */   addiu     $a2, $a0, 0x90
    /* 81C18 80091C18 1000BF8F */  lw         $ra, 0x10($sp)
    /* 81C1C 80091C1C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81C20 80091C20 0800E003 */  jr         $ra
    /* 81C24 80091C24 00000000 */   nop
endlabel SetItemGraphics__7CBlocksi
