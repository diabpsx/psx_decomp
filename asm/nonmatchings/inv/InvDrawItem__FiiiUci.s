.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InvDrawItem__FiiiUci, 0xD0

glabel InvDrawItem__FiiiUci
    /* 1D9C0 801575B8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1D9C4 801575BC 21188000 */  addu       $v1, $a0, $zero
    /* 1D9C8 801575C0 2000B0AF */  sw         $s0, 0x20($sp)
    /* 1D9CC 801575C4 2180E000 */  addu       $s0, $a3, $zero
    /* 1D9D0 801575C8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 1D9D4 801575CC 4000B18F */  lw         $s1, 0x40($sp)
    /* 1D9D8 801575D0 3200C228 */  slti       $v0, $a2, 0x32
    /* 1D9DC 801575D4 04004010 */  beqz       $v0, .L801575E8
    /* 1D9E0 801575D8 2800BFAF */   sw        $ra, 0x28($sp)
    /* 1D9E4 801575DC 881B848F */  lw         $a0, %gp_rel(InvPanelTData)($gp)
    /* 1D9E8 801575E0 7B5D0508 */  j          .L801575EC
    /* 1D9EC 801575E4 00000000 */   nop
  .L801575E8:
    /* 1D9F0 801575E8 8C1B848F */  lw         $a0, %gp_rel(InvGfxTData)($gp)
  .L801575EC:
    /* 1D9F4 801575EC 841B828F */  lw         $v0, %gp_rel(D_8011C304)($gp)
    /* 1D9F8 801575F0 B01B878F */  lw         $a3, %gp_rel(InvBackY)($gp)
    /* 1D9FC 801575F4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1DA00 801575F8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 1DA04 801575FC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1DA08 80157600 80100600 */  sll        $v0, $a2, 2
    /* 1DA0C 80157604 2338A700 */  subu       $a3, $a1, $a3
    /* 1DA10 80157608 80006624 */  addiu      $a2, $v1, 0x80
    /* 1DA14 8015760C 1180013C */  lui        $at, %hi(InvGfxTable)
    /* 1DA18 80157610 21082200 */  addu       $at, $at, $v0
    /* 1DA1C 80157614 78D2258C */  lw         $a1, %lo(InvGfxTable)($at)
    /* 1DA20 80157618 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 1DA24 8015761C 2000E724 */   addiu     $a3, $a3, 0x20
    /* 1DA28 80157620 21184000 */  addu       $v1, $v0, $zero
    /* 1DA2C 80157624 07006490 */  lbu        $a0, 0x7($v1)
    /* 1DA30 80157628 00000000 */  nop
    /* 1DA34 8015762C FE008230 */  andi       $v0, $a0, 0xFE
    /* 1DA38 80157630 03002012 */  beqz       $s1, .L80157640
    /* 1DA3C 80157634 070062A0 */   sb        $v0, 0x7($v1)
    /* 1DA40 80157638 915D0508 */  j          .L80157644
    /* 1DA44 8015763C 02004234 */   ori       $v0, $v0, 0x2
  .L80157640:
    /* 1DA48 80157640 FC008230 */  andi       $v0, $a0, 0xFC
  .L80157644:
    /* 1DA4C 80157644 070062A0 */  sb         $v0, 0x7($v1)
    /* 1DA50 80157648 FF000232 */  andi       $v0, $s0, 0xFF
    /* 1DA54 8015764C 05004010 */  beqz       $v0, .L80157664
    /* 1DA58 80157650 80000224 */   addiu     $v0, $zero, 0x80
    /* 1DA5C 80157654 040062A0 */  sb         $v0, 0x4($v1)
    /* 1DA60 80157658 050062A0 */  sb         $v0, 0x5($v1)
    /* 1DA64 8015765C 9C5D0508 */  j          .L80157670
    /* 1DA68 80157660 060062A0 */   sb        $v0, 0x6($v1)
  .L80157664:
    /* 1DA6C 80157664 040062A0 */  sb         $v0, 0x4($v1)
    /* 1DA70 80157668 050060A0 */  sb         $zero, 0x5($v1)
    /* 1DA74 8015766C 060060A0 */  sb         $zero, 0x6($v1)
  .L80157670:
    /* 1DA78 80157670 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1DA7C 80157674 2400B18F */  lw         $s1, 0x24($sp)
    /* 1DA80 80157678 2000B08F */  lw         $s0, 0x20($sp)
    /* 1DA84 8015767C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1DA88 80157680 0800E003 */  jr         $ra
    /* 1DA8C 80157684 00000000 */   nop
endlabel InvDrawItem__FiiiUci
