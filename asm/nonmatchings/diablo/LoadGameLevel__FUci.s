.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadGameLevel__FUci, 0x938

glabel LoadGameLevel__FUci
    /* 29270 80039270 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 29274 80039274 2400B3AF */  sw         $s3, 0x24($sp)
    /* 29278 80039278 2198A000 */  addu       $s3, $a1, $zero
    /* 2927C 8003927C 2800B4AF */  sw         $s4, 0x28($sp)
    /* 29280 80039280 21A08000 */  addu       $s4, $a0, $zero
    /* 29284 80039284 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 29288 80039288 2000B2AF */  sw         $s2, 0x20($sp)
    /* 2928C 8003928C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 29290 80039290 F809020C */  jal        AllocdPiece__Fv
    /* 29294 80039294 1800B0AF */   sw        $s0, 0x18($sp)
    /* 29298 80039298 AA20020C */  jal        Tmalloc__Fi
    /* 2929C 8003929C 40060424 */   addiu     $a0, $zero, 0x640
    /* 292A0 800392A0 1C10838F */  lw         $v1, %gp_rel(setseed)($gp)
    /* 292A4 800392A4 1280013C */  lui        $at, %hi(mydflags)
    /* 292A8 800392A8 D8C022AC */  sw         $v0, %lo(mydflags)($at)
    /* 292AC 800392AC 08006010 */  beqz       $v1, .L800392D0
    /* 292B0 800392B0 00000000 */   nop
    /* 292B4 800392B4 1280023C */  lui        $v0, %hi(currlevel)
    /* 292B8 800392B8 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 292BC 800392BC 00000000 */  nop
    /* 292C0 800392C0 80100200 */  sll        $v0, $v0, 2
    /* 292C4 800392C4 0D80013C */  lui        $at, %hi(glSeedTbl)
    /* 292C8 800392C8 21082200 */  addu       $at, $at, $v0
    /* 292CC 800392CC 5CF723AC */  sw         $v1, %lo(glSeedTbl)($at)
  .L800392D0:
    /* 292D0 800392D0 94DF010C */  jal        music_stop__Fv
    /* 292D4 800392D4 FF009132 */   andi      $s1, $s4, 0xFF
    /* 292D8 800392D8 E8DD000C */  jal        SetCursor__Fi
    /* 292DC 800392DC 01000424 */   addiu     $a0, $zero, 0x1
    /* 292E0 800392E0 1280023C */  lui        $v0, %hi(currlevel)
    /* 292E4 800392E4 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 292E8 800392E8 00000000 */  nop
    /* 292EC 800392EC 80100200 */  sll        $v0, $v0, 2
    /* 292F0 800392F0 0D80013C */  lui        $at, %hi(glSeedTbl)
    /* 292F4 800392F4 21082200 */  addu       $at, $at, $v0
    /* 292F8 800392F8 5CF7248C */  lw         $a0, %lo(glSeedTbl)($at)
    /* 292FC 800392FC B3F6000C */  jal        SetRndSeed__Fl
    /* 29300 80039300 00000000 */   nop
    /* 29304 80039304 1280043C */  lui        $a0, %hi(currlevel)
    /* 29308 80039308 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 2930C 8003930C 2E69020C */  jal        SND_LoadBank__Fi
    /* 29310 80039310 00000000 */   nop
    /* 29314 80039314 9E34010C */  jal        MakeLightTable__Fv
    /* 29318 80039318 00000000 */   nop
    /* 2931C 8003931C 4CE2000C */  jal        LoadLvlGFX__Fv
    /* 29320 80039320 00000000 */   nop
    /* 29324 80039324 3DE3000C */  jal        ClearOutDungeonMap__Fv
    /* 29328 80039328 00000000 */   nop
    /* 2932C 8003932C 0D80103C */  lui        $s0, %hi(glSeedTbl)
    /* 29330 80039330 5CF71026 */  addiu      $s0, $s0, %lo(glSeedTbl)
    /* 29334 80039334 0B002012 */  beqz       $s1, .L80039364
    /* 29338 80039338 00000000 */   nop
    /* 2933C 8003933C 1C7D050C */  jal        func_8015F470
    /* 29340 80039340 00000000 */   nop
    /* 29344 80039344 93F8000C */  jal        InitItemGFX__Fv
    /* 29348 80039348 00000000 */   nop
    /* 2934C 8003934C 5936010C */  jal        InitQuestText__Fv
    /* 29350 80039350 00000000 */   nop
    /* 29354 80039354 378B050C */  jal        func_80162CDC
    /* 29358 80039358 00000000 */   nop
    /* 2935C 8003935C AF7D050C */  jal        func_8015F6BC
    /* 29360 80039360 00000000 */   nop
  .L80039364:
    /* 29364 80039364 1280023C */  lui        $v0, %hi(currlevel)
    /* 29368 80039368 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 2936C 8003936C 00000000 */  nop
    /* 29370 80039370 80100200 */  sll        $v0, $v0, 2
    /* 29374 80039374 21105000 */  addu       $v0, $v0, $s0
    /* 29378 80039378 0000448C */  lw         $a0, 0x0($v0)
    /* 2937C 8003937C B3F6000C */  jal        SetRndSeed__Fl
    /* 29380 80039380 00000000 */   nop
    /* 29384 80039384 1280023C */  lui        $v0, %hi(leveltype)
    /* 29388 80039388 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 2938C 8003938C 00000000 */  nop
    /* 29390 80039390 03004014 */  bnez       $v0, .L800393A0
    /* 29394 80039394 00000000 */   nop
    /* 29398 80039398 748B050C */  jal        func_80162DD0
    /* 2939C 8003939C 00000000 */   nop
  .L800393A0:
    /* 293A0 800393A0 317D050C */  jal        func_8015F4C4
    /* 293A4 800393A4 00000000 */   nop
    /* 293A8 800393A8 A934010C */  jal        InitLighting__Fv
    /* 293AC 800393AC 00000000 */   nop
    /* 293B0 800393B0 5535010C */  jal        InitVision__Fv
    /* 293B4 800393B4 00000000 */   nop
    /* 293B8 800393B8 207F050C */  jal        func_8015FC80
    /* 293BC 800393BC 00000000 */   nop
    /* 293C0 800393C0 1280023C */  lui        $v0, %hi(setlevel)
    /* 293C4 800393C4 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 293C8 800393C8 00000000 */  nop
    /* 293CC 800393CC 20014014 */  bnez       $v0, .L80039850
    /* 293D0 800393D0 00000000 */   nop
    /* 293D4 800393D4 A6E2000C */  jal        CreateLevel__Fi
    /* 293D8 800393D8 21206002 */   addu      $a0, $s3, $zero
    /* 293DC 800393DC B767050C */  jal        func_80159EDC
    /* 293E0 800393E0 00000000 */   nop
    /* 293E4 800393E4 1280023C */  lui        $v0, %hi(currlevel)
    /* 293E8 800393E8 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 293EC 800393EC 00000000 */  nop
    /* 293F0 800393F0 80100200 */  sll        $v0, $v0, 2
    /* 293F4 800393F4 21105000 */  addu       $v0, $v0, $s0
    /* 293F8 800393F8 0000448C */  lw         $a0, 0x0($v0)
    /* 293FC 800393FC B3F6000C */  jal        SetRndSeed__Fl
    /* 29400 80039400 00000000 */   nop
    /* 29404 80039404 1280023C */  lui        $v0, %hi(leveltype)
    /* 29408 80039408 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 2940C 8003940C 00000000 */  nop
    /* 29410 80039410 10004010 */  beqz       $v0, .L80039454
    /* 29414 80039414 03000224 */   addiu     $v0, $zero, 0x3
    /* 29418 80039418 417F050C */  jal        func_8015FD04
    /* 2941C 8003941C 00000000 */   nop
    /* 29420 80039420 1280023C */  lui        $v0, %hi(currlevel)
    /* 29424 80039424 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 29428 80039428 00000000 */  nop
    /* 2942C 8003942C 80100200 */  sll        $v0, $v0, 2
    /* 29430 80039430 21105000 */  addu       $v0, $v0, $s0
    /* 29434 80039434 0000448C */  lw         $a0, 0x0($v0)
    /* 29438 80039438 B3F6000C */  jal        SetRndSeed__Fl
    /* 2943C 8003943C 00000000 */   nop
    /* 29440 80039440 6072050C */  jal        func_8015C980
    /* 29444 80039444 00000000 */   nop
    /* 29448 80039448 9EE2000C */  jal        LoadAllGFX__Fv
    /* 2944C 8003944C 00000000 */   nop
    /* 29450 80039450 03000224 */  addiu      $v0, $zero, 0x3
  .L80039454:
    /* 29454 80039454 04006216 */  bne        $s3, $v0, .L80039468
    /* 29458 80039458 05000224 */   addiu     $v0, $zero, 0x5
    /* 2945C 8003945C B7A0010C */  jal        GetReturnLvlPos__Fv
    /* 29460 80039460 00000000 */   nop
    /* 29464 80039464 05000224 */  addiu      $v0, $zero, 0x5
  .L80039468:
    /* 29468 80039468 14006216 */  bne        $s3, $v0, .L800394BC
    /* 2946C 8003946C 00000000 */   nop
    /* 29470 80039470 5505020C */  jal        GetPortalLvlPos__Fv
    /* 29474 80039474 00000000 */   nop
    /* 29478 80039478 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 2947C 8003947C 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 29480 80039480 00000000 */  nop
    /* 29484 80039484 0D004010 */  beqz       $v0, .L800394BC
    /* 29488 80039488 00000000 */   nop
    /* 2948C 8003948C 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 29490 80039490 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 29494 80039494 00000000 */  nop
    /* 29498 80039498 08004010 */  beqz       $v0, .L800394BC
    /* 2949C 8003949C 21200000 */   addu      $a0, $zero, $zero
    /* 294A0 800394A0 1280053C */  lui        $a1, %hi(ViewX)
    /* 294A4 800394A4 14C1A58C */  lw         $a1, %lo(ViewX)($a1)
    /* 294A8 800394A8 1280063C */  lui        $a2, %hi(ViewY)
    /* 294AC 800394AC 18C1C68C */  lw         $a2, %lo(ViewY)($a2)
    /* 294B0 800394B0 C0280500 */  sll        $a1, $a1, 3
    /* 294B4 800394B4 10E1010C */  jal        WorldToOffset__Fiii
    /* 294B8 800394B8 C0300600 */   sll       $a2, $a2, 3
  .L800394BC:
    /* 294BC 800394BC 1299010C */  jal        PlayDungMsgs__Fv
    /* 294C0 800394C0 21800000 */   addu      $s0, $zero, $zero
    /* 294C4 800394C4 1183010C */  jal        InitMultiView__Fv
    /* 294C8 800394C8 00000000 */   nop
    /* 294CC 800394CC 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 294D0 800394D0 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 294D4 800394D4 00000000 */  nop
    /* 294D8 800394D8 1B004004 */  bltz       $v0, .L80039548
    /* 294DC 800394DC 21300000 */   addu      $a2, $zero, $zero
    /* 294E0 800394E0 1280083C */  lui        $t0, %hi(currlevel)
    /* 294E4 800394E4 0CC10891 */  lbu        $t0, %lo(currlevel)($t0)
    /* 294E8 800394E8 21384000 */  addu       $a3, $v0, $zero
    /* 294EC 800394EC 0E80053C */  lui        $a1, %hi(plr + 0x166)
    /* 294F0 800394F0 9EA6A524 */  addiu      $a1, $a1, %lo(plr + 0x166)
    /* 294F4 800394F4 21200000 */  addu       $a0, $zero, $zero
  .L800394F8:
    /* 294F8 800394F8 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 294FC 800394FC 21082400 */  addu       $at, $at, $a0
    /* 29500 80039500 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 29504 80039504 00000000 */  nop
    /* 29508 80039508 0A004010 */  beqz       $v0, .L80039534
    /* 2950C 8003950C FF00C230 */   andi      $v0, $a2, 0xFF
    /* 29510 80039510 06004014 */  bnez       $v0, .L8003952C
    /* 29514 80039514 21180000 */   addu      $v1, $zero, $zero
    /* 29518 80039518 2110A800 */  addu       $v0, $a1, $t0
    /* 2951C 8003951C 00004290 */  lbu        $v0, 0x0($v0)
    /* 29520 80039520 00000000 */  nop
    /* 29524 80039524 03004010 */  beqz       $v0, .L80039534
    /* 29528 80039528 21306000 */   addu      $a2, $v1, $zero
  .L8003952C:
    /* 2952C 8003952C 01000324 */  addiu      $v1, $zero, 0x1
    /* 29530 80039530 21306000 */  addu       $a2, $v1, $zero
  .L80039534:
    /* 29534 80039534 E819A524 */  addiu      $a1, $a1, 0x19E8
    /* 29538 80039538 01001026 */  addiu      $s0, $s0, 0x1
    /* 2953C 8003953C 2A10F000 */  slt        $v0, $a3, $s0
    /* 29540 80039540 EDFF4010 */  beqz       $v0, .L800394F8
    /* 29544 80039544 E8198424 */   addiu     $a0, $a0, 0x19E8
  .L80039548:
    /* 29548 80039548 1280023C */  lui        $v0, %hi(currlevel)
    /* 2954C 8003954C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 29550 80039550 00000000 */  nop
    /* 29554 80039554 80100200 */  sll        $v0, $v0, 2
    /* 29558 80039558 0D80013C */  lui        $at, %hi(glSeedTbl)
    /* 2955C 8003955C 21082200 */  addu       $at, $at, $v0
    /* 29560 80039560 5CF7248C */  lw         $a0, %lo(glSeedTbl)($at)
    /* 29564 80039564 B3F6000C */  jal        SetRndSeed__Fl
    /* 29568 80039568 00000000 */   nop
    /* 2956C 8003956C 1280023C */  lui        $v0, %hi(leveltype)
    /* 29570 80039570 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 29574 80039574 00000000 */  nop
    /* 29578 80039578 79004010 */  beqz       $v0, .L80039760
    /* 2957C 8003957C 21280000 */   addu      $a1, $zero, $zero
    /* 29580 80039580 5DE4000C */  jal        Lsaveplrpos__Fv
    /* 29584 80039584 00000000 */   nop
    /* 29588 80039588 FF008232 */  andi       $v0, $s4, 0xFF
    /* 2958C 8003958C 38004014 */  bnez       $v0, .L80039670
    /* 29590 80039590 04000524 */   addiu     $a1, $zero, 0x4
    /* 29594 80039594 18006512 */  beq        $s3, $a1, .L800395F8
    /* 29598 80039598 00000000 */   nop
    /* 2959C 8003959C 1280033C */  lui        $v1, %hi(myplr)
    /* 295A0 800395A0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 295A4 800395A4 1280043C */  lui        $a0, %hi(currlevel)
    /* 295A8 800395A8 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 295AC 800395AC 40100300 */  sll        $v0, $v1, 1
    /* 295B0 800395B0 21104300 */  addu       $v0, $v0, $v1
    /* 295B4 800395B4 80100200 */  sll        $v0, $v0, 2
    /* 295B8 800395B8 21104300 */  addu       $v0, $v0, $v1
    /* 295BC 800395BC 00110200 */  sll        $v0, $v0, 4
    /* 295C0 800395C0 23104300 */  subu       $v0, $v0, $v1
    /* 295C4 800395C4 80100200 */  sll        $v0, $v0, 2
    /* 295C8 800395C8 21104300 */  addu       $v0, $v0, $v1
    /* 295CC 800395CC C0100200 */  sll        $v0, $v0, 3
    /* 295D0 800395D0 0E80033C */  lui        $v1, %hi(plr + 0x166)
    /* 295D4 800395D4 9EA66324 */  addiu      $v1, $v1, %lo(plr + 0x166)
    /* 295D8 800395D8 21104300 */  addu       $v0, $v0, $v1
    /* 295DC 800395DC 21104400 */  addu       $v0, $v0, $a0
    /* 295E0 800395E0 00004290 */  lbu        $v0, 0x0($v0)
    /* 295E4 800395E4 00000000 */  nop
    /* 295E8 800395E8 03004014 */  bnez       $v0, .L800395F8
    /* 295EC 800395EC 00000000 */   nop
    /* 295F0 800395F0 1F006516 */  bne        $s3, $a1, .L80039670
    /* 295F4 800395F4 00000000 */   nop
  .L800395F8:
    /* 295F8 800395F8 3373050C */  jal        func_8015CCCC
    /* 295FC 800395FC 00000000 */   nop
    /* 29600 80039600 B7F6000C */  jal        GetRndSeed__Fv
    /* 29604 80039604 00000000 */   nop
    /* 29608 80039608 1F0A020C */  jal        ConvertdPiece__Fv
    /* 2960C 8003960C 00000000 */   nop
    /* 29610 80039610 B583050C */  jal        func_80160ED4
    /* 29614 80039614 00000000 */   nop
    /* 29618 80039618 B7F6000C */  jal        GetRndSeed__Fv
    /* 2961C 8003961C 00000000 */   nop
    /* 29620 80039620 7565050C */  jal        func_801595D4
    /* 29624 80039624 00000000 */   nop
    /* 29628 80039628 3EF9000C */  jal        InitItems__Fb
    /* 2962C 8003962C 21200000 */   addu      $a0, $zero, $zero
    /* 29630 80039630 6679050C */  jal        func_8015E598
    /* 29634 80039634 00000000 */   nop
    /* 29638 80039638 B7F6000C */  jal        GetRndSeed__Fv
    /* 2963C 8003963C 00000000 */   nop
    /* 29640 80039640 F787050C */  jal        func_80161FDC
    /* 29644 80039644 00000000 */   nop
    /* 29648 80039648 62DF000C */  jal        InitDead__Fv
    /* 2964C 8003964C 00000000 */   nop
    /* 29650 80039650 BDE3000C */  jal        AddQuestItems__Fv
    /* 29654 80039654 00000000 */   nop
    /* 29658 80039658 B7F6000C */  jal        GetRndSeed__Fv
    /* 2965C 8003965C 00000000 */   nop
    /* 29660 80039660 158C050C */  jal        func_80163054
    /* 29664 80039664 00000000 */   nop
    /* 29668 80039668 D2E50008 */  j          .L80039748
    /* 2966C 8003966C 00000000 */   nop
  .L80039670:
    /* 29670 80039670 3373050C */  jal        func_8015CCCC
    /* 29674 80039674 00000000 */   nop
    /* 29678 80039678 B7F6000C */  jal        GetRndSeed__Fv
    /* 2967C 8003967C 00000000 */   nop
    /* 29680 80039680 1280033C */  lui        $v1, %hi(currlevel)
    /* 29684 80039684 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 29688 80039688 00000000 */  nop
    /* 2968C 8003968C 80180300 */  sll        $v1, $v1, 2
    /* 29690 80039690 1380013C */  lui        $at, %hi(D_8012EB38)
    /* 29694 80039694 21082300 */  addu       $at, $at, $v1
    /* 29698 80039698 38EB22AC */  sw         $v0, %lo(D_8012EB38)($at)
    /* 2969C 8003969C 1F0A020C */  jal        ConvertdPiece__Fv
    /* 296A0 800396A0 00000000 */   nop
    /* 296A4 800396A4 B583050C */  jal        func_80160ED4
    /* 296A8 800396A8 00000000 */   nop
    /* 296AC 800396AC B7F6000C */  jal        GetRndSeed__Fv
    /* 296B0 800396B0 00000000 */   nop
    /* 296B4 800396B4 1280033C */  lui        $v1, %hi(currlevel)
    /* 296B8 800396B8 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 296BC 800396BC 00000000 */  nop
    /* 296C0 800396C0 80180300 */  sll        $v1, $v1, 2
    /* 296C4 800396C4 1380013C */  lui        $at, %hi(D_8012EB88)
    /* 296C8 800396C8 21082300 */  addu       $at, $at, $v1
    /* 296CC 800396CC 88EB22AC */  sw         $v0, %lo(D_8012EB88)($at)
    /* 296D0 800396D0 7565050C */  jal        func_801595D4
    /* 296D4 800396D4 00000000 */   nop
    /* 296D8 800396D8 3EF9000C */  jal        InitItems__Fb
    /* 296DC 800396DC 01000424 */   addiu     $a0, $zero, 0x1
    /* 296E0 800396E0 6679050C */  jal        func_8015E598
    /* 296E4 800396E4 00000000 */   nop
    /* 296E8 800396E8 B7F6000C */  jal        GetRndSeed__Fv
    /* 296EC 800396EC 00000000 */   nop
    /* 296F0 800396F0 1280033C */  lui        $v1, %hi(currlevel)
    /* 296F4 800396F4 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 296F8 800396F8 00000000 */  nop
    /* 296FC 800396FC 80180300 */  sll        $v1, $v1, 2
    /* 29700 80039700 1380013C */  lui        $at, %hi(D_8012EBD8)
    /* 29704 80039704 21082300 */  addu       $at, $at, $v1
    /* 29708 80039708 D8EB22AC */  sw         $v0, %lo(D_8012EBD8)($at)
    /* 2970C 8003970C F787050C */  jal        func_80161FDC
    /* 29710 80039710 00000000 */   nop
    /* 29714 80039714 62DF000C */  jal        InitDead__Fv
    /* 29718 80039718 00000000 */   nop
    /* 2971C 8003971C BDE3000C */  jal        AddQuestItems__Fv
    /* 29720 80039720 00000000 */   nop
    /* 29724 80039724 B7F6000C */  jal        GetRndSeed__Fv
    /* 29728 80039728 00000000 */   nop
    /* 2972C 8003972C 1280033C */  lui        $v1, %hi(currlevel)
    /* 29730 80039730 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 29734 80039734 00000000 */  nop
    /* 29738 80039738 80180300 */  sll        $v1, $v1, 2
    /* 2973C 8003973C 1380013C */  lui        $at, %hi(D_8012EAE8)
    /* 29740 80039740 21082300 */  addu       $at, $at, $v1
    /* 29744 80039744 E8EA22AC */  sw         $v0, %lo(D_8012EAE8)($at)
  .L80039748:
    /* 29748 80039748 5335010C */  jal        SavePreLighting__Fv
    /* 2974C 8003974C 00000000 */   nop
    /* 29750 80039750 88E4000C */  jal        Lrestoreplrpos__Fv
    /* 29754 80039754 00000000 */   nop
    /* 29758 80039758 10E60008 */  j          .L80039840
    /* 2975C 8003975C 00000000 */   nop
  .L80039760:
    /* 29760 80039760 21800000 */  addu       $s0, $zero, $zero
  .L80039764:
    /* 29764 80039764 21200000 */  addu       $a0, $zero, $zero
    /* 29768 80039768 2118A000 */  addu       $v1, $a1, $zero
  .L8003976C:
    /* 2976C 8003976C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 29770 80039770 21082300 */  addu       $at, $at, $v1
    /* 29774 80039774 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 29778 80039778 01008424 */  addiu      $a0, $a0, 0x1
    /* 2977C 8003977C 03004234 */  ori        $v0, $v0, 0x3
    /* 29780 80039780 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 29784 80039784 21082300 */  addu       $at, $at, $v1
    /* 29788 80039788 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 2978C 8003978C 60008228 */  slti       $v0, $a0, 0x60
    /* 29790 80039790 F6FF4014 */  bnez       $v0, .L8003976C
    /* 29794 80039794 08006324 */   addiu     $v1, $v1, 0x8
    /* 29798 80039798 01001026 */  addiu      $s0, $s0, 0x1
    /* 2979C 8003979C 6000022A */  slti       $v0, $s0, 0x60
    /* 297A0 800397A0 F0FF4014 */  bnez       $v0, .L80039764
    /* 297A4 800397A4 8003A524 */   addiu     $a1, $a1, 0x380
    /* 297A8 800397A8 F6EB000C */  jal        InitTowners__Fv
    /* 297AC 800397AC 00000000 */   nop
    /* 297B0 800397B0 3EF9000C */  jal        InitItems__Fb
    /* 297B4 800397B4 01000424 */   addiu     $a0, $zero, 0x1
    /* 297B8 800397B8 F787050C */  jal        func_80161FDC
    /* 297BC 800397BC 00000000 */   nop
    /* 297C0 800397C0 D9B1020C */  jal        InitBird__Fv
    /* 297C4 800397C4 00000000 */   nop
    /* 297C8 800397C8 FF008232 */  andi       $v0, $s4, 0xFF
    /* 297CC 800397CC 1C004014 */  bnez       $v0, .L80039840
    /* 297D0 800397D0 04000524 */   addiu     $a1, $zero, 0x4
    /* 297D4 800397D4 18006512 */  beq        $s3, $a1, .L80039838
    /* 297D8 800397D8 00000000 */   nop
    /* 297DC 800397DC 1280033C */  lui        $v1, %hi(myplr)
    /* 297E0 800397E0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 297E4 800397E4 1280043C */  lui        $a0, %hi(currlevel)
    /* 297E8 800397E8 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 297EC 800397EC 40100300 */  sll        $v0, $v1, 1
    /* 297F0 800397F0 21104300 */  addu       $v0, $v0, $v1
    /* 297F4 800397F4 80100200 */  sll        $v0, $v0, 2
    /* 297F8 800397F8 21104300 */  addu       $v0, $v0, $v1
    /* 297FC 800397FC 00110200 */  sll        $v0, $v0, 4
    /* 29800 80039800 23104300 */  subu       $v0, $v0, $v1
    /* 29804 80039804 80100200 */  sll        $v0, $v0, 2
    /* 29808 80039808 21104300 */  addu       $v0, $v0, $v1
    /* 2980C 8003980C C0100200 */  sll        $v0, $v0, 3
    /* 29810 80039810 0E80033C */  lui        $v1, %hi(plr + 0x166)
    /* 29814 80039814 9EA66324 */  addiu      $v1, $v1, %lo(plr + 0x166)
    /* 29818 80039818 21104300 */  addu       $v0, $v0, $v1
    /* 2981C 8003981C 21104400 */  addu       $v0, $v0, $a0
    /* 29820 80039820 00004290 */  lbu        $v0, 0x0($v0)
    /* 29824 80039824 00000000 */  nop
    /* 29828 80039828 03004014 */  bnez       $v0, .L80039838
    /* 2982C 8003982C 00000000 */   nop
    /* 29830 80039830 03006516 */  bne        $s3, $a1, .L80039840
    /* 29834 80039834 00000000 */   nop
  .L80039838:
    /* 29838 80039838 158C050C */  jal        func_80163054
    /* 2983C 8003983C 00000000 */   nop
  .L80039840:
    /* 29840 80039840 CCA0010C */  jal        ResyncQuests__Fv
    /* 29844 80039844 00000000 */   nop
    /* 29848 80039848 52E60008 */  j          .L80039948
    /* 2984C 8003984C 00000000 */   nop
  .L80039850:
    /* 29850 80039850 5DE4000C */  jal        Lsaveplrpos__Fv
    /* 29854 80039854 04001024 */   addiu     $s0, $zero, 0x4
    /* 29858 80039858 AA55050C */  jal        func_801556A8
    /* 2985C 8003985C 00000000 */   nop
    /* 29860 80039860 B767050C */  jal        func_80159EDC
    /* 29864 80039864 00000000 */   nop
    /* 29868 80039868 417F050C */  jal        func_8015FD04
    /* 2986C 8003986C 00000000 */   nop
    /* 29870 80039870 B583050C */  jal        func_80160ED4
    /* 29874 80039874 00000000 */   nop
    /* 29878 80039878 3EF9000C */  jal        InitItems__Fb
    /* 2987C 8003987C 01000424 */   addiu     $a0, $zero, 0x1
    /* 29880 80039880 62DF000C */  jal        InitDead__Fv
    /* 29884 80039884 00000000 */   nop
    /* 29888 80039888 04007016 */  bne        $s3, $s0, .L8003989C
    /* 2988C 8003988C 05000224 */   addiu     $v0, $zero, 0x5
    /* 29890 80039890 158C050C */  jal        func_80163054
    /* 29894 80039894 00000000 */   nop
    /* 29898 80039898 05000224 */  addiu      $v0, $zero, 0x5
  .L8003989C:
    /* 2989C 8003989C 03006216 */  bne        $s3, $v0, .L800398AC
    /* 298A0 800398A0 00000000 */   nop
    /* 298A4 800398A4 5505020C */  jal        GetPortalLvlPos__Fv
    /* 298A8 800398A8 00000000 */   nop
  .L800398AC:
    /* 298AC 800398AC 88E4000C */  jal        Lrestoreplrpos__Fv
    /* 298B0 800398B0 00000000 */   nop
    /* 298B4 800398B4 1183010C */  jal        InitMultiView__Fv
    /* 298B8 800398B8 00000000 */   nop
    /* 298BC 800398BC 1C002016 */  bnez       $s1, .L80039930
    /* 298C0 800398C0 00000000 */   nop
    /* 298C4 800398C4 1A007012 */  beq        $s3, $s0, .L80039930
    /* 298C8 800398C8 00000000 */   nop
    /* 298CC 800398CC 1280033C */  lui        $v1, %hi(myplr)
    /* 298D0 800398D0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 298D4 800398D4 1280043C */  lui        $a0, %hi(setlvlnum)
    /* 298D8 800398D8 0FC18490 */  lbu        $a0, %lo(setlvlnum)($a0)
    /* 298DC 800398DC 40100300 */  sll        $v0, $v1, 1
    /* 298E0 800398E0 21104300 */  addu       $v0, $v0, $v1
    /* 298E4 800398E4 80100200 */  sll        $v0, $v0, 2
    /* 298E8 800398E8 21104300 */  addu       $v0, $v0, $v1
    /* 298EC 800398EC 00110200 */  sll        $v0, $v0, 4
    /* 298F0 800398F0 23104300 */  subu       $v0, $v0, $v1
    /* 298F4 800398F4 80100200 */  sll        $v0, $v0, 2
    /* 298F8 800398F8 21104300 */  addu       $v0, $v0, $v1
    /* 298FC 800398FC C0100200 */  sll        $v0, $v0, 3
    /* 29900 80039900 0E80033C */  lui        $v1, %hi(plr + 0x177)
    /* 29904 80039904 AFA66324 */  addiu      $v1, $v1, %lo(plr + 0x177)
    /* 29908 80039908 21104300 */  addu       $v0, $v0, $v1
    /* 2990C 8003990C 21104400 */  addu       $v0, $v0, $a0
    /* 29910 80039910 00004290 */  lbu        $v0, 0x0($v0)
    /* 29914 80039914 00000000 */  nop
    /* 29918 80039918 05004010 */  beqz       $v0, .L80039930
    /* 2991C 8003991C 00000000 */   nop
    /* 29920 80039920 158C050C */  jal        func_80163054
    /* 29924 80039924 00000000 */   nop
    /* 29928 80039928 4EE60008 */  j          .L80039938
    /* 2992C 8003992C 00000000 */   nop
  .L80039930:
    /* 29930 80039930 5335010C */  jal        SavePreLighting__Fv
    /* 29934 80039934 00000000 */   nop
  .L80039938:
    /* 29938 80039938 CCA0010C */  jal        ResyncQuests__Fv
    /* 2993C 8003993C 00000000 */   nop
    /* 29940 80039940 F787050C */  jal        func_80161FDC
    /* 29944 80039944 00000000 */   nop
  .L80039948:
    /* 29948 80039948 1280023C */  lui        $v0, %hi(leveltype)
    /* 2994C 8003994C 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 29950 80039950 1280013C */  lui        $at, %hi(myplr)
    /* 29954 80039954 08BA20AC */  sw         $zero, %lo(myplr)($at)
    /* 29958 80039958 03004010 */  beqz       $v0, .L80039968
    /* 2995C 8003995C 00000000 */   nop
    /* 29960 80039960 1A68050C */  jal        func_8015A068
    /* 29964 80039964 00000000 */   nop
  .L80039968:
    /* 29968 80039968 A034010C */  jal        InitLightMax__Fv
    /* 2996C 8003996C 00000000 */   nop
    /* 29970 80039970 FF008232 */  andi       $v0, $s4, 0xFF
    /* 29974 80039974 03004010 */  beqz       $v0, .L80039984
    /* 29978 80039978 00000000 */   nop
    /* 2997C 8003997C DCC7000C */  jal        InitControlPan__Fv
    /* 29980 80039980 00000000 */   nop
  .L80039984:
    /* 29984 80039984 1280023C */  lui        $v0, %hi(visible_level)
    /* 29988 80039988 A8B04290 */  lbu        $v0, %lo(visible_level)($v0)
    /* 2998C 8003998C 1280033C */  lui        $v1, %hi(leveltype)
    /* 29990 80039990 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 29994 80039994 1280013C */  lui        $at, %hi(last_type)
    /* 29998 80039998 95B022A0 */  sb         $v0, %lo(last_type)($at)
    /* 2999C 8003999C 1280013C */  lui        $at, %hi(visible_level)
    /* 299A0 800399A0 A8B023A0 */  sb         $v1, %lo(visible_level)($at)
    /* 299A4 800399A4 1F0A020C */  jal        ConvertdPiece__Fv
    /* 299A8 800399A8 21800000 */   addu      $s0, $zero, $zero
    /* 299AC 800399AC 3AD5010C */  jal        BuildLevTrigs__Fv
    /* 299B0 800399B0 00000000 */   nop
    /* 299B4 800399B4 1280043C */  lui        $a0, %hi(mydflags)
    /* 299B8 800399B8 D8C0848C */  lw         $a0, %lo(mydflags)($a0)
    /* 299BC 800399BC E720020C */  jal        Tfree__FPv
    /* 299C0 800399C0 00000000 */   nop
    /* 299C4 800399C4 1280013C */  lui        $at, %hi(mydflags)
    /* 299C8 800399C8 D8C020AC */  sw         $zero, %lo(mydflags)($at)
    /* 299CC 800399CC 0E0A020C */  jal        FreedPiece__Fv
    /* 299D0 800399D0 00000000 */   nop
    /* 299D4 800399D4 36F7000C */  jal        ClrDiabloMsg__Fv
    /* 299D8 800399D8 00000000 */   nop
    /* 299DC 800399DC F5E3000C */  jal        FillCrapBits__Fv
    /* 299E0 800399E0 00000000 */   nop
    /* 299E4 800399E4 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 299E8 800399E8 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 299EC 800399EC 00000000 */  nop
    /* 299F0 800399F0 30004004 */  bltz       $v0, .L80039AB4
    /* 299F4 800399F4 00000000 */   nop
    /* 299F8 800399F8 1280123C */  lui        $s2, %hi(LoadedChar)
    /* 299FC 800399FC 28B35226 */  addiu      $s2, $s2, %lo(LoadedChar)
    /* 29A00 80039A00 21880000 */  addu       $s1, $zero, $zero
  .L80039A04:
    /* 29A04 80039A04 1280023C */  lui        $v0, %hi(currlevel)
    /* 29A08 80039A08 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 29A0C 80039A0C 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 29A10 80039A10 21083100 */  addu       $at, $at, $s1
    /* 29A14 80039A14 5CA522AC */  sw         $v0, %lo(plr + 0x24)($at)
    /* 29A18 80039A18 5C9C010C */  jal        InitPlayerGFX__Fi
    /* 29A1C 80039A1C 21200002 */   addu      $a0, $s0, $zero
    /* 29A20 80039A20 04000224 */  addiu      $v0, $zero, 0x4
    /* 29A24 80039A24 11006212 */  beq        $s3, $v0, .L80039A6C
    /* 29A28 80039A28 0A000624 */   addiu     $a2, $zero, 0xA
    /* 29A2C 80039A2C 0000428E */  lw         $v0, 0x0($s2)
    /* 29A30 80039A30 00000000 */  nop
    /* 29A34 80039A34 05004014 */  bnez       $v0, .L80039A4C
    /* 29A38 80039A38 21200002 */   addu      $a0, $s0, $zero
    /* 29A3C 80039A3C FC9B010C */  jal        InitPlayer__FiUc
    /* 29A40 80039A40 FF008532 */   andi      $a1, $s4, 0xFF
    /* 29A44 80039A44 A7E60008 */  j          .L80039A9C
    /* 29A48 80039A48 04005226 */   addiu     $s2, $s2, 0x4
  .L80039A4C:
    /* 29A4C 80039A4C 1280053C */  lui        $a1, %hi(ViewX)
    /* 29A50 80039A50 14C1A58C */  lw         $a1, %lo(ViewX)($a1)
    /* 29A54 80039A54 1280063C */  lui        $a2, %hi(ViewY)
    /* 29A58 80039A58 18C1C68C */  lw         $a2, %lo(ViewY)($a2)
    /* 29A5C 80039A5C 2090020C */  jal        PlacePlayer__FiiiUc
    /* 29A60 80039A60 21380000 */   addu      $a3, $zero, $zero
    /* 29A64 80039A64 A7E60008 */  j          .L80039A9C
    /* 29A68 80039A68 04005226 */   addiu     $s2, $s2, 0x4
  .L80039A6C:
    /* 29A6C 80039A6C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 29A70 80039A70 21083100 */  addu       $at, $at, $s1
    /* 29A74 80039A74 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 29A78 80039A78 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 29A7C 80039A7C 21083100 */  addu       $at, $at, $s1
    /* 29A80 80039A80 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 29A84 80039A84 6A35010C */  jal        AddVision__FiiiUc
    /* 29A88 80039A88 FF000732 */   andi      $a3, $s0, 0xFF
    /* 29A8C 80039A8C 0E80013C */  lui        $at, %hi(plr + 0x5C)
    /* 29A90 80039A90 21083100 */  addu       $at, $at, $s1
    /* 29A94 80039A94 94A522A0 */  sb         $v0, %lo(plr + 0x5C)($at)
    /* 29A98 80039A98 04005226 */  addiu      $s2, $s2, 0x4
  .L80039A9C:
    /* 29A9C 80039A9C 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 29AA0 80039AA0 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 29AA4 80039AA4 01001026 */  addiu      $s0, $s0, 0x1
    /* 29AA8 80039AA8 2A105000 */  slt        $v0, $v0, $s0
    /* 29AAC 80039AAC D5FF4010 */  beqz       $v0, .L80039A04
    /* 29AB0 80039AB0 E8193126 */   addiu     $s1, $s1, 0x19E8
  .L80039AB4:
    /* 29AB4 80039AB4 0E80103C */  lui        $s0, %hi(plr + 0x5B)
    /* 29AB8 80039AB8 93A51026 */  addiu      $s0, $s0, %lo(plr + 0x5B)
    /* 29ABC 80039ABC 00000482 */  lb         $a0, 0x0($s0)
    /* 29AC0 80039AC0 0E80053C */  lui        $a1, %hi(plr + 0x30)
    /* 29AC4 80039AC4 68A5A584 */  lh         $a1, %lo(plr + 0x30)($a1)
    /* 29AC8 80039AC8 0E80063C */  lui        $a2, %hi(plr + 0x32)
    /* 29ACC 80039ACC 6AA5C684 */  lh         $a2, %lo(plr + 0x32)($a2)
    /* 29AD0 80039AD0 E134010C */  jal        ChangeLightXY__Fiii
    /* 29AD4 80039AD4 00000000 */   nop
    /* 29AD8 80039AD8 0E80053C */  lui        $a1, %hi(plr + 0x28)
    /* 29ADC 80039ADC 60A5A58C */  lw         $a1, %lo(plr + 0x28)($a1)
    /* 29AE0 80039AE0 00000482 */  lb         $a0, 0x0($s0)
    /* 29AE4 80039AE4 0E80063C */  lui        $a2, %hi(plr + 0x2C)
    /* 29AE8 80039AE8 64A5C68C */  lw         $a2, %lo(plr + 0x2C)($a2)
    /* 29AEC 80039AEC 0F00A530 */  andi       $a1, $a1, 0xF
    /* 29AF0 80039AF0 F8FFA524 */  addiu      $a1, $a1, -0x8
    /* 29AF4 80039AF4 0F00C630 */  andi       $a2, $a2, 0xF
    /* 29AF8 80039AF8 EE34010C */  jal        ChangeLightOff__Fiii
    /* 29AFC 80039AFC F8FFC624 */   addiu     $a2, $a2, -0x8
    /* 29B00 80039B00 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 29B04 80039B04 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 29B08 80039B08 00000000 */  nop
    /* 29B0C 80039B0C 14004010 */  beqz       $v0, .L80039B60
    /* 29B10 80039B10 00000000 */   nop
    /* 29B14 80039B14 0E80043C */  lui        $a0, %hi(plr + 0x1A43)
    /* 29B18 80039B18 7BBF8480 */  lb         $a0, %lo(plr + 0x1A43)($a0)
    /* 29B1C 80039B1C 0E80053C */  lui        $a1, %hi(plr + 0x1A18)
    /* 29B20 80039B20 50BFA584 */  lh         $a1, %lo(plr + 0x1A18)($a1)
    /* 29B24 80039B24 0E80063C */  lui        $a2, %hi(plr + 0x1A1A)
    /* 29B28 80039B28 52BFC684 */  lh         $a2, %lo(plr + 0x1A1A)($a2)
    /* 29B2C 80039B2C E134010C */  jal        ChangeLightXY__Fiii
    /* 29B30 80039B30 00000000 */   nop
    /* 29B34 80039B34 0E80053C */  lui        $a1, %hi(plr + 0x1A10)
    /* 29B38 80039B38 48BFA58C */  lw         $a1, %lo(plr + 0x1A10)($a1)
    /* 29B3C 80039B3C 0E80043C */  lui        $a0, %hi(plr + 0x1A43)
    /* 29B40 80039B40 7BBF8480 */  lb         $a0, %lo(plr + 0x1A43)($a0)
    /* 29B44 80039B44 0E80063C */  lui        $a2, %hi(plr + 0x1A14)
    /* 29B48 80039B48 4CBFC68C */  lw         $a2, %lo(plr + 0x1A14)($a2)
    /* 29B4C 80039B4C 0F00A530 */  andi       $a1, $a1, 0xF
    /* 29B50 80039B50 F8FFA524 */  addiu      $a1, $a1, -0x8
    /* 29B54 80039B54 0F00C630 */  andi       $a2, $a2, 0xF
    /* 29B58 80039B58 EE34010C */  jal        ChangeLightOff__Fiii
    /* 29B5C 80039B5C F8FFC624 */   addiu     $a2, $a2, -0x8
  .L80039B60:
    /* 29B60 80039B60 1280023C */  lui        $v0, %hi(leveltype)
    /* 29B64 80039B64 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 29B68 80039B68 00000000 */  nop
    /* 29B6C 80039B6C 05004010 */  beqz       $v0, .L80039B84
    /* 29B70 80039B70 00000000 */   nop
    /* 29B74 80039B74 0D35010C */  jal        ProcessLightList__Fv
    /* 29B78 80039B78 00000000 */   nop
    /* 29B7C 80039B7C D535010C */  jal        ProcessVisionList__Fv
    /* 29B80 80039B80 00000000 */   nop
  .L80039B84:
    /* 29B84 80039B84 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 29B88 80039B88 2800B48F */  lw         $s4, 0x28($sp)
    /* 29B8C 80039B8C 2400B38F */  lw         $s3, 0x24($sp)
    /* 29B90 80039B90 2000B28F */  lw         $s2, 0x20($sp)
    /* 29B94 80039B94 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 29B98 80039B98 1800B08F */  lw         $s0, 0x18($sp)
    /* 29B9C 80039B9C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 29BA0 80039BA0 0800E003 */  jr         $ra
    /* 29BA4 80039BA4 00000000 */   nop
endlabel LoadGameLevel__FUci
