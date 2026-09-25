.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartDrunk__Fv, 0xD4

glabel S_StartDrunk__Fv
    /* 5F898 8006F898 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5F89C 8006F89C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5F8A0 8006F8A0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5F8A4 8006F8A4 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5F8A8 8006F8A8 611380A3 */  sb         $zero, %gp_rel(stextsize)($gp)
    /* 5F8AC 8006F8AC 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5F8B0 8006F8B0 4AED010C */  jal        GetStr__Fi
    /* 5F8B4 8006F8B4 3E010424 */   addiu     $a0, $zero, 0x13E
    /* 5F8B8 8006F8B8 21200000 */  addu       $a0, $zero, $zero
    /* 5F8BC 8006F8BC 01000524 */  addiu      $a1, $zero, 0x1
    /* 5F8C0 8006F8C0 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F8C4 8006F8C4 21384000 */  addu       $a3, $v0, $zero
    /* 5F8C8 8006F8C8 03001024 */  addiu      $s0, $zero, 0x3
    /* 5F8CC 8006F8CC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F8D0 8006F8D0 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F8D4 8006F8D4 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F8D8 8006F8D8 4AED010C */  jal        GetStr__Fi
    /* 5F8DC 8006F8DC DF040424 */   addiu     $a0, $zero, 0x4DF
    /* 5F8E0 8006F8E0 21200000 */  addu       $a0, $zero, $zero
    /* 5F8E4 8006F8E4 07000524 */  addiu      $a1, $zero, 0x7
    /* 5F8E8 8006F8E8 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F8EC 8006F8EC 21384000 */  addu       $a3, $v0, $zero
    /* 5F8F0 8006F8F0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F8F4 8006F8F4 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F8F8 8006F8F8 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F8FC 8006F8FC 4AED010C */  jal        GetStr__Fi
    /* 5F900 8006F900 28040424 */   addiu     $a0, $zero, 0x428
    /* 5F904 8006F904 21200000 */  addu       $a0, $zero, $zero
    /* 5F908 8006F908 09000524 */  addiu      $a1, $zero, 0x9
    /* 5F90C 8006F90C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F910 8006F910 21384000 */  addu       $a3, $v0, $zero
    /* 5F914 8006F914 01001024 */  addiu      $s0, $zero, 0x1
    /* 5F918 8006F918 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5F91C 8006F91C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F920 8006F920 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5F924 8006F924 4AED010C */  jal        GetStr__Fi
    /* 5F928 8006F928 8C030424 */   addiu     $a0, $zero, 0x38C
    /* 5F92C 8006F92C 21200000 */  addu       $a0, $zero, $zero
    /* 5F930 8006F930 0B000524 */  addiu      $a1, $zero, 0xB
    /* 5F934 8006F934 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F938 8006F938 21384000 */  addu       $a3, $v0, $zero
    /* 5F93C 8006F93C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5F940 8006F940 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F944 8006F944 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5F948 8006F948 5CA7010C */  jal        AddSLine__Fi
    /* 5F94C 8006F94C 03000424 */   addiu     $a0, $zero, 0x3
    /* 5F950 8006F950 14000224 */  addiu      $v0, $zero, 0x14
    /* 5F954 8006F954 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5F958 8006F958 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5F95C 8006F95C 1800B08F */  lw         $s0, 0x18($sp)
    /* 5F960 8006F960 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5F964 8006F964 0800E003 */  jr         $ra
    /* 5F968 8006F968 00000000 */   nop
endlabel S_StartDrunk__Fv
