.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PAK_DoUnpak__FPUcPCUc, 0xA0

glabel PAK_DoUnpak__FPUcPCUc
    /* 9E2C4 800AE2C4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9E2C8 800AE2C8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9E2CC 800AE2CC 21908000 */  addu       $s2, $a0, $zero
    /* 9E2D0 800AE2D0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9E2D4 800AE2D4 2180A000 */  addu       $s0, $a1, $zero
    /* 9E2D8 800AE2D8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9E2DC 800AE2DC 21980000 */  addu       $s3, $zero, $zero
    /* 9E2E0 800AE2E0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 9E2E4 800AE2E4 1400B1AF */  sw         $s1, 0x14($sp)
  .L800AE2E8:
    /* 9E2E8 800AE2E8 00000392 */  lbu        $v1, 0x0($s0)
    /* 9E2EC 800AE2EC 00000000 */  nop
    /* 9E2F0 800AE2F0 80006228 */  slti       $v0, $v1, 0x80
    /* 9E2F4 800AE2F4 05004010 */  beqz       $v0, .L800AE30C
    /* 9E2F8 800AE2F8 01001026 */   addiu     $s0, $s0, 0x1
    /* 9E2FC 800AE2FC 01007124 */  addiu      $s1, $v1, 0x1
    /* 9E300 800AE300 21280002 */  addu       $a1, $s0, $zero
    /* 9E304 800AE304 CAB80208 */  j          .L800AE328
    /* 9E308 800AE308 2180B100 */   addu      $s0, $a1, $s1
  .L800AE30C:
    /* 9E30C 800AE30C 00001192 */  lbu        $s1, 0x0($s0)
    /* 9E310 800AE310 00000000 */  nop
    /* 9E314 800AE314 0A002012 */  beqz       $s1, .L800AE340
    /* 9E318 800AE318 01001026 */   addiu     $s0, $s0, 0x1
    /* 9E31C 800AE31C 00160300 */  sll        $v0, $v1, 24
    /* 9E320 800AE320 03160200 */  sra        $v0, $v0, 24
    /* 9E324 800AE324 21284202 */  addu       $a1, $s2, $v0
  .L800AE328:
    /* 9E328 800AE328 21204002 */  addu       $a0, $s2, $zero
    /* 9E32C 800AE32C 8B67000C */  jal        memcpy
    /* 9E330 800AE330 21302002 */   addu      $a2, $s1, $zero
    /* 9E334 800AE334 21905102 */  addu       $s2, $s2, $s1
    /* 9E338 800AE338 BAB80208 */  j          .L800AE2E8
    /* 9E33C 800AE33C 21987102 */   addu      $s3, $s3, $s1
  .L800AE340:
    /* 9E340 800AE340 21106002 */  addu       $v0, $s3, $zero
    /* 9E344 800AE344 2000BF8F */  lw         $ra, 0x20($sp)
    /* 9E348 800AE348 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9E34C 800AE34C 1800B28F */  lw         $s2, 0x18($sp)
    /* 9E350 800AE350 1400B18F */  lw         $s1, 0x14($sp)
    /* 9E354 800AE354 1000B08F */  lw         $s0, 0x10($sp)
    /* 9E358 800AE358 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9E35C 800AE35C 0800E003 */  jr         $ra
    /* 9E360 800AE360 00000000 */   nop
endlabel PAK_DoUnpak__FPUcPCUc
