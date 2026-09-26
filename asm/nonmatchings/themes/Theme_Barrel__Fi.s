.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_Barrel__Fi, 0x15C

glabel Theme_Barrel__Fi
    /* 2333C 8015CF34 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 23340 8015CF38 3000B4AF */  sw         $s4, 0x30($sp)
    /* 23344 8015CF3C 21A08000 */  addu       $s4, $a0, $zero
    /* 23348 8015CF40 3400BFAF */  sw         $ra, 0x34($sp)
    /* 2334C 8015CF44 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 23350 8015CF48 2800B2AF */  sw         $s2, 0x28($sp)
    /* 23354 8015CF4C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 23358 8015CF50 2000B0AF */  sw         $s0, 0x20($sp)
    /* 2335C 8015CF54 1280053C */  lui        $a1, %hi(D_8011C160)
    /* 23360 8015CF58 60C1A524 */  addiu      $a1, $a1, %lo(D_8011C160)
    /* 23364 8015CF5C 0300A288 */  lwl        $v0, 0x3($a1)
    /* 23368 8015CF60 0000A298 */  lwr        $v0, 0x0($a1)
    /* 2336C 8015CF64 00000000 */  nop
    /* 23370 8015CF68 1300A2AB */  swl        $v0, 0x13($sp)
    /* 23374 8015CF6C 1000A2BB */  swr        $v0, 0x10($sp)
    /* 23378 8015CF70 1280053C */  lui        $a1, %hi(D_8011C164)
    /* 2337C 8015CF74 64C1A524 */  addiu      $a1, $a1, %lo(D_8011C164)
    /* 23380 8015CF78 0300A288 */  lwl        $v0, 0x3($a1)
    /* 23384 8015CF7C 0000A298 */  lwr        $v0, 0x0($a1)
    /* 23388 8015CF80 00000000 */  nop
    /* 2338C 8015CF84 1B00A2AB */  swl        $v0, 0x1B($sp)
    /* 23390 8015CF88 1800A2BB */  swr        $v0, 0x18($sp)
    /* 23394 8015CF8C 21880000 */  addu       $s1, $zero, $zero
    /* 23398 8015CF90 0F00B327 */  addiu      $s3, $sp, 0xF
  .L8015CF94:
    /* 2339C 8015CF94 21800000 */  addu       $s0, $zero, $zero
    /* 233A0 8015CF98 C0901100 */  sll        $s2, $s1, 3
  .L8015CF9C:
    /* 233A4 8015CF9C C0101400 */  sll        $v0, $s4, 3
    /* 233A8 8015CFA0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 233AC 8015CFA4 21083200 */  addu       $at, $at, $s2
    /* 233B0 8015CFA8 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 233B4 8015CFAC 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 233B8 8015CFB0 21082200 */  addu       $at, $at, $v0
    /* 233BC 8015CFB4 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 233C0 8015CFB8 00000000 */  nop
    /* 233C4 8015CFBC 1C006214 */  bne        $v1, $v0, .L8015D030
    /* 233C8 8015CFC0 21200002 */   addu      $a0, $s0, $zero
    /* 233CC 8015CFC4 380B020C */  jal        GetSOLID__Fii
    /* 233D0 8015CFC8 21282002 */   addu      $a1, $s1, $zero
    /* 233D4 8015CFCC 01004238 */  xori       $v0, $v0, 0x1
    /* 233D8 8015CFD0 17004010 */  beqz       $v0, .L8015D030
    /* 233DC 8015CFD4 00000000 */   nop
    /* 233E0 8015CFD8 1280023C */  lui        $v0, %hi(leveltype)
    /* 233E4 8015CFDC 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 233E8 8015CFE0 00000000 */  nop
    /* 233EC 8015CFE4 21106202 */  addu       $v0, $s3, $v0
    /* 233F0 8015CFE8 00004480 */  lb         $a0, 0x0($v0)
    /* 233F4 8015CFEC C9F6000C */  jal        ENG_random__Fl
    /* 233F8 8015CFF0 00000000 */   nop
    /* 233FC 8015CFF4 0E004014 */  bnez       $v0, .L8015D030
    /* 23400 8015CFF8 00000000 */   nop
    /* 23404 8015CFFC 1280023C */  lui        $v0, %hi(leveltype)
    /* 23408 8015D000 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 2340C 8015D004 00000000 */  nop
    /* 23410 8015D008 21106202 */  addu       $v0, $s3, $v0
    /* 23414 8015D00C 00004480 */  lb         $a0, 0x0($v0)
    /* 23418 8015D010 C9F6000C */  jal        ENG_random__Fl
    /* 2341C 8015D014 00000000 */   nop
    /* 23420 8015D018 02004014 */  bnez       $v0, .L8015D024
    /* 23424 8015D01C 3A000424 */   addiu     $a0, $zero, 0x3A
    /* 23428 8015D020 39000424 */  addiu      $a0, $zero, 0x39
  .L8015D024:
    /* 2342C 8015D024 21280002 */  addu       $a1, $s0, $zero
    /* 23430 8015D028 BE4E010C */  jal        AddObject__Fiii
    /* 23434 8015D02C 21302002 */   addu      $a2, $s1, $zero
  .L8015D030:
    /* 23438 8015D030 01001026 */  addiu      $s0, $s0, 0x1
    /* 2343C 8015D034 6000022A */  slti       $v0, $s0, 0x60
    /* 23440 8015D038 D8FF4014 */  bnez       $v0, .L8015CF9C
    /* 23444 8015D03C 80035226 */   addiu     $s2, $s2, 0x380
    /* 23448 8015D040 01003126 */  addiu      $s1, $s1, 0x1
    /* 2344C 8015D044 6000222A */  slti       $v0, $s1, 0x60
    /* 23450 8015D048 D2FF4014 */  bnez       $v0, .L8015CF94
    /* 23454 8015D04C 00000000 */   nop
    /* 23458 8015D050 1280023C */  lui        $v0, %hi(leveltype)
    /* 2345C 8015D054 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23460 8015D058 00000000 */  nop
    /* 23464 8015D05C 2110A203 */  addu       $v0, $sp, $v0
    /* 23468 8015D060 17004580 */  lb         $a1, 0x17($v0)
    /* 2346C 8015D064 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 23470 8015D068 21208002 */   addu      $a0, $s4, $zero
    /* 23474 8015D06C 3400BF8F */  lw         $ra, 0x34($sp)
    /* 23478 8015D070 3000B48F */  lw         $s4, 0x30($sp)
    /* 2347C 8015D074 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 23480 8015D078 2800B28F */  lw         $s2, 0x28($sp)
    /* 23484 8015D07C 2400B18F */  lw         $s1, 0x24($sp)
    /* 23488 8015D080 2000B08F */  lw         $s0, 0x20($sp)
    /* 2348C 8015D084 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 23490 8015D088 0800E003 */  jr         $ra
    /* 23494 8015D08C 00000000 */   nop
endlabel Theme_Barrel__Fi
