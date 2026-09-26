.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_AcidUniq__Fi, 0x24

glabel MAI_AcidUniq__Fi
    /* 18070 80151C68 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 18074 80151C6C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 18078 80151C70 39000524 */  addiu      $a1, $zero, 0x39
    /* 1807C 80151C74 7F46050C */  jal        MAI_Ranged__FiiUc
    /* 18080 80151C78 01000624 */   addiu     $a2, $zero, 0x1
    /* 18084 80151C7C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 18088 80151C80 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1808C 80151C84 0800E003 */  jr         $ra
    /* 18090 80151C88 00000000 */   nop
endlabel MAI_AcidUniq__Fi
