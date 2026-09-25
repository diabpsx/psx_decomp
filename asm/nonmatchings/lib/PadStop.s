.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PadStop, 0x20

glabel PadStop
    /* 1AD0 80011AD0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1AD4 80011AD4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1AD8 80011AD8 2247000C */  jal        StopPAD
    /* 1ADC 80011ADC 00000000 */   nop
    /* 1AE0 80011AE0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1AE4 80011AE4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1AE8 80011AE8 0800E003 */  jr         $ra
    /* 1AEC 80011AEC 00000000 */   nop
endlabel PadStop
    /* 1AF0 80011AF0 00000000 */  nop
    /* 1AF4 80011AF4 00000000 */  nop
    /* 1AF8 80011AF8 00000000 */  nop
