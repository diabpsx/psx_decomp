.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_pSTextBoxCels, 0x28

glabel _GLOBAL__D_pSTextBoxCels
    /* 64328 80074328 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6432C 8007432C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 64330 80074330 0E80043C */  lui        $a0, %hi(SBack)
    /* 64334 80074334 04E38424 */  addiu      $a0, $a0, %lo(SBack)
    /* 64338 80074338 F2D0010C */  jal        ___6Dialog_800743c8
    /* 6433C 8007433C 02000524 */   addiu     $a1, $zero, 0x2
    /* 64340 80074340 1000BF8F */  lw         $ra, 0x10($sp)
    /* 64344 80074344 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 64348 80074348 0800E003 */  jr         $ra
    /* 6434C 8007434C 00000000 */   nop
endlabel _GLOBAL__D_pSTextBoxCels
