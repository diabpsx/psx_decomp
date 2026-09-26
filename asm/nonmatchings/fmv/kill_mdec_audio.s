.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching kill_mdec_audio, 0x30

glabel kill_mdec_audio
    /* 1DCB4 801578AC C00D848F */  lw         $a0, %gp_rel(mdec_audio_buffer)($gp)
    /* 1DCB8 801578B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1DCBC 801578B4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1DCC0 801578B8 635E000C */  jal        SpuFree
    /* 1DCC4 801578BC 00000000 */   nop
    /* 1DCC8 801578C0 C40D848F */  lw         $a0, %gp_rel(mdec_audio_buffer + 0x4)($gp)
    /* 1DCCC 801578C4 635E000C */  jal        SpuFree
    /* 1DCD0 801578C8 00000000 */   nop
    /* 1DCD4 801578CC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1DCD8 801578D0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1DCDC 801578D4 0800E003 */  jr         $ra
    /* 1DCE0 801578D8 00000000 */   nop
endlabel kill_mdec_audio
