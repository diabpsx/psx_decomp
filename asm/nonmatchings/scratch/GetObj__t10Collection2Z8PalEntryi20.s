.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetObj__t10Collection2Z8PalEntryi20, 0x3C

glabel GetObj__t10Collection2Z8PalEntryi20
    /* 8B0DC 8009B0DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8B0E0 8009B0E0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8B0E4 8009B0E4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8B0E8 8009B0E8 E801908C */  lw         $s0, 0x1E8($a0)
    /* 8B0EC 8009B0EC 00000000 */  nop
    /* 8B0F0 8009B0F0 04000012 */  beqz       $s0, .L8009B104
    /* 8B0F4 8009B0F4 21100002 */   addu      $v0, $s0, $zero
    /* 8B0F8 8009B0F8 756C020C */  jal        MoveFromUnusedToUsed__t10Collection2Z8PalEntryi20P8PalEntry
    /* 8B0FC 8009B0FC 21280002 */   addu      $a1, $s0, $zero
    /* 8B100 8009B100 21100002 */  addu       $v0, $s0, $zero
  .L8009B104:
    /* 8B104 8009B104 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8B108 8009B108 1000B08F */  lw         $s0, 0x10($sp)
    /* 8B10C 8009B10C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8B110 8009B110 0800E003 */  jr         $ra
    /* 8B114 8009B114 00000000 */   nop
endlabel GetObj__t10Collection2Z8PalEntryi20
