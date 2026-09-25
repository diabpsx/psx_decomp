.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_Quick_Use_Mana__Fi, 0x28

glabel pad_func_Quick_Use_Mana__Fi
    /* 92A34 800A2A34 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 92A38 800A2A38 1000BFAF */  sw         $ra, 0x10($sp)
    /* 92A3C 800A2A3C 1280053C */  lui        $a1, %hi(gplayer + 0x4)
    /* 92A40 800A2A40 14B1A524 */  addiu      $a1, $a1, %lo(gplayer + 0x4)
    /* 92A44 800A2A44 E389020C */  jal        check_inv__FiPci
    /* 92A48 800A2A48 04000624 */   addiu     $a2, $zero, 0x4
    /* 92A4C 800A2A4C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 92A50 800A2A50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 92A54 800A2A54 0800E003 */  jr         $ra
    /* 92A58 800A2A58 00000000 */   nop
endlabel pad_func_Quick_Use_Mana__Fi
