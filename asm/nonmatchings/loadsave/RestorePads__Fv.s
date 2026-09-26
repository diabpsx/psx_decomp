.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RestorePads__Fv, 0xC0

glabel RestorePads__Fv
    /* 22924 8015C51C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22928 8015C520 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2292C 8015C524 21800000 */  addu       $s0, $zero, $zero
    /* 22930 8015C528 1400BFAF */  sw         $ra, 0x14($sp)
  .L8015C52C:
    /* 22934 8015C52C 656E050C */  jal        ILoad__Fv
    /* 22938 8015C530 00000000 */   nop
    /* 2293C 8015C534 0D80013C */  lui        $at, %hi(txt_actions + 0x4)
    /* 22940 8015C538 21083000 */  addu       $at, $at, $s0
    /* 22944 8015C53C 10C422AC */  sw         $v0, %lo(txt_actions + 0x4)($at)
    /* 22948 8015C540 656E050C */  jal        ILoad__Fv
    /* 2294C 8015C544 00000000 */   nop
    /* 22950 8015C548 0D80013C */  lui        $at, %hi(txt_actions + 0xC)
    /* 22954 8015C54C 21083000 */  addu       $at, $at, $s0
    /* 22958 8015C550 18C422AC */  sw         $v0, %lo(txt_actions + 0xC)($at)
    /* 2295C 8015C554 10001026 */  addiu      $s0, $s0, 0x10
    /* 22960 8015C558 4001022A */  slti       $v0, $s0, 0x140
    /* 22964 8015C55C F3FF4014 */  bnez       $v0, .L8015C52C
    /* 22968 8015C560 09000424 */   addiu     $a0, $zero, 0x9
    /* 2296C 8015C564 21280000 */  addu       $a1, $zero, $zero
    /* 22970 8015C568 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 22974 8015C56C 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 22978 8015C570 53EB010C */  jal        PostGamePad__Fiiii
    /* 2297C 8015C574 21380000 */   addu      $a3, $zero, $zero
    /* 22980 8015C578 21800000 */  addu       $s0, $zero, $zero
  .L8015C57C:
    /* 22984 8015C57C 656E050C */  jal        ILoad__Fv
    /* 22988 8015C580 00000000 */   nop
    /* 2298C 8015C584 0D80013C */  lui        $at, %hi(txt_actions + 0x4)
    /* 22990 8015C588 21083000 */  addu       $at, $at, $s0
    /* 22994 8015C58C 10C422AC */  sw         $v0, %lo(txt_actions + 0x4)($at)
    /* 22998 8015C590 656E050C */  jal        ILoad__Fv
    /* 2299C 8015C594 00000000 */   nop
    /* 229A0 8015C598 0D80013C */  lui        $at, %hi(txt_actions + 0xC)
    /* 229A4 8015C59C 21083000 */  addu       $at, $at, $s0
    /* 229A8 8015C5A0 18C422AC */  sw         $v0, %lo(txt_actions + 0xC)($at)
    /* 229AC 8015C5A4 10001026 */  addiu      $s0, $s0, 0x10
    /* 229B0 8015C5A8 4001022A */  slti       $v0, $s0, 0x140
    /* 229B4 8015C5AC F3FF4014 */  bnez       $v0, .L8015C57C
    /* 229B8 8015C5B0 09000424 */   addiu     $a0, $zero, 0x9
    /* 229BC 8015C5B4 01000524 */  addiu      $a1, $zero, 0x1
    /* 229C0 8015C5B8 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 229C4 8015C5BC 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 229C8 8015C5C0 53EB010C */  jal        PostGamePad__Fiiii
    /* 229CC 8015C5C4 21380000 */   addu      $a3, $zero, $zero
    /* 229D0 8015C5C8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 229D4 8015C5CC 1000B08F */  lw         $s0, 0x10($sp)
    /* 229D8 8015C5D0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 229DC 8015C5D4 0800E003 */  jr         $ra
    /* 229E0 8015C5D8 00000000 */   nop
endlabel RestorePads__Fv
