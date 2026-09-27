.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init__t10Collection2Z8PalEntryi20, 0x64

glabel Init__t10Collection2Z8PalEntryi20
    /* 8B118 8009B118 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8B11C 8009B11C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8B120 8009B120 21808000 */  addu       $s0, $a0, $zero
    /* 8B124 8009B124 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8B128 8009B128 21900000 */  addu       $s2, $zero, $zero
    /* 8B12C 8009B12C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8B130 8009B130 04001124 */  addiu      $s1, $zero, 0x4
    /* 8B134 8009B134 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 8B138 8009B138 E40100AE */  sw         $zero, 0x1E4($s0)
    /* 8B13C 8009B13C E80100AE */  sw         $zero, 0x1E8($s0)
    /* 8B140 8009B140 000000AE */  sw         $zero, 0x0($s0)
  .L8009B144:
    /* 8B144 8009B144 21201102 */  addu       $a0, $s0, $s1
    /* 8B148 8009B148 B36C020C */  jal        AddToList__t11TLinkedList1Z8PalEntryPP8PalEntry
    /* 8B14C 8009B14C E8010526 */   addiu     $a1, $s0, 0x1E8
    /* 8B150 8009B150 01005226 */  addiu      $s2, $s2, 0x1
    /* 8B154 8009B154 1400422A */  slti       $v0, $s2, 0x14
    /* 8B158 8009B158 FAFF4014 */  bnez       $v0, .L8009B144
    /* 8B15C 8009B15C 18003126 */   addiu     $s1, $s1, 0x18
    /* 8B160 8009B160 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 8B164 8009B164 1800B28F */  lw         $s2, 0x18($sp)
    /* 8B168 8009B168 1400B18F */  lw         $s1, 0x14($sp)
    /* 8B16C 8009B16C 1000B08F */  lw         $s0, 0x10($sp)
    /* 8B170 8009B170 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8B174 8009B174 0800E003 */  jr         $ra
    /* 8B178 8009B178 00000000 */   nop
endlabel Init__t10Collection2Z8PalEntryi20
