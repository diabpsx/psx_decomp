.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GameTask__FP4TASK, 0x10C

glabel GameTask__FP4TASK
    /* 73250 80083250 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 73254 80083254 1400BFAF */  sw         $ra, 0x14($sp)
    /* 73258 80083258 3F4A010C */  jal        MSG_ClearOutCompMap__Fv
    /* 7325C 8008325C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 73260 80083260 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 73264 80083264 04000424 */   addiu     $a0, $zero, 0x4
    /* 73268 80083268 01001024 */  addiu      $s0, $zero, 0x1
  .L8008326C:
    /* 7326C 8008326C 1355020C */  jal        OVR_LoadFrontend__Fv
    /* 73270 80083270 00000000 */   nop
    /* 73274 80083274 85F8000C */  jal        InitAllItemsUseable__Fv
    /* 73278 80083278 00000000 */   nop
    /* 7327C 8008327C AEE7000C */  jal        alloc_plr__Fv
    /* 73280 80083280 00000000 */   nop
    /* 73284 80083284 9D34020C */  jal        ATT_DoAttract__Fv
    /* 73288 80083288 00000000 */   nop
    /* 7328C 8008328C 1280023C */  lui        $v0, %hi(demo_record_load)
    /* 73290 80083290 40AE428C */  lw         $v0, %lo(demo_record_load)($v0)
    /* 73294 80083294 00000000 */  nop
    /* 73298 80083298 05005014 */  bne        $v0, $s0, .L800832B0
    /* 7329C 8008329C 00000000 */   nop
    /* 732A0 800832A0 1280043C */  lui        $a0, %hi(level_record)
    /* 732A4 800832A4 44AE848C */  lw         $a0, %lo(level_record)($a0)
    /* 732A8 800832A8 4C6E020C */  jal        set_pad_record_play__Fi
    /* 732AC 800832AC 00000000 */   nop
  .L800832B0:
    /* 732B0 800832B0 1280023C */  lui        $v0, %hi(demo_pad_time)
    /* 732B4 800832B4 B4AB428C */  lw         $v0, %lo(demo_pad_time)($v0)
    /* 732B8 800832B8 00000000 */  nop
    /* 732BC 800832BC 0D004014 */  bnez       $v0, .L800832F4
    /* 732C0 800832C0 01000424 */   addiu     $a0, $zero, 0x1
    /* 732C4 800832C4 1280023C */  lui        $v0, %hi(DoLoadedGame)
    /* 732C8 800832C8 84B1428C */  lw         $v0, %lo(DoLoadedGame)($v0)
    /* 732CC 800832CC 00000000 */  nop
    /* 732D0 800832D0 03005014 */  bne        $v0, $s0, .L800832E0
    /* 732D4 800832D4 00000000 */   nop
    /* 732D8 800832D8 BD0C0208 */  j          .L800832F4
    /* 732DC 800832DC 21200000 */   addu      $a0, $zero, $zero
  .L800832E0:
    /* 732E0 800832E0 B36E020C */  jal        GLUE_PreTown__Fv
    /* 732E4 800832E4 00000000 */   nop
    /* 732E8 800832E8 E889000C */  jal        GAL_SetTimeStamp
    /* 732EC 800832EC 04000424 */   addiu     $a0, $zero, 0x4
    /* 732F0 800832F0 01000424 */  addiu      $a0, $zero, 0x1
  .L800832F4:
    /* 732F4 800832F4 83E0000C */  jal        StartGame__FUcUc
    /* 732F8 800832F8 01000524 */   addiu     $a1, $zero, 0x1
    /* 732FC 800832FC C46E020C */  jal        GLUE_SetFinished__Fb
    /* 73300 80083300 01000424 */   addiu     $a0, $zero, 0x1
    /* 73304 80083304 EE80000C */  jal        TSK_Sleep
    /* 73308 80083308 05000424 */   addiu     $a0, $zero, 0x5
    /* 7330C 8008330C 1280023C */  lui        $v0, %hi(gbDoEnding)
    /* 73310 80083310 01B84290 */  lbu        $v0, %lo(gbDoEnding)($v0)
    /* 73314 80083314 00000000 */  nop
    /* 73318 80083318 D4FF4010 */  beqz       $v0, .L8008326C
    /* 7331C 8008331C 00000000 */   nop
    /* 73320 80083320 3F4A010C */  jal        MSG_ClearOutCompMap__Fv
    /* 73324 80083324 00000000 */   nop
    /* 73328 80083328 1280043C */  lui        $a0, %hi(gbDoEnding)
    /* 7332C 8008332C 01B88490 */  lbu        $a0, %lo(gbDoEnding)($a0)
    /* 73330 80083330 1280013C */  lui        $at, %hi(gbDoEnding)
    /* 73334 80083334 01B820A0 */  sb         $zero, %lo(gbDoEnding)($at)
    /* 73338 80083338 C73A050C */  jal        func_8014EB1C
    /* 7333C 8008333C FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 73340 80083340 9B0C0208 */  j          .L8008326C
    /* 73344 80083344 00000000 */   nop
    /* 73348 80083348 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7334C 8008334C 1000B08F */  lw         $s0, 0x10($sp)
    /* 73350 80083350 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 73354 80083354 0800E003 */  jr         $ra
    /* 73358 80083358 00000000 */   nop
endlabel GameTask__FP4TASK
