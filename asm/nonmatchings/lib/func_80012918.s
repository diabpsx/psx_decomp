.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_80012918, 0x2C

glabel func_80012918
    /* 2918 80012918 0600A010 */  beqz       $a1, .L80012934
    /* 291C 8001291C FFFFA224 */   addiu     $v0, $a1, -0x1
    /* 2920 80012920 FFFF0324 */  addiu      $v1, $zero, -0x1
  .L80012924:
    /* 2924 80012924 000080AC */  sw         $zero, 0x0($a0)
    /* 2928 80012928 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 292C 8001292C FDFF4314 */  bne        $v0, $v1, .L80012924
    /* 2930 80012930 04008424 */   addiu     $a0, $a0, 0x4
  .L80012934:
    /* 2934 80012934 0800E003 */  jr         $ra
    /* 2938 80012938 00000000 */   nop
    /* 293C 8001293C 50730019 */  blez       $t0, .L8002F680
    /* 2940 80012940 B35B4100 */   tltu      $v0, $at, 366 /* handwritten instruction */
endlabel func_80012918
