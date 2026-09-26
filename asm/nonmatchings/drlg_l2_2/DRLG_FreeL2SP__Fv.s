.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_FreeL2SP__Fv, 0x30

glabel DRLG_FreeL2SP__Fv
    /* A334 80143F2C 1280043C */  lui        $a0, %hi(pSetPiece)
    /* A338 80143F30 DCC0848C */  lw         $a0, %lo(pSetPiece)($a0)
    /* A33C 80143F34 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A340 80143F38 1000BFAF */  sw         $ra, 0x10($sp)
    /* A344 80143F3C 1280013C */  lui        $at, %hi(pSetPiece)
    /* A348 80143F40 DCC020AC */  sw         $zero, %lo(pSetPiece)($at)
    /* A34C 80143F44 F7F6000C */  jal        mem_free_dbg__FPv
    /* A350 80143F48 00000000 */   nop
    /* A354 80143F4C 1000BF8F */  lw         $ra, 0x10($sp)
    /* A358 80143F50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* A35C 80143F54 0800E003 */  jr         $ra
    /* A360 80143F58 00000000 */   nop
endlabel DRLG_FreeL2SP__Fv
