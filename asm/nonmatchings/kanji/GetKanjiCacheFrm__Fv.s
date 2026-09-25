.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetKanjiCacheFrm__Fv, 0xC

glabel GetKanjiCacheFrm__Fv
    /* 9DC20 800ADC20 B01F828F */  lw         $v0, %gp_rel(D_8011C730)($gp)
    /* 9DC24 800ADC24 0800E003 */  jr         $ra
    /* 9DC28 800ADC28 00000000 */   nop
endlabel GetKanjiCacheFrm__Fv
