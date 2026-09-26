.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_GoatMc__Fi, 0x20

glabel MAI_GoatMc__Fi
    /* 17DE4 801519DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 17DE8 801519E0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 17DEC 801519E4 6745050C */  jal        MAI_Round__FiUc
    /* 17DF0 801519E8 01000524 */   addiu     $a1, $zero, 0x1
    /* 17DF4 801519EC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 17DF8 801519F0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 17DFC 801519F4 0800E003 */  jr         $ra
    /* 17E00 801519F8 00000000 */   nop
endlabel MAI_GoatMc__Fi
