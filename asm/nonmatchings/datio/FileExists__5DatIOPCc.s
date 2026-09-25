.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FileExists__5DatIOPCc, 0x40

glabel FileExists__5DatIOPCc
    /* 767D8 800867D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 767DC 800867DC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 767E0 800867E0 2120A000 */  addu       $a0, $a1, $zero
    /* 767E4 800867E4 0E8D000C */  jal        DDXopen
    /* 767E8 800867E8 21280000 */   addu      $a1, $zero, $zero
    /* 767EC 800867EC 21204000 */  addu       $a0, $v0, $zero
    /* 767F0 800867F0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 767F4 800867F4 04008210 */  beq        $a0, $v0, .L80086808
    /* 767F8 800867F8 21100000 */   addu      $v0, $zero, $zero
    /* 767FC 800867FC 358D000C */  jal        DDXclose
    /* 76800 80086800 00000000 */   nop
    /* 76804 80086804 01000224 */  addiu      $v0, $zero, 0x1
  .L80086808:
    /* 76808 80086808 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7680C 8008680C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 76810 80086810 0800E003 */  jr         $ra
    /* 76814 80086814 00000000 */   nop
endlabel FileExists__5DatIOPCc
