.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetObjGraphics__7CBlocksi, 0x28

glabel SetObjGraphics__7CBlocksi
    /* 81C28 80091C28 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 81C2C 80091C2C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 81C30 80091C30 2138A000 */  addu       $a3, $a1, $zero
    /* 81C34 80091C34 74008524 */  addiu      $a1, $a0, 0x74
    /* 81C38 80091C38 AE36020C */  jal        SetGraphics__7CBlocksPP7TextDatPii
    /* 81C3C 80091C3C 8C008624 */   addiu     $a2, $a0, 0x8C
    /* 81C40 80091C40 1000BF8F */  lw         $ra, 0x10($sp)
    /* 81C44 80091C44 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 81C48 80091C48 0800E003 */  jr         $ra
    /* 81C4C 80091C4C 00000000 */   nop
endlabel SetObjGraphics__7CBlocksi
