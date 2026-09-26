.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching is_sjis__FPUc, 0xC

glabel is_sjis__FPUc
    /* 8D0C 80142904 00008290 */  lbu        $v0, 0x0($a0)
    /* 8D10 80142908 0800E003 */  jr         $ra
    /* 8D14 8014290C C2110200 */   srl       $v0, $v0, 7
endlabel is_sjis__FPUc
