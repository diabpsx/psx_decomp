.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpGraphics__7CBlocksPP7TextDatPi, 0x50

glabel DumpGraphics__7CBlocksPP7TextDatPi
    /* 7DB14 8008DB14 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7DB18 8008DB18 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7DB1C 8008DB1C 2180A000 */  addu       $s0, $a1, $zero
    /* 7DB20 8008DB20 1800BFAF */  sw         $ra, 0x18($sp)
    /* 7DB24 8008DB24 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7DB28 8008DB28 0000048E */  lw         $a0, 0x0($s0)
    /* 7DB2C 8008DB2C 00000000 */  nop
    /* 7DB30 8008DB30 04008010 */  beqz       $a0, .L8008DB44
    /* 7DB34 8008DB34 2188C000 */   addu      $s1, $a2, $zero
    /* 7DB38 8008DB38 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 7DB3C 8008DB3C 00000000 */   nop
    /* 7DB40 8008DB40 000000AE */  sw         $zero, 0x0($s0)
  .L8008DB44:
    /* 7DB44 8008DB44 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 7DB48 8008DB48 000022AE */  sw         $v0, 0x0($s1)
    /* 7DB4C 8008DB4C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 7DB50 8008DB50 1400B18F */  lw         $s1, 0x14($sp)
    /* 7DB54 8008DB54 1000B08F */  lw         $s0, 0x10($sp)
    /* 7DB58 8008DB58 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7DB5C 8008DB5C 0800E003 */  jr         $ra
    /* 7DB60 8008DB60 00000000 */   nop
endlabel DumpGraphics__7CBlocksPP7TextDatPi
