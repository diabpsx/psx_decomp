.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownHealer__Fv, 0x28

glabel TownHealer__Fv
    /* 2B400 8003B400 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B404 8003B404 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2B408 8003B408 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B40C 8003B40C 01000424 */   addiu     $a0, $zero, 0x1
    /* 2B410 8003B410 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B414 8003B414 21204000 */   addu      $a0, $v0, $zero
    /* 2B418 8003B418 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B41C 8003B41C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B420 8003B420 0800E003 */  jr         $ra
    /* 2B424 8003B424 00000000 */   nop
endlabel TownHealer__Fv
