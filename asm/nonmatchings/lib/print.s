.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching print, 0x28

glabel print
    /* 15D7C 80025D7C 1280083C */  lui        $t0, %hi(debugprint)
    /* 15D80 80025D80 D0C3088D */  lw         $t0, %lo(debugprint)($t0)
    /* 15D84 80025D84 00000000 */  nop
    /* 15D88 80025D88 02000129 */  slti       $at, $t0, 0x2
    /* 15D8C 80025D8C 03002014 */  bnez       $at, .L80025D9C
    /* 15D90 80025D90 00000000 */   nop
    /* 15D94 80025D94 93670008 */  j          printf
    /* 15D98 80025D98 00000000 */   nop
  .L80025D9C:
    /* 15D9C 80025D9C 0800E003 */  jr         $ra
    /* 15DA0 80025DA0 00000000 */   nop
endlabel print
