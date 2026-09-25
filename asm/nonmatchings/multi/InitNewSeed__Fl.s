.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitNewSeed__Fl, 0x74

glabel InitNewSeed__Fl
    /* 42D7C 80052D7C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 42D80 80052D80 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 42D84 80052D84 1800B2AF */  sw         $s2, 0x18($sp)
    /* 42D88 80052D88 1400B1AF */  sw         $s1, 0x14($sp)
    /* 42D8C 80052D8C B3F6000C */  jal        SetRndSeed__Fl
    /* 42D90 80052D90 1000B0AF */   sw        $s0, 0x10($sp)
    /* 42D94 80052D94 21800000 */  addu       $s0, $zero, $zero
    /* 42D98 80052D98 0D80123C */  lui        $s2, %hi(gnLevelTypeTbl)
    /* 42D9C 80052D9C A0F75226 */  addiu      $s2, $s2, %lo(gnLevelTypeTbl)
    /* 42DA0 80052DA0 0D80113C */  lui        $s1, %hi(glSeedTbl)
    /* 42DA4 80052DA4 5CF73126 */  addiu      $s1, $s1, %lo(glSeedTbl)
  .L80052DA8:
    /* 42DA8 80052DA8 B7F6000C */  jal        GetRndSeed__Fv
    /* 42DAC 80052DAC 00000000 */   nop
    /* 42DB0 80052DB0 21200002 */  addu       $a0, $s0, $zero
    /* 42DB4 80052DB4 F44A010C */  jal        InitLevelType__Fi
    /* 42DB8 80052DB8 000022AE */   sw        $v0, 0x0($s1)
    /* 42DBC 80052DBC 000042AE */  sw         $v0, 0x0($s2)
    /* 42DC0 80052DC0 04005226 */  addiu      $s2, $s2, 0x4
    /* 42DC4 80052DC4 01001026 */  addiu      $s0, $s0, 0x1
    /* 42DC8 80052DC8 1100022A */  slti       $v0, $s0, 0x11
    /* 42DCC 80052DCC F6FF4014 */  bnez       $v0, .L80052DA8
    /* 42DD0 80052DD0 04003126 */   addiu     $s1, $s1, 0x4
    /* 42DD4 80052DD4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 42DD8 80052DD8 1800B28F */  lw         $s2, 0x18($sp)
    /* 42DDC 80052DDC 1400B18F */  lw         $s1, 0x14($sp)
    /* 42DE0 80052DE0 1000B08F */  lw         $s0, 0x10($sp)
    /* 42DE4 80052DE4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 42DE8 80052DE8 0800E003 */  jr         $ra
    /* 42DEC 80052DEC 00000000 */   nop
endlabel InitNewSeed__Fl
