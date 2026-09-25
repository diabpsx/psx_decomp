.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoReadFileAtAddr__4PCIOPCcPUci, 0xC4

glabel LoReadFileAtAddr__4PCIOPCcPUci
    /* 761B8 800861B8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 761BC 800861BC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 761C0 800861C0 2190C000 */  addu       $s2, $a2, $zero
    /* 761C4 800861C4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 761C8 800861C8 2198E000 */  addu       $s3, $a3, $zero
    /* 761CC 800861CC 2120A000 */  addu       $a0, $a1, $zero
    /* 761D0 800861D0 21280000 */  addu       $a1, $zero, $zero
    /* 761D4 800861D4 21300000 */  addu       $a2, $zero, $zero
    /* 761D8 800861D8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 761DC 800861DC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 761E0 800861E0 AB43000C */  jal        PCopen
    /* 761E4 800861E4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 761E8 800861E8 21804000 */  addu       $s0, $v0, $zero
    /* 761EC 800861EC FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 761F0 800861F0 07001116 */  bne        $s0, $s1, .L80086210
    /* 761F4 800861F4 21200002 */   addu      $a0, $s0, $zero
    /* 761F8 800861F8 21200000 */  addu       $a0, $zero, $zero
    /* 761FC 800861FC 1180053C */  lui        $a1, %hi(D_80110144)
    /* 76200 80086200 4401A524 */  addiu      $a1, $a1, %lo(D_80110144)
    /* 76204 80086204 A583000C */  jal        DBG_Error
    /* 76208 80086208 6E000624 */   addiu     $a2, $zero, 0x6E
    /* 7620C 8008620C 21200002 */  addu       $a0, $s0, $zero
  .L80086210:
    /* 76210 80086210 21284002 */  addu       $a1, $s2, $zero
    /* 76214 80086214 2B44000C */  jal        PCread
    /* 76218 80086218 21306002 */   addu      $a2, $s3, $zero
    /* 7621C 8008621C 05005114 */  bne        $v0, $s1, .L80086234
    /* 76220 80086220 21200000 */   addu      $a0, $zero, $zero
    /* 76224 80086224 1180053C */  lui        $a1, %hi(D_80110144)
    /* 76228 80086228 4401A524 */  addiu      $a1, $a1, %lo(D_80110144)
    /* 7622C 8008622C A583000C */  jal        DBG_Error
    /* 76230 80086230 71000624 */   addiu     $a2, $zero, 0x71
  .L80086234:
    /* 76234 80086234 B343000C */  jal        PCclose
    /* 76238 80086238 21200002 */   addu      $a0, $s0, $zero
    /* 7623C 8008623C 07005114 */  bne        $v0, $s1, .L8008625C
    /* 76240 80086240 01000224 */   addiu     $v0, $zero, 0x1
    /* 76244 80086244 21200000 */  addu       $a0, $zero, $zero
    /* 76248 80086248 1180053C */  lui        $a1, %hi(D_80110144)
    /* 7624C 8008624C 4401A524 */  addiu      $a1, $a1, %lo(D_80110144)
    /* 76250 80086250 A583000C */  jal        DBG_Error
    /* 76254 80086254 74000624 */   addiu     $a2, $zero, 0x74
    /* 76258 80086258 01000224 */  addiu      $v0, $zero, 0x1
  .L8008625C:
    /* 7625C 8008625C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 76260 80086260 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 76264 80086264 1800B28F */  lw         $s2, 0x18($sp)
    /* 76268 80086268 1400B18F */  lw         $s1, 0x14($sp)
    /* 7626C 8008626C 1000B08F */  lw         $s0, 0x10($sp)
    /* 76270 80086270 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 76274 80086274 0800E003 */  jr         $ra
    /* 76278 80086278 00000000 */   nop
endlabel LoReadFileAtAddr__4PCIOPCcPUci
