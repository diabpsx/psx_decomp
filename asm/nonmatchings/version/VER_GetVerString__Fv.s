.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VER_GetVerString__Fv, 0x10

glabel VER_GetVerString__Fv
    /* 726E4 800826E4 0E80023C */  lui        $v0, %hi(MyVerString)
    /* 726E8 800826E8 1C3C4224 */  addiu      $v0, $v0, %lo(MyVerString)
    /* 726EC 800826EC 0800E003 */  jr         $ra
    /* 726F0 800826F0 00000000 */   nop
endlabel VER_GetVerString__Fv
