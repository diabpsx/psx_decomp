.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrimDrawSycnCallBack, 0x20

glabel PrimDrawSycnCallBack
    /* 73DE0 80083DE0 981E828F */  lw         $v0, %gp_rel(D_8011C618)($gp)
    /* 73DE4 80083DE4 00000000 */  nop
    /* 73DE8 80083DE8 03004010 */  beqz       $v0, .L80083DF8
    /* 73DEC 80083DEC 00000000 */   nop
    /* 73DF0 80083DF0 0C0040A0 */  sb         $zero, 0xC($v0)
    /* 73DF4 80083DF4 981E80AF */  sw         $zero, %gp_rel(D_8011C618)($gp)
  .L80083DF8:
    /* 73DF8 80083DF8 0800E003 */  jr         $ra
    /* 73DFC 80083DFC 00000000 */   nop
endlabel PrimDrawSycnCallBack
