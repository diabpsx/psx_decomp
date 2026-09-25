.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WriteCompressed__4AMapPUcRC9CompClass, 0x74

glabel WriteCompressed__4AMapPUcRC9CompClass
    /* 71B14 80081B14 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 71B18 80081B18 1400B1AF */  sw         $s1, 0x14($sp)
    /* 71B1C 80081B1C 21888000 */  addu       $s1, $a0, $zero
    /* 71B20 80081B20 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71B24 80081B24 2180A000 */  addu       $s0, $a1, $zero
    /* 71B28 80081B28 1800BFAF */  sw         $ra, 0x18($sp)
    /* 71B2C 80081B2C 0000228E */  lw         $v0, 0x0($s1)
    /* 71B30 80081B30 00000000 */  nop
    /* 71B34 80081B34 03004014 */  bnez       $v0, .L80081B44
    /* 71B38 80081B38 2128C000 */   addu      $a1, $a2, $zero
    /* 71B3C 80081B3C 8A07020C */  jal        CompressMap__4AMapRC9CompClass
    /* 71B40 80081B40 00000000 */   nop
  .L80081B44:
    /* 71B44 80081B44 1E07020C */  jal        GetMap__4AMap
    /* 71B48 80081B48 21202002 */   addu      $a0, $s1, $zero
    /* 71B4C 80081B4C 21200002 */  addu       $a0, $s0, $zero
    /* 71B50 80081B50 21804000 */  addu       $s0, $v0, $zero
    /* 71B54 80081B54 0800268E */  lw         $a2, 0x8($s1)
    /* 71B58 80081B58 8B67000C */  jal        memcpy
    /* 71B5C 80081B5C 21280002 */   addu      $a1, $s0, $zero
    /* 71B60 80081B60 21202002 */  addu       $a0, $s1, $zero
    /* 71B64 80081B64 6607020C */  jal        ReleaseMap__4AMapP6DLevel
    /* 71B68 80081B68 21280002 */   addu      $a1, $s0, $zero
    /* 71B6C 80081B6C 0800228E */  lw         $v0, 0x8($s1)
    /* 71B70 80081B70 1800BF8F */  lw         $ra, 0x18($sp)
    /* 71B74 80081B74 1400B18F */  lw         $s1, 0x14($sp)
    /* 71B78 80081B78 1000B08F */  lw         $s0, 0x10($sp)
    /* 71B7C 80081B7C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 71B80 80081B80 0800E003 */  jr         $ra
    /* 71B84 80081B84 00000000 */   nop
endlabel WriteCompressed__4AMapPUcRC9CompClass
