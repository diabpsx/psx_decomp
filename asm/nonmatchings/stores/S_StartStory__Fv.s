.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartStory__Fv, 0xF0

glabel S_StartStory__Fv
    /* 5E624 8006E624 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5E628 8006E628 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5E62C 8006E62C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5E630 8006E630 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5E634 8006E634 611380A3 */  sb         $zero, %gp_rel(stextsize)($gp)
    /* 5E638 8006E638 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5E63C 8006E63C 4AED010C */  jal        GetStr__Fi
    /* 5E640 8006E640 77040424 */   addiu     $a0, $zero, 0x477
    /* 5E644 8006E644 21200000 */  addu       $a0, $zero, $zero
    /* 5E648 8006E648 01000524 */  addiu      $a1, $zero, 0x1
    /* 5E64C 8006E64C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E650 8006E650 21384000 */  addu       $a3, $v0, $zero
    /* 5E654 8006E654 03001024 */  addiu      $s0, $zero, 0x3
    /* 5E658 8006E658 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5E65C 8006E65C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E660 8006E660 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5E664 8006E664 4AED010C */  jal        GetStr__Fi
    /* 5E668 8006E668 DF040424 */   addiu     $a0, $zero, 0x4DF
    /* 5E66C 8006E66C 21200000 */  addu       $a0, $zero, $zero
    /* 5E670 8006E670 05000524 */  addiu      $a1, $zero, 0x5
    /* 5E674 8006E674 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E678 8006E678 21384000 */  addu       $a3, $v0, $zero
    /* 5E67C 8006E67C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5E680 8006E680 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E684 8006E684 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5E688 8006E688 4AED010C */  jal        GetStr__Fi
    /* 5E68C 8006E68C 27040424 */   addiu     $a0, $zero, 0x427
    /* 5E690 8006E690 21200000 */  addu       $a0, $zero, $zero
    /* 5E694 8006E694 07000524 */  addiu      $a1, $zero, 0x7
    /* 5E698 8006E698 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E69C 8006E69C 21384000 */  addu       $a3, $v0, $zero
    /* 5E6A0 8006E6A0 01001024 */  addiu      $s0, $zero, 0x1
    /* 5E6A4 8006E6A4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5E6A8 8006E6A8 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E6AC 8006E6AC 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5E6B0 8006E6B0 4AED010C */  jal        GetStr__Fi
    /* 5E6B4 8006E6B4 07020424 */   addiu     $a0, $zero, 0x207
    /* 5E6B8 8006E6B8 21200000 */  addu       $a0, $zero, $zero
    /* 5E6BC 8006E6BC 09000524 */  addiu      $a1, $zero, 0x9
    /* 5E6C0 8006E6C0 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E6C4 8006E6C4 21384000 */  addu       $a3, $v0, $zero
    /* 5E6C8 8006E6C8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5E6CC 8006E6CC 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E6D0 8006E6D0 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5E6D4 8006E6D4 4AED010C */  jal        GetStr__Fi
    /* 5E6D8 8006E6D8 8C030424 */   addiu     $a0, $zero, 0x38C
    /* 5E6DC 8006E6DC 21200000 */  addu       $a0, $zero, $zero
    /* 5E6E0 8006E6E0 0B000524 */  addiu      $a1, $zero, 0xB
    /* 5E6E4 8006E6E4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5E6E8 8006E6E8 21384000 */  addu       $a3, $v0, $zero
    /* 5E6EC 8006E6EC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5E6F0 8006E6F0 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E6F4 8006E6F4 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5E6F8 8006E6F8 5CA7010C */  jal        AddSLine__Fi
    /* 5E6FC 8006E6FC 03000424 */   addiu     $a0, $zero, 0x3
    /* 5E700 8006E700 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5E704 8006E704 1800B08F */  lw         $s0, 0x18($sp)
    /* 5E708 8006E708 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5E70C 8006E70C 0800E003 */  jr         $ra
    /* 5E710 8006E710 00000000 */   nop
endlabel S_StartStory__Fv
