.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching set_mdec_audio_volume, 0xCC

glabel set_mdec_audio_volume
    /* 1E03C 80157C34 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1E040 80157C38 00240400 */  sll        $a0, $a0, 16
    /* 1E044 80157C3C 600D828F */  lw         $v0, %gp_rel(sfx_volume)($gp)
    /* 1E048 80157C40 03240400 */  sra        $a0, $a0, 16
    /* 1E04C 80157C44 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1E050 80157C48 21800000 */  addu       $s0, $zero, $zero
    /* 1E054 80157C4C 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1E058 80157C50 18004400 */  mult       $v0, $a0
    /* 1E05C 80157C54 03001624 */  addiu      $s6, $zero, 0x3
    /* 1E060 80157C58 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1E064 80157C5C 1280113C */  lui        $s1, %hi(D_80121CAC)
    /* 1E068 80157C60 AC1C3126 */  addiu      $s1, $s1, %lo(D_80121CAC)
    /* 1E06C 80157C64 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1E070 80157C68 06003526 */  addiu      $s5, $s1, 0x6
    /* 1E074 80157C6C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1E078 80157C70 01001424 */  addiu      $s4, $zero, 0x1
    /* 1E07C 80157C74 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1E080 80157C78 FCFF3326 */  addiu      $s3, $s1, -0x4
    /* 1E084 80157C7C 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 1E088 80157C80 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1E08C 80157C84 12180000 */  mflo       $v1
    /* 1E090 80157C88 82930300 */  srl        $s2, $v1, 14
  .L80157C8C:
    /* 1E094 80157C8C 03000016 */  bnez       $s0, .L80157C9C
    /* 1E098 80157C90 000036AE */   sw        $s6, 0x0($s1)
    /* 1E09C 80157C94 285F0508 */  j          .L80157CA0
    /* 1E0A0 80157C98 040032A6 */   sh        $s2, 0x4($s1)
  .L80157C9C:
    /* 1E0A4 80157C9C 040020A6 */  sh         $zero, 0x4($s1)
  .L80157CA0:
    /* 1E0A8 80157CA0 03001416 */  bne        $s0, $s4, .L80157CB0
    /* 1E0AC 80157CA4 00000000 */   nop
    /* 1E0B0 80157CA8 2D5F0508 */  j          .L80157CB4
    /* 1E0B4 80157CAC 0000B2A6 */   sh        $s2, 0x0($s5)
  .L80157CB0:
    /* 1E0B8 80157CB0 0000A0A6 */  sh         $zero, 0x0($s5)
  .L80157CB4:
    /* 1E0BC 80157CB4 04101402 */  sllv       $v0, $s4, $s0
    /* 1E0C0 80157CB8 000062AE */  sw         $v0, 0x0($s3)
    /* 1E0C4 80157CBC 3765000C */  jal        SpuSetVoiceAttr
    /* 1E0C8 80157CC0 21206002 */   addu      $a0, $s3, $zero
    /* 1E0CC 80157CC4 01001026 */  addiu      $s0, $s0, 0x1
    /* 1E0D0 80157CC8 0200022A */  slti       $v0, $s0, 0x2
    /* 1E0D4 80157CCC EFFF4014 */  bnez       $v0, .L80157C8C
    /* 1E0D8 80157CD0 00000000 */   nop
    /* 1E0DC 80157CD4 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 1E0E0 80157CD8 2800B68F */  lw         $s6, 0x28($sp)
    /* 1E0E4 80157CDC 2400B58F */  lw         $s5, 0x24($sp)
    /* 1E0E8 80157CE0 2000B48F */  lw         $s4, 0x20($sp)
    /* 1E0EC 80157CE4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1E0F0 80157CE8 1800B28F */  lw         $s2, 0x18($sp)
    /* 1E0F4 80157CEC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1E0F8 80157CF0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1E0FC 80157CF4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1E100 80157CF8 0800E003 */  jr         $ra
    /* 1E104 80157CFC 00000000 */   nop
endlabel set_mdec_audio_volume
