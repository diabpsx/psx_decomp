.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDemoKeys__FPi, 0xD8

glabel SetDemoKeys__FPi
    /* 8C548 8009C548 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8C54C 8009C54C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8C550 8009C550 21888000 */  addu       $s1, $a0, $zero
    /* 8C554 8009C554 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8C558 8009C558 0D80103C */  lui        $s0, %hi(txt_actions)
    /* 8C55C 8009C55C 0CC41026 */  addiu      $s0, $s0, %lo(txt_actions)
    /* 8C560 8009C560 0B000424 */  addiu      $a0, $zero, 0xB
    /* 8C564 8009C564 21280000 */  addu       $a1, $zero, $zero
    /* 8C568 8009C568 21300002 */  addu       $a2, $s0, $zero
    /* 8C56C 8009C56C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8C570 8009C570 53EB010C */  jal        PostGamePad__Fiiii
    /* 8C574 8009C574 21380000 */   addu      $a3, $zero, $zero
    /* 8C578 8009C578 60001026 */  addiu      $s0, $s0, 0x60
    /* 8C57C 8009C57C 21200000 */  addu       $a0, $zero, $zero
    /* 8C580 8009C580 0C000326 */  addiu      $v1, $s0, 0xC
  .L8009C584:
    /* 8C584 8009C584 10001026 */  addiu      $s0, $s0, 0x10
    /* 8C588 8009C588 F8FF628C */  lw         $v0, -0x8($v1)
    /* 8C58C 8009C58C 01008424 */  addiu      $a0, $a0, 0x1
    /* 8C590 8009C590 000022AE */  sw         $v0, 0x0($s1)
    /* 8C594 8009C594 04003126 */  addiu      $s1, $s1, 0x4
    /* 8C598 8009C598 0000628C */  lw         $v0, 0x0($v1)
    /* 8C59C 8009C59C 10006324 */  addiu      $v1, $v1, 0x10
    /* 8C5A0 8009C5A0 000022AE */  sw         $v0, 0x0($s1)
    /* 8C5A4 8009C5A4 04008228 */  slti       $v0, $a0, 0x4
    /* 8C5A8 8009C5A8 F6FF4014 */  bnez       $v0, .L8009C584
    /* 8C5AC 8009C5AC 04003126 */   addiu     $s1, $s1, 0x4
    /* 8C5B0 8009C5B0 C0FF1026 */  addiu      $s0, $s0, -0x40
    /* 8C5B4 8009C5B4 40000224 */  addiu      $v0, $zero, 0x40
    /* 8C5B8 8009C5B8 040002AE */  sw         $v0, 0x4($s0)
    /* 8C5BC 8009C5BC 0C0000AE */  sw         $zero, 0xC($s0)
    /* 8C5C0 8009C5C0 10001026 */  addiu      $s0, $s0, 0x10
    /* 8C5C4 8009C5C4 80000224 */  addiu      $v0, $zero, 0x80
    /* 8C5C8 8009C5C8 040002AE */  sw         $v0, 0x4($s0)
    /* 8C5CC 8009C5CC 0C0000AE */  sw         $zero, 0xC($s0)
    /* 8C5D0 8009C5D0 10001026 */  addiu      $s0, $s0, 0x10
    /* 8C5D4 8009C5D4 00020224 */  addiu      $v0, $zero, 0x200
    /* 8C5D8 8009C5D8 040002AE */  sw         $v0, 0x4($s0)
    /* 8C5DC 8009C5DC 0C0000AE */  sw         $zero, 0xC($s0)
    /* 8C5E0 8009C5E0 10001026 */  addiu      $s0, $s0, 0x10
    /* 8C5E4 8009C5E4 09000424 */  addiu      $a0, $zero, 0x9
    /* 8C5E8 8009C5E8 21280000 */  addu       $a1, $zero, $zero
    /* 8C5EC 8009C5EC 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 8C5F0 8009C5F0 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 8C5F4 8009C5F4 21380000 */  addu       $a3, $zero, $zero
    /* 8C5F8 8009C5F8 00010224 */  addiu      $v0, $zero, 0x100
    /* 8C5FC 8009C5FC 040002AE */  sw         $v0, 0x4($s0)
    /* 8C600 8009C600 53EB010C */  jal        PostGamePad__Fiiii
    /* 8C604 8009C604 0C0000AE */   sw        $zero, 0xC($s0)
    /* 8C608 8009C608 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8C60C 8009C60C 1400B18F */  lw         $s1, 0x14($sp)
    /* 8C610 8009C610 1000B08F */  lw         $s0, 0x10($sp)
    /* 8C614 8009C614 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8C618 8009C618 0800E003 */  jr         $ra
    /* 8C61C 8009C61C 00000000 */   nop
endlabel SetDemoKeys__FPi
