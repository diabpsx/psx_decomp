.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ParticleExp__FP13MissileStructiiii, 0x98

glabel ParticleExp__FP13MissileStructiiii
    /* 8FFE8 8009FFE8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8FFEC 8009FFEC 2140A000 */  addu       $t0, $a1, $zero
    /* 8FFF0 8009FFF0 F0FFC524 */  addiu      $a1, $a2, -0x10
    /* 8FFF4 8009FFF4 6409828F */  lw         $v0, %gp_rel(SetParticle)($gp)
    /* 8FFF8 8009FFF8 4800A68F */  lw         $a2, 0x48($sp)
    /* 8FFFC 8009FFFC 0B004010 */  beqz       $v0, .L800A002C
    /* 90000 800A0000 3000BFAF */   sw        $ra, 0x30($sp)
    /* 90004 800A0004 2E008284 */  lh         $v0, 0x2E($a0)
    /* 90008 800A0008 640980AF */  sw         $zero, %gp_rel(SetParticle)($gp)
    /* 9000C 800A000C 02004014 */  bnez       $v0, .L800A0018
    /* 90010 800A0010 10000224 */   addiu     $v0, $zero, 0x10
    /* 90014 800A0014 680982AF */  sw         $v0, %gp_rel(D_8011B0E8)($gp)
  .L800A0018:
    /* 90018 800A0018 2E008384 */  lh         $v1, 0x2E($a0)
    /* 9001C 800A001C 01000224 */  addiu      $v0, $zero, 0x1
    /* 90020 800A0020 03006214 */  bne        $v1, $v0, .L800A0030
    /* 90024 800A0024 10000224 */   addiu     $v0, $zero, 0x10
    /* 90028 800A0028 6C0982AF */  sw         $v0, %gp_rel(D_8011B0EC)($gp)
  .L800A002C:
    /* 9002C 800A002C 10000224 */  addiu      $v0, $zero, 0x10
  .L800A0030:
    /* 90030 800A0030 1000A2AF */  sw         $v0, 0x10($sp)
    /* 90034 800A0034 00F00234 */  ori        $v0, $zero, 0xF000
    /* 90038 800A0038 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9003C 800A003C 00100224 */  addiu      $v0, $zero, 0x1000
    /* 90040 800A0040 1800A2AF */  sw         $v0, 0x18($sp)
    /* 90044 800A0044 01000224 */  addiu      $v0, $zero, 0x1
    /* 90048 800A0048 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 9004C 800A004C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 90050 800A0050 2400A7AF */  sw         $a3, 0x24($sp)
    /* 90054 800A0054 2800A6AF */  sw         $a2, 0x28($sp)
    /* 90058 800A0058 2E008284 */  lh         $v0, 0x2E($a0)
    /* 9005C 800A005C 21200001 */  addu       $a0, $t0, $zero
    /* 90060 800A0060 21300000 */  addu       $a2, $zero, $zero
    /* 90064 800A0064 21380000 */  addu       $a3, $zero, $zero
    /* 90068 800A0068 AD7D020C */  jal        doparticlechain__Fiiiiiiiiiiii
    /* 9006C 800A006C 2C00A2AF */   sw        $v0, 0x2C($sp)
    /* 90070 800A0070 3000BF8F */  lw         $ra, 0x30($sp)
    /* 90074 800A0074 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 90078 800A0078 0800E003 */  jr         $ra
    /* 9007C 800A007C 00000000 */   nop
endlabel ParticleExp__FP13MissileStructiiii
