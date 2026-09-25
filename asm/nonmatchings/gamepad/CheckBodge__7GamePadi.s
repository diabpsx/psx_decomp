.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckBodge__7GamePadi, 0x160

glabel CheckBodge__7GamePadi
    /* 69B08 80079B08 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 69B0C 80079B0C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 69B10 80079B10 21888000 */  addu       $s1, $a0, $zero
    /* 69B14 80079B14 1000B0AF */  sw         $s0, 0x10($sp)
    /* 69B18 80079B18 2180A000 */  addu       $s0, $a1, $zero
    /* 69B1C 80079B1C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 69B20 80079B20 0000228E */  lw         $v0, 0x0($s1)
    /* 69B24 80079B24 1280013C */  lui        $at, %hi(offset_x)
    /* 69B28 80079B28 21083000 */  addu       $at, $at, $s0
    /* 69B2C 80079B2C A8C22380 */  lb         $v1, %lo(offset_x)($at)
    /* 69B30 80079B30 30004584 */  lh         $a1, 0x30($v0)
    /* 69B34 80079B34 32004484 */  lh         $a0, 0x32($v0)
    /* 69B38 80079B38 1280013C */  lui        $at, %hi(offset_y)
    /* 69B3C 80079B3C 21083000 */  addu       $at, $at, $s0
    /* 69B40 80079B40 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 69B44 80079B44 2128A300 */  addu       $a1, $a1, $v1
    /* 69B48 80079B48 21308200 */  addu       $a2, $a0, $v0
    /* 69B4C 80079B4C C0200500 */  sll        $a0, $a1, 3
    /* 69B50 80079B50 23208500 */  subu       $a0, $a0, $a1
    /* 69B54 80079B54 C0210400 */  sll        $a0, $a0, 7
    /* 69B58 80079B58 C0100600 */  sll        $v0, $a2, 3
    /* 69B5C 80079B5C 0E80033C */  lui        $v1, %hi(dung_map)
    /* 69B60 80079B60 287A6324 */  addiu      $v1, $v1, %lo(dung_map)
    /* 69B64 80079B64 21104300 */  addu       $v0, $v0, $v1
    /* 69B68 80079B68 1280033C */  lui        $v1, %hi(leveltype)
    /* 69B6C 80079B6C 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 69B70 80079B70 00000000 */  nop
    /* 69B74 80079B74 23006010 */  beqz       $v1, .L80079C04
    /* 69B78 80079B78 21208200 */   addu      $a0, $a0, $v0
    /* 69B7C 80079B7C 00008284 */  lh         $v0, 0x0($a0)
    /* 69B80 80079B80 00000000 */  nop
    /* 69B84 80079B84 0600401C */  bgtz       $v0, .L80079BA0
    /* 69B88 80079B88 2120A000 */   addu      $a0, $a1, $zero
    /* 69B8C 80079B8C 447F010C */  jal        IsDplayer__Fii
    /* 69B90 80079B90 2128C000 */   addu      $a1, $a2, $zero
    /* 69B94 80079B94 FF004230 */  andi       $v0, $v0, 0xFF
    /* 69B98 80079B98 1B004010 */  beqz       $v0, .L80079C08
    /* 69B9C 80079B9C 0800022E */   sltiu     $v0, $s0, 0x8
  .L80079BA0:
    /* 69BA0 80079BA0 0000228E */  lw         $v0, 0x0($s1)
    /* 69BA4 80079BA4 1280013C */  lui        $at, %hi(offset_x)
    /* 69BA8 80079BA8 21083000 */  addu       $at, $at, $s0
    /* 69BAC 80079BAC A8C22380 */  lb         $v1, %lo(offset_x)($at)
    /* 69BB0 80079BB0 1280013C */  lui        $at, %hi(offset_y)
    /* 69BB4 80079BB4 21083000 */  addu       $at, $at, $s0
    /* 69BB8 80079BB8 B0C22780 */  lb         $a3, %lo(offset_y)($at)
    /* 69BBC 80079BBC 2800458C */  lw         $a1, 0x28($v0)
    /* 69BC0 80079BC0 420050A0 */  sb         $s0, 0x42($v0)
    /* 69BC4 80079BC4 4C002482 */  lb         $a0, 0x4C($s1)
    /* 69BC8 80079BC8 2C00468C */  lw         $a2, 0x2C($v0)
    /* 69BCC 80079BCC 2128A300 */  addu       $a1, $a1, $v1
    /* 69BD0 80079BD0 C3280500 */  sra        $a1, $a1, 3
    /* 69BD4 80079BD4 2130C700 */  addu       $a2, $a2, $a3
    /* 69BD8 80079BD8 DB9A010C */  jal        PosOkPlayer__Fiii
    /* 69BDC 80079BDC C3300600 */   sra       $a2, $a2, 3
    /* 69BE0 80079BE0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 69BE4 80079BE4 03004014 */  bnez       $v0, .L80079BF4
    /* 69BE8 80079BE8 21202002 */   addu      $a0, $s1, $zero
    /* 69BEC 80079BEC 14E70108 */  j          .L80079C50
    /* 69BF0 80079BF0 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80079BF4:
    /* 69BF4 80079BF4 A0E4010C */  jal        CheckDirs__7GamePadi
    /* 69BF8 80079BF8 21280002 */   addu      $a1, $s0, $zero
    /* 69BFC 80079BFC 14E70108 */  j          .L80079C50
    /* 69C00 80079C00 00000000 */   nop
  .L80079C04:
    /* 69C04 80079C04 0800022E */  sltiu      $v0, $s0, 0x8
  .L80079C08:
    /* 69C08 80079C08 10004010 */  beqz       $v0, .L80079C4C
    /* 69C0C 80079C0C 80101000 */   sll       $v0, $s0, 2
    /* 69C10 80079C10 1280013C */  lui        $at, %hi(jtbl_80118AD0)
    /* 69C14 80079C14 21082200 */  addu       $at, $at, $v0
    /* 69C18 80079C18 D08A228C */  lw         $v0, %lo(jtbl_80118AD0)($at)
    /* 69C1C 80079C1C 00000000 */  nop
    /* 69C20 80079C20 08004000 */  jr         $v0
    /* 69C24 80079C24 00000000 */   nop
  jlabel .L80079C28
    /* 69C28 80079C28 21202002 */  addu       $a0, $s1, $zero
    /* 69C2C 80079C2C 2AE5010C */  jal        CheckDiagBodge__7GamePadi
    /* 69C30 80079C30 21280002 */   addu      $a1, $s0, $zero
    /* 69C34 80079C34 13E70108 */  j          .L80079C4C
    /* 69C38 80079C38 21804000 */   addu      $s0, $v0, $zero
  jlabel .L80079C3C
    /* 69C3C 80079C3C 21202002 */  addu       $a0, $s1, $zero
    /* 69C40 80079C40 E7E5010C */  jal        CheckIsoBodge__7GamePadi
    /* 69C44 80079C44 21280002 */   addu      $a1, $s0, $zero
    /* 69C48 80079C48 21804000 */  addu       $s0, $v0, $zero
  .L80079C4C:
    /* 69C4C 80079C4C 21100002 */  addu       $v0, $s0, $zero
  .L80079C50:
    /* 69C50 80079C50 1800BF8F */  lw         $ra, 0x18($sp)
    /* 69C54 80079C54 1400B18F */  lw         $s1, 0x14($sp)
    /* 69C58 80079C58 1000B08F */  lw         $s0, 0x10($sp)
    /* 69C5C 80079C5C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 69C60 80079C60 0800E003 */  jr         $ra
    /* 69C64 80079C64 00000000 */   nop
endlabel CheckBodge__7GamePadi
