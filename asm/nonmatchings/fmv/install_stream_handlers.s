.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching install_stream_handlers, 0x3C

glabel install_stream_handlers
    /* 1C58C 80156184 900D828F */  lw         $v0, %gp_rel(stream_handler_installed)($gp)
    /* 1C590 80156188 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C594 8015618C 08004014 */  bnez       $v0, .L801561B0
    /* 1C598 80156190 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1C59C 80156194 1580043C */  lui        $a0, %hi(stream_cdready_handler)
    /* 1C5A0 80156198 305F8424 */  addiu      $a0, $a0, %lo(stream_cdready_handler)
    /* 1C5A4 8015619C 916B000C */  jal        CdReadyCallback
    /* 1C5A8 801561A0 00000000 */   nop
    /* 1C5AC 801561A4 A00D82AF */  sw         $v0, %gp_rel(old_cdready_handler)($gp)
    /* 1C5B0 801561A8 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C5B4 801561AC 900D82AF */  sw         $v0, %gp_rel(stream_handler_installed)($gp)
  .L801561B0:
    /* 1C5B8 801561B0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1C5BC 801561B4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C5C0 801561B8 0800E003 */  jr         $ra
    /* 1C5C4 801561BC 00000000 */   nop
endlabel install_stream_handlers
