.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitNewGameMenu__Fv, 0x90

glabel FeInitNewGameMenu__Fv
    /* 1028 8013AC20 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 102C 8013AC24 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1030 8013AC28 D2EC010C */  jal        LANG_GetLang__Fv
    /* 1034 8013AC2C 00000000 */   nop
    /* 1038 8013AC30 180C838F */  lw         $v1, %gp_rel(FeEnterLang)($gp)
    /* 103C 8013AC34 00000000 */  nop
    /* 1040 8013AC38 0B006210 */  beq        $v1, $v0, .L8013AC68
    /* 1044 8013AC3C 00000000 */   nop
    /* 1048 8013AC40 D2EC010C */  jal        LANG_GetLang__Fv
    /* 104C 8013AC44 00000000 */   nop
    /* 1050 8013AC48 180C82AF */  sw         $v0, %gp_rel(FeEnterLang)($gp)
    /* 1054 8013AC4C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1058 8013AC50 0D80013C */  lui        $at, %hi(FePlayerName)
    /* 105C 8013AC54 F8E220A0 */  sb         $zero, %lo(FePlayerName)($at)
    /* 1060 8013AC58 0D80013C */  lui        $at, %hi(FePlayerName + 0xB)
    /* 1064 8013AC5C 03E320A0 */  sb         $zero, %lo(FePlayerName + 0xB)($at)
    /* 1068 8013AC60 1D0C82A3 */  sb         $v0, %gp_rel(FePlayerNameFlag + 0x1)($gp)
    /* 106C 8013AC64 1C0C82A3 */  sb         $v0, %gp_rel(FePlayerNameFlag)($gp)
  .L8013AC68:
    /* 1070 8013AC68 0D80043C */  lui        $a0, %hi(FeNewGameMenuTable)
    /* 1074 8013AC6C 80D88424 */  addiu      $a0, $a0, %lo(FeNewGameMenuTable)
    /* 1078 8013AC70 35E7040C */  jal        FeAddTable__FP11FeMenuTablei
    /* 107C 8013AC74 03000524 */   addiu     $a1, $zero, 0x3
    /* 1080 8013AC78 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1084 8013AC7C 0C0C82AF */  sw         $v0, %gp_rel(FeChrClass)($gp)
    /* 1088 8013AC80 0C000224 */  addiu      $v0, $zero, 0xC
    /* 108C 8013AC84 E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 1090 8013AC88 20000224 */  addiu      $v0, $zero, 0x20
    /* 1094 8013AC8C E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 1098 8013AC90 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 109C 8013AC94 EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 10A0 8013AC98 80000224 */  addiu      $v0, $zero, 0x80
    /* 10A4 8013AC9C F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 10A8 8013ACA0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10AC 8013ACA4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10B0 8013ACA8 0800E003 */  jr         $ra
    /* 10B4 8013ACAC 00000000 */   nop
endlabel FeInitNewGameMenu__Fv
