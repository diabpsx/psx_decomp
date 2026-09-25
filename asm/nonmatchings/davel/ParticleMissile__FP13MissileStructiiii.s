.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ParticleMissile__FP13MissileStructiiii, 0xBC

glabel ParticleMissile__FP13MissileStructiiii
    /* 8FA04 8009FA04 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8FA08 8009FA08 21408000 */  addu       $t0, $a0, $zero
    /* 8FA0C 8009FA0C 2120A000 */  addu       $a0, $a1, $zero
    /* 8FA10 8009FA10 F0FFC524 */  addiu      $a1, $a2, -0x10
    /* 8FA14 8009FA14 6409828F */  lw         $v0, %gp_rel(SetParticle)($gp)
    /* 8FA18 8009FA18 4800A68F */  lw         $a2, 0x48($sp)
    /* 8FA1C 8009FA1C 0B004010 */  beqz       $v0, .L8009FA4C
    /* 8FA20 8009FA20 3000BFAF */   sw        $ra, 0x30($sp)
    /* 8FA24 8009FA24 2E000285 */  lh         $v0, 0x2E($t0)
    /* 8FA28 8009FA28 640980AF */  sw         $zero, %gp_rel(SetParticle)($gp)
    /* 8FA2C 8009FA2C 02004014 */  bnez       $v0, .L8009FA38
    /* 8FA30 8009FA30 01000224 */   addiu     $v0, $zero, 0x1
    /* 8FA34 8009FA34 680982AF */  sw         $v0, %gp_rel(D_8011B0E8)($gp)
  .L8009FA38:
    /* 8FA38 8009FA38 2E000385 */  lh         $v1, 0x2E($t0)
    /* 8FA3C 8009FA3C 01000224 */  addiu      $v0, $zero, 0x1
    /* 8FA40 8009FA40 02006214 */  bne        $v1, $v0, .L8009FA4C
    /* 8FA44 8009FA44 00000000 */   nop
    /* 8FA48 8009FA48 6C0983AF */  sw         $v1, %gp_rel(D_8011B0EC)($gp)
  .L8009FA4C:
    /* 8FA4C 8009FA4C 30000281 */  lb         $v0, 0x30($t0)
    /* 8FA50 8009FA50 01000324 */  addiu      $v1, $zero, 0x1
    /* 8FA54 8009FA54 06004314 */  bne        $v0, $v1, .L8009FA70
    /* 8FA58 8009FA58 08000224 */   addiu     $v0, $zero, 0x8
    /* 8FA5C 8009FA5C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8FA60 8009FA60 00800234 */  ori        $v0, $zero, 0x8000
    /* 8FA64 8009FA64 1400A2AF */  sw         $v0, 0x14($sp)
    /* 8FA68 8009FA68 A07E0208 */  j          .L8009FA80
    /* 8FA6C 8009FA6C 00100224 */   addiu     $v0, $zero, 0x1000
  .L8009FA70:
    /* 8FA70 8009FA70 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8FA74 8009FA74 00F00234 */  ori        $v0, $zero, 0xF000
    /* 8FA78 8009FA78 1400A2AF */  sw         $v0, 0x14($sp)
    /* 8FA7C 8009FA7C 00200224 */  addiu      $v0, $zero, 0x2000
  .L8009FA80:
    /* 8FA80 8009FA80 1800A2AF */  sw         $v0, 0x18($sp)
    /* 8FA84 8009FA84 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 8FA88 8009FA88 2000A0AF */  sw         $zero, 0x20($sp)
    /* 8FA8C 8009FA8C 2400A7AF */  sw         $a3, 0x24($sp)
    /* 8FA90 8009FA90 2800A6AF */  sw         $a2, 0x28($sp)
    /* 8FA94 8009FA94 2E000285 */  lh         $v0, 0x2E($t0)
    /* 8FA98 8009FA98 00000000 */  nop
    /* 8FA9C 8009FA9C 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 8FAA0 8009FAA0 0000068D */  lw         $a2, 0x0($t0)
    /* 8FAA4 8009FAA4 0400078D */  lw         $a3, 0x4($t0)
    /* 8FAA8 8009FAA8 AD7D020C */  jal        doparticlechain__Fiiiiiiiiiiii
    /* 8FAAC 8009FAAC 00000000 */   nop
    /* 8FAB0 8009FAB0 3000BF8F */  lw         $ra, 0x30($sp)
    /* 8FAB4 8009FAB4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 8FAB8 8009FAB8 0800E003 */  jr         $ra
    /* 8FABC 8009FABC 00000000 */   nop
endlabel ParticleMissile__FP13MissileStructiiii
