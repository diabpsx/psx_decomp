.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013B230, 0x18

glabel func_8013B230
    /* 1638 8013B230 1480023C */  lui        $v0, %hi(D_80139DF0)
    /* 163C 8013B234 F09D428C */  lw         $v0, %lo(D_80139DF0)($v0)
    /* 1640 8013B238 00000000 */  nop
    /* 1644 8013B23C 0000428C */  lw         $v0, 0x0($v0)
    /* 1648 8013B240 0800E003 */  jr         $ra
    /* 164C 8013B244 00000000 */   nop
endlabel func_8013B230
