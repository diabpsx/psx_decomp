.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitGamePadVars__Fv, 0x18C

glabel InitGamePadVars__Fv
    /* 6AE80 8007AE80 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6AE84 8007AE84 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6AE88 8007AE88 481480AF */  sw         $zero, %gp_rel(D_8011BBC8)($gp)
    /* 6AE8C 8007AE8C E385020C */  jal        RemoveTargetCursor__Fi
    /* 6AE90 8007AE90 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 6AE94 8007AE94 0381020C */  jal        TeleStop__Fi
    /* 6AE98 8007AE98 21200000 */   addu      $a0, $zero, $zero
    /* 6AE9C 8007AE9C 0381020C */  jal        TeleStop__Fi
    /* 6AEA0 8007AEA0 01000424 */   addiu     $a0, $zero, 0x1
    /* 6AEA4 8007AEA4 1280043C */  lui        $a0, %hi(_spselflag)
    /* 6AEA8 8007AEA8 50B6848C */  lw         $a0, %lo(_spselflag)($a0)
    /* 6AEAC 8007AEAC 1280013C */  lui        $at, %hi(ScrollFlag)
    /* 6AEB0 8007AEB0 B8B820AC */  sw         $zero, %lo(ScrollFlag)($at)
    /* 6AEB4 8007AEB4 1280013C */  lui        $at, %hi(ScrollFlag + 0x4)
    /* 6AEB8 8007AEB8 BCB820AC */  sw         $zero, %lo(ScrollFlag + 0x4)($at)
    /* 6AEBC 8007AEBC 5E1480A3 */  sb         $zero, %gp_rel(automapmoved)($gp)
    /* 6AEC0 8007AEC0 03008010 */  beqz       $a0, .L8007AED0
    /* 6AEC4 8007AEC4 00000000 */   nop
    /* 6AEC8 8007AEC8 5281000C */  jal        TSK_Kill
    /* 6AECC 8007AECC 00000000 */   nop
  .L8007AED0:
    /* 6AED0 8007AED0 1280043C */  lui        $a0, %hi(_spselflag + 0x4)
    /* 6AED4 8007AED4 54B6848C */  lw         $a0, %lo(_spselflag + 0x4)($a0)
    /* 6AED8 8007AED8 00000000 */  nop
    /* 6AEDC 8007AEDC 03008010 */  beqz       $a0, .L8007AEEC
    /* 6AEE0 8007AEE0 00000000 */   nop
    /* 6AEE4 8007AEE4 5281000C */  jal        TSK_Kill
    /* 6AEE8 8007AEE8 00000000 */   nop
  .L8007AEEC:
    /* 6AEEC 8007AEEC 1280013C */  lui        $at, %hi(_spselflag + 0x4)
    /* 6AEF0 8007AEF0 54B620AC */  sw         $zero, %lo(_spselflag + 0x4)($at)
    /* 6AEF4 8007AEF4 1280013C */  lui        $at, %hi(_spselflag)
    /* 6AEF8 8007AEF8 50B620AC */  sw         $zero, %lo(_spselflag)($at)
    /* 6AEFC 8007AEFC 441480A3 */  sb         $zero, %gp_rel(_SpdBeltSelFlag)($gp)
    /* 6AF00 8007AF00 451480A3 */  sb         $zero, %gp_rel(_SpdBeltSelFlag + 0x1)($gp)
    /* 6AF04 8007AF04 1280013C */  lui        $at, %hi(PauseMode)
    /* 6AF08 8007AF08 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 6AF0C 8007AF0C 1280013C */  lui        $at, %hi(chrflag)
    /* 6AF10 8007AF10 C0B620A0 */  sb         $zero, %lo(chrflag)($at)
    /* 6AF14 8007AF14 1280013C */  lui        $at, %hi(invflag)
    /* 6AF18 8007AF18 2CC320A0 */  sb         $zero, %lo(invflag)($at)
    /* 6AF1C 8007AF1C 1280013C */  lui        $at, %hi(optionsflag)
    /* 6AF20 8007AF20 48B220AC */  sw         $zero, %lo(optionsflag)($at)
    /* 6AF24 8007AF24 1280013C */  lui        $at, %hi(sbookflag)
    /* 6AF28 8007AF28 C6B620A0 */  sb         $zero, %lo(sbookflag)($at)
    /* 6AF2C 8007AF2C 1280013C */  lui        $at, %hi(questlog)
    /* 6AF30 8007AF30 29BA20A0 */  sb         $zero, %lo(questlog)($at)
    /* 6AF34 8007AF34 1280013C */  lui        $at, %hi(qtextflag)
    /* 6AF38 8007AF38 60B920A0 */  sb         $zero, %lo(qtextflag)($at)
    /* 6AF3C 8007AF3C 1280013C */  lui        $at, %hi(stextflag)
    /* 6AF40 8007AF40 E0BA20A0 */  sb         $zero, %lo(stextflag)($at)
    /* 6AF44 8007AF44 36F7000C */  jal        ClrDiabloMsg__Fv
    /* 6AF48 8007AF48 00000000 */   nop
    /* 6AF4C 8007AF4C E4DF010C */  jal        ClrCursor__Fi
    /* 6AF50 8007AF50 21200000 */   addu      $a0, $zero, $zero
    /* 6AF54 8007AF54 E4DF010C */  jal        ClrCursor__Fi
    /* 6AF58 8007AF58 01000424 */   addiu     $a0, $zero, 0x1
    /* 6AF5C 8007AF5C 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 6AF60 8007AF60 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 6AF64 8007AF64 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 6AF68 8007AF68 1280013C */  lui        $at, %hi(_pcursplr)
    /* 6AF6C 8007AF6C 6CB722A0 */  sb         $v0, %lo(_pcursplr)($at)
    /* 6AF70 8007AF70 1280013C */  lui        $at, %hi(_pcursplr + 0x1)
    /* 6AF74 8007AF74 6DB722A0 */  sb         $v0, %lo(_pcursplr + 0x1)($at)
    /* 6AF78 8007AF78 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* 6AF7C 8007AF7C A3B920A0 */  sb         $zero, %lo(gbActivePlayers)($at)
    /* 6AF80 8007AF80 11006010 */  beqz       $v1, .L8007AFC8
    /* 6AF84 8007AF84 00000000 */   nop
    /* 6AF88 8007AF88 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 6AF8C 8007AF8C 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 6AF90 8007AF90 00000000 */  nop
    /* 6AF94 8007AF94 03004010 */  beqz       $v0, .L8007AFA4
    /* 6AF98 8007AF98 01000224 */   addiu     $v0, $zero, 0x1
    /* 6AF9C 8007AF9C 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* 6AFA0 8007AFA0 A3B922A0 */  sb         $v0, %lo(gbActivePlayers)($at)
  .L8007AFA4:
    /* 6AFA4 8007AFA4 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 6AFA8 8007AFA8 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 6AFAC 8007AFAC 00000000 */  nop
    /* 6AFB0 8007AFB0 0E004010 */  beqz       $v0, .L8007AFEC
    /* 6AFB4 8007AFB4 05000424 */   addiu     $a0, $zero, 0x5
    /* 6AFB8 8007AFB8 1280023C */  lui        $v0, %hi(gbActivePlayers)
    /* 6AFBC 8007AFBC A3B94290 */  lbu        $v0, %lo(gbActivePlayers)($v0)
    /* 6AFC0 8007AFC0 F8EB0108 */  j          .L8007AFE0
    /* 6AFC4 8007AFC4 01004224 */   addiu     $v0, $v0, 0x1
  .L8007AFC8:
    /* 6AFC8 8007AFC8 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 6AFCC 8007AFCC 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 6AFD0 8007AFD0 0E80013C */  lui        $at, %hi(plr + 0x1A05)
    /* 6AFD4 8007AFD4 3DBF20A0 */  sb         $zero, %lo(plr + 0x1A05)($at)
    /* 6AFD8 8007AFD8 03004010 */  beqz       $v0, .L8007AFE8
    /* 6AFDC 8007AFDC 01000224 */   addiu     $v0, $zero, 0x1
  .L8007AFE0:
    /* 6AFE0 8007AFE0 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* 6AFE4 8007AFE4 A3B922A0 */  sb         $v0, %lo(gbActivePlayers)($at)
  .L8007AFE8:
    /* 6AFE8 8007AFE8 05000424 */  addiu      $a0, $zero, 0x5
  .L8007AFEC:
    /* 6AFEC 8007AFEC 21280000 */  addu       $a1, $zero, $zero
    /* 6AFF0 8007AFF0 21300000 */  addu       $a2, $zero, $zero
    /* 6AFF4 8007AFF4 53EB010C */  jal        PostGamePad__Fiiii
    /* 6AFF8 8007AFF8 21380000 */   addu      $a3, $zero, $zero
    /* 6AFFC 8007AFFC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6B000 8007B000 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6B004 8007B004 0800E003 */  jr         $ra
    /* 6B008 8007B008 00000000 */   nop
endlabel InitGamePadVars__Fv
