.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddToList__t11TLinkedList1Z8PalEntryPP8PalEntry, 0x20

glabel AddToList__t11TLinkedList1Z8PalEntryPP8PalEntry
    /* 8B2CC 8009B2CC 040080AC */  sw         $zero, 0x4($a0)
    /* 8B2D0 8009B2D0 0000A28C */  lw         $v0, 0x0($a1)
    /* 8B2D4 8009B2D4 00000000 */  nop
    /* 8B2D8 8009B2D8 02004010 */  beqz       $v0, .L8009B2E4
    /* 8B2DC 8009B2DC 000082AC */   sw        $v0, 0x0($a0)
    /* 8B2E0 8009B2E0 040044AC */  sw         $a0, 0x4($v0)
  .L8009B2E4:
    /* 8B2E4 8009B2E4 0800E003 */  jr         $ra
    /* 8B2E8 8009B2E8 0000A4AC */   sw        $a0, 0x0($a1)
endlabel AddToList__t11TLinkedList1Z8PalEntryPP8PalEntry
