.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartSmith__Fv, 0x188

glabel S_StartSmith__Fv
    /* 5AA50 8006AA50 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5AA54 8006AA54 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5AA58 8006AA58 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5AA5C 8006AA5C 262180A3 */  sb         $zero, %gp_rel(D_8011C8A6)($gp)
    /* 5AA60 8006AA60 611380A3 */  sb         $zero, %gp_rel(stextsize)($gp)
    /* 5AA64 8006AA64 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5AA68 8006AA68 4AED010C */  jal        GetStr__Fi
    /* 5AA6C 8006AA6C CA040424 */   addiu     $a0, $zero, 0x4CA
    /* 5AA70 8006AA70 21200000 */  addu       $a0, $zero, $zero
    /* 5AA74 8006AA74 01000524 */  addiu      $a1, $zero, 0x1
    /* 5AA78 8006AA78 01000624 */  addiu      $a2, $zero, 0x1
    /* 5AA7C 8006AA7C 21384000 */  addu       $a3, $v0, $zero
    /* 5AA80 8006AA80 03001024 */  addiu      $s0, $zero, 0x3
    /* 5AA84 8006AA84 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5AA88 8006AA88 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5AA8C 8006AA8C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5AA90 8006AA90 4AED010C */  jal        GetStr__Fi
    /* 5AA94 8006AA94 4E000424 */   addiu     $a0, $zero, 0x4E
    /* 5AA98 8006AA98 21200000 */  addu       $a0, $zero, $zero
    /* 5AA9C 8006AA9C 02000524 */  addiu      $a1, $zero, 0x2
    /* 5AAA0 8006AAA0 01000624 */  addiu      $a2, $zero, 0x1
    /* 5AAA4 8006AAA4 21384000 */  addu       $a3, $v0, $zero
    /* 5AAA8 8006AAA8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5AAAC 8006AAAC 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5AAB0 8006AAB0 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5AAB4 8006AAB4 4AED010C */  jal        GetStr__Fi
    /* 5AAB8 8006AAB8 DF040424 */   addiu     $a0, $zero, 0x4DF
    /* 5AABC 8006AABC 21200000 */  addu       $a0, $zero, $zero
    /* 5AAC0 8006AAC0 06000524 */  addiu      $a1, $zero, 0x6
    /* 5AAC4 8006AAC4 01000624 */  addiu      $a2, $zero, 0x1
    /* 5AAC8 8006AAC8 21384000 */  addu       $a3, $v0, $zero
    /* 5AACC 8006AACC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5AAD0 8006AAD0 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5AAD4 8006AAD4 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5AAD8 8006AAD8 4AED010C */  jal        GetStr__Fi
    /* 5AADC 8006AADC 2A040424 */   addiu     $a0, $zero, 0x42A
    /* 5AAE0 8006AAE0 21200000 */  addu       $a0, $zero, $zero
    /* 5AAE4 8006AAE4 08000524 */  addiu      $a1, $zero, 0x8
    /* 5AAE8 8006AAE8 01000624 */  addiu      $a2, $zero, 0x1
    /* 5AAEC 8006AAEC 21384000 */  addu       $a3, $v0, $zero
    /* 5AAF0 8006AAF0 01001024 */  addiu      $s0, $zero, 0x1
    /* 5AAF4 8006AAF4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5AAF8 8006AAF8 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5AAFC 8006AAFC 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5AB00 8006AB00 4AED010C */  jal        GetStr__Fi
    /* 5AB04 8006AB04 95000424 */   addiu     $a0, $zero, 0x95
    /* 5AB08 8006AB08 21200000 */  addu       $a0, $zero, $zero
    /* 5AB0C 8006AB0C 09000524 */  addiu      $a1, $zero, 0x9
    /* 5AB10 8006AB10 01000624 */  addiu      $a2, $zero, 0x1
    /* 5AB14 8006AB14 21384000 */  addu       $a3, $v0, $zero
    /* 5AB18 8006AB18 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5AB1C 8006AB1C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5AB20 8006AB20 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5AB24 8006AB24 4AED010C */  jal        GetStr__Fi
    /* 5AB28 8006AB28 97000424 */   addiu     $a0, $zero, 0x97
    /* 5AB2C 8006AB2C 21200000 */  addu       $a0, $zero, $zero
    /* 5AB30 8006AB30 0A000524 */  addiu      $a1, $zero, 0xA
    /* 5AB34 8006AB34 01000624 */  addiu      $a2, $zero, 0x1
    /* 5AB38 8006AB38 21384000 */  addu       $a3, $v0, $zero
    /* 5AB3C 8006AB3C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5AB40 8006AB40 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5AB44 8006AB44 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5AB48 8006AB48 4AED010C */  jal        GetStr__Fi
    /* 5AB4C 8006AB4C B9030424 */   addiu     $a0, $zero, 0x3B9
    /* 5AB50 8006AB50 21200000 */  addu       $a0, $zero, $zero
    /* 5AB54 8006AB54 0B000524 */  addiu      $a1, $zero, 0xB
    /* 5AB58 8006AB58 01000624 */  addiu      $a2, $zero, 0x1
    /* 5AB5C 8006AB5C 21384000 */  addu       $a3, $v0, $zero
    /* 5AB60 8006AB60 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5AB64 8006AB64 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5AB68 8006AB68 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5AB6C 8006AB6C 4AED010C */  jal        GetStr__Fi
    /* 5AB70 8006AB70 5B030424 */   addiu     $a0, $zero, 0x35B
    /* 5AB74 8006AB74 21200000 */  addu       $a0, $zero, $zero
    /* 5AB78 8006AB78 0C000524 */  addiu      $a1, $zero, 0xC
    /* 5AB7C 8006AB7C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5AB80 8006AB80 21384000 */  addu       $a3, $v0, $zero
    /* 5AB84 8006AB84 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5AB88 8006AB88 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5AB8C 8006AB8C 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5AB90 8006AB90 4AED010C */  jal        GetStr__Fi
    /* 5AB94 8006AB94 41020424 */   addiu     $a0, $zero, 0x241
    /* 5AB98 8006AB98 21200000 */  addu       $a0, $zero, $zero
    /* 5AB9C 8006AB9C 0D000524 */  addiu      $a1, $zero, 0xD
    /* 5ABA0 8006ABA0 01000624 */  addiu      $a2, $zero, 0x1
    /* 5ABA4 8006ABA4 21384000 */  addu       $a3, $v0, $zero
    /* 5ABA8 8006ABA8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 5ABAC 8006ABAC 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5ABB0 8006ABB0 1400B0AF */   sw        $s0, 0x14($sp)
    /* 5ABB4 8006ABB4 5CA7010C */  jal        AddSLine__Fi
    /* 5ABB8 8006ABB8 03000424 */   addiu     $a0, $zero, 0x3
    /* 5ABBC 8006ABBC 14000224 */  addiu      $v0, $zero, 0x14
    /* 5ABC0 8006ABC0 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5ABC4 8006ABC4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5ABC8 8006ABC8 1800B08F */  lw         $s0, 0x18($sp)
    /* 5ABCC 8006ABCC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5ABD0 8006ABD0 0800E003 */  jr         $ra
    /* 5ABD4 8006ABD4 00000000 */   nop
endlabel S_StartSmith__Fv
