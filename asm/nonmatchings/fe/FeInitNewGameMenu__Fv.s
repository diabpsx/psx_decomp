.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitNewGameMenu__Fv, 0x1C

glabel FeInitNewGameMenu__Fv
    /* 1028 8013AC20 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 102C 8013AC24 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1030 8013AC28 D2EC010C */  jal        LANG_GetLang__Fv
    /* 1034 8013AC2C 00000000 */   nop
    /* 1038 8013AC30 180C838F */  lw         $v1, %gp_rel(FeEnterLang)($gp)
    /* 103C 8013AC34 00000000 */  nop
    /* 1040 8013AC38 0B006210 */  beq        $v1, $v0, D_8013AC68
endlabel FeInitNewGameMenu__Fv
