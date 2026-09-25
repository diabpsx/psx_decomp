.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeSurePlayerDressedProperly__FR7CPlayerR12PlayerStructbT2, 0xB0

glabel MakeSurePlayerDressedProperly__FR7CPlayerR12PlayerStructbT2
    /* 8C350 8009C350 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8C354 8009C354 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8C358 8009C358 21888000 */  addu       $s1, $a0, $zero
    /* 8C35C 8009C35C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8C360 8009C360 2190A000 */  addu       $s2, $a1, $zero
    /* 8C364 8009C364 21204002 */  addu       $a0, $s2, $zero
    /* 8C368 8009C368 2128C000 */  addu       $a1, $a2, $zero
    /* 8C36C 8009C36C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 8C370 8009C370 2198E000 */  addu       $s3, $a3, $zero
    /* 8C374 8009C374 2000BFAF */  sw         $ra, 0x20($sp)
    /* 8C378 8009C378 A170020C */  jal        FindPlayerChar__FP12PlayerStructb
    /* 8C37C 8009C37C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 8C380 8009C380 21202002 */  addu       $a0, $s1, $zero
    /* 8C384 8009C384 4871020C */  jal        GetTexId__7CPlayer
    /* 8C388 8009C388 21804000 */   addu      $s0, $v0, $zero
    /* 8C38C 8009C38C 14000212 */  beq        $s0, $v0, .L8009C3E0
    /* 8C390 8009C390 00000000 */   nop
    /* 8C394 8009C394 05006012 */  beqz       $s3, .L8009C3AC
    /* 8C398 8009C398 21202002 */   addu      $a0, $s1, $zero
    /* 8C39C 8009C39C 8F56020C */  jal        Load__7CPlayeri
    /* 8C3A0 8009C3A0 21280002 */   addu      $a1, $s0, $zero
    /* 8C3A4 8009C3A4 ED700208 */  j          .L8009C3B4
    /* 8C3A8 8009C3A8 00000000 */   nop
  .L8009C3AC:
    /* 8C3AC 8009C3AC 5359020C */  jal        NonBlockingLoadNewGFX__7CPlayeri
    /* 8C3B0 8009C3B0 21280002 */   addu      $a1, $s0, $zero
  .L8009C3B4:
    /* 8C3B4 8009C3B4 1D004292 */  lbu        $v0, 0x1D($s2)
    /* 8C3B8 8009C3B8 00000000 */  nop
    /* 8C3BC 8009C3BC 08004010 */  beqz       $v0, .L8009C3E0
    /* 8C3C0 8009C3C0 08000224 */   addiu     $v0, $zero, 0x8
    /* 8C3C4 8009C3C4 0000438E */  lw         $v1, 0x0($s2)
    /* 8C3C8 8009C3C8 00000000 */  nop
    /* 8C3CC 8009C3CC 04006210 */  beq        $v1, $v0, .L8009C3E0
    /* 8C3D0 8009C3D0 00000000 */   nop
    /* 8C3D4 8009C3D4 42004582 */  lb         $a1, 0x42($s2)
    /* 8C3D8 8009C3D8 8483010C */  jal        StartStand__FP12PlayerStructi
    /* 8C3DC 8009C3DC 21204002 */   addu      $a0, $s2, $zero
  .L8009C3E0:
    /* 8C3E0 8009C3E0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 8C3E4 8009C3E4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 8C3E8 8009C3E8 1800B28F */  lw         $s2, 0x18($sp)
    /* 8C3EC 8009C3EC 1400B18F */  lw         $s1, 0x14($sp)
    /* 8C3F0 8009C3F0 1000B08F */  lw         $s0, 0x10($sp)
    /* 8C3F4 8009C3F4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8C3F8 8009C3F8 0800E003 */  jr         $ra
    /* 8C3FC 8009C3FC 00000000 */   nop
endlabel MakeSurePlayerDressedProperly__FR7CPlayerR12PlayerStructbT2
