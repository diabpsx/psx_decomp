.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitQuests__Fv, 0x5B0

glabel InitQuests__Fv
    /* 24BE4 8015E7DC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 24BE8 8015E7E0 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 24BEC 8015E7E4 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 24BF0 8015E7E8 01000224 */  addiu      $v0, $zero, 0x1
    /* 24BF4 8015E7EC 2400BFAF */  sw         $ra, 0x24($sp)
    /* 24BF8 8015E7F0 13006214 */  bne        $v1, $v0, .L8015E840
    /* 24BFC 8015E7F4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 24C00 8015E7F8 1000A0AF */  sw         $zero, 0x10($sp)
  .L8015E7FC:
    /* 24C04 8015E7FC 1000A28F */  lw         $v0, 0x10($sp)
    /* 24C08 8015E800 00000000 */  nop
    /* 24C0C 8015E804 80180200 */  sll        $v1, $v0, 2
    /* 24C10 8015E808 21186200 */  addu       $v1, $v1, $v0
    /* 24C14 8015E80C 80180300 */  sll        $v1, $v1, 2
    /* 24C18 8015E810 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 24C1C 8015E814 21082300 */  addu       $at, $at, $v1
    /* 24C20 8015E818 42DA20A0 */  sb         $zero, %lo(quests + 0x2)($at)
    /* 24C24 8015E81C 1000A28F */  lw         $v0, 0x10($sp)
    /* 24C28 8015E820 00000000 */  nop
    /* 24C2C 8015E824 01004224 */  addiu      $v0, $v0, 0x1
    /* 24C30 8015E828 1000A2AF */  sw         $v0, 0x10($sp)
    /* 24C34 8015E82C 10004228 */  slti       $v0, $v0, 0x10
    /* 24C38 8015E830 1A004010 */  beqz       $v0, .L8015E89C
    /* 24C3C 8015E834 00000000 */   nop
    /* 24C40 8015E838 FF790508 */  j          .L8015E7FC
    /* 24C44 8015E83C 00000000 */   nop
  .L8015E840:
    /* 24C48 8015E840 1000A0AF */  sw         $zero, 0x10($sp)
  .L8015E844:
    /* 24C4C 8015E844 1000A38F */  lw         $v1, 0x10($sp)
    /* 24C50 8015E848 00000000 */  nop
    /* 24C54 8015E84C 00110300 */  sll        $v0, $v1, 4
    /* 24C58 8015E850 0E80013C */  lui        $at, %hi(questlist + 0x6)
    /* 24C5C 8015E854 21082200 */  addu       $at, $at, $v0
    /* 24C60 8015E858 0ED92290 */  lbu        $v0, %lo(questlist + 0x6)($at)
    /* 24C64 8015E85C 00000000 */  nop
    /* 24C68 8015E860 01004230 */  andi       $v0, $v0, 0x1
    /* 24C6C 8015E864 06004014 */  bnez       $v0, .L8015E880
    /* 24C70 8015E868 80100300 */   sll       $v0, $v1, 2
    /* 24C74 8015E86C 21104300 */  addu       $v0, $v0, $v1
    /* 24C78 8015E870 80100200 */  sll        $v0, $v0, 2
    /* 24C7C 8015E874 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 24C80 8015E878 21082200 */  addu       $at, $at, $v0
    /* 24C84 8015E87C 42DA20A0 */  sb         $zero, %lo(quests + 0x2)($at)
  .L8015E880:
    /* 24C88 8015E880 1000A28F */  lw         $v0, 0x10($sp)
    /* 24C8C 8015E884 00000000 */  nop
    /* 24C90 8015E888 01004224 */  addiu      $v0, $v0, 0x1
    /* 24C94 8015E88C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 24C98 8015E890 10004228 */  slti       $v0, $v0, 0x10
    /* 24C9C 8015E894 EBFF4014 */  bnez       $v0, .L8015E844
    /* 24CA0 8015E898 00000000 */   nop
  .L8015E89C:
    /* 24CA4 8015E89C 1280023C */  lui        $v0, %hi(ALLQUESTS)
    /* 24CA8 8015E8A0 2CBA428C */  lw         $v0, %lo(ALLQUESTS)($v0)
    /* 24CAC 8015E8A4 21800000 */  addu       $s0, $zero, $zero
    /* 24CB0 8015E8A8 1280013C */  lui        $at, %hi(questlog)
    /* 24CB4 8015E8AC 29BA20A0 */  sb         $zero, %lo(questlog)($at)
    /* 24CB8 8015E8B0 1280013C */  lui        $at, %hi(WaterDone)
    /* 24CBC 8015E8B4 48BA20AC */  sw         $zero, %lo(WaterDone)($at)
    /* 24CC0 8015E8B8 BE004018 */  blez       $v0, .L8015EBB4
    /* 24CC4 8015E8BC 1000A0AF */   sw        $zero, 0x10($sp)
  .L8015E8C0:
    /* 24CC8 8015E8C0 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 24CCC 8015E8C4 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 24CD0 8015E8C8 00000000 */  nop
    /* 24CD4 8015E8CC 0200422C */  sltiu      $v0, $v0, 0x2
    /* 24CD8 8015E8D0 0B004014 */  bnez       $v0, .L8015E900
    /* 24CDC 8015E8D4 00000000 */   nop
    /* 24CE0 8015E8D8 1000A28F */  lw         $v0, 0x10($sp)
    /* 24CE4 8015E8DC 00000000 */  nop
    /* 24CE8 8015E8E0 00110200 */  sll        $v0, $v0, 4
    /* 24CEC 8015E8E4 0E80013C */  lui        $at, %hi(questlist + 0x6)
    /* 24CF0 8015E8E8 21082200 */  addu       $at, $at, $v0
    /* 24CF4 8015E8EC 0ED92290 */  lbu        $v0, %lo(questlist + 0x6)($at)
    /* 24CF8 8015E8F0 00000000 */  nop
    /* 24CFC 8015E8F4 01004230 */  andi       $v0, $v0, 0x1
    /* 24D00 8015E8F8 A6004010 */  beqz       $v0, .L8015EB94
    /* 24D04 8015E8FC 00000000 */   nop
  .L8015E900:
    /* 24D08 8015E900 1000A28F */  lw         $v0, 0x10($sp)
    /* 24D0C 8015E904 00000000 */  nop
    /* 24D10 8015E908 80180200 */  sll        $v1, $v0, 2
    /* 24D14 8015E90C 21186200 */  addu       $v1, $v1, $v0
    /* 24D18 8015E910 00110200 */  sll        $v0, $v0, 4
    /* 24D1C 8015E914 0E80013C */  lui        $at, %hi(questlist + 0x3)
    /* 24D20 8015E918 21082200 */  addu       $at, $at, $v0
    /* 24D24 8015E91C 0BD92290 */  lbu        $v0, %lo(questlist + 0x3)($at)
    /* 24D28 8015E920 80180300 */  sll        $v1, $v1, 2
    /* 24D2C 8015E924 0E80013C */  lui        $at, %hi(quests + 0x1)
    /* 24D30 8015E928 21082300 */  addu       $at, $at, $v1
    /* 24D34 8015E92C 41DA22A0 */  sb         $v0, %lo(quests + 0x1)($at)
    /* 24D38 8015E930 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 24D3C 8015E934 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 24D40 8015E938 00000000 */  nop
    /* 24D44 8015E93C 0200422C */  sltiu      $v0, $v0, 0x2
    /* 24D48 8015E940 2D004014 */  bnez       $v0, .L8015E9F8
    /* 24D4C 8015E944 00000000 */   nop
    /* 24D50 8015E948 1000A28F */  lw         $v0, 0x10($sp)
    /* 24D54 8015E94C 00000000 */  nop
    /* 24D58 8015E950 80180200 */  sll        $v1, $v0, 2
    /* 24D5C 8015E954 21186200 */  addu       $v1, $v1, $v0
    /* 24D60 8015E958 00110200 */  sll        $v0, $v0, 4
    /* 24D64 8015E95C 0E80013C */  lui        $at, %hi(questlist + 0x1)
    /* 24D68 8015E960 21082200 */  addu       $at, $at, $v0
    /* 24D6C 8015E964 09D92290 */  lbu        $v0, %lo(questlist + 0x1)($at)
    /* 24D70 8015E968 80180300 */  sll        $v1, $v1, 2
    /* 24D74 8015E96C 0E80013C */  lui        $at, %hi(quests)
    /* 24D78 8015E970 21082300 */  addu       $at, $at, $v1
    /* 24D7C 8015E974 40DA22A0 */  sb         $v0, %lo(quests)($at)
    /* 24D80 8015E978 C53C010C */  jal        delta_quest_inited__Fi
    /* 24D84 8015E97C 21200002 */   addu      $a0, $s0, $zero
    /* 24D88 8015E980 FF004230 */  andi       $v0, $v0, 0xFF
    /* 24D8C 8015E984 1A004014 */  bnez       $v0, .L8015E9F0
    /* 24D90 8015E988 00000000 */   nop
    /* 24D94 8015E98C 1000A38F */  lw         $v1, 0x10($sp)
    /* 24D98 8015E990 00000000 */  nop
    /* 24D9C 8015E994 80100300 */  sll        $v0, $v1, 2
    /* 24DA0 8015E998 21104300 */  addu       $v0, $v0, $v1
    /* 24DA4 8015E99C 80100200 */  sll        $v0, $v0, 2
    /* 24DA8 8015E9A0 01000324 */  addiu      $v1, $zero, 0x1
    /* 24DAC 8015E9A4 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 24DB0 8015E9A8 21082200 */  addu       $at, $at, $v0
    /* 24DB4 8015E9AC 42DA23A0 */  sb         $v1, %lo(quests + 0x2)($at)
    /* 24DB8 8015E9B0 1000A38F */  lw         $v1, 0x10($sp)
    /* 24DBC 8015E9B4 00000000 */  nop
    /* 24DC0 8015E9B8 80100300 */  sll        $v0, $v1, 2
    /* 24DC4 8015E9BC 21104300 */  addu       $v0, $v0, $v1
    /* 24DC8 8015E9C0 80100200 */  sll        $v0, $v0, 2
    /* 24DCC 8015E9C4 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 24DD0 8015E9C8 21082200 */  addu       $at, $at, $v0
    /* 24DD4 8015E9CC 4FDA20A0 */  sb         $zero, %lo(quests + 0xF)($at)
    /* 24DD8 8015E9D0 1000A38F */  lw         $v1, 0x10($sp)
    /* 24DDC 8015E9D4 00000000 */  nop
    /* 24DE0 8015E9D8 80100300 */  sll        $v0, $v1, 2
    /* 24DE4 8015E9DC 21104300 */  addu       $v0, $v0, $v1
    /* 24DE8 8015E9E0 80100200 */  sll        $v0, $v0, 2
    /* 24DEC 8015E9E4 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 24DF0 8015E9E8 21082200 */  addu       $at, $at, $v0
    /* 24DF4 8015E9EC 51DA20A0 */  sb         $zero, %lo(quests + 0x11)($at)
  .L8015E9F0:
    /* 24DF8 8015E9F0 A37A0508 */  j          .L8015EA8C
    /* 24DFC 8015E9F4 01001026 */   addiu     $s0, $s0, 0x1
  .L8015E9F8:
    /* 24E00 8015E9F8 1000A38F */  lw         $v1, 0x10($sp)
    /* 24E04 8015E9FC 00000000 */  nop
    /* 24E08 8015EA00 80100300 */  sll        $v0, $v1, 2
    /* 24E0C 8015EA04 21104300 */  addu       $v0, $v0, $v1
    /* 24E10 8015EA08 80100200 */  sll        $v0, $v0, 2
    /* 24E14 8015EA0C 01000324 */  addiu      $v1, $zero, 0x1
    /* 24E18 8015EA10 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 24E1C 8015EA14 21082200 */  addu       $at, $at, $v0
    /* 24E20 8015EA18 42DA23A0 */  sb         $v1, %lo(quests + 0x2)($at)
    /* 24E24 8015EA1C 1000A28F */  lw         $v0, 0x10($sp)
    /* 24E28 8015EA20 00000000 */  nop
    /* 24E2C 8015EA24 80180200 */  sll        $v1, $v0, 2
    /* 24E30 8015EA28 21186200 */  addu       $v1, $v1, $v0
    /* 24E34 8015EA2C 00110200 */  sll        $v0, $v0, 4
    /* 24E38 8015EA30 0E80013C */  lui        $at, %hi(questlist)
    /* 24E3C 8015EA34 21082200 */  addu       $at, $at, $v0
    /* 24E40 8015EA38 08D92290 */  lbu        $v0, %lo(questlist)($at)
    /* 24E44 8015EA3C 80180300 */  sll        $v1, $v1, 2
    /* 24E48 8015EA40 0E80013C */  lui        $at, %hi(quests)
    /* 24E4C 8015EA44 21082300 */  addu       $at, $at, $v1
    /* 24E50 8015EA48 40DA22A0 */  sb         $v0, %lo(quests)($at)
    /* 24E54 8015EA4C 1000A38F */  lw         $v1, 0x10($sp)
    /* 24E58 8015EA50 00000000 */  nop
    /* 24E5C 8015EA54 80100300 */  sll        $v0, $v1, 2
    /* 24E60 8015EA58 21104300 */  addu       $v0, $v0, $v1
    /* 24E64 8015EA5C 80100200 */  sll        $v0, $v0, 2
    /* 24E68 8015EA60 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 24E6C 8015EA64 21082200 */  addu       $at, $at, $v0
    /* 24E70 8015EA68 4FDA20A0 */  sb         $zero, %lo(quests + 0xF)($at)
    /* 24E74 8015EA6C 1000A38F */  lw         $v1, 0x10($sp)
    /* 24E78 8015EA70 00000000 */  nop
    /* 24E7C 8015EA74 80100300 */  sll        $v0, $v1, 2
    /* 24E80 8015EA78 21104300 */  addu       $v0, $v0, $v1
    /* 24E84 8015EA7C 80100200 */  sll        $v0, $v0, 2
    /* 24E88 8015EA80 0E80013C */  lui        $at, %hi(quests + 0x11)
    /* 24E8C 8015EA84 21082200 */  addu       $at, $at, $v0
    /* 24E90 8015EA88 51DA20A0 */  sb         $zero, %lo(quests + 0x11)($at)
  .L8015EA8C:
    /* 24E94 8015EA8C 1000A28F */  lw         $v0, 0x10($sp)
    /* 24E98 8015EA90 00000000 */  nop
    /* 24E9C 8015EA94 80180200 */  sll        $v1, $v0, 2
    /* 24EA0 8015EA98 21186200 */  addu       $v1, $v1, $v0
    /* 24EA4 8015EA9C 00110200 */  sll        $v0, $v0, 4
    /* 24EA8 8015EAA0 0E80013C */  lui        $at, %hi(questlist + 0x5)
    /* 24EAC 8015EAA4 21082200 */  addu       $at, $at, $v0
    /* 24EB0 8015EAA8 0DD92290 */  lbu        $v0, %lo(questlist + 0x5)($at)
    /* 24EB4 8015EAAC 80180300 */  sll        $v1, $v1, 2
    /* 24EB8 8015EAB0 0E80013C */  lui        $at, %hi(quests + 0xC)
    /* 24EBC 8015EAB4 21082300 */  addu       $at, $at, $v1
    /* 24EC0 8015EAB8 4CDA22A0 */  sb         $v0, %lo(quests + 0xC)($at)
    /* 24EC4 8015EABC 1000A38F */  lw         $v1, 0x10($sp)
    /* 24EC8 8015EAC0 00000000 */  nop
    /* 24ECC 8015EAC4 80100300 */  sll        $v0, $v1, 2
    /* 24ED0 8015EAC8 21104300 */  addu       $v0, $v0, $v1
    /* 24ED4 8015EACC 1000A393 */  lbu        $v1, 0x10($sp)
    /* 24ED8 8015EAD0 80100200 */  sll        $v0, $v0, 2
    /* 24EDC 8015EAD4 0E80013C */  lui        $at, %hi(quests + 0xD)
    /* 24EE0 8015EAD8 21082200 */  addu       $at, $at, $v0
    /* 24EE4 8015EADC 4DDA23A0 */  sb         $v1, %lo(quests + 0xD)($at)
    /* 24EE8 8015EAE0 1000A38F */  lw         $v1, 0x10($sp)
    /* 24EEC 8015EAE4 0E80013C */  lui        $at, %hi(quests + 0x4)
    /* 24EF0 8015EAE8 21082200 */  addu       $at, $at, $v0
    /* 24EF4 8015EAEC 44DA20AC */  sw         $zero, %lo(quests + 0x4)($at)
    /* 24EF8 8015EAF0 0E80013C */  lui        $at, %hi(quests + 0x8)
    /* 24EFC 8015EAF4 21082200 */  addu       $at, $at, $v0
    /* 24F00 8015EAF8 48DA20AC */  sw         $zero, %lo(quests + 0x8)($at)
    /* 24F04 8015EAFC 80100300 */  sll        $v0, $v1, 2
    /* 24F08 8015EB00 21104300 */  addu       $v0, $v0, $v1
    /* 24F0C 8015EB04 00190300 */  sll        $v1, $v1, 4
    /* 24F10 8015EB08 0E80013C */  lui        $at, %hi(questlist + 0x2)
    /* 24F14 8015EB0C 21082300 */  addu       $at, $at, $v1
    /* 24F18 8015EB10 0AD92390 */  lbu        $v1, %lo(questlist + 0x2)($at)
    /* 24F1C 8015EB14 80100200 */  sll        $v0, $v0, 2
    /* 24F20 8015EB18 0E80013C */  lui        $at, %hi(quests + 0x3)
    /* 24F24 8015EB1C 21082200 */  addu       $at, $at, $v0
    /* 24F28 8015EB20 43DA23A0 */  sb         $v1, %lo(quests + 0x3)($at)
    /* 24F2C 8015EB24 1000A38F */  lw         $v1, 0x10($sp)
    /* 24F30 8015EB28 00000000 */  nop
    /* 24F34 8015EB2C 80100300 */  sll        $v0, $v1, 2
    /* 24F38 8015EB30 21104300 */  addu       $v0, $v0, $v1
    /* 24F3C 8015EB34 80100200 */  sll        $v0, $v0, 2
    /* 24F40 8015EB38 0E80013C */  lui        $at, %hi(quests + 0x10)
    /* 24F44 8015EB3C 21082200 */  addu       $at, $at, $v0
    /* 24F48 8015EB40 50DA20A0 */  sb         $zero, %lo(quests + 0x10)($at)
    /* 24F4C 8015EB44 1000A28F */  lw         $v0, 0x10($sp)
    /* 24F50 8015EB48 00000000 */  nop
    /* 24F54 8015EB4C 80180200 */  sll        $v1, $v0, 2
    /* 24F58 8015EB50 21186200 */  addu       $v1, $v1, $v0
    /* 24F5C 8015EB54 00110200 */  sll        $v0, $v0, 4
    /* 24F60 8015EB58 0E80013C */  lui        $at, %hi(questlist + 0x8)
    /* 24F64 8015EB5C 21082200 */  addu       $at, $at, $v0
    /* 24F68 8015EB60 10D9228C */  lw         $v0, %lo(questlist + 0x8)($at)
    /* 24F6C 8015EB64 80180300 */  sll        $v1, $v1, 2
    /* 24F70 8015EB68 0E80013C */  lui        $at, %hi(quests + 0xE)
    /* 24F74 8015EB6C 21082300 */  addu       $at, $at, $v1
    /* 24F78 8015EB70 4EDA22A0 */  sb         $v0, %lo(quests + 0xE)($at)
    /* 24F7C 8015EB74 1000A38F */  lw         $v1, 0x10($sp)
    /* 24F80 8015EB78 00000000 */  nop
    /* 24F84 8015EB7C 80100300 */  sll        $v0, $v1, 2
    /* 24F88 8015EB80 21104300 */  addu       $v0, $v0, $v1
    /* 24F8C 8015EB84 80100200 */  sll        $v0, $v0, 2
    /* 24F90 8015EB88 0E80013C */  lui        $at, %hi(quests + 0x12)
    /* 24F94 8015EB8C 21082200 */  addu       $at, $at, $v0
    /* 24F98 8015EB90 52DA20A0 */  sb         $zero, %lo(quests + 0x12)($at)
  .L8015EB94:
    /* 24F9C 8015EB94 1000A28F */  lw         $v0, 0x10($sp)
    /* 24FA0 8015EB98 1280033C */  lui        $v1, %hi(ALLQUESTS)
    /* 24FA4 8015EB9C 2CBA638C */  lw         $v1, %lo(ALLQUESTS)($v1)
    /* 24FA8 8015EBA0 01004224 */  addiu      $v0, $v0, 0x1
    /* 24FAC 8015EBA4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 24FB0 8015EBA8 2A104300 */  slt        $v0, $v0, $v1
    /* 24FB4 8015EBAC 44FF4014 */  bnez       $v0, .L8015E8C0
    /* 24FB8 8015EBB0 00000000 */   nop
  .L8015EBB4:
    /* 24FBC 8015EBB4 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 24FC0 8015EBB8 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 24FC4 8015EBBC 01000224 */  addiu      $v0, $zero, 0x1
    /* 24FC8 8015EBC0 43006214 */  bne        $v1, $v0, .L8015ECD0
    /* 24FCC 8015EBC4 00000000 */   nop
    /* 24FD0 8015EBC8 0D80043C */  lui        $a0, %hi(glSeedTbl + 0x3C)
    /* 24FD4 8015EBCC 98F7848C */  lw         $a0, %lo(glSeedTbl + 0x3C)($a0)
    /* 24FD8 8015EBD0 B3F6000C */  jal        SetRndSeed__Fl
    /* 24FDC 8015EBD4 00000000 */   nop
    /* 24FE0 8015EBD8 C9F6000C */  jal        ENG_random__Fl
    /* 24FE4 8015EBDC 02000424 */   addiu     $a0, $zero, 0x2
    /* 24FE8 8015EBE0 05004010 */  beqz       $v0, .L8015EBF8
    /* 24FEC 8015EBE4 00000000 */   nop
    /* 24FF0 8015EBE8 0E80013C */  lui        $at, %hi(quests + 0x106)
    /* 24FF4 8015EBEC 46DB20A0 */  sb         $zero, %lo(quests + 0x106)($at)
    /* 24FF8 8015EBF0 007B0508 */  j          .L8015EC00
    /* 24FFC 8015EBF4 00000000 */   nop
  .L8015EBF8:
    /* 25000 8015EBF8 0E80013C */  lui        $at, %hi(quests + 0xF2)
    /* 25004 8015EBFC 32DB20A0 */  sb         $zero, %lo(quests + 0xF2)($at)
  .L8015EC00:
    /* 25008 8015EC00 C9F6000C */  jal        ENG_random__Fl
    /* 2500C 8015EC04 03000424 */   addiu     $a0, $zero, 0x3
    /* 25010 8015EC08 80100200 */  sll        $v0, $v0, 2
    /* 25014 8015EC0C 0E80013C */  lui        $at, %hi(QuestGroup1)
    /* 25018 8015EC10 21082200 */  addu       $at, $at, $v0
    /* 2501C 8015EC14 1CDA238C */  lw         $v1, %lo(QuestGroup1)($at)
    /* 25020 8015EC18 00000000 */  nop
    /* 25024 8015EC1C 80100300 */  sll        $v0, $v1, 2
    /* 25028 8015EC20 21104300 */  addu       $v0, $v0, $v1
    /* 2502C 8015EC24 80100200 */  sll        $v0, $v0, 2
    /* 25030 8015EC28 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 25034 8015EC2C 21082200 */  addu       $at, $at, $v0
    /* 25038 8015EC30 42DA20A0 */  sb         $zero, %lo(quests + 0x2)($at)
    /* 2503C 8015EC34 C9F6000C */  jal        ENG_random__Fl
    /* 25040 8015EC38 03000424 */   addiu     $a0, $zero, 0x3
    /* 25044 8015EC3C 80100200 */  sll        $v0, $v0, 2
    /* 25048 8015EC40 0E80013C */  lui        $at, %hi(QuestGroup2)
    /* 2504C 8015EC44 21082200 */  addu       $at, $at, $v0
    /* 25050 8015EC48 28DA238C */  lw         $v1, %lo(QuestGroup2)($at)
    /* 25054 8015EC4C 00000000 */  nop
    /* 25058 8015EC50 80100300 */  sll        $v0, $v1, 2
    /* 2505C 8015EC54 21104300 */  addu       $v0, $v0, $v1
    /* 25060 8015EC58 80100200 */  sll        $v0, $v0, 2
    /* 25064 8015EC5C 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 25068 8015EC60 21082200 */  addu       $at, $at, $v0
    /* 2506C 8015EC64 42DA20A0 */  sb         $zero, %lo(quests + 0x2)($at)
    /* 25070 8015EC68 C9F6000C */  jal        ENG_random__Fl
    /* 25074 8015EC6C 03000424 */   addiu     $a0, $zero, 0x3
    /* 25078 8015EC70 80100200 */  sll        $v0, $v0, 2
    /* 2507C 8015EC74 0E80013C */  lui        $at, %hi(QuestGroup3)
    /* 25080 8015EC78 21082200 */  addu       $at, $at, $v0
    /* 25084 8015EC7C 34DA238C */  lw         $v1, %lo(QuestGroup3)($at)
    /* 25088 8015EC80 00000000 */  nop
    /* 2508C 8015EC84 80100300 */  sll        $v0, $v1, 2
    /* 25090 8015EC88 21104300 */  addu       $v0, $v0, $v1
    /* 25094 8015EC8C 80100200 */  sll        $v0, $v0, 2
    /* 25098 8015EC90 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 2509C 8015EC94 21082200 */  addu       $at, $at, $v0
    /* 250A0 8015EC98 42DA20A0 */  sb         $zero, %lo(quests + 0x2)($at)
    /* 250A4 8015EC9C C9F6000C */  jal        ENG_random__Fl
    /* 250A8 8015ECA0 02000424 */   addiu     $a0, $zero, 0x2
    /* 250AC 8015ECA4 80100200 */  sll        $v0, $v0, 2
    /* 250B0 8015ECA8 1280013C */  lui        $at, %hi(QuestGroup4)
    /* 250B4 8015ECAC 21082200 */  addu       $at, $at, $v0
    /* 250B8 8015ECB0 30BA238C */  lw         $v1, %lo(QuestGroup4)($at)
    /* 250BC 8015ECB4 00000000 */  nop
    /* 250C0 8015ECB8 80100300 */  sll        $v0, $v1, 2
    /* 250C4 8015ECBC 21104300 */  addu       $v0, $v0, $v1
    /* 250C8 8015ECC0 80100200 */  sll        $v0, $v0, 2
    /* 250CC 8015ECC4 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 250D0 8015ECC8 21082200 */  addu       $at, $at, $v0
    /* 250D4 8015ECCC 42DA20A0 */  sb         $zero, %lo(quests + 0x2)($at)
  .L8015ECD0:
    /* 250D8 8015ECD0 0E80023C */  lui        $v0, %hi(quests + 0xF2)
    /* 250DC 8015ECD4 32DB4290 */  lbu        $v0, %lo(quests + 0xF2)($v0)
    /* 250E0 8015ECD8 00000000 */  nop
    /* 250E4 8015ECDC 03004014 */  bnez       $v0, .L8015ECEC
    /* 250E8 8015ECE0 02000224 */   addiu     $v0, $zero, 0x2
    /* 250EC 8015ECE4 0E80013C */  lui        $at, %hi(quests + 0x100)
    /* 250F0 8015ECE8 40DB22A0 */  sb         $v0, %lo(quests + 0x100)($at)
  .L8015ECEC:
    /* 250F4 8015ECEC 0E80023C */  lui        $v0, %hi(quests + 0x2)
    /* 250F8 8015ECF0 42DA4290 */  lbu        $v0, %lo(quests + 0x2)($v0)
    /* 250FC 8015ECF4 00000000 */  nop
    /* 25100 8015ECF8 03004014 */  bnez       $v0, .L8015ED08
    /* 25104 8015ECFC 02000224 */   addiu     $v0, $zero, 0x2
    /* 25108 8015ED00 0E80013C */  lui        $at, %hi(quests + 0x10)
    /* 2510C 8015ED04 50DA22A0 */  sb         $v0, %lo(quests + 0x10)($at)
  .L8015ED08:
    /* 25110 8015ED08 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 25114 8015ED0C A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 25118 8015ED10 01000224 */  addiu      $v0, $zero, 0x1
    /* 2511C 8015ED14 0E80013C */  lui        $at, %hi(quests + 0x9B)
    /* 25120 8015ED18 DBDA22A0 */  sb         $v0, %lo(quests + 0x9B)($at)
    /* 25124 8015ED1C 01000224 */  addiu      $v0, $zero, 0x1
    /* 25128 8015ED20 05006210 */  beq        $v1, $v0, .L8015ED38
    /* 2512C 8015ED24 02000224 */   addiu     $v0, $zero, 0x2
    /* 25130 8015ED28 0E80013C */  lui        $at, %hi(quests + 0x13B)
    /* 25134 8015ED2C 7BDB22A0 */  sb         $v0, %lo(quests + 0x13B)($at)
    /* 25138 8015ED30 5E7B0508 */  j          .L8015ED78
    /* 2513C 8015ED34 00000000 */   nop
  .L8015ED38:
    /* 25140 8015ED38 21200000 */  addu       $a0, $zero, $zero
    /* 25144 8015ED3C 14000524 */  addiu      $a1, $zero, 0x14
    /* 25148 8015ED40 DAED000C */  jal        PlrHasItem__FiiRi
    /* 2514C 8015ED44 1000A627 */   addiu     $a2, $sp, 0x10
    /* 25150 8015ED48 21204000 */  addu       $a0, $v0, $zero
    /* 25154 8015ED4C 0A008010 */  beqz       $a0, .L8015ED78
    /* 25158 8015ED50 03000224 */   addiu     $v0, $zero, 0x3
    /* 2515C 8015ED54 0E80033C */  lui        $v1, %hi(quests + 0x16)
    /* 25160 8015ED58 56DA6390 */  lbu        $v1, %lo(quests + 0x16)($v1)
    /* 25164 8015ED5C 00000000 */  nop
    /* 25168 8015ED60 05006210 */  beq        $v1, $v0, .L8015ED78
    /* 2516C 8015ED64 00000000 */   nop
    /* 25170 8015ED68 2E008284 */  lh         $v0, 0x2E($a0)
    /* 25174 8015ED6C 0D80013C */  lui        $at, %hi(AllItemsUseable)
    /* 25178 8015ED70 21082200 */  addu       $at, $at, $v0
    /* 2517C 8015ED74 401B20A0 */  sb         $zero, %lo(AllItemsUseable)($at)
  .L8015ED78:
    /* 25180 8015ED78 2400BF8F */  lw         $ra, 0x24($sp)
    /* 25184 8015ED7C 2000B08F */  lw         $s0, 0x20($sp)
    /* 25188 8015ED80 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2518C 8015ED84 0800E003 */  jr         $ra
    /* 25190 8015ED88 00000000 */   nop
endlabel InitQuests__Fv
