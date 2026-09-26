.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OVR_Open__Fv, 0x20

glabel OVR_Open__Fv
    /* A0784 800B0784 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A0788 800B0788 1000BFAF */  sw         $ra, 0x10($sp)
    /* A078C 800B078C 3C55020C */  jal        ClearOutOverlays__Fv
    /* A0790 800B0790 00000000 */   nop
    /* A0794 800B0794 1000BF8F */  lw         $ra, 0x10($sp)
    /* A0798 800B0798 1800BD27 */  addiu      $sp, $sp, 0x18
    /* A079C 800B079C 0800E003 */  jr         $ra
    /* A07A0 800B07A0 00000000 */   nop
endlabel OVR_Open__Fv
