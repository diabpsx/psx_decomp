.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching play_mdec_audio, 0x334

glabel play_mdec_audio
    /* 1DD08 80157900 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 1DD0C 80157904 6800B2AF */  sw         $s2, 0x68($sp)
    /* 1DD10 80157908 21908000 */  addu       $s2, $a0, $zero
    /* 1DD14 8015790C 6400B1AF */  sw         $s1, 0x64($sp)
    /* 1DD18 80157910 2188A000 */  addu       $s1, $a1, $zero
    /* 1DD1C 80157914 21300000 */  addu       $a2, $zero, $zero
    /* 1DD20 80157918 09000824 */  addiu      $t0, $zero, 0x9
    /* 1DD24 8015791C 03000724 */  addiu      $a3, $zero, 0x3
    /* 1DD28 80157920 01004526 */  addiu      $a1, $s2, 0x1
    /* 1DD2C 80157924 7400BFAF */  sw         $ra, 0x74($sp)
    /* 1DD30 80157928 7000B4AF */  sw         $s4, 0x70($sp)
    /* 1DD34 8015792C 6C00B3AF */  sw         $s3, 0x6C($sp)
    /* 1DD38 80157930 6000B0AF */  sw         $s0, 0x60($sp)
  .L80157934:
    /* 1DD3C 80157934 C80D828F */  lw         $v0, %gp_rel(mdec_audio_sec)($gp)
    /* 1DD40 80157938 00000000 */  nop
    /* 1DD44 8015793C 15004014 */  bnez       $v0, .L80157994
    /* 1DD48 80157940 10001024 */   addiu     $s0, $zero, 0x10
    /* 1DD4C 80157944 0000A290 */  lbu        $v0, 0x0($a1)
    /* 1DD50 80157948 00000000 */  nop
    /* 1DD54 8015794C 06004234 */  ori        $v0, $v0, 0x6
    /* 1DD58 80157950 0000A2A0 */  sb         $v0, 0x0($a1)
    /* 1DD5C 80157954 0400228E */  lw         $v0, 0x4($s1)
    /* 1DD60 80157958 00000000 */  nop
    /* 1DD64 8015795C 2A100202 */  slt        $v0, $s0, $v0
    /* 1DD68 80157960 2F004010 */  beqz       $v0, .L80157A20
    /* 1DD6C 80157964 21100402 */   addu      $v0, $s0, $a0
  .L80157968:
    /* 1DD70 80157968 01004390 */  lbu        $v1, 0x1($v0)
    /* 1DD74 8015796C 00000000 */  nop
    /* 1DD78 80157970 02006334 */  ori        $v1, $v1, 0x2
    /* 1DD7C 80157974 010043A0 */  sb         $v1, 0x1($v0)
    /* 1DD80 80157978 0400228E */  lw         $v0, 0x4($s1)
    /* 1DD84 8015797C 10001026 */  addiu      $s0, $s0, 0x10
    /* 1DD88 80157980 2A100202 */  slt        $v0, $s0, $v0
    /* 1DD8C 80157984 F8FF4014 */  bnez       $v0, .L80157968
    /* 1DD90 80157988 21100402 */   addu      $v0, $s0, $a0
    /* 1DD94 8015798C 895E0508 */  j          .L80157A24
    /* 1DD98 80157990 E007A524 */   addiu     $a1, $a1, 0x7E0
  .L80157994:
    /* 1DD9C 80157994 14004814 */  bne        $v0, $t0, .L801579E8
    /* 1DDA0 80157998 00000000 */   nop
    /* 1DDA4 8015799C 0400228E */  lw         $v0, 0x4($s1)
    /* 1DDA8 801579A0 00000000 */  nop
    /* 1DDAC 801579A4 F0FF4224 */  addiu      $v0, $v0, -0x10
    /* 1DDB0 801579A8 0C004018 */  blez       $v0, .L801579DC
    /* 1DDB4 801579AC 21800000 */   addu      $s0, $zero, $zero
    /* 1DDB8 801579B0 21100402 */  addu       $v0, $s0, $a0
  .L801579B4:
    /* 1DDBC 801579B4 01004390 */  lbu        $v1, 0x1($v0)
    /* 1DDC0 801579B8 00000000 */  nop
    /* 1DDC4 801579BC 02006334 */  ori        $v1, $v1, 0x2
    /* 1DDC8 801579C0 010043A0 */  sb         $v1, 0x1($v0)
    /* 1DDCC 801579C4 0400228E */  lw         $v0, 0x4($s1)
    /* 1DDD0 801579C8 10001026 */  addiu      $s0, $s0, 0x10
    /* 1DDD4 801579CC F0FF4224 */  addiu      $v0, $v0, -0x10
    /* 1DDD8 801579D0 2A100202 */  slt        $v0, $s0, $v0
    /* 1DDDC 801579D4 F7FF4014 */  bnez       $v0, .L801579B4
    /* 1DDE0 801579D8 21100402 */   addu      $v0, $s0, $a0
  .L801579DC:
    /* 1DDE4 801579DC 21100402 */  addu       $v0, $s0, $a0
    /* 1DDE8 801579E0 885E0508 */  j          .L80157A20
    /* 1DDEC 801579E4 010047A0 */   sb        $a3, 0x1($v0)
  .L801579E8:
    /* 1DDF0 801579E8 0400228E */  lw         $v0, 0x4($s1)
    /* 1DDF4 801579EC 00000000 */  nop
    /* 1DDF8 801579F0 0B004018 */  blez       $v0, .L80157A20
    /* 1DDFC 801579F4 21800000 */   addu      $s0, $zero, $zero
    /* 1DE00 801579F8 21100402 */  addu       $v0, $s0, $a0
  .L801579FC:
    /* 1DE04 801579FC 01004390 */  lbu        $v1, 0x1($v0)
    /* 1DE08 80157A00 00000000 */  nop
    /* 1DE0C 80157A04 02006334 */  ori        $v1, $v1, 0x2
    /* 1DE10 80157A08 010043A0 */  sb         $v1, 0x1($v0)
    /* 1DE14 80157A0C 0400228E */  lw         $v0, 0x4($s1)
    /* 1DE18 80157A10 10001026 */  addiu      $s0, $s0, 0x10
    /* 1DE1C 80157A14 2A100202 */  slt        $v0, $s0, $v0
    /* 1DE20 80157A18 F8FF4014 */  bnez       $v0, .L801579FC
    /* 1DE24 80157A1C 21100402 */   addu      $v0, $s0, $a0
  .L80157A20:
    /* 1DE28 80157A20 E007A524 */  addiu      $a1, $a1, 0x7E0
  .L80157A24:
    /* 1DE2C 80157A24 0100C624 */  addiu      $a2, $a2, 0x1
    /* 1DE30 80157A28 0200C228 */  slti       $v0, $a2, 0x2
    /* 1DE34 80157A2C C1FF4014 */  bnez       $v0, .L80157934
    /* 1DE38 80157A30 E0078424 */   addiu     $a0, $a0, 0x7E0
    /* 1DE3C 80157A34 C763000C */  jal        SpuSetTransferMode
    /* 1DE40 80157A38 21200000 */   addu      $a0, $zero, $zero
    /* 1DE44 80157A3C C00D828F */  lw         $v0, %gp_rel(mdec_audio_buffer)($gp)
    /* 1DE48 80157A40 CC0D848F */  lw         $a0, %gp_rel(mdec_audio_offs)($gp)
    /* 1DE4C 80157A44 AF63000C */  jal        SpuSetTransferStartAddr
    /* 1DE50 80157A48 21204400 */   addu      $a0, $v0, $a0
    /* 1DE54 80157A4C 680D8293 */  lbu        $v0, %gp_rel(D_8011B4E8)($gp)
    /* 1DE58 80157A50 00000000 */  nop
    /* 1DE5C 80157A54 07004010 */  beqz       $v0, .L80157A74
    /* 1DE60 80157A58 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 1DE64 80157A5C 0400258E */  lw         $a1, 0x4($s1)
    /* 1DE68 80157A60 80210200 */  sll        $a0, $v0, 6
    /* 1DE6C 80157A64 23208200 */  subu       $a0, $a0, $v0
    /* 1DE70 80157A68 40210400 */  sll        $a0, $a0, 5
    /* 1DE74 80157A6C 9F5E0508 */  j          .L80157A7C
    /* 1DE78 80157A70 21204402 */   addu      $a0, $s2, $a0
  .L80157A74:
    /* 1DE7C 80157A74 0400258E */  lw         $a1, 0x4($s1)
    /* 1DE80 80157A78 21204002 */  addu       $a0, $s2, $zero
  .L80157A7C:
    /* 1DE84 80157A7C 3F63000C */  jal        SpuWrite
    /* 1DE88 80157A80 00000000 */   nop
    /* 1DE8C 80157A84 D363000C */  jal        SpuIsTransferCompleted
    /* 1DE90 80157A88 01000424 */   addiu     $a0, $zero, 0x1
    /* 1DE94 80157A8C C763000C */  jal        SpuSetTransferMode
    /* 1DE98 80157A90 21200000 */   addu      $a0, $zero, $zero
    /* 1DE9C 80157A94 C40D828F */  lw         $v0, %gp_rel(mdec_audio_buffer + 0x4)($gp)
    /* 1DEA0 80157A98 CC0D848F */  lw         $a0, %gp_rel(mdec_audio_offs)($gp)
    /* 1DEA4 80157A9C AF63000C */  jal        SpuSetTransferStartAddr
    /* 1DEA8 80157AA0 21204400 */   addu      $a0, $v0, $a0
    /* 1DEAC 80157AA4 680D8293 */  lbu        $v0, %gp_rel(D_8011B4E8)($gp)
    /* 1DEB0 80157AA8 00000000 */  nop
    /* 1DEB4 80157AAC 07004010 */  beqz       $v0, .L80157ACC
    /* 1DEB8 80157AB0 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 1DEBC 80157AB4 0400258E */  lw         $a1, 0x4($s1)
    /* 1DEC0 80157AB8 80210200 */  sll        $a0, $v0, 6
    /* 1DEC4 80157ABC 23208200 */  subu       $a0, $a0, $v0
    /* 1DEC8 80157AC0 40210400 */  sll        $a0, $a0, 5
    /* 1DECC 80157AC4 B55E0508 */  j          .L80157AD4
    /* 1DED0 80157AC8 21204402 */   addu      $a0, $s2, $a0
  .L80157ACC:
    /* 1DED4 80157ACC 0400258E */  lw         $a1, 0x4($s1)
    /* 1DED8 80157AD0 E0074426 */  addiu      $a0, $s2, 0x7E0
  .L80157AD4:
    /* 1DEDC 80157AD4 3F63000C */  jal        SpuWrite
    /* 1DEE0 80157AD8 00000000 */   nop
    /* 1DEE4 80157ADC D363000C */  jal        SpuIsTransferCompleted
    /* 1DEE8 80157AE0 01000424 */   addiu     $a0, $zero, 0x1
    /* 1DEEC 80157AE4 C80D838F */  lw         $v1, %gp_rel(mdec_audio_sec)($gp)
    /* 1DEF0 80157AE8 900E828F */  lw         $v0, %gp_rel(streampos)($gp)
    /* 1DEF4 80157AEC 0400248E */  lw         $a0, 0x4($s1)
    /* 1DEF8 80157AF0 01006324 */  addiu      $v1, $v1, 0x1
    /* 1DEFC 80157AF4 21104400 */  addu       $v0, $v0, $a0
    /* 1DF00 80157AF8 900E82AF */  sw         $v0, %gp_rel(streampos)($gp)
    /* 1DF04 80157AFC 0A000224 */  addiu      $v0, $zero, 0xA
    /* 1DF08 80157B00 C80D83AF */  sw         $v1, %gp_rel(mdec_audio_sec)($gp)
    /* 1DF0C 80157B04 05006214 */  bne        $v1, $v0, .L80157B1C
    /* 1DF10 80157B08 00000000 */   nop
    /* 1DF14 80157B0C CC0D80AF */  sw         $zero, %gp_rel(mdec_audio_offs)($gp)
    /* 1DF18 80157B10 C80D80AF */  sw         $zero, %gp_rel(mdec_audio_sec)($gp)
    /* 1DF1C 80157B14 CC5E0508 */  j          .L80157B30
    /* 1DF20 80157B18 00000000 */   nop
  .L80157B1C:
    /* 1DF24 80157B1C CC0D828F */  lw         $v0, %gp_rel(mdec_audio_offs)($gp)
    /* 1DF28 80157B20 0400238E */  lw         $v1, 0x4($s1)
    /* 1DF2C 80157B24 00000000 */  nop
    /* 1DF30 80157B28 21104300 */  addu       $v0, $v0, $v1
    /* 1DF34 80157B2C CC0D82AF */  sw         $v0, %gp_rel(mdec_audio_offs)($gp)
  .L80157B30:
    /* 1DF38 80157B30 D00D828F */  lw         $v0, %gp_rel(mdec_audio_playing)($gp)
    /* 1DF3C 80157B34 00000000 */  nop
    /* 1DF40 80157B38 34004014 */  bnez       $v0, .L80157C0C
    /* 1DF44 80157B3C FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 1DF48 80157B40 C80D828F */  lw         $v0, %gp_rel(mdec_audio_sec)($gp)
    /* 1DF4C 80157B44 00000000 */  nop
    /* 1DF50 80157B48 FDFF5324 */  addiu      $s3, $v0, -0x3
    /* 1DF54 80157B4C 02006106 */  bgez       $s3, .L80157B58
    /* 1DF58 80157B50 21800000 */   addu      $s0, $zero, $zero
    /* 1DF5C 80157B54 07005324 */  addiu      $s3, $v0, 0x7
  .L80157B58:
    /* 1DF60 80157B58 01001224 */  addiu      $s2, $zero, 0x1
    /* 1DF64 80157B5C 03001424 */  addiu      $s4, $zero, 0x3
    /* 1DF68 80157B60 0400228E */  lw         $v0, 0x4($s1)
    /* 1DF6C 80157B64 FF3F1124 */  addiu      $s1, $zero, 0x3FFF
    /* 1DF70 80157B68 18006202 */  mult       $s3, $v0
    /* 1DF74 80157B6C 12980000 */  mflo       $s3
    /* 1DF78 80157B70 93FF0234 */  ori        $v0, $zero, 0xFF93
  .L80157B74:
    /* 1DF7C 80157B74 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1DF80 80157B78 0F000224 */  addiu      $v0, $zero, 0xF
    /* 1DF84 80157B7C 4800A2A7 */  sh         $v0, 0x48($sp)
    /* 1DF88 80157B80 04101202 */  sllv       $v0, $s2, $s0
    /* 1DF8C 80157B84 3400B2AF */  sw         $s2, 0x34($sp)
    /* 1DF90 80157B88 3800B2AF */  sw         $s2, 0x38($sp)
    /* 1DF94 80157B8C 3C00B4AF */  sw         $s4, 0x3C($sp)
    /* 1DF98 80157B90 4000A0A7 */  sh         $zero, 0x40($sp)
    /* 1DF9C 80157B94 4200A0A7 */  sh         $zero, 0x42($sp)
    /* 1DFA0 80157B98 4400A0A7 */  sh         $zero, 0x44($sp)
    /* 1DFA4 80157B9C 4600B4A7 */  sh         $s4, 0x46($sp)
    /* 1DFA8 80157BA0 03000016 */  bnez       $s0, .L80157BB0
    /* 1DFAC 80157BA4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1DFB0 80157BA8 ED5E0508 */  j          .L80157BB4
    /* 1DFB4 80157BAC 1800B1A7 */   sh        $s1, 0x18($sp)
  .L80157BB0:
    /* 1DFB8 80157BB0 1800A0A7 */  sh         $zero, 0x18($sp)
  .L80157BB4:
    /* 1DFBC 80157BB4 03001216 */  bne        $s0, $s2, .L80157BC4
    /* 1DFC0 80157BB8 00000000 */   nop
    /* 1DFC4 80157BBC F25E0508 */  j          .L80157BC8
    /* 1DFC8 80157BC0 1A00B1A7 */   sh        $s1, 0x1A($sp)
  .L80157BC4:
    /* 1DFCC 80157BC4 1A00A0A7 */  sh         $zero, 0x1A($sp)
  .L80157BC8:
    /* 1DFD0 80157BC8 1000A427 */  addiu      $a0, $sp, 0x10
    /* 1DFD4 80157BCC D40D838F */  lw         $v1, %gp_rel(mdec_audio_rate_shift)($gp)
    /* 1DFD8 80157BD0 FA0F0224 */  addiu      $v0, $zero, 0xFFA
    /* 1DFDC 80157BD4 07106200 */  srav       $v0, $v0, $v1
    /* 1DFE0 80157BD8 2400A2A7 */  sh         $v0, 0x24($sp)
    /* 1DFE4 80157BDC 80101000 */  sll        $v0, $s0, 2
    /* 1DFE8 80157BE0 1280013C */  lui        $at, %hi(mdec_audio_buffer)
    /* 1DFEC 80157BE4 21082200 */  addu       $at, $at, $v0
    /* 1DFF0 80157BE8 40B5228C */  lw         $v0, %lo(mdec_audio_buffer)($at)
    /* 1DFF4 80157BEC 01001026 */  addiu      $s0, $s0, 0x1
    /* 1DFF8 80157BF0 21105300 */  addu       $v0, $v0, $s3
    /* 1DFFC 80157BF4 3363000C */  jal        SpuSetKeyOnWithAttr
    /* 1E000 80157BF8 2C00A2AF */   sw        $v0, 0x2C($sp)
    /* 1E004 80157BFC 0200022A */  slti       $v0, $s0, 0x2
    /* 1E008 80157C00 DCFF4014 */  bnez       $v0, .L80157B74
    /* 1E00C 80157C04 93FF0234 */   ori       $v0, $zero, 0xFF93
    /* 1E010 80157C08 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80157C0C:
    /* 1E014 80157C0C D00D82AF */  sw         $v0, %gp_rel(mdec_audio_playing)($gp)
    /* 1E018 80157C10 7400BF8F */  lw         $ra, 0x74($sp)
    /* 1E01C 80157C14 7000B48F */  lw         $s4, 0x70($sp)
    /* 1E020 80157C18 6C00B38F */  lw         $s3, 0x6C($sp)
    /* 1E024 80157C1C 6800B28F */  lw         $s2, 0x68($sp)
    /* 1E028 80157C20 6400B18F */  lw         $s1, 0x64($sp)
    /* 1E02C 80157C24 6000B08F */  lw         $s0, 0x60($sp)
    /* 1E030 80157C28 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 1E034 80157C2C 0800E003 */  jr         $ra
    /* 1E038 80157C30 00000000 */   nop
endlabel play_mdec_audio
