.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetNext__Ct11TLinkedList1Z8PalEntry, 0xC

glabel GetNext__Ct11TLinkedList1Z8PalEntry
    /* 8B2C0 8009B2C0 0000828C */  lw         $v0, 0x0($a0)
    /* 8B2C4 8009B2C4 0800E003 */  jr         $ra
    /* 8B2C8 8009B2C8 00000000 */   nop
endlabel GetNext__Ct11TLinkedList1Z8PalEntry
