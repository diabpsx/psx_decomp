.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GU_AlignVal, 0x24

glabel GU_AlignVal
    /* 10DE0 80020DE0 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 10DE4 80020DE4 21208500 */  addu       $a0, $a0, $a1
    /* 10DE8 80020DE8 1B008500 */  divu       $zero, $a0, $a1
    /* 10DEC 80020DEC 0200A014 */  bnez       $a1, .L80020DF8
    /* 10DF0 80020DF0 00000000 */   nop
    /* 10DF4 80020DF4 0D000700 */  break      7
  .L80020DF8:
    /* 10DF8 80020DF8 10100000 */  mfhi       $v0
    /* 10DFC 80020DFC 0800E003 */  jr         $ra
    /* 10E00 80020E00 23108200 */   subu      $v0, $a0, $v0
endlabel GU_AlignVal
