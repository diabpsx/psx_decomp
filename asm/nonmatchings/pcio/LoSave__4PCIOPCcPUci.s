.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoSave__4PCIOPCcPUci, 0xD4

glabel LoSave__4PCIOPCcPUci
    /* 76334 80086334 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 76338 80086338 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7633C 8008633C 2188A000 */  addu       $s1, $a1, $zero
    /* 76340 80086340 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 76344 80086344 2198C000 */  addu       $s3, $a2, $zero
    /* 76348 80086348 2000B4AF */  sw         $s4, 0x20($sp)
    /* 7634C 8008634C 21A0E000 */  addu       $s4, $a3, $zero
    /* 76350 80086350 21202002 */  addu       $a0, $s1, $zero
    /* 76354 80086354 01000524 */  addiu      $a1, $zero, 0x1
    /* 76358 80086358 21300000 */  addu       $a2, $zero, $zero
    /* 7635C 8008635C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 76360 80086360 1800B2AF */  sw         $s2, 0x18($sp)
    /* 76364 80086364 AB43000C */  jal        PCopen
    /* 76368 80086368 1000B0AF */   sw        $s0, 0x10($sp)
    /* 7636C 8008636C 21804000 */  addu       $s0, $v0, $zero
    /* 76370 80086370 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 76374 80086374 0D001216 */  bne        $s0, $s2, .L800863AC
    /* 76378 80086378 21200002 */   addu      $a0, $s0, $zero
    /* 7637C 8008637C 21202002 */  addu       $a0, $s1, $zero
    /* 76380 80086380 C043000C */  jal        PCcreat
    /* 76384 80086384 21280000 */   addu      $a1, $zero, $zero
    /* 76388 80086388 21804000 */  addu       $s0, $v0, $zero
    /* 7638C 8008638C 06001216 */  bne        $s0, $s2, .L800863A8
    /* 76390 80086390 00000000 */   nop
    /* 76394 80086394 21200000 */  addu       $a0, $zero, $zero
    /* 76398 80086398 1180053C */  lui        $a1, %hi(D_80110144)
    /* 7639C 8008639C 4401A524 */  addiu      $a1, $a1, %lo(D_80110144)
    /* 763A0 800863A0 A583000C */  jal        DBG_Error
    /* 763A4 800863A4 98000624 */   addiu     $a2, $zero, 0x98
  .L800863A8:
    /* 763A8 800863A8 21200002 */  addu       $a0, $s0, $zero
  .L800863AC:
    /* 763AC 800863AC 21286002 */  addu       $a1, $s3, $zero
    /* 763B0 800863B0 6144000C */  jal        PCwrite
    /* 763B4 800863B4 21308002 */   addu      $a2, $s4, $zero
    /* 763B8 800863B8 B343000C */  jal        PCclose
    /* 763BC 800863BC 21200002 */   addu      $a0, $s0, $zero
    /* 763C0 800863C0 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 763C4 800863C4 07004314 */  bne        $v0, $v1, .L800863E4
    /* 763C8 800863C8 01000224 */   addiu     $v0, $zero, 0x1
    /* 763CC 800863CC 21200000 */  addu       $a0, $zero, $zero
    /* 763D0 800863D0 1180053C */  lui        $a1, %hi(D_80110144)
    /* 763D4 800863D4 4401A524 */  addiu      $a1, $a1, %lo(D_80110144)
    /* 763D8 800863D8 A583000C */  jal        DBG_Error
    /* 763DC 800863DC 9E000624 */   addiu     $a2, $zero, 0x9E
    /* 763E0 800863E0 01000224 */  addiu      $v0, $zero, 0x1
  .L800863E4:
    /* 763E4 800863E4 2400BF8F */  lw         $ra, 0x24($sp)
    /* 763E8 800863E8 2000B48F */  lw         $s4, 0x20($sp)
    /* 763EC 800863EC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 763F0 800863F0 1800B28F */  lw         $s2, 0x18($sp)
    /* 763F4 800863F4 1400B18F */  lw         $s1, 0x14($sp)
    /* 763F8 800863F8 1000B08F */  lw         $s0, 0x10($sp)
    /* 763FC 800863FC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 76400 80086400 0800E003 */  jr         $ra
    /* 76404 80086404 00000000 */   nop
endlabel LoSave__4PCIOPCcPUci
