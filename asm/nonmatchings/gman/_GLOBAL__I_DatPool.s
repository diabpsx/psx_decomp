.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_DatPool, 0x54

glabel _GLOBAL__I_DatPool
    /* 850D8 800950D8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 850DC 800950DC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 850E0 800950E0 0C80113C */  lui        $s1, %hi(DatPool)
    /* 850E4 800950E4 948B3126 */  addiu      $s1, $s1, %lo(DatPool)
    /* 850E8 800950E8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 850EC 800950EC 13001024 */  addiu      $s0, $zero, 0x13
    /* 850F0 800950F0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 850F4 800950F4 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 850F8 800950F8 1C00BFAF */  sw         $ra, 0x1C($sp)
  .L800950FC:
    /* 850FC 800950FC 9547020C */  jal        __7TextDat
    /* 85100 80095100 21202002 */   addu      $a0, $s1, $zero
    /* 85104 80095104 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 85108 80095108 FCFF1216 */  bne        $s0, $s2, .L800950FC
    /* 8510C 8009510C 70003126 */   addiu     $s1, $s1, 0x70
    /* 85110 80095110 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 85114 80095114 1800B28F */  lw         $s2, 0x18($sp)
    /* 85118 80095118 1400B18F */  lw         $s1, 0x14($sp)
    /* 8511C 8009511C 1000B08F */  lw         $s0, 0x10($sp)
    /* 85120 80095120 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 85124 80095124 0800E003 */  jr         $ra
    /* 85128 80095128 00000000 */   nop
endlabel _GLOBAL__I_DatPool
