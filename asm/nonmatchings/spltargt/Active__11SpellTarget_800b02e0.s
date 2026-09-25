.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Active__11SpellTarget_800b02e0, 0xC

glabel Active__11SpellTarget_800b02e0
    /* A02E0 800B02E0 0400828C */  lw         $v0, 0x4($a0)
    /* A02E4 800B02E4 0800E003 */  jr         $ra
    /* A02E8 800B02E8 00000000 */   nop
endlabel Active__11SpellTarget_800b02e0
