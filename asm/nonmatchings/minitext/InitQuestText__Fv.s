.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitQuestText__Fv, 0xC

glabel InitQuestText__Fv
    /* 3D964 8004D964 E01180A3 */  sb         $zero, %gp_rel(qtextflag)($gp)
    /* 3D968 8004D968 0800E003 */  jr         $ra
    /* 3D96C 8004D96C 00000000 */   nop
endlabel InitQuestText__Fv
