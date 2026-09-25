.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DiabloAllocPtr__FUl, 0x4C

glabel DiabloAllocPtr__FUl
    /* 2DB90 8003DB90 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2DB94 8003DB94 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2DB98 8003DB98 21808000 */  addu       $s0, $a0, $zero
    /* 2DB9C 8003DB9C 1280043C */  lui        $a0, %hi(D_8011C7C8)
    /* 2DBA0 8003DBA0 C8C78424 */  addiu      $a0, $a0, %lo(D_8011C7C8)
    /* 2DBA4 8003DBA4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2DBA8 8003DBA8 0FF7000C */  jal        Enter__9CCritSect
    /* 2DBAC 8003DBAC 00000000 */   nop
    /* 2DBB0 8003DBB0 21200002 */  addu       $a0, $s0, $zero
    /* 2DBB4 8003DBB4 1180053C */  lui        $a1, %hi(D_80111328)
    /* 2DBB8 8003DBB8 2813A524 */  addiu      $a1, $a1, %lo(D_80111328)
    /* 2DBBC 8003DBBC 81010624 */  addiu      $a2, $zero, 0x181
    /* 2DBC0 8003DBC0 74EC010C */  jal        SMemAlloc
    /* 2DBC4 8003DBC4 21380000 */   addu      $a3, $zero, $zero
    /* 2DBC8 8003DBC8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2DBCC 8003DBCC 1000B08F */  lw         $s0, 0x10($sp)
    /* 2DBD0 8003DBD0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2DBD4 8003DBD4 0800E003 */  jr         $ra
    /* 2DBD8 8003DBD8 00000000 */   nop
endlabel DiabloAllocPtr__FUl
