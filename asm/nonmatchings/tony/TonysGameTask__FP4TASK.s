.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TonysGameTask__FP4TASK, 0x88

glabel TonysGameTask__FP4TASK
    /* 8B374 8009B374 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 8B378 8009B378 2800B2AF */  sw         $s2, 0x28($sp)
    /* 8B37C 8009B37C 01001224 */  addiu      $s2, $zero, 0x1
    /* 8B380 8009B380 2400B1AF */  sw         $s1, 0x24($sp)
    /* 8B384 8009B384 0E80113C */  lui        $s1, %hi(plr + 0x30)
    /* 8B388 8009B388 68A53126 */  addiu      $s1, $s1, %lo(plr + 0x30)
    /* 8B38C 8009B38C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 8B390 8009B390 40001024 */  addiu      $s0, $zero, 0x40
    /* 8B394 8009B394 2C00BFAF */  sw         $ra, 0x2C($sp)
  .L8009B398:
    /* 8B398 8009B398 B806828F */  lw         $v0, %gp_rel(moo_moo)($gp)
    /* 8B39C 8009B39C 00000000 */  nop
    /* 8B3A0 8009B3A0 0B005214 */  bne        $v0, $s2, .L8009B3D0
    /* 8B3A4 8009B3A4 000A0224 */   addiu     $v0, $zero, 0xA00
    /* 8B3A8 8009B3A8 000A0624 */  addiu      $a2, $zero, 0xA00
    /* 8B3AC 8009B3AC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8B3B0 8009B3B0 1400B0AF */  sw         $s0, 0x14($sp)
    /* 8B3B4 8009B3B4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 8B3B8 8009B3B8 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 8B3BC 8009B3BC 00002486 */  lh         $a0, 0x0($s1)
    /* 8B3C0 8009B3C0 02002586 */  lh         $a1, 0x2($s1)
    /* 8B3C4 8009B3C4 502F010C */  jal        SetLightFX__FiisssUcUcUc
    /* 8B3C8 8009B3C8 000A0724 */   addiu     $a3, $zero, 0xA00
    /* 8B3CC 8009B3CC B80680AF */  sw         $zero, %gp_rel(moo_moo)($gp)
  .L8009B3D0:
    /* 8B3D0 8009B3D0 EE80000C */  jal        TSK_Sleep
    /* 8B3D4 8009B3D4 01000424 */   addiu     $a0, $zero, 0x1
    /* 8B3D8 8009B3D8 E66C0208 */  j          .L8009B398
    /* 8B3DC 8009B3DC 00000000 */   nop
    /* 8B3E0 8009B3E0 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 8B3E4 8009B3E4 2800B28F */  lw         $s2, 0x28($sp)
    /* 8B3E8 8009B3E8 2400B18F */  lw         $s1, 0x24($sp)
    /* 8B3EC 8009B3EC 2000B08F */  lw         $s0, 0x20($sp)
    /* 8B3F0 8009B3F0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 8B3F4 8009B3F4 0800E003 */  jr         $ra
    /* 8B3F8 8009B3F8 00000000 */   nop
endlabel TonysGameTask__FP4TASK
