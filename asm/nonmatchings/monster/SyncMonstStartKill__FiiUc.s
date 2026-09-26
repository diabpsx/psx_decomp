.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncMonstStartKill__FiiUc, 0x150

glabel SyncMonstStartKill__FiiUc
    /* 122C8 8014BEC0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 122CC 8014BEC4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 122D0 8014BEC8 21888000 */  addu       $s1, $a0, $zero
    /* 122D4 8014BECC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 122D8 8014BED0 21A0A000 */  addu       $s4, $a1, $zero
    /* 122DC 8014BED4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 122E0 8014BED8 2190C000 */  addu       $s2, $a2, $zero
    /* 122E4 8014BEDC 40101100 */  sll        $v0, $s1, 1
    /* 122E8 8014BEE0 21105100 */  addu       $v0, $v0, $s1
    /* 122EC 8014BEE4 80100200 */  sll        $v0, $v0, 2
    /* 122F0 8014BEE8 21105100 */  addu       $v0, $v0, $s1
    /* 122F4 8014BEEC C0100200 */  sll        $v0, $v0, 3
    /* 122F8 8014BEF0 1080033C */  lui        $v1, %hi(monster)
    /* 122FC 8014BEF4 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 12300 8014BEF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12304 8014BEFC 21804300 */  addu       $s0, $v0, $v1
    /* 12308 8014BF00 2400BFAF */  sw         $ra, 0x24($sp)
    /* 1230C 8014BF04 04008006 */  bltz       $s4, .L8014BF18
    /* 12310 8014BF08 1C00B3AF */   sw        $s3, 0x1C($sp)
    /* 12314 8014BF0C 01000224 */  addiu      $v0, $zero, 0x1
    /* 12318 8014BF10 04108202 */  sllv       $v0, $v0, $s4
    /* 1231C 8014BF14 460002A2 */  sb         $v0, 0x46($s0)
  .L8014BF18:
    /* 12320 8014BF18 B7F6000C */  jal        GetRndSeed__Fv
    /* 12324 8014BF1C 100000AE */   sw        $zero, 0x10($s0)
    /* 12328 8014BF20 C9F6000C */  jal        ENG_random__Fl
    /* 1232C 8014BF24 21204000 */   addu      $a0, $v0, $zero
    /* 12330 8014BF28 B3F6000C */  jal        SetRndSeed__Fl
    /* 12334 8014BF2C 21204000 */   addu      $a0, $v0, $zero
    /* 12338 8014BF30 0400222A */  slti       $v0, $s1, 0x4
    /* 1233C 8014BF34 05004014 */  bnez       $v0, .L8014BF4C
    /* 12340 8014BF38 21202002 */   addu      $a0, $s1, $zero
    /* 12344 8014BF3C 34000582 */  lb         $a1, 0x34($s0)
    /* 12348 8014BF40 35000682 */  lb         $a2, 0x35($s0)
    /* 1234C 8014BF44 F211010C */  jal        SpawnItem__FiiiUc
    /* 12350 8014BF48 FF004732 */   andi      $a3, $s2, 0xFF
  .L8014BF4C:
    /* 12354 8014BF4C 38001282 */  lb         $s2, 0x38($s0)
    /* 12358 8014BF50 39001382 */  lb         $s3, 0x39($s0)
    /* 1235C 8014BF54 05008006 */  bltz       $s4, .L8014BF6C
    /* 12360 8014BF58 21202002 */   addu      $a0, $s1, $zero
    /* 12364 8014BF5C EB2A050C */  jal        M_GetDir__Fi
    /* 12368 8014BF60 21202002 */   addu      $a0, $s1, $zero
    /* 1236C 8014BF64 DC2F0508 */  j          .L8014BF70
    /* 12370 8014BF68 21202002 */   addu      $a0, $s1, $zero
  .L8014BF6C:
    /* 12374 8014BF6C 3C000282 */  lb         $v0, 0x3C($s0)
  .L8014BF70:
    /* 12378 8014BF70 00000000 */  nop
    /* 1237C 8014BF74 21304000 */  addu       $a2, $v0, $zero
    /* 12380 8014BF78 6000058E */  lw         $a1, 0x60($s0)
    /* 12384 8014BF7C 04000724 */  addiu      $a3, $zero, 0x4
    /* 12388 8014BF80 3C0006A2 */  sb         $a2, 0x3C($s0)
    /* 1238C 8014BF84 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 12390 8014BF88 0C00A524 */   addiu     $a1, $a1, 0xC
    /* 12394 8014BF8C 06000224 */  addiu      $v0, $zero, 0x6
    /* 12398 8014BF90 330002A2 */  sb         $v0, 0x33($s0)
    /* 1239C 8014BF94 0400222A */  slti       $v0, $s1, 0x4
    /* 123A0 8014BF98 03004014 */  bnez       $v0, .L8014BFA8
    /* 123A4 8014BF9C 21202002 */   addu      $a0, $s1, $zero
    /* 123A8 8014BFA0 3A0000A2 */  sb         $zero, 0x3A($s0)
    /* 123AC 8014BFA4 3B0000A2 */  sb         $zero, 0x3B($s0)
  .L8014BFA8:
    /* 123B0 8014BFA8 180000A6 */  sh         $zero, 0x18($s0)
    /* 123B4 8014BFAC 340012A2 */  sb         $s2, 0x34($s0)
    /* 123B8 8014BFB0 350013A2 */  sb         $s3, 0x35($s0)
    /* 123BC 8014BFB4 360012A2 */  sb         $s2, 0x36($s0)
    /* 123C0 8014BFB8 370013A2 */  sb         $s3, 0x37($s0)
    /* 123C4 8014BFBC 380012A2 */  sb         $s2, 0x38($s0)
    /* 123C8 8014BFC0 D7FC010C */  jal        M_ClearSquares__Fi
    /* 123CC 8014BFC4 390013A2 */   sb        $s3, 0x39($s0)
    /* 123D0 8014BFC8 C0101300 */  sll        $v0, $s3, 3
    /* 123D4 8014BFCC C0181200 */  sll        $v1, $s2, 3
    /* 123D8 8014BFD0 23187200 */  subu       $v1, $v1, $s2
    /* 123DC 8014BFD4 C0190300 */  sll        $v1, $v1, 7
    /* 123E0 8014BFD8 21104300 */  addu       $v0, $v0, $v1
    /* 123E4 8014BFDC 01002326 */  addiu      $v1, $s1, 0x1
    /* 123E8 8014BFE0 0E80013C */  lui        $at, %hi(dung_map)
    /* 123EC 8014BFE4 21082200 */  addu       $at, $at, $v0
    /* 123F0 8014BFE8 287A23A4 */  sh         $v1, %lo(dung_map)($at)
    /* 123F4 8014BFEC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 123F8 8014BFF0 2000B48F */  lw         $s4, 0x20($sp)
    /* 123FC 8014BFF4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 12400 8014BFF8 1800B28F */  lw         $s2, 0x18($sp)
    /* 12404 8014BFFC 1400B18F */  lw         $s1, 0x14($sp)
    /* 12408 8014C000 1000B08F */  lw         $s0, 0x10($sp)
    /* 1240C 8014C004 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 12410 8014C008 0800E003 */  jr         $ra
    /* 12414 8014C00C 00000000 */   nop
endlabel SyncMonstStartKill__FiiUc
