.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L2SetRoom__Fii, 0x100

glabel DRLG_L2SetRoom__Fii
    /* A364 80143F5C F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* A368 80143F60 21500000 */  addu       $t2, $zero, $zero
    /* A36C 80143F64 1280083C */  lui        $t0, %hi(pSetPiece)
    /* A370 80143F68 DCC0088D */  lw         $t0, %lo(pSetPiece)($t0)
    /* A374 80143F6C 1280023C */  lui        $v0, %hi(pSetPiece)
    /* A378 80143F70 DCC0428C */  lw         $v0, %lo(pSetPiece)($v0)
    /* A37C 80143F74 00000C91 */  lbu        $t4, 0x0($t0)
    /* A380 80143F78 02000D91 */  lbu        $t5, 0x2($t0)
    /* A384 80143F7C 1280013C */  lui        $at, %hi(setpc_x)
    /* A388 80143F80 E4C024AC */  sw         $a0, %lo(setpc_x)($at)
    /* A38C 80143F84 1280013C */  lui        $at, %hi(setpc_y)
    /* A390 80143F88 E8C025AC */  sw         $a1, %lo(setpc_y)($at)
    /* A394 80143F8C 1280013C */  lui        $at, %hi(setpc_w)
    /* A398 80143F90 ECC02CAC */  sw         $t4, %lo(setpc_w)($at)
    /* A39C 80143F94 1280013C */  lui        $at, %hi(setpc_h)
    /* A3A0 80143F98 F0C02DAC */  sw         $t5, %lo(setpc_h)($at)
    /* A3A4 80143F9C 2C00A011 */  beqz       $t5, .L80144050
    /* A3A8 80143FA0 04004824 */   addiu     $t0, $v0, 0x4
    /* A3AC 80143FA4 0E800E3C */  lui        $t6, %hi(dungeon)
    /* A3B0 80143FA8 C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* A3B4 80143FAC 03000F24 */  addiu      $t7, $zero, 0x3
  .L80143FB0:
    /* A3B8 80143FB0 23008011 */  beqz       $t4, .L80144040
    /* A3BC 80143FB4 21380000 */   addu      $a3, $zero, $zero
    /* A3C0 80143FB8 2118AA00 */  addu       $v1, $a1, $t2
    /* A3C4 80143FBC 40480300 */  sll        $t1, $v1, 1
    /* A3C8 80143FC0 80100300 */  sll        $v0, $v1, 2
    /* A3CC 80143FC4 21104300 */  addu       $v0, $v0, $v1
    /* A3D0 80143FC8 C0580200 */  sll        $t3, $v0, 3
    /* A3D4 80143FCC 21308000 */  addu       $a2, $a0, $zero
  .L80143FD0:
    /* A3D8 80143FD0 00000391 */  lbu        $v1, 0x0($t0)
    /* A3DC 80143FD4 00000000 */  nop
    /* A3E0 80143FD8 0F006010 */  beqz       $v1, .L80144018
    /* A3E4 80143FDC 40100600 */   sll       $v0, $a2, 1
    /* A3E8 80143FE0 21104600 */  addu       $v0, $v0, $a2
    /* A3EC 80143FE4 40110200 */  sll        $v0, $v0, 5
    /* A3F0 80143FE8 21104E00 */  addu       $v0, $v0, $t6
    /* A3F4 80143FEC 21102201 */  addu       $v0, $t1, $v0
    /* A3F8 80143FF0 000043A4 */  sh         $v1, 0x0($v0)
    /* A3FC 80143FF4 1280033C */  lui        $v1, %hi(mydflags)
    /* A400 80143FF8 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* A404 80143FFC 21106601 */  addu       $v0, $t3, $a2
    /* A408 80144000 21186200 */  addu       $v1, $v1, $v0
    /* A40C 80144004 00006290 */  lbu        $v0, 0x0($v1)
    /* A410 80144008 00000000 */  nop
    /* A414 8014400C 80004234 */  ori        $v0, $v0, 0x80
    /* A418 80144010 0B100508 */  j          .L8014402C
    /* A41C 80144014 000062A0 */   sb        $v0, 0x0($v1)
  .L80144018:
    /* A420 80144018 21104600 */  addu       $v0, $v0, $a2
    /* A424 8014401C 40110200 */  sll        $v0, $v0, 5
    /* A428 80144020 21104E00 */  addu       $v0, $v0, $t6
    /* A42C 80144024 21102201 */  addu       $v0, $t1, $v0
    /* A430 80144028 00004FA4 */  sh         $t7, 0x0($v0)
  .L8014402C:
    /* A434 8014402C 02000825 */  addiu      $t0, $t0, 0x2
    /* A438 80144030 0100E724 */  addiu      $a3, $a3, 0x1
    /* A43C 80144034 2A10EC00 */  slt        $v0, $a3, $t4
    /* A440 80144038 E5FF4014 */  bnez       $v0, .L80143FD0
    /* A444 8014403C 0100C624 */   addiu     $a2, $a2, 0x1
  .L80144040:
    /* A448 80144040 01004A25 */  addiu      $t2, $t2, 0x1
    /* A44C 80144044 2A104D01 */  slt        $v0, $t2, $t5
    /* A450 80144048 D9FF4014 */  bnez       $v0, .L80143FB0
    /* A454 8014404C 00000000 */   nop
  .L80144050:
    /* A458 80144050 1000BD27 */  addiu      $sp, $sp, 0x10
    /* A45C 80144054 0800E003 */  jr         $ra
    /* A460 80144058 00000000 */   nop
endlabel DRLG_L2SetRoom__Fii
