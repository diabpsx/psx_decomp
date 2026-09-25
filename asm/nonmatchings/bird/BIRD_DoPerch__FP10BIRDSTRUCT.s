.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_DoPerch__FP10BIRDSTRUCT, 0x84

glabel BIRD_DoPerch__FP10BIRDSTRUCT
    /* 9BEB8 800ABEB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9BEBC 800ABEBC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9BEC0 800ABEC0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9BEC4 800ABEC4 7EAE020C */  jal        BirdScared__FP10BIRDSTRUCT
    /* 9BEC8 800ABEC8 21808000 */   addu      $s0, $a0, $zero
    /* 9BECC 800ABECC 0D004010 */  beqz       $v0, .L800ABF04
    /* 9BED0 800ABED0 00000000 */   nop
    /* 9BED4 800ABED4 0000048E */  lw         $a0, 0x0($s0)
    /* 9BED8 800ABED8 00000000 */  nop
    /* 9BEDC 800ABEDC 05008010 */  beqz       $a0, .L800ABEF4
    /* 9BEE0 800ABEE0 00000000 */   nop
    /* 9BEE4 800ABEE4 64B0020C */  jal        BIRD_StartFly__FP10BIRDSTRUCT
    /* 9BEE8 800ABEE8 00000000 */   nop
    /* 9BEEC 800ABEEC CAAF0208 */  j          .L800ABF28
    /* 9BEF0 800ABEF0 00000000 */   nop
  .L800ABEF4:
    /* 9BEF4 800ABEF4 64B0020C */  jal        BIRD_StartFly__FP10BIRDSTRUCT
    /* 9BEF8 800ABEF8 21200002 */   addu      $a0, $s0, $zero
    /* 9BEFC 800ABEFC CAAF0208 */  j          .L800ABF28
    /* 9BF00 800ABF00 00000000 */   nop
  .L800ABF04:
    /* 9BF04 800ABF04 0F000292 */  lbu        $v0, 0xF($s0)
    /* 9BF08 800ABF08 00000000 */  nop
    /* 9BF0C 800ABF0C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9BF10 800ABF10 0F0002A2 */  sb         $v0, 0xF($s0)
    /* 9BF14 800ABF14 00160200 */  sll        $v0, $v0, 24
    /* 9BF18 800ABF18 03004014 */  bnez       $v0, .L800ABF28
    /* 9BF1C 800ABF1C 00000000 */   nop
    /* 9BF20 800ABF20 DEAE020C */  jal        BIRD_StartHop__FP10BIRDSTRUCT
    /* 9BF24 800ABF24 21200002 */   addu      $a0, $s0, $zero
  .L800ABF28:
    /* 9BF28 800ABF28 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9BF2C 800ABF2C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9BF30 800ABF30 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9BF34 800ABF34 0800E003 */  jr         $ra
    /* 9BF38 800ABF38 00000000 */   nop
endlabel BIRD_DoPerch__FP10BIRDSTRUCT
