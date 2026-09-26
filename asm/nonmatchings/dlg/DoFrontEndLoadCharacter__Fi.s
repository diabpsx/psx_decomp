.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoFrontEndLoadCharacter__Fi, 0x58

glabel DoFrontEndLoadCharacter__Fi
    /* 1FC9C 80159894 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1FCA0 80159898 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1FCA4 8015989C 21888000 */  addu       $s1, $a0, $zero
    /* 1FCA8 801598A0 980C848F */  lw         $a0, %gp_rel(DiabloCharacterFile)($gp)
    /* 1FCAC 801598A4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1FCB0 801598A8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1FCB4 801598AC 7269050C */  jal        GetLoadStatusMessage__FPc
    /* 1FCB8 801598B0 FFFF1024 */   addiu     $s0, $zero, -0x1
    /* 1FCBC 801598B4 04004010 */  beqz       $v0, .L801598C8
    /* 1FCC0 801598B8 00000000 */   nop
    /* 1FCC4 801598BC BA70050C */  jal        PSX_CH_LoadGame__Fi
    /* 1FCC8 801598C0 21202002 */   addu      $a0, $s1, $zero
    /* 1FCCC 801598C4 21800000 */  addu       $s0, $zero, $zero
  .L801598C8:
    /* 1FCD0 801598C8 5695020C */  jal        MemcardOFF__Fv
    /* 1FCD4 801598CC 00000000 */   nop
    /* 1FCD8 801598D0 21100002 */  addu       $v0, $s0, $zero
    /* 1FCDC 801598D4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1FCE0 801598D8 1400B18F */  lw         $s1, 0x14($sp)
    /* 1FCE4 801598DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 1FCE8 801598E0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1FCEC 801598E4 0800E003 */  jr         $ra
    /* 1FCF0 801598E8 00000000 */   nop
endlabel DoFrontEndLoadCharacter__Fi
