.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoSaveOptions__Fv, 0x28

glabel DoSaveOptions__Fv
    /* 1FA58 80159650 E00C848F */  lw         $a0, %gp_rel(current_card)($gp)
    /* 1FA5C 80159654 940C858F */  lw         $a1, %gp_rel(DiabloOptionFile)($gp)
    /* 1FA60 80159658 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1FA64 8015965C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1FA68 80159660 CC71050C */  jal        PSX_OPT_SaveGame__FiPc
    /* 1FA6C 80159664 00000000 */   nop
    /* 1FA70 80159668 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1FA74 8015966C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1FA78 80159670 0800E003 */  jr         $ra
    /* 1FA7C 80159674 00000000 */   nop
endlabel DoSaveOptions__Fv
