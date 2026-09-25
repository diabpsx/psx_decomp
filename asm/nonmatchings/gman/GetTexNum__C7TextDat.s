.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTexNum__C7TextDat, 0xC

glabel GetTexNum__C7TextDat
    /* 852F4 800952F4 0400828C */  lw         $v0, 0x4($a0)
    /* 852F8 800952F8 0800E003 */  jr         $ra
    /* 852FC 800952FC 00000000 */   nop
endlabel GetTexNum__C7TextDat
