.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_DoScatter__FP10BIRDSTRUCT, 0xA4

glabel BIRD_DoScatter__FP10BIRDSTRUCT
    /* 9BF3C 800ABF3C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9BF40 800ABF40 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9BF44 800ABF44 21808000 */  addu       $s0, $a0, $zero
    /* 9BF48 800ABF48 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9BF4C 800ABF4C 0F000292 */  lbu        $v0, 0xF($s0)
    /* 9BF50 800ABF50 00000000 */  nop
    /* 9BF54 800ABF54 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9BF58 800ABF58 0F0002A2 */  sb         $v0, 0xF($s0)
    /* 9BF5C 800ABF5C 00160200 */  sll        $v0, $v0, 24
    /* 9BF60 800ABF60 0A00401C */  bgtz       $v0, .L800ABF8C
    /* 9BF64 800ABF64 32000424 */   addiu     $a0, $zero, 0x32
    /* 9BF68 800ABF68 01000224 */  addiu      $v0, $zero, 0x1
    /* 9BF6C 800ABF6C C9F6000C */  jal        ENG_random__Fl
    /* 9BF70 800ABF70 120002A2 */   sb        $v0, 0x12($s0)
    /* 9BF74 800ABF74 0A000424 */  addiu      $a0, $zero, 0xA
    /* 9BF78 800ABF78 32004224 */  addiu      $v0, $v0, 0x32
    /* 9BF7C 800ABF7C C9F6000C */  jal        ENG_random__Fl
    /* 9BF80 800ABF80 0F0002A2 */   sb        $v0, 0xF($s0)
    /* 9BF84 800ABF84 05004224 */  addiu      $v0, $v0, 0x5
    /* 9BF88 800ABF88 100002A2 */  sb         $v0, 0x10($s0)
  .L800ABF8C:
    /* 9BF8C 800ABF8C 13000282 */  lb         $v0, 0x13($s0)
    /* 9BF90 800ABF90 00000000 */  nop
    /* 9BF94 800ABF94 32004228 */  slti       $v0, $v0, 0x32
    /* 9BF98 800ABF98 0A004010 */  beqz       $v0, .L800ABFC4
    /* 9BF9C 800ABF9C 21200002 */   addu      $a0, $s0, $zero
    /* 9BFA0 800ABFA0 C9F6000C */  jal        ENG_random__Fl
    /* 9BFA4 800ABFA4 02000424 */   addiu     $a0, $zero, 0x2
    /* 9BFA8 800ABFA8 13000392 */  lbu        $v1, 0x13($s0)
    /* 9BFAC 800ABFAC 11000492 */  lbu        $a0, 0x11($s0)
    /* 9BFB0 800ABFB0 21186200 */  addu       $v1, $v1, $v0
    /* 9BFB4 800ABFB4 08008424 */  addiu      $a0, $a0, 0x8
    /* 9BFB8 800ABFB8 130003A2 */  sb         $v1, 0x13($s0)
    /* 9BFBC 800ABFBC 110004A2 */  sb         $a0, 0x11($s0)
    /* 9BFC0 800ABFC0 21200002 */  addu       $a0, $s0, $zero
  .L800ABFC4:
    /* 9BFC4 800ABFC4 CFAD020C */  jal        AlterBirdPos__FP10BIRDSTRUCTUc
    /* 9BFC8 800ABFC8 01000524 */   addiu     $a1, $zero, 0x1
    /* 9BFCC 800ABFCC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9BFD0 800ABFD0 1000B08F */  lw         $s0, 0x10($sp)
    /* 9BFD4 800ABFD4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9BFD8 800ABFD8 0800E003 */  jr         $ra
    /* 9BFDC 800ABFDC 00000000 */   nop
endlabel BIRD_DoScatter__FP10BIRDSTRUCT
