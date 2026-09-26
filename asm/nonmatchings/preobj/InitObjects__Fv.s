.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitObjects__Fv, 0x6A0

glabel InitObjects__Fv
    /* 1F9DC 801595D4 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1F9E0 801595D8 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 1F9E4 801595DC 21880000 */  addu       $s1, $zero, $zero
    /* 1F9E8 801595E0 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1F9EC 801595E4 4A5F050C */  jal        ClrAllObjects__Fv
    /* 1F9F0 801595E8 2800B0AF */   sw        $s0, 0x28($sp)
    /* 1F9F4 801595EC 1280033C */  lui        $v1, %hi(currlevel)
    /* 1F9F8 801595F0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1F9FC 801595F4 10000224 */  addiu      $v0, $zero, 0x10
    /* 1FA00 801595F8 05006214 */  bne        $v1, $v0, .L80159610
    /* 1FA04 801595FC 00000000 */   nop
    /* 1FA08 80159600 7763050C */  jal        AddDiabObjs__Fv
    /* 1FA0C 80159604 00000000 */   nop
    /* 1FA10 80159608 17670508 */  j          .L80159C5C
    /* 1FA14 8015960C 00000000 */   nop
  .L80159610:
    /* 1FA18 80159610 2A65050C */  jal        saveplrpos__Fv
    /* 1FA1C 80159614 00000000 */   nop
    /* 1FA20 80159618 01000224 */  addiu      $v0, $zero, 0x1
    /* 1FA24 8015961C 1280013C */  lui        $at, %hi(InitObjFlag)
    /* 1FA28 80159620 D0B922A0 */  sb         $v0, %lo(InitObjFlag)($at)
    /* 1FA2C 80159624 B7F6000C */  jal        GetRndSeed__Fv
    /* 1FA30 80159628 00000000 */   nop
    /* 1FA34 8015962C 1280033C */  lui        $v1, %hi(currlevel)
    /* 1FA38 80159630 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1FA3C 80159634 09000224 */  addiu      $v0, $zero, 0x9
    /* 1FA40 80159638 08006214 */  bne        $v1, $v0, .L8015965C
    /* 1FA44 8015963C 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FA48 80159640 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 1FA4C 80159644 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 1FA50 80159648 00000000 */  nop
    /* 1FA54 8015964C 03006214 */  bne        $v1, $v0, .L8015965C
    /* 1FA58 80159650 00000000 */   nop
    /* 1FA5C 80159654 205D050C */  jal        AddSlainHero__Fv
    /* 1FA60 80159658 00000000 */   nop
  .L8015965C:
    /* 1FA64 8015965C DC9E010C */  jal        QuestStatus__Fi
    /* 1FA68 80159660 01000424 */   addiu     $a0, $zero, 0x1
    /* 1FA6C 80159664 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FA70 80159668 0F004010 */  beqz       $v0, .L801596A8
    /* 1FA74 8015966C 00000000 */   nop
    /* 1FA78 80159670 1280033C */  lui        $v1, %hi(currlevel)
    /* 1FA7C 80159674 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1FA80 80159678 0E80023C */  lui        $v0, %hi(quests + 0x14)
    /* 1FA84 8015967C 54DA4290 */  lbu        $v0, %lo(quests + 0x14)($v0)
    /* 1FA88 80159680 00000000 */  nop
    /* 1FA8C 80159684 0B006214 */  bne        $v1, $v0, .L801596B4
    /* 1FA90 80159688 04000224 */   addiu     $v0, $zero, 0x4
    /* 1FA94 8015968C 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 1FA98 80159690 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 1FA9C 80159694 02000224 */  addiu      $v0, $zero, 0x2
    /* 1FAA0 80159698 03006210 */  beq        $v1, $v0, .L801596A8
    /* 1FAA4 8015969C 00000000 */   nop
    /* 1FAA8 801596A0 E35C050C */  jal        AddMushPatch__Fv
    /* 1FAAC 801596A4 00000000 */   nop
  .L801596A8:
    /* 1FAB0 801596A8 1280033C */  lui        $v1, %hi(currlevel)
    /* 1FAB4 801596AC 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1FAB8 801596B0 04000224 */  addiu      $v0, $zero, 0x4
  .L801596B4:
    /* 1FABC 801596B4 03006214 */  bne        $v1, $v0, .L801596C4
    /* 1FAC0 801596B8 00000000 */   nop
    /* 1FAC4 801596BC CC63050C */  jal        AddStoryBooks__Fv
    /* 1FAC8 801596C0 00000000 */   nop
  .L801596C4:
    /* 1FACC 801596C4 1280033C */  lui        $v1, %hi(currlevel)
    /* 1FAD0 801596C8 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1FAD4 801596CC 08000224 */  addiu      $v0, $zero, 0x8
    /* 1FAD8 801596D0 06006214 */  bne        $v1, $v0, .L801596EC
    /* 1FADC 801596D4 0C000224 */   addiu     $v0, $zero, 0xC
    /* 1FAE0 801596D8 CC63050C */  jal        AddStoryBooks__Fv
    /* 1FAE4 801596DC 00000000 */   nop
    /* 1FAE8 801596E0 1280033C */  lui        $v1, %hi(currlevel)
    /* 1FAEC 801596E4 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1FAF0 801596E8 0C000224 */  addiu      $v0, $zero, 0xC
  .L801596EC:
    /* 1FAF4 801596EC 03006214 */  bne        $v1, $v0, .L801596FC
    /* 1FAF8 801596F0 00000000 */   nop
    /* 1FAFC 801596F4 CC63050C */  jal        AddStoryBooks__Fv
    /* 1FB00 801596F8 00000000 */   nop
  .L801596FC:
    /* 1FB04 801596FC 1280033C */  lui        $v1, %hi(leveltype)
    /* 1FB08 80159700 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 1FB0C 80159704 01000224 */  addiu      $v0, $zero, 0x1
    /* 1FB10 80159708 28006214 */  bne        $v1, $v0, .L801597AC
    /* 1FB14 8015970C 00000000 */   nop
    /* 1FB18 80159710 DC9E010C */  jal        QuestStatus__Fi
    /* 1FB1C 80159714 06000424 */   addiu     $a0, $zero, 0x6
    /* 1FB20 80159718 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FB24 8015971C 03004010 */  beqz       $v0, .L8015972C
    /* 1FB28 80159720 00000000 */   nop
    /* 1FB2C 80159724 865F050C */  jal        AddTortures__Fv
    /* 1FB30 80159728 00000000 */   nop
  .L8015972C:
    /* 1FB34 8015972C DC9E010C */  jal        QuestStatus__Fi
    /* 1FB38 80159730 0D000424 */   addiu     $a0, $zero, 0xD
    /* 1FB3C 80159734 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FB40 80159738 03004010 */  beqz       $v0, .L80159748
    /* 1FB44 8015973C 00000000 */   nop
    /* 1FB48 80159740 E65F050C */  jal        AddCandles__Fv
    /* 1FB4C 80159744 00000000 */   nop
  .L80159748:
    /* 1FB50 80159748 DC9E010C */  jal        QuestStatus__Fi
    /* 1FB54 8015974C 07000424 */   addiu     $a0, $zero, 0x7
    /* 1FB58 80159750 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FB5C 80159754 0A004010 */  beqz       $v0, .L80159780
    /* 1FB60 80159758 61000424 */   addiu     $a0, $zero, 0x61
    /* 1FB64 8015975C 1280053C */  lui        $a1, %hi(setpc_x)
    /* 1FB68 80159760 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 1FB6C 80159764 1280063C */  lui        $a2, %hi(setpc_y)
    /* 1FB70 80159768 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 1FB74 8015976C 40280500 */  sll        $a1, $a1, 1
    /* 1FB78 80159770 1A00A524 */  addiu      $a1, $a1, 0x1A
    /* 1FB7C 80159774 40300600 */  sll        $a2, $a2, 1
    /* 1FB80 80159778 BE4E010C */  jal        AddObject__Fiii
    /* 1FB84 8015977C 1300C624 */   addiu     $a2, $a2, 0x13
  .L80159780:
    /* 1FB88 80159780 0A000424 */  addiu      $a0, $zero, 0xA
    /* 1FB8C 80159784 0F000524 */  addiu      $a1, $zero, 0xF
    /* 1FB90 80159788 EB5D050C */  jal        InitRndLocBigObj__Fiii
    /* 1FB94 8015978C 30000624 */   addiu     $a2, $zero, 0x30
    /* 1FB98 80159790 21200000 */  addu       $a0, $zero, $zero
    /* 1FB9C 80159794 21280000 */  addu       $a1, $zero, $zero
    /* 1FBA0 80159798 60000624 */  addiu      $a2, $zero, 0x60
    /* 1FBA4 8015979C E860050C */  jal        AddL1Objs__Fiiii
    /* 1FBA8 801597A0 60000724 */   addiu     $a3, $zero, 0x60
    /* 1FBAC 801597A4 8560050C */  jal        InitRndBarrels__Fv
    /* 1FBB0 801597A8 00000000 */   nop
  .L801597AC:
    /* 1FBB4 801597AC 1280103C */  lui        $s0, %hi(leveltype)
    /* 1FBB8 801597B0 0DC11092 */  lbu        $s0, %lo(leveltype)($s0)
    /* 1FBBC 801597B4 02000224 */  addiu      $v0, $zero, 0x2
    /* 1FBC0 801597B8 A3000216 */  bne        $s0, $v0, .L80159A48
    /* 1FBC4 801597BC 00000000 */   nop
    /* 1FBC8 801597C0 DC9E010C */  jal        QuestStatus__Fi
    /* 1FBCC 801597C4 21200000 */   addu      $a0, $zero, $zero
    /* 1FBD0 801597C8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FBD4 801597CC 09004010 */  beqz       $v0, .L801597F4
    /* 1FBD8 801597D0 00000000 */   nop
    /* 1FBDC 801597D4 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 1FBE0 801597D8 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 1FBE4 801597DC 00000000 */  nop
    /* 1FBE8 801597E0 04005010 */  beq        $v0, $s0, .L801597F4
    /* 1FBEC 801597E4 01000424 */   addiu     $a0, $zero, 0x1
    /* 1FBF0 801597E8 01000524 */  addiu      $a1, $zero, 0x1
    /* 1FBF4 801597EC 5B5E050C */  jal        InitRndLocObj5x5__Fiii
    /* 1FBF8 801597F0 17000624 */   addiu     $a2, $zero, 0x17
  .L801597F4:
    /* 1FBFC 801597F4 DC9E010C */  jal        QuestStatus__Fi
    /* 1FC00 801597F8 0E000424 */   addiu     $a0, $zero, 0xE
    /* 1FC04 801597FC FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FC08 80159800 04004010 */  beqz       $v0, .L80159814
    /* 1FC0C 80159804 01000524 */   addiu     $a1, $zero, 0x1
    /* 1FC10 80159808 01000424 */  addiu      $a0, $zero, 0x1
    /* 1FC14 8015980C 5B5E050C */  jal        InitRndLocObj5x5__Fiii
    /* 1FC18 80159810 29000624 */   addiu     $a2, $zero, 0x29
  .L80159814:
    /* 1FC1C 80159814 21200000 */  addu       $a0, $zero, $zero
    /* 1FC20 80159818 21280000 */  addu       $a1, $zero, $zero
    /* 1FC24 8015981C 60000624 */  addiu      $a2, $zero, 0x60
    /* 1FC28 80159820 2B61050C */  jal        AddL2Objs__Fiiii
    /* 1FC2C 80159824 60000724 */   addiu     $a3, $zero, 0x60
    /* 1FC30 80159828 C461050C */  jal        AddL2Torches__Fv
    /* 1FC34 8015982C 00000000 */   nop
    /* 1FC38 80159830 DC9E010C */  jal        QuestStatus__Fi
    /* 1FC3C 80159834 08000424 */   addiu     $a0, $zero, 0x8
    /* 1FC40 80159838 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FC44 8015983C 43004010 */  beqz       $v0, .L8015994C
    /* 1FC48 80159840 00000000 */   nop
    /* 1FC4C 80159844 1280033C */  lui        $v1, %hi(myplr)
    /* 1FC50 80159848 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 1FC54 8015984C 00000000 */  nop
    /* 1FC58 80159850 40100300 */  sll        $v0, $v1, 1
    /* 1FC5C 80159854 21104300 */  addu       $v0, $v0, $v1
    /* 1FC60 80159858 80100200 */  sll        $v0, $v0, 2
    /* 1FC64 8015985C 21104300 */  addu       $v0, $v0, $v1
    /* 1FC68 80159860 00110200 */  sll        $v0, $v0, 4
    /* 1FC6C 80159864 23104300 */  subu       $v0, $v0, $v1
    /* 1FC70 80159868 80100200 */  sll        $v0, $v0, 2
    /* 1FC74 8015986C 21104300 */  addu       $v0, $v0, $v1
    /* 1FC78 80159870 C0100200 */  sll        $v0, $v0, 3
    /* 1FC7C 80159874 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 1FC80 80159878 21082200 */  addu       $at, $at, $v0
    /* 1FC84 8015987C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 1FC88 80159880 00000000 */  nop
    /* 1FC8C 80159884 03006014 */  bnez       $v1, .L80159894
    /* 1FC90 80159888 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FC94 8015988C 2C660508 */  j          .L801598B0
    /* 1FC98 80159890 ED001124 */   addiu     $s1, $zero, 0xED
  .L80159894:
    /* 1FC9C 80159894 03006214 */  bne        $v1, $v0, .L801598A4
    /* 1FCA0 80159898 02000224 */   addiu     $v0, $zero, 0x2
    /* 1FCA4 8015989C 2C660508 */  j          .L801598B0
    /* 1FCA8 801598A0 F5001124 */   addiu     $s1, $zero, 0xF5
  .L801598A4:
    /* 1FCAC 801598A4 02006214 */  bne        $v1, $v0, .L801598B0
    /* 1FCB0 801598A8 00000000 */   nop
    /* 1FCB4 801598AC F1001124 */  addiu      $s1, $zero, 0xF1
  .L801598B0:
    /* 1FCB8 801598B0 21200000 */  addu       $a0, $zero, $zero
    /* 1FCBC 801598B4 21280000 */  addu       $a1, $zero, $zero
    /* 1FCC0 801598B8 60000624 */  addiu      $a2, $zero, 0x60
    /* 1FCC4 801598BC 1280023C */  lui        $v0, %hi(setpc_x)
    /* 1FCC8 801598C0 E4C0428C */  lw         $v0, %lo(setpc_x)($v0)
    /* 1FCCC 801598C4 1280033C */  lui        $v1, %hi(setpc_y)
    /* 1FCD0 801598C8 E8C0638C */  lw         $v1, %lo(setpc_y)($v1)
    /* 1FCD4 801598CC 1280083C */  lui        $t0, %hi(setpc_w)
    /* 1FCD8 801598D0 ECC0088D */  lw         $t0, %lo(setpc_w)($t0)
    /* 1FCDC 801598D4 60000724 */  addiu      $a3, $zero, 0x60
    /* 1FCE0 801598D8 0E80013C */  lui        $at, %hi(quests + 0xAE)
    /* 1FCE4 801598DC EEDA31A0 */  sb         $s1, %lo(quests + 0xAE)($at)
    /* 1FCE8 801598E0 2000B1AF */  sw         $s1, 0x20($sp)
    /* 1FCEC 801598E4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1FCF0 801598E8 21104800 */  addu       $v0, $v0, $t0
    /* 1FCF4 801598EC 1280083C */  lui        $t0, %hi(setpc_h)
    /* 1FCF8 801598F0 F0C0088D */  lw         $t0, %lo(setpc_h)($t0)
    /* 1FCFC 801598F4 01004224 */  addiu      $v0, $v0, 0x1
    /* 1FD00 801598F8 1400A3AF */  sw         $v1, 0x14($sp)
    /* 1FD04 801598FC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 1FD08 80159900 21186800 */  addu       $v1, $v1, $t0
    /* 1FD0C 80159904 01006324 */  addiu      $v1, $v1, 0x1
    /* 1FD10 80159908 0860050C */  jal        AddBookLever__Fiiiiiiiii
    /* 1FD14 8015990C 1C00A3AF */   sw        $v1, 0x1C($sp)
    /* 1FD18 80159910 1280043C */  lui        $a0, %hi(D_801197E0)
    /* 1FD1C 80159914 E0978424 */  addiu      $a0, $a0, %lo(D_801197E0)
    /* 1FD20 80159918 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 1FD24 8015991C 21280000 */   addu      $a1, $zero, $zero
    /* 1FD28 80159920 21804000 */  addu       $s0, $v0, $zero
    /* 1FD2C 80159924 21200002 */  addu       $a0, $s0, $zero
    /* 1FD30 80159928 1280053C */  lui        $a1, %hi(setpc_x)
    /* 1FD34 8015992C E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 1FD38 80159930 1280063C */  lui        $a2, %hi(setpc_y)
    /* 1FD3C 80159934 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 1FD40 80159938 40280500 */  sll        $a1, $a1, 1
    /* 1FD44 8015993C 0367010C */  jal        LoadMapObjs__FPUcii
    /* 1FD48 80159940 40300600 */   sll       $a2, $a2, 1
    /* 1FD4C 80159944 F7F6000C */  jal        mem_free_dbg__FPv
    /* 1FD50 80159948 21200002 */   addu      $a0, $s0, $zero
  .L8015994C:
    /* 1FD54 8015994C DC9E010C */  jal        QuestStatus__Fi
    /* 1FD58 80159950 09000424 */   addiu     $a0, $zero, 0x9
    /* 1FD5C 80159954 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FD60 80159958 39004010 */  beqz       $v0, .L80159A40
    /* 1FD64 8015995C 00000000 */   nop
    /* 1FD68 80159960 1280033C */  lui        $v1, %hi(myplr)
    /* 1FD6C 80159964 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 1FD70 80159968 00000000 */  nop
    /* 1FD74 8015996C 40100300 */  sll        $v0, $v1, 1
    /* 1FD78 80159970 21104300 */  addu       $v0, $v0, $v1
    /* 1FD7C 80159974 80100200 */  sll        $v0, $v0, 2
    /* 1FD80 80159978 21104300 */  addu       $v0, $v0, $v1
    /* 1FD84 8015997C 00110200 */  sll        $v0, $v0, 4
    /* 1FD88 80159980 23104300 */  subu       $v0, $v0, $v1
    /* 1FD8C 80159984 80100200 */  sll        $v0, $v0, 2
    /* 1FD90 80159988 21104300 */  addu       $v0, $v0, $v1
    /* 1FD94 8015998C C0100200 */  sll        $v0, $v0, 3
    /* 1FD98 80159990 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 1FD9C 80159994 21082200 */  addu       $at, $at, $v0
    /* 1FDA0 80159998 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 1FDA4 8015999C 00000000 */  nop
    /* 1FDA8 801599A0 03006014 */  bnez       $v1, .L801599B0
    /* 1FDAC 801599A4 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FDB0 801599A8 73660508 */  j          .L801599CC
    /* 1FDB4 801599AC EC001124 */   addiu     $s1, $zero, 0xEC
  .L801599B0:
    /* 1FDB8 801599B0 03006214 */  bne        $v1, $v0, .L801599C0
    /* 1FDBC 801599B4 02000224 */   addiu     $v0, $zero, 0x2
    /* 1FDC0 801599B8 73660508 */  j          .L801599CC
    /* 1FDC4 801599BC F4001124 */   addiu     $s1, $zero, 0xF4
  .L801599C0:
    /* 1FDC8 801599C0 03006214 */  bne        $v1, $v0, .L801599D0
    /* 1FDCC 801599C4 21200000 */   addu      $a0, $zero, $zero
    /* 1FDD0 801599C8 F0001124 */  addiu      $s1, $zero, 0xF0
  .L801599CC:
    /* 1FDD4 801599CC 21200000 */  addu       $a0, $zero, $zero
  .L801599D0:
    /* 1FDD8 801599D0 21280000 */  addu       $a1, $zero, $zero
    /* 1FDDC 801599D4 60000624 */  addiu      $a2, $zero, 0x60
    /* 1FDE0 801599D8 1280033C */  lui        $v1, %hi(setpc_x)
    /* 1FDE4 801599DC E4C0638C */  lw         $v1, %lo(setpc_x)($v1)
    /* 1FDE8 801599E0 1280083C */  lui        $t0, %hi(setpc_y)
    /* 1FDEC 801599E4 E8C0088D */  lw         $t0, %lo(setpc_y)($t0)
    /* 1FDF0 801599E8 60000724 */  addiu      $a3, $zero, 0x60
    /* 1FDF4 801599EC 0E80013C */  lui        $at, %hi(quests + 0xC2)
    /* 1FDF8 801599F0 02DB31A0 */  sb         $s1, %lo(quests + 0xC2)($at)
    /* 1FDFC 801599F4 2000B1AF */  sw         $s1, 0x20($sp)
    /* 1FE00 801599F8 03000225 */  addiu      $v0, $t0, 0x3
    /* 1FE04 801599FC 1000A3AF */  sw         $v1, 0x10($sp)
    /* 1FE08 80159A00 02006324 */  addiu      $v1, $v1, 0x2
    /* 1FE0C 80159A04 07000825 */  addiu      $t0, $t0, 0x7
    /* 1FE10 80159A08 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1FE14 80159A0C 1800A3AF */  sw         $v1, 0x18($sp)
    /* 1FE18 80159A10 0860050C */  jal        AddBookLever__Fiiiiiiiii
    /* 1FE1C 80159A14 1C00A8AF */   sw        $t0, 0x1C($sp)
    /* 1FE20 80159A18 49000424 */  addiu      $a0, $zero, 0x49
    /* 1FE24 80159A1C 1280053C */  lui        $a1, %hi(setpc_x)
    /* 1FE28 80159A20 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 1FE2C 80159A24 1280063C */  lui        $a2, %hi(setpc_y)
    /* 1FE30 80159A28 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 1FE34 80159A2C 40280500 */  sll        $a1, $a1, 1
    /* 1FE38 80159A30 1900A524 */  addiu      $a1, $a1, 0x19
    /* 1FE3C 80159A34 40300600 */  sll        $a2, $a2, 1
    /* 1FE40 80159A38 BE4E010C */  jal        AddObject__Fiii
    /* 1FE44 80159A3C 2000C624 */   addiu     $a2, $a2, 0x20
  .L80159A40:
    /* 1FE48 80159A40 8560050C */  jal        InitRndBarrels__Fv
    /* 1FE4C 80159A44 00000000 */   nop
  .L80159A48:
    /* 1FE50 80159A48 1280033C */  lui        $v1, %hi(leveltype)
    /* 1FE54 80159A4C 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 1FE58 80159A50 03000224 */  addiu      $v0, $zero, 0x3
    /* 1FE5C 80159A54 0B006214 */  bne        $v1, $v0, .L80159A84
    /* 1FE60 80159A58 04000224 */   addiu     $v0, $zero, 0x4
    /* 1FE64 80159A5C 21200000 */  addu       $a0, $zero, $zero
    /* 1FE68 80159A60 21280000 */  addu       $a1, $zero, $zero
    /* 1FE6C 80159A64 60000624 */  addiu      $a2, $zero, 0x60
    /* 1FE70 80159A68 6A61050C */  jal        AddL3Objs__Fiiii
    /* 1FE74 80159A6C 60000724 */   addiu     $a3, $zero, 0x60
    /* 1FE78 80159A70 8560050C */  jal        InitRndBarrels__Fv
    /* 1FE7C 80159A74 00000000 */   nop
    /* 1FE80 80159A78 1280033C */  lui        $v1, %hi(leveltype)
    /* 1FE84 80159A7C 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 1FE88 80159A80 04000224 */  addiu      $v0, $zero, 0x4
  .L80159A84:
    /* 1FE8C 80159A84 57006214 */  bne        $v1, $v0, .L80159BE4
    /* 1FE90 80159A88 05000424 */   addiu     $a0, $zero, 0x5
    /* 1FE94 80159A8C DC9E010C */  jal        QuestStatus__Fi
    /* 1FE98 80159A90 0B000424 */   addiu     $a0, $zero, 0xB
    /* 1FE9C 80159A94 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FEA0 80159A98 41004010 */  beqz       $v0, .L80159BA0
    /* 1FEA4 80159A9C 00000000 */   nop
    /* 1FEA8 80159AA0 1280033C */  lui        $v1, %hi(myplr)
    /* 1FEAC 80159AA4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 1FEB0 80159AA8 00000000 */  nop
    /* 1FEB4 80159AAC 40100300 */  sll        $v0, $v1, 1
    /* 1FEB8 80159AB0 21104300 */  addu       $v0, $v0, $v1
    /* 1FEBC 80159AB4 80100200 */  sll        $v0, $v0, 2
    /* 1FEC0 80159AB8 21104300 */  addu       $v0, $v0, $v1
    /* 1FEC4 80159ABC 00110200 */  sll        $v0, $v0, 4
    /* 1FEC8 80159AC0 23104300 */  subu       $v0, $v0, $v1
    /* 1FECC 80159AC4 80100200 */  sll        $v0, $v0, 2
    /* 1FED0 80159AC8 21104300 */  addu       $v0, $v0, $v1
    /* 1FED4 80159ACC C0100200 */  sll        $v0, $v0, 3
    /* 1FED8 80159AD0 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 1FEDC 80159AD4 21082200 */  addu       $at, $at, $v0
    /* 1FEE0 80159AD8 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 1FEE4 80159ADC 00000000 */  nop
    /* 1FEE8 80159AE0 03006014 */  bnez       $v1, .L80159AF0
    /* 1FEEC 80159AE4 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FEF0 80159AE8 C3660508 */  j          .L80159B0C
    /* 1FEF4 80159AEC EE001124 */   addiu     $s1, $zero, 0xEE
  .L80159AF0:
    /* 1FEF8 80159AF0 03006214 */  bne        $v1, $v0, .L80159B00
    /* 1FEFC 80159AF4 02000224 */   addiu     $v0, $zero, 0x2
    /* 1FF00 80159AF8 C3660508 */  j          .L80159B0C
    /* 1FF04 80159AFC F6001124 */   addiu     $s1, $zero, 0xF6
  .L80159B00:
    /* 1FF08 80159B00 02006214 */  bne        $v1, $v0, .L80159B0C
    /* 1FF0C 80159B04 00000000 */   nop
    /* 1FF10 80159B08 F2001124 */  addiu      $s1, $zero, 0xF2
  .L80159B0C:
    /* 1FF14 80159B0C 21200000 */  addu       $a0, $zero, $zero
    /* 1FF18 80159B10 21280000 */  addu       $a1, $zero, $zero
    /* 1FF1C 80159B14 60000624 */  addiu      $a2, $zero, 0x60
    /* 1FF20 80159B18 1280023C */  lui        $v0, %hi(setpc_x)
    /* 1FF24 80159B1C E4C0428C */  lw         $v0, %lo(setpc_x)($v0)
    /* 1FF28 80159B20 1280083C */  lui        $t0, %hi(setpc_y)
    /* 1FF2C 80159B24 E8C0088D */  lw         $t0, %lo(setpc_y)($t0)
    /* 1FF30 80159B28 1280033C */  lui        $v1, %hi(setpc_w)
    /* 1FF34 80159B2C ECC0638C */  lw         $v1, %lo(setpc_w)($v1)
    /* 1FF38 80159B30 1280093C */  lui        $t1, %hi(setpc_h)
    /* 1FF3C 80159B34 F0C0298D */  lw         $t1, %lo(setpc_h)($t1)
    /* 1FF40 80159B38 60000724 */  addiu      $a3, $zero, 0x60
    /* 1FF44 80159B3C 0E80013C */  lui        $at, %hi(quests + 0xEA)
    /* 1FF48 80159B40 2ADB31A0 */  sb         $s1, %lo(quests + 0xEA)($at)
    /* 1FF4C 80159B44 2000B1AF */  sw         $s1, 0x20($sp)
    /* 1FF50 80159B48 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1FF54 80159B4C 21104300 */  addu       $v0, $v0, $v1
    /* 1FF58 80159B50 1400A8AF */  sw         $t0, 0x14($sp)
    /* 1FF5C 80159B54 21400901 */  addu       $t0, $t0, $t1
    /* 1FF60 80159B58 1800A2AF */  sw         $v0, 0x18($sp)
    /* 1FF64 80159B5C 0860050C */  jal        AddBookLever__Fiiiiiiiii
    /* 1FF68 80159B60 1C00A8AF */   sw        $t0, 0x1C($sp)
    /* 1FF6C 80159B64 1280043C */  lui        $a0, %hi(D_801197FC)
    /* 1FF70 80159B68 FC978424 */  addiu      $a0, $a0, %lo(D_801197FC)
    /* 1FF74 80159B6C A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 1FF78 80159B70 21280000 */   addu      $a1, $zero, $zero
    /* 1FF7C 80159B74 21804000 */  addu       $s0, $v0, $zero
    /* 1FF80 80159B78 21200002 */  addu       $a0, $s0, $zero
    /* 1FF84 80159B7C 1280053C */  lui        $a1, %hi(setpc_x)
    /* 1FF88 80159B80 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 1FF8C 80159B84 1280063C */  lui        $a2, %hi(setpc_y)
    /* 1FF90 80159B88 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 1FF94 80159B8C 40280500 */  sll        $a1, $a1, 1
    /* 1FF98 80159B90 0367010C */  jal        LoadMapObjs__FPUcii
    /* 1FF9C 80159B94 40300600 */   sll       $a2, $a2, 1
    /* 1FFA0 80159B98 F7F6000C */  jal        mem_free_dbg__FPv
    /* 1FFA4 80159B9C 21200002 */   addu      $a0, $s0, $zero
  .L80159BA0:
    /* 1FFA8 80159BA0 DC9E010C */  jal        QuestStatus__Fi
    /* 1FFAC 80159BA4 0F000424 */   addiu     $a0, $zero, 0xF
    /* 1FFB0 80159BA8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1FFB4 80159BAC 08004010 */  beqz       $v0, .L80159BD0
    /* 1FFB8 80159BB0 01000224 */   addiu     $v0, $zero, 0x1
    /* 1FFBC 80159BB4 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 1FFC0 80159BB8 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 1FFC4 80159BBC 00000000 */  nop
    /* 1FFC8 80159BC0 03006214 */  bne        $v1, $v0, .L80159BD0
    /* 1FFCC 80159BC4 00000000 */   nop
    /* 1FFD0 80159BC8 C764050C */  jal        AddLazStand__Fv
    /* 1FFD4 80159BCC 00000000 */   nop
  .L80159BD0:
    /* 1FFD8 80159BD0 8560050C */  jal        InitRndBarrels__Fv
    /* 1FFDC 80159BD4 00000000 */   nop
    /* 1FFE0 80159BD8 9B64050C */  jal        AddL4Goodies__Fv
    /* 1FFE4 80159BDC 00000000 */   nop
    /* 1FFE8 80159BE0 05000424 */  addiu      $a0, $zero, 0x5
  .L80159BE4:
    /* 1FFEC 80159BE4 0A000524 */  addiu      $a1, $zero, 0xA
    /* 1FFF0 80159BE8 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 1FFF4 80159BEC 05000624 */   addiu     $a2, $zero, 0x5
    /* 1FFF8 80159BF0 03000424 */  addiu      $a0, $zero, 0x3
    /* 1FFFC 80159BF4 06000524 */  addiu      $a1, $zero, 0x6
    /* 20000 80159BF8 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 20004 80159BFC 06000624 */   addiu     $a2, $zero, 0x6
    /* 20008 80159C00 01000424 */  addiu      $a0, $zero, 0x1
    /* 2000C 80159C04 05000524 */  addiu      $a1, $zero, 0x5
    /* 20010 80159C08 8B5D050C */  jal        InitRndLocObj__Fiii
    /* 20014 80159C0C 07000624 */   addiu     $a2, $zero, 0x7
    /* 20018 80159C10 1280033C */  lui        $v1, %hi(leveltype)
    /* 2001C 80159C14 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 20020 80159C18 04000224 */  addiu      $v0, $zero, 0x4
    /* 20024 80159C1C 03006210 */  beq        $v1, $v0, .L80159C2C
    /* 20028 80159C20 00000000 */   nop
    /* 2002C 80159C24 2B62050C */  jal        AddObjTraps__Fv
    /* 20030 80159C28 00000000 */   nop
  .L80159C2C:
    /* 20034 80159C2C 1280023C */  lui        $v0, %hi(leveltype)
    /* 20038 80159C30 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 2003C 80159C34 00000000 */  nop
    /* 20040 80159C38 0200422C */  sltiu      $v0, $v0, 0x2
    /* 20044 80159C3C 03004014 */  bnez       $v0, .L80159C4C
    /* 20048 80159C40 00000000 */   nop
    /* 2004C 80159C44 CD62050C */  jal        AddChestTraps__Fv
    /* 20050 80159C48 00000000 */   nop
  .L80159C4C:
    /* 20054 80159C4C 5965050C */  jal        restoreplrpos__Fv
    /* 20058 80159C50 00000000 */   nop
    /* 2005C 80159C54 1280013C */  lui        $at, %hi(InitObjFlag)
    /* 20060 80159C58 D0B920A0 */  sb         $zero, %lo(InitObjFlag)($at)
  .L80159C5C:
    /* 20064 80159C5C 3000BF8F */  lw         $ra, 0x30($sp)
    /* 20068 80159C60 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 2006C 80159C64 2800B08F */  lw         $s0, 0x28($sp)
    /* 20070 80159C68 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 20074 80159C6C 0800E003 */  jr         $ra
    /* 20078 80159C70 00000000 */   nop
endlabel InitObjects__Fv
