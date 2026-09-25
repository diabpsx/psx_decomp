.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asynctopupoverride, 0x20

glabel asynctopupoverride
    /* 143B4 800243B4 301C828F */  lw         $v0, %gp_rel(D_8011C3B0)($gp)
    /* 143B8 800243B8 00000000 */  nop
    /* 143BC 800243BC 2A104400 */  slt        $v0, $v0, $a0
    /* 143C0 800243C0 02004010 */  beqz       $v0, .L800243CC
    /* 143C4 800243C4 00000000 */   nop
    /* 143C8 800243C8 301C84AF */  sw         $a0, %gp_rel(D_8011C3B0)($gp)
  .L800243CC:
    /* 143CC 800243CC 0800E003 */  jr         $ra
    /* 143D0 800243D0 00000000 */   nop
endlabel asynctopupoverride
