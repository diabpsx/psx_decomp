.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _copy_memcard_patch, 0x34

glabel _copy_memcard_patch
    /* AAF8 8001AAF8 80DF0234 */  ori        $v0, $zero, 0xDF80
    /* AAFC 8001AAFC 02800A3C */  lui        $t2, %hi(StopCARD2 + 0x10)
    /* AB00 8001AB00 5CA94A25 */  addiu      $t2, $t2, %lo(StopCARD2 + 0x10)
    /* AB04 8001AB04 0280093C */  lui        $t1, %hi(D_8001A9CC)
    /* AB08 8001AB08 CCA92925 */  addiu      $t1, $t1, %lo(D_8001A9CC)
  .L8001AB0C:
    /* AB0C 8001AB0C 0000438D */  lw         $v1, 0x0($t2)
    /* AB10 8001AB10 00000000 */  nop
    /* AB14 8001AB14 000043AC */  sw         $v1, 0x0($v0)
    /* AB18 8001AB18 04004A25 */  addiu      $t2, $t2, 0x4
    /* AB1C 8001AB1C FBFF4915 */  bne        $t2, $t1, .L8001AB0C
    /* AB20 8001AB20 04004224 */   addiu     $v0, $v0, 0x4
    /* AB24 8001AB24 0800E003 */  jr         $ra
    /* AB28 8001AB28 00000000 */   nop
endlabel _copy_memcard_patch
