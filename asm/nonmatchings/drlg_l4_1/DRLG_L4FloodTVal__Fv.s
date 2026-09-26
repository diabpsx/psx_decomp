.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4FloodTVal__Fv, 0x218

glabel DRLG_L4FloodTVal__Fv
    /* 1A2E0 80153ED8 1280023C */  lui        $v0, %hi(TransVal)
    /* 1A2E4 80153EDC 48C14280 */  lb         $v0, %lo(TransVal)($v0)
    /* 1A2E8 80153EE0 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1A2EC 80153EE4 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 1A2F0 80153EE8 3800B6AF */  sw         $s6, 0x38($sp)
    /* 1A2F4 80153EEC 3400B5AF */  sw         $s5, 0x34($sp)
    /* 1A2F8 80153EF0 3000B4AF */  sw         $s4, 0x30($sp)
    /* 1A2FC 80153EF4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 1A300 80153EF8 2800B2AF */  sw         $s2, 0x28($sp)
    /* 1A304 80153EFC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 1A308 80153F00 2000B0AF */  sw         $s0, 0x20($sp)
    /* 1A30C 80153F04 04004014 */  bnez       $v0, .L80153F18
    /* 1A310 80153F08 21184000 */   addu      $v1, $v0, $zero
    /* 1A314 80153F0C 01006224 */  addiu      $v0, $v1, 0x1
    /* 1A318 80153F10 1280013C */  lui        $at, %hi(TransVal)
    /* 1A31C 80153F14 48C122A0 */  sb         $v0, %lo(TransVal)($at)
  .L80153F18:
    /* 1A320 80153F18 1280033C */  lui        $v1, %hi(currlevel)
    /* 1A324 80153F1C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1A328 80153F20 10000224 */  addiu      $v0, $zero, 0x10
    /* 1A32C 80153F24 3D006214 */  bne        $v1, $v0, .L8015401C
    /* 1A330 80153F28 10001524 */   addiu     $s5, $zero, 0x10
    /* 1A334 80153F2C 21980000 */  addu       $s3, $zero, $zero
    /* 1A338 80153F30 0E800C3C */  lui        $t4, %hi(dungeon)
    /* 1A33C 80153F34 C4408C25 */  addiu      $t4, $t4, %lo(dungeon)
    /* 1A340 80153F38 06000B24 */  addiu      $t3, $zero, 0x6
    /* 1A344 80153F3C 88000824 */  addiu      $t0, $zero, 0x88
  .L80153F40:
    /* 1A348 80153F40 21800000 */  addu       $s0, $zero, $zero
    /* 1A34C 80153F44 40501300 */  sll        $t2, $s3, 1
    /* 1A350 80153F48 21388001 */  addu       $a3, $t4, $zero
    /* 1A354 80153F4C 803B0524 */  addiu      $a1, $zero, 0x3B80
    /* 1A358 80153F50 C0481500 */  sll        $t1, $s5, 3
    /* 1A35C 80153F54 00382425 */  addiu      $a0, $t1, 0x3800
    /* 1A360 80153F58 00380624 */  addiu      $a2, $zero, 0x3800
  .L80153F5C:
    /* 1A364 80153F5C 21104701 */  addu       $v0, $t2, $a3
    /* 1A368 80153F60 00004294 */  lhu        $v0, 0x0($v0)
    /* 1A36C 80153F64 00000000 */  nop
    /* 1A370 80153F68 1E004B14 */  bne        $v0, $t3, .L80153FE4
    /* 1A374 80153F6C 00000000 */   nop
    /* 1A378 80153F70 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A37C 80153F74 21082400 */  addu       $at, $at, $a0
    /* 1A380 80153F78 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 1A384 80153F7C 00000000 */  nop
    /* 1A388 80153F80 18004014 */  bnez       $v0, .L80153FE4
    /* 1A38C 80153F84 00000000 */   nop
    /* 1A390 80153F88 1280023C */  lui        $v0, %hi(TransVal)
    /* 1A394 80153F8C 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* 1A398 80153F90 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A39C 80153F94 21082400 */  addu       $at, $at, $a0
    /* 1A3A0 80153F98 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 1A3A4 80153F9C 1280033C */  lui        $v1, %hi(TransVal)
    /* 1A3A8 80153FA0 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 1A3AC 80153FA4 21102501 */  addu       $v0, $t1, $a1
    /* 1A3B0 80153FA8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A3B4 80153FAC 21082200 */  addu       $at, $at, $v0
    /* 1A3B8 80153FB0 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A3BC 80153FB4 1280033C */  lui        $v1, %hi(TransVal)
    /* 1A3C0 80153FB8 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 1A3C4 80153FBC 21100601 */  addu       $v0, $t0, $a2
    /* 1A3C8 80153FC0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A3CC 80153FC4 21082200 */  addu       $at, $at, $v0
    /* 1A3D0 80153FC8 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A3D4 80153FCC 1280033C */  lui        $v1, %hi(TransVal)
    /* 1A3D8 80153FD0 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* 1A3DC 80153FD4 21100501 */  addu       $v0, $t0, $a1
    /* 1A3E0 80153FD8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A3E4 80153FDC 21082200 */  addu       $at, $at, $v0
    /* 1A3E8 80153FE0 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
  .L80153FE4:
    /* 1A3EC 80153FE4 0007A524 */  addiu      $a1, $a1, 0x700
    /* 1A3F0 80153FE8 00078424 */  addiu      $a0, $a0, 0x700
    /* 1A3F4 80153FEC 0007C624 */  addiu      $a2, $a2, 0x700
    /* 1A3F8 80153FF0 01001026 */  addiu      $s0, $s0, 0x1
    /* 1A3FC 80153FF4 2800022A */  slti       $v0, $s0, 0x28
    /* 1A400 80153FF8 D8FF4014 */  bnez       $v0, .L80153F5C
    /* 1A404 80153FFC 6000E724 */   addiu     $a3, $a3, 0x60
    /* 1A408 80154000 10000825 */  addiu      $t0, $t0, 0x10
    /* 1A40C 80154004 01007326 */  addiu      $s3, $s3, 0x1
    /* 1A410 80154008 2800622A */  slti       $v0, $s3, 0x28
    /* 1A414 8015400C CCFF4014 */  bnez       $v0, .L80153F40
    /* 1A418 80154010 0200B526 */   addiu     $s5, $s5, 0x2
    /* 1A41C 80154014 31500508 */  j          .L801540C4
    /* 1A420 80154018 00000000 */   nop
  .L8015401C:
    /* 1A424 8015401C 21980000 */  addu       $s3, $zero, $zero
    /* 1A428 80154020 0E80163C */  lui        $s6, %hi(dungeon)
    /* 1A42C 80154024 C440D626 */  addiu      $s6, $s6, %lo(dungeon)
  .L80154028:
    /* 1A430 80154028 10001424 */  addiu      $s4, $zero, 0x10
    /* 1A434 8015402C 21800000 */  addu       $s0, $zero, $zero
    /* 1A438 80154030 2190C002 */  addu       $s2, $s6, $zero
    /* 1A43C 80154034 C0101500 */  sll        $v0, $s5, 3
    /* 1A440 80154038 00385124 */  addiu      $s1, $v0, 0x3800
  .L8015403C:
    /* 1A444 8015403C 40101300 */  sll        $v0, $s3, 1
    /* 1A448 80154040 21105200 */  addu       $v0, $v0, $s2
    /* 1A44C 80154044 00004394 */  lhu        $v1, 0x0($v0)
    /* 1A450 80154048 06000224 */  addiu      $v0, $zero, 0x6
    /* 1A454 8015404C 13006214 */  bne        $v1, $v0, .L8015409C
    /* 1A458 80154050 00000000 */   nop
    /* 1A45C 80154054 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A460 80154058 21083100 */  addu       $at, $at, $s1
    /* 1A464 8015405C 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 1A468 80154060 00000000 */  nop
    /* 1A46C 80154064 0D004014 */  bnez       $v0, .L8015409C
    /* 1A470 80154068 21200002 */   addu      $a0, $s0, $zero
    /* 1A474 8015406C 21286002 */  addu       $a1, $s3, $zero
    /* 1A478 80154070 21308002 */  addu       $a2, $s4, $zero
    /* 1A47C 80154074 2138A002 */  addu       $a3, $s5, $zero
    /* 1A480 80154078 F81780AF */  sw         $zero, %gp_rel(D_8011BF78)($gp)
    /* 1A484 8015407C 8C4E050C */  jal        DRLG_L4FTVR__Fiiiii
    /* 1A488 80154080 1000A0AF */   sw        $zero, 0x10($sp)
    /* 1A48C 80154084 1280023C */  lui        $v0, %hi(TransVal)
    /* 1A490 80154088 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* 1A494 8015408C 00000000 */  nop
    /* 1A498 80154090 01004224 */  addiu      $v0, $v0, 0x1
    /* 1A49C 80154094 1280013C */  lui        $at, %hi(TransVal)
    /* 1A4A0 80154098 48C122A0 */  sb         $v0, %lo(TransVal)($at)
  .L8015409C:
    /* 1A4A4 8015409C 00073126 */  addiu      $s1, $s1, 0x700
    /* 1A4A8 801540A0 02009426 */  addiu      $s4, $s4, 0x2
    /* 1A4AC 801540A4 01001026 */  addiu      $s0, $s0, 0x1
    /* 1A4B0 801540A8 2800022A */  slti       $v0, $s0, 0x28
    /* 1A4B4 801540AC E3FF4014 */  bnez       $v0, .L8015403C
    /* 1A4B8 801540B0 60005226 */   addiu     $s2, $s2, 0x60
    /* 1A4BC 801540B4 01007326 */  addiu      $s3, $s3, 0x1
    /* 1A4C0 801540B8 2800622A */  slti       $v0, $s3, 0x28
    /* 1A4C4 801540BC DAFF4014 */  bnez       $v0, .L80154028
    /* 1A4C8 801540C0 0200B526 */   addiu     $s5, $s5, 0x2
  .L801540C4:
    /* 1A4CC 801540C4 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 1A4D0 801540C8 3800B68F */  lw         $s6, 0x38($sp)
    /* 1A4D4 801540CC 3400B58F */  lw         $s5, 0x34($sp)
    /* 1A4D8 801540D0 3000B48F */  lw         $s4, 0x30($sp)
    /* 1A4DC 801540D4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 1A4E0 801540D8 2800B28F */  lw         $s2, 0x28($sp)
    /* 1A4E4 801540DC 2400B18F */  lw         $s1, 0x24($sp)
    /* 1A4E8 801540E0 2000B08F */  lw         $s0, 0x20($sp)
    /* 1A4EC 801540E4 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1A4F0 801540E8 0800E003 */  jr         $ra
    /* 1A4F4 801540EC 00000000 */   nop
endlabel DRLG_L4FloodTVal__Fv
