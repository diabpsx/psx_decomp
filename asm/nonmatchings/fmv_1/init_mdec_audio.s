.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching init_mdec_audio, 0x118

glabel init_mdec_audio
    /* 1DB9C 80157794 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 1DBA0 80157798 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 1DBA4 8015779C 21888000 */  addu       $s1, $a0, $zero
    /* 1DBA8 801577A0 4000BFAF */  sw         $ra, 0x40($sp)
    /* 1DBAC 801577A4 9768020C */  jal        SPU_Init__Fv
    /* 1DBB0 801577A8 3800B0AF */   sw        $s0, 0x38($sp)
    /* 1DBB4 801577AC 21800000 */  addu       $s0, $zero, $zero
  .L801577B0:
    /* 1DBB8 801577B0 1748000C */  jal        VSync
    /* 1DBBC 801577B4 21200000 */   addu      $a0, $zero, $zero
    /* 1DBC0 801577B8 01001026 */  addiu      $s0, $s0, 0x1
    /* 1DBC4 801577BC 0500022A */  slti       $v0, $s0, 0x5
    /* 1DBC8 801577C0 FBFF4014 */  bnez       $v0, .L801577B0
    /* 1DBCC 801577C4 1000A427 */   addiu     $a0, $sp, 0x10
    /* 1DBD0 801577C8 C3020224 */  addiu      $v0, $zero, 0x2C3
    /* 1DBD4 801577CC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1DBD8 801577D0 FF3F0224 */  addiu      $v0, $zero, 0x3FFF
    /* 1DBDC 801577D4 1600A2A7 */  sh         $v0, 0x16($sp)
    /* 1DBE0 801577D8 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 1DBE4 801577DC 01000224 */  addiu      $v0, $zero, 0x1
    /* 1DBE8 801577E0 2800A2AF */  sw         $v0, 0x28($sp)
    /* 1DBEC 801577E4 2000A0A7 */  sh         $zero, 0x20($sp)
    /* 1DBF0 801577E8 FF63000C */  jal        SpuSetCommonAttr
    /* 1DBF4 801577EC 2200A0A7 */   sh        $zero, 0x22($sp)
    /* 1DBF8 801577F0 EF5C000C */  jal        SpuMalloc
    /* 1DBFC 801577F4 00500424 */   addiu     $a0, $zero, 0x5000
    /* 1DC00 801577F8 C00D82AF */  sw         $v0, %gp_rel(mdec_audio_buffer)($gp)
    /* 1DC04 801577FC EF5C000C */  jal        SpuMalloc
    /* 1DC08 80157800 00500424 */   addiu     $a0, $zero, 0x5000
    /* 1DC0C 80157804 21204000 */  addu       $a0, $v0, $zero
    /* 1DC10 80157808 02000224 */  addiu      $v0, $zero, 0x2
    /* 1DC14 8015780C D00D82AF */  sw         $v0, %gp_rel(mdec_audio_playing)($gp)
    /* 1DC18 80157810 C00D828F */  lw         $v0, %gp_rel(mdec_audio_buffer)($gp)
    /* 1DC1C 80157814 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 1DC20 80157818 C40D84AF */  sw         $a0, %gp_rel(mdec_audio_buffer + 0x4)($gp)
    /* 1DC24 8015781C C80D80AF */  sw         $zero, %gp_rel(mdec_audio_sec)($gp)
    /* 1DC28 80157820 CC0D80AF */  sw         $zero, %gp_rel(mdec_audio_offs)($gp)
    /* 1DC2C 80157824 D40D91AF */  sw         $s1, %gp_rel(mdec_audio_rate_shift)($gp)
    /* 1DC30 80157828 03004310 */  beq        $v0, $v1, .L80157838
    /* 1DC34 8015782C 00000000 */   nop
    /* 1DC38 80157830 06008314 */  bne        $a0, $v1, .L8015784C
    /* 1DC3C 80157834 00000000 */   nop
  .L80157838:
    /* 1DC40 80157838 21200000 */  addu       $a0, $zero, $zero
    /* 1DC44 8015783C 1480053C */  lui        $a1, %hi(func_8013B7DC + 0xE8)
    /* 1DC48 80157840 C4B8A524 */  addiu      $a1, $a1, %lo(func_8013B7DC + 0xE8)
    /* 1DC4C 80157844 A583000C */  jal        DBG_Error
    /* 1DC50 80157848 CF040624 */   addiu     $a2, $zero, 0x4CF
  .L8015784C:
    /* 1DC54 8015784C C763000C */  jal        SpuSetTransferMode
    /* 1DC58 80157850 21200000 */   addu      $a0, $zero, $zero
    /* 1DC5C 80157854 C00D848F */  lw         $a0, %gp_rel(mdec_audio_buffer)($gp)
    /* 1DC60 80157858 AF63000C */  jal        SpuSetTransferStartAddr
    /* 1DC64 8015785C 00000000 */   nop
    /* 1DC68 80157860 5763000C */  jal        SpuWrite0
    /* 1DC6C 80157864 00180424 */   addiu     $a0, $zero, 0x1800
    /* 1DC70 80157868 D363000C */  jal        SpuIsTransferCompleted
    /* 1DC74 8015786C 01000424 */   addiu     $a0, $zero, 0x1
    /* 1DC78 80157870 C763000C */  jal        SpuSetTransferMode
    /* 1DC7C 80157874 21200000 */   addu      $a0, $zero, $zero
    /* 1DC80 80157878 C40D848F */  lw         $a0, %gp_rel(mdec_audio_buffer + 0x4)($gp)
    /* 1DC84 8015787C AF63000C */  jal        SpuSetTransferStartAddr
    /* 1DC88 80157880 00000000 */   nop
    /* 1DC8C 80157884 5763000C */  jal        SpuWrite0
    /* 1DC90 80157888 00180424 */   addiu     $a0, $zero, 0x1800
    /* 1DC94 8015788C D363000C */  jal        SpuIsTransferCompleted
    /* 1DC98 80157890 01000424 */   addiu     $a0, $zero, 0x1
    /* 1DC9C 80157894 4000BF8F */  lw         $ra, 0x40($sp)
    /* 1DCA0 80157898 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 1DCA4 8015789C 3800B08F */  lw         $s0, 0x38($sp)
    /* 1DCA8 801578A0 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 1DCAC 801578A4 0800E003 */  jr         $ra
    /* 1DCB0 801578A8 00000000 */   nop
endlabel init_mdec_audio
