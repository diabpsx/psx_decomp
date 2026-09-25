.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartBarMaid__Fv, 0xD4

glabel S_StartBarMaid__Fv
    /* 5F7C4 8006F7C4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5F7C8 8006F7C8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5F7CC 8006F7CC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5F7D0 8006F7D0 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5F7D4 8006F7D4 611380A3 */  sb         $zero, %gp_rel(stextsize)($gp)
    /* 5F7D8 8006F7D8 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5F7DC 8006F7DC 4AED010C */  jal        GetStr__Fi
    /* 5F7E0 8006F7E0 83010424 */   addiu     $a0, $zero, 0x183
    /* 5F7E4 8006F7E4 21200000 */  addu       $a0, $zero, $zero
    /* 5F7E8 8006F7E8 01000524 */  addiu      $a1, $zero, 0x1
    /* 5F7EC 8006F7EC 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F7F0 8006F7F0 21384000 */  addu       $a3, $v0, $zero
    /* 5F7F4 8006F7F4 03001024 */  addiu      $s0, $zero, 0x3
    /* 5F7F8 8006F7F8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F7FC 8006F7FC 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F800 8006F800 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F804 8006F804 4AED010C */  jal        GetStr__Fi
    /* 5F808 8006F808 DF040424 */   addiu     $a0, $zero, 0x4DF
    /* 5F80C 8006F80C 21200000 */  addu       $a0, $zero, $zero
    /* 5F810 8006F810 07000524 */  addiu      $a1, $zero, 0x7
    /* 5F814 8006F814 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F818 8006F818 21384000 */  addu       $a3, $v0, $zero
    /* 5F81C 8006F81C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F820 8006F820 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F824 8006F824 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F828 8006F828 4AED010C */  jal        GetStr__Fi
    /* 5F82C 8006F82C 29040424 */   addiu     $a0, $zero, 0x429
    /* 5F830 8006F830 21200000 */  addu       $a0, $zero, $zero
    /* 5F834 8006F834 09000524 */  addiu      $a1, $zero, 0x9
    /* 5F838 8006F838 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F83C 8006F83C 21384000 */  addu       $a3, $v0, $zero
    /* 5F840 8006F840 01001024 */  addiu      $s0, $zero, 0x1
    /* 5F844 8006F844 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F848 8006F848 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F84C 8006F84C 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5F850 8006F850 4AED010C */  jal        GetStr__Fi
    /* 5F854 8006F854 8C030424 */   addiu     $a0, $zero, 0x38C
    /* 5F858 8006F858 21200000 */  addu       $a0, $zero, $zero
    /* 5F85C 8006F85C 0B000524 */  addiu      $a1, $zero, 0xB
    /* 5F860 8006F860 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F864 8006F864 21384000 */  addu       $a3, $v0, $zero
    /* 5F868 8006F868 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5F86C 8006F86C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F870 8006F870 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5F874 8006F874 5CA7010C */  jal        AddSLine__Fi
    /* 5F878 8006F878 03000424 */   addiu     $a0, $zero, 0x3
    /* 5F87C 8006F87C 14000224 */  addiu      $v0, $zero, 0x14
    /* 5F880 8006F880 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5F884 8006F884 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5F888 8006F888 1800B08F */  lw         $s0, 0x18($sp)
    /* 5F88C 8006F88C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5F890 8006F890 0800E003 */  jr         $ra
    /* 5F894 8006F894 00000000 */   nop
endlabel S_StartBarMaid__Fv
