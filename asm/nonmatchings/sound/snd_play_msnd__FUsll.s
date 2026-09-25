.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching snd_play_msnd__FUsll, 0xA0

glabel snd_play_msnd__FUsll
    /* 67DA0 80077DA0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 67DA4 80077DA4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 67DA8 80077DA8 2188A000 */  addu       $s1, $a1, $zero
    /* 67DAC 80077DAC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 67DB0 80077DB0 2198C000 */  addu       $s3, $a2, $zero
    /* 67DB4 80077DB4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 67DB8 80077DB8 21808000 */  addu       $s0, $a0, $zero
    /* 67DBC 80077DBC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 67DC0 80077DC0 03002106 */  bgez       $s1, .L80077DD0
    /* 67DC4 80077DC4 1800B2AF */   sw        $s2, 0x18($sp)
    /* 67DC8 80077DC8 78DF0108 */  j          .L80077DE0
    /* 67DCC 80077DCC 21880000 */   addu      $s1, $zero, $zero
  .L80077DD0:
    /* 67DD0 80077DD0 0040222A */  slti       $v0, $s1, 0x4000
    /* 67DD4 80077DD4 02004014 */  bnez       $v0, .L80077DE0
    /* 67DD8 80077DD8 00000000 */   nop
    /* 67DDC 80077DDC FF3F1124 */  addiu      $s1, $zero, 0x3FFF
  .L80077DE0:
    /* 67DE0 80077DE0 3D83000C */  jal        GU_GetRnd
    /* 67DE4 80077DE4 FFFF1032 */   andi      $s0, $s0, 0xFFFF
    /* 67DE8 80077DE8 21200002 */  addu       $a0, $s0, $zero
    /* 67DEC 80077DEC 21282002 */  addu       $a1, $s1, $zero
    /* 67DF0 80077DF0 21306002 */  addu       $a2, $s3, $zero
    /* 67DF4 80077DF4 7F004230 */  andi       $v0, $v0, 0x7F
    /* 67DF8 80077DF8 C0FF5224 */  addiu      $s2, $v0, -0x40
    /* 67DFC 80077DFC E769020C */  jal        SND_PlaySnd__FUsiii
    /* 67E00 80077E00 21384002 */   addu      $a3, $s2, $zero
    /* 67E04 80077E04 91030224 */  addiu      $v0, $zero, 0x391
    /* 67E08 80077E08 05000216 */  bne        $s0, $v0, .L80077E20
    /* 67E0C 80077E0C 95030424 */   addiu     $a0, $zero, 0x395
    /* 67E10 80077E10 21282002 */  addu       $a1, $s1, $zero
    /* 67E14 80077E14 21306002 */  addu       $a2, $s3, $zero
    /* 67E18 80077E18 E769020C */  jal        SND_PlaySnd__FUsiii
    /* 67E1C 80077E1C 21384002 */   addu      $a3, $s2, $zero
  .L80077E20:
    /* 67E20 80077E20 2000BF8F */  lw         $ra, 0x20($sp)
    /* 67E24 80077E24 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 67E28 80077E28 1800B28F */  lw         $s2, 0x18($sp)
    /* 67E2C 80077E2C 1400B18F */  lw         $s1, 0x14($sp)
    /* 67E30 80077E30 1000B08F */  lw         $s0, 0x10($sp)
    /* 67E34 80077E34 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 67E38 80077E38 0800E003 */  jr         $ra
    /* 67E3C 80077E3C 00000000 */   nop
endlabel snd_play_msnd__FUsll
