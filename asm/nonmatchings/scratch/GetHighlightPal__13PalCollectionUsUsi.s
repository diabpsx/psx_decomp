.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetHighlightPal__13PalCollectionUsUsi, 0x48

glabel GetHighlightPal__13PalCollectionUsUsi
    /* 8AFF0 8009AFF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8AFF4 8009AFF4 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 8AFF8 8009AFF8 FFFFC630 */  andi       $a2, $a2, 0xFFFF
    /* 8AFFC 8009AFFC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8B000 8009B000 B46B020C */  jal        NewPal__13PalCollectionUsUsi
    /* 8B004 8009B004 1000B0AF */   sw        $s0, 0x10($sp)
    /* 8B008 8009B008 21804000 */  addu       $s0, $v0, $zero
    /* 8B00C 8009B00C 21200002 */  addu       $a0, $s0, $zero
    /* 8B010 8009B010 9B6C020C */  jal        SetJustUsed__8PalEntryb
    /* 8B014 8009B014 01000524 */   addiu     $a1, $zero, 0x1
    /* 8B018 8009B018 9F6C020C */  jal        GetClut__C8PalEntry
    /* 8B01C 8009B01C 21200002 */   addu      $a0, $s0, $zero
    /* 8B020 8009B020 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 8B024 8009B024 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8B028 8009B028 1000B08F */  lw         $s0, 0x10($sp)
    /* 8B02C 8009B02C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8B030 8009B030 0800E003 */  jr         $ra
    /* 8B034 8009B034 00000000 */   nop
endlabel GetHighlightPal__13PalCollectionUsUsi
