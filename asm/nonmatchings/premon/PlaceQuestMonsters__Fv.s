.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaceQuestMonsters__Fv, 0x3C4

glabel PlaceQuestMonsters__Fv
    /* 265E0 801601D8 1280023C */  lui        $v0, %hi(setlevel)
    /* 265E4 801601DC 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 265E8 801601E0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 265EC 801601E4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 265F0 801601E8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 265F4 801601EC DD004014 */  bnez       $v0, .L80160564
    /* 265F8 801601F0 1800B0AF */   sw        $s0, 0x18($sp)
    /* 265FC 801601F4 DC9E010C */  jal        QuestStatus__Fi
    /* 26600 801601F8 06000424 */   addiu     $a0, $zero, 0x6
    /* 26604 801601FC FF004230 */  andi       $v0, $v0, 0xFF
    /* 26608 80160200 04004010 */  beqz       $v0, .L80160214
    /* 2660C 80160204 09000424 */   addiu     $a0, $zero, 0x9
    /* 26610 80160208 21280000 */  addu       $a1, $zero, $zero
    /* 26614 8016020C A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 26618 80160210 21300000 */   addu      $a2, $zero, $zero
  .L80160214:
    /* 2661C 80160214 1280033C */  lui        $v1, %hi(currlevel)
    /* 26620 80160218 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 26624 8016021C 0E80023C */  lui        $v0, %hi(quests + 0xF0)
    /* 26628 80160220 30DB4290 */  lbu        $v0, %lo(quests + 0xF0)($v0)
    /* 2662C 80160224 00000000 */  nop
    /* 26630 80160228 1E006214 */  bne        $v1, $v0, .L801602A4
    /* 26634 8016022C 01000224 */   addiu     $v0, $zero, 0x1
    /* 26638 80160230 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 2663C 80160234 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 26640 80160238 00000000 */  nop
    /* 26644 8016023C 19006210 */  beq        $v1, $v0, .L801602A4
    /* 26648 80160240 00000000 */   nop
    /* 2664C 80160244 1280023C */  lui        $v0, %hi(nummtypes)
    /* 26650 80160248 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 26654 8016024C 00000000 */  nop
    /* 26658 80160250 10004018 */  blez       $v0, .L80160294
    /* 2665C 80160254 21800000 */   addu      $s0, $zero, $zero
    /* 26660 80160258 21880000 */  addu       $s1, $zero, $zero
  .L8016025C:
    /* 26664 8016025C 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 26668 80160260 21083100 */  addu       $at, $at, $s1
    /* 2666C 80160264 CEA32490 */  lbu        $a0, %lo(Monsters + 0x12)($at)
    /* 26670 80160268 27FD010C */  jal        IsSkel__Fi
    /* 26674 8016026C 00000000 */   nop
    /* 26678 80160270 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2667C 80160274 08004014 */  bnez       $v0, .L80160298
    /* 26680 80160278 01000424 */   addiu     $a0, $zero, 0x1
    /* 26684 8016027C 1280023C */  lui        $v0, %hi(nummtypes)
    /* 26688 80160280 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 2668C 80160284 01001026 */  addiu      $s0, $s0, 0x1
    /* 26690 80160288 2A100202 */  slt        $v0, $s0, $v0
    /* 26694 8016028C F3FF4014 */  bnez       $v0, .L8016025C
    /* 26698 80160290 1C003126 */   addiu     $s1, $s1, 0x1C
  .L80160294:
    /* 2669C 80160294 01000424 */  addiu      $a0, $zero, 0x1
  .L80160298:
    /* 266A0 80160298 21280002 */  addu       $a1, $s0, $zero
    /* 266A4 8016029C A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 266A8 801602A0 1E000624 */   addiu     $a2, $zero, 0x1E
  .L801602A4:
    /* 266AC 801602A4 DC9E010C */  jal        QuestStatus__Fi
    /* 266B0 801602A8 07000424 */   addiu     $a0, $zero, 0x7
    /* 266B4 801602AC FF004230 */  andi       $v0, $v0, 0xFF
    /* 266B8 801602B0 10004010 */  beqz       $v0, .L801602F4
    /* 266BC 801602B4 00000000 */   nop
    /* 266C0 801602B8 1280043C */  lui        $a0, %hi(D_80119C10)
    /* 266C4 801602BC 109C8424 */  addiu      $a0, $a0, %lo(D_80119C10)
    /* 266C8 801602C0 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 266CC 801602C4 21280000 */   addu      $a1, $zero, $zero
    /* 266D0 801602C8 21804000 */  addu       $s0, $v0, $zero
    /* 266D4 801602CC 21200002 */  addu       $a0, $s0, $zero
    /* 266D8 801602D0 1280053C */  lui        $a1, %hi(setpc_x)
    /* 266DC 801602D4 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 266E0 801602D8 1280063C */  lui        $a2, %hi(setpc_y)
    /* 266E4 801602DC E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 266E8 801602E0 40280500 */  sll        $a1, $a1, 1
    /* 266EC 801602E4 2883050C */  jal        SetMapMonsters__FPUcii
    /* 266F0 801602E8 40300600 */   sll       $a2, $a2, 1
    /* 266F4 801602EC F7F6000C */  jal        mem_free_dbg__FPv
    /* 266F8 801602F0 21200002 */   addu      $a0, $s0, $zero
  .L801602F4:
    /* 266FC 801602F4 DC9E010C */  jal        QuestStatus__Fi
    /* 26700 801602F8 09000424 */   addiu     $a0, $zero, 0x9
    /* 26704 801602FC FF004230 */  andi       $v0, $v0, 0xFF
    /* 26708 80160300 10004010 */  beqz       $v0, .L80160344
    /* 2670C 80160304 00000000 */   nop
    /* 26710 80160308 1280043C */  lui        $a0, %hi(D_80119C2C)
    /* 26714 8016030C 2C9C8424 */  addiu      $a0, $a0, %lo(D_80119C2C)
    /* 26718 80160310 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 2671C 80160314 21280000 */   addu      $a1, $zero, $zero
    /* 26720 80160318 21804000 */  addu       $s0, $v0, $zero
    /* 26724 8016031C 21200002 */  addu       $a0, $s0, $zero
    /* 26728 80160320 1280053C */  lui        $a1, %hi(setpc_x)
    /* 2672C 80160324 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 26730 80160328 1280063C */  lui        $a2, %hi(setpc_y)
    /* 26734 8016032C E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 26738 80160330 40280500 */  sll        $a1, $a1, 1
    /* 2673C 80160334 2883050C */  jal        SetMapMonsters__FPUcii
    /* 26740 80160338 40300600 */   sll       $a2, $a2, 1
    /* 26744 8016033C F7F6000C */  jal        mem_free_dbg__FPv
    /* 26748 80160340 21200002 */   addu      $a0, $s0, $zero
  .L80160344:
    /* 2674C 80160344 DC9E010C */  jal        QuestStatus__Fi
    /* 26750 80160348 08000424 */   addiu     $a0, $zero, 0x8
    /* 26754 8016034C FF004230 */  andi       $v0, $v0, 0xFF
    /* 26758 80160350 10004010 */  beqz       $v0, .L80160394
    /* 2675C 80160354 00000000 */   nop
    /* 26760 80160358 1280043C */  lui        $a0, %hi(D_80119C48)
    /* 26764 8016035C 489C8424 */  addiu      $a0, $a0, %lo(D_80119C48)
    /* 26768 80160360 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 2676C 80160364 21280000 */   addu      $a1, $zero, $zero
    /* 26770 80160368 21804000 */  addu       $s0, $v0, $zero
    /* 26774 8016036C 21200002 */  addu       $a0, $s0, $zero
    /* 26778 80160370 1280053C */  lui        $a1, %hi(setpc_x)
    /* 2677C 80160374 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 26780 80160378 1280063C */  lui        $a2, %hi(setpc_y)
    /* 26784 8016037C E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 26788 80160380 40280500 */  sll        $a1, $a1, 1
    /* 2678C 80160384 2883050C */  jal        SetMapMonsters__FPUcii
    /* 26790 80160388 40300600 */   sll       $a2, $a2, 1
    /* 26794 8016038C F7F6000C */  jal        mem_free_dbg__FPv
    /* 26798 80160390 21200002 */   addu      $a0, $s0, $zero
  .L80160394:
    /* 2679C 80160394 DC9E010C */  jal        QuestStatus__Fi
    /* 267A0 80160398 0A000424 */   addiu     $a0, $zero, 0xA
    /* 267A4 8016039C FF004230 */  andi       $v0, $v0, 0xFF
    /* 267A8 801603A0 12004010 */  beqz       $v0, .L801603EC
    /* 267AC 801603A4 00000000 */   nop
    /* 267B0 801603A8 1280043C */  lui        $a0, %hi(D_80119C64)
    /* 267B4 801603AC 649C8424 */  addiu      $a0, $a0, %lo(D_80119C64)
    /* 267B8 801603B0 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 267BC 801603B4 21280000 */   addu      $a1, $zero, $zero
    /* 267C0 801603B8 21804000 */  addu       $s0, $v0, $zero
    /* 267C4 801603BC 21200002 */  addu       $a0, $s0, $zero
    /* 267C8 801603C0 1280053C */  lui        $a1, %hi(setpc_x)
    /* 267CC 801603C4 E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 267D0 801603C8 1280063C */  lui        $a2, %hi(setpc_y)
    /* 267D4 801603CC E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 267D8 801603D0 0100A524 */  addiu      $a1, $a1, 0x1
    /* 267DC 801603D4 40280500 */  sll        $a1, $a1, 1
    /* 267E0 801603D8 0100C624 */  addiu      $a2, $a2, 0x1
    /* 267E4 801603DC 2883050C */  jal        SetMapMonsters__FPUcii
    /* 267E8 801603E0 40300600 */   sll       $a2, $a2, 1
    /* 267EC 801603E4 F7F6000C */  jal        mem_free_dbg__FPv
    /* 267F0 801603E8 21200002 */   addu      $a0, $s0, $zero
  .L801603EC:
    /* 267F4 801603EC DC9E010C */  jal        QuestStatus__Fi
    /* 267F8 801603F0 0B000424 */   addiu     $a0, $zero, 0xB
    /* 267FC 801603F4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 26800 801603F8 14004010 */  beqz       $v0, .L8016044C
    /* 26804 801603FC 00000000 */   nop
    /* 26808 80160400 1280043C */  lui        $a0, %hi(D_80119C7C)
    /* 2680C 80160404 7C9C8424 */  addiu      $a0, $a0, %lo(D_80119C7C)
    /* 26810 80160408 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 26814 8016040C 21280000 */   addu      $a1, $zero, $zero
    /* 26818 80160410 21804000 */  addu       $s0, $v0, $zero
    /* 2681C 80160414 21200002 */  addu       $a0, $s0, $zero
    /* 26820 80160418 1280053C */  lui        $a1, %hi(setpc_x)
    /* 26824 8016041C E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 26828 80160420 1280063C */  lui        $a2, %hi(setpc_y)
    /* 2682C 80160424 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 26830 80160428 40280500 */  sll        $a1, $a1, 1
    /* 26834 8016042C 2883050C */  jal        SetMapMonsters__FPUcii
    /* 26838 80160430 40300600 */   sll       $a2, $a2, 1
    /* 2683C 80160434 F7F6000C */  jal        mem_free_dbg__FPv
    /* 26840 80160438 21200002 */   addu      $a0, $s0, $zero
    /* 26844 8016043C 1180043C */  lui        $a0, %hi(UniqMonst + 0xC0)
    /* 26848 80160440 C8C78480 */  lb         $a0, %lo(UniqMonst + 0xC0)($a0)
    /* 2684C 80160444 637E050C */  jal        AddMonsterType__Fii
    /* 26850 80160448 01000524 */   addiu     $a1, $zero, 0x1
  .L8016044C:
    /* 26854 8016044C DC9E010C */  jal        QuestStatus__Fi
    /* 26858 80160450 04000424 */   addiu     $a0, $zero, 0x4
    /* 2685C 80160454 FF004230 */  andi       $v0, $v0, 0xFF
    /* 26860 80160458 05004010 */  beqz       $v0, .L80160470
    /* 26864 8016045C 00000000 */   nop
    /* 26868 80160460 1180043C */  lui        $a0, %hi(UniqMonst + 0xA8)
    /* 2686C 80160464 B0C78480 */  lb         $a0, %lo(UniqMonst + 0xA8)($a0)
    /* 26870 80160468 637E050C */  jal        AddMonsterType__Fii
    /* 26874 8016046C 01000524 */   addiu     $a1, $zero, 0x1
  .L80160470:
    /* 26878 80160470 DC9E010C */  jal        QuestStatus__Fi
    /* 2687C 80160474 03000424 */   addiu     $a0, $zero, 0x3
    /* 26880 80160478 FF004230 */  andi       $v0, $v0, 0xFF
    /* 26884 8016047C 08004010 */  beqz       $v0, .L801604A0
    /* 26888 80160480 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 2688C 80160484 1280033C */  lui        $v1, %hi(zharlib)
    /* 26890 80160488 90C1638C */  lw         $v1, %lo(zharlib)($v1)
    /* 26894 8016048C 00000000 */  nop
    /* 26898 80160490 03006214 */  bne        $v1, $v0, .L801604A0
    /* 2689C 80160494 00000000 */   nop
    /* 268A0 80160498 0E80013C */  lui        $at, %hi(quests + 0x3E)
    /* 268A4 8016049C 7EDA20A0 */  sb         $zero, %lo(quests + 0x3E)($at)
  .L801604A0:
    /* 268A8 801604A0 1280033C */  lui        $v1, %hi(currlevel)
    /* 268AC 801604A4 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 268B0 801604A8 0E80023C */  lui        $v0, %hi(quests + 0x12C)
    /* 268B4 801604AC 6CDB4290 */  lbu        $v0, %lo(quests + 0x12C)($v0)
    /* 268B8 801604B0 00000000 */  nop
    /* 268BC 801604B4 33006214 */  bne        $v1, $v0, .L80160584
    /* 268C0 801604B8 01000224 */   addiu     $v0, $zero, 0x1
    /* 268C4 801604BC 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 268C8 801604C0 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 268CC 801604C4 00000000 */  nop
    /* 268D0 801604C8 2E006210 */  beq        $v1, $v0, .L80160584
    /* 268D4 801604CC 00000000 */   nop
    /* 268D8 801604D0 1180043C */  lui        $a0, %hi(UniqMonst + 0x60)
    /* 268DC 801604D4 68C78480 */  lb         $a0, %lo(UniqMonst + 0x60)($a0)
    /* 268E0 801604D8 637E050C */  jal        AddMonsterType__Fii
    /* 268E4 801604DC 04000524 */   addiu     $a1, $zero, 0x4
    /* 268E8 801604E0 1180043C */  lui        $a0, %hi(UniqMonst + 0x78)
    /* 268EC 801604E4 80C78480 */  lb         $a0, %lo(UniqMonst + 0x78)($a0)
    /* 268F0 801604E8 637E050C */  jal        AddMonsterType__Fii
    /* 268F4 801604EC 04000524 */   addiu     $a1, $zero, 0x4
    /* 268F8 801604F0 04000424 */  addiu      $a0, $zero, 0x4
    /* 268FC 801604F4 21280000 */  addu       $a1, $zero, $zero
    /* 26900 801604F8 A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 26904 801604FC 21300000 */   addu      $a2, $zero, $zero
    /* 26908 80160500 05000424 */  addiu      $a0, $zero, 0x5
    /* 2690C 80160504 21280000 */  addu       $a1, $zero, $zero
    /* 26910 80160508 A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 26914 8016050C 21300000 */   addu      $a2, $zero, $zero
    /* 26918 80160510 06000424 */  addiu      $a0, $zero, 0x6
    /* 2691C 80160514 21280000 */  addu       $a1, $zero, $zero
    /* 26920 80160518 A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 26924 8016051C 21300000 */   addu      $a2, $zero, $zero
    /* 26928 80160520 1280043C */  lui        $a0, %hi(D_80119C98)
    /* 2692C 80160524 989C8424 */  addiu      $a0, $a0, %lo(D_80119C98)
    /* 26930 80160528 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 26934 8016052C 21280000 */   addu      $a1, $zero, $zero
    /* 26938 80160530 21804000 */  addu       $s0, $v0, $zero
    /* 2693C 80160534 21200002 */  addu       $a0, $s0, $zero
    /* 26940 80160538 1280053C */  lui        $a1, %hi(setpc_x)
    /* 26944 8016053C E4C0A58C */  lw         $a1, %lo(setpc_x)($a1)
    /* 26948 80160540 1280063C */  lui        $a2, %hi(setpc_y)
    /* 2694C 80160544 E8C0C68C */  lw         $a2, %lo(setpc_y)($a2)
    /* 26950 80160548 40280500 */  sll        $a1, $a1, 1
    /* 26954 8016054C 2883050C */  jal        SetMapMonsters__FPUcii
    /* 26958 80160550 40300600 */   sll       $a2, $a2, 1
    /* 2695C 80160554 F7F6000C */  jal        mem_free_dbg__FPv
    /* 26960 80160558 21200002 */   addu      $a0, $s0, $zero
    /* 26964 8016055C 61810508 */  j          .L80160584
    /* 26968 80160560 00000000 */   nop
  .L80160564:
    /* 2696C 80160564 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 26970 80160568 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 26974 8016056C 01000224 */  addiu      $v0, $zero, 0x1
    /* 26978 80160570 04006214 */  bne        $v1, $v0, .L80160584
    /* 2697C 80160574 01000424 */   addiu     $a0, $zero, 0x1
    /* 26980 80160578 21280000 */  addu       $a1, $zero, $zero
    /* 26984 8016057C A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 26988 80160580 21300000 */   addu      $a2, $zero, $zero
  .L80160584:
    /* 2698C 80160584 2000BF8F */  lw         $ra, 0x20($sp)
    /* 26990 80160588 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 26994 8016058C 1800B08F */  lw         $s0, 0x18($sp)
    /* 26998 80160590 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2699C 80160594 0800E003 */  jr         $ra
    /* 269A0 80160598 00000000 */   nop
endlabel PlaceQuestMonsters__Fv
