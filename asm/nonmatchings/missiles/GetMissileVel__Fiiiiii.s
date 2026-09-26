.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetMissileVel__Fiiiiii, 0x1BC

glabel GetMissileVel__Fiiiiii
    /* D90 8013A988 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* D94 8013A98C 2800B6AF */  sw         $s6, 0x28($sp)
    /* D98 8013A990 21B08000 */  addu       $s6, $a0, $zero
    /* D9C 8013A994 1400B1AF */  sw         $s1, 0x14($sp)
    /* DA0 8013A998 1000B0AF */  sw         $s0, 0x10($sp)
    /* DA4 8013A99C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* DA8 8013A9A0 1800B2AF */  sw         $s2, 0x18($sp)
    /* DAC 8013A9A4 2400B5AF */  sw         $s5, 0x24($sp)
    /* DB0 8013A9A8 2000B4AF */  sw         $s4, 0x20($sp)
    /* DB4 8013A9AC 4800A38F */  lw         $v1, 0x48($sp)
    /* DB8 8013A9B0 2328E500 */  subu       $a1, $a3, $a1
    /* DBC 8013A9B4 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* DC0 8013A9B8 4C00B78F */  lw         $s7, 0x4C($sp)
    /* DC4 8013A9BC 40290500 */  sll        $a1, $a1, 5
    /* DC8 8013A9C0 3000BFAF */  sw         $ra, 0x30($sp)
    /* DCC 8013A9C4 23186600 */  subu       $v1, $v1, $a2
    /* DD0 8013A9C8 40190300 */  sll        $v1, $v1, 5
    /* DD4 8013A9CC 2310A300 */  subu       $v0, $a1, $v1
    /* DD8 8013A9D0 00140200 */  sll        $v0, $v0, 16
    /* DDC 8013A9D4 21804000 */  addu       $s0, $v0, $zero
    /* DE0 8013A9D8 C38F0200 */  sra        $s1, $v0, 31
    /* DE4 8013A9DC 2128A300 */  addu       $a1, $a1, $v1
    /* DE8 8013A9E0 002C0500 */  sll        $a1, $a1, 16
    /* DEC 8013A9E4 2190A000 */  addu       $s2, $a1, $zero
    /* DF0 8013A9E8 C39F0500 */  sra        $s3, $a1, 31
    /* DF4 8013A9EC 21200002 */  addu       $a0, $s0, $zero
    /* DF8 8013A9F0 1A2F010C */  jal        veclen2__Fii
    /* DFC 8013A9F4 21284002 */   addu      $a1, $s2, $zero
    /* E00 8013A9F8 21A04000 */  addu       $s4, $v0, $zero
    /* E04 8013A9FC 06000016 */  bnez       $s0, .L8013AA18
    /* E08 8013AA00 C3AF0200 */   sra       $s5, $v0, 31
    /* E0C 8013AA04 04002016 */  bnez       $s1, .L8013AA18
    /* E10 8013AA08 00000000 */   nop
    /* E14 8013AA0C 01001026 */  addiu      $s0, $s0, 0x1
    /* E18 8013AA10 0100022E */  sltiu      $v0, $s0, 0x1
    /* E1C 8013AA14 21882202 */  addu       $s1, $s1, $v0
  .L8013AA18:
    /* E20 8013AA18 06004016 */  bnez       $s2, .L8013AA34
    /* E24 8013AA1C 00000000 */   nop
    /* E28 8013AA20 04006016 */  bnez       $s3, .L8013AA34
    /* E2C 8013AA24 00000000 */   nop
    /* E30 8013AA28 01005226 */  addiu      $s2, $s2, 0x1
    /* E34 8013AA2C 0100422E */  sltiu      $v0, $s2, 0x1
    /* E38 8013AA30 21986202 */  addu       $s3, $s3, $v0
  .L8013AA34:
    /* E3C 8013AA34 07008016 */  bnez       $s4, .L8013AA54
    /* E40 8013AA38 00241700 */   sll       $a0, $s7, 16
    /* E44 8013AA3C 0600A016 */  bnez       $s5, .L8013AA58
    /* E48 8013AA40 21108000 */   addu      $v0, $a0, $zero
    /* E4C 8013AA44 01009426 */  addiu      $s4, $s4, 0x1
    /* E50 8013AA48 0100822E */  sltiu      $v0, $s4, 0x1
    /* E54 8013AA4C 21A8A202 */  addu       $s5, $s5, $v0
    /* E58 8013AA50 00241700 */  sll        $a0, $s7, 16
  .L8013AA54:
    /* E5C 8013AA54 21108000 */  addu       $v0, $a0, $zero
  .L8013AA58:
    /* E60 8013AA58 C31F0400 */  sra        $v1, $a0, 31
    /* E64 8013AA5C 19005000 */  multu      $v0, $s0
    /* E68 8013AA60 10280000 */  mfhi       $a1
    /* E6C 8013AA64 12200000 */  mflo       $a0
    /* E70 8013AA68 00000000 */  nop
    /* E74 8013AA6C 00000000 */  nop
    /* E78 8013AA70 18005100 */  mult       $v0, $s1
    /* E7C 8013AA74 12400000 */  mflo       $t0
    /* E80 8013AA78 00000000 */  nop
    /* E84 8013AA7C 00000000 */  nop
    /* E88 8013AA80 18000302 */  mult       $s0, $v1
    /* E8C 8013AA84 21308002 */  addu       $a2, $s4, $zero
    /* E90 8013AA88 2138A002 */  addu       $a3, $s5, $zero
    /* E94 8013AA8C 2128A800 */  addu       $a1, $a1, $t0
    /* E98 8013AA90 80801600 */  sll        $s0, $s6, 2
    /* E9C 8013AA94 21801602 */  addu       $s0, $s0, $s6
    /* EA0 8013AA98 80801000 */  sll        $s0, $s0, 2
    /* EA4 8013AA9C 23801602 */  subu       $s0, $s0, $s6
    /* EA8 8013AAA0 80801000 */  sll        $s0, $s0, 2
    /* EAC 8013AAA4 12100000 */  mflo       $v0
    /* EB0 8013AAA8 9844000C */  jal        __divdi3
    /* EB4 8013AAAC 2128A200 */   addu      $a1, $a1, $v0
    /* EB8 8013AAB0 C0231700 */  sll        $a0, $s7, 15
    /* EBC 8013AAB4 21308000 */  addu       $a2, $a0, $zero
    /* EC0 8013AAB8 C33F0400 */  sra        $a3, $a0, 31
    /* EC4 8013AABC 1900D200 */  multu      $a2, $s2
    /* EC8 8013AAC0 10280000 */  mfhi       $a1
    /* ECC 8013AAC4 12200000 */  mflo       $a0
    /* ED0 8013AAC8 00000000 */  nop
    /* ED4 8013AACC 00000000 */  nop
    /* ED8 8013AAD0 1800D300 */  mult       $a2, $s3
    /* EDC 8013AAD4 12500000 */  mflo       $t2
    /* EE0 8013AAD8 00000000 */  nop
    /* EE4 8013AADC 00000000 */  nop
    /* EE8 8013AAE0 18004702 */  mult       $s2, $a3
    /* EEC 8013AAE4 1080013C */  lui        $at, %hi(missile)
    /* EF0 8013AAE8 21083000 */  addu       $at, $at, $s0
    /* EF4 8013AAEC 582C22AC */  sw         $v0, %lo(missile)($at)
    /* EF8 8013AAF0 21308002 */  addu       $a2, $s4, $zero
    /* EFC 8013AAF4 2138A002 */  addu       $a3, $s5, $zero
    /* F00 8013AAF8 2128AA00 */  addu       $a1, $a1, $t2
    /* F04 8013AAFC 12400000 */  mflo       $t0
    /* F08 8013AB00 9844000C */  jal        __divdi3
    /* F0C 8013AB04 2128A800 */   addu      $a1, $a1, $t0
    /* F10 8013AB08 1080013C */  lui        $at, %hi(missile + 0x4)
    /* F14 8013AB0C 21083000 */  addu       $at, $at, $s0
    /* F18 8013AB10 5C2C22AC */  sw         $v0, %lo(missile + 0x4)($at)
    /* F1C 8013AB14 3000BF8F */  lw         $ra, 0x30($sp)
    /* F20 8013AB18 2C00B78F */  lw         $s7, 0x2C($sp)
    /* F24 8013AB1C 2800B68F */  lw         $s6, 0x28($sp)
    /* F28 8013AB20 2400B58F */  lw         $s5, 0x24($sp)
    /* F2C 8013AB24 2000B48F */  lw         $s4, 0x20($sp)
    /* F30 8013AB28 1C00B38F */  lw         $s3, 0x1C($sp)
    /* F34 8013AB2C 1800B28F */  lw         $s2, 0x18($sp)
    /* F38 8013AB30 1400B18F */  lw         $s1, 0x14($sp)
    /* F3C 8013AB34 1000B08F */  lw         $s0, 0x10($sp)
    /* F40 8013AB38 3800BD27 */  addiu      $sp, $sp, 0x38
    /* F44 8013AB3C 0800E003 */  jr         $ra
    /* F48 8013AB40 00000000 */   nop
endlabel GetMissileVel__Fiiiiii
