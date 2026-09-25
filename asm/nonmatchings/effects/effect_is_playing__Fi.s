.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching effect_is_playing__Fi, 0x28

glabel effect_is_playing__Fi
    /* 2CF34 8003CF34 B410838F */  lw         $v1, %gp_rel(sghStream)($gp)
    /* 2CF38 8003CF38 00000000 */  nop
    /* 2CF3C 8003CF3C 05006010 */  beqz       $v1, .L8003CF54
    /* 2CF40 8003CF40 21100000 */   addu      $v0, $zero, $zero
    /* 2CF44 8003CF44 7000628C */  lw         $v0, 0x70($v1)
    /* 2CF48 8003CF48 00000000 */  nop
    /* 2CF4C 8003CF4C 26104400 */  xor        $v0, $v0, $a0
    /* 2CF50 8003CF50 0100422C */  sltiu      $v0, $v0, 0x1
  .L8003CF54:
    /* 2CF54 8003CF54 0800E003 */  jr         $ra
    /* 2CF58 8003CF58 00000000 */   nop
endlabel effect_is_playing__Fi
