.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InvDrawSlots__Fv, 0x64

glabel InvDrawSlots__Fv
    /* 1DA90 80157688 901B828F */  lw         $v0, %gp_rel(CursGlow)($gp)
    /* 1DA94 8015768C 941B838F */  lw         $v1, %gp_rel(CursGlowDx)($gp)
    /* 1DA98 80157690 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1DA9C 80157694 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1DAA0 80157698 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1DAA4 8015769C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1DAA8 801576A0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1DAAC 801576A4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1DAB0 801576A8 21104300 */  addu       $v0, $v0, $v1
    /* 1DAB4 801576AC 901B82AF */  sw         $v0, %gp_rel(CursGlow)($gp)
    /* 1DAB8 801576B0 03004018 */  blez       $v0, .L801576C0
    /* 1DABC 801576B4 F8FF0224 */   addiu     $v0, $zero, -0x8
    /* 1DAC0 801576B8 901B80AF */  sw         $zero, %gp_rel(CursGlow)($gp)
    /* 1DAC4 801576BC 941B82AF */  sw         $v0, %gp_rel(CursGlowDx)($gp)
  .L801576C0:
    /* 1DAC8 801576C0 901B828F */  lw         $v0, %gp_rel(CursGlow)($gp)
    /* 1DACC 801576C4 00000000 */  nop
    /* 1DAD0 801576C8 81FF4228 */  slti       $v0, $v0, -0x7F
    /* 1DAD4 801576CC 04004010 */  beqz       $v0, .L801576E0
    /* 1DAD8 801576D0 81FF0224 */   addiu     $v0, $zero, -0x7F
    /* 1DADC 801576D4 901B82AF */  sw         $v0, %gp_rel(CursGlow)($gp)
    /* 1DAE0 801576D8 08000224 */  addiu      $v0, $zero, 0x8
    /* 1DAE4 801576DC 941B82AF */  sw         $v0, %gp_rel(CursGlowDx)($gp)
  .L801576E0:
    /* 1DAE8 801576E0 5C000624 */  addiu      $a2, $zero, 0x5C
    /* 1DAEC 801576E4 C8001224 */  addiu      $s2, $zero, 0xC8
    /* 1DAF0 801576E8 19001324 */  addiu      $s3, $zero, 0x19
endlabel InvDrawSlots__Fv
