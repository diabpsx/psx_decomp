.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_DEACTIVATEPORTAL__FPC4TCmdi, 0x60

glabel On_DEACTIVATEPORTAL__FPC4TCmdi
    /* 421B0 800521B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 421B4 800521B4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 421B8 800521B8 21800000 */  addu       $s0, $zero, $zero
    /* 421BC 800521BC 1400BFAF */  sw         $ra, 0x14($sp)
  .L800521C0:
    /* 421C0 800521C0 7A04020C */  jal        PortalOnLevel__Fi
    /* 421C4 800521C4 21200002 */   addu      $a0, $s0, $zero
    /* 421C8 800521C8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 421CC 800521CC 03004010 */  beqz       $v0, .L800521DC
    /* 421D0 800521D0 00000000 */   nop
    /* 421D4 800521D4 A004020C */  jal        RemovePortalMissile__Fi
    /* 421D8 800521D8 21200002 */   addu      $a0, $s0, $zero
  .L800521DC:
    /* 421DC 800521DC 7204020C */  jal        DeactivatePortal__Fi
    /* 421E0 800521E0 21200002 */   addu      $a0, $s0, $zero
    /* 421E4 800521E4 CB3F010C */  jal        delta_close_portal__Fi
    /* 421E8 800521E8 21200002 */   addu      $a0, $s0, $zero
    /* 421EC 800521EC 01001026 */  addiu      $s0, $s0, 0x1
    /* 421F0 800521F0 0200022A */  slti       $v0, $s0, 0x2
    /* 421F4 800521F4 F2FF4014 */  bnez       $v0, .L800521C0
    /* 421F8 800521F8 00000000 */   nop
    /* 421FC 800521FC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 42200 80052200 1000B08F */  lw         $s0, 0x10($sp)
    /* 42204 80052204 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42208 80052208 0800E003 */  jr         $ra
    /* 4220C 8005220C 00000000 */   nop
endlabel On_DEACTIVATEPORTAL__FPC4TCmdi
