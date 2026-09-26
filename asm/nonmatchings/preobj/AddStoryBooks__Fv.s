.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddStoryBooks__Fv, 0x148

glabel AddStoryBooks__Fv
    /* 1F338 80158F30 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1F33C 80158F34 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1F340 80158F38 21A80000 */  addu       $s5, $zero, $zero
    /* 1F344 80158F3C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1F348 80158F40 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1F34C 80158F44 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1F350 80158F48 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1F354 80158F4C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1F358 80158F50 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1F35C 80158F54 01001224 */  addiu      $s2, $zero, 0x1
  .L80158F58:
    /* 1F360 80158F58 C9F6000C */  jal        ENG_random__Fl
    /* 1F364 80158F5C 40000424 */   addiu     $a0, $zero, 0x40
    /* 1F368 80158F60 40000424 */  addiu      $a0, $zero, 0x40
    /* 1F36C 80158F64 C9F6000C */  jal        ENG_random__Fl
    /* 1F370 80158F68 10005324 */   addiu     $s3, $v0, 0x10
    /* 1F374 80158F6C 10005424 */  addiu      $s4, $v0, 0x10
    /* 1F378 80158F70 FEFF1124 */  addiu      $s1, $zero, -0x2
  .L80158F74:
    /* 1F37C 80158F74 FDFF1024 */  addiu      $s0, $zero, -0x3
    /* 1F380 80158F78 21207002 */  addu       $a0, $s3, $s0
  .L80158F7C:
    /* 1F384 80158F7C 305D050C */  jal        RndLocOk__Fii
    /* 1F388 80158F80 21289102 */   addu      $a1, $s4, $s1
    /* 1F38C 80158F84 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1F390 80158F88 02004014 */  bnez       $v0, .L80158F94
    /* 1F394 80158F8C 00000000 */   nop
    /* 1F398 80158F90 21900000 */  addu       $s2, $zero, $zero
  .L80158F94:
    /* 1F39C 80158F94 01001026 */  addiu      $s0, $s0, 0x1
    /* 1F3A0 80158F98 0400022A */  slti       $v0, $s0, 0x4
    /* 1F3A4 80158F9C F7FF4014 */  bnez       $v0, .L80158F7C
    /* 1F3A8 80158FA0 21207002 */   addu      $a0, $s3, $s0
    /* 1F3AC 80158FA4 01003126 */  addiu      $s1, $s1, 0x1
    /* 1F3B0 80158FA8 0300222A */  slti       $v0, $s1, 0x3
    /* 1F3B4 80158FAC F1FF4014 */  bnez       $v0, .L80158F74
    /* 1F3B8 80158FB0 FF004232 */   andi      $v0, $s2, 0xFF
    /* 1F3BC 80158FB4 06004014 */  bnez       $v0, .L80158FD0
    /* 1F3C0 80158FB8 0100B526 */   addiu     $s5, $s5, 0x1
    /* 1F3C4 80158FBC 214EA22A */  slti       $v0, $s5, 0x4E21
    /* 1F3C8 80158FC0 23004010 */  beqz       $v0, .L80159050
    /* 1F3CC 80158FC4 01001224 */   addiu     $s2, $zero, 0x1
    /* 1F3D0 80158FC8 D6630508 */  j          .L80158F58
    /* 1F3D4 80158FCC 00000000 */   nop
  .L80158FD0:
    /* 1F3D8 80158FD0 56000424 */  addiu      $a0, $zero, 0x56
    /* 1F3DC 80158FD4 21286002 */  addu       $a1, $s3, $zero
    /* 1F3E0 80158FD8 BE4E010C */  jal        AddObject__Fiii
    /* 1F3E4 80158FDC 21308002 */   addu      $a2, $s4, $zero
    /* 1F3E8 80158FE0 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F3EC 80158FE4 FEFF7026 */  addiu      $s0, $s3, -0x2
    /* 1F3F0 80158FE8 21280002 */  addu       $a1, $s0, $zero
    /* 1F3F4 80158FEC 01009126 */  addiu      $s1, $s4, 0x1
    /* 1F3F8 80158FF0 BE4E010C */  jal        AddObject__Fiii
    /* 1F3FC 80158FF4 21302002 */   addu      $a2, $s1, $zero
    /* 1F400 80158FF8 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F404 80158FFC 21280002 */  addu       $a1, $s0, $zero
    /* 1F408 80159000 BE4E010C */  jal        AddObject__Fiii
    /* 1F40C 80159004 21308002 */   addu      $a2, $s4, $zero
    /* 1F410 80159008 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F414 8015900C FFFF6526 */  addiu      $a1, $s3, -0x1
    /* 1F418 80159010 FFFF9026 */  addiu      $s0, $s4, -0x1
    /* 1F41C 80159014 BE4E010C */  jal        AddObject__Fiii
    /* 1F420 80159018 21300002 */   addu      $a2, $s0, $zero
    /* 1F424 8015901C 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F428 80159020 01006526 */  addiu      $a1, $s3, 0x1
    /* 1F42C 80159024 BE4E010C */  jal        AddObject__Fiii
    /* 1F430 80159028 21300002 */   addu      $a2, $s0, $zero
    /* 1F434 8015902C 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F438 80159030 02007026 */  addiu      $s0, $s3, 0x2
    /* 1F43C 80159034 21280002 */  addu       $a1, $s0, $zero
    /* 1F440 80159038 BE4E010C */  jal        AddObject__Fiii
    /* 1F444 8015903C 21308002 */   addu      $a2, $s4, $zero
    /* 1F448 80159040 57000424 */  addiu      $a0, $zero, 0x57
    /* 1F44C 80159044 21280002 */  addu       $a1, $s0, $zero
    /* 1F450 80159048 BE4E010C */  jal        AddObject__Fiii
    /* 1F454 8015904C 21302002 */   addu      $a2, $s1, $zero
  .L80159050:
    /* 1F458 80159050 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1F45C 80159054 2400B58F */  lw         $s5, 0x24($sp)
    /* 1F460 80159058 2000B48F */  lw         $s4, 0x20($sp)
    /* 1F464 8015905C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1F468 80159060 1800B28F */  lw         $s2, 0x18($sp)
    /* 1F46C 80159064 1400B18F */  lw         $s1, 0x14($sp)
    /* 1F470 80159068 1000B08F */  lw         $s0, 0x10($sp)
    /* 1F474 8015906C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1F478 80159070 0800E003 */  jr         $ra
    /* 1F47C 80159074 00000000 */   nop
endlabel AddStoryBooks__Fv
