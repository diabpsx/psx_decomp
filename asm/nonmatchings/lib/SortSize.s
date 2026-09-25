.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SortSize, 0x10

glabel SortSize
    /* 13108 80023108 0C00838C */  lw         $v1, 0xC($a0)
    /* 1310C 8002310C 0C00A28C */  lw         $v0, 0xC($a1)
    /* 13110 80023110 0800E003 */  jr         $ra
    /* 13114 80023114 2B106200 */   sltu      $v0, $v1, $v0
endlabel SortSize
