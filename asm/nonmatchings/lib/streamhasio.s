.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamhasio, 0xC

glabel streamhasio
    /* 190FC 800290FC DC1C828F */  lw         $v0, %gp_rel(streamhasioflag)($gp)
    /* 19100 80029100 0800E003 */  jr         $ra
    /* 19104 80029104 00000000 */   nop
endlabel streamhasio
