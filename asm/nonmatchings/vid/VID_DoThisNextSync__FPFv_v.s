.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching VID_DoThisNextSync__FPFv_v, 0x58

glabel VID_DoThisNextSync__FPFv_v
    /* 74094 80084094 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 74098 80084098 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7409C 8008409C 21808000 */  addu       $s0, $a0, $zero
    /* 740A0 800840A0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 740A4 800840A4 A81E80AF */  sw         $zero, %gp_rel(D_8011C628)($gp)
  .L800840A8:
    /* 740A8 800840A8 3B10020C */  jal        VID_NextSyncRoutHasExecuted__Fv
    /* 740AC 800840AC 00000000 */   nop
    /* 740B0 800840B0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 740B4 800840B4 07004014 */  bnez       $v0, .L800840D4
    /* 740B8 800840B8 00000000 */   nop
    /* 740BC 800840BC A81E828F */  lw         $v0, %gp_rel(D_8011C628)($gp)
    /* 740C0 800840C0 00000000 */  nop
    /* 740C4 800840C4 01004224 */  addiu      $v0, $v0, 0x1
    /* 740C8 800840C8 A81E82AF */  sw         $v0, %gp_rel(D_8011C628)($gp)
    /* 740CC 800840CC 2A100208 */  j          .L800840A8
    /* 740D0 800840D0 00000000 */   nop
  .L800840D4:
    /* 740D4 800840D4 AC1E90AF */  sw         $s0, %gp_rel(D_8011C62C)($gp)
    /* 740D8 800840D8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 740DC 800840DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 740E0 800840E0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 740E4 800840E4 0800E003 */  jr         $ra
    /* 740E8 800840E8 00000000 */   nop
endlabel VID_DoThisNextSync__FPFv_v
