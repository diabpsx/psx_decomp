.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching strcat, 0x20

glabel strcat
    /* 3F0 800103F0 2118E003 */  addu       $v1, $ra, $zero
    /* 3F4 800103F4 21408000 */  addu       $t0, $a0, $zero
    /* 3F8 800103F8 22001104 */  bal        strlen2 /* handwritten instruction */
    /* 3FC 800103FC 2148A000 */   addu      $t1, $a1, $zero
    /* 400 80010400 21282001 */  addu       $a1, $t1, $zero
    /* 404 80010404 21204800 */  addu       $a0, $v0, $t0
    /* 408 80010408 F2400008 */  j          strcpy
    /* 40C 8001040C 21F86000 */   addu      $ra, $v1, $zero
endlabel strcat
