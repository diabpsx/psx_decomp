.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching gettick, 0x10

glabel gettick
    /* 20020 80030020 1280023C */  lui        $v0, %hi(ticks)
    /* 20024 80030024 78C5428C */  lw         $v0, %lo(ticks)($v0)
    /* 20028 80030028 0800E003 */  jr         $ra
    /* 2002C 8003002C 00000000 */   nop
endlabel gettick
