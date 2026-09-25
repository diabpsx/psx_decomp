.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartSBuy__Fv, 0x1D0

glabel S_StartSBuy__Fv
    /* 5ADE0 8006ADE0 3413848F */  lw         $a0, %gp_rel(StorePlrNo)($gp)
    /* 5ADE4 8006ADE4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5ADE8 8006ADE8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5ADEC 8006ADEC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5ADF0 8006ADF0 282180AF */  sw         $zero, %gp_rel(D_8011C8A8)($gp)
    /* 5ADF4 8006ADF4 00110400 */  sll        $v0, $a0, 4
    /* 5ADF8 8006ADF8 21104400 */  addu       $v0, $v0, $a0
    /* 5ADFC 8006ADFC C0100200 */  sll        $v0, $v0, 3
    /* 5AE00 8006AE00 23104400 */  subu       $v0, $v0, $a0
    /* 5AE04 8006AE04 00110200 */  sll        $v0, $v0, 4
    /* 5AE08 8006AE08 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 5AE0C 8006AE0C 21082200 */  addu       $at, $at, $v0
    /* 5AE10 8006AE10 54E42384 */  lh         $v1, %lo(_smithitem + 0x2C)($at)
    /* 5AE14 8006AE14 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5AE18 8006AE18 2A006210 */  beq        $v1, $v0, .L8006AEC4
    /* 5AE1C 8006AE1C 00110400 */   sll       $v0, $a0, 4
    /* 5AE20 8006AE20 21800000 */  addu       $s0, $zero, $zero
  .L8006AE24:
    /* 5AE24 8006AE24 21104400 */  addu       $v0, $v0, $a0
    /* 5AE28 8006AE28 C0100200 */  sll        $v0, $v0, 3
    /* 5AE2C 8006AE2C 23104400 */  subu       $v0, $v0, $a0
    /* 5AE30 8006AE30 00110200 */  sll        $v0, $v0, 4
    /* 5AE34 8006AE34 0E80053C */  lui        $a1, %hi(_smithitem)
    /* 5AE38 8006AE38 28E4A524 */  addiu      $a1, $a1, %lo(_smithitem)
    /* 5AE3C 8006AE3C 21280502 */  addu       $a1, $s0, $a1
    /* 5AE40 8006AE40 21284500 */  addu       $a1, $v0, $a1
    /* 5AE44 8006AE44 1280023C */  lui        $v0, %hi(options_pad)
    /* 5AE48 8006AE48 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 5AE4C 8006AE4C 6C001026 */  addiu      $s0, $s0, 0x6C
    /* 5AE50 8006AE50 40200200 */  sll        $a0, $v0, 1
    /* 5AE54 8006AE54 21208200 */  addu       $a0, $a0, $v0
    /* 5AE58 8006AE58 80200400 */  sll        $a0, $a0, 2
    /* 5AE5C 8006AE5C 21208200 */  addu       $a0, $a0, $v0
    /* 5AE60 8006AE60 00210400 */  sll        $a0, $a0, 4
    /* 5AE64 8006AE64 23208200 */  subu       $a0, $a0, $v0
    /* 5AE68 8006AE68 80200400 */  sll        $a0, $a0, 2
    /* 5AE6C 8006AE6C 21208200 */  addu       $a0, $a0, $v0
    /* 5AE70 8006AE70 C0200400 */  sll        $a0, $a0, 3
    /* 5AE74 8006AE74 0E80023C */  lui        $v0, %hi(plr)
    /* 5AE78 8006AE78 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 5AE7C 8006AE7C CAFD000C */  jal        SetItemMinStats__FPC12PlayerStructP10ItemStruct
    /* 5AE80 8006AE80 21208200 */   addu      $a0, $a0, $v0
    /* 5AE84 8006AE84 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5AE88 8006AE88 3413848F */  lw         $a0, %gp_rel(StorePlrNo)($gp)
    /* 5AE8C 8006AE8C 01004224 */  addiu      $v0, $v0, 0x1
    /* 5AE90 8006AE90 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5AE94 8006AE94 00110400 */  sll        $v0, $a0, 4
    /* 5AE98 8006AE98 21104400 */  addu       $v0, $v0, $a0
    /* 5AE9C 8006AE9C C0100200 */  sll        $v0, $v0, 3
    /* 5AEA0 8006AEA0 23104400 */  subu       $v0, $v0, $a0
    /* 5AEA4 8006AEA4 00110200 */  sll        $v0, $v0, 4
    /* 5AEA8 8006AEA8 21100202 */  addu       $v0, $s0, $v0
    /* 5AEAC 8006AEAC 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 5AEB0 8006AEB0 21082200 */  addu       $at, $at, $v0
    /* 5AEB4 8006AEB4 54E42384 */  lh         $v1, %lo(_smithitem + 0x2C)($at)
    /* 5AEB8 8006AEB8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5AEBC 8006AEBC D9FF6214 */  bne        $v1, $v0, .L8006AE24
    /* 5AEC0 8006AEC0 00110400 */   sll       $v0, $a0, 4
  .L8006AEC4:
    /* 5AEC4 8006AEC4 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5AEC8 8006AEC8 00000000 */  nop
    /* 5AECC 8006AECC 06004014 */  bnez       $v0, .L8006AEE8
    /* 5AED0 8006AED0 01000224 */   addiu     $v0, $zero, 0x1
    /* 5AED4 8006AED4 182180AF */  sw         $zero, %gp_rel(D_8011C898)($gp)
    /* 5AED8 8006AED8 5BBE010C */  jal        StartStore__Fc
    /* 5AEDC 8006AEDC 18000424 */   addiu     $a0, $zero, 0x18
    /* 5AEE0 8006AEE0 E7AB0108 */  j          .L8006AF9C
    /* 5AEE4 8006AEE4 00000000 */   nop
  .L8006AEE8:
    /* 5AEE8 8006AEE8 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5AEEC 8006AEEC 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5AEF0 8006AEF0 621382A3 */  sb         $v0, %gp_rel(stextscrl)($gp)
    /* 5AEF4 8006AEF4 142180AF */  sw         $zero, %gp_rel(D_8011C894)($gp)
    /* 5AEF8 8006AEF8 4AED010C */  jal        GetStr__Fi
    /* 5AEFC 8006AEFC 28020424 */   addiu     $a0, $zero, 0x228
    /* 5AF00 8006AF00 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5AF04 8006AF04 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5AF08 8006AF08 1280053C */  lui        $a1, %hi(myplr)
    /* 5AF0C 8006AF0C 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5AF10 8006AF10 21200002 */  addu       $a0, $s0, $zero
    /* 5AF14 8006AF14 40180500 */  sll        $v1, $a1, 1
    /* 5AF18 8006AF18 21186500 */  addu       $v1, $v1, $a1
    /* 5AF1C 8006AF1C 80180300 */  sll        $v1, $v1, 2
    /* 5AF20 8006AF20 21186500 */  addu       $v1, $v1, $a1
    /* 5AF24 8006AF24 00190300 */  sll        $v1, $v1, 4
    /* 5AF28 8006AF28 23186500 */  subu       $v1, $v1, $a1
    /* 5AF2C 8006AF2C 80180300 */  sll        $v1, $v1, 2
    /* 5AF30 8006AF30 21186500 */  addu       $v1, $v1, $a1
    /* 5AF34 8006AF34 C0180300 */  sll        $v1, $v1, 3
    /* 5AF38 8006AF38 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5AF3C 8006AF3C 21082300 */  addu       $at, $at, $v1
    /* 5AF40 8006AF40 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5AF44 8006AF44 9767000C */  jal        sprintf
    /* 5AF48 8006AF48 21284000 */   addu      $a1, $v0, $zero
    /* 5AF4C 8006AF4C 21200000 */  addu       $a0, $zero, $zero
    /* 5AF50 8006AF50 01000524 */  addiu      $a1, $zero, 0x1
    /* 5AF54 8006AF54 01000624 */  addiu      $a2, $zero, 0x1
    /* 5AF58 8006AF58 03000224 */  addiu      $v0, $zero, 0x3
    /* 5AF5C 8006AF5C 21380002 */  addu       $a3, $s0, $zero
    /* 5AF60 8006AF60 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5AF64 8006AF64 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5AF68 8006AF68 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5AF6C 8006AF6C 5CA7010C */  jal        AddSLine__Fi
    /* 5AF70 8006AF70 02000424 */   addiu     $a0, $zero, 0x2
    /* 5AF74 8006AF74 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5AF78 8006AF78 00000000 */  nop
    /* 5AF7C 8006AF7C FDFF4224 */  addiu      $v0, $v0, -0x3
    /* 5AF80 8006AF80 182182AF */  sw         $v0, %gp_rel(D_8011C898)($gp)
    /* 5AF84 8006AF84 02004104 */  bgez       $v0, .L8006AF90
    /* 5AF88 8006AF88 00000000 */   nop
    /* 5AF8C 8006AF8C 182180AF */  sw         $zero, %gp_rel(D_8011C898)($gp)
  .L8006AF90:
    /* 5AF90 8006AF90 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5AF94 8006AF94 F6AA010C */  jal        S_ScrollSBuy__Fi
    /* 5AF98 8006AF98 00000000 */   nop
  .L8006AF9C:
    /* 5AF9C 8006AF9C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5AFA0 8006AFA0 1800B08F */  lw         $s0, 0x18($sp)
    /* 5AFA4 8006AFA4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 5AFA8 8006AFA8 0800E003 */  jr         $ra
    /* 5AFAC 8006AFAC 00000000 */   nop
endlabel S_StartSBuy__Fv
