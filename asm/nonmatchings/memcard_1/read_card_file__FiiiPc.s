.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching read_card_file__FiiiPc, 0x1DC

glabel read_card_file__FiiiPc
    /* 9220 80142E18 80FDBD27 */  addiu      $sp, $sp, -0x280
    /* 9224 80142E1C 6002B0AF */  sw         $s0, 0x260($sp)
    /* 9228 80142E20 21808000 */  addu       $s0, $a0, $zero
    /* 922C 80142E24 6402B1AF */  sw         $s1, 0x264($sp)
    /* 9230 80142E28 2188A000 */  addu       $s1, $a1, $zero
    /* 9234 80142E2C 7402B5AF */  sw         $s5, 0x274($sp)
    /* 9238 80142E30 21A8E000 */  addu       $s5, $a3, $zero
    /* 923C 80142E34 6C02B3AF */  sw         $s3, 0x26C($sp)
    /* 9240 80142E38 21980000 */  addu       $s3, $zero, $zero
    /* 9244 80142E3C 7002B4AF */  sw         $s4, 0x270($sp)
    /* 9248 80142E40 04001424 */  addiu      $s4, $zero, 0x4
    /* 924C 80142E44 6802B2AF */  sw         $s2, 0x268($sp)
    /* 9250 80142E48 80901000 */  sll        $s2, $s0, 2
    /* 9254 80142E4C 7C02BFAF */  sw         $ra, 0x27C($sp)
    /* 9258 80142E50 7802B6AF */  sw         $s6, 0x278($sp)
    /* 925C 80142E54 1280013C */  lui        $at, %hi(card_usable)
    /* 9260 80142E58 21083200 */  addu       $at, $at, $s2
    /* 9264 80142E5C E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 9268 80142E60 00000000 */  nop
    /* 926C 80142E64 57004010 */  beqz       $v0, .L80142FC4
    /* 9270 80142E68 21B00000 */   addu      $s6, $zero, $zero
    /* 9274 80142E6C 1280013C */  lui        $at, %hi(card_files)
    /* 9278 80142E70 21083200 */  addu       $at, $at, $s2
    /* 927C 80142E74 ECB3228C */  lw         $v0, %lo(card_files)($at)
    /* 9280 80142E78 00000000 */  nop
    /* 9284 80142E7C 2A102202 */  slt        $v0, $s1, $v0
    /* 9288 80142E80 4C004010 */  beqz       $v0, .L80142FB4
    /* 928C 80142E84 40121100 */   sll       $v0, $s1, 9
    /* 9290 80142E88 401B1000 */  sll        $v1, $s0, 13
    /* 9294 80142E8C 21104300 */  addu       $v0, $v0, $v1
    /* 9298 80142E90 1480013C */  lui        $at, %hi(card_header + 0x108)
    /* 929C 80142E94 21082200 */  addu       $at, $at, $v0
    /* 92A0 80142E98 00E8228C */  lw         $v0, %lo(card_header + 0x108)($at)
    /* 92A4 80142E9C 00000000 */  nop
    /* 92A8 80142EA0 49004614 */  bne        $v0, $a2, .L80142FC8
    /* 92AC 80142EA4 02000224 */   addiu     $v0, $zero, 0x2
    /* 92B0 80142EA8 1280023C */  lui        $v0, %hi(mem_card_event_handler)
    /* 92B4 80142EAC 74B1428C */  lw         $v0, %lo(mem_card_event_handler)($v0)
    /* 92B8 80142EB0 00000000 */  nop
    /* 92BC 80142EB4 03004010 */  beqz       $v0, .L80142EC4
    /* 92C0 80142EB8 03000424 */   addiu     $a0, $zero, 0x3
    /* 92C4 80142EBC 09F84000 */  jalr       $v0
    /* 92C8 80142EC0 21280002 */   addu      $a1, $s0, $zero
  .L80142EC4:
    /* 92CC 80142EC4 1002A427 */  addiu      $a0, $sp, 0x210
    /* 92D0 80142EC8 1480053C */  lui        $a1, %hi(func_8013E1EC)
    /* 92D4 80142ECC ECE1A524 */  addiu      $a1, $a1, %lo(func_8013E1EC)
    /* 92D8 80142ED0 21300002 */  addu       $a2, $s0, $zero
    /* 92DC 80142ED4 21104602 */  addu       $v0, $s2, $a2
    /* 92E0 80142ED8 C0110200 */  sll        $v0, $v0, 7
    /* 92E4 80142EDC 80381100 */  sll        $a3, $s1, 2
    /* 92E8 80142EE0 2138F100 */  addu       $a3, $a3, $s1
    /* 92EC 80142EE4 C0380700 */  sll        $a3, $a3, 3
    /* 92F0 80142EE8 1480033C */  lui        $v1, %hi(card_dir)
    /* 92F4 80142EEC F8E16324 */  addiu      $v1, $v1, %lo(card_dir)
    /* 92F8 80142EF0 2138E300 */  addu       $a3, $a3, $v1
    /* 92FC 80142EF4 9767000C */  jal        sprintf
    /* 9300 80142EF8 21384700 */   addu      $a3, $v0, $a3
    /* 9304 80142EFC FFFF1224 */  addiu      $s2, $zero, -0x1
  .L80142F00:
    /* 9308 80142F00 1002A427 */  addiu      $a0, $sp, 0x210
    /* 930C 80142F04 6F46000C */  jal        open
    /* 9310 80142F08 01000524 */   addiu     $a1, $zero, 0x1
    /* 9314 80142F0C 21884000 */  addu       $s1, $v0, $zero
    /* 9318 80142F10 2A003212 */  beq        $s1, $s2, .L80142FBC
    /* 931C 80142F14 21202002 */   addu      $a0, $s1, $zero
    /* 9320 80142F18 1000A527 */  addiu      $a1, $sp, 0x10
    /* 9324 80142F1C 7346000C */  jal        read
    /* 9328 80142F20 00020624 */   addiu     $a2, $zero, 0x200
    /* 932C 80142F24 18005210 */  beq        $v0, $s2, .L80142F88
    /* 9330 80142F28 00000000 */   nop
    /* 9334 80142F2C 1401B08F */  lw         $s0, 0x114($sp)
    /* 9338 80142F30 00000000 */  nop
    /* 933C 80142F34 00020226 */  addiu      $v0, $s0, 0x200
    /* 9340 80142F38 7F004330 */  andi       $v1, $v0, 0x7F
    /* 9344 80142F3C 02006010 */  beqz       $v1, .L80142F48
    /* 9348 80142F40 80000226 */   addiu     $v0, $s0, 0x80
    /* 934C 80142F44 23804300 */  subu       $s0, $v0, $v1
  .L80142F48:
    /* 9350 80142F48 21202002 */  addu       $a0, $s1, $zero
    /* 9354 80142F4C 2128A002 */  addu       $a1, $s5, $zero
    /* 9358 80142F50 7346000C */  jal        read
    /* 935C 80142F54 21300002 */   addu      $a2, $s0, $zero
    /* 9360 80142F58 0B005210 */  beq        $v0, $s2, .L80142F88
    /* 9364 80142F5C 00000000 */   nop
    /* 9368 80142F60 09005014 */  bne        $v0, $s0, .L80142F88
    /* 936C 80142F64 00000000 */   nop
    /* 9370 80142F68 1401A58F */  lw         $a1, 0x114($sp)
    /* 9374 80142F6C 390B050C */  jal        checksum_data__FPci
    /* 9378 80142F70 2120A002 */   addu      $a0, $s5, $zero
    /* 937C 80142F74 1001A38F */  lw         $v1, 0x110($sp)
    /* 9380 80142F78 00000000 */  nop
    /* 9384 80142F7C 02004310 */  beq        $v0, $v1, .L80142F88
    /* 9388 80142F80 01001324 */   addiu     $s3, $zero, 0x1
    /* 938C 80142F84 01001624 */  addiu      $s6, $zero, 0x1
  .L80142F88:
    /* 9390 80142F88 7B46000C */  jal        close
    /* 9394 80142F8C 21202002 */   addu      $a0, $s1, $zero
    /* 9398 80142F90 04006016 */  bnez       $s3, .L80142FA4
    /* 939C 80142F94 00000000 */   nop
    /* 93A0 80142F98 FFFF9426 */  addiu      $s4, $s4, -0x1
    /* 93A4 80142F9C D8FF9216 */  bne        $s4, $s2, .L80142F00
    /* 93A8 80142FA0 00000000 */   nop
  .L80142FA4:
    /* 93AC 80142FA4 0800C016 */  bnez       $s6, .L80142FC8
    /* 93B0 80142FA8 FEFF0224 */   addiu     $v0, $zero, -0x2
    /* 93B4 80142FAC F20B0508 */  j          .L80142FC8
    /* 93B8 80142FB0 0100623A */   xori      $v0, $s3, 0x1
  .L80142FB4:
    /* 93BC 80142FB4 F20B0508 */  j          .L80142FC8
    /* 93C0 80142FB8 02000224 */   addiu     $v0, $zero, 0x2
  .L80142FBC:
    /* 93C4 80142FBC F20B0508 */  j          .L80142FC8
    /* 93C8 80142FC0 01000224 */   addiu     $v0, $zero, 0x1
  .L80142FC4:
    /* 93CC 80142FC4 03000224 */  addiu      $v0, $zero, 0x3
  .L80142FC8:
    /* 93D0 80142FC8 7C02BF8F */  lw         $ra, 0x27C($sp)
    /* 93D4 80142FCC 7802B68F */  lw         $s6, 0x278($sp)
    /* 93D8 80142FD0 7402B58F */  lw         $s5, 0x274($sp)
    /* 93DC 80142FD4 7002B48F */  lw         $s4, 0x270($sp)
    /* 93E0 80142FD8 6C02B38F */  lw         $s3, 0x26C($sp)
    /* 93E4 80142FDC 6802B28F */  lw         $s2, 0x268($sp)
    /* 93E8 80142FE0 6402B18F */  lw         $s1, 0x264($sp)
    /* 93EC 80142FE4 6002B08F */  lw         $s0, 0x260($sp)
    /* 93F0 80142FE8 8002BD27 */  addiu      $sp, $sp, 0x280
    /* 93F4 80142FEC 0800E003 */  jr         $ra
    /* 93F8 80142FF0 00000000 */   nop
endlabel read_card_file__FiiiPc
