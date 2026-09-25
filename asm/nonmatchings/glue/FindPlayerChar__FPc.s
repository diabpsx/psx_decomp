.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindPlayerChar__FPc, 0x98

glabel FindPlayerChar__FPc
    /* 8C160 8009C160 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8C164 8009C164 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 8C168 8009C168 21988000 */  addu       $s3, $a0, $zero
    /* 8C16C 8009C16C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8C170 8009C170 21880000 */  addu       $s1, $zero, $zero
    /* 8C174 8009C174 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8C178 8009C178 0D80123C */  lui        $s2, %hi(PlayerInfo)
    /* 8C17C 8009C17C 98BF5226 */  addiu      $s2, $s2, %lo(PlayerInfo)
    /* 8C180 8009C180 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8C184 8009C184 21800000 */  addu       $s0, $zero, $zero
    /* 8C188 8009C188 2000BFAF */  sw         $ra, 0x20($sp)
  .L8009C18C:
    /* 8C18C 8009C18C 0D80013C */  lui        $at, %hi(PlayerInfo)
    /* 8C190 8009C190 21083000 */  addu       $at, $at, $s0
    /* 8C194 8009C194 98BF248C */  lw         $a0, %lo(PlayerInfo)($at)
    /* 8C198 8009C198 7F67000C */  jal        strcmp
    /* 8C19C 8009C19C 21286002 */   addu      $a1, $s3, $zero
    /* 8C1A0 8009C1A0 03004014 */  bnez       $v0, .L8009C1B0
    /* 8C1A4 8009C1A4 01003126 */   addiu     $s1, $s1, 0x1
    /* 8C1A8 8009C1A8 76700208 */  j          .L8009C1D8
    /* 8C1AC 8009C1AC 21104002 */   addu      $v0, $s2, $zero
  .L8009C1B0:
    /* 8C1B0 8009C1B0 0C005226 */  addiu      $s2, $s2, 0xC
    /* 8C1B4 8009C1B4 5100222A */  slti       $v0, $s1, 0x51
    /* 8C1B8 8009C1B8 F4FF4014 */  bnez       $v0, .L8009C18C
    /* 8C1BC 8009C1BC 0C001026 */   addiu     $s0, $s0, 0xC
    /* 8C1C0 8009C1C0 21200000 */  addu       $a0, $zero, $zero
    /* 8C1C4 8009C1C4 1180053C */  lui        $a1, %hi(D_80110B58)
    /* 8C1C8 8009C1C8 580BA524 */  addiu      $a1, $a1, %lo(D_80110B58)
    /* 8C1CC 8009C1CC A583000C */  jal        DBG_Error
    /* 8C1D0 8009C1D0 88020624 */   addiu     $a2, $zero, 0x288
    /* 8C1D4 8009C1D4 21100000 */  addu       $v0, $zero, $zero
  .L8009C1D8:
    /* 8C1D8 8009C1D8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 8C1DC 8009C1DC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 8C1E0 8009C1E0 1800B28F */  lw         $s2, 0x18($sp)
    /* 8C1E4 8009C1E4 1400B18F */  lw         $s1, 0x14($sp)
    /* 8C1E8 8009C1E8 1000B08F */  lw         $s0, 0x10($sp)
    /* 8C1EC 8009C1EC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8C1F0 8009C1F0 0800E003 */  jr         $ra
    /* 8C1F4 8009C1F4 00000000 */   nop
endlabel FindPlayerChar__FPc
