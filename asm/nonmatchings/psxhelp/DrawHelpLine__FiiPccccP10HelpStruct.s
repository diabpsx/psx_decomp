.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawHelpLine__FiiPccccP10HelpStruct, 0x214

glabel DrawHelpLine__FiiPccccP10HelpStruct
    /* 9E73C 800AE73C B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 9E740 800AE740 4400B5AF */  sw         $s5, 0x44($sp)
    /* 9E744 800AE744 21A88000 */  addu       $s5, $a0, $zero
    /* 9E748 800AE748 4800B6AF */  sw         $s6, 0x48($sp)
    /* 9E74C 800AE74C 21B0A000 */  addu       $s6, $a1, $zero
    /* 9E750 800AE750 3400B1AF */  sw         $s1, 0x34($sp)
    /* 9E754 800AE754 2188C000 */  addu       $s1, $a2, $zero
    /* 9E758 800AE758 3800B2AF */  sw         $s2, 0x38($sp)
    /* 9E75C 800AE75C 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 9E760 800AE760 6000B393 */  lbu        $s3, 0x60($sp)
    /* 9E764 800AE764 6800A38F */  lw         $v1, 0x68($sp)
    /* 9E768 800AE768 01000824 */  addiu      $t0, $zero, 0x1
    /* 9E76C 800AE76C 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 9E770 800AE770 4000B4AF */  sw         $s4, 0x40($sp)
    /* 9E774 800AE774 3000B0AF */  sw         $s0, 0x30($sp)
    /* 9E778 800AE778 00006280 */  lb         $v0, 0x0($v1)
    /* 9E77C 800AE77C 6400B493 */  lbu        $s4, 0x64($sp)
    /* 9E780 800AE780 42004814 */  bne        $v0, $t0, .L800AE88C
    /* 9E784 800AE784 2190E000 */   addu      $s2, $a3, $zero
    /* 9E788 800AE788 0400648C */  lw         $a0, 0x4($v1)
    /* 9E78C 800AE78C 92B9020C */  jal        GetControlKey__FiPb
    /* 9E790 800AE790 2800A527 */   addiu     $a1, $sp, 0x28
    /* 9E794 800AE794 2800A38F */  lw         $v1, 0x28($sp)
    /* 9E798 800AE798 00000000 */  nop
    /* 9E79C 800AE79C 0F006010 */  beqz       $v1, .L800AE7DC
    /* 9E7A0 800AE7A0 21804000 */   addu      $s0, $v0, $zero
    /* 9E7A4 800AE7A4 C6000424 */  addiu      $a0, $zero, 0xC6
    /* 9E7A8 800AE7A8 92B9020C */  jal        GetControlKey__FiPb
    /* 9E7AC 800AE7AC 2800A527 */   addiu     $a1, $sp, 0x28
    /* 9E7B0 800AE7B0 14004010 */  beqz       $v0, .L800AE804
    /* 9E7B4 800AE7B4 21304000 */   addu      $a2, $v0, $zero
    /* 9E7B8 800AE7B8 1000B1AF */  sw         $s1, 0x10($sp)
    /* 9E7BC 800AE7BC 0D80043C */  lui        $a0, %hi(tempstr)
    /* 9E7C0 800AE7C0 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 9E7C4 800AE7C4 1180053C */  lui        $a1, %hi(D_80110F68)
    /* 9E7C8 800AE7C8 680FA524 */  addiu      $a1, $a1, %lo(D_80110F68)
    /* 9E7CC 800AE7CC 9767000C */  jal        sprintf
    /* 9E7D0 800AE7D0 21380002 */   addu      $a3, $s0, $zero
    /* 9E7D4 800AE7D4 0DBA0208 */  j          .L800AE834
    /* 9E7D8 800AE7D8 00000000 */   nop
  .L800AE7DC:
    /* 9E7DC 800AE7DC 09000012 */  beqz       $s0, .L800AE804
    /* 9E7E0 800AE7E0 21300002 */   addu      $a2, $s0, $zero
    /* 9E7E4 800AE7E4 0D80043C */  lui        $a0, %hi(tempstr)
    /* 9E7E8 800AE7E8 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 9E7EC 800AE7EC 1280053C */  lui        $a1, %hi(D_8011B2EC)
    /* 9E7F0 800AE7F0 ECB2A524 */  addiu      $a1, $a1, %lo(D_8011B2EC)
    /* 9E7F4 800AE7F4 9767000C */  jal        sprintf
    /* 9E7F8 800AE7F8 21382002 */   addu      $a3, $s1, $zero
    /* 9E7FC 800AE7FC 0DBA0208 */  j          .L800AE834
    /* 9E800 800AE800 00000000 */   nop
  .L800AE804:
    /* 9E804 800AE804 0D80043C */  lui        $a0, %hi(tempstr)
    /* 9E808 800AE808 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 9E80C 800AE80C 1280053C */  lui        $a1, %hi(D_8011B2E4)
    /* 9E810 800AE810 E4B2A524 */  addiu      $a1, $a1, %lo(D_8011B2E4)
    /* 9E814 800AE814 1280123C */  lui        $s2, %hi(REDR)
    /* 9E818 800AE818 D7AB5292 */  lbu        $s2, %lo(REDR)($s2)
    /* 9E81C 800AE81C 1280133C */  lui        $s3, %hi(REDG)
    /* 9E820 800AE820 D8AB7392 */  lbu        $s3, %lo(REDG)($s3)
    /* 9E824 800AE824 1280143C */  lui        $s4, %hi(REDB)
    /* 9E828 800AE828 D9AB9492 */  lbu        $s4, %lo(REDB)($s4)
    /* 9E82C 800AE82C 9767000C */  jal        sprintf
    /* 9E830 800AE830 21302002 */   addu      $a2, $s1, $zero
  .L800AE834:
    /* 9E834 800AE834 0C80113C */  lui        $s1, %hi(MediumFont)
    /* 9E838 800AE838 D8823126 */  addiu      $s1, $s1, %lo(MediumFont)
    /* 9E83C 800AE83C 21202002 */  addu       $a0, $s1, $zero
    /* 9E840 800AE840 2128A002 */  addu       $a1, $s5, $zero
    /* 9E844 800AE844 2130C002 */  addu       $a2, $s6, $zero
    /* 9E848 800AE848 0D80103C */  lui        $s0, %hi(tempstr)
    /* 9E84C 800AE84C 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 9E850 800AE850 21380002 */  addu       $a3, $s0, $zero
    /* 9E854 800AE854 1280023C */  lui        $v0, %hi(D_8011C73C)
    /* 9E858 800AE858 3CC74224 */  addiu      $v0, $v0, %lo(D_8011C73C)
    /* 9E85C 800AE85C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9E860 800AE860 FF004232 */  andi       $v0, $s2, 0xFF
    /* 9E864 800AE864 1800A2AF */  sw         $v0, 0x18($sp)
    /* 9E868 800AE868 FF006232 */  andi       $v0, $s3, 0xFF
    /* 9E86C 800AE86C 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 9E870 800AE870 FF008232 */  andi       $v0, $s4, 0xFF
    /* 9E874 800AE874 1000A0AF */  sw         $zero, 0x10($sp)
    /* 9E878 800AE878 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9E87C 800AE87C 2000A2AF */   sw        $v0, 0x20($sp)
    /* 9E880 800AE880 21202002 */  addu       $a0, $s1, $zero
    /* 9E884 800AE884 47BA0208 */  j          .L800AE91C
    /* 9E888 800AE888 21280002 */   addu      $a1, $s0, $zero
  .L800AE88C:
    /* 9E88C 800AE88C 780B828F */  lw         $v0, %gp_rel(displayinghelp)($gp)
    /* 9E890 800AE890 00000000 */  nop
    /* 9E894 800AE894 0F004010 */  beqz       $v0, .L800AE8D4
    /* 9E898 800AE898 2128A002 */   addu      $a1, $s5, $zero
    /* 9E89C 800AE89C 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9E8A0 800AE8A0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9E8A4 800AE8A4 2130C002 */  addu       $a2, $s6, $zero
    /* 9E8A8 800AE8A8 21382002 */  addu       $a3, $s1, $zero
    /* 9E8AC 800AE8AC 1280023C */  lui        $v0, %hi(D_8011C73C)
    /* 9E8B0 800AE8B0 3CC74224 */  addiu      $v0, $v0, %lo(D_8011C73C)
    /* 9E8B4 800AE8B4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9E8B8 800AE8B8 FF004232 */  andi       $v0, $s2, 0xFF
    /* 9E8BC 800AE8BC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 9E8C0 800AE8C0 FF006232 */  andi       $v0, $s3, 0xFF
    /* 9E8C4 800AE8C4 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 9E8C8 800AE8C8 FF008232 */  andi       $v0, $s4, 0xFF
    /* 9E8CC 800AE8CC 42BA0208 */  j          .L800AE908
    /* 9E8D0 800AE8D0 1000A8AF */   sw        $t0, 0x10($sp)
  .L800AE8D4:
    /* 9E8D4 800AE8D4 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9E8D8 800AE8D8 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9E8DC 800AE8DC 2130C002 */  addu       $a2, $s6, $zero
    /* 9E8E0 800AE8E0 21382002 */  addu       $a3, $s1, $zero
    /* 9E8E4 800AE8E4 1280023C */  lui        $v0, %hi(D_8011C73C)
    /* 9E8E8 800AE8E8 3CC74224 */  addiu      $v0, $v0, %lo(D_8011C73C)
    /* 9E8EC 800AE8EC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9E8F0 800AE8F0 FF004232 */  andi       $v0, $s2, 0xFF
    /* 9E8F4 800AE8F4 1800A2AF */  sw         $v0, 0x18($sp)
    /* 9E8F8 800AE8F8 FF006232 */  andi       $v0, $s3, 0xFF
    /* 9E8FC 800AE8FC 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 9E900 800AE900 FF008232 */  andi       $v0, $s4, 0xFF
    /* 9E904 800AE904 1000A0AF */  sw         $zero, 0x10($sp)
  .L800AE908:
    /* 9E908 800AE908 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9E90C 800AE90C 2000A2AF */   sw        $v0, 0x20($sp)
    /* 9E910 800AE910 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9E914 800AE914 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 9E918 800AE918 21282002 */  addu       $a1, $s1, $zero
  .L800AE91C:
    /* 9E91C 800AE91C A92A020C */  jal        GetStrWidth__5CFontPc
    /* 9E920 800AE920 00000000 */   nop
    /* 9E924 800AE924 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 9E928 800AE928 4800B68F */  lw         $s6, 0x48($sp)
    /* 9E92C 800AE92C 4400B58F */  lw         $s5, 0x44($sp)
    /* 9E930 800AE930 4000B48F */  lw         $s4, 0x40($sp)
    /* 9E934 800AE934 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 9E938 800AE938 3800B28F */  lw         $s2, 0x38($sp)
    /* 9E93C 800AE93C 3400B18F */  lw         $s1, 0x34($sp)
    /* 9E940 800AE940 3000B08F */  lw         $s0, 0x30($sp)
    /* 9E944 800AE944 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 9E948 800AE948 0800E003 */  jr         $ra
    /* 9E94C 800AE94C 00000000 */   nop
endlabel DrawHelpLine__FiiPccccP10HelpStruct
