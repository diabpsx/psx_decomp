.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MoveFromUsedToUnused__t10Collection2Z8PalEntryi20P8PalEntry, 0x58

glabel MoveFromUsedToUnused__t10Collection2Z8PalEntryi20P8PalEntry
    /* 8B17C 8009B17C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8B180 8009B180 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8B184 8009B184 21808000 */  addu       $s0, $a0, $zero
    /* 8B188 8009B188 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8B18C 8009B18C 2188A000 */  addu       $s1, $a1, $zero
    /* 8B190 8009B190 21202002 */  addu       $a0, $s1, $zero
    /* 8B194 8009B194 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8B198 8009B198 BB6C020C */  jal        DetachFromList__t11TLinkedList1Z8PalEntryPP8PalEntry
    /* 8B19C 8009B19C E4010526 */   addiu     $a1, $s0, 0x1E4
    /* 8B1A0 8009B1A0 21202002 */  addu       $a0, $s1, $zero
    /* 8B1A4 8009B1A4 B36C020C */  jal        AddToList__t11TLinkedList1Z8PalEntryPP8PalEntry
    /* 8B1A8 8009B1A8 E8010526 */   addiu     $a1, $s0, 0x1E8
    /* 8B1AC 8009B1AC 0000028E */  lw         $v0, 0x0($s0)
    /* 8B1B0 8009B1B0 00000000 */  nop
    /* 8B1B4 8009B1B4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 8B1B8 8009B1B8 000002AE */  sw         $v0, 0x0($s0)
    /* 8B1BC 8009B1BC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8B1C0 8009B1C0 1400B18F */  lw         $s1, 0x14($sp)
    /* 8B1C4 8009B1C4 1000B08F */  lw         $s0, 0x10($sp)
    /* 8B1C8 8009B1C8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8B1CC 8009B1CC 0800E003 */  jr         $ra
    /* 8B1D0 8009B1D0 00000000 */   nop
endlabel MoveFromUsedToUnused__t10Collection2Z8PalEntryi20P8PalEntry
