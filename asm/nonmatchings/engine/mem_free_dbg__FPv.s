.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching mem_free_dbg__FPv, 0x50

glabel mem_free_dbg__FPv
    /* 2DBDC 8003DBDC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2DBE0 8003DBE0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2DBE4 8003DBE4 21808000 */  addu       $s0, $a0, $zero
    /* 2DBE8 8003DBE8 0B000012 */  beqz       $s0, .L8003DC18
    /* 2DBEC 8003DBEC 1400BFAF */   sw        $ra, 0x14($sp)
    /* 2DBF0 8003DBF0 1280043C */  lui        $a0, %hi(D_8011C7C8)
    /* 2DBF4 8003DBF4 C8C78424 */  addiu      $a0, $a0, %lo(D_8011C7C8)
    /* 2DBF8 8003DBF8 0FF7000C */  jal        Enter__9CCritSect
    /* 2DBFC 8003DBFC 00000000 */   nop
    /* 2DC00 8003DC00 21200002 */  addu       $a0, $s0, $zero
    /* 2DC04 8003DC04 1180053C */  lui        $a1, %hi(D_80111328)
    /* 2DC08 8003DC08 2813A524 */  addiu      $a1, $a1, %lo(D_80111328)
    /* 2DC0C 8003DC0C D2010624 */  addiu      $a2, $zero, 0x1D2
    /* 2DC10 8003DC10 7CEC010C */  jal        SMemFree
    /* 2DC14 8003DC14 21380000 */   addu      $a3, $zero, $zero
  .L8003DC18:
    /* 2DC18 8003DC18 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2DC1C 8003DC1C 1000B08F */  lw         $s0, 0x10($sp)
    /* 2DC20 8003DC20 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2DC24 8003DC24 0800E003 */  jr         $ra
    /* 2DC28 8003DC28 00000000 */   nop
endlabel mem_free_dbg__FPv
