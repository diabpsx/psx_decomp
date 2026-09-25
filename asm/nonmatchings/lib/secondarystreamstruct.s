.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching secondarystreamstruct, 0xAC

glabel secondarystreamstruct
    /* 1D79C 8002D79C 60FFE224 */  addiu      $v0, $a3, -0xA0
    /* 1D7A0 8002D7A0 3C0082AC */  sw         $v0, 0x3C($a0)
    /* 1D7A4 8002D7A4 A0008224 */  addiu      $v0, $a0, 0xA0
    /* 1D7A8 8002D7A8 21388700 */  addu       $a3, $a0, $a3
    /* 1D7AC 8002D7AC 040082AC */  sw         $v0, 0x4($a0)
    /* 1D7B0 8002D7B0 080087AC */  sw         $a3, 0x8($a0)
    /* 1D7B4 8002D7B4 0400828C */  lw         $v0, 0x4($a0)
    /* 1D7B8 8002D7B8 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1D7BC 8002D7BC 180082AC */  sw         $v0, 0x18($a0)
    /* 1D7C0 8002D7C0 1800828C */  lw         $v0, 0x18($a0)
    /* 1D7C4 8002D7C4 00000000 */  nop
    /* 1D7C8 8002D7C8 140082AC */  sw         $v0, 0x14($a0)
    /* 1D7CC 8002D7CC 1400828C */  lw         $v0, 0x14($a0)
    /* 1D7D0 8002D7D0 00000000 */  nop
    /* 1D7D4 8002D7D4 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1D7D8 8002D7D8 0C00828C */  lw         $v0, 0xC($a0)
    /* 1D7DC 8002D7DC 00000000 */  nop
    /* 1D7E0 8002D7E0 100082AC */  sw         $v0, 0x10($a0)
    /* 1D7E4 8002D7E4 940080AC */  sw         $zero, 0x94($a0)
    /* 1D7E8 8002D7E8 9400828C */  lw         $v0, 0x94($a0)
    /* 1D7EC 8002D7EC 00000000 */  nop
    /* 1D7F0 8002D7F0 900082AC */  sw         $v0, 0x90($a0)
    /* 1D7F4 8002D7F4 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D7F8 8002D7F8 280080AC */  sw         $zero, 0x28($a0)
    /* 1D7FC 8002D7FC 400080AC */  sw         $zero, 0x40($a0)
    /* 1D800 8002D800 5C0080AC */  sw         $zero, 0x5C($a0)
    /* 1D804 8002D804 540082AC */  sw         $v0, 0x54($a0)
    /* 1D808 8002D808 6C0086AC */  sw         $a2, 0x6C($a0)
    /* 1D80C 8002D80C 680085AC */  sw         $a1, 0x68($a0)
    /* 1D810 8002D810 7000628C */  lw         $v0, 0x70($v1)
    /* 1D814 8002D814 00000000 */  nop
    /* 1D818 8002D818 07004010 */  beqz       $v0, .L8002D838
    /* 1D81C 8002D81C 21108000 */   addu      $v0, $a0, $zero
  .L8002D820:
    /* 1D820 8002D820 7000638C */  lw         $v1, 0x70($v1)
    /* 1D824 8002D824 00000000 */  nop
    /* 1D828 8002D828 7000628C */  lw         $v0, 0x70($v1)
    /* 1D82C 8002D82C 00000000 */  nop
    /* 1D830 8002D830 FBFF4014 */  bnez       $v0, .L8002D820
    /* 1D834 8002D834 21108000 */   addu      $v0, $a0, $zero
  .L8002D838:
    /* 1D838 8002D838 700064AC */  sw         $a0, 0x70($v1)
    /* 1D83C 8002D83C 700080AC */  sw         $zero, 0x70($a0)
    /* 1D840 8002D840 0800E003 */  jr         $ra
    /* 1D844 8002D844 00000000 */   nop
endlabel secondarystreamstruct
