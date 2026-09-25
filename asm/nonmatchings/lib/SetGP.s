.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching SetGP, 0x8

glabel SetGP
    /* DE4 80010DE4 0800E003 */  jr         $ra
    /* DE8 80010DE8 20E08000 */   add       $gp, $a0, $zero /* handwritten instruction */
endlabel SetGP
