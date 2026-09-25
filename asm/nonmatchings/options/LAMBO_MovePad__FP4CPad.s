.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LAMBO_MovePad__FP4CPad, 0x1B0

glabel LAMBO_MovePad__FP4CPad
    /* 9B300 800AB300 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9B304 800AB304 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 9B308 800AB308 D00A848F */  lw         $a0, %gp_rel(options_pad)($gp)
    /* 9B30C 800AB30C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 9B310 800AB310 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9B314 800AB314 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9B318 800AB318 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9B31C 800AB31C C0100200 */  sll        $v0, $v0, 3
    /* 9B320 800AB320 0D80013C */  lui        $at, %hi(MenuList + 0x4)
    /* 9B324 800AB324 21082200 */  addu       $at, $at, $v0
    /* 9B328 800AB328 44D2328C */  lw         $s2, %lo(MenuList + 0x4)($at)
    /* 9B32C 800AB32C FD25020C */  jal        PAD_GetPad__FiUc
    /* 9B330 800AB330 21280000 */   addu      $a1, $zero, $zero
    /* 9B334 800AB334 21804000 */  addu       $s0, $v0, $zero
    /* 9B338 800AB338 21200002 */  addu       $a0, $s0, $zero
    /* 9B33C 800AB33C 6BAD020C */  jal        SetPadTick__4CPadUs_800ab5ac
    /* 9B340 800AB340 08000524 */   addiu     $a1, $zero, 0x8
    /* 9B344 800AB344 21200002 */  addu       $a0, $s0, $zero
    /* 9B348 800AB348 69AD020C */  jal        SetPadTickMask__4CPadUs_800ab5a4
    /* 9B34C 800AB34C 03000524 */   addiu     $a1, $zero, 0x3
    /* 9B350 800AB350 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 9B354 800AB354 21200002 */   addu      $a0, $s0, $zero
    /* 9B358 800AB358 01004230 */  andi       $v0, $v0, 0x1
    /* 9B35C 800AB35C 23880200 */  negu       $s1, $v0
    /* 9B360 800AB360 4BAD020C */  jal        GetTick__C4CPad_800ab52c
    /* 9B364 800AB364 21200002 */   addu      $a0, $s0, $zero
    /* 9B368 800AB368 02004230 */  andi       $v0, $v0, 0x2
    /* 9B36C 800AB36C 02004010 */  beqz       $v0, .L800AB378
    /* 9B370 800AB370 00000000 */   nop
    /* 9B374 800AB374 01001124 */  addiu      $s1, $zero, 0x1
  .L800AB378:
    /* 9B378 800AB378 B00A858F */  lw         $a1, %gp_rel(D_8011B230)($gp)
    /* 9B37C 800AB37C 00000000 */  nop
    /* 9B380 800AB380 2110B100 */  addu       $v0, $a1, $s1
    /* 9B384 800AB384 40180200 */  sll        $v1, $v0, 1
    /* 9B388 800AB388 21186200 */  addu       $v1, $v1, $v0
    /* 9B38C 800AB38C C0180300 */  sll        $v1, $v1, 3
    /* 9B390 800AB390 21187200 */  addu       $v1, $v1, $s2
    /* 9B394 800AB394 0400638C */  lw         $v1, 0x4($v1)
    /* 9B398 800AB398 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9B39C 800AB39C 1E006014 */  bnez       $v1, .L800AB418
    /* 9B3A0 800AB3A0 00000000 */   nop
    /* 9B3A4 800AB3A4 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 9B3A8 800AB3A8 00000000 */  nop
    /* 9B3AC 800AB3AC C0200200 */  sll        $a0, $v0, 3
  .L800AB3B0:
    /* 9B3B0 800AB3B0 02002016 */  bnez       $s1, .L800AB3BC
    /* 9B3B4 800AB3B4 00000000 */   nop
    /* 9B3B8 800AB3B8 01001124 */  addiu      $s1, $zero, 0x1
  .L800AB3BC:
    /* 9B3BC 800AB3BC B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 9B3C0 800AB3C0 00000000 */  nop
    /* 9B3C4 800AB3C4 02006104 */  bgez       $v1, .L800AB3D0
    /* 9B3C8 800AB3C8 00000000 */   nop
    /* 9B3CC 800AB3CC 01001124 */  addiu      $s1, $zero, 0x1
  .L800AB3D0:
    /* 9B3D0 800AB3D0 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 9B3D4 800AB3D4 21082400 */  addu       $at, $at, $a0
    /* 9B3D8 800AB3D8 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 9B3DC 800AB3DC 00000000 */  nop
    /* 9B3E0 800AB3E0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9B3E4 800AB3E4 2A106200 */  slt        $v0, $v1, $v0
    /* 9B3E8 800AB3E8 03004014 */  bnez       $v0, .L800AB3F8
    /* 9B3EC 800AB3EC 21107100 */   addu      $v0, $v1, $s1
    /* 9B3F0 800AB3F0 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 9B3F4 800AB3F4 21107100 */  addu       $v0, $v1, $s1
  .L800AB3F8:
    /* 9B3F8 800AB3F8 40180200 */  sll        $v1, $v0, 1
    /* 9B3FC 800AB3FC 21186200 */  addu       $v1, $v1, $v0
    /* 9B400 800AB400 C0180300 */  sll        $v1, $v1, 3
    /* 9B404 800AB404 21187200 */  addu       $v1, $v1, $s2
    /* 9B408 800AB408 0400638C */  lw         $v1, 0x4($v1)
    /* 9B40C 800AB40C B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9B410 800AB410 E7FF6010 */  beqz       $v1, .L800AB3B0
    /* 9B414 800AB414 00000000 */   nop
  .L800AB418:
    /* 9B418 800AB418 B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9B41C 800AB41C 00000000 */  nop
    /* 9B420 800AB420 0A00401C */  bgtz       $v0, .L800AB44C
    /* 9B424 800AB424 00000000 */   nop
    /* 9B428 800AB428 BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 9B42C 800AB42C 00000000 */  nop
    /* 9B430 800AB430 C0100200 */  sll        $v0, $v0, 3
    /* 9B434 800AB434 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 9B438 800AB438 21082200 */  addu       $at, $at, $v0
    /* 9B43C 800AB43C 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 9B440 800AB440 00000000 */  nop
    /* 9B444 800AB444 FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 9B448 800AB448 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800AB44C:
    /* 9B44C 800AB44C BC0A828F */  lw         $v0, %gp_rel(cmenu)($gp)
    /* 9B450 800AB450 00000000 */  nop
    /* 9B454 800AB454 C0100200 */  sll        $v0, $v0, 3
    /* 9B458 800AB458 0D80013C */  lui        $at, %hi(MenuList + 0x3)
    /* 9B45C 800AB45C 21082200 */  addu       $at, $at, $v0
    /* 9B460 800AB460 43D22290 */  lbu        $v0, %lo(MenuList + 0x3)($at)
    /* 9B464 800AB464 B00A838F */  lw         $v1, %gp_rel(D_8011B230)($gp)
    /* 9B468 800AB468 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9B46C 800AB46C 2A186200 */  slt        $v1, $v1, $v0
    /* 9B470 800AB470 02006014 */  bnez       $v1, .L800AB47C
    /* 9B474 800AB474 01000224 */   addiu     $v0, $zero, 0x1
    /* 9B478 800AB478 B00A82AF */  sw         $v0, %gp_rel(D_8011B230)($gp)
  .L800AB47C:
    /* 9B47C 800AB47C B00A828F */  lw         $v0, %gp_rel(D_8011B230)($gp)
    /* 9B480 800AB480 00000000 */  nop
    /* 9B484 800AB484 03004510 */  beq        $v0, $a1, .L800AB494
    /* 9B488 800AB488 00000000 */   nop
    /* 9B48C 800AB48C C6F5000C */  jal        PlaySFX__Fi
    /* 9B490 800AB490 32000424 */   addiu     $a0, $zero, 0x32
  .L800AB494:
    /* 9B494 800AB494 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 9B498 800AB498 1800B28F */  lw         $s2, 0x18($sp)
    /* 9B49C 800AB49C 1400B18F */  lw         $s1, 0x14($sp)
    /* 9B4A0 800AB4A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 9B4A4 800AB4A4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9B4A8 800AB4A8 0800E003 */  jr         $ra
    /* 9B4AC 800AB4AC 00000000 */   nop
endlabel LAMBO_MovePad__FP4CPad
