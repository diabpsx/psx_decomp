.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawFRIG__Fv, 0x20

glabel DrawFRIG__Fv
    /* 6567C 8007567C E013828F */  lw         $v0, %gp_rel(D_8011BB60)($gp)
    /* 65680 80075680 00000000 */  nop
    /* 65684 80075684 03004014 */  bnez       $v0, .L80075694
    /* 65688 80075688 01000224 */   addiu     $v0, $zero, 0x1
    /* 6568C 8007568C E01382AF */  sw         $v0, %gp_rel(D_8011BB60)($gp)
    /* 65690 80075690 C81382AF */  sw         $v0, %gp_rel(FRIGFLAG)($gp)
  .L80075694:
    /* 65694 80075694 0800E003 */  jr         $ra
    /* 65698 80075698 00000000 */   nop
endlabel DrawFRIG__Fv
