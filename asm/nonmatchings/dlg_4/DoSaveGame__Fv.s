.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoSaveGame__Fv, 0x178

glabel DoSaveGame__Fv
    /* 1FA80 80159678 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 1FA84 8015967C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 1FA88 80159680 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 1FA8C 80159684 6400BFAF */  sw         $ra, 0x64($sp)
    /* 1FA90 80159688 6000B2AF */  sw         $s2, 0x60($sp)
    /* 1FA94 8015968C 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 1FA98 80159690 5800B0AF */  sw         $s0, 0x58($sp)
    /* 1FA9C 80159694 1480063C */  lui        $a2, %hi(func_801436A0)
    /* 1FAA0 80159698 A036C624 */  addiu      $a2, $a2, %lo(func_801436A0)
    /* 1FAA4 8015969C 0000C38C */  lw         $v1, 0x0($a2)
    /* 1FAA8 801596A0 0400C48C */  lw         $a0, 0x4($a2)
    /* 1FAAC 801596A4 0800C58C */  lw         $a1, 0x8($a2)
    /* 1FAB0 801596A8 4800A3AF */  sw         $v1, 0x48($sp)
    /* 1FAB4 801596AC 4C00A4AF */  sw         $a0, 0x4C($sp)
    /* 1FAB8 801596B0 5000A5AF */  sw         $a1, 0x50($sp)
    /* 1FABC 801596B4 1E004014 */  bnez       $v0, .L80159730
    /* 1FAC0 801596B8 00000000 */   nop
    /* 1FAC4 801596BC 5A6E050C */  jal        GetDiabloStr__Fv
    /* 1FAC8 801596C0 00000000 */   nop
    /* 1FACC 801596C4 92020424 */  addiu      $a0, $zero, 0x292
    /* 1FAD0 801596C8 4AED010C */  jal        GetStr__Fi
    /* 1FAD4 801596CC 21804000 */   addu      $s0, $v0, $zero
    /* 1FAD8 801596D0 90020424 */  addiu      $a0, $zero, 0x290
    /* 1FADC 801596D4 4AED010C */  jal        GetStr__Fi
    /* 1FAE0 801596D8 21884000 */   addu      $s1, $v0, $zero
    /* 1FAE4 801596DC 2800A427 */  addiu      $a0, $sp, 0x28
    /* 1FAE8 801596E0 1480053C */  lui        $a1, %hi(func_801436A0 + 0xC)
    /* 1FAEC 801596E4 AC36A524 */  addiu      $a1, $a1, %lo(func_801436A0 + 0xC)
    /* 1FAF0 801596E8 21300002 */  addu       $a2, $s0, $zero
    /* 1FAF4 801596EC 0E80083C */  lui        $t0, %hi(plr + 0x13C)
    /* 1FAF8 801596F0 74A60825 */  addiu      $t0, $t0, %lo(plr + 0x13C)
    /* 1FAFC 801596F4 00000981 */  lb         $t1, 0x0($t0)
    /* 1FB00 801596F8 0E80033C */  lui        $v1, %hi(plr + 0xF6)
    /* 1FB04 801596FC 2EA66380 */  lb         $v1, %lo(plr + 0xF6)($v1)
    /* 1FB08 80159700 21382002 */  addu       $a3, $s1, $zero
    /* 1FB0C 80159704 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1FB10 80159708 80180300 */  sll        $v1, $v1, 2
    /* 1FB14 8015970C 21186400 */  addu       $v1, $v1, $a0
    /* 1FB18 80159710 1400A9AF */  sw         $t1, 0x14($sp)
    /* 1FB1C 80159714 2000628C */  lw         $v0, 0x20($v1)
    /* 1FB20 80159718 9AFF0825 */  addiu      $t0, $t0, -0x66
    /* 1FB24 8015971C 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 1FB28 80159720 9767000C */  jal        sprintf
    /* 1FB2C 80159724 1800A2AF */   sw        $v0, 0x18($sp)
    /* 1FB30 80159728 F1650508 */  j          .L801597C4
    /* 1FB34 8015972C 00000000 */   nop
  .L80159730:
    /* 1FB38 80159730 5A6E050C */  jal        GetDiabloStr__Fv
    /* 1FB3C 80159734 00000000 */   nop
    /* 1FB40 80159738 92020424 */  addiu      $a0, $zero, 0x292
    /* 1FB44 8015973C 4AED010C */  jal        GetStr__Fi
    /* 1FB48 80159740 21884000 */   addu      $s1, $v0, $zero
    /* 1FB4C 80159744 90020424 */  addiu      $a0, $zero, 0x290
    /* 1FB50 80159748 4AED010C */  jal        GetStr__Fi
    /* 1FB54 8015974C 21904000 */   addu      $s2, $v0, $zero
    /* 1FB58 80159750 90020424 */  addiu      $a0, $zero, 0x290
    /* 1FB5C 80159754 4AED010C */  jal        GetStr__Fi
    /* 1FB60 80159758 21804000 */   addu      $s0, $v0, $zero
    /* 1FB64 8015975C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 1FB68 80159760 0E80063C */  lui        $a2, %hi(plr + 0x13C)
    /* 1FB6C 80159764 74A6C680 */  lb         $a2, %lo(plr + 0x13C)($a2)
    /* 1FB70 80159768 0E80033C */  lui        $v1, %hi(plr + 0xF6)
    /* 1FB74 8015976C 2EA66380 */  lb         $v1, %lo(plr + 0xF6)($v1)
    /* 1FB78 80159770 0E80073C */  lui        $a3, %hi(plr + 0x1B24)
    /* 1FB7C 80159774 5CC0E780 */  lb         $a3, %lo(plr + 0x1B24)($a3)
    /* 1FB80 80159778 1480053C */  lui        $a1, %hi(func_801436A0 + 0x20)
    /* 1FB84 8015977C C036A524 */  addiu      $a1, $a1, %lo(func_801436A0 + 0x20)
    /* 1FB88 80159780 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1FB8C 80159784 80180300 */  sll        $v1, $v1, 2
    /* 1FB90 80159788 21186400 */  addu       $v1, $v1, $a0
    /* 1FB94 8015978C 1400A6AF */  sw         $a2, 0x14($sp)
    /* 1FB98 80159790 2000688C */  lw         $t0, 0x20($v1)
    /* 1FB9C 80159794 0E80033C */  lui        $v1, %hi(plr + 0x1ADE)
    /* 1FBA0 80159798 16C06380 */  lb         $v1, %lo(plr + 0x1ADE)($v1)
    /* 1FBA4 8015979C 21302002 */  addu       $a2, $s1, $zero
    /* 1FBA8 801597A0 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 1FBAC 801597A4 2000A7AF */  sw         $a3, 0x20($sp)
    /* 1FBB0 801597A8 80180300 */  sll        $v1, $v1, 2
    /* 1FBB4 801597AC 21186400 */  addu       $v1, $v1, $a0
    /* 1FBB8 801597B0 1800A8AF */  sw         $t0, 0x18($sp)
    /* 1FBBC 801597B4 2000628C */  lw         $v0, 0x20($v1)
    /* 1FBC0 801597B8 21384002 */  addu       $a3, $s2, $zero
    /* 1FBC4 801597BC 9767000C */  jal        sprintf
    /* 1FBC8 801597C0 2400A2AF */   sw        $v0, 0x24($sp)
  .L801597C4:
    /* 1FBCC 801597C4 E00C848F */  lw         $a0, %gp_rel(current_card)($gp)
    /* 1FBD0 801597C8 900C858F */  lw         $a1, %gp_rel(DiabloGameFile)($gp)
    /* 1FBD4 801597CC 176F050C */  jal        PSX_GM_SaveGame__FiPcT1
    /* 1FBD8 801597D0 2800A627 */   addiu     $a2, $sp, 0x28
    /* 1FBDC 801597D4 6400BF8F */  lw         $ra, 0x64($sp)
    /* 1FBE0 801597D8 6000B28F */  lw         $s2, 0x60($sp)
    /* 1FBE4 801597DC 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 1FBE8 801597E0 5800B08F */  lw         $s0, 0x58($sp)
    /* 1FBEC 801597E4 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 1FBF0 801597E8 0800E003 */  jr         $ra
    /* 1FBF4 801597EC 00000000 */   nop
endlabel DoSaveGame__Fv
