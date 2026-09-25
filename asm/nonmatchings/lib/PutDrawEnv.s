.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PutDrawEnv, 0xC0

glabel PutDrawEnv
    /* 40DC 800140DC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 40E0 800140E0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 40E4 800140E4 0B80123C */  lui        $s2, %hi(D_800B54AE)
    /* 40E8 800140E8 AE545226 */  addiu      $s2, $s2, %lo(D_800B54AE)
    /* 40EC 800140EC 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 40F0 800140F0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 40F4 800140F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 40F8 800140F8 00004292 */  lbu        $v0, 0x0($s2)
    /* 40FC 800140FC 00000000 */  nop
    /* 4100 80014100 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4104 80014104 08004014 */  bnez       $v0, .L80014128
    /* 4108 80014108 21888000 */   addu      $s1, $a0, $zero
    /* 410C 8001410C 1180043C */  lui        $a0, %hi(D_8010E008)
    /* 4110 80014110 08E08424 */  addiu      $a0, $a0, %lo(D_8010E008)
    /* 4114 80014114 0B80023C */  lui        $v0, %hi(GPU_printf)
    /* 4118 80014118 A854428C */  lw         $v0, %lo(GPU_printf)($v0)
    /* 411C 8001411C 00000000 */  nop
    /* 4120 80014120 09F84000 */  jalr       $v0
    /* 4124 80014124 21282002 */   addu      $a1, $s1, $zero
  .L80014128:
    /* 4128 80014128 1C003026 */  addiu      $s0, $s1, 0x1C
    /* 412C 8001412C 21200002 */  addu       $a0, $s0, $zero
    /* 4130 80014130 B552000C */  jal        func_80014AD4
    /* 4134 80014134 21282002 */   addu      $a1, $s1, $zero
    /* 4138 80014138 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
    /* 413C 8001413C FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
    /* 4140 80014140 21280002 */  addu       $a1, $s0, $zero
    /* 4144 80014144 40000624 */  addiu      $a2, $zero, 0x40
    /* 4148 80014148 1C00228E */  lw         $v0, 0x1C($s1)
    /* 414C 8001414C 0B80033C */  lui        $v1, %hi(D_800B54A4)
    /* 4150 80014150 A454638C */  lw         $v1, %lo(D_800B54A4)($v1)
    /* 4154 80014154 25104400 */  or         $v0, $v0, $a0
    /* 4158 80014158 1C0022AE */  sw         $v0, 0x1C($s1)
    /* 415C 8001415C 1800648C */  lw         $a0, 0x18($v1)
    /* 4160 80014160 0800628C */  lw         $v0, 0x8($v1)
    /* 4164 80014164 00000000 */  nop
    /* 4168 80014168 09F84000 */  jalr       $v0
    /* 416C 8001416C 21380000 */   addu      $a3, $zero, $zero
    /* 4170 80014170 0E004426 */  addiu      $a0, $s2, 0xE
    /* 4174 80014174 21282002 */  addu       $a1, $s1, $zero
    /* 4178 80014178 8B67000C */  jal        memcpy
    /* 417C 8001417C 5C000624 */   addiu     $a2, $zero, 0x5C
    /* 4180 80014180 21102002 */  addu       $v0, $s1, $zero
    /* 4184 80014184 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 4188 80014188 1800B28F */  lw         $s2, 0x18($sp)
    /* 418C 8001418C 1400B18F */  lw         $s1, 0x14($sp)
    /* 4190 80014190 1000B08F */  lw         $s0, 0x10($sp)
    /* 4194 80014194 0800E003 */  jr         $ra
    /* 4198 80014198 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel PutDrawEnv
