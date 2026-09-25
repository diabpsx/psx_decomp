.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdControlB, 0x14C

glabel CdControlB
    /* B0C8 8001B0C8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* B0CC 8001B0CC 1400B1AF */  sw         $s1, 0x14($sp)
    /* B0D0 8001B0D0 2188A000 */  addu       $s1, $a1, $zero
    /* B0D4 8001B0D4 1800B2AF */  sw         $s2, 0x18($sp)
    /* B0D8 8001B0D8 2190C000 */  addu       $s2, $a2, $zero
    /* B0DC 8001B0DC 2000B4AF */  sw         $s4, 0x20($sp)
    /* B0E0 8001B0E0 21A08000 */  addu       $s4, $a0, $zero
    /* B0E4 8001B0E4 1000B0AF */  sw         $s0, 0x10($sp)
    /* B0E8 8001B0E8 03001024 */  addiu      $s0, $zero, 0x3
    /* B0EC 8001B0EC 3000BEAF */  sw         $fp, 0x30($sp)
    /* B0F0 8001B0F0 01001E24 */  addiu      $fp, $zero, 0x1
    /* B0F4 8001B0F4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* B0F8 8001B0F8 FF009332 */  andi       $s3, $s4, 0xFF
    /* B0FC 8001B0FC 0B80033C */  lui        $v1, %hi(D_800B5E6C)
    /* B100 8001B100 6C5E6324 */  addiu      $v1, $v1, %lo(D_800B5E6C)
    /* B104 8001B104 2400B5AF */  sw         $s5, 0x24($sp)
    /* B108 8001B108 0B80153C */  lui        $s5, %hi(CD_cbsync)
    /* B10C 8001B10C F45EB58E */  lw         $s5, %lo(CD_cbsync)($s5)
    /* B110 8001B110 80101300 */  sll        $v0, $s3, 2
    /* B114 8001B114 2800B6AF */  sw         $s6, 0x28($sp)
    /* B118 8001B118 21B04300 */  addu       $s6, $v0, $v1
    /* B11C 8001B11C 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* B120 8001B120 FFFF1724 */  addiu      $s7, $zero, -0x1
    /* B124 8001B124 3400BFAF */  sw         $ra, 0x34($sp)
  .L8001B128:
    /* B128 8001B128 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* B12C 8001B12C 0B007E12 */  beq        $s3, $fp, .L8001B15C
    /* B130 8001B130 F45E20AC */   sw        $zero, %lo(CD_cbsync)($at)
    /* B134 8001B134 0B80023C */  lui        $v0, %hi(CD_status)
    /* B138 8001B138 045F4290 */  lbu        $v0, %lo(CD_status)($v0)
    /* B13C 8001B13C 00000000 */  nop
    /* B140 8001B140 10004230 */  andi       $v0, $v0, 0x10
    /* B144 8001B144 05004010 */  beqz       $v0, .L8001B15C
    /* B148 8001B148 01000424 */   addiu     $a0, $zero, 0x1
    /* B14C 8001B14C 21280000 */  addu       $a1, $zero, $zero
    /* B150 8001B150 21300000 */  addu       $a2, $zero, $zero
    /* B154 8001B154 B86F000C */  jal        CD_cw
    /* B158 8001B158 21380000 */   addu      $a3, $zero, $zero
  .L8001B15C:
    /* B15C 8001B15C 0B002012 */  beqz       $s1, .L8001B18C
    /* B160 8001B160 00000000 */   nop
    /* B164 8001B164 0000C28E */  lw         $v0, 0x0($s6)
    /* B168 8001B168 00000000 */  nop
    /* B16C 8001B16C 07004010 */  beqz       $v0, .L8001B18C
    /* B170 8001B170 02000424 */   addiu     $a0, $zero, 0x2
    /* B174 8001B174 21282002 */  addu       $a1, $s1, $zero
    /* B178 8001B178 21304002 */  addu       $a2, $s2, $zero
    /* B17C 8001B17C B86F000C */  jal        CD_cw
    /* B180 8001B180 21380000 */   addu      $a3, $zero, $zero
    /* B184 8001B184 0A004014 */  bnez       $v0, .L8001B1B0
    /* B188 8001B188 00000000 */   nop
  .L8001B18C:
    /* B18C 8001B18C 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* B190 8001B190 F45E35AC */  sw         $s5, %lo(CD_cbsync)($at)
    /* B194 8001B194 FF008432 */  andi       $a0, $s4, 0xFF
    /* B198 8001B198 21282002 */  addu       $a1, $s1, $zero
    /* B19C 8001B19C 21304002 */  addu       $a2, $s2, $zero
    /* B1A0 8001B1A0 B86F000C */  jal        CD_cw
    /* B1A4 8001B1A4 21380000 */   addu      $a3, $zero, $zero
    /* B1A8 8001B1A8 06004010 */  beqz       $v0, .L8001B1C4
    /* B1AC 8001B1AC 21100000 */   addu      $v0, $zero, $zero
  .L8001B1B0:
    /* B1B0 8001B1B0 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* B1B4 8001B1B4 DCFF1716 */  bne        $s0, $s7, .L8001B128
    /* B1B8 8001B1B8 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* B1BC 8001B1BC 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* B1C0 8001B1C0 F45E35AC */  sw         $s5, %lo(CD_cbsync)($at)
  .L8001B1C4:
    /* B1C4 8001B1C4 06004014 */  bnez       $v0, .L8001B1E0
    /* B1C8 8001B1C8 21200000 */   addu      $a0, $zero, $zero
    /* B1CC 8001B1CC 666E000C */  jal        CD_sync
    /* B1D0 8001B1D0 21284002 */   addu      $a1, $s2, $zero
    /* B1D4 8001B1D4 02004238 */  xori       $v0, $v0, 0x2
    /* B1D8 8001B1D8 796C0008 */  j          .L8001B1E4
    /* B1DC 8001B1DC 0100422C */   sltiu     $v0, $v0, 0x1
  .L8001B1E0:
    /* B1E0 8001B1E0 21100000 */  addu       $v0, $zero, $zero
  .L8001B1E4:
    /* B1E4 8001B1E4 3400BF8F */  lw         $ra, 0x34($sp)
    /* B1E8 8001B1E8 3000BE8F */  lw         $fp, 0x30($sp)
    /* B1EC 8001B1EC 2C00B78F */  lw         $s7, 0x2C($sp)
    /* B1F0 8001B1F0 2800B68F */  lw         $s6, 0x28($sp)
    /* B1F4 8001B1F4 2400B58F */  lw         $s5, 0x24($sp)
    /* B1F8 8001B1F8 2000B48F */  lw         $s4, 0x20($sp)
    /* B1FC 8001B1FC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* B200 8001B200 1800B28F */  lw         $s2, 0x18($sp)
    /* B204 8001B204 1400B18F */  lw         $s1, 0x14($sp)
    /* B208 8001B208 1000B08F */  lw         $s0, 0x10($sp)
    /* B20C 8001B20C 0800E003 */  jr         $ra
    /* B210 8001B210 3800BD27 */   addiu     $sp, $sp, 0x38
endlabel CdControlB
