.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_init__Fv, 0x58

glabel delta_init__Fv
    /* 3EA9C 8004EA9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3EAA0 8004EAA0 1380043C */  lui        $a0, %hi(D_8012EDD8)
    /* 3EAA4 8004EAA4 D8ED8424 */  addiu      $a0, $a0, %lo(D_8012EDD8)
    /* 3EAA8 8004EAA8 FF000524 */  addiu      $a1, $zero, 0xFF
    /* 3EAAC 8004EAAC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 3EAB0 8004EAB0 B52080A3 */  sb         $zero, %gp_rel(D_8011C835)($gp)
    /* 3EAB4 8004EAB4 E940000C */  jal        memset
    /* 3EAB8 8004EAB8 20000624 */   addiu     $a2, $zero, 0x20
    /* 3EABC 8004EABC 0D80043C */  lui        $a0, %hi(GameMaps)
    /* 3EAC0 8004EAC0 4C708424 */  addiu      $a0, $a0, %lo(GameMaps)
    /* 3EAC4 8004EAC4 C105020C */  jal        Init__13CompLevelMaps
    /* 3EAC8 8004EAC8 00000000 */   nop
    /* 3EACC 8004EACC 0D80043C */  lui        $a0, %hi(sgLocals)
    /* 3EAD0 8004EAD0 BC718424 */  addiu      $a0, $a0, %lo(sgLocals)
    /* 3EAD4 8004EAD4 21280000 */  addu       $a1, $zero, $zero
    /* 3EAD8 8004EAD8 E940000C */  jal        memset
    /* 3EADC 8004EADC 30110624 */   addiu     $a2, $zero, 0x1130
    /* 3EAE0 8004EAE0 FD1180A3 */  sb         $zero, %gp_rel(deltaload)($gp)
    /* 3EAE4 8004EAE4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3EAE8 8004EAE8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3EAEC 8004EAEC 0800E003 */  jr         $ra
    /* 3EAF0 8004EAF0 00000000 */   nop
endlabel delta_init__Fv
