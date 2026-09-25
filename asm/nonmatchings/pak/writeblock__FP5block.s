.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching writeblock__FP5block, 0xE8

glabel writeblock__FP5block
    /* 9DF9C 800ADF9C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9DFA0 800ADFA0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9DFA4 800ADFA4 21808000 */  addu       $s0, $a0, $zero
    /* 9DFA8 800ADFA8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 9DFAC 800ADFAC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9DFB0 800ADFB0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9DFB4 800ADFB4 00020292 */  lbu        $v0, 0x200($s0)
    /* 9DFB8 800ADFB8 00000000 */  nop
    /* 9DFBC 800ADFBC 14004010 */  beqz       $v0, .L800AE010
    /* 9DFC0 800ADFC0 00000000 */   nop
    /* 9DFC4 800ADFC4 0402028E */  lw         $v0, 0x204($s0)
    /* 9DFC8 800ADFC8 00000000 */  nop
    /* 9DFCC 800ADFCC 08004014 */  bnez       $v0, .L800ADFF0
    /* 9DFD0 800ADFD0 00000000 */   nop
    /* 9DFD4 800ADFD4 D9B8020C */  jal        fputc__5blockUc
    /* 9DFD8 800ADFD8 80000524 */   addiu     $a1, $zero, 0x80
    /* 9DFDC 800ADFDC 21200002 */  addu       $a0, $s0, $zero
    /* 9DFE0 800ADFE0 D9B8020C */  jal        fputc__5blockUc
    /* 9DFE4 800ADFE4 21280000 */   addu      $a1, $zero, $zero
    /* 9DFE8 800ADFE8 17B80208 */  j          .L800AE05C
    /* 9DFEC 800ADFEC FFFF0224 */   addiu     $v0, $zero, -0x1
  .L800ADFF0:
    /* 9DFF0 800ADFF0 08020592 */  lbu        $a1, 0x208($s0)
    /* 9DFF4 800ADFF4 D9B8020C */  jal        fputc__5blockUc
    /* 9DFF8 800ADFF8 21200002 */   addu      $a0, $s0, $zero
    /* 9DFFC 800ADFFC 04020592 */  lbu        $a1, 0x204($s0)
    /* 9E000 800AE000 D9B8020C */  jal        fputc__5blockUc
    /* 9E004 800AE004 21200002 */   addu      $a0, $s0, $zero
    /* 9E008 800AE008 17B80208 */  j          .L800AE05C
    /* 9E00C 800AE00C FFFF0224 */   addiu     $v0, $zero, -0x1
  .L800AE010:
    /* 9E010 800AE010 0402058E */  lw         $a1, 0x204($s0)
    /* 9E014 800AE014 21200002 */  addu       $a0, $s0, $zero
    /* 9E018 800AE018 D9B8020C */  jal        fputc__5blockUc
    /* 9E01C 800AE01C 7F00A530 */   andi      $a1, $a1, 0x7F
    /* 9E020 800AE020 0402028E */  lw         $v0, 0x204($s0)
    /* 9E024 800AE024 00000000 */  nop
    /* 9E028 800AE028 0B004004 */  bltz       $v0, .L800AE058
    /* 9E02C 800AE02C 21900000 */   addu      $s2, $zero, $zero
    /* 9E030 800AE030 21880002 */  addu       $s1, $s0, $zero
    /* 9E034 800AE034 21200002 */  addu       $a0, $s0, $zero
  .L800AE038:
    /* 9E038 800AE038 00002592 */  lbu        $a1, 0x0($s1)
    /* 9E03C 800AE03C D9B8020C */  jal        fputc__5blockUc
    /* 9E040 800AE040 04003126 */   addiu     $s1, $s1, 0x4
    /* 9E044 800AE044 0402028E */  lw         $v0, 0x204($s0)
    /* 9E048 800AE048 01005226 */  addiu      $s2, $s2, 0x1
    /* 9E04C 800AE04C 2A105200 */  slt        $v0, $v0, $s2
    /* 9E050 800AE050 F9FF4010 */  beqz       $v0, .L800AE038
    /* 9E054 800AE054 21200002 */   addu      $a0, $s0, $zero
  .L800AE058:
    /* 9E058 800AE058 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L800AE05C:
    /* 9E05C 800AE05C 000200A2 */  sb         $zero, 0x200($s0)
    /* 9E060 800AE060 080200AE */  sw         $zero, 0x208($s0)
    /* 9E064 800AE064 040202AE */  sw         $v0, 0x204($s0)
    /* 9E068 800AE068 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 9E06C 800AE06C 1800B28F */  lw         $s2, 0x18($sp)
    /* 9E070 800AE070 1400B18F */  lw         $s1, 0x14($sp)
    /* 9E074 800AE074 1000B08F */  lw         $s0, 0x10($sp)
    /* 9E078 800AE078 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9E07C 800AE07C 0800E003 */  jr         $ra
    /* 9E080 800AE080 00000000 */   nop
endlabel writeblock__FP5block
