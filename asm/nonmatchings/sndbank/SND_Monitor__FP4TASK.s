.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SND_Monitor__FP4TASK, 0x8C

glabel SND_Monitor__FP4TASK
    /* 8A198 8009A198 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8A19C 8009A19C 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 8A1A0 8009A1A0 1000B127 */  addiu      $s1, $sp, 0x10
    /* 8A1A4 8009A1A4 2800B0AF */  sw         $s0, 0x28($sp)
    /* 8A1A8 8009A1A8 01001024 */  addiu      $s0, $zero, 0x1
    /* 8A1AC 8009A1AC 3000B2AF */  sw         $s2, 0x30($sp)
    /* 8A1B0 8009A1B0 1280123C */  lui        $s2, %hi(D_8011CD98)
    /* 8A1B4 8009A1B4 98CD5226 */  addiu      $s2, $s2, %lo(D_8011CD98)
    /* 8A1B8 8009A1B8 3400BFAF */  sw         $ra, 0x34($sp)
  .L8009A1BC:
    /* 8A1BC 8009A1BC 1465000C */  jal        SpuGetAllKeysStatus
    /* 8A1C0 8009A1C0 1000A427 */   addiu     $a0, $sp, 0x10
    /* 8A1C4 8009A1C4 02000524 */  addiu      $a1, $zero, 0x2
    /* 8A1C8 8009A1C8 04004426 */  addiu      $a0, $s2, 0x4
    /* 8A1CC 8009A1CC 02002326 */  addiu      $v1, $s1, 0x2
  .L8009A1D0:
    /* 8A1D0 8009A1D0 00006280 */  lb         $v0, 0x0($v1)
    /* 8A1D4 8009A1D4 00000000 */  nop
    /* 8A1D8 8009A1D8 02005010 */  beq        $v0, $s0, .L8009A1E4
    /* 8A1DC 8009A1DC 00000000 */   nop
    /* 8A1E0 8009A1E0 000080A4 */  sh         $zero, 0x0($a0)
  .L8009A1E4:
    /* 8A1E4 8009A1E4 02008424 */  addiu      $a0, $a0, 0x2
    /* 8A1E8 8009A1E8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 8A1EC 8009A1EC 1800A228 */  slti       $v0, $a1, 0x18
    /* 8A1F0 8009A1F0 F7FF4014 */  bnez       $v0, .L8009A1D0
    /* 8A1F4 8009A1F4 01006324 */   addiu     $v1, $v1, 0x1
    /* 8A1F8 8009A1F8 EE80000C */  jal        TSK_Sleep
    /* 8A1FC 8009A1FC 01000424 */   addiu     $a0, $zero, 0x1
    /* 8A200 8009A200 6F680208 */  j          .L8009A1BC
    /* 8A204 8009A204 00000000 */   nop
    /* 8A208 8009A208 3400BF8F */  lw         $ra, 0x34($sp)
    /* 8A20C 8009A20C 3000B28F */  lw         $s2, 0x30($sp)
    /* 8A210 8009A210 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 8A214 8009A214 2800B08F */  lw         $s0, 0x28($sp)
    /* 8A218 8009A218 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 8A21C 8009A21C 0800E003 */  jr         $ra
    /* 8A220 8009A220 00000000 */   nop
endlabel SND_Monitor__FP4TASK
