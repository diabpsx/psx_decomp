.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSpellTrans__Fc, 0xC

glabel SetSpellTrans__Fc
    /* 20D38 80030D38 D80E84A3 */  sb         $a0, %gp_rel(SpellCol)($gp)
    /* 20D3C 80030D3C 0800E003 */  jr         $ra
    /* 20D40 80030D40 00000000 */   nop
endlabel SetSpellTrans__Fc
