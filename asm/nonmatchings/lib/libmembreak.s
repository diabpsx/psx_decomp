.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching libmembreak, 0x5C

glabel libmembreak
    /* 1A534 8002A534 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1A538 8002A538 21288000 */  addu       $a1, $a0, $zero
    /* 1A53C 8002A53C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1A540 8002A540 0000A68C */  lw         $a2, 0x0($a1)
    /* 1A544 8002A544 1400A78C */  lw         $a3, 0x14($a1)
    /* 1A548 8002A548 0180023C */  lui        $v0, %hi(alertbox)
    /* 1A54C 8002A54C 00004224 */  addiu      $v0, $v0, %lo(alertbox)
    /* 1A550 8002A550 401D82AF */  sw         $v0, %gp_rel(membreak)($gp)
    /* 1A554 8002A554 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1A558 8002A558 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1A55C 8002A55C 1280013C */  lui        $at, %hi(abortfile)
    /* 1A560 8002A560 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1A564 8002A564 F1000224 */  addiu      $v0, $zero, 0xF1
    /* 1A568 8002A568 1180043C */  lui        $a0, %hi(D_8010F504)
    /* 1A56C 8002A56C 04F58424 */  addiu      $a0, $a0, %lo(D_8010F504)
    /* 1A570 8002A570 1280013C */  lui        $at, %hi(abortline)
    /* 1A574 8002A574 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1A578 8002A578 0F95000C */  jal        abortmessage
    /* 1A57C 8002A57C 0400A524 */   addiu     $a1, $a1, 0x4
    /* 1A580 8002A580 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1A584 8002A584 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1A588 8002A588 0800E003 */  jr         $ra
    /* 1A58C 8002A58C 00000000 */   nop
endlabel libmembreak
