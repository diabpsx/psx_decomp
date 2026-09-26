.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StorePads__Fv, 0xBC

glabel StorePads__Fv
    /* 229E4 8015C5DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 229E8 8015C5E0 0B000424 */  addiu      $a0, $zero, 0xB
    /* 229EC 8015C5E4 21280000 */  addu       $a1, $zero, $zero
    /* 229F0 8015C5E8 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 229F4 8015C5EC 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 229F8 8015C5F0 21380000 */  addu       $a3, $zero, $zero
    /* 229FC 8015C5F4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 22A00 8015C5F8 53EB010C */  jal        PostGamePad__Fiiii
    /* 22A04 8015C5FC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 22A08 8015C600 21800000 */  addu       $s0, $zero, $zero
  .L8015C604:
    /* 22A0C 8015C604 0D80013C */  lui        $at, %hi(txt_actions + 0x4)
    /* 22A10 8015C608 21083000 */  addu       $at, $at, $s0
    /* 22A14 8015C60C 10C4248C */  lw         $a0, %lo(txt_actions + 0x4)($at)
    /* 22A18 8015C610 BB6E050C */  jal        ISave__Fi
    /* 22A1C 8015C614 00000000 */   nop
    /* 22A20 8015C618 0D80013C */  lui        $at, %hi(txt_actions + 0xC)
    /* 22A24 8015C61C 21083000 */  addu       $at, $at, $s0
    /* 22A28 8015C620 18C4248C */  lw         $a0, %lo(txt_actions + 0xC)($at)
    /* 22A2C 8015C624 BB6E050C */  jal        ISave__Fi
    /* 22A30 8015C628 10001026 */   addiu     $s0, $s0, 0x10
    /* 22A34 8015C62C 4001022A */  slti       $v0, $s0, 0x140
    /* 22A38 8015C630 F4FF4014 */  bnez       $v0, .L8015C604
    /* 22A3C 8015C634 0B000424 */   addiu     $a0, $zero, 0xB
    /* 22A40 8015C638 01000524 */  addiu      $a1, $zero, 0x1
    /* 22A44 8015C63C 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 22A48 8015C640 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 22A4C 8015C644 53EB010C */  jal        PostGamePad__Fiiii
    /* 22A50 8015C648 21380000 */   addu      $a3, $zero, $zero
    /* 22A54 8015C64C 21800000 */  addu       $s0, $zero, $zero
  .L8015C650:
    /* 22A58 8015C650 0D80013C */  lui        $at, %hi(txt_actions + 0x4)
    /* 22A5C 8015C654 21083000 */  addu       $at, $at, $s0
    /* 22A60 8015C658 10C4248C */  lw         $a0, %lo(txt_actions + 0x4)($at)
    /* 22A64 8015C65C BB6E050C */  jal        ISave__Fi
    /* 22A68 8015C660 00000000 */   nop
    /* 22A6C 8015C664 0D80013C */  lui        $at, %hi(txt_actions + 0xC)
    /* 22A70 8015C668 21083000 */  addu       $at, $at, $s0
    /* 22A74 8015C66C 18C4248C */  lw         $a0, %lo(txt_actions + 0xC)($at)
    /* 22A78 8015C670 BB6E050C */  jal        ISave__Fi
    /* 22A7C 8015C674 10001026 */   addiu     $s0, $s0, 0x10
    /* 22A80 8015C678 4001022A */  slti       $v0, $s0, 0x140
    /* 22A84 8015C67C F4FF4014 */  bnez       $v0, .L8015C650
    /* 22A88 8015C680 00000000 */   nop
    /* 22A8C 8015C684 1400BF8F */  lw         $ra, 0x14($sp)
    /* 22A90 8015C688 1000B08F */  lw         $s0, 0x10($sp)
    /* 22A94 8015C68C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22A98 8015C690 0800E003 */  jr         $ra
    /* 22A9C 8015C694 00000000 */   nop
endlabel StorePads__Fv
