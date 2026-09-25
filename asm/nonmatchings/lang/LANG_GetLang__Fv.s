.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LANG_GetLang__Fv, 0xC

glabel LANG_GetLang__Fv
    /* 6B348 8007B348 6C14828F */  lw         $v0, %gp_rel(LanguageType)($gp)
    /* 6B34C 8007B34C 0800E003 */  jr         $ra
    /* 6B350 8007B350 00000000 */   nop
endlabel LANG_GetLang__Fv
