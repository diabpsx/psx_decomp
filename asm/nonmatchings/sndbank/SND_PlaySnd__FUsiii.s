.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SND_PlaySnd__FUsiii, 0x218

glabel SND_PlaySnd__FUsiii
    /* 8A79C 8009A79C 8006828F */  lw         $v0, %gp_rel(D_8011AE00)($gp)
    /* 8A7A0 8009A7A0 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 8A7A4 8009A7A4 5000B0AF */  sw         $s0, 0x50($sp)
    /* 8A7A8 8009A7A8 2180A000 */  addu       $s0, $a1, $zero
    /* 8A7AC 8009A7AC 6800B6AF */  sw         $s6, 0x68($sp)
    /* 8A7B0 8009A7B0 21B0C000 */  addu       $s6, $a2, $zero
    /* 8A7B4 8009A7B4 6C00B7AF */  sw         $s7, 0x6C($sp)
    /* 8A7B8 8009A7B8 21B8E000 */  addu       $s7, $a3, $zero
    /* 8A7BC 8009A7BC 6000B4AF */  sw         $s4, 0x60($sp)
    /* 8A7C0 8009A7C0 21A08000 */  addu       $s4, $a0, $zero
    /* 8A7C4 8009A7C4 7000BFAF */  sw         $ra, 0x70($sp)
    /* 8A7C8 8009A7C8 6400B5AF */  sw         $s5, 0x64($sp)
    /* 8A7CC 8009A7CC 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 8A7D0 8009A7D0 5800B2AF */  sw         $s2, 0x58($sp)
    /* 8A7D4 8009A7D4 06004014 */  bnez       $v0, .L8009A7F0
    /* 8A7D8 8009A7D8 5400B1AF */   sw        $s1, 0x54($sp)
    /* 8A7DC 8009A7DC 21200000 */  addu       $a0, $zero, $zero
    /* 8A7E0 8009A7E0 1180053C */  lui        $a1, %hi(D_8011099C)
    /* 8A7E4 8009A7E4 9C09A524 */  addiu      $a1, $a1, %lo(D_8011099C)
    /* 8A7E8 8009A7E8 A583000C */  jal        DBG_Error
    /* 8A7EC 8009A7EC F3010624 */   addiu     $a2, $zero, 0x1F3
  .L8009A7F0:
    /* 8A7F0 8009A7F0 9291020C */  jal        IsGameLoading__Fv
    /* 8A7F4 8009A7F4 21A80000 */   addu      $s5, $zero, $zero
    /* 8A7F8 8009A7F8 01004238 */  xori       $v0, $v0, 0x1
    /* 8A7FC 8009A7FC 60004010 */  beqz       $v0, .L8009A980
    /* 8A800 8009A800 FFFF9132 */   andi      $s1, $s4, 0xFFFF
    /* 8A804 8009A804 7769020C */  jal        SND_FindSFX__FUs
    /* 8A808 8009A808 21202002 */   addu      $a0, $s1, $zero
    /* 8A80C 8009A80C 21904000 */  addu       $s2, $v0, $zero
    /* 8A810 8009A810 FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 8A814 8009A814 09005316 */  bne        $s2, $s3, .L8009A83C
    /* 8A818 8009A818 00000000 */   nop
    /* 8A81C 8009A81C CA69020C */  jal        SND_RemapSnd__Fi
    /* 8A820 8009A820 21202002 */   addu      $a0, $s1, $zero
    /* 8A824 8009A824 21904000 */  addu       $s2, $v0, $zero
    /* 8A828 8009A828 04005316 */  bne        $s2, $s3, .L8009A83C
    /* 8A82C 8009A82C 01000224 */   addiu     $v0, $zero, 0x1
    /* 8A830 8009A830 890682A3 */  sb         $v0, %gp_rel(SFXNotInBank)($gp)
    /* 8A834 8009A834 616A0208 */  j          .L8009A984
    /* 8A838 8009A838 2110A002 */   addu      $v0, $s5, $zero
  .L8009A83C:
    /* 8A83C 8009A83C D968020C */  jal        SND_FindChannel__Fv
    /* 8A840 8009A840 00000000 */   nop
    /* 8A844 8009A844 21984000 */  addu       $s3, $v0, $zero
    /* 8A848 8009A848 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 8A84C 8009A84C 4C006212 */  beq        $s3, $v0, .L8009A980
    /* 8A850 8009A850 3BFC8226 */   addiu     $v0, $s4, -0x3C5
    /* 8A854 8009A854 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 8A858 8009A858 0400422C */  sltiu      $v0, $v0, 0x4
    /* 8A85C 8009A85C 02004010 */  beqz       $v0, .L8009A868
    /* 8A860 8009A860 FFFF8332 */   andi      $v1, $s4, 0xFFFF
    /* 8A864 8009A864 C0801000 */  sll        $s0, $s0, 3
  .L8009A868:
    /* 8A868 8009A868 50000224 */  addiu      $v0, $zero, 0x50
    /* 8A86C 8009A86C 03006214 */  bne        $v1, $v0, .L8009A87C
    /* 8A870 8009A870 0040022A */   slti      $v0, $s0, 0x4000
    /* 8A874 8009A874 C0801000 */  sll        $s0, $s0, 3
    /* 8A878 8009A878 0040022A */  slti       $v0, $s0, 0x4000
  .L8009A87C:
    /* 8A87C 8009A87C 02004014 */  bnez       $v0, .L8009A888
    /* 8A880 8009A880 00000000 */   nop
    /* 8A884 8009A884 FF3F1024 */  addiu      $s0, $zero, 0x3FFF
  .L8009A888:
    /* 8A888 8009A888 7C06848F */  lw         $a0, %gp_rel(D_8011ADFC)($gp)
    /* 8A88C 8009A88C DD85000C */  jal        GAL_Lock
    /* 8A890 8009A890 00000000 */   nop
    /* 8A894 8009A894 21884000 */  addu       $s1, $v0, $zero
    /* 8A898 8009A898 07002016 */  bnez       $s1, .L8009A8B8
    /* 8A89C 8009A89C 0100023C */   lui       $v0, (0x10000 >> 16)
    /* 8A8A0 8009A8A0 21200000 */  addu       $a0, $zero, $zero
    /* 8A8A4 8009A8A4 1180053C */  lui        $a1, %hi(D_8011099C)
    /* 8A8A8 8009A8A8 9C09A524 */  addiu      $a1, $a1, %lo(D_8011099C)
    /* 8A8AC 8009A8AC A583000C */  jal        DBG_Error
    /* 8A8B0 8009A8B0 21020624 */   addiu     $a2, $zero, 0x221
    /* 8A8B4 8009A8B4 0100023C */  lui        $v0, (0x10000 >> 16)
  .L8009A8B8:
    /* 8A8B8 8009A8B8 23105600 */  subu       $v0, $v0, $s6
    /* 8A8BC 8009A8BC 18005000 */  mult       $v0, $s0
    /* 8A8C0 8009A8C0 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8A8C4 8009A8C4 40181200 */  sll        $v1, $s2, 1
    /* 8A8C8 8009A8C8 21187200 */  addu       $v1, $v1, $s2
    /* 8A8CC 8009A8CC 12380000 */  mflo       $a3
    /* 8A8D0 8009A8D0 80180300 */  sll        $v1, $v1, 2
    /* 8A8D4 8009A8D4 21187100 */  addu       $v1, $v1, $s1
    /* 8A8D8 8009A8D8 1800D002 */  mult       $s6, $s0
    /* 8A8DC 8009A8DC 40281300 */  sll        $a1, $s3, 1
    /* 8A8E0 8009A8E0 0400668C */  lw         $a2, 0x4($v1)
    /* 8A8E4 8009A8E4 01008226 */  addiu      $v0, $s4, 0x1
    /* 8A8E8 8009A8E8 1280013C */  lui        $at, %hi(D_8011CD98)
    /* 8A8EC 8009A8EC 21082500 */  addu       $at, $at, $a1
    /* 8A8F0 8009A8F0 98CD22A4 */  sh         $v0, %lo(D_8011CD98)($at)
    /* 8A8F4 8009A8F4 93000224 */  addiu      $v0, $zero, 0x93
    /* 8A8F8 8009A8F8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 8A8FC 8009A8FC 01000224 */  addiu      $v0, $zero, 0x1
    /* 8A900 8009A900 04806202 */  sllv       $s0, $v0, $s3
    /* 8A904 8009A904 03140700 */  sra        $v0, $a3, 16
    /* 8A908 8009A908 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8A90C 8009A90C 1800A2A7 */  sh         $v0, 0x18($sp)
    /* 8A910 8009A910 12480000 */  mflo       $t1
    /* 8A914 8009A914 03140900 */  sra        $v0, $t1, 16
    /* 8A918 8009A918 1A00A2A7 */  sh         $v0, 0x1A($sp)
    /* 8A91C 8009A91C 8006828F */  lw         $v0, %gp_rel(D_8011AE00)($gp)
    /* 8A920 8009A920 0A006394 */  lhu        $v1, 0xA($v1)
    /* 8A924 8009A924 21104600 */  addu       $v0, $v0, $a2
    /* 8A928 8009A928 21187700 */  addu       $v1, $v1, $s7
    /* 8A92C 8009A92C 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 8A930 8009A930 3363000C */  jal        SpuSetKeyOnWithAttr
    /* 8A934 8009A934 2400A3A7 */   sh        $v1, 0x24($sp)
    /* 8A938 8009A938 1280023C */  lui        $v0, %hi(leveltype)
    /* 8A93C 8009A93C 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 8A940 8009A940 00000000 */  nop
    /* 8A944 8009A944 03004010 */  beqz       $v0, .L8009A954
    /* 8A948 8009A948 01000424 */   addiu     $a0, $zero, 0x1
    /* 8A94C 8009A94C 9B61000C */  jal        SpuSetReverbVoice
    /* 8A950 8009A950 21280002 */   addu      $a1, $s0, $zero
  .L8009A954:
    /* 8A954 8009A954 7C06848F */  lw         $a0, %gp_rel(D_8011ADFC)($gp)
    /* 8A958 8009A958 F785000C */  jal        GAL_Unlock
    /* 8A95C 8009A95C 21A86002 */   addu      $s5, $s3, $zero
    /* 8A960 8009A960 FF004230 */  andi       $v0, $v0, 0xFF
    /* 8A964 8009A964 07004014 */  bnez       $v0, .L8009A984
    /* 8A968 8009A968 2110A002 */   addu      $v0, $s5, $zero
    /* 8A96C 8009A96C 21200000 */  addu       $a0, $zero, $zero
    /* 8A970 8009A970 1180053C */  lui        $a1, %hi(D_8011099C)
    /* 8A974 8009A974 9C09A524 */  addiu      $a1, $a1, %lo(D_8011099C)
    /* 8A978 8009A978 A583000C */  jal        DBG_Error
    /* 8A97C 8009A97C 37020624 */   addiu     $a2, $zero, 0x237
  .L8009A980:
    /* 8A980 8009A980 2110A002 */  addu       $v0, $s5, $zero
  .L8009A984:
    /* 8A984 8009A984 7000BF8F */  lw         $ra, 0x70($sp)
    /* 8A988 8009A988 6C00B78F */  lw         $s7, 0x6C($sp)
    /* 8A98C 8009A98C 6800B68F */  lw         $s6, 0x68($sp)
    /* 8A990 8009A990 6400B58F */  lw         $s5, 0x64($sp)
    /* 8A994 8009A994 6000B48F */  lw         $s4, 0x60($sp)
    /* 8A998 8009A998 5C00B38F */  lw         $s3, 0x5C($sp)
    /* 8A99C 8009A99C 5800B28F */  lw         $s2, 0x58($sp)
    /* 8A9A0 8009A9A0 5400B18F */  lw         $s1, 0x54($sp)
    /* 8A9A4 8009A9A4 5000B08F */  lw         $s0, 0x50($sp)
    /* 8A9A8 8009A9A8 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 8A9AC 8009A9AC 0800E003 */  jr         $ra
    /* 8A9B0 8009A9B0 00000000 */   nop
endlabel SND_PlaySnd__FUsiii
