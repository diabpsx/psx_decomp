.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_Die, 0x2C

glabel TSK_Die
    /* 1051C 8002051C 1280043C */  lui        $a0, %hi(D_8011C990)
    /* 10520 80020520 90C9848C */  lw         $a0, %lo(D_8011C990)($a0)
    /* 10524 80020524 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10528 80020528 03008010 */  beqz       $a0, .L80020538
    /* 1052C 8002052C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 10530 80020530 5281000C */  jal        TSK_Kill
    /* 10534 80020534 00000000 */   nop
  .L80020538:
    /* 10538 80020538 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1053C 8002053C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10540 80020540 0800E003 */  jr         $ra
    /* 10544 80020544 00000000 */   nop
endlabel TSK_Die
