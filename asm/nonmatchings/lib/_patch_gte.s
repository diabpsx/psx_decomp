.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching _patch_gte, 0xDC

glabel _patch_gte
    /* FE1C 8001FE1C 1380013C */  lui        $at, %hi(D_80132590)
    /* FE20 8001FE20 90253FAC */  sw         $ra, %lo(D_80132590)($at)
    /* FE24 8001FE24 6346000C */  jal        EnterCriticalSection
    /* FE28 8001FE28 00000000 */   nop
    /* FE2C 8001FE2C 56000924 */  addiu      $t1, $zero, 0x56
    /* FE30 8001FE30 B0000A24 */  addiu      $t2, $zero, 0xB0
    /* FE34 8001FE34 09F84001 */  jalr       $t2
    /* FE38 8001FE38 00000000 */   nop
    /* FE3C 8001FE3C 1800428C */  lw         $v0, 0x18($v0)
    /* FE40 8001FE40 00000000 */  nop
    /* FE44 8001FE44 28004224 */  addiu      $v0, $v0, 0x28
    /* FE48 8001FE48 21784000 */  addu       $t7, $v0, $zero
    /* FE4C 8001FE4C 02800A3C */  lui        $t2, %hi(D_8001FEC8)
    /* FE50 8001FE50 C8FE4A25 */  addiu      $t2, $t2, %lo(D_8001FEC8)
    /* FE54 8001FE54 0280093C */  lui        $t1, %hi(D_8001FEE0)
    /* FE58 8001FE58 E0FE2925 */  addiu      $t1, $t1, %lo(D_8001FEE0)
  .L8001FE5C:
    /* FE5C 8001FE5C 0000438D */  lw         $v1, 0x0($t2)
    /* FE60 8001FE60 00004B8C */  lw         $t3, 0x0($v0)
    /* FE64 8001FE64 04004A25 */  addiu      $t2, $t2, 0x4
    /* FE68 8001FE68 0E006B14 */  bne        $v1, $t3, .L8001FEA4
    /* FE6C 8001FE6C 04004224 */   addiu     $v0, $v0, 0x4
    /* FE70 8001FE70 FAFF4915 */  bne        $t2, $t1, .L8001FE5C
    /* FE74 8001FE74 00000000 */   nop
    /* FE78 8001FE78 2110E001 */  addu       $v0, $t7, $zero
    /* FE7C 8001FE7C 02800A3C */  lui        $t2, %hi(D_8001FEE0)
    /* FE80 8001FE80 E0FE4A25 */  addiu      $t2, $t2, %lo(D_8001FEE0)
    /* FE84 8001FE84 0280093C */  lui        $t1, %hi(D_8001FEF8)
    /* FE88 8001FE88 F8FE2925 */  addiu      $t1, $t1, %lo(D_8001FEF8)
  .L8001FE8C:
    /* FE8C 8001FE8C 0000438D */  lw         $v1, 0x0($t2)
    /* FE90 8001FE90 00000000 */  nop
    /* FE94 8001FE94 000043AC */  sw         $v1, 0x0($v0)
    /* FE98 8001FE98 04004A25 */  addiu      $t2, $t2, 0x4
    /* FE9C 8001FE9C FBFF4915 */  bne        $t2, $t1, .L8001FE8C
    /* FEA0 8001FEA0 04004224 */   addiu     $v0, $v0, 0x4
  .L8001FEA4:
    /* FEA4 8001FEA4 4F46000C */  jal        FlushCache
    /* FEA8 8001FEA8 00000000 */   nop
    /* FEAC 8001FEAC 6746000C */  jal        ExitCriticalSection
    /* FEB0 8001FEB0 00000000 */   nop
    /* FEB4 8001FEB4 13801F3C */  lui        $ra, %hi(D_80132590)
    /* FEB8 8001FEB8 9025FF8F */  lw         $ra, %lo(D_80132590)($ra)
    /* FEBC 8001FEBC 00000000 */  nop
    /* FEC0 8001FEC0 0800E003 */  jr         $ra
    /* FEC4 8001FEC4 00000000 */   nop
  alabel D_8001FEC8
    /* FEC8 8001FEC8 040041AF */  sw         $at, 0x4($k0) /* handwritten instruction */
    /* FECC 8001FECC 080042AF */  sw         $v0, 0x8($k0) /* handwritten instruction */
    /* FED0 8001FED0 0C0043AF */  sw         $v1, 0xC($k0) /* handwritten instruction */
    /* FED4 8001FED4 7C005FAF */  sw         $ra, 0x7C($k0) /* handwritten instruction */
    /* FED8 8001FED8 00700340 */  mfc0       $v1, $14 /* handwritten instruction */
    /* FEDC 8001FEDC 00000000 */  nop
  alabel D_8001FEE0
    /* FEE0 8001FEE0 040041AF */  sw         $at, 0x4($k0) /* handwritten instruction */
    /* FEE4 8001FEE4 080042AF */  sw         $v0, 0x8($k0) /* handwritten instruction */
    /* FEE8 8001FEE8 00680240 */  mfc0       $v0, $13 /* handwritten instruction */
    /* FEEC 8001FEEC 0C0043AF */  sw         $v1, 0xC($k0) /* handwritten instruction */
    /* FEF0 8001FEF0 00700340 */  mfc0       $v1, $14 /* handwritten instruction */
    /* FEF4 8001FEF4 7C005FAF */  sw         $ra, 0x7C($k0) /* handwritten instruction */
endlabel _patch_gte
  alabel D_8001FEF8
    /* FEF8 8001FEF8 00000000 */  nop
