.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartNoMoney__Fv, 0x68

glabel S_StartNoMoney__Fv
    /* 5D870 8006D870 0C218483 */  lb         $a0, %gp_rel(D_8011C88C)($gp)
    /* 5D874 8006D874 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5D878 8006D878 1800BFAF */  sw         $ra, 0x18($sp)
    /* 5D87C 8006D87C 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5D880 8006D880 5BBE010C */  jal        StartStore__Fc
    /* 5D884 8006D884 00000000 */   nop
    /* 5D888 8006D888 05000424 */  addiu      $a0, $zero, 0x5
    /* 5D88C 8006D88C 01000224 */  addiu      $v0, $zero, 0x1
    /* 5D890 8006D890 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5D894 8006D894 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5D898 8006D898 36A7010C */  jal        ClearSText__Fii
    /* 5D89C 8006D89C 17000524 */   addiu     $a1, $zero, 0x17
    /* 5D8A0 8006D8A0 4AED010C */  jal        GetStr__Fi
    /* 5D8A4 8006D8A4 E9040424 */   addiu     $a0, $zero, 0x4E9
    /* 5D8A8 8006D8A8 21200000 */  addu       $a0, $zero, $zero
    /* 5D8AC 8006D8AC 0A000524 */  addiu      $a1, $zero, 0xA
    /* 5D8B0 8006D8B0 01000324 */  addiu      $v1, $zero, 0x1
    /* 5D8B4 8006D8B4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5D8B8 8006D8B8 21384000 */  addu       $a3, $v0, $zero
    /* 5D8BC 8006D8BC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5D8C0 8006D8C0 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5D8C4 8006D8C4 1400A3AF */   sw        $v1, 0x14($sp)
    /* 5D8C8 8006D8C8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 5D8CC 8006D8CC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5D8D0 8006D8D0 0800E003 */  jr         $ra
    /* 5D8D4 8006D8D4 00000000 */   nop
endlabel S_StartNoMoney__Fv
