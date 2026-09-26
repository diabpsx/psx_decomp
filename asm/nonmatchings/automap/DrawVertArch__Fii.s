.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawVertArch__Fii, 0x134

glabel DrawVertArch__Fii
    /* 28E78 80162A70 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 28E7C 80162A74 80200400 */  sll        $a0, $a0, 2
    /* 28E80 80162A78 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28E84 80162A7C 80800500 */  sll        $s0, $a1, 2
    /* 28E88 80162A80 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28E8C 80162A84 23889000 */  subu       $s1, $a0, $s0
    /* 28E90 80162A88 40881100 */  sll        $s1, $s1, 1
    /* 28E94 80162A8C 21800402 */  addu       $s0, $s0, $a0
    /* 28E98 80162A90 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 28E9C 80162A94 38000524 */  addiu      $a1, $zero, 0x38
    /* 28EA0 80162A98 0C1C828F */  lw         $v0, %gp_rel(AMPlayerX)($gp)
    /* 28EA4 80162A9C 101C838F */  lw         $v1, %gp_rel(AMPlayerY)($gp)
    /* 28EA8 80162AA0 2D000624 */  addiu      $a2, $zero, 0x2D
    /* 28EAC 80162AA4 3000BFAF */  sw         $ra, 0x30($sp)
    /* 28EB0 80162AA8 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 28EB4 80162AAC 2800B6AF */  sw         $s6, 0x28($sp)
    /* 28EB8 80162AB0 2400B5AF */  sw         $s5, 0x24($sp)
    /* 28EBC 80162AB4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 28EC0 80162AB8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 28EC4 80162ABC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 28EC8 80162AC0 21882202 */  addu       $s1, $s1, $v0
    /* 28ECC 80162AC4 E81B828F */  lw         $v0, %gp_rel(AutoMapScale)($gp)
    /* 28ED0 80162AC8 21800302 */  addu       $s0, $s0, $v1
    /* 28ED4 80162ACC 83100200 */  sra        $v0, $v0, 2
    /* 28ED8 80162AD0 23B02202 */  subu       $s6, $s1, $v0
    /* 28EDC 80162AD4 23B80202 */  subu       $s7, $s0, $v0
    /* 28EE0 80162AD8 08005324 */  addiu      $s3, $v0, 0x8
    /* 28EE4 80162ADC 23983302 */  subu       $s3, $s1, $s3
    /* 28EE8 80162AE0 FCFF5224 */  addiu      $s2, $v0, -0x4
    /* 28EEC 80162AE4 23901202 */  subu       $s2, $s0, $s2
    /* 28EF0 80162AE8 F8FF5524 */  addiu      $s5, $v0, -0x8
    /* 28EF4 80162AEC 21A83502 */  addu       $s5, $s1, $s5
    /* 28EF8 80162AF0 04005424 */  addiu      $s4, $v0, 0x4
    /* 28EFC 80162AF4 21A01402 */  addu       $s4, $s0, $s4
    /* 28F00 80162AF8 21882202 */  addu       $s1, $s1, $v0
    /* 28F04 80162AFC FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28F08 80162B00 21800202 */   addu      $s0, $s0, $v0
    /* 28F0C 80162B04 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 28F10 80162B08 38000524 */  addiu      $a1, $zero, 0x38
    /* 28F14 80162B0C 2D000624 */  addiu      $a2, $zero, 0x2D
    /* 28F18 80162B10 080056A4 */  sh         $s6, 0x8($v0)
    /* 28F1C 80162B14 0A0057A4 */  sh         $s7, 0xA($v0)
    /* 28F20 80162B18 0C0053A4 */  sh         $s3, 0xC($v0)
    /* 28F24 80162B1C FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28F28 80162B20 0E0052A4 */   sh        $s2, 0xE($v0)
    /* 28F2C 80162B24 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 28F30 80162B28 38000524 */  addiu      $a1, $zero, 0x38
    /* 28F34 80162B2C 2D000624 */  addiu      $a2, $zero, 0x2D
    /* 28F38 80162B30 080053A4 */  sh         $s3, 0x8($v0)
    /* 28F3C 80162B34 0A0052A4 */  sh         $s2, 0xA($v0)
    /* 28F40 80162B38 0C0055A4 */  sh         $s5, 0xC($v0)
    /* 28F44 80162B3C FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28F48 80162B40 0E0054A4 */   sh        $s4, 0xE($v0)
    /* 28F4C 80162B44 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 28F50 80162B48 38000524 */  addiu      $a1, $zero, 0x38
    /* 28F54 80162B4C 2D000624 */  addiu      $a2, $zero, 0x2D
    /* 28F58 80162B50 080055A4 */  sh         $s5, 0x8($v0)
    /* 28F5C 80162B54 0A0054A4 */  sh         $s4, 0xA($v0)
    /* 28F60 80162B58 0C0051A4 */  sh         $s1, 0xC($v0)
    /* 28F64 80162B5C FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28F68 80162B60 0E0050A4 */   sh        $s0, 0xE($v0)
    /* 28F6C 80162B64 080051A4 */  sh         $s1, 0x8($v0)
    /* 28F70 80162B68 0A0050A4 */  sh         $s0, 0xA($v0)
    /* 28F74 80162B6C 0C0056A4 */  sh         $s6, 0xC($v0)
    /* 28F78 80162B70 0E0057A4 */  sh         $s7, 0xE($v0)
    /* 28F7C 80162B74 3000BF8F */  lw         $ra, 0x30($sp)
    /* 28F80 80162B78 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 28F84 80162B7C 2800B68F */  lw         $s6, 0x28($sp)
    /* 28F88 80162B80 2400B58F */  lw         $s5, 0x24($sp)
    /* 28F8C 80162B84 2000B48F */  lw         $s4, 0x20($sp)
    /* 28F90 80162B88 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 28F94 80162B8C 1800B28F */  lw         $s2, 0x18($sp)
    /* 28F98 80162B90 1400B18F */  lw         $s1, 0x14($sp)
    /* 28F9C 80162B94 1000B08F */  lw         $s0, 0x10($sp)
    /* 28FA0 80162B98 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 28FA4 80162B9C 0800E003 */  jr         $ra
    /* 28FA8 80162BA0 00000000 */   nop
endlabel DrawVertArch__Fii
