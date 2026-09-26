.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_SnotSpil__Fi, 0x250

glabel MAI_SnotSpil__Fi
    /* 1A384 80153F7C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1A388 80153F80 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1A38C 80153F84 21888000 */  addu       $s1, $a0, $zero
    /* 1A390 80153F88 40101100 */  sll        $v0, $s1, 1
    /* 1A394 80153F8C 21105100 */  addu       $v0, $v0, $s1
    /* 1A398 80153F90 80100200 */  sll        $v0, $v0, 2
    /* 1A39C 80153F94 21105100 */  addu       $v0, $v0, $s1
    /* 1A3A0 80153F98 C0100200 */  sll        $v0, $v0, 3
    /* 1A3A4 80153F9C 1080033C */  lui        $v1, %hi(monster)
    /* 1A3A8 80153FA0 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 1A3AC 80153FA4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1A3B0 80153FA8 21804300 */  addu       $s0, $v0, $v1
    /* 1A3B4 80153FAC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1A3B8 80153FB0 34001282 */  lb         $s2, 0x34($s0)
    /* 1A3BC 80153FB4 2400BFAF */  sw         $ra, 0x24($sp)
    /* 1A3C0 80153FB8 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1A3C4 80153FBC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1A3C8 80153FC0 33000282 */  lb         $v0, 0x33($s0)
    /* 1A3CC 80153FC4 35001382 */  lb         $s3, 0x35($s0)
    /* 1A3D0 80153FC8 77004014 */  bnez       $v0, .L801541A8
    /* 1A3D4 80153FCC 00000000 */   nop
    /* 1A3D8 80153FD0 EB2A050C */  jal        M_GetDir__Fi
    /* 1A3DC 80153FD4 00000000 */   nop
    /* 1A3E0 80153FD8 21A04000 */  addu       $s4, $v0, $zero
    /* 1A3E4 80153FDC 0000038E */  lw         $v1, 0x0($s0)
    /* 1A3E8 80153FE0 14000224 */  addiu      $v0, $zero, 0x14
    /* 1A3EC 80153FE4 16006214 */  bne        $v1, $v0, .L80154040
    /* 1A3F0 80153FE8 15000224 */   addiu     $v0, $zero, 0x15
    /* 1A3F4 80153FEC C0101300 */  sll        $v0, $s3, 3
    /* 1A3F8 80153FF0 C0181200 */  sll        $v1, $s2, 3
    /* 1A3FC 80153FF4 23187200 */  subu       $v1, $v1, $s2
    /* 1A400 80153FF8 C0190300 */  sll        $v1, $v1, 7
    /* 1A404 80153FFC 21104300 */  addu       $v0, $v0, $v1
    /* 1A408 80154000 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1A40C 80154004 21082200 */  addu       $at, $at, $v0
    /* 1A410 80154008 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1A414 8015400C 00000000 */  nop
    /* 1A418 80154010 04004230 */  andi       $v0, $v0, 0x4
    /* 1A41C 80154014 08004014 */  bnez       $v0, .L80154038
    /* 1A420 80154018 07000224 */   addiu     $v0, $zero, 0x7
    /* 1A424 8015401C 49000392 */  lbu        $v1, 0x49($s0)
    /* 1A428 80154020 00000000 */  nop
    /* 1A42C 80154024 04006214 */  bne        $v1, $v0, .L80154038
    /* 1A430 80154028 15000224 */   addiu     $v0, $zero, 0x15
    /* 1A434 8015402C 000002AE */  sw         $v0, 0x0($s0)
    /* 1A438 80154030 06000224 */  addiu      $v0, $zero, 0x6
    /* 1A43C 80154034 490002A2 */  sb         $v0, 0x49($s0)
  .L80154038:
    /* 1A440 80154038 0000038E */  lw         $v1, 0x0($s0)
    /* 1A444 8015403C 15000224 */  addiu      $v0, $zero, 0x15
  .L80154040:
    /* 1A448 80154040 0A006214 */  bne        $v1, $v0, .L8015406C
    /* 1A44C 80154044 C0101300 */   sll       $v0, $s3, 3
    /* 1A450 80154048 0E80033C */  lui        $v1, %hi(quests + 0x9B)
    /* 1A454 8015404C DBDA6390 */  lbu        $v1, %lo(quests + 0x9B)($v1)
    /* 1A458 80154050 03000224 */  addiu      $v0, $zero, 0x3
    /* 1A45C 80154054 05006214 */  bne        $v1, $v0, .L8015406C
    /* 1A460 80154058 C0101300 */   sll       $v0, $s3, 3
    /* 1A464 8015405C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1A468 80154060 000000AE */  sw         $zero, 0x0($s0)
    /* 1A46C 80154064 490002A2 */  sb         $v0, 0x49($s0)
    /* 1A470 80154068 C0101300 */  sll        $v0, $s3, 3
  .L8015406C:
    /* 1A474 8015406C C0181200 */  sll        $v1, $s2, 3
    /* 1A478 80154070 23187200 */  subu       $v1, $v1, $s2
    /* 1A47C 80154074 C0190300 */  sll        $v1, $v1, 7
    /* 1A480 80154078 21104300 */  addu       $v0, $v0, $v1
    /* 1A484 8015407C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1A488 80154080 21082200 */  addu       $at, $at, $v0
    /* 1A48C 80154084 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1A490 80154088 00000000 */  nop
    /* 1A494 8015408C 04004230 */  andi       $v0, $v0, 0x4
    /* 1A498 80154090 38004010 */  beqz       $v0, .L80154174
    /* 1A49C 80154094 16000224 */   addiu     $v0, $zero, 0x16
    /* 1A4A0 80154098 0000038E */  lw         $v1, 0x0($s0)
    /* 1A4A4 8015409C 00000000 */  nop
    /* 1A4A8 801540A0 27006214 */  bne        $v1, $v0, .L80154140
    /* 1A4AC 801540A4 00000000 */   nop
    /* 1A4B0 801540A8 CDF3000C */  jal        effect_is_playing__Fi
    /* 1A4B4 801540AC 57030424 */   addiu     $a0, $zero, 0x357
    /* 1A4B8 801540B0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1A4BC 801540B4 22004014 */  bnez       $v0, .L80154140
    /* 1A4C0 801540B8 07000224 */   addiu     $v0, $zero, 0x7
    /* 1A4C4 801540BC 49000392 */  lbu        $v1, 0x49($s0)
    /* 1A4C8 801540C0 00000000 */  nop
    /* 1A4CC 801540C4 1E006214 */  bne        $v1, $v0, .L80154140
    /* 1A4D0 801540C8 00000000 */   nop
    /* 1A4D4 801540CC 1280043C */  lui        $a0, %hi(setpc_x)
    /* 1A4D8 801540D0 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 1A4DC 801540D4 1280053C */  lui        $a1, %hi(setpc_y)
    /* 1A4E0 801540D8 E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 1A4E4 801540DC 1280023C */  lui        $v0, %hi(setpc_w)
    /* 1A4E8 801540E0 ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 1A4EC 801540E4 1280033C */  lui        $v1, %hi(setpc_h)
    /* 1A4F0 801540E8 F0C0638C */  lw         $v1, %lo(setpc_h)($v1)
    /* 1A4F4 801540EC 21308200 */  addu       $a2, $a0, $v0
    /* 1A4F8 801540F0 2138A300 */  addu       $a3, $a1, $v1
    /* 1A4FC 801540F4 0100C624 */  addiu      $a2, $a2, 0x1
    /* 1A500 801540F8 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 1A504 801540FC 0100E724 */   addiu     $a3, $a3, 0x1
    /* 1A508 80154100 1280033C */  lui        $v1, %hi(deltaload)
    /* 1A50C 80154104 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 1A510 80154108 03000224 */  addiu      $v0, $zero, 0x3
    /* 1A514 8015410C 0E80013C */  lui        $at, %hi(quests + 0x9B)
    /* 1A518 80154110 DBDA22A0 */  sb         $v0, %lo(quests + 0x9B)($at)
    /* 1A51C 80154114 03006014 */  bnez       $v1, .L80154124
    /* 1A520 80154118 01000424 */   addiu     $a0, $zero, 0x1
    /* 1A524 8015411C 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 1A528 80154120 07000524 */   addiu     $a1, $zero, 0x7
  .L80154124:
    /* 1A52C 80154124 0857010C */  jal        RedoPlayerVision__Fv
    /* 1A530 80154128 00000000 */   nop
    /* 1A534 8015412C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1A538 80154130 490002A2 */  sb         $v0, 0x49($s0)
    /* 1A53C 80154134 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 1A540 80154138 4E0002A2 */  sb         $v0, 0x4E($s0)
    /* 1A544 8015413C 000000AE */  sw         $zero, 0x0($s0)
  .L80154140:
    /* 1A548 80154140 0E80033C */  lui        $v1, %hi(quests + 0x9B)
    /* 1A54C 80154144 DBDA6390 */  lbu        $v1, %lo(quests + 0x9B)($v1)
    /* 1A550 80154148 03000224 */  addiu      $v0, $zero, 0x3
    /* 1A554 8015414C 0A006214 */  bne        $v1, $v0, .L80154178
    /* 1A558 80154150 40101100 */   sll       $v0, $s1, 1
    /* 1A55C 80154154 49000392 */  lbu        $v1, 0x49($s0)
    /* 1A560 80154158 01000224 */  addiu      $v0, $zero, 0x1
    /* 1A564 8015415C 03006210 */  beq        $v1, $v0, .L8015416C
    /* 1A568 80154160 05000224 */   addiu     $v0, $zero, 0x5
    /* 1A56C 80154164 04006214 */  bne        $v1, $v0, .L80154178
    /* 1A570 80154168 40101100 */   sll       $v0, $s1, 1
  .L8015416C:
    /* 1A574 8015416C 6144050C */  jal        MAI_Fallen__Fi
    /* 1A578 80154170 21202002 */   addu      $a0, $s1, $zero
  .L80154174:
    /* 1A57C 80154174 40101100 */  sll        $v0, $s1, 1
  .L80154178:
    /* 1A580 80154178 21105100 */  addu       $v0, $v0, $s1
    /* 1A584 8015417C 80100200 */  sll        $v0, $v0, 2
    /* 1A588 80154180 21105100 */  addu       $v0, $v0, $s1
    /* 1A58C 80154184 C0100200 */  sll        $v0, $v0, 3
    /* 1A590 80154188 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1A594 8015418C 21082200 */  addu       $at, $at, $v0
    /* 1A598 80154190 D05334A0 */  sb         $s4, %lo(monster + 0x3C)($at)
    /* 1A59C 80154194 33000282 */  lb         $v0, 0x33($s0)
    /* 1A5A0 80154198 00000000 */  nop
    /* 1A5A4 8015419C 02004014 */  bnez       $v0, .L801541A8
    /* 1A5A8 801541A0 00000000 */   nop
    /* 1A5AC 801541A4 5A0000A2 */  sb         $zero, 0x5A($s0)
  .L801541A8:
    /* 1A5B0 801541A8 2400BF8F */  lw         $ra, 0x24($sp)
    /* 1A5B4 801541AC 2000B48F */  lw         $s4, 0x20($sp)
    /* 1A5B8 801541B0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1A5BC 801541B4 1800B28F */  lw         $s2, 0x18($sp)
    /* 1A5C0 801541B8 1400B18F */  lw         $s1, 0x14($sp)
    /* 1A5C4 801541BC 1000B08F */  lw         $s0, 0x10($sp)
    /* 1A5C8 801541C0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1A5CC 801541C4 0800E003 */  jr         $ra
    /* 1A5D0 801541C8 00000000 */   nop
endlabel MAI_SnotSpil__Fi
