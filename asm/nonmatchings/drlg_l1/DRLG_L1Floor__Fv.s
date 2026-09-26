.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L1Floor__Fv, 0x8C

glabel DRLG_L1Floor__Fv
    /* 2ECC 8013CAC4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 2ED0 8013CAC8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 2ED4 8013CACC 21980000 */  addu       $s3, $zero, $zero
    /* 2ED8 8013CAD0 2400B5AF */  sw         $s5, 0x24($sp)
    /* 2EDC 8013CAD4 0E80153C */  lui        $s5, %hi(dungeon)
    /* 2EE0 8013CAD8 C440B526 */  addiu      $s5, $s5, %lo(dungeon)
    /* 2EE4 8013CADC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 2EE8 8013CAE0 21A00000 */  addu       $s4, $zero, $zero
    /* 2EEC 8013CAE4 2800BFAF */  sw         $ra, 0x28($sp)
    /* 2EF0 8013CAE8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2EF4 8013CAEC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2EF8 8013CAF0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2EFC 8013CAF4 21880000 */  addu       $s1, $zero, $zero
    /* 2F00 8013CAF8 2190A002 */  addu       $s2, $s5, $zero
    /* 2F04 8013CAFC 1280023C */  lui        $v0, %hi(mydflags)
    /* 2F08 8013CB00 D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 2F0C 8013CB04 21189102 */  addu       $v1, $s4, $s1
    /* 2F10 8013CB08 21104300 */  addu       $v0, $v0, $v1
    /* 2F14 8013CB0C 00004290 */  lbu        $v0, 0x0($v0)
    /* 2F18 8013CB10 00000000 */  nop
    /* 2F1C 8013CB14 12004014 */  bnez       $v0, D_8013CB60
    /* 2F20 8013CB18 40101300 */   sll       $v0, $s3, 1
    /* 2F24 8013CB1C 21805200 */  addu       $s0, $v0, $s2
    /* 2F28 8013CB20 00000396 */  lhu        $v1, 0x0($s0)
    /* 2F2C 8013CB24 0D000224 */  addiu      $v0, $zero, 0xD
    /* 2F30 8013CB28 0D006214 */  bne        $v1, $v0, D_8013CB60
    /* 2F34 8013CB2C 00000000 */   nop
    /* 2F38 8013CB30 C9F6000C */  jal        ENG_random__Fl
    /* 2F3C 8013CB34 03000424 */   addiu     $a0, $zero, 0x3
    /* 2F40 8013CB38 21184000 */  addu       $v1, $v0, $zero
    /* 2F44 8013CB3C 01000224 */  addiu      $v0, $zero, 0x1
    /* 2F48 8013CB40 04006214 */  bne        $v1, $v0, D_8013CB54
    /* 2F4C 8013CB44 02000224 */   addiu     $v0, $zero, 0x2
    /* 2F50 8013CB48 A2000224 */  addiu      $v0, $zero, 0xA2
    /* 2F54 8013CB4C 000002A6 */  sh         $v0, 0x0($s0)
endlabel DRLG_L1Floor__Fv
