.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L5FloodTVal__Fv, 0xF8

glabel DRLG_L5FloodTVal__Fv
    /* 6574 8014016C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 6578 80140170 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 657C 80140174 10001524 */  addiu      $s5, $zero, 0x10
    /* 6580 80140178 2800B4AF */  sw         $s4, 0x28($sp)
    /* 6584 8014017C 21A00000 */  addu       $s4, $zero, $zero
    /* 6588 80140180 3000B6AF */  sw         $s6, 0x30($sp)
    /* 658C 80140184 0E80163C */  lui        $s6, %hi(dungeon)
    /* 6590 80140188 C440D626 */  addiu      $s6, $s6, %lo(dungeon)
    /* 6594 8014018C 3400BFAF */  sw         $ra, 0x34($sp)
    /* 6598 80140190 2400B3AF */  sw         $s3, 0x24($sp)
    /* 659C 80140194 2000B2AF */  sw         $s2, 0x20($sp)
    /* 65A0 80140198 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 65A4 8014019C 1800B0AF */  sw         $s0, 0x18($sp)
  .L801401A0:
    /* 65A8 801401A0 10001324 */  addiu      $s3, $zero, 0x10
    /* 65AC 801401A4 21800000 */  addu       $s0, $zero, $zero
    /* 65B0 801401A8 2190C002 */  addu       $s2, $s6, $zero
    /* 65B4 801401AC C0101500 */  sll        $v0, $s5, 3
    /* 65B8 801401B0 00385124 */  addiu      $s1, $v0, 0x3800
  .L801401B4:
    /* 65BC 801401B4 40101400 */  sll        $v0, $s4, 1
    /* 65C0 801401B8 21105200 */  addu       $v0, $v0, $s2
    /* 65C4 801401BC 00004394 */  lhu        $v1, 0x0($v0)
    /* 65C8 801401C0 0D000224 */  addiu      $v0, $zero, 0xD
    /* 65CC 801401C4 12006214 */  bne        $v1, $v0, .L80140210
    /* 65D0 801401C8 00000000 */   nop
    /* 65D4 801401CC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 65D8 801401D0 21083100 */  addu       $at, $at, $s1
    /* 65DC 801401D4 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 65E0 801401D8 00000000 */  nop
    /* 65E4 801401DC 0C004014 */  bnez       $v0, .L80140210
    /* 65E8 801401E0 21200002 */   addu      $a0, $s0, $zero
    /* 65EC 801401E4 21288002 */  addu       $a1, $s4, $zero
    /* 65F0 801401E8 21306002 */  addu       $a2, $s3, $zero
    /* 65F4 801401EC 2138A002 */  addu       $a3, $s5, $zero
    /* 65F8 801401F0 39FF040C */  jal        DRLG_L5FTVR__Fiiiii
    /* 65FC 801401F4 1000A0AF */   sw        $zero, 0x10($sp)
    /* 6600 801401F8 1280023C */  lui        $v0, %hi(TransVal)
    /* 6604 801401FC 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* 6608 80140200 00000000 */  nop
    /* 660C 80140204 01004224 */  addiu      $v0, $v0, 0x1
    /* 6610 80140208 1280013C */  lui        $at, %hi(TransVal)
    /* 6614 8014020C 48C122A0 */  sb         $v0, %lo(TransVal)($at)
  .L80140210:
    /* 6618 80140210 00073126 */  addiu      $s1, $s1, 0x700
    /* 661C 80140214 02007326 */  addiu      $s3, $s3, 0x2
    /* 6620 80140218 01001026 */  addiu      $s0, $s0, 0x1
    /* 6624 8014021C 2800022A */  slti       $v0, $s0, 0x28
    /* 6628 80140220 E4FF4014 */  bnez       $v0, .L801401B4
    /* 662C 80140224 60005226 */   addiu     $s2, $s2, 0x60
    /* 6630 80140228 01009426 */  addiu      $s4, $s4, 0x1
    /* 6634 8014022C 2800822A */  slti       $v0, $s4, 0x28
    /* 6638 80140230 DBFF4014 */  bnez       $v0, .L801401A0
    /* 663C 80140234 0200B526 */   addiu     $s5, $s5, 0x2
    /* 6640 80140238 3400BF8F */  lw         $ra, 0x34($sp)
    /* 6644 8014023C 3000B68F */  lw         $s6, 0x30($sp)
    /* 6648 80140240 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 664C 80140244 2800B48F */  lw         $s4, 0x28($sp)
    /* 6650 80140248 2400B38F */  lw         $s3, 0x24($sp)
    /* 6654 8014024C 2000B28F */  lw         $s2, 0x20($sp)
    /* 6658 80140250 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 665C 80140254 1800B08F */  lw         $s0, 0x18($sp)
    /* 6660 80140258 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 6664 8014025C 0800E003 */  jr         $ra
    /* 6668 80140260 00000000 */   nop
endlabel DRLG_L5FloodTVal__Fv
