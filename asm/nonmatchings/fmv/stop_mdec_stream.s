.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stop_mdec_stream, 0x44

glabel stop_mdec_stream
    /* 1E118 80157D10 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1E11C 80157D14 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1E120 80157D18 D363000C */  jal        SpuIsTransferCompleted
    /* 1E124 80157D1C 01000424 */   addiu     $a0, $zero, 0x1
    /* 1E128 80157D20 4059050C */  jal        close_cdstream
    /* 1E12C 80157D24 00000000 */   nop
    /* 1E130 80157D28 5059050C */  jal        wait_cdstream
    /* 1E134 80157D2C 00000000 */   nop
    /* 1E138 80157D30 380D80AF */  sw         $zero, %gp_rel(mdec_streaming)($gp)
    /* 1E13C 80157D34 9F57050C */  jal        flush_cdstream
    /* 1E140 80157D38 00000000 */   nop
    /* 1E144 80157D3C 375E050C */  jal        stop_mdec_audio
    /* 1E148 80157D40 00000000 */   nop
    /* 1E14C 80157D44 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1E150 80157D48 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1E154 80157D4C 0800E003 */  jr         $ra
    /* 1E158 80157D50 00000000 */   nop
endlabel stop_mdec_stream
