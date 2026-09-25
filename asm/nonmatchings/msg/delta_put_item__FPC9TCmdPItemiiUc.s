.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_put_item__FPC9TCmdPItemiiUc, 0x18C

glabel delta_put_item__FPC9TCmdPItemiiUc
    /* 3F164 8004F164 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3F168 8004F168 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3F16C 8004F16C 21808000 */  addu       $s0, $a0, $zero
    /* 3F170 8004F170 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3F174 8004F174 2190A000 */  addu       $s2, $a1, $zero
    /* 3F178 8004F178 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 3F17C 8004F17C 2198C000 */  addu       $s3, $a2, $zero
    /* 3F180 8004F180 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3F184 8004F184 2188E000 */  addu       $s1, $a3, $zero
    /* 3F188 8004F188 1280053C */  lui        $a1, %hi(setlevel)
    /* 3F18C 8004F18C 0EC1A590 */  lbu        $a1, %lo(setlevel)($a1)
    /* 3F190 8004F190 FF002432 */  andi       $a0, $s1, 0xFF
    /* 3F194 8004F194 2000BFAF */  sw         $ra, 0x20($sp)
    /* 3F198 8004F198 224A010C */  jal        GetDLevel__Fib
    /* 3F19C 8004F19C 2B280500 */   sltu      $a1, $zero, $a1
    /* 3F1A0 8004F1A0 21484000 */  addu       $t1, $v0, $zero
    /* 3F1A4 8004F1A4 21382001 */  addu       $a3, $t1, $zero
    /* 3F1A8 8004F1A8 21400000 */  addu       $t0, $zero, $zero
    /* 3F1AC 8004F1AC 01000624 */  addiu      $a2, $zero, 0x1
    /* 3F1B0 8004F1B0 10002525 */  addiu      $a1, $t1, 0x10
  .L8004F1B4:
    /* 3F1B4 8004F1B4 0000E490 */  lbu        $a0, 0x0($a3)
    /* 3F1B8 8004F1B8 00000000 */  nop
    /* 3F1BC 8004F1BC 14008610 */  beq        $a0, $a2, .L8004F210
    /* 3F1C0 8004F1C0 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 3F1C4 8004F1C4 12008210 */  beq        $a0, $v0, .L8004F210
    /* 3F1C8 8004F1C8 00000000 */   nop
    /* 3F1CC 8004F1CC FAFFA394 */  lhu        $v1, -0x6($a1)
    /* 3F1D0 8004F1D0 0A000296 */  lhu        $v0, 0xA($s0)
    /* 3F1D4 8004F1D4 00000000 */  nop
    /* 3F1D8 8004F1D8 0D006214 */  bne        $v1, $v0, .L8004F210
    /* 3F1DC 8004F1DC 00000000 */   nop
    /* 3F1E0 8004F1E0 FCFFA394 */  lhu        $v1, -0x4($a1)
    /* 3F1E4 8004F1E4 0C000296 */  lhu        $v0, 0xC($s0)
    /* 3F1E8 8004F1E8 00000000 */  nop
    /* 3F1EC 8004F1EC 08006214 */  bne        $v1, $v0, .L8004F210
    /* 3F1F0 8004F1F0 00000000 */   nop
    /* 3F1F4 8004F1F4 0000A38C */  lw         $v1, 0x0($a1)
    /* 3F1F8 8004F1F8 1000028E */  lw         $v0, 0x10($s0)
    /* 3F1FC 8004F1FC 00000000 */  nop
    /* 3F200 8004F200 03006214 */  bne        $v1, $v0, .L8004F210
    /* 3F204 8004F204 02000224 */   addiu     $v0, $zero, 0x2
    /* 3F208 8004F208 2E008210 */  beq        $a0, $v0, .L8004F2C4
    /* 3F20C 8004F20C 00000000 */   nop
  .L8004F210:
    /* 3F210 8004F210 01000825 */  addiu      $t0, $t0, 0x1
    /* 3F214 8004F214 1800A524 */  addiu      $a1, $a1, 0x18
    /* 3F218 8004F218 7F000229 */  slti       $v0, $t0, 0x7F
    /* 3F21C 8004F21C E5FF4014 */  bnez       $v0, .L8004F1B4
    /* 3F220 8004F220 1800E724 */   addiu     $a3, $a3, 0x18
    /* 3F224 8004F224 344A010C */  jal        ReleaseDLevel__FP6DLevel
    /* 3F228 8004F228 21202001 */   addu      $a0, $t1, $zero
    /* 3F22C 8004F22C 1280053C */  lui        $a1, %hi(setlevel)
    /* 3F230 8004F230 0EC1A590 */  lbu        $a1, %lo(setlevel)($a1)
    /* 3F234 8004F234 FF002432 */  andi       $a0, $s1, 0xFF
    /* 3F238 8004F238 224A010C */  jal        GetDLevel__Fib
    /* 3F23C 8004F23C 2B280500 */   sltu      $a1, $zero, $a1
    /* 3F240 8004F240 21484000 */  addu       $t1, $v0, $zero
    /* 3F244 8004F244 21382001 */  addu       $a3, $t1, $zero
    /* 3F248 8004F248 21400000 */  addu       $t0, $zero, $zero
    /* 3F24C 8004F24C FF000324 */  addiu      $v1, $zero, 0xFF
    /* 3F250 8004F250 01000424 */  addiu      $a0, $zero, 0x1
    /* 3F254 8004F254 02000A24 */  addiu      $t2, $zero, 0x2
    /* 3F258 8004F258 02002625 */  addiu      $a2, $t1, 0x2
  .L8004F25C:
    /* 3F25C 8004F25C 0000E290 */  lbu        $v0, 0x0($a3)
    /* 3F260 8004F260 00000000 */  nop
    /* 3F264 8004F264 13004314 */  bne        $v0, $v1, .L8004F2B4
    /* 3F268 8004F268 01000825 */   addiu     $t0, $t0, 0x1
    /* 3F26C 8004F26C B52084A3 */  sb         $a0, %gp_rel(D_8011C835)($gp)
    /* 3F270 8004F270 0000028E */  lw         $v0, 0x0($s0)
    /* 3F274 8004F274 0400038E */  lw         $v1, 0x4($s0)
    /* 3F278 8004F278 0800048E */  lw         $a0, 0x8($s0)
    /* 3F27C 8004F27C 0C00058E */  lw         $a1, 0xC($s0)
    /* 3F280 8004F280 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3F284 8004F284 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3F288 8004F288 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3F28C 8004F28C 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3F290 8004F290 1000028E */  lw         $v0, 0x10($s0)
    /* 3F294 8004F294 1400038E */  lw         $v1, 0x14($s0)
    /* 3F298 8004F298 1000E2AC */  sw         $v0, 0x10($a3)
    /* 3F29C 8004F29C 1400E3AC */  sw         $v1, 0x14($a3)
    /* 3F2A0 8004F2A0 21202001 */  addu       $a0, $t1, $zero
    /* 3F2A4 8004F2A4 0000EAA0 */  sb         $t2, 0x0($a3)
    /* 3F2A8 8004F2A8 FFFFD2A0 */  sb         $s2, -0x1($a2)
    /* 3F2AC 8004F2AC B23C0108 */  j          .L8004F2C8
    /* 3F2B0 8004F2B0 0000D3A0 */   sb        $s3, 0x0($a2)
  .L8004F2B4:
    /* 3F2B4 8004F2B4 1800C624 */  addiu      $a2, $a2, 0x18
    /* 3F2B8 8004F2B8 7F000229 */  slti       $v0, $t0, 0x7F
    /* 3F2BC 8004F2BC E7FF4014 */  bnez       $v0, .L8004F25C
    /* 3F2C0 8004F2C0 1800E724 */   addiu     $a3, $a3, 0x18
  .L8004F2C4:
    /* 3F2C4 8004F2C4 21202001 */  addu       $a0, $t1, $zero
  .L8004F2C8:
    /* 3F2C8 8004F2C8 344A010C */  jal        ReleaseDLevel__FP6DLevel
    /* 3F2CC 8004F2CC 00000000 */   nop
    /* 3F2D0 8004F2D0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 3F2D4 8004F2D4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 3F2D8 8004F2D8 1800B28F */  lw         $s2, 0x18($sp)
    /* 3F2DC 8004F2DC 1400B18F */  lw         $s1, 0x14($sp)
    /* 3F2E0 8004F2E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 3F2E4 8004F2E4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 3F2E8 8004F2E8 0800E003 */  jr         $ra
    /* 3F2EC 8004F2EC 00000000 */   nop
endlabel delta_put_item__FPC9TCmdPItemiiUc
