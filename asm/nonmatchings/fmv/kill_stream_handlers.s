.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching kill_stream_handlers, 0x30

glabel kill_stream_handlers
    /* 1C308 80155F00 900D828F */  lw         $v0, %gp_rel(stream_handler_installed)($gp)
    /* 1C30C 80155F04 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C310 80155F08 05004010 */  beqz       $v0, .L80155F20
    /* 1C314 80155F0C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1C318 80155F10 A00D848F */  lw         $a0, %gp_rel(old_cdready_handler)($gp)
    /* 1C31C 80155F14 916B000C */  jal        CdReadyCallback
    /* 1C320 80155F18 00000000 */   nop
    /* 1C324 80155F1C 900D80AF */  sw         $zero, %gp_rel(stream_handler_installed)($gp)
  .L80155F20:
    /* 1C328 80155F20 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1C32C 80155F24 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C330 80155F28 0800E003 */  jr         $ra
    /* 1C334 80155F2C 00000000 */   nop
endlabel kill_stream_handlers
