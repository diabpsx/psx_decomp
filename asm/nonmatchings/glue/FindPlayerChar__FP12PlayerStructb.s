.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindPlayerChar__FP12PlayerStructb, 0xCC

glabel FindPlayerChar__FP12PlayerStructb
    /* 8C284 8009C284 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8C288 8009C288 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8C28C 8009C28C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8C290 8009C290 0000838C */  lw         $v1, 0x0($a0)
    /* 8C294 8009C294 08000224 */  addiu      $v0, $zero, 0x8
    /* 8C298 8009C298 18006214 */  bne        $v1, $v0, .L8009C2FC
    /* 8C29C 8009C29C 2180A000 */   addu      $s0, $a1, $zero
    /* 8C2A0 8009C2A0 F6008380 */  lb         $v1, 0xF6($a0)
    /* 8C2A4 8009C2A4 01000224 */  addiu      $v0, $zero, 0x1
    /* 8C2A8 8009C2A8 0C006210 */  beq        $v1, $v0, .L8009C2DC
    /* 8C2AC 8009C2AC 02006228 */   slti      $v0, $v1, 0x2
    /* 8C2B0 8009C2B0 05004010 */  beqz       $v0, .L8009C2C8
    /* 8C2B4 8009C2B4 00000000 */   nop
    /* 8C2B8 8009C2B8 20006010 */  beqz       $v1, .L8009C33C
    /* 8C2BC 8009C2BC 24010224 */   addiu     $v0, $zero, 0x124
    /* 8C2C0 8009C2C0 B9700208 */  j          .L8009C2E4
    /* 8C2C4 8009C2C4 21200000 */   addu      $a0, $zero, $zero
  .L8009C2C8:
    /* 8C2C8 8009C2C8 02000224 */  addiu      $v0, $zero, 0x2
    /* 8C2CC 8009C2CC 1B006210 */  beq        $v1, $v0, .L8009C33C
    /* 8C2D0 8009C2D0 25010224 */   addiu     $v0, $zero, 0x125
    /* 8C2D4 8009C2D4 B9700208 */  j          .L8009C2E4
    /* 8C2D8 8009C2D8 21200000 */   addu      $a0, $zero, $zero
  .L8009C2DC:
    /* 8C2DC 8009C2DC CF700208 */  j          .L8009C33C
    /* 8C2E0 8009C2E0 26010224 */   addiu     $v0, $zero, 0x126
  .L8009C2E4:
    /* 8C2E4 8009C2E4 1180053C */  lui        $a1, %hi(D_80110B58)
    /* 8C2E8 8009C2E8 580BA524 */  addiu      $a1, $a1, %lo(D_80110B58)
    /* 8C2EC 8009C2EC A583000C */  jal        DBG_Error
    /* 8C2F0 8009C2F0 AF020624 */   addiu     $a2, $zero, 0x2AF
    /* 8C2F4 8009C2F4 CF700208 */  j          .L8009C33C
    /* 8C2F8 8009C2F8 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8009C2FC:
    /* 8C2FC 8009C2FC 9570020C */  jal        FindPlayerChar__FP12PlayerStruct
    /* 8C300 8009C300 00000000 */   nop
    /* 8C304 8009C304 04000012 */  beqz       $s0, .L8009C318
    /* 8C308 8009C308 21184000 */   addu      $v1, $v0, $zero
    /* 8C30C 8009C30C 06006294 */  lhu        $v0, 0x6($v1)
    /* 8C310 8009C310 CF700208 */  j          .L8009C33C
    /* 8C314 8009C314 00000000 */   nop
  .L8009C318:
    /* 8C318 8009C318 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 8C31C 8009C31C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 8C320 8009C320 00000000 */  nop
    /* 8C324 8009C324 04004010 */  beqz       $v0, .L8009C338
    /* 8C328 8009C328 00000000 */   nop
    /* 8C32C 8009C32C 08006294 */  lhu        $v0, 0x8($v1)
    /* 8C330 8009C330 CF700208 */  j          .L8009C33C
    /* 8C334 8009C334 00000000 */   nop
  .L8009C338:
    /* 8C338 8009C338 04006294 */  lhu        $v0, 0x4($v1)
  .L8009C33C:
    /* 8C33C 8009C33C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8C340 8009C340 1000B08F */  lw         $s0, 0x10($sp)
    /* 8C344 8009C344 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8C348 8009C348 0800E003 */  jr         $ra
    /* 8C34C 8009C34C 00000000 */   nop
endlabel FindPlayerChar__FP12PlayerStructb
