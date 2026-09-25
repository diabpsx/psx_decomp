.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetControlKey__FiPb, 0xA8

glabel GetControlKey__FiPb
    /* 9E648 800AE648 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9E64C 800AE64C 21408000 */  addu       $t0, $a0, $zero
    /* 9E650 800AE650 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 9E654 800AE654 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 9E658 800AE658 21380000 */  addu       $a3, $zero, $zero
    /* 9E65C 800AE65C 0C00C324 */  addiu      $v1, $a2, 0xC
    /* 9E660 800AE660 1000BFAF */  sw         $ra, 0x10($sp)
    /* 9E664 800AE664 0000A0AC */  sw         $zero, 0x0($a1)
  .L800AE668:
    /* 9E668 800AE668 0000C28C */  lw         $v0, 0x0($a2)
    /* 9E66C 800AE66C 00000000 */  nop
    /* 9E670 800AE670 15004814 */  bne        $v0, $t0, .L800AE6C8
    /* 9E674 800AE674 00000000 */   nop
    /* 9E678 800AE678 F8FF648C */  lw         $a0, -0x8($v1)
    /* 9E67C 800AE67C 00000000 */  nop
    /* 9E680 800AE680 07008014 */  bnez       $a0, .L800AE6A0
    /* 9E684 800AE684 00000000 */   nop
    /* 9E688 800AE688 0000628C */  lw         $v0, 0x0($v1)
    /* 9E68C 800AE68C 00000000 */  nop
    /* 9E690 800AE690 0D004010 */  beqz       $v0, .L800AE6C8
    /* 9E694 800AE694 01000224 */   addiu     $v0, $zero, 0x1
    /* 9E698 800AE698 0000A2AC */  sw         $v0, 0x0($a1)
    /* 9E69C 800AE69C 0000648C */  lw         $a0, 0x0($v1)
  .L800AE6A0:
    /* 9E6A0 800AE6A0 CA71020C */  jal        get_key_pad__Fi
    /* 9E6A4 800AE6A4 00000000 */   nop
    /* 9E6A8 800AE6A8 40180200 */  sll        $v1, $v0, 1
    /* 9E6AC 800AE6AC 21186200 */  addu       $v1, $v1, $v0
    /* 9E6B0 800AE6B0 80180300 */  sll        $v1, $v1, 2
    /* 9E6B4 800AE6B4 0D80013C */  lui        $at, %hi(pad_txt + 0x8)
    /* 9E6B8 800AE6B8 21082300 */  addu       $at, $at, $v1
    /* 9E6BC 800AE6BC 6CC32280 */  lb         $v0, %lo(pad_txt + 0x8)($at)
    /* 9E6C0 800AE6C0 B8B90208 */  j          .L800AE6E0
    /* 9E6C4 800AE6C4 00000000 */   nop
  .L800AE6C8:
    /* 9E6C8 800AE6C8 10006324 */  addiu      $v1, $v1, 0x10
    /* 9E6CC 800AE6CC 0100E724 */  addiu      $a3, $a3, 0x1
    /* 9E6D0 800AE6D0 1400E228 */  slti       $v0, $a3, 0x14
    /* 9E6D4 800AE6D4 E4FF4014 */  bnez       $v0, .L800AE668
    /* 9E6D8 800AE6D8 1000C624 */   addiu     $a2, $a2, 0x10
    /* 9E6DC 800AE6DC 21100000 */  addu       $v0, $zero, $zero
  .L800AE6E0:
    /* 9E6E0 800AE6E0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9E6E4 800AE6E4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9E6E8 800AE6E8 0800E003 */  jr         $ra
    /* 9E6EC 800AE6EC 00000000 */   nop
endlabel GetControlKey__FiPb
