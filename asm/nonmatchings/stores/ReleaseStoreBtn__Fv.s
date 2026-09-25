.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReleaseStoreBtn__Fv, 0x14

glabel ReleaseStoreBtn__Fv
    /* 64314 80074314 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 64318 80074318 242182A3 */  sb         $v0, %gp_rel(D_8011C8A4)($gp)
    /* 6431C 8007431C 252182A3 */  sb         $v0, %gp_rel(D_8011C8A5)($gp)
    /* 64320 80074320 0800E003 */  jr         $ra
    /* 64324 80074324 00000000 */   nop
endlabel ReleaseStoreBtn__Fv
