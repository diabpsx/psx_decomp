.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SaveGP, 0x10

glabel SaveGP
    /* DC0 80010DC0 0B80183C */  lui        $t8, %hi(D_800B2D00)
    /* DC4 80010DC4 002D1827 */  addiu      $t8, $t8, %lo(D_800B2D00)
    /* DC8 80010DC8 0800E003 */  jr         $ra
    /* DCC 80010DCC 00001CAF */   sw        $gp, 0x0($t8)
endlabel SaveGP
