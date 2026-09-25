.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RestoreDemoKeys__FPi, 0x90

glabel RestoreDemoKeys__FPi
    /* 8C620 8009C620 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8C624 8009C624 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8C628 8009C628 21888000 */  addu       $s1, $a0, $zero
    /* 8C62C 8009C62C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8C630 8009C630 0D80103C */  lui        $s0, %hi(txt_actions)
    /* 8C634 8009C634 0CC41026 */  addiu      $s0, $s0, %lo(txt_actions)
    /* 8C638 8009C638 0B000424 */  addiu      $a0, $zero, 0xB
    /* 8C63C 8009C63C 21280000 */  addu       $a1, $zero, $zero
    /* 8C640 8009C640 21300002 */  addu       $a2, $s0, $zero
    /* 8C644 8009C644 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8C648 8009C648 53EB010C */  jal        PostGamePad__Fiiii
    /* 8C64C 8009C64C 21380000 */   addu      $a3, $zero, $zero
    /* 8C650 8009C650 21180000 */  addu       $v1, $zero, $zero
    /* 8C654 8009C654 6C001026 */  addiu      $s0, $s0, 0x6C
  .L8009C658:
    /* 8C658 8009C658 0000228E */  lw         $v0, 0x0($s1)
    /* 8C65C 8009C65C 04003126 */  addiu      $s1, $s1, 0x4
    /* 8C660 8009C660 01006324 */  addiu      $v1, $v1, 0x1
    /* 8C664 8009C664 F8FF02AE */  sw         $v0, -0x8($s0)
    /* 8C668 8009C668 0000228E */  lw         $v0, 0x0($s1)
    /* 8C66C 8009C66C 04003126 */  addiu      $s1, $s1, 0x4
    /* 8C670 8009C670 000002AE */  sw         $v0, 0x0($s0)
    /* 8C674 8009C674 04006228 */  slti       $v0, $v1, 0x4
    /* 8C678 8009C678 F7FF4014 */  bnez       $v0, .L8009C658
    /* 8C67C 8009C67C 10001026 */   addiu     $s0, $s0, 0x10
    /* 8C680 8009C680 09000424 */  addiu      $a0, $zero, 0x9
    /* 8C684 8009C684 21280000 */  addu       $a1, $zero, $zero
    /* 8C688 8009C688 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 8C68C 8009C68C 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 8C690 8009C690 53EB010C */  jal        PostGamePad__Fiiii
    /* 8C694 8009C694 21380000 */   addu      $a3, $zero, $zero
    /* 8C698 8009C698 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8C69C 8009C69C 1400B18F */  lw         $s1, 0x14($sp)
    /* 8C6A0 8009C6A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 8C6A4 8009C6A4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8C6A8 8009C6A8 0800E003 */  jr         $ra
    /* 8C6AC 8009C6AC 00000000 */   nop
endlabel RestoreDemoKeys__FPi
