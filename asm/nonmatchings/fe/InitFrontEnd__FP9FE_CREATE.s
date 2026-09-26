.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitFrontEnd__FP9FE_CREATE, 0x134

glabel InitFrontEnd__FP9FE_CREATE
    /* E78 8013AA70 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* E7C 8013AA74 1400BFAF */  sw         $ra, 0x14($sp)
    /* E80 8013AA78 1000B0AF */  sw         $s0, 0x10($sp)
    /* E84 8013AA7C C81F84AF */  sw         $a0, %gp_rel(D_8011C748)($gp)
    /* E88 8013AA80 040C80AF */  sw         $zero, %gp_rel(FeNoOfPlayers)($gp)
    /* E8C 8013AA84 F80B80AF */  sw         $zero, %gp_rel(FePlayerNo)($gp)
    /* E90 8013AA88 D2EC010C */  jal        LANG_GetLang__Fv
    /* E94 8013AA8C 00000000 */   nop
    /* E98 8013AA90 B00B8393 */  lbu        $v1, %gp_rel(FeIsAVirgin)($gp)
    /* E9C 8013AA94 180C82AF */  sw         $v0, %gp_rel(FeEnterLang)($gp)
    /* EA0 8013AA98 AC0B80AF */  sw         $zero, %gp_rel(LoadedChar + 0x4)($gp)
    /* EA4 8013AA9C A80B80AF */  sw         $zero, %gp_rel(LoadedChar)($gp)
    /* EA8 8013AAA0 1280013C */  lui        $at, %hi(currlevel)
    /* EAC 8013AAA4 0CC120A0 */  sb         $zero, %lo(currlevel)($at)
    /* EB0 8013AAA8 0E006010 */  beqz       $v1, .L8013AAE4
    /* EB4 8013AAAC 00000000 */   nop
    /* EB8 8013AAB0 4AED010C */  jal        GetStr__Fi
    /* EBC 8013AAB4 12030424 */   addiu     $a0, $zero, 0x312
    /* EC0 8013AAB8 0D80103C */  lui        $s0, %hi(FePlayerName)
    /* EC4 8013AABC F8E21026 */  addiu      $s0, $s0, %lo(FePlayerName)
    /* EC8 8013AAC0 21200002 */  addu       $a0, $s0, $zero
    /* ECC 8013AAC4 F240000C */  jal        strcpy
    /* ED0 8013AAC8 21284000 */   addu      $a1, $v0, $zero
    /* ED4 8013AACC 4AED010C */  jal        GetStr__Fi
    /* ED8 8013AAD0 13030424 */   addiu     $a0, $zero, 0x313
    /* EDC 8013AAD4 0B000426 */  addiu      $a0, $s0, 0xB
    /* EE0 8013AAD8 F240000C */  jal        strcpy
    /* EE4 8013AADC 21284000 */   addu      $a1, $v0, $zero
    /* EE8 8013AAE0 B00B80A3 */  sb         $zero, %gp_rel(FeIsAVirgin)($gp)
  .L8013AAE4:
    /* EEC 8013AAE4 21200000 */  addu       $a0, $zero, $zero
    /* EF0 8013AAE8 1480053C */  lui        $a1, %hi(FrontEndTask__FP4TASK)
    /* EF4 8013AAEC 0CC5A524 */  addiu      $a1, $a1, %lo(FrontEndTask__FP4TASK)
    /* EF8 8013AAF0 00100624 */  addiu      $a2, $zero, 0x1000
    /* EFC 8013AAF4 01000324 */  addiu      $v1, $zero, 0x1
    /* F00 8013AAF8 08000224 */  addiu      $v0, $zero, 0x8
    /* F04 8013AAFC E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* F08 8013AB00 20000224 */  addiu      $v0, $zero, 0x20
    /* F0C 8013AB04 E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* F10 8013AB08 40010224 */  addiu      $v0, $zero, 0x140
    /* F14 8013AB0C EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* F18 8013AB10 80000224 */  addiu      $v0, $zero, 0x80
    /* F1C 8013AB14 1D0C83A3 */  sb         $v1, %gp_rel(FePlayerNameFlag + 0x1)($gp)
    /* F20 8013AB18 1C0C83A3 */  sb         $v1, %gp_rel(FePlayerNameFlag)($gp)
    /* F24 8013AB1C F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* F28 8013AB20 F40B83A3 */  sb         $v1, %gp_rel(FeFlag)($gp)
    /* F2C 8013AB24 1280013C */  lui        $at, %hi(gbMaxPlayers)
    /* F30 8013AB28 A2B920A0 */  sb         $zero, %lo(gbMaxPlayers)($at)
    /* F34 8013AB2C 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* F38 8013AB30 A3B920A0 */  sb         $zero, %lo(gbActivePlayers)($at)
    /* F3C 8013AB34 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* F40 8013AB38 55A520A0 */  sb         $zero, %lo(plr + 0x1D)($at)
    /* F44 8013AB3C 0E80013C */  lui        $at, %hi(plr + 0x1A05)
    /* F48 8013AB40 3DBF20A0 */  sb         $zero, %lo(plr + 0x1A05)($at)
    /* F4C 8013AB44 1280013C */  lui        $at, %hi(gbRunGame)
    /* F50 8013AB48 02B820A0 */  sb         $zero, %lo(gbRunGame)($at)
    /* F54 8013AB4C 1280013C */  lui        $at, %hi(PauseMode)
    /* F58 8013AB50 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* F5C 8013AB54 1280013C */  lui        $at, %hi(qtextflag)
    /* F60 8013AB58 60B920A0 */  sb         $zero, %lo(qtextflag)($at)
    /* F64 8013AB5C 0480000C */  jal        TSK_AddTask
    /* F68 8013AB60 21380000 */   addu      $a3, $zero, $zero
    /* F6C 8013AB64 05004014 */  bnez       $v0, .L8013AB7C
    /* F70 8013AB68 21200000 */   addu      $a0, $zero, $zero
    /* F74 8013AB6C 1180053C */  lui        $a1, %hi(D_80110FE4)
    /* F78 8013AB70 E40FA524 */  addiu      $a1, $a1, %lo(D_80110FE4)
    /* F7C 8013AB74 A583000C */  jal        DBG_Error
    /* F80 8013AB78 41020624 */   addiu     $a2, $zero, 0x241
  .L8013AB7C:
    /* F84 8013AB7C 0D80043C */  lui        $a0, %hi(UniqueItemFlag)
    /* F88 8013AB80 54548424 */  addiu      $a0, $a0, %lo(UniqueItemFlag)
    /* F8C 8013AB84 21280000 */  addu       $a1, $zero, $zero
    /* F90 8013AB88 E940000C */  jal        memset
    /* F94 8013AB8C 80000624 */   addiu     $a2, $zero, 0x80
    /* F98 8013AB90 1400BF8F */  lw         $ra, 0x14($sp)
    /* F9C 8013AB94 1000B08F */  lw         $s0, 0x10($sp)
    /* FA0 8013AB98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FA4 8013AB9C 0800E003 */  jr         $ra
    /* FA8 8013ABA0 00000000 */   nop
endlabel InitFrontEnd__FP9FE_CREATE
