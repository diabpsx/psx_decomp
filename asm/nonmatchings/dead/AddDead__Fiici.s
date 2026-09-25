.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddDead__Fiici, 0x20

glabel AddDead__Fiici
    /* 27F8C 80037F8C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27F90 80037F90 1000BFAF */  sw         $ra, 0x10($sp)
    /* 27F94 80037F94 D80A020C */  jal        SetdDead__FiiUc
    /* 27F98 80037F98 1F00C630 */   andi      $a2, $a2, 0x1F
    /* 27F9C 80037F9C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 27FA0 80037FA0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 27FA4 80037FA4 0800E003 */  jr         $ra
    /* 27FA8 80037FA8 00000000 */   nop
endlabel AddDead__Fiici
