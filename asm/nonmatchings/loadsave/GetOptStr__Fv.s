.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOptStr__Fv, 0x10

glabel GetOptStr__Fv
    /* 21D60 8015B958 0E80023C */  lui        $v0, %hi(D_800E3CB4)
    /* 21D64 8015B95C B43C4224 */  addiu      $v0, $v0, %lo(D_800E3CB4)
    /* 21D68 8015B960 0800E003 */  jr         $ra
    /* 21D6C 8015B964 00000000 */   nop
endlabel GetOptStr__Fv
