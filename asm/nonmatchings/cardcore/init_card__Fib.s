.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching init_card__Fib, 0xCC

glabel init_card__Fib
    /* 95274 800A5274 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 95278 800A5278 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9527C 800A527C 21888000 */  addu       $s1, $a0, $zero
    /* 95280 800A5280 2000B4AF */  sw         $s4, 0x20($sp)
    /* 95284 800A5284 1000B0AF */  sw         $s0, 0x10($sp)
    /* 95288 800A5288 80801100 */  sll        $s0, $s1, 2
    /* 9528C 800A528C 1280023C */  lui        $v0, %hi(card_dirty)
    /* 95290 800A5290 E8B14224 */  addiu      $v0, $v0, %lo(card_dirty)
    /* 95294 800A5294 1800B2AF */  sw         $s2, 0x18($sp)
    /* 95298 800A5298 21900202 */  addu       $s2, $s0, $v0
    /* 9529C 800A529C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 952A0 800A52A0 01001324 */  addiu      $s3, $zero, 0x1
    /* 952A4 800A52A4 2400BFAF */  sw         $ra, 0x24($sp)
    /* 952A8 800A52A8 000040AE */  sw         $zero, 0x0($s2)
    /* 952AC 800A52AC 1280013C */  lui        $at, %hi(card_files)
    /* 952B0 800A52B0 21083000 */  addu       $at, $at, $s0
    /* 952B4 800A52B4 ECB320AC */  sw         $zero, %lo(card_files)($at)
    /* 952B8 800A52B8 1280013C */  lui        $at, %hi(card_changed)
    /* 952BC 800A52BC 21083000 */  addu       $at, $at, $s0
    /* 952C0 800A52C0 F4B333AC */  sw         $s3, %lo(card_changed)($at)
    /* 952C4 800A52C4 D094020C */  jal        ping_card__Fi
    /* 952C8 800A52C8 21A0A000 */   addu      $s4, $a1, $zero
    /* 952CC 800A52CC 1280013C */  lui        $at, %hi(card_status)
    /* 952D0 800A52D0 21083000 */  addu       $at, $at, $s0
    /* 952D4 800A52D4 DCB322AC */  sw         $v0, %lo(card_status)($at)
    /* 952D8 800A52D8 0E004014 */  bnez       $v0, .L800A5314
    /* 952DC 800A52DC 00000000 */   nop
    /* 952E0 800A52E0 FD0A050C */  jal        func_80142BF4
    /* 952E4 800A52E4 21202002 */   addu      $a0, $s1, $zero
    /* 952E8 800A52E8 1280013C */  lui        $at, %hi(card_usable)
    /* 952EC 800A52EC 21083000 */  addu       $at, $at, $s0
    /* 952F0 800A52F0 E4B322AC */  sw         $v0, %lo(card_usable)($at)
    /* 952F4 800A52F4 05008012 */  beqz       $s4, .L800A530C
    /* 952F8 800A52F8 00000000 */   nop
    /* 952FC 800A52FC 660A050C */  jal        func_80142998
    /* 95300 800A5300 21202002 */   addu      $a0, $s1, $zero
    /* 95304 800A5304 C7940208 */  j          .L800A531C
    /* 95308 800A5308 00000000 */   nop
  .L800A530C:
    /* 9530C 800A530C C7940208 */  j          .L800A531C
    /* 95310 800A5310 000053AE */   sw        $s3, 0x0($s2)
  .L800A5314:
    /* 95314 800A5314 1748000C */  jal        VSync
    /* 95318 800A5318 78000424 */   addiu     $a0, $zero, 0x78
  .L800A531C:
    /* 9531C 800A531C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 95320 800A5320 2000B48F */  lw         $s4, 0x20($sp)
    /* 95324 800A5324 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 95328 800A5328 1800B28F */  lw         $s2, 0x18($sp)
    /* 9532C 800A532C 1400B18F */  lw         $s1, 0x14($sp)
    /* 95330 800A5330 1000B08F */  lw         $s0, 0x10($sp)
    /* 95334 800A5334 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 95338 800A5338 0800E003 */  jr         $ra
    /* 9533C 800A533C 00000000 */   nop
endlabel init_card__Fib
