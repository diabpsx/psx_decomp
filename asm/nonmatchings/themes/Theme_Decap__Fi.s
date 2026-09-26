.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_Decap__Fi, 0x158

glabel Theme_Decap__Fi
    /* 24094 8015DC8C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 24098 8015DC90 3000B4AF */  sw         $s4, 0x30($sp)
    /* 2409C 8015DC94 21A08000 */  addu       $s4, $a0, $zero
    /* 240A0 8015DC98 3400BFAF */  sw         $ra, 0x34($sp)
    /* 240A4 8015DC9C 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 240A8 8015DCA0 2800B2AF */  sw         $s2, 0x28($sp)
    /* 240AC 8015DCA4 2400B1AF */  sw         $s1, 0x24($sp)
    /* 240B0 8015DCA8 2000B0AF */  sw         $s0, 0x20($sp)
    /* 240B4 8015DCAC 1280053C */  lui        $a1, %hi(D_8011C17C)
    /* 240B8 8015DCB0 7CC1A524 */  addiu      $a1, $a1, %lo(D_8011C17C)
    /* 240BC 8015DCB4 0300A288 */  lwl        $v0, 0x3($a1)
    /* 240C0 8015DCB8 0000A298 */  lwr        $v0, 0x0($a1)
    /* 240C4 8015DCBC 00000000 */  nop
    /* 240C8 8015DCC0 1300A2AB */  swl        $v0, 0x13($sp)
    /* 240CC 8015DCC4 1000A2BB */  swr        $v0, 0x10($sp)
    /* 240D0 8015DCC8 1280053C */  lui        $a1, %hi(D_8011C180)
    /* 240D4 8015DCCC 80C1A524 */  addiu      $a1, $a1, %lo(D_8011C180)
    /* 240D8 8015DCD0 0300A288 */  lwl        $v0, 0x3($a1)
    /* 240DC 8015DCD4 0000A298 */  lwr        $v0, 0x0($a1)
    /* 240E0 8015DCD8 00000000 */  nop
    /* 240E4 8015DCDC 1B00A2AB */  swl        $v0, 0x1B($sp)
    /* 240E8 8015DCE0 1800A2BB */  swr        $v0, 0x18($sp)
    /* 240EC 8015DCE4 01001224 */  addiu      $s2, $zero, 0x1
  .L8015DCE8:
    /* 240F0 8015DCE8 01001124 */  addiu      $s1, $zero, 0x1
    /* 240F4 8015DCEC C0101200 */  sll        $v0, $s2, 3
    /* 240F8 8015DCF0 80035324 */  addiu      $s3, $v0, 0x380
  .L8015DCF4:
    /* 240FC 8015DCF4 C0101400 */  sll        $v0, $s4, 3
    /* 24100 8015DCF8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 24104 8015DCFC 21083300 */  addu       $at, $at, $s3
    /* 24108 8015DD00 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 2410C 8015DD04 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 24110 8015DD08 21082200 */  addu       $at, $at, $v0
    /* 24114 8015DD0C 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 24118 8015DD10 00000000 */  nop
    /* 2411C 8015DD14 1B006214 */  bne        $v1, $v0, .L8015DD84
    /* 24120 8015DD18 21202002 */   addu      $a0, $s1, $zero
    /* 24124 8015DD1C 380B020C */  jal        GetSOLID__Fii
    /* 24128 8015DD20 21284002 */   addu      $a1, $s2, $zero
    /* 2412C 8015DD24 01004238 */  xori       $v0, $v0, 0x1
    /* 24130 8015DD28 16004010 */  beqz       $v0, .L8015DD84
    /* 24134 8015DD2C 21800000 */   addu      $s0, $zero, $zero
    /* 24138 8015DD30 21202002 */  addu       $a0, $s1, $zero
    /* 2413C 8015DD34 21284002 */  addu       $a1, $s2, $zero
    /* 24140 8015DD38 21308002 */  addu       $a2, $s4, $zero
    /* 24144 8015DD3C 8270050C */  jal        CheckThemeObj3__Fiiii
    /* 24148 8015DD40 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 2414C 8015DD44 FF004230 */  andi       $v0, $v0, 0xFF
    /* 24150 8015DD48 09004010 */  beqz       $v0, .L8015DD70
    /* 24154 8015DD4C 00000000 */   nop
    /* 24158 8015DD50 1280023C */  lui        $v0, %hi(leveltype)
    /* 2415C 8015DD54 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 24160 8015DD58 00000000 */  nop
    /* 24164 8015DD5C 2110A203 */  addu       $v0, $sp, $v0
    /* 24168 8015DD60 0F004480 */  lb         $a0, 0xF($v0)
    /* 2416C 8015DD64 C9F6000C */  jal        ENG_random__Fl
    /* 24170 8015DD68 00000000 */   nop
    /* 24174 8015DD6C 0100502C */  sltiu      $s0, $v0, 0x1
  .L8015DD70:
    /* 24178 8015DD70 04000012 */  beqz       $s0, .L8015DD84
    /* 2417C 8015DD74 43000424 */   addiu     $a0, $zero, 0x43
    /* 24180 8015DD78 21282002 */  addu       $a1, $s1, $zero
    /* 24184 8015DD7C BE4E010C */  jal        AddObject__Fiii
    /* 24188 8015DD80 21304002 */   addu      $a2, $s2, $zero
  .L8015DD84:
    /* 2418C 8015DD84 01003126 */  addiu      $s1, $s1, 0x1
    /* 24190 8015DD88 5F00222A */  slti       $v0, $s1, 0x5F
    /* 24194 8015DD8C D9FF4014 */  bnez       $v0, .L8015DCF4
    /* 24198 8015DD90 80037326 */   addiu     $s3, $s3, 0x380
    /* 2419C 8015DD94 01005226 */  addiu      $s2, $s2, 0x1
    /* 241A0 8015DD98 5F00422A */  slti       $v0, $s2, 0x5F
    /* 241A4 8015DD9C D2FF4014 */  bnez       $v0, .L8015DCE8
    /* 241A8 8015DDA0 00000000 */   nop
    /* 241AC 8015DDA4 1280023C */  lui        $v0, %hi(leveltype)
    /* 241B0 8015DDA8 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 241B4 8015DDAC 00000000 */  nop
    /* 241B8 8015DDB0 2110A203 */  addu       $v0, $sp, $v0
    /* 241BC 8015DDB4 17004580 */  lb         $a1, 0x17($v0)
    /* 241C0 8015DDB8 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 241C4 8015DDBC 21208002 */   addu      $a0, $s4, $zero
    /* 241C8 8015DDC0 3400BF8F */  lw         $ra, 0x34($sp)
    /* 241CC 8015DDC4 3000B48F */  lw         $s4, 0x30($sp)
    /* 241D0 8015DDC8 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 241D4 8015DDCC 2800B28F */  lw         $s2, 0x28($sp)
    /* 241D8 8015DDD0 2400B18F */  lw         $s1, 0x24($sp)
    /* 241DC 8015DDD4 2000B08F */  lw         $s0, 0x20($sp)
    /* 241E0 8015DDD8 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 241E4 8015DDDC 0800E003 */  jr         $ra
    /* 241E8 8015DDE0 00000000 */   nop
endlabel Theme_Decap__Fi
