.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DetachFromList__t11TLinkedList1Z8PalEntryPP8PalEntry, 0x4C

glabel DetachFromList__t11TLinkedList1Z8PalEntryPP8PalEntry
    /* 8B2EC 8009B2EC 0400838C */  lw         $v1, 0x4($a0)
    /* 8B2F0 8009B2F0 00000000 */  nop
    /* 8B2F4 8009B2F4 04006010 */  beqz       $v1, .L8009B308
    /* 8B2F8 8009B2F8 00000000 */   nop
    /* 8B2FC 8009B2FC 0000828C */  lw         $v0, 0x0($a0)
    /* 8B300 8009B300 C56C0208 */  j          .L8009B314
    /* 8B304 8009B304 000062AC */   sw        $v0, 0x0($v1)
  .L8009B308:
    /* 8B308 8009B308 0000828C */  lw         $v0, 0x0($a0)
    /* 8B30C 8009B30C 00000000 */  nop
    /* 8B310 8009B310 0000A2AC */  sw         $v0, 0x0($a1)
  .L8009B314:
    /* 8B314 8009B314 0000838C */  lw         $v1, 0x0($a0)
    /* 8B318 8009B318 00000000 */  nop
    /* 8B31C 8009B31C 04006010 */  beqz       $v1, .L8009B330
    /* 8B320 8009B320 00000000 */   nop
    /* 8B324 8009B324 0400828C */  lw         $v0, 0x4($a0)
    /* 8B328 8009B328 00000000 */  nop
    /* 8B32C 8009B32C 040062AC */  sw         $v0, 0x4($v1)
  .L8009B330:
    /* 8B330 8009B330 0800E003 */  jr         $ra
    /* 8B334 8009B334 00000000 */   nop
endlabel DetachFromList__t11TLinkedList1Z8PalEntryPP8PalEntry
