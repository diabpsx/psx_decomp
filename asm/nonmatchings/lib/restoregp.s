.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching restoregp, 0x8

glabel restoregp
    /* 20018 80030018 0800E003 */  jr         $ra
    /* 2001C 8003001C 25E00400 */   or        $gp, $zero, $a0
endlabel restoregp
