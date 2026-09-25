.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartTavern__Fv, 0xF8

glabel S_StartTavern__Fv
    /* 5F6CC 8006F6CC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5F6D0 8006F6D0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5F6D4 8006F6D4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5F6D8 8006F6D8 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5F6DC 8006F6DC 611380A3 */  sb         $zero, %gp_rel(stextsize)($gp)
    /* 5F6E0 8006F6E0 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5F6E4 8006F6E4 4AED010C */  jal        GetStr__Fi
    /* 5F6E8 8006F6E8 CA040424 */   addiu     $a0, $zero, 0x4CA
    /* 5F6EC 8006F6EC 21200000 */  addu       $a0, $zero, $zero
    /* 5F6F0 8006F6F0 01000524 */  addiu      $a1, $zero, 0x1
    /* 5F6F4 8006F6F4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F6F8 8006F6F8 21384000 */  addu       $a3, $v0, $zero
    /* 5F6FC 8006F6FC 03001024 */  addiu      $s0, $zero, 0x3
    /* 5F700 8006F700 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F704 8006F704 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F708 8006F708 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F70C 8006F70C 4AED010C */  jal        GetStr__Fi
    /* 5F710 8006F710 71030424 */   addiu     $a0, $zero, 0x371
    /* 5F714 8006F714 21200000 */  addu       $a0, $zero, $zero
    /* 5F718 8006F718 02000524 */  addiu      $a1, $zero, 0x2
    /* 5F71C 8006F71C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F720 8006F720 21384000 */  addu       $a3, $v0, $zero
    /* 5F724 8006F724 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F728 8006F728 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F72C 8006F72C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F730 8006F730 4AED010C */  jal        GetStr__Fi
    /* 5F734 8006F734 DF040424 */   addiu     $a0, $zero, 0x4DF
    /* 5F738 8006F738 21200000 */  addu       $a0, $zero, $zero
    /* 5F73C 8006F73C 07000524 */  addiu      $a1, $zero, 0x7
    /* 5F740 8006F740 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F744 8006F744 21384000 */  addu       $a3, $v0, $zero
    /* 5F748 8006F748 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F74C 8006F74C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F750 8006F750 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F754 8006F754 4AED010C */  jal        GetStr__Fi
    /* 5F758 8006F758 2B040424 */   addiu     $a0, $zero, 0x42B
    /* 5F75C 8006F75C 21200000 */  addu       $a0, $zero, $zero
    /* 5F760 8006F760 09000524 */  addiu      $a1, $zero, 0x9
    /* 5F764 8006F764 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F768 8006F768 21384000 */  addu       $a3, $v0, $zero
    /* 5F76C 8006F76C 01001024 */  addiu      $s0, $zero, 0x1
    /* 5F770 8006F770 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F774 8006F774 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F778 8006F778 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5F77C 8006F77C 4AED010C */  jal        GetStr__Fi
    /* 5F780 8006F780 42020424 */   addiu     $a0, $zero, 0x242
    /* 5F784 8006F784 21200000 */  addu       $a0, $zero, $zero
    /* 5F788 8006F788 0B000524 */  addiu      $a1, $zero, 0xB
    /* 5F78C 8006F78C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F790 8006F790 21384000 */  addu       $a3, $v0, $zero
    /* 5F794 8006F794 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5F798 8006F798 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F79C 8006F79C 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5F7A0 8006F7A0 5CA7010C */  jal        AddSLine__Fi
    /* 5F7A4 8006F7A4 03000424 */   addiu     $a0, $zero, 0x3
    /* 5F7A8 8006F7A8 14000224 */  addiu      $v0, $zero, 0x14
    /* 5F7AC 8006F7AC 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5F7B0 8006F7B0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5F7B4 8006F7B4 1800B08F */  lw         $s0, 0x18($sp)
    /* 5F7B8 8006F7B8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5F7BC 8006F7BC 0800E003 */  jr         $ra
    /* 5F7C0 8006F7C0 00000000 */   nop
endlabel S_StartTavern__Fv
