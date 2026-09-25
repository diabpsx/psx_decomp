.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setdirectorycache, 0x10

glabel setdirectorycache
    /* 17DD4 80027DD4 6C1C85AF */  sw         $a1, %gp_rel(cachefiles)($gp)
    /* 17DD8 80027DD8 342384AF */  sw         $a0, %gp_rel(cachefile)($gp)
    /* 17DDC 80027DDC 0800E003 */  jr         $ra
    /* 17DE0 80027DE0 00000000 */   nop
endlabel setdirectorycache
