.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HappyMan__Fi, 0x10

glabel HappyMan__Fi
    /* 67FEC 80077FEC 40200400 */  sll        $a0, $a0, 1
    /* 67FF0 80077FF0 481484AF */  sw         $a0, %gp_rel(D_8011BBC8)($gp)
    /* 67FF4 80077FF4 0800E003 */  jr         $ra
    /* 67FF8 80077FF8 00000000 */   nop
endlabel HappyMan__Fi
