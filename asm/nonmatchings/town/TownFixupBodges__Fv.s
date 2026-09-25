.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownFixupBodges__Fv, 0x40

glabel TownFixupBodges__Fv
    /* 6497C 8007497C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 64980 80074980 34000524 */  addiu      $a1, $zero, 0x34
    /* 64984 80074984 36000624 */  addiu      $a2, $zero, 0x36
    /* 64988 80074988 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 6498C 8007498C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 64990 80074990 1BD2010C */  jal        T_FillTile__FPUciii
    /* 64994 80074994 0B010724 */   addiu     $a3, $zero, 0x10B
    /* 64998 80074998 28000524 */  addiu      $a1, $zero, 0x28
    /* 6499C 8007499C 3F000624 */  addiu      $a2, $zero, 0x3F
    /* 649A0 800749A0 4821848F */  lw         $a0, %gp_rel(D_8011C8C8)($gp)
    /* 649A4 800749A4 1BD2010C */  jal        T_FillTile__FPUciii
    /* 649A8 800749A8 0B010724 */   addiu     $a3, $zero, 0x10B
    /* 649AC 800749AC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 649B0 800749B0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 649B4 800749B4 0800E003 */  jr         $ra
    /* 649B8 800749B8 00000000 */   nop
endlabel TownFixupBodges__Fv
