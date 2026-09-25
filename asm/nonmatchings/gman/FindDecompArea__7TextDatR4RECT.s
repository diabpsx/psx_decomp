.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindDecompArea__7TextDatR4RECT, 0xD8

glabel FindDecompArea__7TextDatR4RECT
    /* 84068 80094068 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8406C 8009406C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 84070 80094070 21888000 */  addu       $s1, $a0, $zero
    /* 84074 80094074 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 84078 80094078 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8407C 8009407C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 84080 80094080 4000228E */  lw         $v0, 0x40($s1)
    /* 84084 80094084 00000000 */  nop
    /* 84088 80094088 06004014 */  bnez       $v0, .L800940A4
    /* 8408C 8009408C 2190A000 */   addu      $s2, $a1, $zero
    /* 84090 80094090 21200000 */  addu       $a0, $zero, $zero
    /* 84094 80094094 1180053C */  lui        $a1, %hi(D_80110598)
    /* 84098 80094098 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 8409C 8009409C A583000C */  jal        DBG_Error
    /* 840A0 800940A0 DB050624 */   addiu     $a2, $zero, 0x5DB
  .L800940A4:
    /* 840A4 800940A4 CF54020C */  jal        GetNumOfFrames__7TextDat_8009533c
    /* 840A8 800940A8 21202002 */   addu      $a0, $s1, $zero
    /* 840AC 800940AC 21404000 */  addu       $t0, $v0, $zero
    /* 840B0 800940B0 21200000 */  addu       $a0, $zero, $zero
    /* 840B4 800940B4 21800000 */  addu       $s0, $zero, $zero
    /* 840B8 800940B8 21380000 */  addu       $a3, $zero, $zero
    /* 840BC 800940BC 21300000 */  addu       $a2, $zero, $zero
  .L800940C0:
    /* 840C0 800940C0 2A10E800 */  slt        $v0, $a3, $t0
    /* 840C4 800940C4 13004010 */  beqz       $v0, .L80094114
    /* 840C8 800940C8 00000000 */   nop
    /* 840CC 800940CC 2400228E */  lw         $v0, 0x24($s1)
    /* 840D0 800940D0 00000000 */  nop
    /* 840D4 800940D4 2110C200 */  addu       $v0, $a2, $v0
    /* 840D8 800940D8 0800428C */  lw         $v0, 0x8($v0)
    /* 840DC 800940DC 00000000 */  nop
    /* 840E0 800940E0 421A0200 */  srl        $v1, $v0, 9
    /* 840E4 800940E4 FF014530 */  andi       $a1, $v0, 0x1FF
    /* 840E8 800940E8 2A108500 */  slt        $v0, $a0, $a1
    /* 840EC 800940EC 02004010 */  beqz       $v0, .L800940F8
    /* 840F0 800940F0 FF016330 */   andi      $v1, $v1, 0x1FF
    /* 840F4 800940F4 2120A000 */  addu       $a0, $a1, $zero
  .L800940F8:
    /* 840F8 800940F8 2A100302 */  slt        $v0, $s0, $v1
    /* 840FC 800940FC 02004010 */  beqz       $v0, .L80094108
    /* 84100 80094100 00000000 */   nop
    /* 84104 80094104 21806000 */  addu       $s0, $v1, $zero
  .L80094108:
    /* 84108 80094108 0C00C624 */  addiu      $a2, $a2, 0xC
    /* 8410C 8009410C 30500208 */  j          .L800940C0
    /* 84110 80094110 0100E724 */   addiu     $a3, $a3, 0x1
  .L80094114:
    /* 84114 80094114 7883000C */  jal        GU_AlignVal
    /* 84118 80094118 02000524 */   addiu     $a1, $zero, 0x2
    /* 8411C 8009411C 040042A6 */  sh         $v0, 0x4($s2)
    /* 84120 80094120 060050A6 */  sh         $s0, 0x6($s2)
    /* 84124 80094124 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 84128 80094128 1800B28F */  lw         $s2, 0x18($sp)
    /* 8412C 8009412C 1400B18F */  lw         $s1, 0x14($sp)
    /* 84130 80094130 1000B08F */  lw         $s0, 0x10($sp)
    /* 84134 80094134 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 84138 80094138 0800E003 */  jr         $ra
    /* 8413C 8009413C 00000000 */   nop
endlabel FindDecompArea__7TextDatR4RECT
