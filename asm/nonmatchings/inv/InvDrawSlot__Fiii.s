.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InvDrawSlot__Fiii, 0x84

glabel InvDrawSlot__Fiii
    /* 1D684 8015727C 80008324 */  addiu      $v1, $a0, 0x80
    /* 1D688 80157280 7C1B828F */  lw         $v0, %gp_rel(D_8011C2FC)($gp)
    /* 1D68C 80157284 8C1B848F */  lw         $a0, %gp_rel(InvGfxTData)($gp)
    /* 1D690 80157288 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1D694 8015728C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1D698 80157290 B01B828F */  lw         $v0, %gp_rel(InvBackY)($gp)
    /* 1D69C 80157294 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1D6A0 80157298 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1D6A4 8015729C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 1D6A8 801572A0 2338A200 */  subu       $a3, $a1, $v0
    /* 1D6AC 801572A4 2128C000 */  addu       $a1, $a2, $zero
    /* 1D6B0 801572A8 21306000 */  addu       $a2, $v1, $zero
    /* 1D6B4 801572AC 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 1D6B8 801572B0 2000E724 */   addiu     $a3, $a3, 0x20
    /* 1D6BC 801572B4 07004390 */  lbu        $v1, 0x7($v0)
    /* 1D6C0 801572B8 00000000 */  nop
    /* 1D6C4 801572BC 02006334 */  ori        $v1, $v1, 0x2
    /* 1D6C8 801572C0 FE006330 */  andi       $v1, $v1, 0xFE
    /* 1D6CC 801572C4 070043A0 */  sb         $v1, 0x7($v0)
    /* 1D6D0 801572C8 1280033C */  lui        $v1, %hi(BORDERR)
    /* 1D6D4 801572CC F7AB6390 */  lbu        $v1, %lo(BORDERR)($v1)
    /* 1D6D8 801572D0 00000000 */  nop
    /* 1D6DC 801572D4 040043A0 */  sb         $v1, 0x4($v0)
    /* 1D6E0 801572D8 1280033C */  lui        $v1, %hi(BORDERG)
    /* 1D6E4 801572DC F8AB6390 */  lbu        $v1, %lo(BORDERG)($v1)
    /* 1D6E8 801572E0 00000000 */  nop
    /* 1D6EC 801572E4 050043A0 */  sb         $v1, 0x5($v0)
    /* 1D6F0 801572E8 1280033C */  lui        $v1, %hi(BORDERB)
    /* 1D6F4 801572EC F9AB6390 */  lbu        $v1, %lo(BORDERB)($v1)
    /* 1D6F8 801572F0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1D6FC 801572F4 060043A0 */  sb         $v1, 0x6($v0)
    /* 1D700 801572F8 0800E003 */  jr         $ra
    /* 1D704 801572FC 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel InvDrawSlot__Fiii
