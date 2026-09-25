.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TempPrintMissile__FiiiiiiiiccUcUcUcc, 0x3E8

glabel TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6BC34 8007BC34 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 6BC38 8007BC38 B800A993 */  lbu        $t1, 0xB8($sp)
    /* 6BC3C 8007BC3C 8000B6AF */  sw         $s6, 0x80($sp)
    /* 6BC40 8007BC40 BC00B693 */  lbu        $s6, 0xBC($sp)
    /* 6BC44 8007BC44 7C00B5AF */  sw         $s5, 0x7C($sp)
    /* 6BC48 8007BC48 AC00B58F */  lw         $s5, 0xAC($sp)
    /* 6BC4C 8007BC4C 7000B2AF */  sw         $s2, 0x70($sp)
    /* 6BC50 8007BC50 B000B28F */  lw         $s2, 0xB0($sp)
    /* 6BC54 8007BC54 7400B3AF */  sw         $s3, 0x74($sp)
    /* 6BC58 8007BC58 B400B38F */  lw         $s3, 0xB4($sp)
    /* 6BC5C 8007BC5C 7800B4AF */  sw         $s4, 0x78($sp)
    /* 6BC60 8007BC60 21A0A000 */  addu       $s4, $a1, $zero
    /* 6BC64 8007BC64 2800A7AF */  sw         $a3, 0x28($sp)
    /* 6BC68 8007BC68 2800A58F */  lw         $a1, 0x28($sp)
    /* 6BC6C 8007BC6C 6C00B1AF */  sw         $s1, 0x6C($sp)
    /* 6BC70 8007BC70 A814918F */  lw         $s1, %gp_rel(MissDat)($gp)
    /* 6BC74 8007BC74 3000A9A3 */  sb         $t1, 0x30($sp)
    /* 6BC78 8007BC78 C000A993 */  lbu        $t1, 0xC0($sp)
    /* 6BC7C 8007BC7C 8400B7AF */  sw         $s7, 0x84($sp)
    /* 6BC80 8007BC80 3800A9A3 */  sb         $t1, 0x38($sp)
    /* 6BC84 8007BC84 C400A993 */  lbu        $t1, 0xC4($sp)
    /* 6BC88 8007BC88 21B88000 */  addu       $s7, $a0, $zero
    /* 6BC8C 8007BC8C 8800BEAF */  sw         $fp, 0x88($sp)
    /* 6BC90 8007BC90 4000A9A3 */  sb         $t1, 0x40($sp)
    /* 6BC94 8007BC94 A000A98F */  lw         $t1, 0xA0($sp)
    /* 6BC98 8007BC98 21F0C000 */  addu       $fp, $a2, $zero
    /* 6BC9C 8007BC9C 8C00BFAF */  sw         $ra, 0x8C($sp)
    /* 6BCA0 8007BCA0 6800B0AF */  sw         $s0, 0x68($sp)
    /* 6BCA4 8007BCA4 1000A9AF */  sw         $t1, 0x10($sp)
    /* 6BCA8 8007BCA8 A800A68F */  lw         $a2, 0xA8($sp)
    /* 6BCAC 8007BCAC A400A78F */  lw         $a3, 0xA4($sp)
    /* 6BCB0 8007BCB0 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6BCB4 8007BCB4 21202002 */   addu      $a0, $s1, $zero
    /* 6BCB8 8007BCB8 21202002 */  addu       $a0, $s1, $zero
    /* 6BCBC 8007BCBC FFFF5030 */  andi       $s0, $v0, 0xFFFF
    /* 6BCC0 8007BCC0 77F5010C */  jal        GetFr__7TextDati_8007d5dc
    /* 6BCC4 8007BCC4 21280002 */   addu      $a1, $s0, $zero
    /* 6BCC8 8007BCC8 C7000006 */  bltz       $s0, .L8007BFE8
    /* 6BCCC 8007BCCC 21100000 */   addu      $v0, $zero, $zero
    /* 6BCD0 8007BCD0 72F5010C */  jal        GetNumOfFrames__7TextDat
    /* 6BCD4 8007BCD4 21202002 */   addu      $a0, $s1, $zero
    /* 6BCD8 8007BCD8 2A100202 */  slt        $v0, $s0, $v0
    /* 6BCDC 8007BCDC C2004010 */  beqz       $v0, .L8007BFE8
    /* 6BCE0 8007BCE0 21100000 */   addu      $v0, $zero, $zero
    /* 6BCE4 8007BCE4 39F5010C */  jal        PRIM_GetPrim__FPP8POLY_FT4_8007d4e4
    /* 6BCE8 8007BCE8 2000A427 */   addiu     $a0, $sp, 0x20
    /* 6BCEC 8007BCEC 21202002 */  addu       $a0, $s1, $zero
    /* 6BCF0 8007BCF0 21300002 */  addu       $a2, $s0, $zero
    /* 6BCF4 8007BCF4 00161200 */  sll        $v0, $s2, 24
    /* 6BCF8 8007BCF8 03160200 */  sra        $v0, $v0, 24
    /* 6BCFC 8007BCFC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6BD00 8007BD00 00161300 */  sll        $v0, $s3, 24
    /* 6BD04 8007BD04 03160200 */  sra        $v0, $v0, 24
    /* 6BD08 8007BD08 1000B4AF */  sw         $s4, 0x10($sp)
    /* 6BD0C 8007BD0C 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6BD10 8007BD10 2000A58F */  lw         $a1, 0x20($sp)
    /* 6BD14 8007BD14 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 6BD18 8007BD18 2138E002 */   addu      $a3, $s7, $zero
    /* 6BD1C 8007BD1C FEFFA226 */  addiu      $v0, $s5, -0x2
    /* 6BD20 8007BD20 1000422C */  sltiu      $v0, $v0, 0x10
    /* 6BD24 8007BD24 0F004010 */  beqz       $v0, .L8007BD64
    /* 6BD28 8007BD28 11000524 */   addiu     $a1, $zero, 0x11
    /* 6BD2C 8007BD2C 2000A38F */  lw         $v1, 0x20($sp)
    /* 6BD30 8007BD30 2328B500 */  subu       $a1, $a1, $s5
    /* 6BD34 8007BD34 08006294 */  lhu        $v0, 0x8($v1)
    /* 6BD38 8007BD38 18006494 */  lhu        $a0, 0x18($v1)
    /* 6BD3C 8007BD3C 21104500 */  addu       $v0, $v0, $a1
    /* 6BD40 8007BD40 080062A4 */  sh         $v0, 0x8($v1)
    /* 6BD44 8007BD44 10006294 */  lhu        $v0, 0x10($v1)
    /* 6BD48 8007BD48 21208500 */  addu       $a0, $a0, $a1
    /* 6BD4C 8007BD4C 180064A4 */  sh         $a0, 0x18($v1)
    /* 6BD50 8007BD50 20006494 */  lhu        $a0, 0x20($v1)
    /* 6BD54 8007BD54 23104500 */  subu       $v0, $v0, $a1
    /* 6BD58 8007BD58 23208500 */  subu       $a0, $a0, $a1
    /* 6BD5C 8007BD5C 100062A4 */  sh         $v0, 0x10($v1)
    /* 6BD60 8007BD60 200064A4 */  sh         $a0, 0x20($v1)
  .L8007BD64:
    /* 6BD64 8007BD64 EDFFA326 */  addiu      $v1, $s5, -0x13
    /* 6BD68 8007BD68 0900622C */  sltiu      $v0, $v1, 0x9
    /* 6BD6C 8007BD6C 09004010 */  beqz       $v0, .L8007BD94
    /* 6BD70 8007BD70 12000224 */   addiu     $v0, $zero, 0x12
    /* 6BD74 8007BD74 40B10300 */  sll        $s6, $v1, 5
    /* 6BD78 8007BD78 2000A38F */  lw         $v1, 0x20($sp)
    /* 6BD7C 8007BD7C 3000B6A3 */  sb         $s6, 0x30($sp)
    /* 6BD80 8007BD80 16006294 */  lhu        $v0, 0x16($v1)
    /* 6BD84 8007BD84 3800B6A3 */  sb         $s6, 0x38($sp)
    /* 6BD88 8007BD88 20004234 */  ori        $v0, $v0, 0x20
    /* 6BD8C 8007BD8C 160062A4 */  sh         $v0, 0x16($v1)
    /* 6BD90 8007BD90 12000224 */  addiu      $v0, $zero, 0x12
  .L8007BD94:
    /* 6BD94 8007BD94 2000A216 */  bne        $s5, $v0, .L8007BE18
    /* 6BD98 8007BD98 01000224 */   addiu     $v0, $zero, 0x1
    /* 6BD9C 8007BD9C 2000A58F */  lw         $a1, 0x20($sp)
    /* 6BDA0 8007BDA0 00000000 */  nop
    /* 6BDA4 8007BDA4 0800A284 */  lh         $v0, 0x8($a1)
    /* 6BDA8 8007BDA8 1000A384 */  lh         $v1, 0x10($a1)
    /* 6BDAC 8007BDAC 2000A484 */  lh         $a0, 0x20($a1)
    /* 6BDB0 8007BDB0 21104300 */  addu       $v0, $v0, $v1
    /* 6BDB4 8007BDB4 C21F0200 */  srl        $v1, $v0, 31
    /* 6BDB8 8007BDB8 21104300 */  addu       $v0, $v0, $v1
    /* 6BDBC 8007BDBC 1800A384 */  lh         $v1, 0x18($a1)
    /* 6BDC0 8007BDC0 43100200 */  sra        $v0, $v0, 1
    /* 6BDC4 8007BDC4 1000A2A4 */  sh         $v0, 0x10($a1)
    /* 6BDC8 8007BDC8 21186400 */  addu       $v1, $v1, $a0
    /* 6BDCC 8007BDCC C2170300 */  srl        $v0, $v1, 31
    /* 6BDD0 8007BDD0 21186200 */  addu       $v1, $v1, $v0
    /* 6BDD4 8007BDD4 0A00A484 */  lh         $a0, 0xA($a1)
    /* 6BDD8 8007BDD8 1A00A284 */  lh         $v0, 0x1A($a1)
    /* 6BDDC 8007BDDC 43180300 */  sra        $v1, $v1, 1
    /* 6BDE0 8007BDE0 2000A3A4 */  sh         $v1, 0x20($a1)
    /* 6BDE4 8007BDE4 2200A384 */  lh         $v1, 0x22($a1)
    /* 6BDE8 8007BDE8 21208200 */  addu       $a0, $a0, $v0
    /* 6BDEC 8007BDEC C2170400 */  srl        $v0, $a0, 31
    /* 6BDF0 8007BDF0 21208200 */  addu       $a0, $a0, $v0
    /* 6BDF4 8007BDF4 1200A284 */  lh         $v0, 0x12($a1)
    /* 6BDF8 8007BDF8 43200400 */  sra        $a0, $a0, 1
    /* 6BDFC 8007BDFC 0A00A4A4 */  sh         $a0, 0xA($a1)
    /* 6BE00 8007BE00 21104300 */  addu       $v0, $v0, $v1
    /* 6BE04 8007BE04 C21F0200 */  srl        $v1, $v0, 31
    /* 6BE08 8007BE08 21104300 */  addu       $v0, $v0, $v1
    /* 6BE0C 8007BE0C 43100200 */  sra        $v0, $v0, 1
    /* 6BE10 8007BE10 1200A2A4 */  sh         $v0, 0x12($a1)
    /* 6BE14 8007BE14 01000224 */  addiu      $v0, $zero, 0x1
  .L8007BE18:
    /* 6BE18 8007BE18 2100A216 */  bne        $s5, $v0, .L8007BEA0
    /* 6BE1C 8007BE1C 0A000224 */   addiu     $v0, $zero, 0xA
    /* 6BE20 8007BE20 2000A58F */  lw         $a1, 0x20($sp)
    /* 6BE24 8007BE24 A000A98F */  lw         $t1, 0xA0($sp)
    /* 6BE28 8007BE28 1A00A484 */  lh         $a0, 0x1A($a1)
    /* 6BE2C 8007BE2C 0A00A784 */  lh         $a3, 0xA($a1)
    /* 6BE30 8007BE30 23104900 */  subu       $v0, $v0, $t1
    /* 6BE34 8007BE34 23208700 */  subu       $a0, $a0, $a3
    /* 6BE38 8007BE38 18008200 */  mult       $a0, $v0
    /* 6BE3C 8007BE3C 2200A384 */  lh         $v1, 0x22($a1)
    /* 6BE40 8007BE40 1200A684 */  lh         $a2, 0x12($a1)
    /* 6BE44 8007BE44 12200000 */  mflo       $a0
    /* 6BE48 8007BE48 23186600 */  subu       $v1, $v1, $a2
    /* 6BE4C 8007BE4C 00000000 */  nop
    /* 6BE50 8007BE50 18006200 */  mult       $v1, $v0
    /* 6BE54 8007BE54 12180000 */  mflo       $v1
    /* 6BE58 8007BE58 6666023C */  lui        $v0, (0x66666667 >> 16)
    /* 6BE5C 8007BE5C 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
    /* 6BE60 8007BE60 18008200 */  mult       $a0, $v0
    /* 6BE64 8007BE64 10500000 */  mfhi       $t2
    /* 6BE68 8007BE68 00000000 */  nop
    /* 6BE6C 8007BE6C 00000000 */  nop
    /* 6BE70 8007BE70 18006200 */  mult       $v1, $v0
    /* 6BE74 8007BE74 C3270400 */  sra        $a0, $a0, 31
    /* 6BE78 8007BE78 83100A00 */  sra        $v0, $t2, 2
    /* 6BE7C 8007BE7C 23104400 */  subu       $v0, $v0, $a0
    /* 6BE80 8007BE80 2138E200 */  addu       $a3, $a3, $v0
    /* 6BE84 8007BE84 C31F0300 */  sra        $v1, $v1, 31
    /* 6BE88 8007BE88 0A00A7A4 */  sh         $a3, 0xA($a1)
    /* 6BE8C 8007BE8C 10400000 */  mfhi       $t0
    /* 6BE90 8007BE90 83100800 */  sra        $v0, $t0, 2
    /* 6BE94 8007BE94 23104300 */  subu       $v0, $v0, $v1
    /* 6BE98 8007BE98 2130C200 */  addu       $a2, $a2, $v0
    /* 6BE9C 8007BE9C 1200A6A4 */  sh         $a2, 0x12($a1)
  .L8007BEA0:
    /* 6BEA0 8007BEA0 1280023C */  lui        $v0, %hi(currlevel)
    /* 6BEA4 8007BEA4 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 6BEA8 8007BEA8 00000000 */  nop
    /* 6BEAC 8007BEAC 1D004010 */  beqz       $v0, .L8007BF24
    /* 6BEB0 8007BEB0 02000224 */   addiu     $v0, $zero, 0x2
    /* 6BEB4 8007BEB4 2800A98F */  lw         $t1, 0x28($sp)
    /* 6BEB8 8007BEB8 00000000 */  nop
    /* 6BEBC 8007BEBC 19002215 */  bne        $t1, $v0, .L8007BF24
    /* 6BEC0 8007BEC0 00000000 */   nop
    /* 6BEC4 8007BEC4 2000A58F */  lw         $a1, 0x20($sp)
    /* 6BEC8 8007BEC8 0200DE27 */  addiu      $fp, $fp, 0x2
    /* 6BECC 8007BECC 1000A484 */  lh         $a0, 0x10($a1)
    /* 6BED0 8007BED0 0800A284 */  lh         $v0, 0x8($a1)
    /* 6BED4 8007BED4 0A00A684 */  lh         $a2, 0xA($a1)
    /* 6BED8 8007BED8 23108200 */  subu       $v0, $a0, $v0
    /* 6BEDC 8007BEDC C21F0200 */  srl        $v1, $v0, 31
    /* 6BEE0 8007BEE0 21104300 */  addu       $v0, $v0, $v1
    /* 6BEE4 8007BEE4 43100200 */  sra        $v0, $v0, 1
    /* 6BEE8 8007BEE8 21208200 */  addu       $a0, $a0, $v0
    /* 6BEEC 8007BEEC 1000A4A4 */  sh         $a0, 0x10($a1)
    /* 6BEF0 8007BEF0 2000A494 */  lhu        $a0, 0x20($a1)
    /* 6BEF4 8007BEF4 1A00A384 */  lh         $v1, 0x1A($a1)
    /* 6BEF8 8007BEF8 21208200 */  addu       $a0, $a0, $v0
    /* 6BEFC 8007BEFC 23186600 */  subu       $v1, $v1, $a2
    /* 6BF00 8007BF00 C2170300 */  srl        $v0, $v1, 31
    /* 6BF04 8007BF04 21186200 */  addu       $v1, $v1, $v0
    /* 6BF08 8007BF08 43180300 */  sra        $v1, $v1, 1
    /* 6BF0C 8007BF0C 1200A294 */  lhu        $v0, 0x12($a1)
    /* 6BF10 8007BF10 2330C300 */  subu       $a2, $a2, $v1
    /* 6BF14 8007BF14 2000A4A4 */  sh         $a0, 0x20($a1)
    /* 6BF18 8007BF18 0A00A6A4 */  sh         $a2, 0xA($a1)
    /* 6BF1C 8007BF1C 23104300 */  subu       $v0, $v0, $v1
    /* 6BF20 8007BF20 1200A2A4 */  sh         $v0, 0x12($a1)
  .L8007BF24:
    /* 6BF24 8007BF24 2000A28F */  lw         $v0, 0x20($sp)
    /* 6BF28 8007BF28 3000A993 */  lbu        $t1, 0x30($sp)
    /* 6BF2C 8007BF2C 00000000 */  nop
    /* 6BF30 8007BF30 040049A0 */  sb         $t1, 0x4($v0)
    /* 6BF34 8007BF34 2000A28F */  lw         $v0, 0x20($sp)
    /* 6BF38 8007BF38 00000000 */  nop
    /* 6BF3C 8007BF3C 050056A0 */  sb         $s6, 0x5($v0)
    /* 6BF40 8007BF40 2000A28F */  lw         $v0, 0x20($sp)
    /* 6BF44 8007BF44 3800A993 */  lbu        $t1, 0x38($sp)
    /* 6BF48 8007BF48 00000000 */  nop
    /* 6BF4C 8007BF4C 060049A0 */  sb         $t1, 0x6($v0)
    /* 6BF50 8007BF50 4000A993 */  lbu        $t1, 0x40($sp)
    /* 6BF54 8007BF54 00000000 */  nop
    /* 6BF58 8007BF58 06002011 */  beqz       $t1, .L8007BF74
    /* 6BF5C 8007BF5C 00000000 */   nop
    /* 6BF60 8007BF60 2000A38F */  lw         $v1, 0x20($sp)
    /* 6BF64 8007BF64 00000000 */  nop
    /* 6BF68 8007BF68 07006290 */  lbu        $v0, 0x7($v1)
    /* 6BF6C 8007BF6C E2EF0108 */  j          .L8007BF88
    /* 6BF70 8007BF70 02004234 */   ori       $v0, $v0, 0x2
  .L8007BF74:
    /* 6BF74 8007BF74 2000A38F */  lw         $v1, 0x20($sp)
    /* 6BF78 8007BF78 00000000 */  nop
    /* 6BF7C 8007BF7C 07006290 */  lbu        $v0, 0x7($v1)
    /* 6BF80 8007BF80 00000000 */  nop
    /* 6BF84 8007BF84 FD004230 */  andi       $v0, $v0, 0xFD
  .L8007BF88:
    /* 6BF88 8007BF88 070062A0 */  sb         $v0, 0x7($v1)
    /* 6BF8C 8007BF8C FF00063C */  lui        $a2, (0xFFFFFF >> 16)
    /* 6BF90 8007BF90 FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
    /* 6BF94 8007BF94 2000A38F */  lw         $v1, 0x20($sp)
    /* 6BF98 8007BF98 80281E00 */  sll        $a1, $fp, 2
    /* 6BF9C 8007BF9C 07006290 */  lbu        $v0, 0x7($v1)
    /* 6BFA0 8007BFA0 00FF073C */  lui        $a3, (0xFF000000 >> 16)
    /* 6BFA4 8007BFA4 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6BFA8 8007BFA8 070062A0 */  sb         $v0, 0x7($v1)
    /* 6BFAC 8007BFAC 1280033C */  lui        $v1, %hi(ThisOt)
    /* 6BFB0 8007BFB0 B4AA638C */  lw         $v1, %lo(ThisOt)($v1)
    /* 6BFB4 8007BFB4 2000A28F */  lw         $v0, 0x20($sp)
    /* 6BFB8 8007BFB8 2128A300 */  addu       $a1, $a1, $v1
    /* 6BFBC 8007BFBC 0000448C */  lw         $a0, 0x0($v0)
    /* 6BFC0 8007BFC0 0000A38C */  lw         $v1, 0x0($a1)
    /* 6BFC4 8007BFC4 24208700 */  and        $a0, $a0, $a3
    /* 6BFC8 8007BFC8 24186600 */  and        $v1, $v1, $a2
    /* 6BFCC 8007BFCC 25208300 */  or         $a0, $a0, $v1
    /* 6BFD0 8007BFD0 000044AC */  sw         $a0, 0x0($v0)
    /* 6BFD4 8007BFD4 0000A38C */  lw         $v1, 0x0($a1)
    /* 6BFD8 8007BFD8 24204600 */  and        $a0, $v0, $a2
    /* 6BFDC 8007BFDC 24186700 */  and        $v1, $v1, $a3
    /* 6BFE0 8007BFE0 25186400 */  or         $v1, $v1, $a0
    /* 6BFE4 8007BFE4 0000A3AC */  sw         $v1, 0x0($a1)
  .L8007BFE8:
    /* 6BFE8 8007BFE8 8C00BF8F */  lw         $ra, 0x8C($sp)
    /* 6BFEC 8007BFEC 8800BE8F */  lw         $fp, 0x88($sp)
    /* 6BFF0 8007BFF0 8400B78F */  lw         $s7, 0x84($sp)
    /* 6BFF4 8007BFF4 8000B68F */  lw         $s6, 0x80($sp)
    /* 6BFF8 8007BFF8 7C00B58F */  lw         $s5, 0x7C($sp)
    /* 6BFFC 8007BFFC 7800B48F */  lw         $s4, 0x78($sp)
    /* 6C000 8007C000 7400B38F */  lw         $s3, 0x74($sp)
    /* 6C004 8007C004 7000B28F */  lw         $s2, 0x70($sp)
    /* 6C008 8007C008 6C00B18F */  lw         $s1, 0x6C($sp)
    /* 6C00C 8007C00C 6800B08F */  lw         $s0, 0x68($sp)
    /* 6C010 8007C010 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 6C014 8007C014 0800E003 */  jr         $ra
    /* 6C018 8007C018 00000000 */   nop
endlabel TempPrintMissile__FiiiiiiiiccUcUcUcc
