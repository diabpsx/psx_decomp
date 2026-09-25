.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSize__C6CBlock, 0x14

glabel GetSize__C6CBlock
    /* 853E4 800953E4 0000828C */  lw         $v0, 0x0($a0)
    /* 853E8 800953E8 00000000 */  nop
    /* 853EC 800953EC C0100200 */  sll        $v0, $v0, 3
    /* 853F0 800953F0 0800E003 */  jr         $ra
    /* 853F4 800953F4 04004234 */   ori       $v0, $v0, 0x4
endlabel GetSize__C6CBlock
