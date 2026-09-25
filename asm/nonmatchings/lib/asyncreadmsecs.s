.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncreadmsecs, 0x40

glabel asyncreadmsecs
    /* 13740 80023740 1380023C */  lui        $v0, %hi(D_801351CC)
    /* 13744 80023744 CC51428C */  lw         $v0, %lo(D_801351CC)($v0)
    /* 13748 80023748 00000000 */  nop
    /* 1374C 8002374C 1A008200 */  div        $zero, $a0, $v0
    /* 13750 80023750 02004014 */  bnez       $v0, .L8002375C
    /* 13754 80023754 00000000 */   nop
    /* 13758 80023758 0D000700 */  break      7
  .L8002375C:
    /* 1375C 8002375C FFFF0124 */  addiu      $at, $zero, -0x1
    /* 13760 80023760 04004114 */  bne        $v0, $at, .L80023774
    /* 13764 80023764 0080013C */   lui       $at, (0x80000000 >> 16)
    /* 13768 80023768 02008114 */  bne        $a0, $at, .L80023774
    /* 1376C 8002376C 00000000 */   nop
    /* 13770 80023770 0D000600 */  break      6
  .L80023774:
    /* 13774 80023774 12100000 */  mflo       $v0
    /* 13778 80023778 0800E003 */  jr         $ra
    /* 1377C 8002377C 00000000 */   nop
endlabel asyncreadmsecs
