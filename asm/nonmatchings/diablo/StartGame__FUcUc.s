.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartGame__FUcUc, 0x200

glabel StartGame__FUcUc
    /* 2820C 8003820C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 28210 80038210 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 28214 80038214 21988000 */  addu       $s3, $a0, $zero
    /* 28218 80038218 3000B4AF */  sw         $s4, 0x30($sp)
    /* 2821C 8003821C 01000224 */  addiu      $v0, $zero, 0x1
    /* 28220 80038220 3400BFAF */  sw         $ra, 0x34($sp)
    /* 28224 80038224 2800B2AF */  sw         $s2, 0x28($sp)
    /* 28228 80038228 2400B1AF */  sw         $s1, 0x24($sp)
    /* 2822C 8003822C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 28230 80038230 1280013C */  lui        $at, %hi(gbSelectProvider)
    /* 28234 80038234 A6B922A0 */  sb         $v0, %lo(gbSelectProvider)($at)
    /* 28238 80038238 A0EB010C */  jal        InitGamePadVars__Fv
    /* 2823C 8003823C 21A0A000 */   addu      $s4, $a1, $zero
    /* 28240 80038240 0E80113C */  lui        $s1, %hi(plr + 0x1A05)
    /* 28244 80038244 3DBF3126 */  addiu      $s1, $s1, %lo(plr + 0x1A05)
    /* 28248 80038248 01001224 */  addiu      $s2, $zero, 0x1
  .L8003824C:
    /* 2824C 8003824C 1800A0A3 */  sb         $zero, 0x18($sp)
    /* 28250 80038250 FF008432 */  andi       $a0, $s4, 0xFF
    /* 28254 80038254 7C4B010C */  jal        NetInit__FUcPUc
    /* 28258 80038258 1800A527 */   addiu     $a1, $sp, 0x18
    /* 2825C 8003825C FF004230 */  andi       $v0, $v0, 0xFF
    /* 28260 80038260 07004014 */  bnez       $v0, .L80038280
    /* 28264 80038264 FF006232 */   andi      $v0, $s3, 0xFF
    /* 28268 80038268 1800A293 */  lbu        $v0, 0x18($sp)
    /* 2826C 8003826C 00000000 */  nop
    /* 28270 80038270 0100422C */  sltiu      $v0, $v0, 0x1
    /* 28274 80038274 831082A3 */  sb         $v0, %gp_rel(gbRunGameResult)($gp)
    /* 28278 80038278 F9E00008 */  j          .L800383E4
    /* 2827C 8003827C 00000000 */   nop
  .L80038280:
    /* 28280 80038280 1280013C */  lui        $at, %hi(gbSelectProvider)
    /* 28284 80038284 A6B920A0 */  sb         $zero, %lo(gbSelectProvider)($at)
    /* 28288 80038288 16004010 */  beqz       $v0, .L800382E4
    /* 2828C 8003828C 00000000 */   nop
    /* 28290 80038290 1280023C */  lui        $v0, %hi(demo_pad_time)
    /* 28294 80038294 B4AB428C */  lw         $v0, %lo(demo_pad_time)($v0)
    /* 28298 80038298 00000000 */  nop
    /* 2829C 8003829C 16004010 */  beqz       $v0, .L800382F8
    /* 282A0 800382A0 4D000524 */   addiu     $a1, $zero, 0x4D
    /* 282A4 800382A4 21300000 */  addu       $a2, $zero, $zero
    /* 282A8 800382A8 21380000 */  addu       $a3, $zero, $zero
    /* 282AC 800382AC 1280023C */  lui        $v0, %hi(level_record)
    /* 282B0 800382B0 44AE428C */  lw         $v0, %lo(level_record)($v0)
    /* 282B4 800382B4 0810848F */  lw         $a0, %gp_rel(ghMainWnd)($gp)
    /* 282B8 800382B8 FF004330 */  andi       $v1, $v0, 0xFF
    /* 282BC 800382BC 80180300 */  sll        $v1, $v1, 2
    /* 282C0 800382C0 0D80013C */  lui        $at, %hi(gnLevelTypeTbl)
    /* 282C4 800382C4 21082300 */  addu       $at, $at, $v1
    /* 282C8 800382C8 A0F7238C */  lw         $v1, %lo(gnLevelTypeTbl)($at)
    /* 282CC 800382CC 1280013C */  lui        $at, %hi(currlevel)
    /* 282D0 800382D0 0CC122A0 */  sb         $v0, %lo(currlevel)($at)
    /* 282D4 800382D4 1280013C */  lui        $at, %hi(leveltype)
    /* 282D8 800382D8 0DC123A0 */  sb         $v1, %lo(leveltype)($at)
    /* 282DC 800382DC D0E00008 */  j          .L80038340
    /* 282E0 800382E0 21800000 */   addu      $s0, $zero, $zero
  .L800382E4:
    /* 282E4 800382E4 1280023C */  lui        $v0, %hi(gbValidSaveFile)
    /* 282E8 800382E8 F0B94290 */  lbu        $v0, %lo(gbValidSaveFile)($v0)
    /* 282EC 800382EC 00000000 */  nop
    /* 282F0 800382F0 0F004014 */  bnez       $v0, .L80038330
    /* 282F4 800382F4 4B000524 */   addiu     $a1, $zero, 0x4B
  .L800382F8:
    /* 282F8 800382F8 0955020C */  jal        OVR_LoadPregame__Fv
    /* 282FC 800382FC 4A001024 */   addiu     $s0, $zero, 0x4A
    /* 28300 80038300 F26E050C */  jal        func_8015BBC8
    /* 28304 80038304 00000000 */   nop
    /* 28308 80038308 F779050C */  jal        func_8015E7DC
    /* 2830C 8003830C 00000000 */   nop
    /* 28310 80038310 DF79050C */  jal        func_8015E77C
    /* 28314 80038314 00000000 */   nop
    /* 28318 80038318 1280043C */  lui        $a0, %hi(myplr)
    /* 2831C 8003831C 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 28320 80038320 499C010C */  jal        InitDungMsgs__Fi
    /* 28324 80038324 00000000 */   nop
    /* 28328 80038328 D2E00008 */  j          .L80038348
    /* 2832C 8003832C 00000000 */   nop
  .L80038330:
    /* 28330 80038330 0810848F */  lw         $a0, %gp_rel(ghMainWnd)($gp)
    /* 28334 80038334 21300000 */  addu       $a2, $zero, $zero
    /* 28338 80038338 21380000 */  addu       $a3, $zero, $zero
    /* 2833C 8003833C 21800000 */  addu       $s0, $zero, $zero
  .L80038340:
    /* 28340 80038340 95EC010C */  jal        GRL_PostMessage__FUlUilUl
    /* 28344 80038344 00000000 */   nop
  .L80038348:
    /* 28348 80038348 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 2834C 8003834C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 28350 80038350 00000000 */  nop
    /* 28354 80038354 16004010 */  beqz       $v0, .L800383B0
    /* 28358 80038358 00000000 */   nop
    /* 2835C 8003835C 00002292 */  lbu        $v0, 0x0($s1)
    /* 28360 80038360 00000000 */  nop
    /* 28364 80038364 12004014 */  bnez       $v0, .L800383B0
    /* 28368 80038368 00000000 */   nop
    /* 2836C 8003836C FF00228E */  lw         $v0, 0xFF($s1)
    /* 28370 80038370 00000000 */  nop
    /* 28374 80038374 0E004010 */  beqz       $v0, .L800383B0
    /* 28378 80038378 01000424 */   addiu     $a0, $zero, 0x1
    /* 2837C 8003837C 0E80063C */  lui        $a2, %hi(plr + 0x1A18)
    /* 28380 80038380 50BFC690 */  lbu        $a2, %lo(plr + 0x1A18)($a2)
    /* 28384 80038384 0E80073C */  lui        $a3, %hi(plr + 0x1A1A)
    /* 28388 80038388 52BFE790 */  lbu        $a3, %lo(plr + 0x1A1A)($a3)
    /* 2838C 8003838C 1FE62296 */  lhu        $v0, -0x19E1($s1)
    /* 28390 80038390 35000524 */  addiu      $a1, $zero, 0x35
    /* 28394 80038394 1280013C */  lui        $at, %hi(myplr)
    /* 28398 80038398 08BA32AC */  sw         $s2, %lo(myplr)($at)
    /* 2839C 8003839C DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 283A0 800383A0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 283A4 800383A4 000032A2 */  sb         $s2, 0x0($s1)
    /* 283A8 800383A8 1280013C */  lui        $at, %hi(myplr)
    /* 283AC 800383AC 08BA20AC */  sw         $zero, %lo(myplr)($at)
  .L800383B0:
    /* 283B0 800383B0 FF6C020C */  jal        SetAmbientLight__Fv
    /* 283B4 800383B4 00000000 */   nop
    /* 283B8 800383B8 03E1000C */  jal        run_game_loop__FUi
    /* 283BC 800383BC 21200002 */   addu      $a0, $s0, $zero
    /* 283C0 800383C0 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 283C4 800383C4 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 283C8 800383C8 00000000 */  nop
    /* 283CC 800383CC 05005210 */  beq        $v0, $s2, .L800383E4
    /* 283D0 800383D0 00000000 */   nop
    /* 283D4 800383D4 83108293 */  lbu        $v0, %gp_rel(gbRunGameResult)($gp)
    /* 283D8 800383D8 00000000 */  nop
    /* 283DC 800383DC 9BFF4014 */  bnez       $v0, .L8003824C
    /* 283E0 800383E0 00000000 */   nop
  .L800383E4:
    /* 283E4 800383E4 83108293 */  lbu        $v0, %gp_rel(gbRunGameResult)($gp)
    /* 283E8 800383E8 3400BF8F */  lw         $ra, 0x34($sp)
    /* 283EC 800383EC 3000B48F */  lw         $s4, 0x30($sp)
    /* 283F0 800383F0 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 283F4 800383F4 2800B28F */  lw         $s2, 0x28($sp)
    /* 283F8 800383F8 2400B18F */  lw         $s1, 0x24($sp)
    /* 283FC 800383FC 2000B08F */  lw         $s0, 0x20($sp)
    /* 28400 80038400 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 28404 80038404 0800E003 */  jr         $ra
    /* 28408 80038408 00000000 */   nop
endlabel StartGame__FUcUc
