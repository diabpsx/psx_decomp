.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L2Subs__Fv, 0x1F0

glabel DRLG_L2Subs__Fv
    /* 9E98 80143A90 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 9E9C 80143A94 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9EA0 80143A98 21900000 */  addu       $s2, $zero, $zero
    /* 9EA4 80143A9C 2800B6AF */  sw         $s6, 0x28($sp)
    /* 9EA8 80143AA0 0E80163C */  lui        $s6, %hi(dungeon)
    /* 9EAC 80143AA4 C440D626 */  addiu      $s6, $s6, %lo(dungeon)
    /* 9EB0 80143AA8 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 9EB4 80143AAC A1001724 */  addiu      $s7, $zero, 0xA1
    /* 9EB8 80143AB0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 9EBC 80143AB4 02001424 */  addiu      $s4, $zero, 0x2
    /* 9EC0 80143AB8 3000BFAF */  sw         $ra, 0x30($sp)
    /* 9EC4 80143ABC 2400B5AF */  sw         $s5, 0x24($sp)
    /* 9EC8 80143AC0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9ECC 80143AC4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9ED0 80143AC8 1000B0AF */  sw         $s0, 0x10($sp)
  .L80143ACC:
    /* 9ED4 80143ACC 21880000 */  addu       $s1, $zero, $zero
    /* 9ED8 80143AD0 40A81200 */  sll        $s5, $s2, 1
    /* 9EDC 80143AD4 2198C002 */  addu       $s3, $s6, $zero
  .L80143AD8:
    /* 9EE0 80143AD8 5017828F */  lw         $v0, %gp_rel(nSx1)($gp)
    /* 9EE4 80143ADC 00000000 */  nop
    /* 9EE8 80143AE0 2A102202 */  slt        $v0, $s1, $v0
    /* 9EEC 80143AE4 06004014 */  bnez       $v0, .L80143B00
    /* 9EF0 80143AE8 00000000 */   nop
    /* 9EF4 80143AEC 5817828F */  lw         $v0, %gp_rel(nSx2)($gp)
    /* 9EF8 80143AF0 00000000 */  nop
    /* 9EFC 80143AF4 2A105100 */  slt        $v0, $v0, $s1
    /* 9F00 80143AF8 4D004010 */  beqz       $v0, .L80143C30
    /* 9F04 80143AFC 00000000 */   nop
  .L80143B00:
    /* 9F08 80143B00 5417828F */  lw         $v0, %gp_rel(nSy1)($gp)
    /* 9F0C 80143B04 00000000 */  nop
    /* 9F10 80143B08 2A104202 */  slt        $v0, $s2, $v0
    /* 9F14 80143B0C 06004014 */  bnez       $v0, .L80143B28
    /* 9F18 80143B10 00000000 */   nop
    /* 9F1C 80143B14 5C17828F */  lw         $v0, %gp_rel(nSy2)($gp)
    /* 9F20 80143B18 00000000 */  nop
    /* 9F24 80143B1C 2A105200 */  slt        $v0, $v0, $s2
    /* 9F28 80143B20 43004010 */  beqz       $v0, .L80143C30
    /* 9F2C 80143B24 00000000 */   nop
  .L80143B28:
    /* 9F30 80143B28 C9F6000C */  jal        ENG_random__Fl
    /* 9F34 80143B2C 04000424 */   addiu     $a0, $zero, 0x4
    /* 9F38 80143B30 3F004014 */  bnez       $v0, .L80143C30
    /* 9F3C 80143B34 2110B302 */   addu      $v0, $s5, $s3
    /* 9F40 80143B38 00004290 */  lbu        $v0, 0x0($v0)
    /* 9F44 80143B3C 1480013C */  lui        $at, %hi(BTYPESL2)
    /* 9F48 80143B40 21082200 */  addu       $at, $at, $v0
    /* 9F4C 80143B44 3C0F3090 */  lbu        $s0, %lo(BTYPESL2)($at)
    /* 9F50 80143B48 00000000 */  nop
    /* 9F54 80143B4C 38000012 */  beqz       $s0, .L80143C30
    /* 9F58 80143B50 00000000 */   nop
    /* 9F5C 80143B54 C9F6000C */  jal        ENG_random__Fl
    /* 9F60 80143B58 10000424 */   addiu     $a0, $zero, 0x10
    /* 9F64 80143B5C 21184000 */  addu       $v1, $v0, $zero
    /* 9F68 80143B60 10006004 */  bltz       $v1, .L80143BA4
    /* 9F6C 80143B64 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 9F70 80143B68 21200002 */  addu       $a0, $s0, $zero
    /* 9F74 80143B6C 0100E724 */  addiu      $a3, $a3, 0x1
  .L80143B70:
    /* 9F78 80143B70 0200F714 */  bne        $a3, $s7, .L80143B7C
    /* 9F7C 80143B74 00000000 */   nop
    /* 9F80 80143B78 21380000 */  addu       $a3, $zero, $zero
  .L80143B7C:
    /* 9F84 80143B7C 1480013C */  lui        $at, %hi(BTYPESL2)
    /* 9F88 80143B80 21082700 */  addu       $at, $at, $a3
    /* 9F8C 80143B84 3C0F2290 */  lbu        $v0, %lo(BTYPESL2)($at)
    /* 9F90 80143B88 00000000 */  nop
    /* 9F94 80143B8C 02008214 */  bne        $a0, $v0, .L80143B98
    /* 9F98 80143B90 00000000 */   nop
    /* 9F9C 80143B94 FFFF6324 */  addiu      $v1, $v1, -0x1
  .L80143B98:
    /* 9FA0 80143B98 F5FF6104 */  bgez       $v1, .L80143B70
    /* 9FA4 80143B9C 0100E724 */   addiu     $a3, $a3, 0x1
    /* 9FA8 80143BA0 FFFFE724 */  addiu      $a3, $a3, -0x1
  .L80143BA4:
    /* 9FAC 80143BA4 FEFF4626 */  addiu      $a2, $s2, -0x2
    /* 9FB0 80143BA8 2A10D400 */  slt        $v0, $a2, $s4
    /* 9FB4 80143BAC 1C004010 */  beqz       $v0, .L80143C20
    /* 9FB8 80143BB0 03004226 */   addiu     $v0, $s2, 0x3
    /* 9FBC 80143BB4 02002926 */  addiu      $t1, $s1, 0x2
    /* 9FC0 80143BB8 21408002 */  addu       $t0, $s4, $zero
  .L80143BBC:
    /* 9FC4 80143BBC FEFF2426 */  addiu      $a0, $s1, -0x2
    /* 9FC8 80143BC0 21282001 */  addu       $a1, $t1, $zero
    /* 9FCC 80143BC4 2A108500 */  slt        $v0, $a0, $a1
    /* 9FD0 80143BC8 11004010 */  beqz       $v0, .L80143C10
    /* 9FD4 80143BCC 40100400 */   sll       $v0, $a0, 1
  .L80143BD0:
    /* 9FD8 80143BD0 21104400 */  addu       $v0, $v0, $a0
    /* 9FDC 80143BD4 40110200 */  sll        $v0, $v0, 5
    /* 9FE0 80143BD8 21105600 */  addu       $v0, $v0, $s6
    /* 9FE4 80143BDC 40180600 */  sll        $v1, $a2, 1
    /* 9FE8 80143BE0 21186200 */  addu       $v1, $v1, $v0
    /* 9FEC 80143BE4 00006294 */  lhu        $v0, 0x0($v1)
    /* 9FF0 80143BE8 00000000 */  nop
    /* 9FF4 80143BEC 04004714 */  bne        $v0, $a3, .L80143C00
    /* 9FF8 80143BF0 01008424 */   addiu     $a0, $a0, 0x1
    /* 9FFC 80143BF4 03004626 */  addiu      $a2, $s2, 0x3
    /* A000 80143BF8 2120A000 */  addu       $a0, $a1, $zero
    /* A004 80143BFC 01008424 */  addiu      $a0, $a0, 0x1
  .L80143C00:
    /* A008 80143C00 02002526 */  addiu      $a1, $s1, 0x2
    /* A00C 80143C04 2A108500 */  slt        $v0, $a0, $a1
    /* A010 80143C08 F1FF4014 */  bnez       $v0, .L80143BD0
    /* A014 80143C0C 40100400 */   sll       $v0, $a0, 1
  .L80143C10:
    /* A018 80143C10 0100C624 */  addiu      $a2, $a2, 0x1
    /* A01C 80143C14 2A10C800 */  slt        $v0, $a2, $t0
    /* A020 80143C18 E8FF4014 */  bnez       $v0, .L80143BBC
    /* A024 80143C1C 03004226 */   addiu     $v0, $s2, 0x3
  .L80143C20:
    /* A028 80143C20 2A10C200 */  slt        $v0, $a2, $v0
    /* A02C 80143C24 02004010 */  beqz       $v0, .L80143C30
    /* A030 80143C28 2110B302 */   addu      $v0, $s5, $s3
    /* A034 80143C2C 000047A4 */  sh         $a3, 0x0($v0)
  .L80143C30:
    /* A038 80143C30 01003126 */  addiu      $s1, $s1, 0x1
    /* A03C 80143C34 2800222A */  slti       $v0, $s1, 0x28
    /* A040 80143C38 A7FF4014 */  bnez       $v0, .L80143AD8
    /* A044 80143C3C 60007326 */   addiu     $s3, $s3, 0x60
    /* A048 80143C40 01005226 */  addiu      $s2, $s2, 0x1
    /* A04C 80143C44 2800422A */  slti       $v0, $s2, 0x28
    /* A050 80143C48 A0FF4014 */  bnez       $v0, .L80143ACC
    /* A054 80143C4C 01009426 */   addiu     $s4, $s4, 0x1
    /* A058 80143C50 3000BF8F */  lw         $ra, 0x30($sp)
    /* A05C 80143C54 2C00B78F */  lw         $s7, 0x2C($sp)
    /* A060 80143C58 2800B68F */  lw         $s6, 0x28($sp)
    /* A064 80143C5C 2400B58F */  lw         $s5, 0x24($sp)
    /* A068 80143C60 2000B48F */  lw         $s4, 0x20($sp)
    /* A06C 80143C64 1C00B38F */  lw         $s3, 0x1C($sp)
    /* A070 80143C68 1800B28F */  lw         $s2, 0x18($sp)
    /* A074 80143C6C 1400B18F */  lw         $s1, 0x14($sp)
    /* A078 80143C70 1000B08F */  lw         $s0, 0x10($sp)
    /* A07C 80143C74 3800BD27 */  addiu      $sp, $sp, 0x38
    /* A080 80143C78 0800E003 */  jr         $ra
    /* A084 80143C7C 00000000 */   nop
endlabel DRLG_L2Subs__Fv
