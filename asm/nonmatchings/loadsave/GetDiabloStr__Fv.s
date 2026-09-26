.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDiabloStr__Fv, 0x10

glabel GetDiabloStr__Fv
    /* 21D70 8015B968 0E80023C */  lui        $v0, %hi(D_800E3C94)
    /* 21D74 8015B96C 943C4224 */  addiu      $v0, $v0, %lo(D_800E3C94)
    /* 21D78 8015B970 0800E003 */  jr         $ra
    /* 21D7C 8015B974 00000000 */   nop
endlabel GetDiabloStr__Fv
