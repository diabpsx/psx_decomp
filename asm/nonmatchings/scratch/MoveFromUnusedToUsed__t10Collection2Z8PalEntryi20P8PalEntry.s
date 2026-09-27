.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MoveFromUnusedToUsed__t10Collection2Z8PalEntryi20P8PalEntry, 0x58

glabel MoveFromUnusedToUsed__t10Collection2Z8PalEntryi20P8PalEntry
    /* 8B1D4 8009B1D4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8B1D8 8009B1D8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8B1DC 8009B1DC 21808000 */  addu       $s0, $a0, $zero
    /* 8B1E0 8009B1E0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8B1E4 8009B1E4 2188A000 */  addu       $s1, $a1, $zero
    /* 8B1E8 8009B1E8 21202002 */  addu       $a0, $s1, $zero
    /* 8B1EC 8009B1EC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8B1F0 8009B1F0 BB6C020C */  jal        DetachFromList__t11TLinkedList1Z8PalEntryPP8PalEntry
    /* 8B1F4 8009B1F4 E8010526 */   addiu     $a1, $s0, 0x1E8
    /* 8B1F8 8009B1F8 21202002 */  addu       $a0, $s1, $zero
    /* 8B1FC 8009B1FC B36C020C */  jal        AddToList__t11TLinkedList1Z8PalEntryPP8PalEntry
    /* 8B200 8009B200 E4010526 */   addiu     $a1, $s0, 0x1E4
    /* 8B204 8009B204 0000028E */  lw         $v0, 0x0($s0)
    /* 8B208 8009B208 00000000 */  nop
    /* 8B20C 8009B20C 01004224 */  addiu      $v0, $v0, 0x1
    /* 8B210 8009B210 000002AE */  sw         $v0, 0x0($s0)
    /* 8B214 8009B214 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8B218 8009B218 1400B18F */  lw         $s1, 0x14($sp)
    /* 8B21C 8009B21C 1000B08F */  lw         $s0, 0x10($sp)
    /* 8B220 8009B220 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8B224 8009B224 0800E003 */  jr         $ra
    /* 8B228 8009B228 00000000 */   nop
endlabel MoveFromUnusedToUsed__t10Collection2Z8PalEntryi20P8PalEntry
