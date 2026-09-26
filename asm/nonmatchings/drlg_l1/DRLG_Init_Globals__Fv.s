.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_Init_Globals__Fv, 0x20

glabel DRLG_Init_Globals__Fv
    /* 32B4 8013CEAC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 32B8 8013CEB0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 32BC 8013CEB4 B3F3040C */  jal        set_restore_lighting__Fv
    /* 32C0 8013CEB8 00000000 */   nop
    /* 32C4 8013CEBC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 32C8 8013CEC0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 32CC 8013CEC4 0800E003 */  jr         $ra
    /* 32D0 8013CEC8 00000000 */   nop
endlabel DRLG_Init_Globals__Fv
