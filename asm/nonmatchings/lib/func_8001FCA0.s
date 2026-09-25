.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001FCA0, 0x10

glabel func_8001FCA0
    /* FCA0 8001FCA0 01000E24 */  addiu      $t6, $zero, 0x1
    /* FCA4 8001FCA4 1280013C */  lui        $at, %hi(D_8011C934)
    /* FCA8 8001FCA8 0800E003 */  jr         $ra
    /* FCAC 8001FCAC 34C92EAC */   sw        $t6, %lo(D_8011C934)($at)
endlabel func_8001FCA0
