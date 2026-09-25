.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCur__C4CPad_80085818, 0x28

glabel GetCur__C4CPad_80085818
    /* 75818 80085818 00008290 */  lbu        $v0, 0x0($a0)
    /* 7581C 8008581C 00000000 */  nop
    /* 75820 80085820 04004014 */  bnez       $v0, .L80085834
    /* 75824 80085824 00000000 */   nop
    /* 75828 80085828 08008294 */  lhu        $v0, 0x8($a0)
    /* 7582C 8008582C 0E160208 */  j          .L80085838
    /* 75830 80085830 00000000 */   nop
  .L80085834:
    /* 75834 80085834 12008294 */  lhu        $v0, 0x12($a0)
  .L80085838:
    /* 75838 80085838 0800E003 */  jr         $ra
    /* 7583C 8008583C 00000000 */   nop
endlabel GetCur__C4CPad_80085818
