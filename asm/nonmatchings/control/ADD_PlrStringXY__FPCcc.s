.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ADD_PlrStringXY__FPCcc, 0xA8

glabel ADD_PlrStringXY__FPCcc
    /* 23DE8 80033DE8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 23DEC 80033DEC 21188000 */  addu       $v1, $a0, $zero
    /* 23DF0 80033DF0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 23DF4 80033DF4 2188A000 */  addu       $s1, $a1, $zero
    /* 23DF8 80033DF8 E00E828F */  lw         $v0, %gp_rel(D_8011B660)($gp)
    /* 23DFC 80033DFC 21286000 */  addu       $a1, $v1, $zero
    /* 23E00 80033E00 1800BFAF */  sw         $ra, 0x18($sp)
    /* 23E04 80033E04 1000B0AF */  sw         $s0, 0x10($sp)
    /* 23E08 80033E08 80800200 */  sll        $s0, $v0, 2
    /* 23E0C 80033E0C 21800202 */  addu       $s0, $s0, $v0
    /* 23E10 80033E10 C0801000 */  sll        $s0, $s0, 3
    /* 23E14 80033E14 0D80023C */  lui        $v0, %hi(CS_Tab)
    /* 23E18 80033E18 B0E34224 */  addiu      $v0, $v0, %lo(CS_Tab)
    /* 23E1C 80033E1C 21800202 */  addu       $s0, $s0, $v0
    /* 23E20 80033E20 F240000C */  jal        strcpy
    /* 23E24 80033E24 18000426 */   addiu     $a0, $s0, 0x18
    /* 23E28 80033E28 270011A2 */  sb         $s1, 0x27($s0)
    /* 23E2C 80033E2C E00E838F */  lw         $v1, %gp_rel(D_8011B660)($gp)
    /* 23E30 80033E30 00000000 */  nop
    /* 23E34 80033E34 01006324 */  addiu      $v1, $v1, 0x1
    /* 23E38 80033E38 80100300 */  sll        $v0, $v1, 2
    /* 23E3C 80033E3C 21104300 */  addu       $v0, $v0, $v1
    /* 23E40 80033E40 C0200200 */  sll        $a0, $v0, 3
    /* 23E44 80033E44 0D80013C */  lui        $at, %hi(CS_Tab + 0x8)
    /* 23E48 80033E48 21082400 */  addu       $at, $at, $a0
    /* 23E4C 80033E4C B8E3228C */  lw         $v0, %lo(CS_Tab + 0x8)($at)
    /* 23E50 80033E50 E00E83AF */  sw         $v1, %gp_rel(D_8011B660)($gp)
    /* 23E54 80033E54 08004014 */  bnez       $v0, .L80033E78
    /* 23E58 80033E58 00000000 */   nop
    /* 23E5C 80033E5C 0D80013C */  lui        $at, %hi(CS_Tab + 0x18)
    /* 23E60 80033E60 21082400 */  addu       $at, $at, $a0
    /* 23E64 80033E64 C8E320A0 */  sb         $zero, %lo(CS_Tab + 0x18)($at)
    /* 23E68 80033E68 E00E828F */  lw         $v0, %gp_rel(D_8011B660)($gp)
    /* 23E6C 80033E6C 00000000 */  nop
    /* 23E70 80033E70 01004224 */  addiu      $v0, $v0, 0x1
    /* 23E74 80033E74 E00E82AF */  sw         $v0, %gp_rel(D_8011B660)($gp)
  .L80033E78:
    /* 23E78 80033E78 1800BF8F */  lw         $ra, 0x18($sp)
    /* 23E7C 80033E7C 1400B18F */  lw         $s1, 0x14($sp)
    /* 23E80 80033E80 1000B08F */  lw         $s0, 0x10($sp)
    /* 23E84 80033E84 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 23E88 80033E88 0800E003 */  jr         $ra
    /* 23E8C 80033E8C 00000000 */   nop
endlabel ADD_PlrStringXY__FPCcc
