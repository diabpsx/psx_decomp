.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching McCharCardMenuCtrl__Fv, 0x248

glabel McCharCardMenuCtrl__Fv
    /* 20110 80159D08 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 20114 80159D0C 1280043C */  lui        $a0, %hi(FePlayerNo)
    /* 20118 80159D10 78B3848C */  lw         $a0, %lo(FePlayerNo)($a0)
    /* 2011C 80159D14 21280000 */  addu       $a1, $zero, $zero
    /* 20120 80159D18 1800BFAF */  sw         $ra, 0x18($sp)
    /* 20124 80159D1C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 20128 80159D20 FD25020C */  jal        PAD_GetPad__FiUc
    /* 2012C 80159D24 1000B0AF */   sw        $s0, 0x10($sp)
    /* 20130 80159D28 1280033C */  lui        $v1, %hi(cardondelay)
    /* 20134 80159D2C FCB1638C */  lw         $v1, %lo(cardondelay)($v1)
    /* 20138 80159D30 00000000 */  nop
    /* 2013C 80159D34 0D006018 */  blez       $v1, .L80159D6C
    /* 20140 80159D38 21804000 */   addu      $s0, $v0, $zero
    /* 20144 80159D3C FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 20148 80159D40 1280013C */  lui        $at, %hi(cardondelay)
    /* 2014C 80159D44 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 20150 80159D48 9797020C */  jal        ShowLoadingBox__Fi
    /* 20154 80159D4C 48030424 */   addiu     $a0, $zero, 0x348
    /* 20158 80159D50 1280023C */  lui        $v0, %hi(cardondelay)
    /* 2015C 80159D54 FCB1428C */  lw         $v0, %lo(cardondelay)($v0)
    /* 20160 80159D58 00000000 */  nop
    /* 20164 80159D5C 76004014 */  bnez       $v0, .L80159F38
    /* 20168 80159D60 01000424 */   addiu     $a0, $zero, 0x1
    /* 2016C 80159D64 E495020C */  jal        ActivateMemcard__Fii
    /* 20170 80159D68 01000524 */   addiu     $a1, $zero, 0x1
  .L80159D6C:
    /* 20174 80159D6C D80C828F */  lw         $v0, %gp_rel(AlertTxt)($gp)
    /* 20178 80159D70 00000000 */  nop
    /* 2017C 80159D74 15004010 */  beqz       $v0, .L80159DCC
    /* 20180 80159D78 00000000 */   nop
    /* 20184 80159D7C EF68050C */  jal        ShowAlertBox__Fv
    /* 20188 80159D80 21880000 */   addu      $s1, $zero, $zero
    /* 2018C 80159D84 106E050C */  jal        GetDown__C4CPad_8015b840
    /* 20190 80159D88 21200002 */   addu      $a0, $s0, $zero
    /* 20194 80159D8C 40004230 */  andi       $v0, $v0, 0x40
    /* 20198 80159D90 06004014 */  bnez       $v0, .L80159DAC
    /* 2019C 80159D94 00000000 */   nop
    /* 201A0 80159D98 106E050C */  jal        GetDown__C4CPad_8015b840
    /* 201A4 80159D9C 21200002 */   addu      $a0, $s0, $zero
    /* 201A8 80159DA0 10004230 */  andi       $v0, $v0, 0x10
    /* 201AC 80159DA4 02004010 */  beqz       $v0, .L80159DB0
    /* 201B0 80159DA8 00000000 */   nop
  .L80159DAC:
    /* 201B4 80159DAC 01001124 */  addiu      $s1, $zero, 0x1
  .L80159DB0:
    /* 201B8 80159DB0 61002012 */  beqz       $s1, .L80159F38
    /* 201BC 80159DB4 00000000 */   nop
    /* 201C0 80159DB8 C6F5000C */  jal        PlaySFX__Fi
    /* 201C4 80159DBC 33000424 */   addiu     $a0, $zero, 0x33
    /* 201C8 80159DC0 D80C80AF */  sw         $zero, %gp_rel(AlertTxt)($gp)
    /* 201CC 80159DC4 CE670508 */  j          .L80159F38
    /* 201D0 80159DC8 00000000 */   nop
  .L80159DCC:
    /* 201D4 80159DCC 2296020C */  jal        ShowCardActionText__Fv
    /* 201D8 80159DD0 21880000 */   addu      $s1, $zero, $zero
    /* 201DC 80159DD4 21200002 */  addu       $a0, $s0, $zero
    /* 201E0 80159DD8 1C6E050C */  jal        SetPadTick__4CPadUs_8015b870
    /* 201E4 80159DDC 0C000524 */   addiu     $a1, $zero, 0xC
    /* 201E8 80159DE0 21200002 */  addu       $a0, $s0, $zero
    /* 201EC 80159DE4 1A6E050C */  jal        SetPadTickMask__4CPadUs_8015b868
    /* 201F0 80159DE8 03000524 */   addiu     $a1, $zero, 0x3
    /* 201F4 80159DEC 106E050C */  jal        GetDown__C4CPad_8015b840
    /* 201F8 80159DF0 21200002 */   addu      $a0, $s0, $zero
    /* 201FC 80159DF4 40004230 */  andi       $v0, $v0, 0x40
    /* 20200 80159DF8 06004014 */  bnez       $v0, .L80159E14
    /* 20204 80159DFC 00000000 */   nop
    /* 20208 80159E00 106E050C */  jal        GetDown__C4CPad_8015b840
    /* 2020C 80159E04 21200002 */   addu      $a0, $s0, $zero
    /* 20210 80159E08 10004230 */  andi       $v0, $v0, 0x10
    /* 20214 80159E0C 02004010 */  beqz       $v0, .L80159E18
    /* 20218 80159E10 00000000 */   nop
  .L80159E14:
    /* 2021C 80159E14 01001124 */  addiu      $s1, $zero, 0x1
  .L80159E18:
    /* 20220 80159E18 2E002012 */  beqz       $s1, .L80159ED4
    /* 20224 80159E1C 00000000 */   nop
    /* 20228 80159E20 0FEA040C */  jal        FeGetCursor__Fv
    /* 2022C 80159E24 00000000 */   nop
    /* 20230 80159E28 80100200 */  sll        $v0, $v0, 2
    /* 20234 80159E2C 1280013C */  lui        $at, %hi(D_8011B3D8)
    /* 20238 80159E30 21082200 */  addu       $at, $at, $v0
    /* 2023C 80159E34 D8B3238C */  lw         $v1, %lo(D_8011B3D8)($at)
    /* 20240 80159E38 02000224 */  addiu      $v0, $zero, 0x2
    /* 20244 80159E3C 0D006214 */  bne        $v1, $v0, .L80159E74
    /* 20248 80159E40 00000000 */   nop
    /* 2024C 80159E44 C6F5000C */  jal        PlaySFX__Fi
    /* 20250 80159E48 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 20254 80159E4C 0FEA040C */  jal        FeGetCursor__Fv
    /* 20258 80159E50 00000000 */   nop
    /* 2025C 80159E54 80100200 */  sll        $v0, $v0, 2
    /* 20260 80159E58 1280013C */  lui        $at, %hi(DoLoadedGame)
    /* 20264 80159E5C 21082200 */  addu       $at, $at, $v0
    /* 20268 80159E60 84B1228C */  lw         $v0, %lo(DoLoadedGame)($at)
    /* 2026C 80159E64 00000000 */  nop
    /* 20270 80159E68 D80C82AF */  sw         $v0, %gp_rel(AlertTxt)($gp)
    /* 20274 80159E6C CE670508 */  j          .L80159F38
    /* 20278 80159E70 00000000 */   nop
  .L80159E74:
    /* 2027C 80159E74 0FEA040C */  jal        FeGetCursor__Fv
    /* 20280 80159E78 00000000 */   nop
    /* 20284 80159E7C 80100200 */  sll        $v0, $v0, 2
    /* 20288 80159E80 1280013C */  lui        $at, %hi(card_status + 0x4)
    /* 2028C 80159E84 21082200 */  addu       $at, $at, $v0
    /* 20290 80159E88 E0B3228C */  lw         $v0, %lo(card_status + 0x4)($at)
    /* 20294 80159E8C 00000000 */  nop
    /* 20298 80159E90 07004014 */  bnez       $v0, .L80159EB0
    /* 2029C 80159E94 01000224 */   addiu     $v0, $zero, 0x1
    /* 202A0 80159E98 C6F5000C */  jal        PlaySFX__Fi
    /* 202A4 80159E9C D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 202A8 80159EA0 09050224 */  addiu      $v0, $zero, 0x509
    /* 202AC 80159EA4 D80C82AF */  sw         $v0, %gp_rel(AlertTxt)($gp)
    /* 202B0 80159EA8 CE670508 */  j          .L80159F38
    /* 202B4 80159EAC 00000000 */   nop
  .L80159EB0:
    /* 202B8 80159EB0 1280013C */  lui        $at, %hi(countdownloadcharblock)
    /* 202BC 80159EB4 6CB122AC */  sw         $v0, %lo(countdownloadcharblock)($at)
    /* 202C0 80159EB8 05000224 */  addiu      $v0, $zero, 0x5
    /* 202C4 80159EBC 1280013C */  lui        $at, %hi(cardondelay)
    /* 202C8 80159EC0 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 202CC 80159EC4 14EA040C */  jal        FeSelect__Fv
    /* 202D0 80159EC8 00000000 */   nop
    /* 202D4 80159ECC CE670508 */  j          .L80159F38
    /* 202D8 80159ED0 00000000 */   nop
  .L80159ED4:
    /* 202DC 80159ED4 066E050C */  jal        GetTick__C4CPad_8015b818
    /* 202E0 80159ED8 21200002 */   addu      $a0, $s0, $zero
    /* 202E4 80159EDC 01004230 */  andi       $v0, $v0, 0x1
    /* 202E8 80159EE0 05004010 */  beqz       $v0, .L80159EF8
    /* 202EC 80159EE4 00000000 */   nop
    /* 202F0 80159EE8 9BE9040C */  jal        FeSelUp__Fi
    /* 202F4 80159EEC 01000424 */   addiu     $a0, $zero, 0x1
    /* 202F8 80159EF0 CE670508 */  j          .L80159F38
    /* 202FC 80159EF4 00000000 */   nop
  .L80159EF8:
    /* 20300 80159EF8 066E050C */  jal        GetTick__C4CPad_8015b818
    /* 20304 80159EFC 21200002 */   addu      $a0, $s0, $zero
    /* 20308 80159F00 02004230 */  andi       $v0, $v0, 0x2
    /* 2030C 80159F04 05004010 */  beqz       $v0, .L80159F1C
    /* 20310 80159F08 00000000 */   nop
    /* 20314 80159F0C D5E9040C */  jal        FeSelDown__Fi
    /* 20318 80159F10 01000424 */   addiu     $a0, $zero, 0x1
    /* 2031C 80159F14 CE670508 */  j          .L80159F38
    /* 20320 80159F18 00000000 */   nop
  .L80159F1C:
    /* 20324 80159F1C 106E050C */  jal        GetDown__C4CPad_8015b840
    /* 20328 80159F20 21200002 */   addu      $a0, $s0, $zero
    /* 2032C 80159F24 00014230 */  andi       $v0, $v0, 0x100
    /* 20330 80159F28 03004010 */  beqz       $v0, .L80159F38
    /* 20334 80159F2C 00000000 */   nop
    /* 20338 80159F30 49E9040C */  jal        FePrevMenu__Fv
    /* 2033C 80159F34 00000000 */   nop
  .L80159F38:
    /* 20340 80159F38 1800BF8F */  lw         $ra, 0x18($sp)
    /* 20344 80159F3C 1400B18F */  lw         $s1, 0x14($sp)
    /* 20348 80159F40 1000B08F */  lw         $s0, 0x10($sp)
    /* 2034C 80159F44 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 20350 80159F48 0800E003 */  jr         $ra
    /* 20354 80159F4C 00000000 */   nop
endlabel McCharCardMenuCtrl__Fv
