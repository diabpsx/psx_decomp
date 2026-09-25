.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetInit__FUcPUc, 0x290

glabel NetInit__FUcPUc
    /* 42DF0 80052DF0 40FFBD27 */  addiu      $sp, $sp, -0xC0
    /* 42DF4 80052DF4 B800B0AF */  sw         $s0, 0xB8($sp)
    /* 42DF8 80052DF8 21808000 */  addu       $s0, $a0, $zero
    /* 42DFC 80052DFC 1000A427 */  addiu      $a0, $sp, 0x10
    /* 42E00 80052E00 BC00BFAF */  sw         $ra, 0xBC($sp)
    /* 42E04 80052E04 0000A0A0 */  sb         $zero, 0x0($a1)
    /* 42E08 80052E08 21280000 */  addu       $a1, $zero, $zero
    /* 42E0C 80052E0C E940000C */  jal        memset
    /* 42E10 80052E10 80000624 */   addiu     $a2, $zero, 0x80
    /* 42E14 80052E14 FF001032 */  andi       $s0, $s0, 0xFF
    /* 42E18 80052E18 0B000016 */  bnez       $s0, .L80052E48
    /* 42E1C 80052E1C 00000000 */   nop
    /* 42E20 80052E20 1280013C */  lui        $at, %hi(myplr)
    /* 42E24 80052E24 08BA20AC */  sw         $zero, %lo(myplr)($at)
    /* 42E28 80052E28 407F010C */  jal        SetupLocalPlayer__Fv
    /* 42E2C 80052E2C 00000000 */   nop
    /* 42E30 80052E30 0E80043C */  lui        $a0, %hi(plr)
    /* 42E34 80052E34 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 42E38 80052E38 1280063C */  lui        $a2, %hi(gbValidSaveFile)
    /* 42E3C 80052E3C F0B9C690 */  lbu        $a2, %lo(gbValidSaveFile)($a2)
    /* 42E40 80052E40 137F010C */  jal        game_2_ui_player__FPC12PlayerStructP11_uiheroinfoUc
    /* 42E44 80052E44 9000A527 */   addiu     $a1, $sp, 0x90
  .L80052E48:
    /* 42E48 80052E48 B3F6000C */  jal        SetRndSeed__Fl
    /* 42E4C 80052E4C 21200000 */   addu      $a0, $zero, $zero
    /* 42E50 80052E50 1280043C */  lui        $a0, %hi(D_8011C854)
    /* 42E54 80052E54 54C88424 */  addiu      $a0, $a0, %lo(D_8011C854)
    /* 42E58 80052E58 21280000 */  addu       $a1, $zero, $zero
    /* 42E5C 80052E5C 1280023C */  lui        $v0, %hi(gnDifficulty)
    /* 42E60 80052E60 08C1428C */  lw         $v0, %lo(gnDifficulty)($v0)
    /* 42E64 80052E64 241280A3 */  sb         $zero, %gp_rel(gbGameDestroyed)($gp)
    /* 42E68 80052E68 EC2082A3 */  sb         $v0, %gp_rel(D_8011C86C)($gp)
    /* 42E6C 80052E6C E940000C */  jal        memset
    /* 42E70 80052E70 02000624 */   addiu     $a2, $zero, 0x2
    /* 42E74 80052E74 1280043C */  lui        $a0, %hi(D_8011C858)
    /* 42E78 80052E78 58C88424 */  addiu      $a0, $a0, %lo(D_8011C858)
    /* 42E7C 80052E7C 21280000 */  addu       $a1, $zero, $zero
    /* 42E80 80052E80 E940000C */  jal        memset
    /* 42E84 80052E84 08000624 */   addiu     $a2, $zero, 0x8
    /* 42E88 80052E88 1280043C */  lui        $a0, %hi(D_8011C860)
    /* 42E8C 80052E8C 60C88424 */  addiu      $a0, $a0, %lo(D_8011C860)
    /* 42E90 80052E90 21280000 */  addu       $a1, $zero, $zero
    /* 42E94 80052E94 E940000C */  jal        memset
    /* 42E98 80052E98 02000624 */   addiu     $a2, $zero, 0x2
    /* 42E9C 80052E9C 1280043C */  lui        $a0, %hi(D_8011C850)
    /* 42EA0 80052EA0 50C88424 */  addiu      $a0, $a0, %lo(D_8011C850)
    /* 42EA4 80052EA4 21280000 */  addu       $a1, $zero, $zero
    /* 42EA8 80052EA8 E940000C */  jal        memset
    /* 42EAC 80052EAC 04000624 */   addiu     $a2, $zero, 0x4
    /* 42EB0 80052EB0 01001024 */  addiu      $s0, $zero, 0x1
    /* 42EB4 80052EB4 1280013C */  lui        $at, %hi(myplr)
    /* 42EB8 80052EB8 08BA20AC */  sw         $zero, %lo(myplr)($at)
    /* 42EBC 80052EBC 211290A3 */  sb         $s0, %gp_rel(D_8011B9A1)($gp)
    /* 42EC0 80052EC0 F02080A3 */  sb         $zero, %gp_rel(D_8011C870)($gp)
    /* 42EC4 80052EC4 A73A010C */  jal        delta_init__Fv
    /* 42EC8 80052EC8 00000000 */   nop
    /* 42ECC 80052ECC 1280023C */  lui        $v0, %hi(myplr)
    /* 42ED0 80052ED0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 42ED4 80052ED4 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 42ED8 80052ED8 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 42EDC 80052EDC C82080A3 */  sb         $zero, %gp_rel(D_8011C848)($gp)
    /* 42EE0 80052EE0 CC2080AF */  sw         $zero, %gp_rel(D_8011C84C)($gp)
    /* 42EE4 80052EE4 271280A3 */  sb         $zero, %gp_rel(gbSomebodyWonGameKludge)($gp)
    /* 42EE8 80052EE8 231290A3 */  sb         $s0, %gp_rel(gbActivePlayers)($gp)
    /* 42EEC 80052EEC 221290A3 */  sb         $s0, %gp_rel(gbMaxPlayers)($gp)
    /* 42EF0 80052EF0 251282A3 */  sb         $v0, %gp_rel(gbDeltaSender)($gp)
    /* 42EF4 80052EF4 07006010 */  beqz       $v1, .L80052F14
    /* 42EF8 80052EF8 01000224 */   addiu     $v0, $zero, 0x1
    /* 42EFC 80052EFC 1280013C */  lui        $at, %hi(myplr)
    /* 42F00 80052F00 08BA22AC */  sw         $v0, %lo(myplr)($at)
    /* 42F04 80052F04 02000224 */  addiu      $v0, $zero, 0x2
    /* 42F08 80052F08 221282A3 */  sb         $v0, %gp_rel(gbMaxPlayers)($gp)
    /* 42F0C 80052F0C 407F010C */  jal        SetupLocalPlayer__Fv
    /* 42F10 80052F10 00000000 */   nop
  .L80052F14:
    /* 42F14 80052F14 1280013C */  lui        $at, %hi(myplr)
    /* 42F18 80052F18 08BA20AC */  sw         $zero, %lo(myplr)($at)
    /* 42F1C 80052F1C 407F010C */  jal        SetupLocalPlayer__Fv
    /* 42F20 80052F20 00000000 */   nop
    /* 42F24 80052F24 1280023C */  lui        $v0, %hi(myplr)
    /* 42F28 80052F28 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 42F2C 80052F2C 00000000 */  nop
    /* 42F30 80052F30 40180200 */  sll        $v1, $v0, 1
    /* 42F34 80052F34 21186200 */  addu       $v1, $v1, $v0
    /* 42F38 80052F38 80180300 */  sll        $v1, $v1, 2
    /* 42F3C 80052F3C 21186200 */  addu       $v1, $v1, $v0
    /* 42F40 80052F40 00190300 */  sll        $v1, $v1, 4
    /* 42F44 80052F44 23186200 */  subu       $v1, $v1, $v0
    /* 42F48 80052F48 80180300 */  sll        $v1, $v1, 2
    /* 42F4C 80052F4C 21186200 */  addu       $v1, $v1, $v0
    /* 42F50 80052F50 C0180300 */  sll        $v1, $v1, 3
    /* 42F54 80052F54 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 42F58 80052F58 21082300 */  addu       $at, $at, $v1
    /* 42F5C 80052F5C 55A530A0 */  sb         $s0, %lo(plr + 0x1D)($at)
    /* 42F60 80052F60 074B010C */  jal        SetupLocalCoords__Fv
    /* 42F64 80052F64 00000000 */   nop
    /* 42F68 80052F68 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 42F6C 80052F6C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 42F70 80052F70 00000000 */  nop
    /* 42F74 80052F74 07004010 */  beqz       $v0, .L80052F94
    /* 42F78 80052F78 01000224 */   addiu     $v0, $zero, 0x1
    /* 42F7C 80052F7C 1280013C */  lui        $at, %hi(myplr)
    /* 42F80 80052F80 08BA22AC */  sw         $v0, %lo(myplr)($at)
    /* 42F84 80052F84 074B010C */  jal        SetupLocalCoords__Fv
    /* 42F88 80052F88 00000000 */   nop
    /* 42F8C 80052F8C 1280013C */  lui        $at, %hi(myplr)
    /* 42F90 80052F90 08BA20AC */  sw         $zero, %lo(myplr)($at)
  .L80052F94:
    /* 42F94 80052F94 EC208293 */  lbu        $v0, %gp_rel(D_8011C86C)($gp)
    /* 42F98 80052F98 E820848F */  lw         $a0, %gp_rel(D_8011C868)($gp)
    /* 42F9C 80052F9C 1280013C */  lui        $at, %hi(gnDifficulty)
    /* 42FA0 80052FA0 08C122AC */  sw         $v0, %lo(gnDifficulty)($at)
    /* 42FA4 80052FA4 B3F6000C */  jal        SetRndSeed__Fl
    /* 42FA8 80052FA8 00000000 */   nop
    /* 42FAC 80052FAC 3E10020C */  jal        VID_GetTick__Fv
    /* 42FB0 80052FB0 00000000 */   nop
    /* 42FB4 80052FB4 21204000 */  addu       $a0, $v0, $zero
    /* 42FB8 80052FB8 1A2F010C */  jal        veclen2__Fii
    /* 42FBC 80052FBC 21288000 */   addu      $a1, $a0, $zero
    /* 42FC0 80052FC0 00140200 */  sll        $v0, $v0, 16
    /* 42FC4 80052FC4 1280013C */  lui        $at, %hi(orgseed)
    /* 42FC8 80052FC8 58B822AC */  sw         $v0, %lo(orgseed)($at)
    /* 42FCC 80052FCC 3E10020C */  jal        VID_GetTick__Fv
    /* 42FD0 80052FD0 00000000 */   nop
    /* 42FD4 80052FD4 AAAA033C */  lui        $v1, (0xAAAAAAAB >> 16)
    /* 42FD8 80052FD8 ABAA6334 */  ori        $v1, $v1, (0xAAAAAAAB & 0xFFFF)
    /* 42FDC 80052FDC 19004300 */  multu      $v0, $v1
    /* 42FE0 80052FE0 1280023C */  lui        $v0, %hi(orgseed)
    /* 42FE4 80052FE4 58B8428C */  lw         $v0, %lo(orgseed)($v0)
    /* 42FE8 80052FE8 1280043C */  lui        $a0, %hi(cheat_quest_flag)
    /* 42FEC 80052FEC 4BAE8490 */  lbu        $a0, %lo(cheat_quest_flag)($a0)
    /* 42FF0 80052FF0 10380000 */  mfhi       $a3
    /* 42FF4 80052FF4 42180700 */  srl        $v1, $a3, 1
    /* 42FF8 80052FF8 25104300 */  or         $v0, $v0, $v1
    /* 42FFC 80052FFC 1280013C */  lui        $at, %hi(orgseed)
    /* 43000 80053000 58B822AC */  sw         $v0, %lo(orgseed)($at)
    /* 43004 80053004 03008010 */  beqz       $a0, .L80053014
    /* 43008 80053008 00000000 */   nop
    /* 4300C 8005300C 6D6E020C */  jal        SetQuest__Fv
    /* 43010 80053010 00000000 */   nop
  .L80053014:
    /* 43014 80053014 1280023C */  lui        $v0, %hi(OptionsSetSeed)
    /* 43018 80053018 58B2428C */  lw         $v0, %lo(OptionsSetSeed)($v0)
    /* 4301C 8005301C 00000000 */  nop
    /* 43020 80053020 05004010 */  beqz       $v0, .L80053038
    /* 43024 80053024 00000000 */   nop
    /* 43028 80053028 1280023C */  lui        $v0, %hi(OptionsSeed)
    /* 4302C 8005302C 54B2428C */  lw         $v0, %lo(OptionsSeed)($v0)
    /* 43030 80053030 1280013C */  lui        $at, %hi(orgseed)
    /* 43034 80053034 58B822AC */  sw         $v0, %lo(orgseed)($at)
  .L80053038:
    /* 43038 80053038 1280023C */  lui        $v0, %hi(demo_pad_time)
    /* 4303C 8005303C B4AB428C */  lw         $v0, %lo(demo_pad_time)($v0)
    /* 43040 80053040 00000000 */  nop
    /* 43044 80053044 04004010 */  beqz       $v0, .L80053058
    /* 43048 80053048 0500023C */   lui       $v0, (0x537F0 >> 16)
    /* 4304C 8005304C F0374234 */  ori        $v0, $v0, (0x537F0 & 0xFFFF)
    /* 43050 80053050 1280013C */  lui        $at, %hi(orgseed)
    /* 43054 80053054 58B822AC */  sw         $v0, %lo(orgseed)($at)
  .L80053058:
    /* 43058 80053058 1280043C */  lui        $a0, %hi(orgseed)
    /* 4305C 8005305C 58B8848C */  lw         $a0, %lo(orgseed)($a0)
    /* 43060 80053060 5F4B010C */  jal        InitNewSeed__Fl
    /* 43064 80053064 00000000 */   nop
    /* 43068 80053068 01000224 */  addiu      $v0, $zero, 0x1
    /* 4306C 8005306C BC00BF8F */  lw         $ra, 0xBC($sp)
    /* 43070 80053070 B800B08F */  lw         $s0, 0xB8($sp)
    /* 43074 80053074 C000BD27 */  addiu      $sp, $sp, 0xC0
    /* 43078 80053078 0800E003 */  jr         $ra
    /* 4307C 8005307C 00000000 */   nop
endlabel NetInit__FUcPUc
