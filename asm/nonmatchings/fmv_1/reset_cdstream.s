.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reset_cdstream, 0x30

glabel reset_cdstream
    /* 1C2D8 80155ED0 980E848F */  lw         $a0, %gp_rel(cdstream_resetsec)($gp)
    /* 1C2DC 80155ED4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C2E0 80155ED8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1C2E4 80155EDC 8757050C */  jal        _cd_seek
    /* 1C2E8 80155EE0 00000000 */   nop
    /* 1C2EC 80155EE4 3377000C */  jal        CdRead2
    /* 1C2F0 80155EE8 A0000424 */   addiu     $a0, $zero, 0xA0
    /* 1C2F4 80155EEC B00D80AF */  sw         $zero, %gp_rel(cdstream_resetting)($gp)
    /* 1C2F8 80155EF0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1C2FC 80155EF4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C300 80155EF8 0800E003 */  jr         $ra
    /* 1C304 80155EFC 00000000 */   nop
endlabel reset_cdstream
