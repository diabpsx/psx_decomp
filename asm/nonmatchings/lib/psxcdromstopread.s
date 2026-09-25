.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching psxcdromstopread, 0x28

glabel psxcdromstopread
    /* 1771C 8002771C D422828F */  lw         $v0, %gp_rel(asyncreadcallbackfunc)($gp)
    /* 17720 80027720 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 17724 80027724 1000BFAF */  sw         $ra, 0x10($sp)
    /* 17728 80027728 0C2380AF */  sw         $zero, %gp_rel(asyncsectors)($gp)
    /* 1772C 8002772C 09F84000 */  jalr       $v0
    /* 17730 80027730 21200000 */   addu      $a0, $zero, $zero
    /* 17734 80027734 1000BF8F */  lw         $ra, 0x10($sp)
    /* 17738 80027738 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1773C 8002773C 0800E003 */  jr         $ra
    /* 17740 80027740 00000000 */   nop
endlabel psxcdromstopread
