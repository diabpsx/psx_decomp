.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SortAddr, 0x10

glabel SortAddr
    /* 1316C 8002316C 0800838C */  lw         $v1, 0x8($a0)
    /* 13170 80023170 0800A28C */  lw         $v0, 0x8($a1)
    /* 13174 80023174 0800E003 */  jr         $ra
    /* 13178 80023178 2B106200 */   sltu      $v0, $v1, $v0
endlabel SortAddr
