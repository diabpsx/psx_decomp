.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawOTagEnv, 0xD8

glabel DrawOTagEnv
    /* 419C 8001419C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 41A0 800141A0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 41A4 800141A4 21908000 */  addu       $s2, $a0, $zero
    /* 41A8 800141A8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 41AC 800141AC 0B80133C */  lui        $s3, %hi(D_800B54AE)
    /* 41B0 800141B0 AE547326 */  addiu      $s3, $s3, %lo(D_800B54AE)
    /* 41B4 800141B4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 41B8 800141B8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41BC 800141BC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41C0 800141C0 00006292 */  lbu        $v0, 0x0($s3)
    /* 41C4 800141C4 00000000 */  nop
    /* 41C8 800141C8 0200422C */  sltiu      $v0, $v0, 0x2
    /* 41CC 800141CC 09004014 */  bnez       $v0, .L800141F4
    /* 41D0 800141D0 2188A000 */   addu      $s1, $a1, $zero
    /* 41D4 800141D4 1180043C */  lui        $a0, %hi(D_8010E020)
    /* 41D8 800141D8 20E08424 */  addiu      $a0, $a0, %lo(D_8010E020)
    /* 41DC 800141DC 21284002 */  addu       $a1, $s2, $zero
    /* 41E0 800141E0 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 41E4 800141E4 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 41E8 800141E8 00000000 */  nop
    /* 41EC 800141EC 09F84000 */  jalr       $v0
    /* 41F0 800141F0 21302002 */   addu      $a2, $s1, $zero
  .L800141F4:
    /* 41F4 800141F4 1C003026 */  addiu      $s0, $s1, 0x1C
    /* 41F8 800141F8 21200002 */  addu       $a0, $s0, $zero
    /* 41FC 800141FC B552000C */  jal        func_80014AD4
    /* 4200 80014200 21282002 */   addu      $a1, $s1, $zero
    /* 4204 80014204 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
    /* 4208 80014208 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
    /* 420C 8001420C 21280002 */  addu       $a1, $s0, $zero
    /* 4210 80014210 40000624 */  addiu      $a2, $zero, 0x40
    /* 4214 80014214 00FF033C */  lui        $v1, (0xFF000000 >> 16)
    /* 4218 80014218 1C00228E */  lw         $v0, 0x1C($s1)
    /* 421C 8001421C 24204402 */  and        $a0, $s2, $a0
    /* 4220 80014220 24104300 */  and        $v0, $v0, $v1
    /* 4224 80014224 0B80033C */  lui        $v1, %hi(D_800B54A4)
    /* 4228 80014228 A454638C */  lw         $v1, %lo(D_800B54A4)($v1)
    /* 422C 8001422C 25104400 */  or         $v0, $v0, $a0
    /* 4230 80014230 1C0022AE */  sw         $v0, 0x1C($s1)
    /* 4234 80014234 1800648C */  lw         $a0, 0x18($v1)
    /* 4238 80014238 0800628C */  lw         $v0, 0x8($v1)
    /* 423C 8001423C 00000000 */  nop
    /* 4240 80014240 09F84000 */  jalr       $v0
    /* 4244 80014244 21380000 */   addu      $a3, $zero, $zero
    /* 4248 80014248 0E006426 */  addiu      $a0, $s3, 0xE
    /* 424C 8001424C 21282002 */  addu       $a1, $s1, $zero
    /* 4250 80014250 8B67000C */  jal        memcpy
    /* 4254 80014254 5C000624 */   addiu     $a2, $zero, 0x5C
    /* 4258 80014258 2000BF8F */  lw         $ra, 0x20($sp)
    /* 425C 8001425C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 4260 80014260 1800B28F */  lw         $s2, 0x18($sp)
    /* 4264 80014264 1400B18F */  lw         $s1, 0x14($sp)
    /* 4268 80014268 1000B08F */  lw         $s0, 0x10($sp)
    /* 426C 8001426C 0800E003 */  jr         $ra
    /* 4270 80014270 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel DrawOTagEnv
