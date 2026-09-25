.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching bscale__FP8POLY_FT4i, 0x130

glabel bscale__FP8POLY_FT4i
    /* 9CA14 800ACA14 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9CA18 800ACA18 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9CA1C 800ACA1C 21808000 */  addu       $s0, $a0, $zero
    /* 9CA20 800ACA20 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 9CA24 800ACA24 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9CA28 800ACA28 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9CA2C 800ACA2C 10000286 */  lh         $v0, 0x10($s0)
    /* 9CA30 800ACA30 08000486 */  lh         $a0, 0x8($s0)
    /* 9CA34 800ACA34 2190A000 */  addu       $s2, $a1, $zero
    /* 9CA38 800ACA38 6D41000C */  jal        abs
    /* 9CA3C 800ACA3C 23204400 */   subu      $a0, $v0, $a0
    /* 9CA40 800ACA40 C21F0200 */  srl        $v1, $v0, 31
    /* 9CA44 800ACA44 21186200 */  addu       $v1, $v1, $v0
    /* 9CA48 800ACA48 43180300 */  sra        $v1, $v1, 1
    /* 9CA4C 800ACA4C 12000286 */  lh         $v0, 0x12($s0)
    /* 9CA50 800ACA50 0A000486 */  lh         $a0, 0xA($s0)
    /* 9CA54 800ACA54 008A0300 */  sll        $s1, $v1, 8
    /* 9CA58 800ACA58 6D41000C */  jal        abs
    /* 9CA5C 800ACA5C 23204400 */   subu      $a0, $v0, $a0
    /* 9CA60 800ACA60 C21F0200 */  srl        $v1, $v0, 31
    /* 9CA64 800ACA64 21186200 */  addu       $v1, $v1, $v0
    /* 9CA68 800ACA68 43180300 */  sra        $v1, $v1, 1
    /* 9CA6C 800ACA6C 02004016 */  bnez       $s2, .L800ACA78
    /* 9CA70 800ACA70 00220300 */   sll       $a0, $v1, 8
    /* 9CA74 800ACA74 01001224 */  addiu      $s2, $zero, 0x1
  .L800ACA78:
    /* 9CA78 800ACA78 EB51023C */  lui        $v0, (0x51EB851F >> 16)
    /* 9CA7C 800ACA7C 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
    /* 9CA80 800ACA80 18002202 */  mult       $s1, $v0
    /* 9CA84 800ACA84 10180000 */  mfhi       $v1
    /* 9CA88 800ACA88 00000000 */  nop
    /* 9CA8C 800ACA8C 00000000 */  nop
    /* 9CA90 800ACA90 18008200 */  mult       $a0, $v0
    /* 9CA94 800ACA94 03190300 */  sra        $v1, $v1, 4
    /* 9CA98 800ACA98 10280000 */  mfhi       $a1
    /* 9CA9C 800ACA9C C3171100 */  sra        $v0, $s1, 31
    /* 9CAA0 800ACAA0 23886200 */  subu       $s1, $v1, $v0
    /* 9CAA4 800ACAA4 18003202 */  mult       $s1, $s2
    /* 9CAA8 800ACAA8 C3170400 */  sra        $v0, $a0, 31
    /* 9CAAC 800ACAAC 03190500 */  sra        $v1, $a1, 4
    /* 9CAB0 800ACAB0 23206200 */  subu       $a0, $v1, $v0
    /* 9CAB4 800ACAB4 08000296 */  lhu        $v0, 0x8($s0)
    /* 9CAB8 800ACAB8 10000396 */  lhu        $v1, 0x10($s0)
    /* 9CABC 800ACABC 12880000 */  mflo       $s1
    /* 9CAC0 800ACAC0 038A1100 */  sra        $s1, $s1, 8
    /* 9CAC4 800ACAC4 21105100 */  addu       $v0, $v0, $s1
    /* 9CAC8 800ACAC8 18009200 */  mult       $a0, $s2
    /* 9CACC 800ACACC 080002A6 */  sh         $v0, 0x8($s0)
    /* 9CAD0 800ACAD0 18000296 */  lhu        $v0, 0x18($s0)
    /* 9CAD4 800ACAD4 23187100 */  subu       $v1, $v1, $s1
    /* 9CAD8 800ACAD8 100003A6 */  sh         $v1, 0x10($s0)
    /* 9CADC 800ACADC 20000396 */  lhu        $v1, 0x20($s0)
    /* 9CAE0 800ACAE0 21105100 */  addu       $v0, $v0, $s1
    /* 9CAE4 800ACAE4 180002A6 */  sh         $v0, 0x18($s0)
    /* 9CAE8 800ACAE8 0A000296 */  lhu        $v0, 0xA($s0)
    /* 9CAEC 800ACAEC 23187100 */  subu       $v1, $v1, $s1
    /* 9CAF0 800ACAF0 200003A6 */  sh         $v1, 0x20($s0)
    /* 9CAF4 800ACAF4 12000396 */  lhu        $v1, 0x12($s0)
    /* 9CAF8 800ACAF8 12200000 */  mflo       $a0
    /* 9CAFC 800ACAFC 03220400 */  sra        $a0, $a0, 8
    /* 9CB00 800ACB00 21104400 */  addu       $v0, $v0, $a0
    /* 9CB04 800ACB04 0A0002A6 */  sh         $v0, 0xA($s0)
    /* 9CB08 800ACB08 1A000296 */  lhu        $v0, 0x1A($s0)
    /* 9CB0C 800ACB0C 21186400 */  addu       $v1, $v1, $a0
    /* 9CB10 800ACB10 120003A6 */  sh         $v1, 0x12($s0)
    /* 9CB14 800ACB14 22000396 */  lhu        $v1, 0x22($s0)
    /* 9CB18 800ACB18 23104400 */  subu       $v0, $v0, $a0
    /* 9CB1C 800ACB1C 23186400 */  subu       $v1, $v1, $a0
    /* 9CB20 800ACB20 1A0002A6 */  sh         $v0, 0x1A($s0)
    /* 9CB24 800ACB24 220003A6 */  sh         $v1, 0x22($s0)
    /* 9CB28 800ACB28 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 9CB2C 800ACB2C 1800B28F */  lw         $s2, 0x18($sp)
    /* 9CB30 800ACB30 1400B18F */  lw         $s1, 0x14($sp)
    /* 9CB34 800ACB34 1000B08F */  lw         $s0, 0x10($sp)
    /* 9CB38 800ACB38 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9CB3C 800ACB3C 0800E003 */  jr         $ra
    /* 9CB40 800ACB40 00000000 */   nop
endlabel bscale__FP8POLY_FT4i
