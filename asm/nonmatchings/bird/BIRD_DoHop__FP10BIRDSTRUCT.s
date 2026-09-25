.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_DoHop__FP10BIRDSTRUCT, 0x104

glabel BIRD_DoHop__FP10BIRDSTRUCT
    /* 9BD4C 800ABD4C 1D0B8293 */  lbu        $v0, %gp_rel(hop_height)($gp)
    /* 9BD50 800ABD50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9BD54 800ABD54 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9BD58 800ABD58 21808000 */  addu       $s0, $a0, $zero
    /* 9BD5C 800ABD5C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9BD60 800ABD60 00160200 */  sll        $v0, $v0, 24
    /* 9BD64 800ABD64 031E0200 */  sra        $v1, $v0, 24
    /* 9BD68 800ABD68 C2170200 */  srl        $v0, $v0, 31
    /* 9BD6C 800ABD6C 21186200 */  addu       $v1, $v1, $v0
    /* 9BD70 800ABD70 0F000282 */  lb         $v0, 0xF($s0)
    /* 9BD74 800ABD74 43180300 */  sra        $v1, $v1, 1
    /* 9BD78 800ABD78 2A186200 */  slt        $v1, $v1, $v0
    /* 9BD7C 800ABD7C 04006014 */  bnez       $v1, .L800ABD90
    /* 9BD80 800ABD80 00000000 */   nop
    /* 9BD84 800ABD84 13000292 */  lbu        $v0, 0x13($s0)
    /* 9BD88 800ABD88 67AF0208 */  j          .L800ABD9C
    /* 9BD8C 800ABD8C FFFF4224 */   addiu     $v0, $v0, -0x1
  .L800ABD90:
    /* 9BD90 800ABD90 13000292 */  lbu        $v0, 0x13($s0)
    /* 9BD94 800ABD94 00000000 */  nop
    /* 9BD98 800ABD98 01004224 */  addiu      $v0, $v0, 0x1
  .L800ABD9C:
    /* 9BD9C 800ABD9C 130002A2 */  sb         $v0, 0x13($s0)
    /* 9BDA0 800ABDA0 0C000282 */  lb         $v0, 0xC($s0)
    /* 9BDA4 800ABDA4 0C000482 */  lb         $a0, 0xC($s0)
    /* 9BDA8 800ABDA8 06000696 */  lhu        $a2, 0x6($s0)
    /* 9BDAC 800ABDAC 1280013C */  lui        $at, %hi(offset_x)
    /* 9BDB0 800ABDB0 21082200 */  addu       $at, $at, $v0
    /* 9BDB4 800ABDB4 A8C22390 */  lbu        $v1, %lo(offset_x)($at)
    /* 9BDB8 800ABDB8 04000296 */  lhu        $v0, 0x4($s0)
    /* 9BDBC 800ABDBC 001E0300 */  sll        $v1, $v1, 24
    /* 9BDC0 800ABDC0 031E0300 */  sra        $v1, $v1, 24
    /* 9BDC4 800ABDC4 21104300 */  addu       $v0, $v0, $v1
    /* 9BDC8 800ABDC8 040002A6 */  sh         $v0, 0x4($s0)
    /* 9BDCC 800ABDCC 1280013C */  lui        $at, %hi(offset_y)
    /* 9BDD0 800ABDD0 21082400 */  addu       $at, $at, $a0
    /* 9BDD4 800ABDD4 B0C22290 */  lbu        $v0, %lo(offset_y)($at)
    /* 9BDD8 800ABDD8 21200002 */  addu       $a0, $s0, $zero
    /* 9BDDC 800ABDDC 04000586 */  lh         $a1, 0x4($s0)
    /* 9BDE0 800ABDE0 00160200 */  sll        $v0, $v0, 24
    /* 9BDE4 800ABDE4 03160200 */  sra        $v0, $v0, 24
    /* 9BDE8 800ABDE8 2130C200 */  addu       $a2, $a2, $v0
    /* 9BDEC 800ABDEC 060006A6 */  sh         $a2, 0x6($s0)
    /* 9BDF0 800ABDF0 00340600 */  sll        $a2, $a2, 16
    /* 9BDF4 800ABDF4 25AE020C */  jal        BirdWorld__FP10BIRDSTRUCTii
    /* 9BDF8 800ABDF8 03340600 */   sra       $a2, $a2, 16
    /* 9BDFC 800ABDFC 0F000292 */  lbu        $v0, 0xF($s0)
    /* 9BE00 800ABE00 110000A2 */  sb         $zero, 0x11($s0)
    /* 9BE04 800ABE04 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9BE08 800ABE08 0F0002A2 */  sb         $v0, 0xF($s0)
    /* 9BE0C 800ABE0C 00160200 */  sll        $v0, $v0, 24
    /* 9BE10 800ABE10 0A00401C */  bgtz       $v0, .L800ABE3C
    /* 9BE14 800ABE14 00000000 */   nop
    /* 9BE18 800ABE18 10000292 */  lbu        $v0, 0x10($s0)
    /* 9BE1C 800ABE1C 130000A2 */  sb         $zero, 0x13($s0)
    /* 9BE20 800ABE20 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9BE24 800ABE24 100002A2 */  sb         $v0, 0x10($s0)
    /* 9BE28 800ABE28 00160200 */  sll        $v0, $v0, 24
    /* 9BE2C 800ABE2C 03004014 */  bnez       $v0, .L800ABE3C
    /* 9BE30 800ABE30 00000000 */   nop
    /* 9BE34 800ABE34 94AF020C */  jal        BIRD_StartPerch__FP10BIRDSTRUCT
    /* 9BE38 800ABE38 21200002 */   addu      $a0, $s0, $zero
  .L800ABE3C:
    /* 9BE3C 800ABE3C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9BE40 800ABE40 1000B08F */  lw         $s0, 0x10($sp)
    /* 9BE44 800ABE44 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9BE48 800ABE48 0800E003 */  jr         $ra
    /* 9BE4C 800ABE4C 00000000 */   nop
endlabel BIRD_DoHop__FP10BIRDSTRUCT
