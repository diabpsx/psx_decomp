.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadSetMap__Fv, 0x35C

glabel LoadSetMap__Fv
    /* 1BAB0 801556A8 1280023C */  lui        $v0, %hi(setlvlnum)
    /* 1BAB4 801556AC 0FC14290 */  lbu        $v0, %lo(setlvlnum)($v0)
    /* 1BAB8 801556B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1BABC 801556B4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1BAC0 801556B8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1BAC4 801556BC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1BAC8 801556C0 FFFF4324 */  addiu      $v1, $v0, -0x1
    /* 1BACC 801556C4 0500622C */  sltiu      $v0, $v1, 0x5
    /* 1BAD0 801556C8 C7004010 */  beqz       $v0, .L801559E8
    /* 1BAD4 801556CC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1BAD8 801556D0 80100300 */  sll        $v0, $v1, 2
    /* 1BADC 801556D4 1280013C */  lui        $at, %hi(jtbl_801196C0)
    /* 1BAE0 801556D8 21082200 */  addu       $at, $at, $v0
    /* 1BAE4 801556DC C096228C */  lw         $v0, %lo(jtbl_801196C0)($at)
    /* 1BAE8 801556E0 00000000 */  nop
    /* 1BAEC 801556E4 08004000 */  jr         $v0
    /* 1BAF0 801556E8 00000000 */   nop
    /* 1BAF4 801556EC 0E80043C */  lui        $a0, %hi(quests + 0xF2)
    /* 1BAF8 801556F0 32DB8424 */  addiu      $a0, $a0, %lo(quests + 0xF2)
    /* 1BAFC 801556F4 00008390 */  lbu        $v1, 0x0($a0)
    /* 1BB00 801556F8 01000224 */  addiu      $v0, $zero, 0x1
    /* 1BB04 801556FC 05006214 */  bne        $v1, $v0, .L80155714
    /* 1BB08 80155700 02000224 */   addiu     $v0, $zero, 0x2
    /* 1BB0C 80155704 000082A0 */  sb         $v0, 0x0($a0)
    /* 1BB10 80155708 01000224 */  addiu      $v0, $zero, 0x1
    /* 1BB14 8015570C 0E80013C */  lui        $at, %hi(quests + 0xFF)
    /* 1BB18 80155710 3FDB22A0 */  sb         $v0, %lo(quests + 0xFF)($at)
  .L80155714:
    /* 1BB1C 80155714 1280043C */  lui        $a0, %hi(D_8011957C)
    /* 1BB20 80155718 7C958424 */  addiu      $a0, $a0, %lo(D_8011957C)
    /* 1BB24 8015571C 53000524 */  addiu      $a1, $zero, 0x53
    /* 1BB28 80155720 4EF4040C */  jal        LoadPreL1Dungeon__FPcii
    /* 1BB2C 80155724 2D000624 */   addiu     $a2, $zero, 0x2D
    /* 1BB30 80155728 1280043C */  lui        $a0, %hi(D_80119598)
    /* 1BB34 8015572C 98958424 */  addiu      $a0, $a0, %lo(D_80119598)
    /* 1BB38 80155730 53000524 */  addiu      $a1, $zero, 0x53
    /* 1BB3C 80155734 D9F3040C */  jal        LoadL1Dungeon__FPcii
    /* 1BB40 80155738 2D000624 */   addiu     $a2, $zero, 0x2D
    /* 1BB44 8015573C 1280043C */  lui        $a0, %hi(D_801195B4)
    /* 1BB48 80155740 B4958424 */  addiu      $a0, $a0, %lo(D_801195B4)
    /* 1BB4C 80155744 99FB010C */  jal        LoadPalette__FPCc
    /* 1BB50 80155748 00000000 */   nop
    /* 1BB54 8015574C 1280053C */  lui        $a1, %hi(D_8011BFC0)
    /* 1BB58 80155750 C0BFA524 */  addiu      $a1, $a1, %lo(D_8011BFC0)
    /* 1BB5C 80155754 8568050C */  jal        DRLG_AreaTrans__FiPUc
    /* 1BB60 80155758 02000424 */   addiu     $a0, $zero, 0x2
    /* 1BB64 8015575C 1280053C */  lui        $a1, %hi(D_8011BFC8)
    /* 1BB68 80155760 C8BFA524 */  addiu      $a1, $a1, %lo(D_8011BFC8)
    /* 1BB6C 80155764 6868050C */  jal        DRLG_ListTrans__FiPUc
    /* 1BB70 80155768 02000424 */   addiu     $a0, $zero, 0x2
    /* 1BB74 8015576C 0E80053C */  lui        $a1, %hi(D_800E3FC0)
    /* 1BB78 80155770 C03FA524 */  addiu      $a1, $a1, %lo(D_800E3FC0)
    /* 1BB7C 80155774 8568050C */  jal        DRLG_AreaTrans__FiPUc
    /* 1BB80 80155778 05000424 */   addiu     $a0, $zero, 0x5
    /* 1BB84 8015577C 0E80053C */  lui        $a1, %hi(D_800E3FD4)
    /* 1BB88 80155780 D43FA524 */  addiu      $a1, $a1, %lo(D_800E3FD4)
    /* 1BB8C 80155784 6868050C */  jal        DRLG_ListTrans__FiPUc
    /* 1BB90 80155788 07000424 */   addiu     $a0, $zero, 0x7
    /* 1BB94 8015578C 21200000 */  addu       $a0, $zero, $zero
    /* 1BB98 80155790 21280000 */  addu       $a1, $zero, $zero
    /* 1BB9C 80155794 60000624 */  addiu      $a2, $zero, 0x60
    /* 1BBA0 80155798 E860050C */  jal        AddL1Objs__Fiiii
    /* 1BBA4 8015579C 60000724 */   addiu     $a3, $zero, 0x60
    /* 1BBA8 801557A0 E354050C */  jal        AddSKingObjs__Fv
    /* 1BBAC 801557A4 00000000 */   nop
    /* 1BBB0 801557A8 FE8A050C */  jal        InitSKingTriggers__Fv
    /* 1BBB4 801557AC 00000000 */   nop
    /* 1BBB8 801557B0 7A560508 */  j          .L801559E8
    /* 1BBBC 801557B4 00000000 */   nop
    /* 1BBC0 801557B8 1280043C */  lui        $a0, %hi(D_801195CC)
    /* 1BBC4 801557BC CC958424 */  addiu      $a0, $a0, %lo(D_801195CC)
    /* 1BBC8 801557C0 45000524 */  addiu      $a1, $zero, 0x45
    /* 1BBCC 801557C4 D620050C */  jal        LoadPreL2Dungeon__FPcii
    /* 1BBD0 801557C8 27000624 */   addiu     $a2, $zero, 0x27
    /* 1BBD4 801557CC 1280043C */  lui        $a0, %hi(D_801195E8)
    /* 1BBD8 801557D0 E8958424 */  addiu      $a0, $a0, %lo(D_801195E8)
    /* 1BBDC 801557D4 45000524 */  addiu      $a1, $zero, 0x45
    /* 1BBE0 801557D8 4F20050C */  jal        LoadL2Dungeon__FPcii
    /* 1BBE4 801557DC 27000624 */   addiu     $a2, $zero, 0x27
    /* 1BBE8 801557E0 1280043C */  lui        $a0, %hi(D_80119604)
    /* 1BBEC 801557E4 04968424 */  addiu      $a0, $a0, %lo(D_80119604)
    /* 1BBF0 801557E8 99FB010C */  jal        LoadPalette__FPCc
    /* 1BBF4 801557EC 00000000 */   nop
    /* 1BBF8 801557F0 0E80053C */  lui        $a1, %hi(D_800E3FF0)
    /* 1BBFC 801557F4 F03FA524 */  addiu      $a1, $a1, %lo(D_800E3FF0)
    /* 1BC00 801557F8 6868050C */  jal        DRLG_ListTrans__FiPUc
    /* 1BC04 801557FC 05000424 */   addiu     $a0, $zero, 0x5
    /* 1BC08 80155800 1280053C */  lui        $a1, %hi(D_8011BFD0)
    /* 1BC0C 80155804 D0BFA524 */  addiu      $a1, $a1, %lo(D_8011BFD0)
    /* 1BC10 80155808 8568050C */  jal        DRLG_AreaTrans__FiPUc
    /* 1BC14 8015580C 02000424 */   addiu     $a0, $zero, 0x2
    /* 1BC18 80155810 0E80053C */  lui        $a1, %hi(D_800E4004)
    /* 1BC1C 80155814 0440A524 */  addiu      $a1, $a1, %lo(D_800E4004)
    /* 1BC20 80155818 6868050C */  jal        DRLG_ListTrans__FiPUc
    /* 1BC24 8015581C 09000424 */   addiu     $a0, $zero, 0x9
    /* 1BC28 80155820 21200000 */  addu       $a0, $zero, $zero
    /* 1BC2C 80155824 21280000 */  addu       $a1, $zero, $zero
    /* 1BC30 80155828 60000624 */  addiu      $a2, $zero, 0x60
    /* 1BC34 8015582C 2B61050C */  jal        AddL2Objs__Fiiii
    /* 1BC38 80155830 60000724 */   addiu     $a3, $zero, 0x60
    /* 1BC3C 80155834 2F55050C */  jal        AddSChamObjs__Fv
    /* 1BC40 80155838 00000000 */   nop
    /* 1BC44 8015583C 118B050C */  jal        InitSChambTriggers__Fv
    /* 1BC48 80155840 00000000 */   nop
    /* 1BC4C 80155844 7A560508 */  j          .L801559E8
    /* 1BC50 80155848 00000000 */   nop
    /* 1BC54 8015584C 1280103C */  lui        $s0, %hi(D_8011961C)
    /* 1BC58 80155850 1C961026 */  addiu      $s0, $s0, %lo(D_8011961C)
    /* 1BC5C 80155854 21200002 */  addu       $a0, $s0, $zero
    /* 1BC60 80155858 14000524 */  addiu      $a1, $zero, 0x14
    /* 1BC64 8015585C 4EF4040C */  jal        LoadPreL1Dungeon__FPcii
    /* 1BC68 80155860 32000624 */   addiu     $a2, $zero, 0x32
    /* 1BC6C 80155864 1280043C */  lui        $a0, %hi(D_80119638)
    /* 1BC70 80155868 38968424 */  addiu      $a0, $a0, %lo(D_80119638)
    /* 1BC74 8015586C 14000524 */  addiu      $a1, $zero, 0x14
    /* 1BC78 80155870 D9F3040C */  jal        LoadL1Dungeon__FPcii
    /* 1BC7C 80155874 32000624 */   addiu     $a2, $zero, 0x32
    /* 1BC80 80155878 1280043C */  lui        $a0, %hi(D_80119654)
    /* 1BC84 8015587C 54968424 */  addiu      $a0, $a0, %lo(D_80119654)
    /* 1BC88 80155880 99FB010C */  jal        LoadPalette__FPCc
    /* 1BC8C 80155884 00000000 */   nop
    /* 1BC90 80155888 21200000 */  addu       $a0, $zero, $zero
    /* 1BC94 8015588C 21280000 */  addu       $a1, $zero, $zero
    /* 1BC98 80155890 60000624 */  addiu      $a2, $zero, 0x60
    /* 1BC9C 80155894 E860050C */  jal        AddL1Objs__Fiiii
    /* 1BCA0 80155898 60000724 */   addiu     $a3, $zero, 0x60
    /* 1BCA4 8015589C 7955050C */  jal        DRLG_SetMapTrans__FPc
    /* 1BCA8 801558A0 21200002 */   addu      $a0, $s0, $zero
    /* 1BCAC 801558A4 7A560508 */  j          .L801559E8
    /* 1BCB0 801558A8 00000000 */   nop
    /* 1BCB4 801558AC 0E80113C */  lui        $s1, %hi(quests + 0x106)
    /* 1BCB8 801558B0 46DB3126 */  addiu      $s1, $s1, %lo(quests + 0x106)
    /* 1BCBC 801558B4 00002292 */  lbu        $v0, 0x0($s1)
    /* 1BCC0 801558B8 01001224 */  addiu      $s2, $zero, 0x1
    /* 1BCC4 801558BC 02005214 */  bne        $v0, $s2, .L801558C8
    /* 1BCC8 801558C0 02000224 */   addiu     $v0, $zero, 0x2
    /* 1BCCC 801558C4 000022A2 */  sb         $v0, 0x0($s1)
  .L801558C8:
    /* 1BCD0 801558C8 1280103C */  lui        $s0, %hi(D_8011966C)
    /* 1BCD4 801558CC 6C961026 */  addiu      $s0, $s0, %lo(D_8011966C)
    /* 1BCD8 801558D0 21200002 */  addu       $a0, $s0, $zero
    /* 1BCDC 801558D4 13000524 */  addiu      $a1, $zero, 0x13
    /* 1BCE0 801558D8 9335050C */  jal        LoadPreL3Dungeon__FPcii
    /* 1BCE4 801558DC 32000624 */   addiu     $a2, $zero, 0x32
    /* 1BCE8 801558E0 21200002 */  addu       $a0, $s0, $zero
    /* 1BCEC 801558E4 14000524 */  addiu      $a1, $zero, 0x14
    /* 1BCF0 801558E8 3235050C */  jal        LoadL3Dungeon__FPcii
    /* 1BCF4 801558EC 32000624 */   addiu     $a2, $zero, 0x32
    /* 1BCF8 801558F0 1280043C */  lui        $a0, %hi(D_80119688)
    /* 1BCFC 801558F4 88968424 */  addiu      $a0, $a0, %lo(D_80119688)
    /* 1BD00 801558F8 99FB010C */  jal        LoadPalette__FPCc
    /* 1BD04 801558FC 00000000 */   nop
    /* 1BD08 80155900 248B050C */  jal        InitPWaterTriggers__Fv
    /* 1BD0C 80155904 00000000 */   nop
    /* 1BD10 80155908 00002392 */  lbu        $v1, 0x0($s1)
    /* 1BD14 8015590C 03000224 */  addiu      $v0, $zero, 0x3
    /* 1BD18 80155910 05006214 */  bne        $v1, $v0, .L80155928
    /* 1BD1C 80155914 00000000 */   nop
    /* 1BD20 80155918 1280013C */  lui        $at, %hi(WaterDone)
    /* 1BD24 8015591C 48BA32AC */  sw         $s2, %lo(WaterDone)($at)
    /* 1BD28 80155920 7A560508 */  j          .L801559E8
    /* 1BD2C 80155924 00000000 */   nop
  .L80155928:
    /* 1BD30 80155928 1280013C */  lui        $at, %hi(WaterDone)
    /* 1BD34 8015592C 48BA20AC */  sw         $zero, %lo(WaterDone)($at)
    /* 1BD38 80155930 7A560508 */  j          .L801559E8
    /* 1BD3C 80155934 00000000 */   nop
    /* 1BD40 80155938 0E80043C */  lui        $a0, %hi(quests + 0x12E)
    /* 1BD44 8015593C 6EDB8490 */  lbu        $a0, %lo(quests + 0x12E)($a0)
    /* 1BD48 80155940 23001224 */  addiu      $s2, $zero, 0x23
    /* 1BD4C 80155944 03008238 */  xori       $v0, $a0, 0x3
    /* 1BD50 80155948 0100422C */  sltiu      $v0, $v0, 0x1
    /* 1BD54 8015594C 02004010 */  beqz       $v0, .L80155958
    /* 1BD58 80155950 21184000 */   addu      $v1, $v0, $zero
    /* 1BD5C 80155954 24001224 */  addiu      $s2, $zero, 0x24
  .L80155958:
    /* 1BD60 80155958 04006010 */  beqz       $v1, .L8015596C
    /* 1BD64 8015595C 24001124 */   addiu     $s1, $zero, 0x24
    /* 1BD68 80155960 21001124 */  addiu      $s1, $zero, 0x21
    /* 1BD6C 80155964 5E560508 */  j          .L80155978
    /* 1BD70 80155968 04000224 */   addiu     $v0, $zero, 0x4
  .L8015596C:
    /* 1BD74 8015596C 02000224 */  addiu      $v0, $zero, 0x2
    /* 1BD78 80155970 03008214 */  bne        $a0, $v0, .L80155980
    /* 1BD7C 80155974 03000224 */   addiu     $v0, $zero, 0x3
  .L80155978:
    /* 1BD80 80155978 0E80013C */  lui        $at, %hi(quests + 0x13C)
    /* 1BD84 8015597C 7CDB22A0 */  sb         $v0, %lo(quests + 0x13C)($at)
  .L80155980:
    /* 1BD88 80155980 1280103C */  lui        $s0, %hi(D_801196A4)
    /* 1BD8C 80155984 A4961026 */  addiu      $s0, $s0, %lo(D_801196A4)
    /* 1BD90 80155988 21200002 */  addu       $a0, $s0, $zero
    /* 1BD94 8015598C 21284002 */  addu       $a1, $s2, $zero
    /* 1BD98 80155990 4EF4040C */  jal        LoadPreL1Dungeon__FPcii
    /* 1BD9C 80155994 21302002 */   addu      $a2, $s1, $zero
    /* 1BDA0 80155998 1280043C */  lui        $a0, %hi(D_801196B0)
    /* 1BDA4 8015599C B0968424 */  addiu      $a0, $a0, %lo(D_801196B0)
    /* 1BDA8 801559A0 21284002 */  addu       $a1, $s2, $zero
    /* 1BDAC 801559A4 D9F3040C */  jal        LoadL1Dungeon__FPcii
    /* 1BDB0 801559A8 21302002 */   addu      $a2, $s1, $zero
    /* 1BDB4 801559AC 1280043C */  lui        $a0, %hi(D_801195B4)
    /* 1BDB8 801559B0 B4958424 */  addiu      $a0, $a0, %lo(D_801195B4)
    /* 1BDBC 801559B4 99FB010C */  jal        LoadPalette__FPCc
    /* 1BDC0 801559B8 00000000 */   nop
    /* 1BDC4 801559BC 21200000 */  addu       $a0, $zero, $zero
    /* 1BDC8 801559C0 21280000 */  addu       $a1, $zero, $zero
    /* 1BDCC 801559C4 60000624 */  addiu      $a2, $zero, 0x60
    /* 1BDD0 801559C8 E860050C */  jal        AddL1Objs__Fiiii
    /* 1BDD4 801559CC 60000724 */   addiu     $a3, $zero, 0x60
    /* 1BDD8 801559D0 4E55050C */  jal        AddVileObjs__Fv
    /* 1BDDC 801559D4 00000000 */   nop
    /* 1BDE0 801559D8 7955050C */  jal        DRLG_SetMapTrans__FPc
    /* 1BDE4 801559DC 21200002 */   addu      $a0, $s0, $zero
    /* 1BDE8 801559E0 6B88050C */  jal        InitNoTriggers__Fv
    /* 1BDEC 801559E4 00000000 */   nop
  .L801559E8:
    /* 1BDF0 801559E8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1BDF4 801559EC 1800B28F */  lw         $s2, 0x18($sp)
    /* 1BDF8 801559F0 1400B18F */  lw         $s1, 0x14($sp)
    /* 1BDFC 801559F4 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BE00 801559F8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1BE04 801559FC 0800E003 */  jr         $ra
    /* 1BE08 80155A00 00000000 */   nop
endlabel LoadSetMap__Fv
