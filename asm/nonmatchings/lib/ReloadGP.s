.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching ReloadGP, 0x14

glabel ReloadGP
    /* DD0 80010DD0 20108003 */  add        $v0, $gp, $zero /* handwritten instruction */
    /* DD4 80010DD4 0B80183C */  lui        $t8, %hi(D_800B2D00)
    /* DD8 80010DD8 002D1827 */  addiu      $t8, $t8, %lo(D_800B2D00)
    /* DDC 80010DDC 0800E003 */  jr         $ra
    /* DE0 80010DE0 00001C8F */   lw        $gp, 0x0($t8)
endlabel ReloadGP
