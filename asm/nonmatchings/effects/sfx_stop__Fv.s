.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching sfx_stop__Fv, 0x1C

glabel sfx_stop__Fv
    /* 2D160 8003D160 DF030224 */  addiu      $v0, $zero, 0x3DF
    /* 2D164 8003D164 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 2D168 8003D168 FFFF4224 */  addiu      $v0, $v0, -0x1
  .L8003D16C:
    /* 2D16C 8003D16C FFFF4314 */  bne        $v0, $v1, .L8003D16C
    /* 2D170 8003D170 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 2D174 8003D174 0800E003 */  jr         $ra
    /* 2D178 8003D178 01004224 */   addiu     $v0, $v0, 0x1
endlabel sfx_stop__Fv
