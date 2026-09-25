.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDecompBuffers__7TextDat, 0x24

glabel GetDecompBuffers__7TextDat
    /* 9DF5C 800ADF5C 2800828C */  lw         $v0, 0x28($a0)
    /* 9DF60 800ADF60 00000000 */  nop
    /* 9DF64 800ADF64 0000438C */  lw         $v1, 0x0($v0)
    /* 9DF68 800ADF68 00000000 */  nop
    /* 9DF6C 800ADF6C 02006014 */  bnez       $v1, .L800ADF78
    /* 9DF70 800ADF70 21104300 */   addu      $v0, $v0, $v1
    /* 9DF74 800ADF74 21100000 */  addu       $v0, $zero, $zero
  .L800ADF78:
    /* 9DF78 800ADF78 0800E003 */  jr         $ra
    /* 9DF7C 800ADF7C 00000000 */   nop
endlabel GetDecompBuffers__7TextDat
