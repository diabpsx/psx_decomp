.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawInvHelpTxt__Fv, 0x2E8

glabel DrawInvHelpTxt__Fv
    /* 1F1D4 80158DCC 50FFBD27 */  addiu      $sp, $sp, -0xB0
    /* 1F1D8 80158DD0 AC00BFAF */  sw         $ra, 0xAC($sp)
    /* 1F1DC 80158DD4 A800B0AF */  sw         $s0, 0xA8($sp)
    /* 1F1E0 80158DD8 D2EC010C */  jal        LANG_GetLang__Fv
    /* 1F1E4 80158DDC 2800A0A3 */   sb        $zero, 0x28($sp)
    /* 1F1E8 80158DE0 01000324 */  addiu      $v1, $zero, 0x1
    /* 1F1EC 80158DE4 35004314 */  bne        $v0, $v1, .L80158EBC
    /* 1F1F0 80158DE8 00000000 */   nop
    /* 1F1F4 80158DEC 1280023C */  lui        $v0, %hi(myplr)
    /* 1F1F8 80158DF0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1F1FC 80158DF4 00000000 */  nop
    /* 1F200 80158DF8 80100200 */  sll        $v0, $v0, 2
    /* 1F204 80158DFC 1280013C */  lui        $at, %hi(_pcurs)
    /* 1F208 80158E00 21082200 */  addu       $at, $at, $v0
    /* 1F20C 80158E04 30B7238C */  lw         $v1, %lo(_pcurs)($at)
    /* 1F210 80158E08 02000224 */  addiu      $v0, $zero, 0x2
    /* 1F214 80158E0C 0A006214 */  bne        $v1, $v0, .L80158E38
    /* 1F218 80158E10 03000224 */   addiu     $v0, $zero, 0x3
    /* 1F21C 80158E14 4AED010C */  jal        GetStr__Fi
    /* 1F220 80158E18 31030424 */   addiu     $a0, $zero, 0x331
    /* 1F224 80158E1C 08020424 */  addiu      $a0, $zero, 0x208
    /* 1F228 80158E20 4AED010C */  jal        GetStr__Fi
    /* 1F22C 80158E24 21804000 */   addu      $s0, $v0, $zero
    /* 1F230 80158E28 1280053C */  lui        $a1, %hi(D_8011A3DC)
    /* 1F234 80158E2C DCA3A524 */  addiu      $a1, $a1, %lo(D_8011A3DC)
    /* 1F238 80158E30 E2630508 */  j          .L80158F88
    /* 1F23C 80158E34 2800A427 */   addiu     $a0, $sp, 0x28
  .L80158E38:
    /* 1F240 80158E38 0A006214 */  bne        $v1, $v0, .L80158E64
    /* 1F244 80158E3C 04000224 */   addiu     $v0, $zero, 0x4
    /* 1F248 80158E40 4AED010C */  jal        GetStr__Fi
    /* 1F24C 80158E44 31030424 */   addiu     $a0, $zero, 0x331
    /* 1F250 80158E48 5A030424 */  addiu      $a0, $zero, 0x35A
    /* 1F254 80158E4C 4AED010C */  jal        GetStr__Fi
    /* 1F258 80158E50 21804000 */   addu      $s0, $v0, $zero
    /* 1F25C 80158E54 1280053C */  lui        $a1, %hi(D_8011A3DC)
    /* 1F260 80158E58 DCA3A524 */  addiu      $a1, $a1, %lo(D_8011A3DC)
    /* 1F264 80158E5C E2630508 */  j          .L80158F88
    /* 1F268 80158E60 2800A427 */   addiu     $a0, $sp, 0x28
  .L80158E64:
    /* 1F26C 80158E64 0A006214 */  bne        $v1, $v0, .L80158E90
    /* 1F270 80158E68 0C006228 */   slti      $v0, $v1, 0xC
    /* 1F274 80158E6C 4AED010C */  jal        GetStr__Fi
    /* 1F278 80158E70 31030424 */   addiu     $a0, $zero, 0x331
    /* 1F27C 80158E74 4C030424 */  addiu      $a0, $zero, 0x34C
    /* 1F280 80158E78 4AED010C */  jal        GetStr__Fi
    /* 1F284 80158E7C 21804000 */   addu      $s0, $v0, $zero
    /* 1F288 80158E80 1280053C */  lui        $a1, %hi(D_8011A3DC)
    /* 1F28C 80158E84 DCA3A524 */  addiu      $a1, $a1, %lo(D_8011A3DC)
    /* 1F290 80158E88 E2630508 */  j          .L80158F88
    /* 1F294 80158E8C 2800A427 */   addiu     $a0, $sp, 0x28
  .L80158E90:
    /* 1F298 80158E90 42004014 */  bnez       $v0, .L80158F9C
    /* 1F29C 80158E94 00000000 */   nop
    /* 1F2A0 80158E98 4AED010C */  jal        GetStr__Fi
    /* 1F2A4 80158E9C E6040424 */   addiu     $a0, $zero, 0x4E6
    /* 1F2A8 80158EA0 1D010424 */  addiu      $a0, $zero, 0x11D
    /* 1F2AC 80158EA4 4AED010C */  jal        GetStr__Fi
    /* 1F2B0 80158EA8 21804000 */   addu      $s0, $v0, $zero
    /* 1F2B4 80158EAC 1280053C */  lui        $a1, %hi(D_8011A3E8)
    /* 1F2B8 80158EB0 E8A3A524 */  addiu      $a1, $a1, %lo(D_8011A3E8)
    /* 1F2BC 80158EB4 E2630508 */  j          .L80158F88
    /* 1F2C0 80158EB8 2800A427 */   addiu     $a0, $sp, 0x28
  .L80158EBC:
    /* 1F2C4 80158EBC 1280023C */  lui        $v0, %hi(myplr)
    /* 1F2C8 80158EC0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1F2CC 80158EC4 00000000 */  nop
    /* 1F2D0 80158EC8 80100200 */  sll        $v0, $v0, 2
    /* 1F2D4 80158ECC 1280013C */  lui        $at, %hi(_pcurs)
    /* 1F2D8 80158ED0 21082200 */  addu       $at, $at, $v0
    /* 1F2DC 80158ED4 30B7238C */  lw         $v1, %lo(_pcurs)($at)
    /* 1F2E0 80158ED8 02000224 */  addiu      $v0, $zero, 0x2
    /* 1F2E4 80158EDC 0A006214 */  bne        $v1, $v0, .L80158F08
    /* 1F2E8 80158EE0 03000224 */   addiu     $v0, $zero, 0x3
    /* 1F2EC 80158EE4 4AED010C */  jal        GetStr__Fi
    /* 1F2F0 80158EE8 08020424 */   addiu     $a0, $zero, 0x208
    /* 1F2F4 80158EEC 31030424 */  addiu      $a0, $zero, 0x331
    /* 1F2F8 80158EF0 4AED010C */  jal        GetStr__Fi
    /* 1F2FC 80158EF4 21804000 */   addu      $s0, $v0, $zero
    /* 1F300 80158EF8 1280053C */  lui        $a1, %hi(D_8011A3F4)
    /* 1F304 80158EFC F4A3A524 */  addiu      $a1, $a1, %lo(D_8011A3F4)
    /* 1F308 80158F00 E2630508 */  j          .L80158F88
    /* 1F30C 80158F04 2800A427 */   addiu     $a0, $sp, 0x28
  .L80158F08:
    /* 1F310 80158F08 0A006214 */  bne        $v1, $v0, .L80158F34
    /* 1F314 80158F0C 04000224 */   addiu     $v0, $zero, 0x4
    /* 1F318 80158F10 4AED010C */  jal        GetStr__Fi
    /* 1F31C 80158F14 5A030424 */   addiu     $a0, $zero, 0x35A
    /* 1F320 80158F18 31030424 */  addiu      $a0, $zero, 0x331
    /* 1F324 80158F1C 4AED010C */  jal        GetStr__Fi
    /* 1F328 80158F20 21804000 */   addu      $s0, $v0, $zero
    /* 1F32C 80158F24 1280053C */  lui        $a1, %hi(D_8011A3F4)
    /* 1F330 80158F28 F4A3A524 */  addiu      $a1, $a1, %lo(D_8011A3F4)
    /* 1F334 80158F2C E2630508 */  j          .L80158F88
    /* 1F338 80158F30 2800A427 */   addiu     $a0, $sp, 0x28
  .L80158F34:
    /* 1F33C 80158F34 0A006214 */  bne        $v1, $v0, .L80158F60
    /* 1F340 80158F38 0C006228 */   slti      $v0, $v1, 0xC
    /* 1F344 80158F3C 4AED010C */  jal        GetStr__Fi
    /* 1F348 80158F40 4C030424 */   addiu     $a0, $zero, 0x34C
    /* 1F34C 80158F44 31030424 */  addiu      $a0, $zero, 0x331
    /* 1F350 80158F48 4AED010C */  jal        GetStr__Fi
    /* 1F354 80158F4C 21804000 */   addu      $s0, $v0, $zero
    /* 1F358 80158F50 1280053C */  lui        $a1, %hi(D_8011A3F4)
    /* 1F35C 80158F54 F4A3A524 */  addiu      $a1, $a1, %lo(D_8011A3F4)
    /* 1F360 80158F58 E2630508 */  j          .L80158F88
    /* 1F364 80158F5C 2800A427 */   addiu     $a0, $sp, 0x28
  .L80158F60:
    /* 1F368 80158F60 0E004014 */  bnez       $v0, .L80158F9C
    /* 1F36C 80158F64 00000000 */   nop
    /* 1F370 80158F68 4AED010C */  jal        GetStr__Fi
    /* 1F374 80158F6C 1D010424 */   addiu     $a0, $zero, 0x11D
    /* 1F378 80158F70 E6040424 */  addiu      $a0, $zero, 0x4E6
    /* 1F37C 80158F74 4AED010C */  jal        GetStr__Fi
    /* 1F380 80158F78 21804000 */   addu      $s0, $v0, $zero
    /* 1F384 80158F7C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 1F388 80158F80 1280053C */  lui        $a1, %hi(D_8011A400)
    /* 1F38C 80158F84 00A4A524 */  addiu      $a1, $a1, %lo(D_8011A400)
  .L80158F88:
    /* 1F390 80158F88 21300002 */  addu       $a2, $s0, $zero
    /* 1F394 80158F8C 9767000C */  jal        sprintf
    /* 1F398 80158F90 21384000 */   addu      $a3, $v0, $zero
    /* 1F39C 80158F94 EE630508 */  j          .L80158FB8
    /* 1F3A0 80158F98 00000000 */   nop
  .L80158F9C:
    /* 1F3A4 80158F9C 4AED010C */  jal        GetStr__Fi
    /* 1F3A8 80158FA0 E6040424 */   addiu     $a0, $zero, 0x4E6
    /* 1F3AC 80158FA4 2800A427 */  addiu      $a0, $sp, 0x28
    /* 1F3B0 80158FA8 1280053C */  lui        $a1, %hi(D_8011C320)
    /* 1F3B4 80158FAC 20C3A524 */  addiu      $a1, $a1, %lo(D_8011C320)
    /* 1F3B8 80158FB0 9767000C */  jal        sprintf
    /* 1F3BC 80158FB4 21304000 */   addu      $a2, $v0, $zero
  .L80158FB8:
    /* 1F3C0 80158FB8 B01B828F */  lw         $v0, %gp_rel(InvBackY)($gp)
    /* 1F3C4 80158FBC 00000000 */  nop
    /* 1F3C8 80158FC0 07004014 */  bnez       $v0, .L80158FE0
    /* 1F3CC 80158FC4 2E000524 */   addiu     $a1, $zero, 0x2E
    /* 1F3D0 80158FC8 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 1F3D4 80158FCC D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 1F3D8 80158FD0 C82A020C */  jal        SetChar__5CFontiUs
    /* 1F3DC 80158FD4 80000624 */   addiu     $a2, $zero, 0x80
    /* 1F3E0 80158FD8 FD630508 */  j          .L80158FF4
    /* 1F3E4 80158FDC FE020424 */   addiu     $a0, $zero, 0x2FE
  .L80158FE0:
    /* 1F3E8 80158FE0 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 1F3EC 80158FE4 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 1F3F0 80158FE8 C82A020C */  jal        SetChar__5CFontiUs
    /* 1F3F4 80158FEC 7F000624 */   addiu     $a2, $zero, 0x7F
    /* 1F3F8 80158FF0 32010424 */  addiu      $a0, $zero, 0x132
  .L80158FF4:
    /* 1F3FC 80158FF4 4AED010C */  jal        GetStr__Fi
    /* 1F400 80158FF8 00000000 */   nop
    /* 1F404 80158FFC 2800A427 */  addiu      $a0, $sp, 0x28
    /* 1F408 80159000 1280053C */  lui        $a1, %hi(D_8011A40C)
    /* 1F40C 80159004 0CA4A524 */  addiu      $a1, $a1, %lo(D_8011A40C)
    /* 1F410 80159008 21308000 */  addu       $a2, $a0, $zero
    /* 1F414 8015900C 9767000C */  jal        sprintf
    /* 1F418 80159010 21384000 */   addu      $a3, $v0, $zero
    /* 1F41C 80159014 BC1B828F */  lw         $v0, %gp_rel(InvPageFlag)($gp)
    /* 1F420 80159018 00000000 */  nop
    /* 1F424 8015901C 09004010 */  beqz       $v0, .L80159044
    /* 1F428 80159020 00000000 */   nop
    /* 1F42C 80159024 4AED010C */  jal        GetStr__Fi
    /* 1F430 80159028 A4020424 */   addiu     $a0, $zero, 0x2A4
    /* 1F434 8015902C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 1F438 80159030 1280053C */  lui        $a1, %hi(D_8011A418)
    /* 1F43C 80159034 18A4A524 */  addiu      $a1, $a1, %lo(D_8011A418)
    /* 1F440 80159038 21308000 */  addu       $a2, $a0, $zero
    /* 1F444 8015903C 9767000C */  jal        sprintf
    /* 1F448 80159040 21384000 */   addu      $a3, $v0, $zero
  .L80159044:
    /* 1F44C 80159044 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 1F450 80159048 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 1F454 8015904C 21200002 */  addu       $a0, $s0, $zero
    /* 1F458 80159050 21280000 */  addu       $a1, $zero, $zero
    /* 1F45C 80159054 E0000624 */  addiu      $a2, $zero, 0xE0
    /* 1F460 80159058 2800A727 */  addiu      $a3, $sp, 0x28
    /* 1F464 8015905C 1280033C */  lui        $v1, %hi(WHITER)
    /* 1F468 80159060 D1AB6390 */  lbu        $v1, %lo(WHITER)($v1)
    /* 1F46C 80159064 1280083C */  lui        $t0, %hi(WHITEG)
    /* 1F470 80159068 D2AB0891 */  lbu        $t0, %lo(WHITEG)($t0)
    /* 1F474 8015906C 1280093C */  lui        $t1, %hi(WHITEB)
    /* 1F478 80159070 D3AB2991 */  lbu        $t1, %lo(WHITEB)($t1)
    /* 1F47C 80159074 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F480 80159078 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1F484 8015907C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1F488 80159080 1800A3AF */  sw         $v1, 0x18($sp)
    /* 1F48C 80159084 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 1F490 80159088 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 1F494 8015908C 2000A9AF */   sw        $t1, 0x20($sp)
    /* 1F498 80159090 21200002 */  addu       $a0, $s0, $zero
    /* 1F49C 80159094 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 1F4A0 80159098 C82A020C */  jal        SetChar__5CFontiUs
    /* 1F4A4 8015909C 6D000624 */   addiu     $a2, $zero, 0x6D
    /* 1F4A8 801590A0 AC00BF8F */  lw         $ra, 0xAC($sp)
    /* 1F4AC 801590A4 A800B08F */  lw         $s0, 0xA8($sp)
    /* 1F4B0 801590A8 B000BD27 */  addiu      $sp, $sp, 0xB0
    /* 1F4B4 801590AC 0800E003 */  jr         $ra
    /* 1F4B8 801590B0 00000000 */   nop
endlabel DrawInvHelpTxt__Fv
