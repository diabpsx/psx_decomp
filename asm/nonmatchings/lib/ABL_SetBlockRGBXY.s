.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching ABL_SetBlockRGBXY, 0x14

glabel ABL_SetBlockRGBXY
    /* DEC 80010DEC 00608448 */  mtc2       $a0, $12 /* handwritten instruction */
    /* DF0 80010DF0 00808548 */  mtc2       $a1, $16 /* handwritten instruction */
    /* DF4 80010DF4 00688648 */  mtc2       $a2, $13 /* handwritten instruction */
    /* DF8 80010DF8 0800E003 */  jr         $ra
    /* DFC 80010DFC 00708748 */   mtc2      $a3, $14 /* handwritten instruction */
endlabel ABL_SetBlockRGBXY
