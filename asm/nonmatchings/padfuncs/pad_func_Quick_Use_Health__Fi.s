.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_Quick_Use_Health__Fi, 0x28

glabel pad_func_Quick_Use_Health__Fi
    /* 92A0C 800A2A0C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 92A10 800A2A10 1000BFAF */  sw         $ra, 0x10($sp)
    /* 92A14 800A2A14 1280053C */  lui        $a1, %hi(gplayer + 0x8)
    /* 92A18 800A2A18 18B1A524 */  addiu      $a1, $a1, %lo(gplayer + 0x8)
    /* 92A1C 800A2A1C E389020C */  jal        check_inv__FiPci
    /* 92A20 800A2A20 05000624 */   addiu     $a2, $zero, 0x5
    /* 92A24 800A2A24 1000BF8F */  lw         $ra, 0x10($sp)
    /* 92A28 800A2A28 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 92A2C 800A2A2C 0800E003 */  jr         $ra
    /* 92A30 800A2A30 00000000 */   nop
endlabel pad_func_Quick_Use_Health__Fi
