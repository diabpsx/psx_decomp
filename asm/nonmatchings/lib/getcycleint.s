.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getcycleint, 0x3C

glabel getcycleint
    /* 1FAD8 8002FAD8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1FADC 8002FADC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1FAE0 8002FAE0 01C0000C */  jal        savegp
    /* 1FAE4 8002FAE4 1000A427 */   addiu     $a0, $sp, 0x10
    /* 1FAE8 8002FAE8 2023828F */  lw         $v0, %gp_rel(getcycleticks)($gp)
    /* 1FAEC 8002FAEC 1000A48F */  lw         $a0, 0x10($sp)
    /* 1FAF0 8002FAF0 01004224 */  addiu      $v0, $v0, 0x1
    /* 1FAF4 8002FAF4 202382AF */  sw         $v0, %gp_rel(getcycleticks)($gp)
    /* 1FAF8 8002FAF8 2023828F */  lw         $v0, %gp_rel(getcycleticks)($gp)
    /* 1FAFC 8002FAFC 06C0000C */  jal        restoregp
    /* 1FB00 8002FB00 00000000 */   nop
    /* 1FB04 8002FB04 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1FB08 8002FB08 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1FB0C 8002FB0C 0800E003 */  jr         $ra
    /* 1FB10 8002FB10 00000000 */   nop
endlabel getcycleint
