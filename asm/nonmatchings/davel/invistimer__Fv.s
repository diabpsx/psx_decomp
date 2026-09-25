.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching invistimer__Fv, 0xD8

glabel invistimer__Fv
    /* 8EA78 8009EA78 21380000 */  addu       $a3, $zero, $zero
    /* 8EA7C 8009EA7C 7C09888F */  lw         $t0, %gp_rel(D_8011B0FC)($gp)
    /* 8EA80 8009EA80 0D80023C */  lui        $v0, %hi(SpellFXDat)
    /* 8EA84 8009EA84 DCC64224 */  addiu      $v0, $v0, %lo(SpellFXDat)
    /* 8EA88 8009EA88 0C004424 */  addiu      $a0, $v0, 0xC
    /* 8EA8C 8009EA8C 10004524 */  addiu      $a1, $v0, 0x10
    /* 8EA90 8009EA90 21304000 */  addu       $a2, $v0, $zero
  .L8009EA94:
    /* 8EA94 8009EA94 0000A28C */  lw         $v0, 0x0($a1)
    /* 8EA98 8009EA98 00000000 */  nop
    /* 8EA9C 8009EA9C 24004010 */  beqz       $v0, .L8009EB30
    /* 8EAA0 8009EAA0 00000000 */   nop
    /* 8EAA4 8009EAA4 22000015 */  bnez       $t0, .L8009EB30
    /* 8EAA8 8009EAA8 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 8EAAC 8009EAAC 1000C2AC */  sw         $v0, 0x10($a2)
    /* 8EAB0 8009EAB0 0000A28C */  lw         $v0, 0x0($a1)
    /* 8EAB4 8009EAB4 00000000 */  nop
    /* 8EAB8 8009EAB8 03004014 */  bnez       $v0, .L8009EAC8
    /* 8EABC 8009EABC 2C014228 */   slti      $v0, $v0, 0x12C
    /* 8EAC0 8009EAC0 D27A0208 */  j          .L8009EB48
    /* 8EAC4 8009EAC4 000080AC */   sw        $zero, 0x0($a0)
  .L8009EAC8:
    /* 8EAC8 8009EAC8 0A004010 */  beqz       $v0, .L8009EAF4
    /* 8EACC 8009EACC 00000000 */   nop
    /* 8EAD0 8009EAD0 0000838C */  lw         $v1, 0x0($a0)
    /* 8EAD4 8009EAD4 00000000 */  nop
    /* 8EAD8 8009EAD8 01006330 */  andi       $v1, $v1, 0x1
    /* 8EADC 8009EADC 000083AC */  sw         $v1, 0x0($a0)
    /* 8EAE0 8009EAE0 0000A28C */  lw         $v0, 0x0($a1)
    /* 8EAE4 8009EAE4 00000000 */  nop
    /* 8EAE8 8009EAE8 04004230 */  andi       $v0, $v0, 0x4
    /* 8EAEC 8009EAEC 25186200 */  or         $v1, $v1, $v0
    /* 8EAF0 8009EAF0 000083AC */  sw         $v1, 0x0($a0)
  .L8009EAF4:
    /* 8EAF4 8009EAF4 0000A28C */  lw         $v0, 0x0($a1)
    /* 8EAF8 8009EAF8 00000000 */  nop
    /* 8EAFC 8009EAFC 3C004228 */  slti       $v0, $v0, 0x3C
    /* 8EB00 8009EB00 0B004010 */  beqz       $v0, .L8009EB30
    /* 8EB04 8009EB04 00000000 */   nop
    /* 8EB08 8009EB08 0000838C */  lw         $v1, 0x0($a0)
    /* 8EB0C 8009EB0C 00000000 */  nop
    /* 8EB10 8009EB10 01006330 */  andi       $v1, $v1, 0x1
    /* 8EB14 8009EB14 000083AC */  sw         $v1, 0x0($a0)
    /* 8EB18 8009EB18 0000A28C */  lw         $v0, 0x0($a1)
    /* 8EB1C 8009EB1C 00000000 */  nop
    /* 8EB20 8009EB20 02004230 */  andi       $v0, $v0, 0x2
    /* 8EB24 8009EB24 40100200 */  sll        $v0, $v0, 1
    /* 8EB28 8009EB28 25186200 */  or         $v1, $v1, $v0
    /* 8EB2C 8009EB2C 000083AC */  sw         $v1, 0x0($a0)
  .L8009EB30:
    /* 8EB30 8009EB30 48008424 */  addiu      $a0, $a0, 0x48
    /* 8EB34 8009EB34 4800A524 */  addiu      $a1, $a1, 0x48
    /* 8EB38 8009EB38 0100E724 */  addiu      $a3, $a3, 0x1
    /* 8EB3C 8009EB3C 0200E228 */  slti       $v0, $a3, 0x2
    /* 8EB40 8009EB40 D4FF4014 */  bnez       $v0, .L8009EA94
    /* 8EB44 8009EB44 4800C624 */   addiu     $a2, $a2, 0x48
  .L8009EB48:
    /* 8EB48 8009EB48 0800E003 */  jr         $ra
    /* 8EB4C 8009EB4C 00000000 */   nop
endlabel invistimer__Fv
