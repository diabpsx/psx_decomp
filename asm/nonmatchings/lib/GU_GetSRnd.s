.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GU_GetSRnd, 0x20

glabel GU_GetSRnd
    /* 10D84 80020D84 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10D88 80020D88 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10D8C 80020D8C 3D83000C */  jal        GU_GetRnd
    /* 10D90 80020D90 00000000 */   nop
    /* 10D94 80020D94 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10D98 80020D98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10D9C 80020D9C 0800E003 */  jr         $ra
    /* 10DA0 80020DA0 00000000 */   nop
endlabel GU_GetSRnd
