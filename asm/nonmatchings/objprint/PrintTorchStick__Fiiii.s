.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintTorchStick__Fiiii, 0x94

glabel PrintTorchStick__Fiiii
    /* 6E304 8007E304 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 6E308 8007E308 2800B2AF */  sw         $s2, 0x28($sp)
    /* 6E30C 8007E30C 21908000 */  addu       $s2, $a0, $zero
    /* 6E310 8007E310 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 6E314 8007E314 2198A000 */  addu       $s3, $a1, $zero
    /* 6E318 8007E318 2400B1AF */  sw         $s1, 0x24($sp)
    /* 6E31C 8007E31C 2188C000 */  addu       $s1, $a2, $zero
    /* 6E320 8007E320 3000B4AF */  sw         $s4, 0x30($sp)
    /* 6E324 8007E324 21A0E000 */  addu       $s4, $a3, $zero
    /* 6E328 8007E328 3400BFAF */  sw         $ra, 0x34($sp)
    /* 6E32C 8007E32C 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 6E330 8007E330 2000B0AF */   sw        $s0, 0x20($sp)
    /* 6E334 8007E334 21804000 */  addu       $s0, $v0, $zero
    /* 6E338 8007E338 0E000012 */  beqz       $s0, .L8007E374
    /* 6E33C 8007E33C 21200002 */   addu      $a0, $s0, $zero
    /* 6E340 8007E340 04000524 */  addiu      $a1, $zero, 0x4
    /* 6E344 8007E344 21300000 */  addu       $a2, $zero, $zero
    /* 6E348 8007E348 21380000 */  addu       $a3, $zero, $zero
    /* 6E34C 8007E34C A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6E350 8007E350 1000B1AF */   sw        $s1, 0x10($sp)
    /* 6E354 8007E354 21200002 */  addu       $a0, $s0, $zero
    /* 6E358 8007E358 21284000 */  addu       $a1, $v0, $zero
    /* 6E35C 8007E35C 21304002 */  addu       $a2, $s2, $zero
    /* 6E360 8007E360 21386002 */  addu       $a3, $s3, $zero
    /* 6E364 8007E364 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6E368 8007E368 1400B4AF */  sw         $s4, 0x14($sp)
    /* 6E36C 8007E36C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6E370 8007E370 1800A0AF */   sw        $zero, 0x18($sp)
  .L8007E374:
    /* 6E374 8007E374 3400BF8F */  lw         $ra, 0x34($sp)
    /* 6E378 8007E378 3000B48F */  lw         $s4, 0x30($sp)
    /* 6E37C 8007E37C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 6E380 8007E380 2800B28F */  lw         $s2, 0x28($sp)
    /* 6E384 8007E384 2400B18F */  lw         $s1, 0x24($sp)
    /* 6E388 8007E388 2000B08F */  lw         $s0, 0x20($sp)
    /* 6E38C 8007E38C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 6E390 8007E390 0800E003 */  jr         $ra
    /* 6E394 8007E394 00000000 */   nop
endlabel PrintTorchStick__Fiiii
