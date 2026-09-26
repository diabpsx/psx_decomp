.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeDrawBuffer__Fv, 0x62C

glabel FeDrawBuffer__Fv
    /* 280 80139E78 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 284 80139E7C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 288 80139E80 8C00BFAF */  sw         $ra, 0x8C($sp)
    /* 28C 80139E84 8800BEAF */  sw         $fp, 0x88($sp)
    /* 290 80139E88 8400B7AF */  sw         $s7, 0x84($sp)
    /* 294 80139E8C 8000B6AF */  sw         $s6, 0x80($sp)
    /* 298 80139E90 7C00B5AF */  sw         $s5, 0x7C($sp)
    /* 29C 80139E94 7800B4AF */  sw         $s4, 0x78($sp)
    /* 2A0 80139E98 7400B3AF */  sw         $s3, 0x74($sp)
    /* 2A4 80139E9C 7000B2AF */  sw         $s2, 0x70($sp)
    /* 2A8 80139EA0 6C00B1AF */  sw         $s1, 0x6C($sp)
    /* 2AC 80139EA4 AFF2040C */  jal        __6Dialog_8013cabc
    /* 2B0 80139EA8 6800B0AF */   sw        $s0, 0x68($sp)
    /* 2B4 80139EAC 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2B8 80139EB0 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2BC 80139EB4 00000000 */  nop
    /* 2C0 80139EB8 6B014014 */  bnez       $v0, .L8013A468
    /* 2C4 80139EBC 2800A427 */   addiu     $a0, $sp, 0x28
    /* 2C8 80139EC0 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 2CC 80139EC4 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 2D0 80139EC8 00000000 */  nop
    /* 2D4 80139ECC 66014014 */  bnez       $v0, .L8013A468
    /* 2D8 80139ED0 00000000 */   nop
    /* 2DC 80139ED4 871F020C */  jal        BL_AsyncLoadDone__Fv
    /* 2E0 80139ED8 00000000 */   nop
    /* 2E4 80139EDC 01004238 */  xori       $v0, $v0, 0x1
    /* 2E8 80139EE0 61014014 */  bnez       $v0, .L8013A468
    /* 2EC 80139EE4 2800A427 */   addiu     $a0, $sp, 0x28
    /* 2F0 80139EE8 1280023C */  lui        $v0, %hi(TextPtr)
    /* 2F4 80139EEC F4BB428C */  lw         $v0, %lo(TextPtr)($v0)
    /* 2F8 80139EF0 00000000 */  nop
    /* 2FC 80139EF4 5B014010 */  beqz       $v0, .L8013A464
    /* 300 80139EF8 21200000 */   addu      $a0, $zero, $zero
    /* 304 80139EFC 4900A0A3 */  sb         $zero, 0x49($sp)
    /* 308 80139F00 044F020C */  jal        GM_UseTexData__Fi
    /* 30C 80139F04 4800A0A3 */   sb        $zero, 0x48($sp)
    /* 310 80139F08 21A80000 */  addu       $s5, $zero, $zero
    /* 314 80139F0C 0C80173C */  lui        $s7, %hi(LargeFont)
    /* 318 80139F10 F484F726 */  addiu      $s7, $s7, %lo(LargeFont)
    /* 31C 80139F14 12800A3C */  lui        $t2, %hi(GOLDR)
    /* 320 80139F18 DAAB4A91 */  lbu        $t2, %lo(GOLDR)($t2)
    /* 324 80139F1C 12801E3C */  lui        $fp, %hi(GOLDB)
    /* 328 80139F20 DCABDE93 */  lbu        $fp, %lo(GOLDB)($fp)
    /* 32C 80139F24 0D80163C */  lui        $s6, %hi(FeBuffer + 0x10)
    /* 330 80139F28 88DBD626 */  addiu      $s6, $s6, %lo(FeBuffer + 0x10)
    /* 334 80139F2C 5000A2AF */  sw         $v0, 0x50($sp)
    /* 338 80139F30 E40B828F */  lw         $v0, %gp_rel(FeBackX)($gp)
    /* 33C 80139F34 E80B838F */  lw         $v1, %gp_rel(FeBackY)($gp)
    /* 340 80139F38 EC0B848F */  lw         $a0, %gp_rel(FeBackW)($gp)
    /* 344 80139F3C F00B858F */  lw         $a1, %gp_rel(FeBackH)($gp)
    /* 348 80139F40 21800000 */  addu       $s0, $zero, $zero
    /* 34C 80139F44 5800AAA3 */  sb         $t2, 0x58($sp)
    /* 350 80139F48 12800A3C */  lui        $t2, %hi(GOLDG)
    /* 354 80139F4C DBAB4A91 */  lbu        $t2, %lo(GOLDG)($t2)
    /* 358 80139F50 F8FF4224 */  addiu      $v0, $v0, -0x8
    /* 35C 80139F54 3800A2A7 */  sh         $v0, 0x38($sp)
    /* 360 80139F58 3A00A3A7 */  sh         $v1, 0x3A($sp)
    /* 364 80139F5C 3C00A4A7 */  sh         $a0, 0x3C($sp)
    /* 368 80139F60 3E00A5A7 */  sh         $a1, 0x3E($sp)
    /* 36C 80139F64 6000AAA3 */  sb         $t2, 0x60($sp)
  .L80139F68:
    /* 370 80139F68 FC0B828F */  lw         $v0, %gp_rel(FeBufferCount)($gp)
    /* 374 80139F6C 00000000 */  nop
    /* 378 80139F70 2A10A202 */  slt        $v0, $s5, $v0
    /* 37C 80139F74 E3004010 */  beqz       $v0, .L8013A304
    /* 380 80139F78 00000000 */   nop
    /* 384 80139F7C 0D80013C */  lui        $at, %hi(FeBuffer + 0x4)
    /* 388 80139F80 21083000 */  addu       $at, $at, $s0
    /* 38C 80139F84 7CDB338C */  lw         $s3, %lo(FeBuffer + 0x4)($at)
    /* 390 80139F88 E80B828F */  lw         $v0, %gp_rel(FeBackY)($gp)
    /* 394 80139F8C 0D80013C */  lui        $at, %hi(FeBuffer)
    /* 398 80139F90 21083000 */  addu       $at, $at, $s0
    /* 39C 80139F94 78DB318C */  lw         $s1, %lo(FeBuffer)($at)
    /* 3A0 80139F98 21186202 */  addu       $v1, $s3, $v0
    /* 3A4 80139F9C 0000C28E */  lw         $v0, 0x0($s6)
    /* 3A8 80139FA0 00000000 */  nop
    /* 3AC 80139FA4 02005714 */  bne        $v0, $s7, .L80139FB0
    /* 3B0 80139FA8 08007224 */   addiu     $s2, $v1, 0x8
    /* 3B4 80139FAC 04007224 */  addiu      $s2, $v1, 0x4
  .L80139FB0:
    /* 3B8 80139FB0 0D80013C */  lui        $at, %hi(FeBuffer + 0x8)
    /* 3BC 80139FB4 21083000 */  addu       $at, $at, $s0
    /* 3C0 80139FB8 80DB348C */  lw         $s4, %lo(FeBuffer + 0x8)($at)
    /* 3C4 80139FBC 1800A016 */  bnez       $s5, .L8013A020
    /* 3C8 80139FC0 00000000 */   nop
    /* 3CC 80139FC4 0D80023C */  lui        $v0, %hi(FeBuffer + 0x14)
    /* 3D0 80139FC8 8CDB428C */  lw         $v0, %lo(FeBuffer + 0x14)($v0)
    /* 3D4 80139FCC 00000000 */  nop
    /* 3D8 80139FD0 13004014 */  bnez       $v0, .L8013A020
    /* 3DC 80139FD4 00000000 */   nop
    /* 3E0 80139FD8 0D80043C */  lui        $a0, %hi(FeBuffer + 0xC)
    /* 3E4 80139FDC 84DB848C */  lw         $a0, %lo(FeBuffer + 0xC)($a0)
    /* 3E8 80139FE0 4AED010C */  jal        GetStr__Fi
    /* 3EC 80139FE4 00000000 */   nop
    /* 3F0 80139FE8 2120E002 */  addu       $a0, $s7, $zero
    /* 3F4 80139FEC 21280000 */  addu       $a1, $zero, $zero
    /* 3F8 80139FF0 28000624 */  addiu      $a2, $zero, 0x28
    /* 3FC 80139FF4 21384000 */  addu       $a3, $v0, $zero
    /* 400 80139FF8 1280033C */  lui        $v1, %hi(BLUER)
    /* 404 80139FFC D4AB6390 */  lbu        $v1, %lo(BLUER)($v1)
    /* 408 8013A000 1280083C */  lui        $t0, %hi(BLUEG)
    /* 40C 8013A004 D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 410 8013A008 1280093C */  lui        $t1, %hi(BLUEB)
    /* 414 8013A00C D6AB2991 */  lbu        $t1, %lo(BLUEB)($t1)
    /* 418 8013A010 01000224 */  addiu      $v0, $zero, 0x1
    /* 41C 8013A014 1000A2AF */  sw         $v0, 0x10($sp)
    /* 420 8013A018 97E80408 */  j          .L8013A25C
    /* 424 8013A01C 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013A020:
    /* 428 8013A020 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 42C 8013A024 00000000 */  nop
    /* 430 8013A028 0400428C */  lw         $v0, 0x4($v0)
    /* 434 8013A02C 00000000 */  nop
    /* 438 8013A030 5100A216 */  bne        $s5, $v0, .L8013A178
    /* 43C 8013A034 00000000 */   nop
    /* 440 8013A038 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* 444 8013A03C 21083000 */  addu       $at, $at, $s0
    /* 448 8013A040 84DB248C */  lw         $a0, %lo(FeBuffer + 0xC)($at)
    /* 44C 8013A044 00000000 */  nop
    /* 450 8013A048 00108228 */  slti       $v0, $a0, 0x1000
    /* 454 8013A04C 16004010 */  beqz       $v0, .L8013A0A8
    /* 458 8013A050 21280000 */   addu      $a1, $zero, $zero
    /* 45C 8013A054 4AED010C */  jal        GetStr__Fi
    /* 460 8013A058 00000000 */   nop
    /* 464 8013A05C 21282002 */  addu       $a1, $s1, $zero
    /* 468 8013A060 21384000 */  addu       $a3, $v0, $zero
    /* 46C 8013A064 0D80013C */  lui        $at, %hi(FeBuffer + 0x10)
    /* 470 8013A068 21083000 */  addu       $at, $at, $s0
    /* 474 8013A06C 88DB248C */  lw         $a0, %lo(FeBuffer + 0x10)($at)
    /* 478 8013A070 3800A227 */  addiu      $v0, $sp, 0x38
    /* 47C 8013A074 1400A2AF */  sw         $v0, 0x14($sp)
    /* 480 8013A078 1280023C */  lui        $v0, %hi(GOLDR)
    /* 484 8013A07C DAAB4290 */  lbu        $v0, %lo(GOLDR)($v0)
    /* 488 8013A080 1280033C */  lui        $v1, %hi(GOLDG)
    /* 48C 8013A084 DBAB6390 */  lbu        $v1, %lo(GOLDG)($v1)
    /* 490 8013A088 1280083C */  lui        $t0, %hi(GOLDB)
    /* 494 8013A08C DCAB0891 */  lbu        $t0, %lo(GOLDB)($t0)
    /* 498 8013A090 08006626 */  addiu      $a2, $s3, 0x8
    /* 49C 8013A094 1000B4AF */  sw         $s4, 0x10($sp)
    /* 4A0 8013A098 1800A2AF */  sw         $v0, 0x18($sp)
    /* 4A4 8013A09C 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 4A8 8013A0A0 9AE80408 */  j          .L8013A268
    /* 4AC 8013A0A4 2000A8AF */   sw        $t0, 0x20($sp)
  .L8013A0A8:
    /* 4B0 8013A0A8 E40B838F */  lw         $v1, %gp_rel(FeBackX)($gp)
    /* 4B4 8013A0AC 0E000224 */  addiu      $v0, $zero, 0xE
    /* 4B8 8013A0B0 4400A2A7 */  sh         $v0, 0x44($sp)
    /* 4BC 8013A0B4 0D000224 */  addiu      $v0, $zero, 0xD
    /* 4C0 8013A0B8 4600A2A7 */  sh         $v0, 0x46($sp)
    /* 4C4 8013A0BC E80B828F */  lw         $v0, %gp_rel(FeBackY)($gp)
    /* 4C8 8013A0C0 5800AA93 */  lbu        $t2, 0x58($sp)
    /* 4CC 8013A0C4 21187100 */  addu       $v1, $v1, $s1
    /* 4D0 8013A0C8 F8FF6324 */  addiu      $v1, $v1, -0x8
    /* 4D4 8013A0CC 21105300 */  addu       $v0, $v0, $s3
    /* 4D8 8013A0D0 4000A3A7 */  sh         $v1, 0x40($sp)
    /* 4DC 8013A0D4 4200A2A7 */  sh         $v0, 0x42($sp)
    /* 4E0 8013A0D8 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* 4E4 8013A0DC 21083000 */  addu       $at, $at, $s0
    /* 4E8 8013A0E0 84DB228C */  lw         $v0, %lo(FeBuffer + 0xC)($at)
    /* 4EC 8013A0E4 08000624 */  addiu      $a2, $zero, 0x8
    /* 4F0 8013A0E8 4800A2A3 */  sb         $v0, 0x48($sp)
    /* 4F4 8013A0EC 0D80013C */  lui        $at, %hi(FeBuffer + 0x10)
    /* 4F8 8013A0F0 21083000 */  addu       $at, $at, $s0
    /* 4FC 8013A0F4 88DB248C */  lw         $a0, %lo(FeBuffer + 0x10)($at)
    /* 500 8013A0F8 4800A727 */  addiu      $a3, $sp, 0x48
    /* 504 8013A0FC 1800AAAF */  sw         $t2, 0x18($sp)
    /* 508 8013A100 6000AA93 */  lbu        $t2, 0x60($sp)
    /* 50C 8013A104 4000A227 */  addiu      $v0, $sp, 0x40
    /* 510 8013A108 1000B4AF */  sw         $s4, 0x10($sp)
    /* 514 8013A10C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 518 8013A110 2000BEAF */  sw         $fp, 0x20($sp)
    /* 51C 8013A114 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 520 8013A118 1C00AAAF */   sw        $t2, 0x1C($sp)
    /* 524 8013A11C 42010524 */  addiu      $a1, $zero, 0x142
    /* 528 8013A120 5000A48F */  lw         $a0, 0x50($sp)
    /* 52C 8013A124 E40B868F */  lw         $a2, %gp_rel(FeBackX)($gp)
    /* 530 8013A128 E80B878F */  lw         $a3, %gp_rel(FeBackY)($gp)
    /* 534 8013A12C FD000224 */  addiu      $v0, $zero, 0xFD
    /* 538 8013A130 1000A0AF */  sw         $zero, 0x10($sp)
    /* 53C 8013A134 1400A2AF */  sw         $v0, 0x14($sp)
    /* 540 8013A138 1800A0AF */  sw         $zero, 0x18($sp)
    /* 544 8013A13C 2130D100 */  addu       $a2, $a2, $s1
    /* 548 8013A140 FAFFC624 */  addiu      $a2, $a2, -0x6
    /* 54C 8013A144 2138F300 */  addu       $a3, $a3, $s3
    /* 550 8013A148 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 554 8013A14C 0700E724 */   addiu     $a3, $a3, 0x7
    /* 558 8013A150 07004390 */  lbu        $v1, 0x7($v0)
    /* 55C 8013A154 5800AA93 */  lbu        $t2, 0x58($sp)
    /* 560 8013A158 02006334 */  ori        $v1, $v1, 0x2
    /* 564 8013A15C 04004AA0 */  sb         $t2, 0x4($v0)
    /* 568 8013A160 6000AA93 */  lbu        $t2, 0x60($sp)
    /* 56C 8013A164 FE006330 */  andi       $v1, $v1, 0xFE
    /* 570 8013A168 06005EA0 */  sb         $fp, 0x6($v0)
    /* 574 8013A16C 070043A0 */  sb         $v1, 0x7($v0)
    /* 578 8013A170 9CE80408 */  j          .L8013A270
    /* 57C 8013A174 05004AA0 */   sb        $t2, 0x5($v0)
  .L8013A178:
    /* 580 8013A178 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* 584 8013A17C 21083000 */  addu       $at, $at, $s0
    /* 588 8013A180 84DB248C */  lw         $a0, %lo(FeBuffer + 0xC)($at)
    /* 58C 8013A184 00000000 */  nop
    /* 590 8013A188 00108228 */  slti       $v0, $a0, 0x1000
    /* 594 8013A18C 16004010 */  beqz       $v0, .L8013A1E8
    /* 598 8013A190 21280000 */   addu      $a1, $zero, $zero
    /* 59C 8013A194 4AED010C */  jal        GetStr__Fi
    /* 5A0 8013A198 00000000 */   nop
    /* 5A4 8013A19C 21282002 */  addu       $a1, $s1, $zero
    /* 5A8 8013A1A0 21384000 */  addu       $a3, $v0, $zero
    /* 5AC 8013A1A4 0D80013C */  lui        $at, %hi(FeBuffer + 0x10)
    /* 5B0 8013A1A8 21083000 */  addu       $at, $at, $s0
    /* 5B4 8013A1AC 88DB248C */  lw         $a0, %lo(FeBuffer + 0x10)($at)
    /* 5B8 8013A1B0 3800A227 */  addiu      $v0, $sp, 0x38
    /* 5BC 8013A1B4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 5C0 8013A1B8 1280023C */  lui        $v0, %hi(WHITER)
    /* 5C4 8013A1BC D1AB4290 */  lbu        $v0, %lo(WHITER)($v0)
    /* 5C8 8013A1C0 1280033C */  lui        $v1, %hi(WHITEG)
    /* 5CC 8013A1C4 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 5D0 8013A1C8 1280083C */  lui        $t0, %hi(WHITEB)
    /* 5D4 8013A1CC D3AB0891 */  lbu        $t0, %lo(WHITEB)($t0)
    /* 5D8 8013A1D0 08006626 */  addiu      $a2, $s3, 0x8
    /* 5DC 8013A1D4 1000B4AF */  sw         $s4, 0x10($sp)
    /* 5E0 8013A1D8 1800A2AF */  sw         $v0, 0x18($sp)
    /* 5E4 8013A1DC 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 5E8 8013A1E0 9AE80408 */  j          .L8013A268
    /* 5EC 8013A1E4 2000A8AF */   sw        $t0, 0x20($sp)
  .L8013A1E8:
    /* 5F0 8013A1E8 0E000224 */  addiu      $v0, $zero, 0xE
    /* 5F4 8013A1EC 4400A2A7 */  sh         $v0, 0x44($sp)
    /* 5F8 8013A1F0 0D000224 */  addiu      $v0, $zero, 0xD
    /* 5FC 8013A1F4 E40B838F */  lw         $v1, %gp_rel(FeBackX)($gp)
    /* 600 8013A1F8 08000624 */  addiu      $a2, $zero, 0x8
    /* 604 8013A1FC 4600A2A7 */  sh         $v0, 0x46($sp)
    /* 608 8013A200 E80B828F */  lw         $v0, %gp_rel(FeBackY)($gp)
    /* 60C 8013A204 1280083C */  lui        $t0, %hi(WHITEG)
    /* 610 8013A208 D2AB0891 */  lbu        $t0, %lo(WHITEG)($t0)
    /* 614 8013A20C 1280093C */  lui        $t1, %hi(WHITEB)
    /* 618 8013A210 D3AB2991 */  lbu        $t1, %lo(WHITEB)($t1)
    /* 61C 8013A214 21187100 */  addu       $v1, $v1, $s1
    /* 620 8013A218 F8FF6324 */  addiu      $v1, $v1, -0x8
    /* 624 8013A21C 21105300 */  addu       $v0, $v0, $s3
    /* 628 8013A220 4000A3A7 */  sh         $v1, 0x40($sp)
    /* 62C 8013A224 4200A2A7 */  sh         $v0, 0x42($sp)
    /* 630 8013A228 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* 634 8013A22C 21083000 */  addu       $at, $at, $s0
    /* 638 8013A230 84DB228C */  lw         $v0, %lo(FeBuffer + 0xC)($at)
    /* 63C 8013A234 1280033C */  lui        $v1, %hi(WHITER)
    /* 640 8013A238 D1AB6390 */  lbu        $v1, %lo(WHITER)($v1)
    /* 644 8013A23C 4800A727 */  addiu      $a3, $sp, 0x48
    /* 648 8013A240 4800A2A3 */  sb         $v0, 0x48($sp)
    /* 64C 8013A244 0D80013C */  lui        $at, %hi(FeBuffer + 0x10)
    /* 650 8013A248 21083000 */  addu       $at, $at, $s0
    /* 654 8013A24C 88DB248C */  lw         $a0, %lo(FeBuffer + 0x10)($at)
    /* 658 8013A250 4000A227 */  addiu      $v0, $sp, 0x40
    /* 65C 8013A254 1000B4AF */  sw         $s4, 0x10($sp)
    /* 660 8013A258 1400A2AF */  sw         $v0, 0x14($sp)
  .L8013A25C:
    /* 664 8013A25C 1800A3AF */  sw         $v1, 0x18($sp)
    /* 668 8013A260 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 66C 8013A264 2000A9AF */  sw         $t1, 0x20($sp)
  .L8013A268:
    /* 670 8013A268 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 674 8013A26C 00000000 */   nop
  .L8013A270:
    /* 678 8013A270 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 67C 8013A274 0D80023C */  lui        $v0, %hi(FeNewP1NameMenu)
    /* 680 8013A278 F0D64224 */  addiu      $v0, $v0, %lo(FeNewP1NameMenu)
    /* 684 8013A27C 1D006210 */  beq        $v1, $v0, .L8013A2F4
    /* 688 8013A280 00000000 */   nop
    /* 68C 8013A284 0D80023C */  lui        $v0, %hi(FeNewP2NameMenu)
    /* 690 8013A288 28D74224 */  addiu      $v0, $v0, %lo(FeNewP2NameMenu)
    /* 694 8013A28C 19006210 */  beq        $v1, $v0, .L8013A2F4
    /* 698 8013A290 00000000 */   nop
    /* 69C 8013A294 0400628C */  lw         $v0, 0x4($v1)
    /* 6A0 8013A298 00000000 */  nop
    /* 6A4 8013A29C 1500A216 */  bne        $s5, $v0, .L8013A2F4
    /* 6A8 8013A2A0 00000000 */   nop
    /* 6AC 8013A2A4 0000C38E */  lw         $v1, 0x0($s6)
    /* 6B0 8013A2A8 00000000 */  nop
    /* 6B4 8013A2AC 0802628C */  lw         $v0, 0x208($v1)
    /* 6B8 8013A2B0 00000000 */  nop
    /* 6BC 8013A2B4 F4FF4424 */  addiu      $a0, $v0, -0xC
    /* 6C0 8013A2B8 02007714 */  bne        $v1, $s7, .L8013A2C4
    /* 6C4 8013A2BC 21284002 */   addu      $a1, $s2, $zero
    /* 6C8 8013A2C0 03004526 */  addiu      $a1, $s2, 0x3
  .L8013A2C4:
    /* 6CC 8013A2C4 6EF2040C */  jal        DrawFeTwinkle__Fii
    /* 6D0 8013A2C8 00000000 */   nop
    /* 6D4 8013A2CC 0000C38E */  lw         $v1, 0x0($s6)
    /* 6D8 8013A2D0 00000000 */  nop
    /* 6DC 8013A2D4 0C02628C */  lw         $v0, 0x20C($v1)
    /* 6E0 8013A2D8 03007714 */  bne        $v1, $s7, .L8013A2E8
    /* 6E4 8013A2DC 04004424 */   addiu     $a0, $v0, 0x4
    /* 6E8 8013A2E0 BBE80408 */  j          .L8013A2EC
    /* 6EC 8013A2E4 03004526 */   addiu     $a1, $s2, 0x3
  .L8013A2E8:
    /* 6F0 8013A2E8 21284002 */  addu       $a1, $s2, $zero
  .L8013A2EC:
    /* 6F4 8013A2EC 6EF2040C */  jal        DrawFeTwinkle__Fii
    /* 6F8 8013A2F0 00000000 */   nop
  .L8013A2F4:
    /* 6FC 8013A2F4 1800D626 */  addiu      $s6, $s6, 0x18
    /* 700 8013A2F8 18001026 */  addiu      $s0, $s0, 0x18
    /* 704 8013A2FC DAE70408 */  j          .L80139F68
    /* 708 8013A300 0100B526 */   addiu     $s5, $s5, 0x1
  .L8013A304:
    /* 70C 8013A304 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* 710 8013A308 0D80023C */  lui        $v0, %hi(FeMainMenu)
    /* 714 8013A30C 9CD64224 */  addiu      $v0, $v0, %lo(FeMainMenu)
    /* 718 8013A310 1E006210 */  beq        $v1, $v0, .L8013A38C
    /* 71C 8013A314 E5040424 */   addiu     $a0, $zero, 0x4E5
    /* 720 8013A318 0D80023C */  lui        $v0, %hi(FeNewP1NameMenu)
    /* 724 8013A31C F0D64224 */  addiu      $v0, $v0, %lo(FeNewP1NameMenu)
    /* 728 8013A320 05006210 */  beq        $v1, $v0, .L8013A338
    /* 72C 8013A324 00000000 */   nop
    /* 730 8013A328 0D80023C */  lui        $v0, %hi(FeNewP2NameMenu)
    /* 734 8013A32C 28D74224 */  addiu      $v0, $v0, %lo(FeNewP2NameMenu)
    /* 738 8013A330 15006214 */  bne        $v1, $v0, .L8013A388
    /* 73C 8013A334 00000000 */   nop
  .L8013A338:
    /* 740 8013A338 4AED010C */  jal        GetStr__Fi
    /* 744 8013A33C B2020424 */   addiu     $a0, $zero, 0x2B2
    /* 748 8013A340 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 74C 8013A344 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 750 8013A348 21280000 */  addu       $a1, $zero, $zero
    /* 754 8013A34C D4000624 */  addiu      $a2, $zero, 0xD4
    /* 758 8013A350 21384000 */  addu       $a3, $v0, $zero
    /* 75C 8013A354 1280033C */  lui        $v1, %hi(WHITER)
    /* 760 8013A358 D1AB6390 */  lbu        $v1, %lo(WHITER)($v1)
    /* 764 8013A35C 1280083C */  lui        $t0, %hi(WHITEG)
    /* 768 8013A360 D2AB0891 */  lbu        $t0, %lo(WHITEG)($t0)
    /* 76C 8013A364 1280093C */  lui        $t1, %hi(WHITEB)
    /* 770 8013A368 D3AB2991 */  lbu        $t1, %lo(WHITEB)($t1)
    /* 774 8013A36C 01000224 */  addiu      $v0, $zero, 0x1
    /* 778 8013A370 1000A2AF */  sw         $v0, 0x10($sp)
    /* 77C 8013A374 1400A0AF */  sw         $zero, 0x14($sp)
    /* 780 8013A378 1800A3AF */  sw         $v1, 0x18($sp)
    /* 784 8013A37C 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 788 8013A380 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 78C 8013A384 2000A9AF */   sw        $t1, 0x20($sp)
  .L8013A388:
    /* 790 8013A388 E6040424 */  addiu      $a0, $zero, 0x4E6
  .L8013A38C:
    /* 794 8013A38C 349A020C */  jal        PrintSelectBack__FUs
    /* 798 8013A390 00000000 */   nop
    /* 79C 8013A394 FC0B828F */  lw         $v0, %gp_rel(FeBufferCount)($gp)
    /* 7A0 8013A398 000C838F */  lw         $v1, %gp_rel(FeMaxBufferCount)($gp)
    /* 7A4 8013A39C 00000000 */  nop
    /* 7A8 8013A3A0 31004310 */  beq        $v0, $v1, .L8013A468
    /* 7AC 8013A3A4 2800A427 */   addiu     $a0, $sp, 0x28
    /* 7B0 8013A3A8 21904000 */  addu       $s2, $v0, $zero
    /* 7B4 8013A3AC 2A104302 */  slt        $v0, $s2, $v1
    /* 7B8 8013A3B0 2D004010 */  beqz       $v0, .L8013A468
    /* 7BC 8013A3B4 40101200 */   sll       $v0, $s2, 1
    /* 7C0 8013A3B8 21105200 */  addu       $v0, $v0, $s2
    /* 7C4 8013A3BC C0800200 */  sll        $s0, $v0, 3
    /* 7C8 8013A3C0 1280033C */  lui        $v1, %hi(WHITER)
    /* 7CC 8013A3C4 D1AB6390 */  lbu        $v1, %lo(WHITER)($v1)
    /* 7D0 8013A3C8 1280023C */  lui        $v0, %hi(WHITEG)
    /* 7D4 8013A3CC D2AB4290 */  lbu        $v0, %lo(WHITEG)($v0)
    /* 7D8 8013A3D0 42B80300 */  srl        $s7, $v1, 1
    /* 7DC 8013A3D4 1280033C */  lui        $v1, %hi(WHITEB)
    /* 7E0 8013A3D8 D3AB6390 */  lbu        $v1, %lo(WHITEB)($v1)
    /* 7E4 8013A3DC 42B00200 */  srl        $s6, $v0, 1
    /* 7E8 8013A3E0 42A80300 */  srl        $s5, $v1, 1
  .L8013A3E4:
    /* 7EC 8013A3E4 0D80013C */  lui        $at, %hi(FeBuffer)
    /* 7F0 8013A3E8 21083000 */  addu       $at, $at, $s0
    /* 7F4 8013A3EC 78DB318C */  lw         $s1, %lo(FeBuffer)($at)
    /* 7F8 8013A3F0 0D80013C */  lui        $at, %hi(FeBuffer + 0x4)
    /* 7FC 8013A3F4 21083000 */  addu       $at, $at, $s0
    /* 800 8013A3F8 7CDB338C */  lw         $s3, %lo(FeBuffer + 0x4)($at)
    /* 804 8013A3FC 0D80013C */  lui        $at, %hi(FeBuffer + 0xC)
    /* 808 8013A400 21083000 */  addu       $at, $at, $s0
    /* 80C 8013A404 84DB248C */  lw         $a0, %lo(FeBuffer + 0xC)($at)
    /* 810 8013A408 0D80013C */  lui        $at, %hi(FeBuffer + 0x8)
    /* 814 8013A40C 21083000 */  addu       $at, $at, $s0
    /* 818 8013A410 80DB348C */  lw         $s4, %lo(FeBuffer + 0x8)($at)
    /* 81C 8013A414 4AED010C */  jal        GetStr__Fi
    /* 820 8013A418 01005226 */   addiu     $s2, $s2, 0x1
    /* 824 8013A41C 21282002 */  addu       $a1, $s1, $zero
    /* 828 8013A420 08006626 */  addiu      $a2, $s3, 0x8
    /* 82C 8013A424 21384000 */  addu       $a3, $v0, $zero
    /* 830 8013A428 0D80013C */  lui        $at, %hi(FeBuffer + 0x10)
    /* 834 8013A42C 21083000 */  addu       $at, $at, $s0
    /* 838 8013A430 88DB248C */  lw         $a0, %lo(FeBuffer + 0x10)($at)
    /* 83C 8013A434 3800A227 */  addiu      $v0, $sp, 0x38
    /* 840 8013A438 1000B4AF */  sw         $s4, 0x10($sp)
    /* 844 8013A43C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 848 8013A440 1800B7AF */  sw         $s7, 0x18($sp)
    /* 84C 8013A444 1C00B6AF */  sw         $s6, 0x1C($sp)
    /* 850 8013A448 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 854 8013A44C 2000B5AF */   sw        $s5, 0x20($sp)
    /* 858 8013A450 000C828F */  lw         $v0, %gp_rel(FeMaxBufferCount)($gp)
    /* 85C 8013A454 00000000 */  nop
    /* 860 8013A458 2A104202 */  slt        $v0, $s2, $v0
    /* 864 8013A45C E1FF4014 */  bnez       $v0, .L8013A3E4
    /* 868 8013A460 18001026 */   addiu     $s0, $s0, 0x18
  .L8013A464:
    /* 86C 8013A464 2800A427 */  addiu      $a0, $sp, 0x28
  .L8013A468:
    /* 870 8013A468 A5F2040C */  jal        ___6Dialog_8013ca94
    /* 874 8013A46C 02000524 */   addiu     $a1, $zero, 0x2
    /* 878 8013A470 8C00BF8F */  lw         $ra, 0x8C($sp)
    /* 87C 8013A474 8800BE8F */  lw         $fp, 0x88($sp)
    /* 880 8013A478 8400B78F */  lw         $s7, 0x84($sp)
    /* 884 8013A47C 8000B68F */  lw         $s6, 0x80($sp)
    /* 888 8013A480 7C00B58F */  lw         $s5, 0x7C($sp)
    /* 88C 8013A484 7800B48F */  lw         $s4, 0x78($sp)
    /* 890 8013A488 7400B38F */  lw         $s3, 0x74($sp)
    /* 894 8013A48C 7000B28F */  lw         $s2, 0x70($sp)
    /* 898 8013A490 6C00B18F */  lw         $s1, 0x6C($sp)
    /* 89C 8013A494 6800B08F */  lw         $s0, 0x68($sp)
    /* 8A0 8013A498 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 8A4 8013A49C 0800E003 */  jr         $ra
    /* 8A8 8013A4A0 00000000 */   nop
endlabel FeDrawBuffer__Fv
