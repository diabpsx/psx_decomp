.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_80010D14, 0x34

glabel func_80010D14
    /* D14 80010D14 21C04003 */  addu       $t8, $k0, $zero
    /* D18 80010D18 FCFF0821 */  addi       $t0, $t0, -0x4 /* handwritten instruction */
    /* D1C 80010D1C 00001A8D */  lw         $k0, 0x0($t0) /* handwritten instruction */
    /* D20 80010D20 00000000 */  nop
    /* D24 80010D24 2628B800 */  xor        $a1, $a1, $t8
    /* D28 80010D28 42081800 */  srl        $at, $t8, 1
    /* D2C 80010D2C C0371800 */  sll        $a2, $t8, 31
    /* D30 80010D30 2530C100 */  or         $a2, $a2, $at
    /* D34 80010D34 42C01800 */  srl        $t8, $t8, 1
    /* D38 80010D38 0080013C */  lui        $at, (0x80000000 >> 16)
    /* D3C 80010D3C 25C00103 */  or         $t8, $t8, $at
    /* D40 80010D40 0800E003 */  jr         $ra
    /* D44 80010D44 00000000 */   nop
endlabel func_80010D14
