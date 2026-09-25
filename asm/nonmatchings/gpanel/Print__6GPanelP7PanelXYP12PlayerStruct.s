.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Print__6GPanelP7PanelXYP12PlayerStruct, 0x118

glabel Print__6GPanelP7PanelXYP12PlayerStruct
    /* 88830 80098830 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 88834 80098834 1000B0AF */  sw         $s0, 0x10($sp)
    /* 88838 80098838 21808000 */  addu       $s0, $a0, $zero
    /* 8883C 8009883C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 88840 80098840 2188A000 */  addu       $s1, $a1, $zero
    /* 88844 80098844 1800B2AF */  sw         $s2, 0x18($sp)
    /* 88848 80098848 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 8884C 8009884C C16E020C */  jal        GLUE_Finished__Fv
    /* 88850 80098850 2190C000 */   addu      $s2, $a2, $zero
    /* 88854 80098854 35004014 */  bnez       $v0, .L8009892C
    /* 88858 80098858 00000000 */   nop
    /* 8885C 8009885C 1280023C */  lui        $v0, %hi(stextflag)
    /* 88860 80098860 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 88864 80098864 00000000 */  nop
    /* 88868 80098868 30004014 */  bnez       $v0, .L8009892C
    /* 8886C 8009886C 00000000 */   nop
    /* 88870 80098870 1280023C */  lui        $v0, %hi(qtextflag)
    /* 88874 80098874 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 88878 80098878 00000000 */  nop
    /* 8887C 8009887C 2B004014 */  bnez       $v0, .L8009892C
    /* 88880 80098880 00000000 */   nop
    /* 88884 80098884 1280023C */  lui        $v0, %hi(chrflag)
    /* 88888 80098888 C0B64290 */  lbu        $v0, %lo(chrflag)($v0)
    /* 8888C 8009888C 00000000 */  nop
    /* 88890 80098890 1E004014 */  bnez       $v0, .L8009890C
    /* 88894 80098894 00000000 */   nop
    /* 88898 80098898 1280023C */  lui        $v0, %hi(questlog)
    /* 8889C 8009889C 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 888A0 800988A0 00000000 */  nop
    /* 888A4 800988A4 19004014 */  bnez       $v0, .L8009890C
    /* 888A8 800988A8 00000000 */   nop
    /* 888AC 800988AC 1280023C */  lui        $v0, %hi(invflag)
    /* 888B0 800988B0 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 888B4 800988B4 00000000 */  nop
    /* 888B8 800988B8 14004014 */  bnez       $v0, .L8009890C
    /* 888BC 800988BC 21200002 */   addu      $a0, $s0, $zero
    /* 888C0 800988C0 21282002 */  addu       $a1, $s1, $zero
    /* 888C4 800988C4 9D5D020C */  jal        DrawFlask__6GPanelP7PanelXYP12PlayerStruct
    /* 888C8 800988C8 21304002 */   addu      $a2, $s2, $zero
    /* 888CC 800988CC 21200002 */  addu       $a0, $s0, $zero
    /* 888D0 800988D0 21282002 */  addu       $a1, $s1, $zero
    /* 888D4 800988D4 9360020C */  jal        DrawSpell__6GPanelP7PanelXYP12PlayerStruct
    /* 888D8 800988D8 21304002 */   addu      $a2, $s2, $zero
    /* 888DC 800988DC 21200002 */  addu       $a0, $s0, $zero
    /* 888E0 800988E0 21282002 */  addu       $a1, $s1, $zero
    /* 888E4 800988E4 C85E020C */  jal        DrawSpeedBar__6GPanelP7PanelXYP12PlayerStruct
    /* 888E8 800988E8 21304002 */   addu      $a2, $s2, $zero
    /* 888EC 800988EC 21200002 */  addu       $a0, $s0, $zero
    /* 888F0 800988F0 21282002 */  addu       $a1, $s1, $zero
    /* 888F4 800988F4 FA60020C */  jal        DrawMsgWindow__6GPanelP7PanelXYP12PlayerStruct
    /* 888F8 800988F8 21304002 */   addu      $a2, $s2, $zero
    /* 888FC 800988FC 21200002 */  addu       $a0, $s0, $zero
    /* 88900 80098900 21282002 */  addu       $a1, $s1, $zero
    /* 88904 80098904 C161020C */  jal        DrawDurIcon__6GPanelP7PanelXYP12PlayerStruct
    /* 88908 80098908 21304002 */   addu      $a2, $s2, $zero
  .L8009890C:
    /* 8890C 8009890C 0000028E */  lw         $v0, 0x0($s0)
    /* 88910 80098910 0400038E */  lw         $v1, 0x4($s0)
    /* 88914 80098914 01004224 */  addiu      $v0, $v0, 0x1
    /* 88918 80098918 1F004230 */  andi       $v0, $v0, 0x1F
    /* 8891C 8009891C 01006324 */  addiu      $v1, $v1, 0x1
    /* 88920 80098920 1F006330 */  andi       $v1, $v1, 0x1F
    /* 88924 80098924 000002AE */  sw         $v0, 0x0($s0)
    /* 88928 80098928 040003AE */  sw         $v1, 0x4($s0)
  .L8009892C:
    /* 8892C 8009892C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 88930 80098930 1800B28F */  lw         $s2, 0x18($sp)
    /* 88934 80098934 1400B18F */  lw         $s1, 0x14($sp)
    /* 88938 80098938 1000B08F */  lw         $s0, 0x10($sp)
    /* 8893C 8009893C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 88940 80098940 0800E003 */  jr         $ra
    /* 88944 80098944 00000000 */   nop
endlabel Print__6GPanelP7PanelXYP12PlayerStruct
