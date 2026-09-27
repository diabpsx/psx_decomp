.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching UpdatePals__13PalCollection, 0x74

glabel UpdatePals__13PalCollection
    /* 8B038 8009B038 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8B03C 8009B03C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8B040 8009B040 21908000 */  addu       $s2, $a0, $zero
    /* 8B044 8009B044 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 8B048 8009B048 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8B04C 8009B04C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8B050 8009B050 E401508E */  lw         $s0, 0x1E4($s2)
  .L8009B054:
    /* 8B054 8009B054 00000000 */  nop
    /* 8B058 8009B058 0D000012 */  beqz       $s0, .L8009B090
    /* 8B05C 8009B05C 00000000 */   nop
    /* 8B060 8009B060 B06C020C */  jal        GetNext__Ct11TLinkedList1Z8PalEntry
    /* 8B064 8009B064 21200002 */   addu      $a0, $s0, $zero
    /* 8B068 8009B068 21200002 */  addu       $a0, $s0, $zero
    /* 8B06C 8009B06C 21280000 */  addu       $a1, $zero, $zero
    /* 8B070 8009B070 9B6C020C */  jal        SetJustUsed__8PalEntryb
    /* 8B074 8009B074 21884000 */   addu      $s1, $v0, $zero
    /* 8B078 8009B078 03004014 */  bnez       $v0, .L8009B088
    /* 8B07C 8009B07C 21204002 */   addu      $a0, $s2, $zero
    /* 8B080 8009B080 5F6C020C */  jal        MoveFromUsedToUnused__t10Collection2Z8PalEntryi20P8PalEntry
    /* 8B084 8009B084 21280002 */   addu      $a1, $s0, $zero
  .L8009B088:
    /* 8B088 8009B088 156C0208 */  j          .L8009B054
    /* 8B08C 8009B08C 21802002 */   addu      $s0, $s1, $zero
  .L8009B090:
    /* 8B090 8009B090 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 8B094 8009B094 1800B28F */  lw         $s2, 0x18($sp)
    /* 8B098 8009B098 1400B18F */  lw         $s1, 0x14($sp)
    /* 8B09C 8009B09C 1000B08F */  lw         $s0, 0x10($sp)
    /* 8B0A0 8009B0A0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8B0A4 8009B0A4 0800E003 */  jr         $ra
    /* 8B0A8 8009B0A8 00000000 */   nop
endlabel UpdatePals__13PalCollection
