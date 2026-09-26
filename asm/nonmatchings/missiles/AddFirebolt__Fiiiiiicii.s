.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFirebolt__Fiiiiiicii, 0x238

glabel AddFirebolt__Fiiiiiicii
    /* 40A0 8013DC98 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 40A4 8013DC9C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 40A8 8013DCA0 5000B48F */  lw         $s4, 0x50($sp)
    /* 40AC 8013DCA4 5400A28F */  lw         $v0, 0x54($sp)
    /* 40B0 8013DCA8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 40B4 8013DCAC 21888000 */  addu       $s1, $a0, $zero
    /* 40B8 8013DCB0 3400B5AF */  sw         $s5, 0x34($sp)
    /* 40BC 8013DCB4 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 40C0 8013DCB8 5800A493 */  lbu        $a0, 0x58($sp)
    /* 40C4 8013DCBC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 40C8 8013DCC0 2180A000 */  addu       $s0, $a1, $zero
    /* 40CC 8013DCC4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 40D0 8013DCC8 2190C000 */  addu       $s2, $a2, $zero
    /* 40D4 8013DCCC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 40D8 8013DCD0 2198E000 */  addu       $s3, $a3, $zero
    /* 40DC 8013DCD4 0B001316 */  bne        $s0, $s3, .L8013DD04
    /* 40E0 8013DCD8 3800BFAF */   sw        $ra, 0x38($sp)
    /* 40E4 8013DCDC 09005416 */  bne        $s2, $s4, .L8013DD04
    /* 40E8 8013DCE0 80100200 */   sll       $v0, $v0, 2
    /* 40EC 8013DCE4 1080013C */  lui        $at, %hi(XDirAdd)
    /* 40F0 8013DCE8 21082200 */  addu       $at, $at, $v0
    /* 40F4 8013DCEC D829238C */  lw         $v1, %lo(XDirAdd)($at)
    /* 40F8 8013DCF0 1080013C */  lui        $at, %hi(YDirAdd)
    /* 40FC 8013DCF4 21082200 */  addu       $at, $at, $v0
    /* 4100 8013DCF8 F829228C */  lw         $v0, %lo(YDirAdd)($at)
    /* 4104 8013DCFC 21980302 */  addu       $s3, $s0, $v1
    /* 4108 8013DD00 21A04202 */  addu       $s4, $s2, $v0
  .L8013DD04:
    /* 410C 8013DD04 40008014 */  bnez       $a0, .L8013DE08
    /* 4110 8013DD08 1A000324 */   addiu     $v1, $zero, 0x1A
    /* 4114 8013DD0C 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* 4118 8013DD10 00000000 */  nop
    /* 411C 8013DD14 23004018 */  blez       $v0, .L8013DDA4
    /* 4120 8013DD18 21200000 */   addu      $a0, $zero, $zero
    /* 4124 8013DD1C 02000724 */  addiu      $a3, $zero, 0x2
    /* 4128 8013DD20 21304000 */  addu       $a2, $v0, $zero
    /* 412C 8013DD24 1080053C */  lui        $a1, %hi(missileactive)
    /* 4130 8013DD28 602AA524 */  addiu      $a1, $a1, %lo(missileactive)
  .L8013DD2C:
    /* 4134 8013DD2C 0000A284 */  lh         $v0, 0x0($a1)
    /* 4138 8013DD30 00000000 */  nop
    /* 413C 8013DD34 80180200 */  sll        $v1, $v0, 2
    /* 4140 8013DD38 21186200 */  addu       $v1, $v1, $v0
    /* 4144 8013DD3C 80180300 */  sll        $v1, $v1, 2
    /* 4148 8013DD40 23186200 */  subu       $v1, $v1, $v0
    /* 414C 8013DD44 80180300 */  sll        $v1, $v1, 2
    /* 4150 8013DD48 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 4154 8013DD4C 21082300 */  addu       $at, $at, $v1
    /* 4158 8013DD50 882C2280 */  lb         $v0, %lo(missile + 0x30)($at)
    /* 415C 8013DD54 00000000 */  nop
    /* 4160 8013DD58 0D004714 */  bne        $v0, $a3, .L8013DD90
    /* 4164 8013DD5C 00000000 */   nop
    /* 4168 8013DD60 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 416C 8013DD64 21082300 */  addu       $at, $at, $v1
    /* 4170 8013DD68 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 4174 8013DD6C 00000000 */  nop
    /* 4178 8013DD70 07005514 */  bne        $v0, $s5, .L8013DD90
    /* 417C 8013DD74 00000000 */   nop
    /* 4180 8013DD78 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 4184 8013DD7C 21082300 */  addu       $at, $at, $v1
    /* 4188 8013DD80 7A2C2284 */  lh         $v0, %lo(missile + 0x22)($at)
    /* 418C 8013DD84 00000000 */  nop
    /* 4190 8013DD88 05005110 */  beq        $v0, $s1, .L8013DDA0
    /* 4194 8013DD8C 00000000 */   nop
  .L8013DD90:
    /* 4198 8013DD90 01008424 */  addiu      $a0, $a0, 0x1
    /* 419C 8013DD94 2A108600 */  slt        $v0, $a0, $a2
    /* 41A0 8013DD98 E4FF4014 */  bnez       $v0, .L8013DD2C
    /* 41A4 8013DD9C 0200A524 */   addiu     $a1, $a1, 0x2
  .L8013DDA0:
    /* 41A8 8013DDA0 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
  .L8013DDA4:
    /* 41AC 8013DDA4 00000000 */  nop
    /* 41B0 8013DDA8 05008214 */  bne        $a0, $v0, .L8013DDC0
    /* 41B4 8013DDAC FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 41B8 8013DDB0 2120A002 */  addu       $a0, $s5, $zero
    /* 41BC 8013DDB4 C2DC010C */  jal        UseMana__Fii
    /* 41C0 8013DDB8 01000524 */   addiu     $a1, $zero, 0x1
    /* 41C4 8013DDBC FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8013DDC0:
    /* 41C8 8013DDC0 1000A212 */  beq        $s5, $v0, .L8013DE04
    /* 41CC 8013DDC4 80101100 */   sll       $v0, $s1, 2
    /* 41D0 8013DDC8 21105100 */  addu       $v0, $v0, $s1
    /* 41D4 8013DDCC 80100200 */  sll        $v0, $v0, 2
    /* 41D8 8013DDD0 23105100 */  subu       $v0, $v0, $s1
    /* 41DC 8013DDD4 80100200 */  sll        $v0, $v0, 2
    /* 41E0 8013DDD8 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 41E4 8013DDDC 21082200 */  addu       $at, $at, $v0
    /* 41E8 8013DDE0 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* 41EC 8013DDE4 00000000 */  nop
    /* 41F0 8013DDE8 40100200 */  sll        $v0, $v0, 1
    /* 41F4 8013DDEC 10004324 */  addiu      $v1, $v0, 0x10
    /* 41F8 8013DDF0 3F006228 */  slti       $v0, $v1, 0x3F
    /* 41FC 8013DDF4 05004014 */  bnez       $v0, .L8013DE0C
    /* 4200 8013DDF8 21202002 */   addu      $a0, $s1, $zero
    /* 4204 8013DDFC 83F70408 */  j          .L8013DE0C
    /* 4208 8013DE00 3F000324 */   addiu     $v1, $zero, 0x3F
  .L8013DE04:
    /* 420C 8013DE04 10000324 */  addiu      $v1, $zero, 0x10
  .L8013DE08:
    /* 4210 8013DE08 21202002 */  addu       $a0, $s1, $zero
  .L8013DE0C:
    /* 4214 8013DE0C 21280002 */  addu       $a1, $s0, $zero
    /* 4218 8013DE10 21304002 */  addu       $a2, $s2, $zero
    /* 421C 8013DE14 21386002 */  addu       $a3, $s3, $zero
    /* 4220 8013DE18 1000B4AF */  sw         $s4, 0x10($sp)
    /* 4224 8013DE1C 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 4228 8013DE20 1400A3AF */   sw        $v1, 0x14($sp)
    /* 422C 8013DE24 21200002 */  addu       $a0, $s0, $zero
    /* 4230 8013DE28 21284002 */  addu       $a1, $s2, $zero
    /* 4234 8013DE2C 21306002 */  addu       $a2, $s3, $zero
    /* 4238 8013DE30 2CE9040C */  jal        GetDirection8__Fiiii
    /* 423C 8013DE34 21388002 */   addu      $a3, $s4, $zero
    /* 4240 8013DE38 21202002 */  addu       $a0, $s1, $zero
    /* 4244 8013DE3C 09F5040C */  jal        SetMissDir__Fii
    /* 4248 8013DE40 21284000 */   addu      $a1, $v0, $zero
    /* 424C 8013DE44 21200002 */  addu       $a0, $s0, $zero
    /* 4250 8013DE48 21284002 */  addu       $a1, $s2, $zero
    /* 4254 8013DE4C 80801100 */  sll        $s0, $s1, 2
    /* 4258 8013DE50 21801102 */  addu       $s0, $s0, $s1
    /* 425C 8013DE54 80801000 */  sll        $s0, $s0, 2
    /* 4260 8013DE58 23801102 */  subu       $s0, $s0, $s1
    /* 4264 8013DE5C 80801000 */  sll        $s0, $s0, 2
    /* 4268 8013DE60 00010224 */  addiu      $v0, $zero, 0x100
    /* 426C 8013DE64 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 4270 8013DE68 21083000 */  addu       $at, $at, $s0
    /* 4274 8013DE6C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 4278 8013DE70 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 427C 8013DE74 21083000 */  addu       $at, $at, $s0
    /* 4280 8013DE78 762C24A4 */  sh         $a0, %lo(missile + 0x1E)($at)
    /* 4284 8013DE7C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 4288 8013DE80 21083000 */  addu       $at, $at, $s0
    /* 428C 8013DE84 782C25A4 */  sh         $a1, %lo(missile + 0x20)($at)
    /* 4290 8013DE88 BA34010C */  jal        AddLight__Fiii
    /* 4294 8013DE8C 96000624 */   addiu     $a2, $zero, 0x96
    /* 4298 8013DE90 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 429C 8013DE94 21083000 */  addu       $at, $at, $s0
    /* 42A0 8013DE98 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 42A4 8013DE9C 01000224 */  addiu      $v0, $zero, 0x1
    /* 42A8 8013DEA0 1280013C */  lui        $at, %hi(SetParticle)
    /* 42AC 8013DEA4 E4B022AC */  sw         $v0, %lo(SetParticle)($at)
    /* 42B0 8013DEA8 3800BF8F */  lw         $ra, 0x38($sp)
    /* 42B4 8013DEAC 3400B58F */  lw         $s5, 0x34($sp)
    /* 42B8 8013DEB0 3000B48F */  lw         $s4, 0x30($sp)
    /* 42BC 8013DEB4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 42C0 8013DEB8 2800B28F */  lw         $s2, 0x28($sp)
    /* 42C4 8013DEBC 2400B18F */  lw         $s1, 0x24($sp)
    /* 42C8 8013DEC0 2000B08F */  lw         $s0, 0x20($sp)
    /* 42CC 8013DEC4 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 42D0 8013DEC8 0800E003 */  jr         $ra
    /* 42D4 8013DECC 00000000 */   nop
endlabel AddFirebolt__Fiiiiiicii
