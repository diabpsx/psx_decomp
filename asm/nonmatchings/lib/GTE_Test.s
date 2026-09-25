.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching GTE_Test, 0x70

glabel GTE_Test
    /* 23C 8001023C 0180043C */  lui        $a0, %hi(RGB)
    /* 240 80010240 28028424 */  addiu      $a0, $a0, %lo(RGB)
    /* 244 80010244 00000000 */  nop
    /* 248 80010248 0000858C */  lw         $a1, 0x0($a0)
    /* 24C 8001024C 0400868C */  lw         $a2, 0x4($a0)
    /* 250 80010250 0800878C */  lw         $a3, 0x8($a0)
    /* 254 80010254 00308548 */  mtc2       $a1, $6 /* handwritten instruction */
    /* 258 80010258 00000000 */  nop
    /* 25C 8001025C 00000000 */  nop
    /* 260 80010260 00408648 */  mtc2       $a2, $8 /* handwritten instruction */
    /* 264 80010264 00000000 */  nop
    /* 268 80010268 00000000 */  nop
    /* 26C 8001026C 00A8C748 */  ctc2       $a3, $21 /* handwritten instruction */
    /* 270 80010270 00000000 */  nop
    /* 274 80010274 00000000 */  nop
    /* 278 80010278 00B0C748 */  ctc2       $a3, $22 /* handwritten instruction */
    /* 27C 8001027C 00000000 */  nop
    /* 280 80010280 00000000 */  nop
    /* 284 80010284 00B8C748 */  ctc2       $a3, $23 /* handwritten instruction */
    /* 288 80010288 00000000 */  nop
    /* 28C 8001028C 00000000 */  nop
    /* 290 80010290 1000784A */  dpcs
    /* 294 80010294 00A00548 */  mfc2       $a1, $20 /* handwritten instruction */
    /* 298 80010298 00C80648 */  mfc2       $a2, $25 /* handwritten instruction */
    /* 29C 8001029C 0C0085AC */  sw         $a1, 0xC($a0)
    /* 2A0 800102A0 100086AC */  sw         $a2, 0x10($a0)
    /* 2A4 800102A4 0800E003 */  jr         $ra
    /* 2A8 800102A8 00000000 */   nop
endlabel GTE_Test
