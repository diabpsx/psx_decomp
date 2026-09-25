.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartNoItems__Fv, 0xB4

glabel S_StartNoItems__Fv
    /* 5D938 8006D938 21138283 */  lb         $v0, %gp_rel(WFlag)($gp)
    /* 5D93C 8006D93C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5D940 8006D940 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5D944 8006D944 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5D948 8006D948 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5D94C 8006D94C 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5D950 8006D950 10004010 */  beqz       $v0, .L8006D994
    /* 5D954 8006D954 00000000 */   nop
    /* 5D958 8006D958 5BBE010C */  jal        StartStore__Fc
    /* 5D95C 8006D95C 05000424 */   addiu     $a0, $zero, 0x5
    /* 5D960 8006D960 05000424 */  addiu      $a0, $zero, 0x5
    /* 5D964 8006D964 36A7010C */  jal        ClearSText__Fii
    /* 5D968 8006D968 17000524 */   addiu     $a1, $zero, 0x17
    /* 5D96C 8006D96C 4AED010C */  jal        GetStr__Fi
    /* 5D970 8006D970 DA020424 */   addiu     $a0, $zero, 0x2DA
    /* 5D974 8006D974 21200000 */  addu       $a0, $zero, $zero
    /* 5D978 8006D978 0A000524 */  addiu      $a1, $zero, 0xA
    /* 5D97C 8006D97C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5D980 8006D980 21384000 */  addu       $a3, $v0, $zero
    /* 5D984 8006D984 01000224 */  addiu      $v0, $zero, 0x1
    /* 5D988 8006D988 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5D98C 8006D98C 74B60108 */  j          .L8006D9D0
    /* 5D990 8006D990 1400A2AF */   sw        $v0, 0x14($sp)
  .L8006D994:
    /* 5D994 8006D994 5BBE010C */  jal        StartStore__Fc
    /* 5D998 8006D998 01000424 */   addiu     $a0, $zero, 0x1
    /* 5D99C 8006D99C 05000424 */  addiu      $a0, $zero, 0x5
    /* 5D9A0 8006D9A0 01001024 */  addiu      $s0, $zero, 0x1
    /* 5D9A4 8006D9A4 0C2190AF */  sw         $s0, %gp_rel(D_8011C88C)($gp)
    /* 5D9A8 8006D9A8 36A7010C */  jal        ClearSText__Fii
    /* 5D9AC 8006D9AC 17000524 */   addiu     $a1, $zero, 0x17
    /* 5D9B0 8006D9B0 4AED010C */  jal        GetStr__Fi
    /* 5D9B4 8006D9B4 BD020424 */   addiu     $a0, $zero, 0x2BD
    /* 5D9B8 8006D9B8 21200000 */  addu       $a0, $zero, $zero
    /* 5D9BC 8006D9BC 0A000524 */  addiu      $a1, $zero, 0xA
    /* 5D9C0 8006D9C0 01000624 */  addiu      $a2, $zero, 0x1
    /* 5D9C4 8006D9C4 21384000 */  addu       $a3, $v0, $zero
    /* 5D9C8 8006D9C8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5D9CC 8006D9CC 1400B0AF */  sw         $s0, 0x14($sp)
  .L8006D9D0:
    /* 5D9D0 8006D9D0 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5D9D4 8006D9D4 00000000 */   nop
    /* 5D9D8 8006D9D8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5D9DC 8006D9DC 1800B08F */  lw         $s0, 0x18($sp)
    /* 5D9E0 8006D9E0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5D9E4 8006D9E4 0800E003 */  jr         $ra
    /* 5D9E8 8006D9E8 00000000 */   nop
endlabel S_StartNoItems__Fv
