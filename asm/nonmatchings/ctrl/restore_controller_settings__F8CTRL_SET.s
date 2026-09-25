.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching restore_controller_settings__F8CTRL_SET, 0xA4

glabel restore_controller_settings__F8CTRL_SET
    /* 8CAD8 8009CAD8 0D80053C */  lui        $a1, %hi(txt_actions)
    /* 8CADC 8009CADC 0CC4A524 */  addiu      $a1, $a1, %lo(txt_actions)
    /* 8CAE0 8009CAE0 05008010 */  beqz       $a0, .L8009CAF8
    /* 8CAE4 8009CAE4 01000224 */   addiu     $v0, $zero, 0x1
    /* 8CAE8 8009CAE8 14008210 */  beq        $a0, $v0, .L8009CB3C
    /* 8CAEC 8009CAEC 21180000 */   addu      $v1, $zero, $zero
    /* 8CAF0 8009CAF0 DD720208 */  j          .L8009CB74
    /* 8CAF4 8009CAF4 00000000 */   nop
  .L8009CAF8:
    /* 8CAF8 8009CAF8 21180000 */  addu       $v1, $zero, $zero
    /* 8CAFC 8009CAFC 0C00A424 */  addiu      $a0, $a1, 0xC
  .L8009CB00:
    /* 8CB00 8009CB00 0D80013C */  lui        $at, %hi(D_800CC5EC)
    /* 8CB04 8009CB04 21082300 */  addu       $at, $at, $v1
    /* 8CB08 8009CB08 ECC5228C */  lw         $v0, %lo(D_800CC5EC)($at)
    /* 8CB0C 8009CB0C 00000000 */  nop
    /* 8CB10 8009CB10 F8FF82AC */  sw         $v0, -0x8($a0)
    /* 8CB14 8009CB14 0D80013C */  lui        $at, %hi(D_800CC5F0)
    /* 8CB18 8009CB18 21082300 */  addu       $at, $at, $v1
    /* 8CB1C 8009CB1C F0C5228C */  lw         $v0, %lo(D_800CC5F0)($at)
    /* 8CB20 8009CB20 08006324 */  addiu      $v1, $v1, 0x8
    /* 8CB24 8009CB24 000082AC */  sw         $v0, 0x0($a0)
    /* 8CB28 8009CB28 A0006228 */  slti       $v0, $v1, 0xA0
    /* 8CB2C 8009CB2C F4FF4014 */  bnez       $v0, .L8009CB00
    /* 8CB30 8009CB30 10008424 */   addiu     $a0, $a0, 0x10
    /* 8CB34 8009CB34 DD720208 */  j          .L8009CB74
    /* 8CB38 8009CB38 00000000 */   nop
  .L8009CB3C:
    /* 8CB3C 8009CB3C 0C00A424 */  addiu      $a0, $a1, 0xC
  .L8009CB40:
    /* 8CB40 8009CB40 0D80013C */  lui        $at, %hi(D_800CC54C)
    /* 8CB44 8009CB44 21082300 */  addu       $at, $at, $v1
    /* 8CB48 8009CB48 4CC5228C */  lw         $v0, %lo(D_800CC54C)($at)
    /* 8CB4C 8009CB4C 00000000 */  nop
    /* 8CB50 8009CB50 F8FF82AC */  sw         $v0, -0x8($a0)
    /* 8CB54 8009CB54 0D80013C */  lui        $at, %hi(D_800CC550)
    /* 8CB58 8009CB58 21082300 */  addu       $at, $at, $v1
    /* 8CB5C 8009CB5C 50C5228C */  lw         $v0, %lo(D_800CC550)($at)
    /* 8CB60 8009CB60 08006324 */  addiu      $v1, $v1, 0x8
    /* 8CB64 8009CB64 000082AC */  sw         $v0, 0x0($a0)
    /* 8CB68 8009CB68 A0006228 */  slti       $v0, $v1, 0xA0
    /* 8CB6C 8009CB6C F4FF4014 */  bnez       $v0, .L8009CB40
    /* 8CB70 8009CB70 10008424 */   addiu     $a0, $a0, 0x10
  .L8009CB74:
    /* 8CB74 8009CB74 0800E003 */  jr         $ra
    /* 8CB78 8009CB78 00000000 */   nop
endlabel restore_controller_settings__F8CTRL_SET
