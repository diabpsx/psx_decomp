.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShowProgress__FUi, 0x3D4

glabel ShowProgress__FUi
    /* 2DE40 8003DE40 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2DE44 8003DE44 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2DE48 8003DE48 21808000 */  addu       $s0, $a0, $zero
    /* 2DE4C 8003DE4C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2DE50 8003DE50 0955020C */  jal        OVR_LoadPregame__Fv
    /* 2DE54 8003DE54 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 2DE58 8003DE58 0480043C */  lui        $a0, %hi(DisableInputWndProc__FUlUilUl)
    /* 2DE5C 8003DE5C 94888424 */  addiu      $a0, $a0, %lo(DisableInputWndProc__FUlUilUl)
    /* 2DE60 8003DE60 1280013C */  lui        $at, %hi(gbSomebodyWonGameKludge)
    /* 2DE64 8003DE64 A7B920A0 */  sb         $zero, %lo(gbSomebodyWonGameKludge)($at)
    /* 2DE68 8003DE68 87EC010C */  jal        GRL_SetWindowProc__FPFUlUilUl_Ul
    /* 2DE6C 8003DE6C 00000000 */   nop
    /* 2DE70 8003DE70 8EF7000C */  jal        interface_msg_pump__Fv
    /* 2DE74 8003DE74 21884000 */   addu      $s1, $v0, $zero
    /* 2DE78 8003DE78 50F6000C */  jal        sound_init__Fv
    /* 2DE7C 8003DE7C 00000000 */   nop
    /* 2DE80 8003DE80 4A000224 */  addiu      $v0, $zero, 0x4A
    /* 2DE84 8003DE84 04000212 */  beq        $s0, $v0, .L8003DE98
    /* 2DE88 8003DE88 BEFF0426 */   addiu     $a0, $s0, -0x42
    /* 2DE8C 8003DE8C 753D010C */  jal        DeltaSaveLevel__Fv
    /* 2DE90 8003DE90 00000000 */   nop
    /* 2DE94 8003DE94 BEFF0426 */  addiu      $a0, $s0, -0x42
  .L8003DE98:
    /* 2DE98 8003DE98 0A00822C */  sltiu      $v0, $a0, 0xA
    /* 2DE9C 8003DE9C A2004010 */  beqz       $v0, .L8003E128
    /* 2DEA0 8003DEA0 80100400 */   sll       $v0, $a0, 2
    /* 2DEA4 8003DEA4 1180013C */  lui        $at, %hi(jtbl_8011137C)
    /* 2DEA8 8003DEA8 21082200 */  addu       $at, $at, $v0
    /* 2DEAC 8003DEAC 7C13228C */  lw         $v0, %lo(jtbl_8011137C)($at)
    /* 2DEB0 8003DEB0 00000000 */  nop
    /* 2DEB4 8003DEB4 08004000 */  jr         $v0
    /* 2DEB8 8003DEB8 00000000 */   nop
  jlabel .L8003DEBC
    /* 2DEBC 8003DEBC 1180043C */  lui        $a0, %hi(D_8011135C)
    /* 2DEC0 8003DEC0 5C138424 */  addiu      $a0, $a0, %lo(D_8011135C)
    /* 2DEC4 8003DEC4 C2E7000C */  jal        app_fatal
    /* 2DEC8 8003DEC8 00000000 */   nop
    /* 2DECC 8003DECC 4AF80008 */  j          .L8003E128
    /* 2DED0 8003DED0 00000000 */   nop
  jlabel .L8003DED4
    /* 2DED4 8003DED4 EBDF000C */  jal        FreeGameMem__Fv
    /* 2DED8 8003DED8 00000000 */   nop
    /* 2DEDC 8003DEDC 01000424 */  addiu      $a0, $zero, 0x1
    /* 2DEE0 8003DEE0 48F80008 */  j          .L8003E120
    /* 2DEE4 8003DEE4 21280000 */   addu      $a1, $zero, $zero
  jlabel .L8003DEE8
    /* 2DEE8 8003DEE8 EBDF000C */  jal        FreeGameMem__Fv
    /* 2DEEC 8003DEEC 00000000 */   nop
    /* 2DEF0 8003DEF0 1280023C */  lui        $v0, %hi(currlevel)
    /* 2DEF4 8003DEF4 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 2DEF8 8003DEF8 21200000 */  addu       $a0, $zero, $zero
    /* 2DEFC 8003DEFC 01004224 */  addiu      $v0, $v0, 0x1
    /* 2DF00 8003DF00 FF004330 */  andi       $v1, $v0, 0xFF
    /* 2DF04 8003DF04 80180300 */  sll        $v1, $v1, 2
    /* 2DF08 8003DF08 0D80013C */  lui        $at, %hi(gnLevelTypeTbl)
    /* 2DF0C 8003DF0C 21082300 */  addu       $at, $at, $v1
    /* 2DF10 8003DF10 A0F7238C */  lw         $v1, %lo(gnLevelTypeTbl)($at)
    /* 2DF14 8003DF14 1280013C */  lui        $at, %hi(currlevel)
    /* 2DF18 8003DF18 0CC122A0 */  sb         $v0, %lo(currlevel)($at)
    /* 2DF1C 8003DF1C 1280013C */  lui        $at, %hi(leveltype)
    /* 2DF20 8003DF20 0DC123A0 */  sb         $v1, %lo(leveltype)($at)
    /* 2DF24 8003DF24 48F80008 */  j          .L8003E120
    /* 2DF28 8003DF28 21280000 */   addu      $a1, $zero, $zero
  jlabel .L8003DF2C
    /* 2DF2C 8003DF2C EBDF000C */  jal        FreeGameMem__Fv
    /* 2DF30 8003DF30 00000000 */   nop
    /* 2DF34 8003DF34 1280023C */  lui        $v0, %hi(currlevel)
    /* 2DF38 8003DF38 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 2DF3C 8003DF3C 21200000 */  addu       $a0, $zero, $zero
    /* 2DF40 8003DF40 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 2DF44 8003DF44 FF004330 */  andi       $v1, $v0, 0xFF
    /* 2DF48 8003DF48 80180300 */  sll        $v1, $v1, 2
    /* 2DF4C 8003DF4C 0D80013C */  lui        $at, %hi(gnLevelTypeTbl)
    /* 2DF50 8003DF50 21082300 */  addu       $at, $at, $v1
    /* 2DF54 8003DF54 A0F7238C */  lw         $v1, %lo(gnLevelTypeTbl)($at)
    /* 2DF58 8003DF58 1280013C */  lui        $at, %hi(currlevel)
    /* 2DF5C 8003DF5C 0CC122A0 */  sb         $v0, %lo(currlevel)($at)
    /* 2DF60 8003DF60 1280013C */  lui        $at, %hi(leveltype)
    /* 2DF64 8003DF64 0DC123A0 */  sb         $v1, %lo(leveltype)($at)
    /* 2DF68 8003DF68 48F80008 */  j          .L8003E120
    /* 2DF6C 8003DF6C 01000524 */   addiu     $a1, $zero, 0x1
  jlabel .L8003DF70
    /* 2DF70 8003DF70 73A0010C */  jal        SetReturnLvlPos__Fv
    /* 2DF74 8003DF74 00000000 */   nop
    /* 2DF78 8003DF78 1280033C */  lui        $v1, %hi(setlvltype)
    /* 2DF7C 8003DF7C 10C16390 */  lbu        $v1, %lo(setlvltype)($v1)
    /* 2DF80 8003DF80 01000224 */  addiu      $v0, $zero, 0x1
    /* 2DF84 8003DF84 1280013C */  lui        $at, %hi(setlevel)
    /* 2DF88 8003DF88 0EC122A0 */  sb         $v0, %lo(setlevel)($at)
    /* 2DF8C 8003DF8C 1280013C */  lui        $at, %hi(leveltype)
    /* 2DF90 8003DF90 0DC123A0 */  sb         $v1, %lo(leveltype)($at)
    /* 2DF94 8003DF94 EBDF000C */  jal        FreeGameMem__Fv
    /* 2DF98 8003DF98 00000000 */   nop
    /* 2DF9C 8003DF9C 21200000 */  addu       $a0, $zero, $zero
    /* 2DFA0 8003DFA0 48F80008 */  j          .L8003E120
    /* 2DFA4 8003DFA4 02000524 */   addiu     $a1, $zero, 0x2
  jlabel .L8003DFA8
    /* 2DFA8 8003DFA8 1280013C */  lui        $at, %hi(setlevel)
    /* 2DFAC 8003DFAC 0EC120A0 */  sb         $zero, %lo(setlevel)($at)
    /* 2DFB0 8003DFB0 EBDF000C */  jal        FreeGameMem__Fv
    /* 2DFB4 8003DFB4 00000000 */   nop
    /* 2DFB8 8003DFB8 B7A0010C */  jal        GetReturnLvlPos__Fv
    /* 2DFBC 8003DFBC 00000000 */   nop
    /* 2DFC0 8003DFC0 21200000 */  addu       $a0, $zero, $zero
    /* 2DFC4 8003DFC4 48F80008 */  j          .L8003E120
    /* 2DFC8 8003DFC8 03000524 */   addiu     $a1, $zero, 0x3
  jlabel .L8003DFCC
    /* 2DFCC 8003DFCC EBDF000C */  jal        FreeGameMem__Fv
    /* 2DFD0 8003DFD0 00000000 */   nop
    /* 2DFD4 8003DFD4 FC04020C */  jal        GetPortalLevel__Fv
    /* 2DFD8 8003DFD8 00000000 */   nop
    /* 2DFDC 8003DFDC 21200000 */  addu       $a0, $zero, $zero
    /* 2DFE0 8003DFE0 48F80008 */  j          .L8003E120
    /* 2DFE4 8003DFE4 05000524 */   addiu     $a1, $zero, 0x5
  jlabel .L8003DFE8
    /* 2DFE8 8003DFE8 EBDF000C */  jal        FreeGameMem__Fv
    /* 2DFEC 8003DFEC 00000000 */   nop
    /* 2DFF0 8003DFF0 1280033C */  lui        $v1, %hi(myplr)
    /* 2DFF4 8003DFF4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2DFF8 8003DFF8 00000000 */  nop
    /* 2DFFC 8003DFFC 40100300 */  sll        $v0, $v1, 1
    /* 2E000 8003E000 21104300 */  addu       $v0, $v0, $v1
    /* 2E004 8003E004 80100200 */  sll        $v0, $v0, 2
    /* 2E008 8003E008 21104300 */  addu       $v0, $v0, $v1
    /* 2E00C 8003E00C 00110200 */  sll        $v0, $v0, 4
    /* 2E010 8003E010 23104300 */  subu       $v0, $v0, $v1
    /* 2E014 8003E014 80100200 */  sll        $v0, $v0, 2
    /* 2E018 8003E018 21104300 */  addu       $v0, $v0, $v1
    /* 2E01C 8003E01C C0100200 */  sll        $v0, $v0, 3
    /* 2E020 8003E020 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 2E024 8003E024 21082200 */  addu       $at, $at, $v0
    /* 2E028 8003E028 5CA5238C */  lw         $v1, %lo(plr + 0x24)($at)
    /* 2E02C 8003E02C 21200000 */  addu       $a0, $zero, $zero
    /* 2E030 8003E030 FF006230 */  andi       $v0, $v1, 0xFF
    /* 2E034 8003E034 80100200 */  sll        $v0, $v0, 2
    /* 2E038 8003E038 0D80013C */  lui        $at, %hi(gnLevelTypeTbl)
    /* 2E03C 8003E03C 21082200 */  addu       $at, $at, $v0
    /* 2E040 8003E040 A0F7228C */  lw         $v0, %lo(gnLevelTypeTbl)($at)
    /* 2E044 8003E044 44F80008 */  j          .L8003E110
    /* 2E048 8003E048 06000524 */   addiu     $a1, $zero, 0x6
  jlabel .L8003E04C
    /* 2E04C 8003E04C EBDF000C */  jal        FreeGameMem__Fv
    /* 2E050 8003E050 00000000 */   nop
    /* 2E054 8003E054 1280033C */  lui        $v1, %hi(myplr)
    /* 2E058 8003E058 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2E05C 8003E05C 00000000 */  nop
    /* 2E060 8003E060 40100300 */  sll        $v0, $v1, 1
    /* 2E064 8003E064 21104300 */  addu       $v0, $v0, $v1
    /* 2E068 8003E068 80100200 */  sll        $v0, $v0, 2
    /* 2E06C 8003E06C 21104300 */  addu       $v0, $v0, $v1
    /* 2E070 8003E070 00110200 */  sll        $v0, $v0, 4
    /* 2E074 8003E074 23104300 */  subu       $v0, $v0, $v1
    /* 2E078 8003E078 80100200 */  sll        $v0, $v0, 2
    /* 2E07C 8003E07C 21104300 */  addu       $v0, $v0, $v1
    /* 2E080 8003E080 C0100200 */  sll        $v0, $v0, 3
    /* 2E084 8003E084 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 2E088 8003E088 21082200 */  addu       $at, $at, $v0
    /* 2E08C 8003E08C 5CA5238C */  lw         $v1, %lo(plr + 0x24)($at)
    /* 2E090 8003E090 21200000 */  addu       $a0, $zero, $zero
    /* 2E094 8003E094 FF006230 */  andi       $v0, $v1, 0xFF
    /* 2E098 8003E098 80100200 */  sll        $v0, $v0, 2
    /* 2E09C 8003E09C 0D80013C */  lui        $at, %hi(gnLevelTypeTbl)
    /* 2E0A0 8003E0A0 21082200 */  addu       $at, $at, $v0
    /* 2E0A4 8003E0A4 A0F7228C */  lw         $v0, %lo(gnLevelTypeTbl)($at)
    /* 2E0A8 8003E0A8 44F80008 */  j          .L8003E110
    /* 2E0AC 8003E0AC 07000524 */   addiu     $a1, $zero, 0x7
  jlabel .L8003E0B0
    /* 2E0B0 8003E0B0 EBDF000C */  jal        FreeGameMem__Fv
    /* 2E0B4 8003E0B4 00000000 */   nop
    /* 2E0B8 8003E0B8 1280033C */  lui        $v1, %hi(myplr)
    /* 2E0BC 8003E0BC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2E0C0 8003E0C0 00000000 */  nop
    /* 2E0C4 8003E0C4 40100300 */  sll        $v0, $v1, 1
    /* 2E0C8 8003E0C8 21104300 */  addu       $v0, $v0, $v1
    /* 2E0CC 8003E0CC 80100200 */  sll        $v0, $v0, 2
    /* 2E0D0 8003E0D0 21104300 */  addu       $v0, $v0, $v1
    /* 2E0D4 8003E0D4 00110200 */  sll        $v0, $v0, 4
    /* 2E0D8 8003E0D8 23104300 */  subu       $v0, $v0, $v1
    /* 2E0DC 8003E0DC 80100200 */  sll        $v0, $v0, 2
    /* 2E0E0 8003E0E0 21104300 */  addu       $v0, $v0, $v1
    /* 2E0E4 8003E0E4 C0100200 */  sll        $v0, $v0, 3
    /* 2E0E8 8003E0E8 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 2E0EC 8003E0EC 21082200 */  addu       $at, $at, $v0
    /* 2E0F0 8003E0F0 5CA5238C */  lw         $v1, %lo(plr + 0x24)($at)
    /* 2E0F4 8003E0F4 21200000 */  addu       $a0, $zero, $zero
    /* 2E0F8 8003E0F8 FF006230 */  andi       $v0, $v1, 0xFF
    /* 2E0FC 8003E0FC 80100200 */  sll        $v0, $v0, 2
    /* 2E100 8003E100 0D80013C */  lui        $at, %hi(gnLevelTypeTbl)
    /* 2E104 8003E104 21082200 */  addu       $at, $at, $v0
    /* 2E108 8003E108 A0F7228C */  lw         $v0, %lo(gnLevelTypeTbl)($at)
    /* 2E10C 8003E10C 21280000 */  addu       $a1, $zero, $zero
  .L8003E110:
    /* 2E110 8003E110 1280013C */  lui        $at, %hi(currlevel)
    /* 2E114 8003E114 0CC123A0 */  sb         $v1, %lo(currlevel)($at)
    /* 2E118 8003E118 1280013C */  lui        $at, %hi(leveltype)
    /* 2E11C 8003E11C 0DC122A0 */  sb         $v0, %lo(leveltype)($at)
  .L8003E120:
    /* 2E120 8003E120 9CE4000C */  jal        LoadGameLevel__FUci
    /* 2E124 8003E124 00000000 */   nop
  .L8003E128:
    /* 2E128 8003E128 1D55020C */  jal        OVR_LoadGame__Fv
    /* 2E12C 8003E12C 00000000 */   nop
    /* 2E130 8003E130 FA03020C */  jal        SyncPortals__Fv
    /* 2E134 8003E134 00000000 */   nop
    /* 2E138 8003E138 87EC010C */  jal        GRL_SetWindowProc__FPFUlUilUl_Ul
    /* 2E13C 8003E13C 21202002 */   addu      $a0, $s1, $zero
    /* 2E140 8003E140 1280033C */  lui        $v1, %hi(myplr)
    /* 2E144 8003E144 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2E148 8003E148 01000424 */  addiu      $a0, $zero, 0x1
    /* 2E14C 8003E14C 40100300 */  sll        $v0, $v1, 1
    /* 2E150 8003E150 21104300 */  addu       $v0, $v0, $v1
    /* 2E154 8003E154 80100200 */  sll        $v0, $v0, 2
    /* 2E158 8003E158 21104300 */  addu       $v0, $v0, $v1
    /* 2E15C 8003E15C 00110200 */  sll        $v0, $v0, 4
    /* 2E160 8003E160 23104300 */  subu       $v0, $v0, $v1
    /* 2E164 8003E164 80100200 */  sll        $v0, $v0, 2
    /* 2E168 8003E168 21104300 */  addu       $v0, $v0, $v1
    /* 2E16C 8003E16C C0100200 */  sll        $v0, $v0, 3
    /* 2E170 8003E170 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 2E174 8003E174 21082200 */  addu       $at, $at, $v0
    /* 2E178 8003E178 68A52690 */  lbu        $a2, %lo(plr + 0x30)($at)
    /* 2E17C 8003E17C 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 2E180 8003E180 21082200 */  addu       $at, $at, $v0
    /* 2E184 8003E184 6AA52790 */  lbu        $a3, %lo(plr + 0x32)($at)
    /* 2E188 8003E188 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 2E18C 8003E18C 21082200 */  addu       $at, $at, $v0
    /* 2E190 8003E190 5CA52294 */  lhu        $v0, %lo(plr + 0x24)($at)
    /* 2E194 8003E194 35000524 */  addiu      $a1, $zero, 0x35
    /* 2E198 8003E198 DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 2E19C 8003E19C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 2E1A0 8003E1A0 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 2E1A4 8003E1A4 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 2E1A8 8003E1A8 00000000 */  nop
    /* 2E1AC 8003E1AC 0F004010 */  beqz       $v0, .L8003E1EC
    /* 2E1B0 8003E1B0 01000424 */   addiu     $a0, $zero, 0x1
    /* 2E1B4 8003E1B4 0E80063C */  lui        $a2, %hi(plr + 0x1A18)
    /* 2E1B8 8003E1B8 50BFC690 */  lbu        $a2, %lo(plr + 0x1A18)($a2)
    /* 2E1BC 8003E1BC 0E80073C */  lui        $a3, %hi(plr + 0x1A1A)
    /* 2E1C0 8003E1C0 52BFE790 */  lbu        $a3, %lo(plr + 0x1A1A)($a3)
    /* 2E1C4 8003E1C4 01000224 */  addiu      $v0, $zero, 0x1
    /* 2E1C8 8003E1C8 1280013C */  lui        $at, %hi(myplr)
    /* 2E1CC 8003E1CC 08BA22AC */  sw         $v0, %lo(myplr)($at)
    /* 2E1D0 8003E1D0 0E80023C */  lui        $v0, %hi(plr + 0x1A0C)
    /* 2E1D4 8003E1D4 44BF4294 */  lhu        $v0, %lo(plr + 0x1A0C)($v0)
    /* 2E1D8 8003E1D8 35000524 */  addiu      $a1, $zero, 0x35
    /* 2E1DC 8003E1DC DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 2E1E0 8003E1E0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 2E1E4 8003E1E4 1280013C */  lui        $at, %hi(myplr)
    /* 2E1E8 8003E1E8 08BA20AC */  sw         $zero, %lo(myplr)($at)
  .L8003E1EC:
    /* 2E1EC 8003E1EC 9DFB010C */  jal        ResetPal__Fv
    /* 2E1F0 8003E1F0 00000000 */   nop
    /* 2E1F4 8003E1F4 1280013C */  lui        $at, %hi(gbSomebodyWonGameKludge)
    /* 2E1F8 8003E1F8 A7B920A0 */  sb         $zero, %lo(gbSomebodyWonGameKludge)($at)
    /* 2E1FC 8003E1FC 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2E200 8003E200 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2E204 8003E204 1800B08F */  lw         $s0, 0x18($sp)
    /* 2E208 8003E208 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2E20C 8003E20C 0800E003 */  jr         $ra
    /* 2E210 8003E210 00000000 */   nop
endlabel ShowProgress__FUi
