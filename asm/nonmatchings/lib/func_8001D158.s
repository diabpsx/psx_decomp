.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001D158, 0xA4

glabel func_8001D158
    /* D158 8001D158 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* D15C 8001D15C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* D160 8001D160 21988000 */  addu       $s3, $a0, $zero
    /* D164 8001D164 2000B4AF */  sw         $s4, 0x20($sp)
    /* D168 8001D168 21A0A000 */  addu       $s4, $a1, $zero
    /* D16C 8001D16C 1000B0AF */  sw         $s0, 0x10($sp)
    /* D170 8001D170 21800000 */  addu       $s0, $zero, $zero
    /* D174 8001D174 1800B2AF */  sw         $s2, 0x18($sp)
    /* D178 8001D178 1380123C */  lui        $s2, %hi(D_8013077C)
    /* D17C 8001D17C 7C075226 */  addiu      $s2, $s2, %lo(D_8013077C)
    /* D180 8001D180 1400B1AF */  sw         $s1, 0x14($sp)
    /* D184 8001D184 21880000 */  addu       $s1, $zero, $zero
    /* D188 8001D188 2400BFAF */  sw         $ra, 0x24($sp)
  .L8001D18C:
    /* D18C 8001D18C 1380023C */  lui        $v0, %hi(D_80130774)
    /* D190 8001D190 21105100 */  addu       $v0, $v0, $s1
    /* D194 8001D194 7407428C */  lw         $v0, %lo(D_80130774)($v0)
    /* D198 8001D198 00000000 */  nop
    /* D19C 8001D19C 0E004010 */  beqz       $v0, .L8001D1D8
    /* D1A0 8001D1A0 00000000 */   nop
    /* D1A4 8001D1A4 07005314 */  bne        $v0, $s3, .L8001D1C4
    /* D1A8 8001D1A8 21208002 */   addu      $a0, $s4, $zero
    /* D1AC 8001D1AC 7F67000C */  jal        strcmp
    /* D1B0 8001D1B0 21284002 */   addu      $a1, $s2, $zero
    /* D1B4 8001D1B4 04004014 */  bnez       $v0, .L8001D1C8
    /* D1B8 8001D1B8 2C005226 */   addiu     $s2, $s2, 0x2C
    /* D1BC 8001D1BC 77740008 */  j          .L8001D1DC
    /* D1C0 8001D1C0 01000226 */   addiu     $v0, $s0, 0x1
  .L8001D1C4:
    /* D1C4 8001D1C4 2C005226 */  addiu      $s2, $s2, 0x2C
  .L8001D1C8:
    /* D1C8 8001D1C8 01001026 */  addiu      $s0, $s0, 0x1
    /* D1CC 8001D1CC 8000022A */  slti       $v0, $s0, 0x80
    /* D1D0 8001D1D0 EEFF4014 */  bnez       $v0, .L8001D18C
    /* D1D4 8001D1D4 2C003126 */   addiu     $s1, $s1, 0x2C
  .L8001D1D8:
    /* D1D8 8001D1D8 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8001D1DC:
    /* D1DC 8001D1DC 2400BF8F */  lw         $ra, 0x24($sp)
    /* D1E0 8001D1E0 2000B48F */  lw         $s4, 0x20($sp)
    /* D1E4 8001D1E4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* D1E8 8001D1E8 1800B28F */  lw         $s2, 0x18($sp)
    /* D1EC 8001D1EC 1400B18F */  lw         $s1, 0x14($sp)
    /* D1F0 8001D1F0 1000B08F */  lw         $s0, 0x10($sp)
    /* D1F4 8001D1F4 0800E003 */  jr         $ra
    /* D1F8 8001D1F8 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel func_8001D158
