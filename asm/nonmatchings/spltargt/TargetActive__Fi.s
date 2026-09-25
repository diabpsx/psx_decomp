.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TargetActive__Fi, 0x28

glabel TargetActive__Fi
    /* 9FE68 800AFE68 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9FE6C 800AFE6C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 9FE70 800AFE70 4BEB010C */  jal        GetGamePad__Fi
    /* 9FE74 800AFE74 00000000 */   nop
    /* 9FE78 800AFE78 B8C0020C */  jal        Active__11SpellTarget_800b02e0
    /* 9FE7C 800AFE7C 04004424 */   addiu     $a0, $v0, 0x4
    /* 9FE80 800AFE80 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9FE84 800AFE84 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9FE88 800AFE88 0800E003 */  jr         $ra
    /* 9FE8C 800AFE8C 00000000 */   nop
endlabel TargetActive__Fi
