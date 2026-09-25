.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getlocksemaphore, 0x14

glabel getlocksemaphore
    /* 1F78C 8002F78C 942280AF */  sw         $zero, %gp_rel(D_8011CA14)($gp)
    /* 1F790 8002F790 1280023C */  lui        $v0, %hi(D_8011CA14)
    /* 1F794 8002F794 14CA4224 */  addiu      $v0, $v0, %lo(D_8011CA14)
    /* 1F798 8002F798 0800E003 */  jr         $ra
    /* 1F79C 8002F79C 00000000 */   nop
endlabel getlocksemaphore
