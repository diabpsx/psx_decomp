.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initgp, 0x10

glabel initgp
    /* 1FFF4 8002FFF4 0B80013C */  lui        $at, %hi(D_800B7084)
    /* 1FFF8 8002FFF8 84703CAC */  sw         $gp, %lo(D_800B7084)($at)
    /* 1FFFC 8002FFFC 0800E003 */  jr         $ra
    /* 20000 80030000 00000000 */   nop
endlabel initgp
