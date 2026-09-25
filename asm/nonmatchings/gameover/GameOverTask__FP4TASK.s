.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GameOverTask__FP4TASK, 0x204

glabel GameOverTask__FP4TASK
    /* 7224C 8008224C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 72250 80082250 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 72254 80082254 21980000 */  addu       $s3, $zero, $zero
    /* 72258 80082258 21200000 */  addu       $a0, $zero, $zero
    /* 7225C 8008225C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 72260 80082260 1800B2AF */  sw         $s2, 0x18($sp)
    /* 72264 80082264 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72268 80082268 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 7226C 8008226C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 72270 80082270 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 72274 80082274 08071124 */   addiu     $s1, $zero, 0x708
    /* 72278 80082278 A0EB010C */  jal        InitGamePadVars__Fv
    /* 7227C 8008227C 00000000 */   nop
    /* 72280 80082280 1280023C */  lui        $v0, %hi(deathflag)
    /* 72284 80082284 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 72288 80082288 00000000 */  nop
    /* 7228C 8008228C 3D004010 */  beqz       $v0, .L80082384
    /* 72290 80082290 00000000 */   nop
    /* 72294 80082294 1280013C */  lui        $at, %hi(options_pad)
    /* 72298 80082298 50B220AC */  sw         $zero, %lo(options_pad)($at)
    /* 7229C 8008229C 73AA020C */  jal        ToggleOptions__Fv
    /* 722A0 800822A0 00000000 */   nop
    /* 722A4 800822A4 3E10020C */  jal        VID_GetTick__Fv
    /* 722A8 800822A8 00000000 */   nop
    /* 722AC 800822AC 21904000 */  addu       $s2, $v0, $zero
  .L800822B0:
    /* 722B0 800822B0 1280023C */  lui        $v0, %hi(optionsflag)
    /* 722B4 800822B4 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* 722B8 800822B8 00000000 */  nop
    /* 722BC 800822BC 24004010 */  beqz       $v0, .L80082350
    /* 722C0 800822C0 00000000 */   nop
    /* 722C4 800822C4 22006016 */  bnez       $s3, .L80082350
    /* 722C8 800822C8 00000000 */   nop
    /* 722CC 800822CC 1280053C */  lui        $a1, %hi(FePlayerNo)
    /* 722D0 800822D0 78B3A590 */  lbu        $a1, %lo(FePlayerNo)($a1)
    /* 722D4 800822D4 FD25020C */  jal        PAD_GetPad__FiUc
    /* 722D8 800822D8 21200000 */   addu      $a0, $zero, $zero
    /* 722DC 800822DC 21204000 */  addu       $a0, $v0, $zero
    /* 722E0 800822E0 1280033C */  lui        $v1, %hi(cmenu)
    /* 722E4 800822E4 3CB2638C */  lw         $v1, %lo(cmenu)($v1)
    /* 722E8 800822E8 09000224 */  addiu      $v0, $zero, 0x9
    /* 722EC 800822EC 02006214 */  bne        $v1, $v0, .L800822F8
    /* 722F0 800822F0 00000000 */   nop
    /* 722F4 800822F4 08071124 */  addiu      $s1, $zero, 0x708
  .L800822F8:
    /* 722F8 800822F8 6409020C */  jal        GetDown__C4CPad_80082590
    /* 722FC 800822FC 00000000 */   nop
    /* 72300 80082300 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 72304 80082304 03004010 */  beqz       $v0, .L80082314
    /* 72308 80082308 00000000 */   nop
    /* 7230C 8008230C D0080208 */  j          .L80082340
    /* 72310 80082310 08071124 */   addiu     $s1, $zero, 0x708
  .L80082314:
    /* 72314 80082314 3E10020C */  jal        VID_GetTick__Fv
    /* 72318 80082318 00000000 */   nop
    /* 7231C 8008231C 21804000 */  addu       $s0, $v0, $zero
    /* 72320 80082320 07001212 */  beq        $s0, $s2, .L80082340
    /* 72324 80082324 00000000 */   nop
    /* 72328 80082328 6D41000C */  jal        abs
    /* 7232C 8008232C 23201202 */   subu      $a0, $s0, $s2
    /* 72330 80082330 23882202 */  subu       $s1, $s1, $v0
    /* 72334 80082334 0200201E */  bgtz       $s1, .L80082340
    /* 72338 80082338 21900002 */   addu      $s2, $s0, $zero
    /* 7233C 8008233C 01001324 */  addiu      $s3, $zero, 0x1
  .L80082340:
    /* 72340 80082340 EE80000C */  jal        TSK_Sleep
    /* 72344 80082344 01000424 */   addiu     $a0, $zero, 0x1
    /* 72348 80082348 AC080208 */  j          .L800822B0
    /* 7234C 8008234C 00000000 */   nop
  .L80082350:
    /* 72350 80082350 1280023C */  lui        $v0, %hi(deathflag)
    /* 72354 80082354 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 72358 80082358 00000000 */  nop
    /* 7235C 8008235C 05004014 */  bnez       $v0, .L80082374
    /* 72360 80082360 00000000 */   nop
    /* 72364 80082364 1280013C */  lui        $at, %hi(PauseMode)
    /* 72368 80082368 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 7236C 8008236C 0C090208 */  j          .L80082430
    /* 72370 80082370 00000000 */   nop
  .L80082374:
    /* 72374 80082374 03006012 */  beqz       $s3, .L80082384
    /* 72378 80082378 00000000 */   nop
    /* 7237C 8008237C 73AA020C */  jal        ToggleOptions__Fv
    /* 72380 80082380 00000000 */   nop
  .L80082384:
    /* 72384 80082384 A4DF010C */  jal        music_fade__Fv
    /* 72388 80082388 21800000 */   addu      $s0, $zero, $zero
    /* 7238C 8008238C 7AF6000C */  jal        stream_fade__Fv
    /* 72390 80082390 00000000 */   nop
  .L80082394:
    /* 72394 80082394 3ED8000C */  jal        RedBack__Fv
    /* 72398 80082398 01001026 */   addiu     $s0, $s0, 0x1
    /* 7239C 8008239C 1409020C */  jal        PrintGameOver__Fv
    /* 723A0 800823A0 00000000 */   nop
    /* 723A4 800823A4 EE80000C */  jal        TSK_Sleep
    /* 723A8 800823A8 01000424 */   addiu     $a0, $zero, 0x1
    /* 723AC 800823AC 7800022A */  slti       $v0, $s0, 0x78
    /* 723B0 800823B0 F8FF4014 */  bnez       $v0, .L80082394
    /* 723B4 800823B4 00000000 */   nop
    /* 723B8 800823B8 BEFC010C */  jal        PaletteFadeOut__Fi
    /* 723BC 800823BC 08000424 */   addiu     $a0, $zero, 0x8
    /* 723C0 800823C0 0D004010 */  beqz       $v0, .L800823F8
    /* 723C4 800823C4 00000000 */   nop
  .L800823C8:
    /* 723C8 800823C8 ABFB010C */  jal        GetFadeState__Fv
    /* 723CC 800823CC 00000000 */   nop
    /* 723D0 800823D0 09004010 */  beqz       $v0, .L800823F8
    /* 723D4 800823D4 00000000 */   nop
    /* 723D8 800823D8 3ED8000C */  jal        RedBack__Fv
    /* 723DC 800823DC 00000000 */   nop
    /* 723E0 800823E0 1409020C */  jal        PrintGameOver__Fv
    /* 723E4 800823E4 00000000 */   nop
    /* 723E8 800823E8 EE80000C */  jal        TSK_Sleep
    /* 723EC 800823EC 01000424 */   addiu     $a0, $zero, 0x1
    /* 723F0 800823F0 F2080208 */  j          .L800823C8
    /* 723F4 800823F4 00000000 */   nop
  .L800823F8:
    /* 723F8 800823F8 1280013C */  lui        $at, %hi(deathflag)
    /* 723FC 800823FC 0CBA20A0 */  sb         $zero, %lo(deathflag)($at)
    /* 72400 80082400 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 72404 80082404 00000000 */   nop
    /* 72408 80082408 C46E020C */  jal        GLUE_SetFinished__Fb
    /* 7240C 8008240C 01000424 */   addiu     $a0, $zero, 0x1
    /* 72410 80082410 EE80000C */  jal        TSK_Sleep
    /* 72414 80082414 03000424 */   addiu     $a0, $zero, 0x3
    /* 72418 80082418 1280013C */  lui        $at, %hi(PauseMode)
    /* 7241C 8008241C A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 72420 80082420 890C020C */  jal        MAIN_RestartGameTask__Fv
    /* 72424 80082424 00000000 */   nop
    /* 72428 80082428 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 7242C 8008242C 00000000 */   nop
  .L80082430:
    /* 72430 80082430 2000BF8F */  lw         $ra, 0x20($sp)
    /* 72434 80082434 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 72438 80082438 1800B28F */  lw         $s2, 0x18($sp)
    /* 7243C 8008243C 1400B18F */  lw         $s1, 0x14($sp)
    /* 72440 80082440 1000B08F */  lw         $s0, 0x10($sp)
    /* 72444 80082444 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 72448 80082448 0800E003 */  jr         $ra
    /* 7244C 8008244C 00000000 */   nop
endlabel GameOverTask__FP4TASK
