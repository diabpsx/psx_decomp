.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013ACFC, 0x98

glabel func_8013ACFC
    /* 1104 8013ACFC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1108 8013AD00 1000B0AF */  sw         $s0, 0x10($sp)
    /* 110C 8013AD04 21808000 */  addu       $s0, $a0, $zero
    /* 1110 8013AD08 1480053C */  lui        $a1, %hi(D_80139CB0)
    /* 1114 8013AD0C B09CA524 */  addiu      $a1, $a1, %lo(D_80139CB0)
    /* 1118 8013AD10 0F000324 */  addiu      $v1, $zero, 0xF
    /* 111C 8013AD14 FFFF0624 */  addiu      $a2, $zero, -0x1
    /* 1120 8013AD18 1400BFAF */  sw         $ra, 0x14($sp)
  .L8013AD1C:
    /* 1124 8013AD1C 0000828C */  lw         $v0, 0x0($a0)
    /* 1128 8013AD20 04008424 */  addiu      $a0, $a0, 0x4
    /* 112C 8013AD24 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1130 8013AD28 0000A2AC */  sw         $v0, 0x0($a1)
    /* 1134 8013AD2C FBFF6614 */  bne        $v1, $a2, .L8013AD1C
    /* 1138 8013AD30 0400A524 */   addiu     $a1, $a1, 0x4
    /* 113C 8013AD34 1480053C */  lui        $a1, %hi(D_80139CF0)
    /* 1140 8013AD38 F09CA524 */  addiu      $a1, $a1, %lo(D_80139CF0)
    /* 1144 8013AD3C 40000426 */  addiu      $a0, $s0, 0x40
    /* 1148 8013AD40 0F000324 */  addiu      $v1, $zero, 0xF
    /* 114C 8013AD44 FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8013AD48:
    /* 1150 8013AD48 0000828C */  lw         $v0, 0x0($a0)
    /* 1154 8013AD4C 04008424 */  addiu      $a0, $a0, 0x4
    /* 1158 8013AD50 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 115C 8013AD54 0000A2AC */  sw         $v0, 0x0($a1)
    /* 1160 8013AD58 FBFF6614 */  bne        $v1, $a2, .L8013AD48
    /* 1164 8013AD5C 0400A524 */   addiu     $a1, $a1, 0x4
    /* 1168 8013AD60 1480043C */  lui        $a0, %hi(D_80139CAC)
    /* 116C 8013AD64 AC9C8424 */  addiu      $a0, $a0, %lo(D_80139CAC)
    /* 1170 8013AD68 FBEB040C */  jal        func_8013AFEC
    /* 1174 8013AD6C 20000524 */   addiu     $a1, $zero, 0x20
    /* 1178 8013AD70 1480043C */  lui        $a0, %hi(D_80139D30)
    /* 117C 8013AD74 309D8424 */  addiu      $a0, $a0, %lo(D_80139D30)
    /* 1180 8013AD78 FBEB040C */  jal        func_8013AFEC
    /* 1184 8013AD7C 20000524 */   addiu     $a1, $zero, 0x20
    /* 1188 8013AD80 21100002 */  addu       $v0, $s0, $zero
    /* 118C 8013AD84 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1190 8013AD88 1000B08F */  lw         $s0, 0x10($sp)
    /* 1194 8013AD8C 0800E003 */  jr         $ra
    /* 1198 8013AD90 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel func_8013ACFC
