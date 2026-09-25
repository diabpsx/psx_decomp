.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching snd_init__FUl, 0x10

glabel snd_init__FUl
    /* 67E40 80077E40 01000224 */  addiu      $v0, $zero, 0x1
    /* 67E44 80077E44 191482A3 */  sb         $v0, %gp_rel(gbSndInited)($gp)
    /* 67E48 80077E48 0800E003 */  jr         $ra
    /* 67E4C 80077E4C 00000000 */   nop
endlabel snd_init__FUl
