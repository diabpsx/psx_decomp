.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc, 0x638

glabel Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 7A090 8008A090 30FFBD27 */  addiu      $sp, $sp, -0xD0
    /* 7A094 8008A094 A800B0AF */  sw         $s0, 0xA8($sp)
    /* 7A098 8008A098 EC00B08F */  lw         $s0, 0xEC($sp)
    /* 7A09C 8008A09C AC00B1AF */  sw         $s1, 0xAC($sp)
    /* 7A0A0 8008A0A0 F000B18F */  lw         $s1, 0xF0($sp)
    /* 7A0A4 8008A0A4 BC00B5AF */  sw         $s5, 0xBC($sp)
    /* 7A0A8 8008A0A8 E400B58F */  lw         $s5, 0xE4($sp)
    /* 7A0AC 8008A0AC E800A993 */  lbu        $t1, 0xE8($sp)
    /* 7A0B0 8008A0B0 B400B3AF */  sw         $s3, 0xB4($sp)
    /* 7A0B4 8008A0B4 21988000 */  addu       $s3, $a0, $zero
    /* 7A0B8 8008A0B8 C000B6AF */  sw         $s6, 0xC0($sp)
    /* 7A0BC 8008A0BC 21B0C000 */  addu       $s6, $a2, $zero
    /* 7A0C0 8008A0C0 B000B2AF */  sw         $s2, 0xB0($sp)
    /* 7A0C4 8008A0C4 2190E000 */  addu       $s2, $a3, $zero
    /* 7A0C8 8008A0C8 CC00BFAF */  sw         $ra, 0xCC($sp)
    /* 7A0CC 8008A0CC C800BEAF */  sw         $fp, 0xC8($sp)
    /* 7A0D0 8008A0D0 C400B7AF */  sw         $s7, 0xC4($sp)
    /* 7A0D4 8008A0D4 B800B4AF */  sw         $s4, 0xB8($sp)
    /* 7A0D8 8008A0D8 2800A5AF */  sw         $a1, 0x28($sp)
    /* 7A0DC 8008A0DC 3800B0A3 */  sb         $s0, 0x38($sp)
    /* 7A0E0 8008A0E0 0402648E */  lw         $a0, 0x204($s3)
    /* 7A0E4 8008A0E4 21A00000 */  addu       $s4, $zero, $zero
    /* 7A0E8 8008A0E8 3000A9A3 */  sb         $t1, 0x30($sp)
    /* 7A0EC 8008A0EC C80E020C */  jal        PRIM_FullScreen__Fi
    /* 7A0F0 8008A0F0 01008424 */   addiu     $a0, $a0, 0x1
    /* 7A0F4 8008A0F4 3800A293 */  lbu        $v0, 0x38($sp)
    /* 7A0F8 8008A0F8 21F02002 */  addu       $fp, $s1, $zero
    /* 7A0FC 8008A0FC C2100200 */  srl        $v0, $v0, 3
    /* 7A100 8008A100 23800202 */  subu       $s0, $s0, $v0
    /* 7A104 8008A104 FF00C233 */  andi       $v0, $fp, 0xFF
    /* 7A108 8008A108 82100200 */  srl        $v0, $v0, 2
    /* 7A10C 8008A10C 23F02202 */  subu       $fp, $s1, $v0
    /* 7A110 8008A110 39300224 */  addiu      $v0, $zero, 0x3039
    /* 7A114 8008A114 3800B0A3 */  sb         $s0, 0x38($sp)
    /* 7A118 8008A118 080262AE */  sw         $v0, 0x208($s3)
    /* 7A11C 8008A11C 0A00A012 */  beqz       $s5, .L8008A148
    /* 7A120 8008A120 0C0260AE */   sw        $zero, 0x20C($s3)
    /* 7A124 8008A124 0600AA86 */  lh         $t2, 0x6($s5)
    /* 7A128 8008A128 0400B786 */  lh         $s7, 0x4($s5)
    /* 7A12C 8008A12C 5000AAAF */  sw         $t2, 0x50($sp)
    /* 7A130 8008A130 0000A986 */  lh         $t1, 0x0($s5)
    /* 7A134 8008A134 00000000 */  nop
    /* 7A138 8008A138 5800A9AF */  sw         $t1, 0x58($sp)
    /* 7A13C 8008A13C 0200B586 */  lh         $s5, 0x2($s5)
    /* 7A140 8008A140 57280208 */  j          .L8008A15C
    /* 7A144 8008A144 6000B5AF */   sw        $s5, 0x60($sp)
  .L8008A148:
    /* 7A148 8008A148 40011724 */  addiu      $s7, $zero, 0x140
    /* 7A14C 8008A14C 00010A24 */  addiu      $t2, $zero, 0x100
    /* 7A150 8008A150 5000AAAF */  sw         $t2, 0x50($sp)
    /* 7A154 8008A154 5800A0AF */  sw         $zero, 0x58($sp)
    /* 7A158 8008A158 6000A0AF */  sw         $zero, 0x60($sp)
  .L8008A15C:
    /* 7A15C 8008A15C 6000A98F */  lw         $t1, 0x60($sp)
    /* 7A160 8008A160 4800B7AF */  sw         $s7, 0x48($sp)
    /* 7A164 8008A164 21B0C902 */  addu       $s6, $s6, $t1
  .L8008A168:
    /* 7A168 8008A168 C6B5020C */  jal        IsKanjiLoaded__Fv
    /* 7A16C 8008A16C 00000000 */   nop
    /* 7A170 8008A170 01004238 */  xori       $v0, $v0, 0x1
    /* 7A174 8008A174 05004010 */  beqz       $v0, .L8008A18C
    /* 7A178 8008A178 00000000 */   nop
    /* 7A17C 8008A17C EE80000C */  jal        TSK_Sleep
    /* 7A180 8008A180 01000424 */   addiu     $a0, $zero, 0x1
    /* 7A184 8008A184 5A280208 */  j          .L8008A168
    /* 7A188 8008A188 00000000 */   nop
  .L8008A18C:
    /* 7A18C 8008A18C 3000AA93 */  lbu        $t2, 0x30($sp)
    /* 7A190 8008A190 3800A993 */  lbu        $t1, 0x38($sp)
    /* 7A194 8008A194 FF00DE33 */  andi       $fp, $fp, 0xFF
    /* 7A198 8008A198 6800B2AF */  sw         $s2, 0x68($sp)
    /* 7A19C 8008A19C 4000A0AF */  sw         $zero, 0x40($sp)
    /* 7A1A0 8008A1A0 8800AAAF */  sw         $t2, 0x88($sp)
    /* 7A1A4 8008A1A4 9000A9AF */  sw         $t1, 0x90($sp)
  .L8008A1A8:
    /* 7A1A8 8008A1A8 00004282 */  lb         $v0, 0x0($s2)
    /* 7A1AC 8008A1AC 00000000 */  nop
    /* 7A1B0 8008A1B0 2C014010 */  beqz       $v0, .L8008A664
    /* 7A1B4 8008A1B4 21884002 */   addu      $s1, $s2, $zero
    /* 7A1B8 8008A1B8 21A80000 */  addu       $s5, $zero, $zero
    /* 7A1BC 8008A1BC 21800000 */  addu       $s0, $zero, $zero
    /* 7A1C0 8008A1C0 4000AA8F */  lw         $t2, 0x40($sp)
    /* 7A1C4 8008A1C4 4800B78F */  lw         $s7, 0x48($sp)
    /* 7A1C8 8008A1C8 01004A25 */  addiu      $t2, $t2, 0x1
    /* 7A1CC 8008A1CC 4000AAAF */  sw         $t2, 0x40($sp)
    /* 7A1D0 8008A1D0 100260AE */  sw         $zero, 0x210($s3)
  .L8008A1D4:
    /* 7A1D4 8008A1D4 1002628E */  lw         $v0, 0x210($s3)
    /* 7A1D8 8008A1D8 00000000 */  nop
    /* 7A1DC 8008A1DC 2A105700 */  slt        $v0, $v0, $s7
    /* 7A1E0 8008A1E0 21004010 */  beqz       $v0, .L8008A268
    /* 7A1E4 8008A1E4 00000000 */   nop
    /* 7A1E8 8008A1E8 00002382 */  lb         $v1, 0x0($s1)
    /* 7A1EC 8008A1EC 00000000 */  nop
    /* 7A1F0 8008A1F0 1E006010 */  beqz       $v1, .L8008A26C
    /* 7A1F4 8008A1F4 21286000 */   addu      $a1, $v1, $zero
    /* 7A1F8 8008A1F8 0A000224 */  addiu      $v0, $zero, 0xA
    /* 7A1FC 8008A1FC 1A006210 */  beq        $v1, $v0, .L8008A268
    /* 7A200 8008A200 FF00A330 */   andi      $v1, $a1, 0xFF
    /* 7A204 8008A204 20000924 */  addiu      $t1, $zero, 0x20
    /* 7A208 8008A208 05006910 */  beq        $v1, $t1, .L8008A220
    /* 7A20C 8008A20C 2D000224 */   addiu     $v0, $zero, 0x2D
    /* 7A210 8008A210 03006210 */  beq        $v1, $v0, .L8008A220
    /* 7A214 8008A214 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 7A218 8008A218 04006214 */  bne        $v1, $v0, .L8008A22C
    /* 7A21C 8008A21C 8000A230 */   andi      $v0, $a1, 0x80
  .L8008A220:
    /* 7A220 8008A220 21A82002 */  addu       $s5, $s1, $zero
    /* 7A224 8008A224 1002708E */  lw         $s0, 0x210($s3)
    /* 7A228 8008A228 8000A230 */  andi       $v0, $a1, 0x80
  .L8008A22C:
    /* 7A22C 8008A22C 05004010 */  beqz       $v0, .L8008A244
    /* 7A230 8008A230 0C000324 */   addiu     $v1, $zero, 0xC
    /* 7A234 8008A234 21A82002 */  addu       $s5, $s1, $zero
    /* 7A238 8008A238 1002708E */  lw         $s0, 0x210($s3)
    /* 7A23C 8008A23C 95280208 */  j          .L8008A254
    /* 7A240 8008A240 01003126 */   addiu     $s1, $s1, 0x1
  .L8008A244:
    /* 7A244 8008A244 21206002 */  addu       $a0, $s3, $zero
    /* 7A248 8008A248 EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 7A24C 8008A24C FF00A530 */   andi      $a1, $a1, 0xFF
    /* 7A250 8008A250 21184000 */  addu       $v1, $v0, $zero
  .L8008A254:
    /* 7A254 8008A254 1002628E */  lw         $v0, 0x210($s3)
    /* 7A258 8008A258 01003126 */  addiu      $s1, $s1, 0x1
    /* 7A25C 8008A25C 21104300 */  addu       $v0, $v0, $v1
    /* 7A260 8008A260 75280208 */  j          .L8008A1D4
    /* 7A264 8008A264 100262AE */   sw        $v0, 0x210($s3)
  .L8008A268:
    /* 7A268 8008A268 00002382 */  lb         $v1, 0x0($s1)
  .L8008A26C:
    /* 7A26C 8008A26C 20000A24 */  addiu      $t2, $zero, 0x20
    /* 7A270 8008A270 0C006A10 */  beq        $v1, $t2, .L8008A2A4
    /* 7A274 8008A274 21006228 */   slti      $v0, $v1, 0x21
    /* 7A278 8008A278 07004010 */  beqz       $v0, .L8008A298
    /* 7A27C 8008A27C 00000000 */   nop
    /* 7A280 8008A280 08006010 */  beqz       $v1, .L8008A2A4
    /* 7A284 8008A284 0A000224 */   addiu     $v0, $zero, 0xA
    /* 7A288 8008A288 04006214 */  bne        $v1, $v0, .L8008A29C
    /* 7A28C 8008A28C 0100E226 */   addiu     $v0, $s7, 0x1
    /* 7A290 8008A290 A9280208 */  j          .L8008A2A4
    /* 7A294 8008A294 01003126 */   addiu     $s1, $s1, 0x1
  .L8008A298:
    /* 7A298 8008A298 0100E226 */  addiu      $v0, $s7, 0x1
  .L8008A29C:
    /* 7A29C 8008A29C 100262AE */  sw         $v0, 0x210($s3)
    /* 7A2A0 8008A2A0 01001026 */  addiu      $s0, $s0, 0x1
  .L8008A2A4:
    /* 7A2A4 8008A2A4 1002628E */  lw         $v0, 0x210($s3)
    /* 7A2A8 8008A2A8 00000000 */  nop
    /* 7A2AC 8008A2AC 2A10E202 */  slt        $v0, $s7, $v0
    /* 7A2B0 8008A2B0 31004010 */  beqz       $v0, .L8008A378
    /* 7A2B4 8008A2B4 00000000 */   nop
    /* 7A2B8 8008A2B8 2300A016 */  bnez       $s5, .L8008A348
    /* 7A2BC 8008A2BC 00000000 */   nop
    /* 7A2C0 8008A2C0 00002282 */  lb         $v0, 0x0($s1)
    /* 7A2C4 8008A2C4 00000000 */  nop
    /* 7A2C8 8008A2C8 1C004010 */  beqz       $v0, .L8008A33C
    /* 7A2CC 8008A2CC 20000924 */   addiu     $t1, $zero, 0x20
    /* 7A2D0 8008A2D0 1A004910 */  beq        $v0, $t1, .L8008A33C
    /* 7A2D4 8008A2D4 20001524 */   addiu     $s5, $zero, 0x20
  .L8008A2D8:
    /* 7A2D8 8008A2D8 00002382 */  lb         $v1, 0x0($s1)
    /* 7A2DC 8008A2DC 00000000 */  nop
    /* 7A2E0 8008A2E0 16006010 */  beqz       $v1, .L8008A33C
    /* 7A2E4 8008A2E4 21106000 */   addu      $v0, $v1, $zero
    /* 7A2E8 8008A2E8 21804000 */  addu       $s0, $v0, $zero
    /* 7A2EC 8008A2EC 80006230 */  andi       $v0, $v1, 0x80
    /* 7A2F0 8008A2F0 06004010 */  beqz       $v0, .L8008A30C
    /* 7A2F4 8008A2F4 21206002 */   addu      $a0, $s3, $zero
    /* 7A2F8 8008A2F8 1002628E */  lw         $v0, 0x210($s3)
    /* 7A2FC 8008A2FC 01003126 */  addiu      $s1, $s1, 0x1
    /* 7A300 8008A300 0C004224 */  addiu      $v0, $v0, 0xC
    /* 7A304 8008A304 C9280208 */  j          .L8008A324
    /* 7A308 8008A308 100262AE */   sw        $v0, 0x210($s3)
  .L8008A30C:
    /* 7A30C 8008A30C EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 7A310 8008A310 FF000532 */   andi      $a1, $s0, 0xFF
    /* 7A314 8008A314 1002638E */  lw         $v1, 0x210($s3)
    /* 7A318 8008A318 00000000 */  nop
    /* 7A31C 8008A31C 21186200 */  addu       $v1, $v1, $v0
    /* 7A320 8008A320 100263AE */  sw         $v1, 0x210($s3)
  .L8008A324:
    /* 7A324 8008A324 00161000 */  sll        $v0, $s0, 24
    /* 7A328 8008A328 03160200 */  sra        $v0, $v0, 24
    /* 7A32C 8008A32C 03004010 */  beqz       $v0, .L8008A33C
    /* 7A330 8008A330 01003126 */   addiu     $s1, $s1, 0x1
    /* 7A334 8008A334 E8FF5514 */  bne        $v0, $s5, .L8008A2D8
    /* 7A338 8008A338 00000000 */   nop
  .L8008A33C:
    /* 7A33C 8008A33C 1002778E */  lw         $s7, 0x210($s3)
    /* 7A340 8008A340 DE280208 */  j          .L8008A378
    /* 7A344 8008A344 00000000 */   nop
  .L8008A348:
    /* 7A348 8008A348 6800AA8F */  lw         $t2, 0x68($sp)
    /* 7A34C 8008A34C 00000000 */  nop
    /* 7A350 8008A350 07005515 */  bne        $t2, $s5, .L8008A370
    /* 7A354 8008A354 21200000 */   addu      $a0, $zero, $zero
    /* 7A358 8008A358 1180053C */  lui        $a1, %hi(D_801104C8)
    /* 7A35C 8008A35C C804A524 */  addiu      $a1, $a1, %lo(D_801104C8)
    /* 7A360 8008A360 A583000C */  jal        DBG_Error
    /* 7A364 8008A364 70030624 */   addiu     $a2, $zero, 0x370
    /* 7A368 8008A368 DE280208 */  j          .L8008A378
    /* 7A36C 8008A36C 00000000 */   nop
  .L8008A370:
    /* 7A370 8008A370 2188A002 */  addu       $s1, $s5, $zero
    /* 7A374 8008A374 100270AE */  sw         $s0, 0x210($s3)
  .L8008A378:
    /* 7A378 8008A378 E000A98F */  lw         $t1, 0xE0($sp)
    /* 7A37C 8008A37C 01000224 */  addiu      $v0, $zero, 0x1
    /* 7A380 8008A380 3A002211 */  beq        $t1, $v0, .L8008A46C
    /* 7A384 8008A384 02002229 */   slti      $v0, $t1, 0x2
    /* 7A388 8008A388 05004010 */  beqz       $v0, .L8008A3A0
    /* 7A38C 8008A38C 00000000 */   nop
    /* 7A390 8008A390 09002011 */  beqz       $t1, .L8008A3B8
    /* 7A394 8008A394 00000000 */   nop
    /* 7A398 8008A398 86290208 */  j          .L8008A618
    /* 7A39C 8008A39C 00000000 */   nop
  .L8008A3A0:
    /* 7A3A0 8008A3A0 E000AA8F */  lw         $t2, 0xE0($sp)
    /* 7A3A4 8008A3A4 02000224 */  addiu      $v0, $zero, 0x2
    /* 7A3A8 8008A3A8 68004211 */  beq        $t2, $v0, .L8008A54C
    /* 7A3AC 8008A3AC 00000000 */   nop
    /* 7A3B0 8008A3B0 86290208 */  j          .L8008A618
    /* 7A3B4 8008A3B4 00000000 */   nop
  .L8008A3B8:
    /* 7A3B8 8008A3B8 5800A98F */  lw         $t1, 0x58($sp)
    /* 7A3BC 8008A3BC 2800AA8F */  lw         $t2, 0x28($sp)
    /* 7A3C0 8008A3C0 0802628E */  lw         $v0, 0x208($s3)
    /* 7A3C4 8008A3C4 21A02A01 */  addu       $s4, $t1, $t2
    /* 7A3C8 8008A3C8 2A108202 */  slt        $v0, $s4, $v0
    /* 7A3CC 8008A3CC 02004010 */  beqz       $v0, .L8008A3D8
    /* 7A3D0 8008A3D0 00000000 */   nop
    /* 7A3D4 8008A3D4 080274AE */  sw         $s4, 0x208($s3)
  .L8008A3D8:
    /* 7A3D8 8008A3D8 8F005112 */  beq        $s2, $s1, .L8008A618
    /* 7A3DC 8008A3DC 00000000 */   nop
    /* 7A3E0 8008A3E0 00004892 */  lbu        $t0, 0x0($s2)
    /* 7A3E4 8008A3E4 01005226 */  addiu      $s2, $s2, 0x1
    /* 7A3E8 8008A3E8 00160800 */  sll        $v0, $t0, 24
    /* 7A3EC 8008A3EC 11004104 */  bgez       $v0, .L8008A434
    /* 7A3F0 8008A3F0 031E0200 */   sra       $v1, $v0, 24
    /* 7A3F4 8008A3F4 FF000231 */  andi       $v0, $t0, 0xFF
    /* 7A3F8 8008A3F8 00004892 */  lbu        $t0, 0x0($s2)
    /* 7A3FC 8008A3FC 01005226 */  addiu      $s2, $s2, 0x1
    /* 7A400 8008A400 21206002 */  addu       $a0, $s3, $zero
    /* 7A404 8008A404 FFFF8532 */  andi       $a1, $s4, 0xFFFF
    /* 7A408 8008A408 FFFFC632 */  andi       $a2, $s6, 0xFFFF
    /* 7A40C 8008A40C 8800A98F */  lw         $t1, 0x88($sp)
    /* 7A410 8008A410 9000AA8F */  lw         $t2, 0x90($sp)
    /* 7A414 8008A414 003A0200 */  sll        $a3, $v0, 8
    /* 7A418 8008A418 1800BEAF */  sw         $fp, 0x18($sp)
    /* 7A41C 8008A41C 25380701 */  or         $a3, $t0, $a3
    /* 7A420 8008A420 1000A9AF */  sw         $t1, 0x10($sp)
    /* 7A424 8008A424 6D27020C */  jal        KanjiPrintChar__5CFontUsUsUsUcUcUc
    /* 7A428 8008A428 1400AAAF */   sw        $t2, 0x14($sp)
    /* 7A42C 8008A42C F6280208 */  j          .L8008A3D8
    /* 7A430 8008A430 21A08202 */   addu      $s4, $s4, $v0
  .L8008A434:
    /* 7A434 8008A434 E8FF6010 */  beqz       $v1, .L8008A3D8
    /* 7A438 8008A438 21206002 */   addu      $a0, $s3, $zero
    /* 7A43C 8008A43C FFFF8532 */  andi       $a1, $s4, 0xFFFF
    /* 7A440 8008A440 0100C626 */  addiu      $a2, $s6, 0x1
    /* 7A444 8008A444 FFFFC630 */  andi       $a2, $a2, 0xFFFF
    /* 7A448 8008A448 8800A98F */  lw         $t1, 0x88($sp)
    /* 7A44C 8008A44C 9000AA8F */  lw         $t2, 0x90($sp)
    /* 7A450 8008A450 21380001 */  addu       $a3, $t0, $zero
    /* 7A454 8008A454 1800BEAF */  sw         $fp, 0x18($sp)
    /* 7A458 8008A458 1000A9AF */  sw         $t1, 0x10($sp)
    /* 7A45C 8008A45C BB27020C */  jal        PrintChar__5CFontUsUsUcUcUcUc
    /* 7A460 8008A460 1400AAAF */   sw        $t2, 0x14($sp)
    /* 7A464 8008A464 F6280208 */  j          .L8008A3D8
    /* 7A468 8008A468 21A08202 */   addu      $s4, $s4, $v0
  .L8008A46C:
    /* 7A46C 8008A46C 1002628E */  lw         $v0, 0x210($s3)
    /* 7A470 8008A470 5800A98F */  lw         $t1, 0x58($sp)
    /* 7A474 8008A474 2310E202 */  subu       $v0, $s7, $v0
    /* 7A478 8008A478 C21F0200 */  srl        $v1, $v0, 31
    /* 7A47C 8008A47C 21104300 */  addu       $v0, $v0, $v1
    /* 7A480 8008A480 43100200 */  sra        $v0, $v0, 1
    /* 7A484 8008A484 0802638E */  lw         $v1, 0x208($s3)
    /* 7A488 8008A488 21A04900 */  addu       $s4, $v0, $t1
    /* 7A48C 8008A48C 2A188302 */  slt        $v1, $s4, $v1
    /* 7A490 8008A490 02006010 */  beqz       $v1, .L8008A49C
    /* 7A494 8008A494 00000000 */   nop
    /* 7A498 8008A498 080274AE */  sw         $s4, 0x208($s3)
  .L8008A49C:
    /* 7A49C 8008A49C 5E005112 */  beq        $s2, $s1, .L8008A618
    /* 7A4A0 8008A4A0 00000000 */   nop
  .L8008A4A4:
    /* 7A4A4 8008A4A4 00004382 */  lb         $v1, 0x0($s2)
    /* 7A4A8 8008A4A8 00000000 */  nop
    /* 7A4AC 8008A4AC 80006230 */  andi       $v0, $v1, 0x80
    /* 7A4B0 8008A4B0 12004010 */  beqz       $v0, .L8008A4FC
    /* 7A4B4 8008A4B4 21386000 */   addu      $a3, $v1, $zero
    /* 7A4B8 8008A4B8 01005226 */  addiu      $s2, $s2, 0x1
    /* 7A4BC 8008A4BC 00004392 */  lbu        $v1, 0x0($s2)
    /* 7A4C0 8008A4C0 01005226 */  addiu      $s2, $s2, 0x1
    /* 7A4C4 8008A4C4 21206002 */  addu       $a0, $s3, $zero
    /* 7A4C8 8008A4C8 FFFF8532 */  andi       $a1, $s4, 0xFFFF
    /* 7A4CC 8008A4CC FFFFC632 */  andi       $a2, $s6, 0xFFFF
    /* 7A4D0 8008A4D0 8800AA8F */  lw         $t2, 0x88($sp)
    /* 7A4D4 8008A4D4 9000A98F */  lw         $t1, 0x90($sp)
    /* 7A4D8 8008A4D8 00120700 */  sll        $v0, $a3, 8
    /* 7A4DC 8008A4DC 1800BEAF */  sw         $fp, 0x18($sp)
    /* 7A4E0 8008A4E0 25104300 */  or         $v0, $v0, $v1
    /* 7A4E4 8008A4E4 FFFF4730 */  andi       $a3, $v0, 0xFFFF
    /* 7A4E8 8008A4E8 1000AAAF */  sw         $t2, 0x10($sp)
    /* 7A4EC 8008A4EC 6D27020C */  jal        KanjiPrintChar__5CFontUsUsUsUcUcUc
    /* 7A4F0 8008A4F0 1400A9AF */   sw        $t1, 0x14($sp)
    /* 7A4F4 8008A4F4 4F290208 */  j          .L8008A53C
    /* 7A4F8 8008A4F8 21A08202 */   addu      $s4, $s4, $v0
  .L8008A4FC:
    /* 7A4FC 8008A4FC 0E006010 */  beqz       $v1, .L8008A538
    /* 7A500 8008A500 21206002 */   addu      $a0, $s3, $zero
    /* 7A504 8008A504 01005226 */  addiu      $s2, $s2, 0x1
    /* 7A508 8008A508 FFFF8532 */  andi       $a1, $s4, 0xFFFF
    /* 7A50C 8008A50C 0100C626 */  addiu      $a2, $s6, 0x1
    /* 7A510 8008A510 FFFFC630 */  andi       $a2, $a2, 0xFFFF
    /* 7A514 8008A514 8800AA8F */  lw         $t2, 0x88($sp)
    /* 7A518 8008A518 9000A98F */  lw         $t1, 0x90($sp)
    /* 7A51C 8008A51C FF00E730 */  andi       $a3, $a3, 0xFF
    /* 7A520 8008A520 1800BEAF */  sw         $fp, 0x18($sp)
    /* 7A524 8008A524 1000AAAF */  sw         $t2, 0x10($sp)
    /* 7A528 8008A528 BB27020C */  jal        PrintChar__5CFontUsUsUcUcUcUc
    /* 7A52C 8008A52C 1400A9AF */   sw        $t1, 0x14($sp)
    /* 7A530 8008A530 4F290208 */  j          .L8008A53C
    /* 7A534 8008A534 21A08202 */   addu      $s4, $s4, $v0
  .L8008A538:
    /* 7A538 8008A538 01005226 */  addiu      $s2, $s2, 0x1
  .L8008A53C:
    /* 7A53C 8008A53C 36005112 */  beq        $s2, $s1, .L8008A618
    /* 7A540 8008A540 00000000 */   nop
    /* 7A544 8008A544 29290208 */  j          .L8008A4A4
    /* 7A548 8008A548 00000000 */   nop
  .L8008A54C:
    /* 7A54C 8008A54C 1002628E */  lw         $v0, 0x210($s3)
    /* 7A550 8008A550 0802638E */  lw         $v1, 0x208($s3)
    /* 7A554 8008A554 5800AA8F */  lw         $t2, 0x58($sp)
    /* 7A558 8008A558 2310E202 */  subu       $v0, $s7, $v0
    /* 7A55C 8008A55C 21A04A00 */  addu       $s4, $v0, $t2
    /* 7A560 8008A560 2A188302 */  slt        $v1, $s4, $v1
    /* 7A564 8008A564 02006010 */  beqz       $v1, .L8008A570
    /* 7A568 8008A568 00000000 */   nop
    /* 7A56C 8008A56C 080274AE */  sw         $s4, 0x208($s3)
  .L8008A570:
    /* 7A570 8008A570 29005112 */  beq        $s2, $s1, .L8008A618
    /* 7A574 8008A574 00000000 */   nop
  .L8008A578:
    /* 7A578 8008A578 00004382 */  lb         $v1, 0x0($s2)
    /* 7A57C 8008A57C 00000000 */  nop
    /* 7A580 8008A580 80006230 */  andi       $v0, $v1, 0x80
    /* 7A584 8008A584 12004010 */  beqz       $v0, .L8008A5D0
    /* 7A588 8008A588 21386000 */   addu      $a3, $v1, $zero
    /* 7A58C 8008A58C 01005226 */  addiu      $s2, $s2, 0x1
    /* 7A590 8008A590 00004392 */  lbu        $v1, 0x0($s2)
    /* 7A594 8008A594 01005226 */  addiu      $s2, $s2, 0x1
    /* 7A598 8008A598 21206002 */  addu       $a0, $s3, $zero
    /* 7A59C 8008A59C FFFF8532 */  andi       $a1, $s4, 0xFFFF
    /* 7A5A0 8008A5A0 FFFFC632 */  andi       $a2, $s6, 0xFFFF
    /* 7A5A4 8008A5A4 8800A98F */  lw         $t1, 0x88($sp)
    /* 7A5A8 8008A5A8 9000AA8F */  lw         $t2, 0x90($sp)
    /* 7A5AC 8008A5AC 00120700 */  sll        $v0, $a3, 8
    /* 7A5B0 8008A5B0 1800BEAF */  sw         $fp, 0x18($sp)
    /* 7A5B4 8008A5B4 25104300 */  or         $v0, $v0, $v1
    /* 7A5B8 8008A5B8 FFFF4730 */  andi       $a3, $v0, 0xFFFF
    /* 7A5BC 8008A5BC 1000A9AF */  sw         $t1, 0x10($sp)
    /* 7A5C0 8008A5C0 6D27020C */  jal        KanjiPrintChar__5CFontUsUsUsUcUcUc
    /* 7A5C4 8008A5C4 1400AAAF */   sw        $t2, 0x14($sp)
    /* 7A5C8 8008A5C8 84290208 */  j          .L8008A610
    /* 7A5CC 8008A5CC 21A08202 */   addu      $s4, $s4, $v0
  .L8008A5D0:
    /* 7A5D0 8008A5D0 0E006010 */  beqz       $v1, .L8008A60C
    /* 7A5D4 8008A5D4 21206002 */   addu      $a0, $s3, $zero
    /* 7A5D8 8008A5D8 01005226 */  addiu      $s2, $s2, 0x1
    /* 7A5DC 8008A5DC FFFF8532 */  andi       $a1, $s4, 0xFFFF
    /* 7A5E0 8008A5E0 0100C626 */  addiu      $a2, $s6, 0x1
    /* 7A5E4 8008A5E4 FFFFC630 */  andi       $a2, $a2, 0xFFFF
    /* 7A5E8 8008A5E8 8800A98F */  lw         $t1, 0x88($sp)
    /* 7A5EC 8008A5EC 9000AA8F */  lw         $t2, 0x90($sp)
    /* 7A5F0 8008A5F0 FF00E730 */  andi       $a3, $a3, 0xFF
    /* 7A5F4 8008A5F4 1800BEAF */  sw         $fp, 0x18($sp)
    /* 7A5F8 8008A5F8 1000A9AF */  sw         $t1, 0x10($sp)
    /* 7A5FC 8008A5FC BB27020C */  jal        PrintChar__5CFontUsUsUcUcUcUc
    /* 7A600 8008A600 1400AAAF */   sw        $t2, 0x14($sp)
    /* 7A604 8008A604 84290208 */  j          .L8008A610
    /* 7A608 8008A608 21A08202 */   addu      $s4, $s4, $v0
  .L8008A60C:
    /* 7A60C 8008A60C 01005226 */  addiu      $s2, $s2, 0x1
  .L8008A610:
    /* 7A610 8008A610 D9FF5116 */  bne        $s2, $s1, .L8008A578
    /* 7A614 8008A614 00000000 */   nop
  .L8008A618:
    /* 7A618 8008A618 0C02628E */  lw         $v0, 0x20C($s3)
    /* 7A61C 8008A61C 00000000 */  nop
    /* 7A620 8008A620 2A105400 */  slt        $v0, $v0, $s4
    /* 7A624 8008A624 02004010 */  beqz       $v0, .L8008A630
    /* 7A628 8008A628 20000924 */   addiu     $t1, $zero, 0x20
    /* 7A62C 8008A62C 0C0274AE */  sw         $s4, 0x20C($s3)
  .L8008A630:
    /* 7A630 8008A630 18026292 */  lbu        $v0, 0x218($s3)
    /* 7A634 8008A634 00004382 */  lb         $v1, 0x0($s2)
    /* 7A638 8008A638 00000000 */  nop
    /* 7A63C 8008A63C DAFE6914 */  bne        $v1, $t1, .L8008A1A8
    /* 7A640 8008A640 21B0C202 */   addu      $s6, $s6, $v0
    /* 7A644 8008A644 20000324 */  addiu      $v1, $zero, 0x20
    /* 7A648 8008A648 01005226 */  addiu      $s2, $s2, 0x1
  .L8008A64C:
    /* 7A64C 8008A64C 00004282 */  lb         $v0, 0x0($s2)
    /* 7A650 8008A650 00000000 */  nop
    /* 7A654 8008A654 FDFF4310 */  beq        $v0, $v1, .L8008A64C
    /* 7A658 8008A658 01005226 */   addiu     $s2, $s2, 0x1
    /* 7A65C 8008A65C 6A280208 */  j          .L8008A1A8
    /* 7A660 8008A660 FFFF5226 */   addiu     $s2, $s2, -0x1
  .L8008A664:
    /* 7A664 8008A664 5800AA97 */  lhu        $t2, 0x58($sp)
    /* 7A668 8008A668 6000A997 */  lhu        $t1, 0x60($sp)
    /* 7A66C 8008A66C 2000AAA7 */  sh         $t2, 0x20($sp)
    /* 7A670 8008A670 5000AA97 */  lhu        $t2, 0x50($sp)
    /* 7A674 8008A674 2400B7A7 */  sh         $s7, 0x24($sp)
    /* 7A678 8008A678 2200A9A7 */  sh         $t1, 0x22($sp)
    /* 7A67C 8008A67C 2600AAA7 */  sh         $t2, 0x26($sp)
    /* 7A680 8008A680 0402658E */  lw         $a1, 0x204($s3)
    /* 7A684 8008A684 2000A427 */  addiu      $a0, $sp, 0x20
    /* 7A688 8008A688 7B0E020C */  jal        PRIM_Clip__FP4RECTi
    /* 7A68C 8008A68C 0100A524 */   addiu     $a1, $a1, 0x1
    /* 7A690 8008A690 4000A28F */  lw         $v0, 0x40($sp)
    /* 7A694 8008A694 CC00BF8F */  lw         $ra, 0xCC($sp)
    /* 7A698 8008A698 C800BE8F */  lw         $fp, 0xC8($sp)
    /* 7A69C 8008A69C C400B78F */  lw         $s7, 0xC4($sp)
    /* 7A6A0 8008A6A0 C000B68F */  lw         $s6, 0xC0($sp)
    /* 7A6A4 8008A6A4 BC00B58F */  lw         $s5, 0xBC($sp)
    /* 7A6A8 8008A6A8 B800B48F */  lw         $s4, 0xB8($sp)
    /* 7A6AC 8008A6AC B400B38F */  lw         $s3, 0xB4($sp)
    /* 7A6B0 8008A6B0 B000B28F */  lw         $s2, 0xB0($sp)
    /* 7A6B4 8008A6B4 AC00B18F */  lw         $s1, 0xAC($sp)
    /* 7A6B8 8008A6B8 A800B08F */  lw         $s0, 0xA8($sp)
    /* 7A6BC 8008A6BC D000BD27 */  addiu      $sp, $sp, 0xD0
    /* 7A6C0 8008A6C0 0800E003 */  jr         $ra
    /* 7A6C4 8008A6C4 00000000 */   nop
endlabel Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
