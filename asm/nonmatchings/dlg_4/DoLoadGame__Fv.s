.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoLoadGame__Fv, 0xA4

glabel DoLoadGame__Fv
    /* 1FBF8 801597F0 900C848F */  lw         $a0, %gp_rel(DiabloGameFile)($gp)
    /* 1FBFC 801597F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1FC00 801597F8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1FC04 801597FC 1280013C */  lui        $at, %hi(DoLoadedGame)
    /* 1FC08 80159800 84B120AC */  sw         $zero, %lo(DoLoadedGame)($at)
    /* 1FC0C 80159804 7269050C */  jal        GetLoadStatusMessage__FPc
    /* 1FC10 80159808 00000000 */   nop
    /* 1FC14 8015980C 1D004010 */  beqz       $v0, .L80159884
    /* 1FC18 80159810 00000000 */   nop
    /* 1FC1C 80159814 E00C848F */  lw         $a0, %gp_rel(current_card)($gp)
    /* 1FC20 80159818 900C858F */  lw         $a1, %gp_rel(DiabloGameFile)($gp)
    /* 1FC24 8015981C 6465050C */  jal        GetFileNumber__FiPc
    /* 1FC28 80159820 00000000 */   nop
    /* 1FC2C 80159824 01000424 */  addiu      $a0, $zero, 0x1
    /* 1FC30 80159828 E00C858F */  lw         $a1, %gp_rel(current_card)($gp)
    /* 1FC34 8015982C 6F70050C */  jal        PSX_GM_LoadGame__FUcii
    /* 1FC38 80159830 21304000 */   addu      $a2, $v0, $zero
    /* 1FC3C 80159834 21184000 */  addu       $v1, $v0, $zero
    /* 1FC40 80159838 09006010 */  beqz       $v1, .L80159860
    /* 1FC44 8015983C FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 1FC48 80159840 02006214 */  bne        $v1, $v0, .L8015984C
    /* 1FC4C 80159844 5D020224 */   addiu     $v0, $zero, 0x25D
    /* 1FC50 80159848 5C020224 */  addiu      $v0, $zero, 0x25C
  .L8015984C:
    /* 1FC54 8015984C D80C82AF */  sw         $v0, %gp_rel(AlertTxt)($gp)
    /* 1FC58 80159850 1280013C */  lui        $at, %hi(DoLoadedGame)
    /* 1FC5C 80159854 84B120AC */  sw         $zero, %lo(DoLoadedGame)($at)
    /* 1FC60 80159858 21660508 */  j          .L80159884
    /* 1FC64 8015985C 00000000 */   nop
  .L80159860:
    /* 1FC68 80159860 D80C80AF */  sw         $zero, %gp_rel(AlertTxt)($gp)
    /* 1FC6C 80159864 5695020C */  jal        MemcardOFF__Fv
    /* 1FC70 80159868 00000000 */   nop
    /* 1FC74 8015986C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1FC78 80159870 1280013C */  lui        $at, %hi(DoLoadedGame)
    /* 1FC7C 80159874 84B122AC */  sw         $v0, %lo(DoLoadedGame)($at)
    /* 1FC80 80159878 02000224 */  addiu      $v0, $zero, 0x2
    /* 1FC84 8015987C 1280013C */  lui        $at, %hi(FeFlag)
    /* 1FC88 80159880 74B322A0 */  sb         $v0, %lo(FeFlag)($at)
  .L80159884:
    /* 1FC8C 80159884 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1FC90 80159888 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1FC94 8015988C 0800E003 */  jr         $ra
    /* 1FC98 80159890 00000000 */   nop
endlabel DoLoadGame__Fv
