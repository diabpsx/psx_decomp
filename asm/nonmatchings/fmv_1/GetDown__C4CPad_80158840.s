.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_80158840, 0x28

glabel GetDown__C4CPad_80158840
    /* 1EC48 80158840 00008290 */  lbu        $v0, 0x0($a0)
    /* 1EC4C 80158844 00000000 */  nop
    /* 1EC50 80158848 04004014 */  bnez       $v0, .L8015885C
    /* 1EC54 8015884C 00000000 */   nop
    /* 1EC58 80158850 0C008294 */  lhu        $v0, 0xC($a0)
    /* 1EC5C 80158854 18620508 */  j          .L80158860
    /* 1EC60 80158858 00000000 */   nop
  .L8015885C:
    /* 1EC64 8015885C 16008294 */  lhu        $v0, 0x16($a0)
  .L80158860:
    /* 1EC68 80158860 0800E003 */  jr         $ra
    /* 1EC6C 80158864 00000000 */   nop
endlabel GetDown__C4CPad_80158840
