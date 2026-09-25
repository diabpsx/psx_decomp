.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TermPrim, 0x18

glabel TermPrim
    /* 31E4 800131E4 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
    /* 31E8 800131E8 0000828C */  lw         $v0, 0x0($a0)
    /* 31EC 800131EC FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
    /* 31F0 800131F0 25104300 */  or         $v0, $v0, $v1
    /* 31F4 800131F4 0800E003 */  jr         $ra
    /* 31F8 800131F8 000082AC */   sw        $v0, 0x0($a0)
endlabel TermPrim
