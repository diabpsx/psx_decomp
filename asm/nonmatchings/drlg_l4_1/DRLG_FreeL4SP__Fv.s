.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_FreeL4SP__Fv, 0x30

glabel DRLG_FreeL4SP__Fv
    /* 15ACC 8014F6C4 1280043C */  lui        $a0, %hi(pSetPiece)
    /* 15AD0 8014F6C8 DCC0848C */  lw         $a0, %lo(pSetPiece)($a0)
    /* 15AD4 8014F6CC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 15AD8 8014F6D0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 15ADC 8014F6D4 1280013C */  lui        $at, %hi(pSetPiece)
    /* 15AE0 8014F6D8 DCC020AC */  sw         $zero, %lo(pSetPiece)($at)
    /* 15AE4 8014F6DC F7F6000C */  jal        mem_free_dbg__FPv
    /* 15AE8 8014F6E0 00000000 */   nop
    /* 15AEC 8014F6E4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 15AF0 8014F6E8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 15AF4 8014F6EC 0800E003 */  jr         $ra
    /* 15AF8 8014F6F0 00000000 */   nop
endlabel DRLG_FreeL4SP__Fv
