.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching putmemblock, 0x10

glabel putmemblock
    /* 1B710 8002B710 A022828F */  lw         $v0, %gp_rel(emptyblock)($gp)
    /* 1B714 8002B714 A02284AF */  sw         $a0, %gp_rel(emptyblock)($gp)
    /* 1B718 8002B718 0800E003 */  jr         $ra
    /* 1B71C 8002B71C 200082AC */   sw        $v0, 0x20($a0)
endlabel putmemblock
