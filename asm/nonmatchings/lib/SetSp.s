.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSp, 0xC

glabel SetSp
    /* 19AC 800119AC 2110A003 */  addu       $v0, $sp, $zero
    /* 19B0 800119B0 0800E003 */  jr         $ra
    /* 19B4 800119B4 21E88000 */   addu      $sp, $a0, $zero
endlabel SetSp
    /* 19B8 800119B8 00000000 */  nop
