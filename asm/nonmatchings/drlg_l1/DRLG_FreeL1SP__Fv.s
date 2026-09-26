.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_FreeL1SP__Fv, 0x30

glabel DRLG_FreeL1SP__Fv
    /* 3284 8013CE7C 1280043C */  lui        $a0, %hi(pSetPiece)
    /* 3288 8013CE80 DCC0848C */  lw         $a0, %lo(pSetPiece)($a0)
    /* 328C 8013CE84 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3290 8013CE88 1000BFAF */  sw         $ra, 0x10($sp)
    /* 3294 8013CE8C 1280013C */  lui        $at, %hi(pSetPiece)
    /* 3298 8013CE90 DCC020AC */  sw         $zero, %lo(pSetPiece)($at)
    /* 329C 8013CE94 F7F6000C */  jal        mem_free_dbg__FPv
    /* 32A0 8013CE98 00000000 */   nop
    /* 32A4 8013CE9C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 32A8 8013CEA0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 32AC 8013CEA4 0800E003 */  jr         $ra
    /* 32B0 8013CEA8 00000000 */   nop
endlabel DRLG_FreeL1SP__Fv
