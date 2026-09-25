.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncloadfileat, 0x20

glabel asyncloadfileat
    /* 13D84 80023D84 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 13D88 80023D88 1000BFAF */  sw         $ra, 0x10($sp)
    /* 13D8C 80023D8C 138F000C */  jal        asyncloadfileatcallback
    /* 13D90 80023D90 21300000 */   addu      $a2, $zero, $zero
    /* 13D94 80023D94 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13D98 80023D98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13D9C 80023D9C 0800E003 */  jr         $ra
    /* 13DA0 80023DA0 00000000 */   nop
endlabel asyncloadfileat
