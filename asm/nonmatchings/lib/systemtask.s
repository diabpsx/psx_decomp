.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching systemtask, 0x124

glabel systemtask
    /* 1F94C 8002F94C A41D838F */  lw         $v1, %gp_rel(D_8011C524)($gp)
    /* 1F950 8002F950 1280023C */  lui        $v0, %hi(libticks)
    /* 1F954 8002F954 7CC5428C */  lw         $v0, %lo(libticks)($v0)
    /* 1F958 8002F958 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1F95C 8002F95C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1F960 8002F960 21A08000 */  addu       $s4, $a0, $zero
    /* 1F964 8002F964 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1F968 8002F968 21980000 */  addu       $s3, $zero, $zero
    /* 1F96C 8002F96C 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 1F970 8002F970 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1F974 8002F974 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1F978 8002F978 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1F97C 8002F97C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1F980 8002F980 2F006210 */  beq        $v1, $v0, .L8002FA40
    /* 1F984 8002F984 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1F988 8002F988 01001624 */  addiu      $s6, $zero, 0x1
    /* 1F98C 8002F98C 1380103C */  lui        $s0, %hi(D_80134F4C)
    /* 1F990 8002F990 4C4F1026 */  addiu      $s0, $s0, %lo(D_80134F4C)
    /* 1F994 8002F994 1280023C */  lui        $v0, %hi(libticks)
    /* 1F998 8002F998 7CC5428C */  lw         $v0, %lo(libticks)($v0)
    /* 1F99C 8002F99C FCFF1126 */  addiu      $s1, $s0, -0x4
    /* 1F9A0 8002F9A0 21900000 */  addu       $s2, $zero, $zero
    /* 1F9A4 8002F9A4 00011526 */  addiu      $s5, $s0, 0x100
    /* 1F9A8 8002F9A8 A41D82AF */  sw         $v0, %gp_rel(D_8011C524)($gp)
  .L8002F9AC:
    /* 1F9AC 8002F9AC 1380013C */  lui        $at, %hi(D_80134F40)
    /* 1F9B0 8002F9B0 21083200 */  addu       $at, $at, $s2
    /* 1F9B4 8002F9B4 404F268C */  lw         $a2, %lo(D_80134F40)($at)
    /* 1F9B8 8002F9B8 00000000 */  nop
    /* 1F9BC 8002F9BC 1B00C010 */  beqz       $a2, .L8002FA2C
    /* 1F9C0 8002F9C0 00000000 */   nop
    /* 1F9C4 8002F9C4 1280023C */  lui        $v0, %hi(libticks)
    /* 1F9C8 8002F9C8 7CC5428C */  lw         $v0, %lo(libticks)($v0)
    /* 1F9CC 8002F9CC 0000238E */  lw         $v1, 0x0($s1)
    /* 1F9D0 8002F9D0 00000000 */  nop
    /* 1F9D4 8002F9D4 2A104300 */  slt        $v0, $v0, $v1
    /* 1F9D8 8002F9D8 14004014 */  bnez       $v0, .L8002FA2C
    /* 1F9DC 8002F9DC 00000000 */   nop
    /* 1F9E0 8002F9E0 0000028E */  lw         $v0, 0x0($s0)
    /* 1F9E4 8002F9E4 00000000 */  nop
    /* 1F9E8 8002F9E8 10004014 */  bnez       $v0, .L8002FA2C
    /* 1F9EC 8002F9EC 21208002 */   addu      $a0, $s4, $zero
    /* 1F9F0 8002F9F0 1280023C */  lui        $v0, %hi(libticks)
    /* 1F9F4 8002F9F4 7CC5428C */  lw         $v0, %lo(libticks)($v0)
    /* 1F9F8 8002F9F8 000016AE */  sw         $s6, 0x0($s0)
    /* 1F9FC 8002F9FC 0000258E */  lw         $a1, 0x0($s1)
    /* 1FA00 8002FA00 09F8C000 */  jalr       $a2
    /* 1FA04 8002FA04 23284500 */   subu      $a1, $v0, $a1
    /* 1FA08 8002FA08 1280033C */  lui        $v1, %hi(libticks)
    /* 1FA0C 8002FA0C 7CC5638C */  lw         $v1, %lo(libticks)($v1)
    /* 1FA10 8002FA10 1380013C */  lui        $at, %hi(D_80134F44)
    /* 1FA14 8002FA14 21083200 */  addu       $at, $at, $s2
    /* 1FA18 8002FA18 444F248C */  lw         $a0, %lo(D_80134F44)($at)
    /* 1FA1C 8002FA1C 25986202 */  or         $s3, $s3, $v0
    /* 1FA20 8002FA20 21186400 */  addu       $v1, $v1, $a0
    /* 1FA24 8002FA24 000023AE */  sw         $v1, 0x0($s1)
    /* 1FA28 8002FA28 000000AE */  sw         $zero, 0x0($s0)
  .L8002FA2C:
    /* 1FA2C 8002FA2C 10001026 */  addiu      $s0, $s0, 0x10
    /* 1FA30 8002FA30 10003126 */  addiu      $s1, $s1, 0x10
    /* 1FA34 8002FA34 2A101502 */  slt        $v0, $s0, $s5
    /* 1FA38 8002FA38 DCFF4014 */  bnez       $v0, .L8002F9AC
    /* 1FA3C 8002FA3C 10005226 */   addiu     $s2, $s2, 0x10
  .L8002FA40:
    /* 1FA40 8002FA40 21106002 */  addu       $v0, $s3, $zero
    /* 1FA44 8002FA44 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 1FA48 8002FA48 2800B68F */  lw         $s6, 0x28($sp)
    /* 1FA4C 8002FA4C 2400B58F */  lw         $s5, 0x24($sp)
    /* 1FA50 8002FA50 2000B48F */  lw         $s4, 0x20($sp)
    /* 1FA54 8002FA54 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1FA58 8002FA58 1800B28F */  lw         $s2, 0x18($sp)
    /* 1FA5C 8002FA5C 1400B18F */  lw         $s1, 0x14($sp)
    /* 1FA60 8002FA60 1000B08F */  lw         $s0, 0x10($sp)
    /* 1FA64 8002FA64 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1FA68 8002FA68 0800E003 */  jr         $ra
    /* 1FA6C 8002FA6C 00000000 */   nop
endlabel systemtask
