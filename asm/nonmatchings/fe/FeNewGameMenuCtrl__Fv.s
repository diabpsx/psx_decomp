.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeNewGameMenuCtrl__Fv, 0x1B4

glabel FeNewGameMenuCtrl__Fv
    /* 10B8 8013ACB0 1280023C */  lui        $v0, %hi(qtextflag)
    /* 10BC 8013ACB4 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 10C0 8013ACB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10C4 8013ACBC 65004014 */  bnez       $v0, .L8013AE54
    /* 10C8 8013ACC0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 10CC 8013ACC4 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 10D0 8013ACC8 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 10D4 8013ACCC 00000000 */  nop
    /* 10D8 8013ACD0 60004014 */  bnez       $v0, .L8013AE54
    /* 10DC 8013ACD4 00000000 */   nop
    /* 10E0 8013ACD8 1280023C */  lui        $v0, %hi(PauseMode)
    /* 10E4 8013ACDC A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 10E8 8013ACE0 00000000 */  nop
    /* 10EC 8013ACE4 5B004014 */  bnez       $v0, .L8013AE54
    /* 10F0 8013ACE8 21200000 */   addu      $a0, $zero, $zero
    /* 10F4 8013ACEC FD25020C */  jal        PAD_GetPad__FiUc
    /* 10F8 8013ACF0 21280000 */   addu      $a1, $zero, $zero
    /* 10FC 8013ACF4 D1F2040C */  jal        CheckActive__4CPad_8013cb44
    /* 1100 8013ACF8 21204000 */   addu      $a0, $v0, $zero
    /* 1104 8013ACFC 01000424 */  addiu      $a0, $zero, 0x1
    /* 1108 8013AD00 080C82A3 */  sb         $v0, %gp_rel(FePadInTab)($gp)
    /* 110C 8013AD04 FD25020C */  jal        PAD_GetPad__FiUc
    /* 1110 8013AD08 21280000 */   addu      $a1, $zero, $zero
    /* 1114 8013AD0C D1F2040C */  jal        CheckActive__4CPad_8013cb44
    /* 1118 8013AD10 21204000 */   addu      $a0, $v0, $zero
    /* 111C 8013AD14 080C8393 */  lbu        $v1, %gp_rel(FePadInTab)($gp)
    /* 1120 8013AD18 090C82A3 */  sb         $v0, %gp_rel(FePadInTab + 0x1)($gp)
    /* 1124 8013AD1C 06006014 */  bnez       $v1, .L8013AD38
    /* 1128 8013AD20 FF004230 */   andi      $v0, $v0, 0xFF
    /* 112C 8013AD24 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 1130 8013AD28 01000224 */  addiu      $v0, $zero, 0x1
    /* 1134 8013AD2C FC0B82AF */  sw         $v0, %gp_rel(FeBufferCount)($gp)
    /* 1138 8013AD30 58EB0408 */  j          .L8013AD60
    /* 113C 8013AD34 040062AC */   sw        $v0, 0x4($v1)
  .L8013AD38:
    /* 1140 8013AD38 04004010 */  beqz       $v0, .L8013AD4C
    /* 1144 8013AD3C 03000224 */   addiu     $v0, $zero, 0x3
    /* 1148 8013AD40 FC0B82AF */  sw         $v0, %gp_rel(FeBufferCount)($gp)
    /* 114C 8013AD44 58EB0408 */  j          .L8013AD60
    /* 1150 8013AD48 00000000 */   nop
  .L8013AD4C:
    /* 1154 8013AD4C 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 1158 8013AD50 02000224 */  addiu      $v0, $zero, 0x2
    /* 115C 8013AD54 FC0B82AF */  sw         $v0, %gp_rel(FeBufferCount)($gp)
    /* 1160 8013AD58 01000224 */  addiu      $v0, $zero, 0x1
    /* 1164 8013AD5C 040062AC */  sw         $v0, 0x4($v1)
  .L8013AD60:
    /* 1168 8013AD60 EDEB040C */  jal        FeDrawChrClass__Fv
    /* 116C 8013AD64 00000000 */   nop
    /* 1170 8013AD68 080C8293 */  lbu        $v0, %gp_rel(FePadInTab)($gp)
    /* 1174 8013AD6C 00000000 */  nop
    /* 1178 8013AD70 38004010 */  beqz       $v0, .L8013AE54
    /* 117C 8013AD74 00000000 */   nop
    /* 1180 8013AD78 1280023C */  lui        $v0, %hi(DavesPad)
    /* 1184 8013AD7C 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 1188 8013AD80 00000000 */  nop
    /* 118C 8013AD84 01004230 */  andi       $v0, $v0, 0x1
    /* 1190 8013AD88 03004010 */  beqz       $v0, .L8013AD98
    /* 1194 8013AD8C 00000000 */   nop
    /* 1198 8013AD90 9BE9040C */  jal        FeSelUp__Fi
    /* 119C 8013AD94 01000424 */   addiu     $a0, $zero, 0x1
  .L8013AD98:
    /* 11A0 8013AD98 1280023C */  lui        $v0, %hi(DavesPad)
    /* 11A4 8013AD9C 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 11A8 8013ADA0 00000000 */  nop
    /* 11AC 8013ADA4 02004230 */  andi       $v0, $v0, 0x2
    /* 11B0 8013ADA8 03004010 */  beqz       $v0, .L8013ADB8
    /* 11B4 8013ADAC 00000000 */   nop
    /* 11B8 8013ADB0 D5E9040C */  jal        FeSelDown__Fi
    /* 11BC 8013ADB4 01000424 */   addiu     $a0, $zero, 0x1
  .L8013ADB8:
    /* 11C0 8013ADB8 1280023C */  lui        $v0, %hi(DavesPad)
    /* 11C4 8013ADBC 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 11C8 8013ADC0 00000000 */  nop
    /* 11CC 8013ADC4 50004230 */  andi       $v0, $v0, 0x50
    /* 11D0 8013ADC8 1A004010 */  beqz       $v0, .L8013AE34
    /* 11D4 8013ADCC 01000324 */   addiu     $v1, $zero, 0x1
    /* 11D8 8013ADD0 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 11DC 8013ADD4 00000000 */  nop
    /* 11E0 8013ADD8 0400428C */  lw         $v0, 0x4($v0)
    /* 11E4 8013ADDC 00000000 */  nop
    /* 11E8 8013ADE0 04004314 */  bne        $v0, $v1, .L8013ADF4
    /* 11EC 8013ADE4 00000000 */   nop
    /* 11F0 8013ADE8 040C80AF */  sw         $zero, %gp_rel(FeNoOfPlayers)($gp)
    /* 11F4 8013ADEC 7EEB0408 */  j          .L8013ADF8
    /* 11F8 8013ADF0 00000000 */   nop
  .L8013ADF4:
    /* 11FC 8013ADF4 040C83AF */  sw         $v1, %gp_rel(FeNoOfPlayers)($gp)
  .L8013ADF8:
    /* 1200 8013ADF8 F80B80AF */  sw         $zero, %gp_rel(FePlayerNo)($gp)
    /* 1204 8013ADFC C6F5000C */  jal        PlaySFX__Fi
    /* 1208 8013AE00 33000424 */   addiu     $a0, $zero, 0x33
    /* 120C 8013AE04 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 1210 8013AE08 00000000 */  nop
    /* 1214 8013AE0C 0400438C */  lw         $v1, 0x4($v0)
    /* 1218 8013AE10 00000000 */  nop
    /* 121C 8013AE14 40100300 */  sll        $v0, $v1, 1
    /* 1220 8013AE18 21104300 */  addu       $v0, $v0, $v1
    /* 1224 8013AE1C C0100200 */  sll        $v0, $v0, 3
    /* 1228 8013AE20 0D80013C */  lui        $at, %hi(FeBuffer + 0x14)
    /* 122C 8013AE24 21082200 */  addu       $at, $at, $v0
    /* 1230 8013AE28 8CDB248C */  lw         $a0, %lo(FeBuffer + 0x14)($at)
    /* 1234 8013AE2C 29E9040C */  jal        FeNewMenu__FP7FeTable
    /* 1238 8013AE30 00000000 */   nop
  .L8013AE34:
    /* 123C 8013AE34 1280023C */  lui        $v0, %hi(DavesPad)
    /* 1240 8013AE38 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 1244 8013AE3C 00000000 */  nop
    /* 1248 8013AE40 00014230 */  andi       $v0, $v0, 0x100
    /* 124C 8013AE44 03004010 */  beqz       $v0, .L8013AE54
    /* 1250 8013AE48 00000000 */   nop
    /* 1254 8013AE4C 49E9040C */  jal        FePrevMenu__Fv
    /* 1258 8013AE50 00000000 */   nop
  .L8013AE54:
    /* 125C 8013AE54 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1260 8013AE58 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1264 8013AE5C 0800E003 */  jr         $ra
    /* 1268 8013AE60 00000000 */   nop
endlabel FeNewGameMenuCtrl__Fv
