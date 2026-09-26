.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFileNumber__FiPc, 0xC0

glabel GetFileNumber__FiPc
    /* 1F998 80159590 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1F99C 80159594 80180400 */  sll        $v1, $a0, 2
    /* 1F9A0 80159598 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 1F9A4 8015959C 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1F9A8 801595A0 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1F9AC 801595A4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1F9B0 801595A8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1F9B4 801595AC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1F9B8 801595B0 1280013C */  lui        $at, %hi(card_usable)
    /* 1F9BC 801595B4 21082300 */  addu       $at, $at, $v1
    /* 1F9C0 801595B8 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 1F9C4 801595BC 00000000 */  nop
    /* 1F9C8 801595C0 03004014 */  bnez       $v0, .L801595D0
    /* 1F9CC 801595C4 21A0A000 */   addu      $s4, $a1, $zero
    /* 1F9D0 801595C8 8B650508 */  j          .L8015962C
    /* 1F9D4 801595CC FFFF0224 */   addiu     $v0, $zero, -0x1
  .L801595D0:
    /* 1F9D8 801595D0 1280023C */  lui        $v0, %hi(card_files)
    /* 1F9DC 801595D4 ECB34224 */  addiu      $v0, $v0, %lo(card_files)
    /* 1F9E0 801595D8 21286200 */  addu       $a1, $v1, $v0
    /* 1F9E4 801595DC 0000A28C */  lw         $v0, 0x0($a1)
    /* 1F9E8 801595E0 00000000 */  nop
    /* 1F9EC 801595E4 10004018 */  blez       $v0, .L80159628
    /* 1F9F0 801595E8 21800000 */   addu      $s0, $zero, $zero
    /* 1F9F4 801595EC 21106400 */  addu       $v0, $v1, $a0
    /* 1F9F8 801595F0 C0990200 */  sll        $s3, $v0, 7
    /* 1F9FC 801595F4 2190A000 */  addu       $s2, $a1, $zero
    /* 1FA00 801595F8 1480113C */  lui        $s1, %hi(card_dir)
    /* 1FA04 801595FC F8E13126 */  addiu      $s1, $s1, %lo(card_dir)
  .L80159600:
    /* 1FA08 80159600 21207102 */  addu       $a0, $s3, $s1
    /* 1FA0C 80159604 7F67000C */  jal        strcmp
    /* 1FA10 80159608 21288002 */   addu      $a1, $s4, $zero
    /* 1FA14 8015960C 07004010 */  beqz       $v0, .L8015962C
    /* 1FA18 80159610 21100002 */   addu      $v0, $s0, $zero
    /* 1FA1C 80159614 0000428E */  lw         $v0, 0x0($s2)
    /* 1FA20 80159618 01001026 */  addiu      $s0, $s0, 0x1
    /* 1FA24 8015961C 2A100202 */  slt        $v0, $s0, $v0
    /* 1FA28 80159620 F7FF4014 */  bnez       $v0, .L80159600
    /* 1FA2C 80159624 28003126 */   addiu     $s1, $s1, 0x28
  .L80159628:
    /* 1FA30 80159628 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8015962C:
    /* 1FA34 8015962C 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 1FA38 80159630 2800B48F */  lw         $s4, 0x28($sp)
    /* 1FA3C 80159634 2400B38F */  lw         $s3, 0x24($sp)
    /* 1FA40 80159638 2000B28F */  lw         $s2, 0x20($sp)
    /* 1FA44 8015963C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1FA48 80159640 1800B08F */  lw         $s0, 0x18($sp)
    /* 1FA4C 80159644 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1FA50 80159648 0800E003 */  jr         $ra
    /* 1FA54 8015964C 00000000 */   nop
endlabel GetFileNumber__FiPc
