.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartNoRoom__Fv, 0x60

glabel S_StartNoRoom__Fv
    /* 5D8D8 8006D8D8 0C218483 */  lb         $a0, %gp_rel(D_8011C88C)($gp)
    /* 5D8DC 8006D8DC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5D8E0 8006D8E0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 5D8E4 8006D8E4 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5D8E8 8006D8E8 5BBE010C */  jal        StartStore__Fc
    /* 5D8EC 8006D8EC 00000000 */   nop
    /* 5D8F0 8006D8F0 05000424 */  addiu      $a0, $zero, 0x5
    /* 5D8F4 8006D8F4 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5D8F8 8006D8F8 36A7010C */  jal        ClearSText__Fii
    /* 5D8FC 8006D8FC 17000524 */   addiu     $a1, $zero, 0x17
    /* 5D900 8006D900 4AED010C */  jal        GetStr__Fi
    /* 5D904 8006D904 EA040424 */   addiu     $a0, $zero, 0x4EA
    /* 5D908 8006D908 21200000 */  addu       $a0, $zero, $zero
    /* 5D90C 8006D90C 0A000524 */  addiu      $a1, $zero, 0xA
    /* 5D910 8006D910 01000324 */  addiu      $v1, $zero, 0x1
    /* 5D914 8006D914 01000624 */  addiu      $a2, $zero, 0x1
    /* 5D918 8006D918 21384000 */  addu       $a3, $v0, $zero
    /* 5D91C 8006D91C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5D920 8006D920 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5D924 8006D924 1400A3AF */   sw        $v1, 0x14($sp)
    /* 5D928 8006D928 1800BF8F */  lw         $ra, 0x18($sp)
    /* 5D92C 8006D92C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5D930 8006D930 0800E003 */  jr         $ra
    /* 5D934 8006D934 00000000 */   nop
endlabel S_StartNoRoom__Fv
