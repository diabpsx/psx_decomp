.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DumpHdr__7TextDat, 0x64

glabel DumpHdr__7TextDat
    /* 83BAC 80093BAC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 83BB0 80093BB0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 83BB4 80093BB4 21808000 */  addu       $s0, $a0, $zero
    /* 83BB8 80093BB8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 83BBC 80093BBC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 83BC0 80093BC0 1400048E */  lw         $a0, 0x14($s0)
    /* 83BC4 80093BC4 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 83BC8 80093BC8 0B009110 */  beq        $a0, $s1, .L80093BF8
    /* 83BCC 80093BCC 00000000 */   nop
    /* 83BD0 80093BD0 1886000C */  jal        GAL_Free
    /* 83BD4 80093BD4 00000000 */   nop
    /* 83BD8 80093BD8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 83BDC 80093BDC 05004014 */  bnez       $v0, .L80093BF4
    /* 83BE0 80093BE0 21200000 */   addu      $a0, $zero, $zero
    /* 83BE4 80093BE4 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83BE8 80093BE8 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83BEC 80093BEC A583000C */  jal        DBG_Error
    /* 83BF0 80093BF0 12050624 */   addiu     $a2, $zero, 0x512
  .L80093BF4:
    /* 83BF4 80093BF4 140011AE */  sw         $s1, 0x14($s0)
  .L80093BF8:
    /* 83BF8 80093BF8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 83BFC 80093BFC 1400B18F */  lw         $s1, 0x14($sp)
    /* 83C00 80093C00 1000B08F */  lw         $s0, 0x10($sp)
    /* 83C04 80093C04 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 83C08 80093C08 0800E003 */  jr         $ra
    /* 83C0C 80093C0C 00000000 */   nop
endlabel DumpHdr__7TextDat
