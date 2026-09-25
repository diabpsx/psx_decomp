.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlrHandItem__FP10ItemStructi, 0x118

glabel SetPlrHandItem__FP10ItemStructi
    /* 2FBC8 8003FBC8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2FBCC 8003FBCC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2FBD0 8003FBD0 21808000 */  addu       $s0, $a0, $zero
    /* 2FBD4 8003FBD4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2FBD8 8003FBD8 2190A000 */  addu       $s2, $a1, $zero
    /* 2FBDC 8003FBDC 40191200 */  sll        $v1, $s2, 5
    /* 2FBE0 8003FBE0 1180023C */  lui        $v0, %hi(AllItemsList)
    /* 2FBE4 8003FBE4 A4134224 */  addiu      $v0, $v0, %lo(AllItemsList)
    /* 2FBE8 8003FBE8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2FBEC 8003FBEC 21886200 */  addu       $s1, $v1, $v0
    /* 2FBF0 8003FBF0 21280000 */  addu       $a1, $zero, $zero
    /* 2FBF4 8003FBF4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 2FBF8 8003FBF8 E940000C */  jal        memset
    /* 2FBFC 8003FBFC 6C000624 */   addiu     $a2, $zero, 0x6C
    /* 2FC00 8003FC00 04002292 */  lbu        $v0, 0x4($s1)
    /* 2FC04 8003FC04 03002592 */  lbu        $a1, 0x3($s1)
    /* 2FC08 8003FC08 06002496 */  lhu        $a0, 0x6($s1)
    /* 2FC0C 8003FC0C 02002692 */  lbu        $a2, 0x2($s1)
    /* 2FC10 8003FC10 01002792 */  lbu        $a3, 0x1($s1)
    /* 2FC14 8003FC14 0C002892 */  lbu        $t0, 0xC($s1)
    /* 2FC18 8003FC18 0D002992 */  lbu        $t1, 0xD($s1)
    /* 2FC1C 8003FC1C 0E002A92 */  lbu        $t2, 0xE($s1)
    /* 2FC20 8003FC20 18002392 */  lbu        $v1, 0x18($s1)
    /* 2FC24 8003FC24 19002B92 */  lbu        $t3, 0x19($s1)
    /* 2FC28 8003FC28 00160200 */  sll        $v0, $v0, 24
    /* 2FC2C 8003FC2C 03160200 */  sra        $v0, $v0, 24
    /* 2FC30 8003FC30 4D0003A2 */  sb         $v1, 0x4D($s0)
    /* 2FC34 8003FC34 FF006330 */  andi       $v1, $v1, 0xFF
    /* 2FC38 8003FC38 2C0002A6 */  sh         $v0, 0x2C($s0)
    /* 2FC3C 8003FC3C 17000224 */  addiu      $v0, $zero, 0x17
    /* 2FC40 8003FC40 4C0005A2 */  sb         $a1, 0x4C($s0)
    /* 2FC44 8003FC44 260004A6 */  sh         $a0, 0x26($s0)
    /* 2FC48 8003FC48 280004A6 */  sh         $a0, 0x28($s0)
    /* 2FC4C 8003FC4C 540006A2 */  sb         $a2, 0x54($s0)
    /* 2FC50 8003FC50 550007A2 */  sb         $a3, 0x55($s0)
    /* 2FC54 8003FC54 3B0008A2 */  sb         $t0, 0x3B($s0)
    /* 2FC58 8003FC58 3C0009A2 */  sb         $t1, 0x3C($s0)
    /* 2FC5C 8003FC5C 4A000AA2 */  sb         $t2, 0x4A($s0)
    /* 2FC60 8003FC60 03006214 */  bne        $v1, $v0, .L8003FC70
    /* 2FC64 8003FC64 3D000BA2 */   sb        $t3, 0x3D($s0)
    /* 2FC68 8003FC68 28000224 */  addiu      $v0, $zero, 0x28
    /* 2FC6C 8003FC6C 490002A2 */  sb         $v0, 0x49($s0)
  .L8003FC70:
    /* 2FC70 8003FC70 49000592 */  lbu        $a1, 0x49($s0)
    /* 2FC74 8003FC74 0B002392 */  lbu        $v1, 0xB($s1)
    /* 2FC78 8003FC78 10002692 */  lbu        $a2, 0x10($s1)
    /* 2FC7C 8003FC7C 11002792 */  lbu        $a3, 0x11($s1)
    /* 2FC80 8003FC80 12002892 */  lbu        $t0, 0x12($s1)
    /* 2FC84 8003FC84 1C002496 */  lhu        $a0, 0x1C($s1)
    /* 2FC88 8003FC88 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2FC8C 8003FC8C 5F0002A2 */  sb         $v0, 0x5F($s0)
    /* 2FC90 8003FC90 600002A2 */  sb         $v0, 0x60($s0)
    /* 2FC94 8003FC94 01000224 */  addiu      $v0, $zero, 0x1
    /* 2FC98 8003FC98 2E0012A6 */  sh         $s2, 0x2E($s0)
    /* 2FC9C 8003FC9C 510000A2 */  sb         $zero, 0x51($s0)
    /* 2FCA0 8003FCA0 660002A2 */  sb         $v0, 0x66($s0)
    /* 2FCA4 8003FCA4 4B0005A2 */  sb         $a1, 0x4B($s0)
    /* 2FCA8 8003FCA8 3E0003A6 */  sh         $v1, 0x3E($s0)
    /* 2FCAC 8003FCAC 400003A6 */  sh         $v1, 0x40($s0)
    /* 2FCB0 8003FCB0 610006A2 */  sb         $a2, 0x61($s0)
    /* 2FCB4 8003FCB4 640007A2 */  sb         $a3, 0x64($s0)
    /* 2FCB8 8003FCB8 620008A2 */  sb         $t0, 0x62($s0)
    /* 2FCBC 8003FCBC 140004AE */  sw         $a0, 0x14($s0)
    /* 2FCC0 8003FCC0 180004AE */  sw         $a0, 0x18($s0)
    /* 2FCC4 8003FCC4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 2FCC8 8003FCC8 1800B28F */  lw         $s2, 0x18($sp)
    /* 2FCCC 8003FCCC 1400B18F */  lw         $s1, 0x14($sp)
    /* 2FCD0 8003FCD0 1000B08F */  lw         $s0, 0x10($sp)
    /* 2FCD4 8003FCD4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2FCD8 8003FCD8 0800E003 */  jr         $ra
    /* 2FCDC 8003FCDC 00000000 */   nop
endlabel SetPlrHandItem__FP10ItemStructi
