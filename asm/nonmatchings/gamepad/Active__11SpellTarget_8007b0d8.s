.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Active__11SpellTarget_8007b0d8, 0xC

glabel Active__11SpellTarget_8007b0d8
    /* 6B0D8 8007B0D8 0400828C */  lw         $v0, 0x4($a0)
    /* 6B0DC 8007B0DC 0800E003 */  jr         $ra
    /* 6B0E0 8007B0E0 00000000 */   nop
endlabel Active__11SpellTarget_8007b0d8
