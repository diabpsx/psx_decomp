.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Active__11SpellTarget, 0xC

glabel Active__11SpellTarget
    /* 57434 80067434 0400828C */  lw         $v0, 0x4($a0)
    /* 57438 80067438 0800E003 */  jr         $ra
    /* 5743C 8006743C 00000000 */   nop
endlabel Active__11SpellTarget
